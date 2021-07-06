Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152563BD664
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Jul 2021 14:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238470AbhGFMdW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Jul 2021 08:33:22 -0400
Received: from cpanel.siel.si ([46.19.9.99]:40584 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242833AbhGFMDC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Jul 2021 08:03:02 -0400
X-Greylist: delayed 2355 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Jul 2021 08:03:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=PgF2fVixxstDrvLS9/Pw0uc2vK6s7JooIq/QGvbSzd0=; b=bNwXEy+SnyVncMrjc0sxv3OKdI
        B01+WkzsQxihm2//7yvWUtpNcu4vTk3QBRYL8AA8bcbCvSxR7AR+rEPB09YDZ9X9lMR15ro7TSFV5
        C9G+6uYFR005TMgxkxLBfvKv9oZE5BCny1ZK+TlfIq6gIM5v5ARIf9bzFD2x1Sby7+KdPtbTfoT0O
        o9dYCuqkKEBxhcdXQqfpaxz+Ldoyfup1fec9ESo3xTckODn2h4yny6TV7bFAv2KxWO4vgICTZfLGR
        FBt/be77Y1h+zB+mrRnelutAd0iW2WBzULnDbZ34qXCZaGWrhl+dUtvfF8M9f5xhQ3odERZbAeWiN
        nMEd6g7g==;
Received: from [89.212.21.243] (port=48610 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <primoz.fiser@norik.com>)
        id 1m0j8O-00AUQG-Tz; Tue, 06 Jul 2021 13:21:00 +0200
From:   Primoz Fiser <primoz.fiser@norik.com>
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] watchdog: da9062: da9063: prevent watchdog pings ahead of reboot
Date:   Tue,  6 Jul 2021 13:21:03 +0200
Message-Id: <20210706112103.1687587-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Proper machine resets via da9062/da9063 PMICs are very tricky as they
require special i2c atomic transfers when interrupts are not available
anymore. This is also a reason why both PMIC's restart handlers do not
use regmap but instead opt for i2c_smbus_write_byte_data() which does
i2c transfer in atomic manner. Under the hood, this function tries to
obtain i2c bus lock with call to i2c_adapter_trylock_bus() which will
return -EAGAIN (-11) if lock is not available.

Since commit 982bb70517aef ("watchdog: reset last_hw_keepalive time at
start") occasional restart handler failures with "Failed to shutdown
(err = -11)" error messages were observed, indicating that some
process is holding the i2c bus lock. Investigation into the matter
uncovered that sometimes during reboot sequence watchdog ping is issued
late into reboot phase which didn't happen before mentioned commit
(usually watchdog ping happened immediately as commit message suggests).
As of now, when watchdog ping usually happens late into reboot stage
when interrupts are not available anymore, i2c bus lock cannot be
released anymore and pending restart handler in turn fails.

Thus, to prevent such late watchdog pings from happening ahead of
pending machine restart and consequently locking up the i2c bus, install
a reboot notifier callback in both PMIC's watchdog drivers. When reboot
notifier is called, it will raise the restart_pending flag signaling to
the watchdog ping handler to not send pings anymore.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/watchdog/da9062_wdt.c   | 26 ++++++++++++++++++++++++++
 drivers/watchdog/da9063_wdt.c   | 22 ++++++++++++++++++++++
 include/linux/mfd/da9063/core.h |  3 +++
 3 files changed, 51 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 706fb09c2f24..ebb45d445d87 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -19,6 +19,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 
 static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
 #define DA9062_TWDSCALE_DISABLE		0
@@ -33,6 +34,9 @@ struct da9062_watchdog {
 	struct da9062 *hw;
 	struct watchdog_device wdtdev;
 	bool use_sw_pm;
+
+	struct notifier_block reboot_nb;
+	bool restart_pending;
 };
 
 static unsigned int da9062_wdt_read_timeout(struct da9062_watchdog *wdt)
@@ -117,6 +121,9 @@ static int da9062_wdt_ping(struct watchdog_device *wdd)
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
 	int ret;
 
+	if (wdt->restart_pending)
+		return 0;
+
 	ret = da9062_reset_watchdog_timer(wdt);
 	if (ret)
 		dev_err(wdt->hw->dev, "Failed to ping the watchdog (err = %d)\n",
@@ -143,6 +150,22 @@ static int da9062_wdt_set_timeout(struct watchdog_device *wdd,
 	return ret;
 }
 
+static int da9062_wdt_reboot_notifier(struct notifier_block *nb,
+				  unsigned long code, void *unused)
+{
+	struct da9062_watchdog *wdt =
+			container_of(nb, struct da9062_watchdog, reboot_nb);
+
+	/*
+	 * Use reboot notifer to raise flag and in turn prevent watchdog pings
+	 * from occurring late in system reboot sequence and possibly locking
+	 * out restart handler from accessing i2c bus.
+	 */
+	wdt->restart_pending = true;
+
+	return NOTIFY_DONE;
+}
+
 static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			      void *data)
 {
@@ -229,6 +252,9 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
 	}
 
+	wdt->reboot_nb.notifier_call = da9062_wdt_reboot_notifier;
+	devm_register_reboot_notifier(dev, &wdt->reboot_nb);
+
 	return devm_watchdog_register_device(dev, &wdt->wdtdev);
 }
 
diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 423584252606..bea2ba62dff2 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/da9063/registers.h>
 #include <linux/mfd/da9063/core.h>
 #include <linux/regmap.h>
+#include <linux/reboot.h>
 
 /*
  * Watchdog selector to timeout in seconds.
@@ -121,6 +122,9 @@ static int da9063_wdt_ping(struct watchdog_device *wdd)
 	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
 	int ret;
 
+	if (da9063->restart_pending)
+		return 0;
+
 	ret = regmap_write(da9063->regmap, DA9063_REG_CONTROL_F,
 			   DA9063_WATCHDOG);
 	if (ret)
@@ -158,6 +162,21 @@ static int da9063_wdt_set_timeout(struct watchdog_device *wdd,
 	return ret;
 }
 
+static int da9063_wdt_reboot_notifier(struct notifier_block *nb,
+				  unsigned long code, void *unused)
+{
+	struct da9063 *da9063 = container_of(nb, struct da9063, reboot_nb);
+
+	/*
+	 * Use reboot notifer to raise flag and in turn prevent watchdog pings
+	 * from occurring late in system reboot sequence and possibly locking
+	 * out restart handler from accessing i2c bus.
+	 */
+	da9063->restart_pending = true;
+
+	return NOTIFY_DONE;
+}
+
 static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			      void *data)
 {
@@ -233,6 +252,9 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	}
 
+	da9063->reboot_nb.notifier_call = da9063_wdt_reboot_notifier;
+	devm_register_reboot_notifier(dev, &da9063->reboot_nb);
+
 	return devm_watchdog_register_device(dev, wdd);
 }
 
diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
index fa7a43f02f27..6be39fd9300d 100644
--- a/include/linux/mfd/da9063/core.h
+++ b/include/linux/mfd/da9063/core.h
@@ -85,6 +85,9 @@ struct da9063 {
 	int		chip_irq;
 	unsigned int	irq_base;
 	struct regmap_irq_chip_data *regmap_irq;
+
+	struct notifier_block reboot_nb;
+	bool restart_pending;
 };
 
 int da9063_device_init(struct da9063 *da9063, unsigned int irq);
-- 
2.25.1

