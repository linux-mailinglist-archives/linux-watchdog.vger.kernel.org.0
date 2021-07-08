Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA373BF6DC
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Jul 2021 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhGHIYN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Jul 2021 04:24:13 -0400
Received: from cpanel.siel.si ([46.19.9.99]:51182 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230489AbhGHIYN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Jul 2021 04:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=iCESmK4halSkMTLHBLWDFEHc/mwOcN341e8ug5p/i80=; b=VwBytZDAx8Kpg5l+yem6usJ90c
        ENzcDJFngIshyX8+wSekf9eYBJUj+ZeZvSmMZVP+R/BX2P2ZgIvpwLvUHg2cmKt8knr8CG9lD/EIT
        EiAywxUoB3GLTJFR9/6Nk3SyQDXwvguc7jDhD2JN4jPRIWgPNg2xfKPs0XQutnGORojKY7wG+PJw2
        KVJ52jPB7mhmMc2kH99bXJR8oUpxvFwb+dXRkAq32oDJoiCfFgHp5m/XbNmQAa/9Pfh8UWxCC0pnV
        alnKX+MEntXsyxAPld9ILxXDlcSIGiG+dijtH73rrBbQs61ZGsONoIvJYgnbi47nlkL69bQLX+tws
        IzYP54zQ==;
Received: from [89.212.21.243] (port=45800 helo=z840.regau.abatec.at)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <primoz.fiser@norik.com>)
        id 1m1PHb-003OxW-Rd; Thu, 08 Jul 2021 10:21:27 +0200
From:   Primoz Fiser <primoz.fiser@norik.com>
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] watchdog: da9062: da9063: prevent pings ahead of machine reset
Date:   Thu,  8 Jul 2021 10:21:28 +0200
Message-Id: <20210708082128.2832904-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706112103.1687587-1-primoz.fiser@norik.com>
References: <20210706112103.1687587-1-primoz.fiser@norik.com>
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
late into poweroff/reboot phase which did not happen before mentioned
commit (usually the watchdog ping happened immediately as commit message
suggests). As of now, when watchdog ping usually happens late into
poweroff/reboot stage when interrupts are not available anymore, i2c bus
lock cannot be released anymore and pending restart handler in turn
fails.

Thus, to prevent such late watchdog pings from happening ahead of
pending machine restart and consequently locking up the i2c bus, check
for system_state in watchdog ping handler and consequently do not send
pings anymore in case system_state > SYSTEM_RUNNING.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Implemented proposal suggested by Guenter Roeck.

Re-spun boards in boot/reboot loop tests and done 5000 cycles on each
one with flying colors. 

Changes in v2:
- reduce code complexity by removing reboot notifiers and use
  system_state variable instead
- minor commit message rewording

 drivers/watchdog/da9062_wdt.c | 7 +++++++
 drivers/watchdog/da9063_wdt.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 706fb09c2f24..f02cbd530538 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -117,6 +117,13 @@ static int da9062_wdt_ping(struct watchdog_device *wdd)
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
 	int ret;
 
+	/*
+	 * Prevent pings from occurring late in system poweroff/reboot sequence
+	 * and possibly locking out restart handler from accessing i2c bus.
+	 */
+	if (system_state > SYSTEM_RUNNING)
+		return 0;
+
 	ret = da9062_reset_watchdog_timer(wdt);
 	if (ret)
 		dev_err(wdt->hw->dev, "Failed to ping the watchdog (err = %d)\n",
diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 423584252606..d79ce64e26a9 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -121,6 +121,13 @@ static int da9063_wdt_ping(struct watchdog_device *wdd)
 	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
 	int ret;
 
+	/*
+	 * Prevent pings from occurring late in system poweroff/reboot sequence
+	 * and possibly locking out restart handler from accessing i2c bus.
+	 */
+	if (system_state > SYSTEM_RUNNING)
+		return 0;
+
 	ret = regmap_write(da9063->regmap, DA9063_REG_CONTROL_F,
 			   DA9063_WATCHDOG);
 	if (ret)
-- 
2.25.1

