Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A2741B47A
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Sep 2021 18:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241812AbhI1Qzs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Sep 2021 12:55:48 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:51337 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229795AbhI1Qzr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Sep 2021 12:55:47 -0400
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1632848044;
        bh=sYjAoky0bQxhkEySQnm7brXya54BLjlKSt2pb2lodvk=;
        h=From:To:Cc:Subject:Date:From;
        b=CYNoY+PveeZ0ciq7tmDgVSpblu9G/2Hib2xSA8UaU58CYVpvxgjImOKI/aKWki4uL
         vciw6i4sjfxubElNvI/KOLowdnJ776PawvfLuMBy1aEpUvxwWGY6U9NmoAYoZQubim
         YGn6vG6grGAxW0LIWqliATMvBR5Weu6brKrL8IM8=
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: iTCO_wdt: Full reinitialize on resume
Date:   Tue, 28 Sep 2021 18:53:43 +0200
Message-Id: <20210928165343.23401-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The Thinkpad T460s always needs driver-side suspend-resume handling.
If the watchdog is not stopped before suspend then the system will hang
on resume.
If the interval is not set before starting the watchdog then the machine
will instantly be reset after resume.

Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=198019

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/watchdog/iTCO_wdt.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 643c6c2d0b72..2297a0a1e5fc 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -47,6 +47,7 @@
 /* Includes */
 #include <linux/acpi.h>			/* For ACPI support */
 #include <linux/bits.h>			/* For BIT() */
+#include <linux/dmi.h>			/* For DMI matching */
 #include <linux/module.h>		/* For module specific items */
 #include <linux/moduleparam.h>		/* For new moduleparam's */
 #include <linux/types.h>		/* For standard types (like size_t) */
@@ -605,9 +606,20 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
  */
 
 #ifdef CONFIG_ACPI
+static const struct dmi_system_id iTCO_wdt_force_suspend[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad T460s"),
+		},
+	},
+	{ },
+};
+
 static inline bool need_suspend(void)
 {
-	return acpi_target_system_state() == ACPI_STATE_S0;
+	return acpi_target_system_state() == ACPI_STATE_S0 ||
+		dmi_check_system(iTCO_wdt_force_suspend);
 }
 #else
 static inline bool need_suspend(void) { return true; }
@@ -631,8 +643,10 @@ static int iTCO_wdt_resume_noirq(struct device *dev)
 {
 	struct iTCO_wdt_private *p = dev_get_drvdata(dev);
 
-	if (p->suspended)
+	if (p->suspended) {
+		iTCO_wdt_set_timeout(&p->wddev, p->wddev.timeout);
 		iTCO_wdt_start(&p->wddev);
+	}
 
 	return 0;
 }

base-commit: 41e73feb1024929e75eaf2f7cd93f35a3feb331b
-- 
2.33.0

