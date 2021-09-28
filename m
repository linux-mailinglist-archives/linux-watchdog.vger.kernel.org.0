Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0907E41A929
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Sep 2021 08:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239104AbhI1G7l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Sep 2021 02:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239116AbhI1G7a (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Sep 2021 02:59:30 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6192FC061604;
        Mon, 27 Sep 2021 23:57:51 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1632812268;
        bh=5SWZyzA521WWQk9YTYVm2Mdu+LIwCBNb7lp4LyA75Jk=;
        h=From:To:Cc:Subject:Date:From;
        b=r+jxOP1/u9niWBn9LKuOFrPS+ujmSHdyBGMjAuT1ytivnFws7vg08U5cJmDwwc7D0
         yZixcjRo4NMtViGVnWFtp9F4NPT/nXlUKCJdP+swz/P/GeleZkN7y+YfOWcrnMWsU/
         ETUgUnnYT4nqFiHlQLZTPzbkvN8Pv/fZBXQZwDxw=
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: sp5100_tco: Add support for get_timeleft
Date:   Tue, 28 Sep 2021 08:57:35 +0200
Message-Id: <20210928065735.548966-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Tested on a Gigabyte X570 I AORUS PRO WIFI.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/watchdog/sp5100_tco.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index a730ecbf78cd..dd9a744f82f8 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -10,6 +10,7 @@
  *				https://www.kernelconcepts.de
  *
  *	See AMD Publication 43009 "AMD SB700/710/750 Register Reference Guide",
+ *	    AMD Publication 44413 "AMD SP5100 Register Reference Guide"
  *	    AMD Publication 45482 "AMD SB800-Series Southbridges Register
  *	                                                      Reference Guide"
  *	    AMD Publication 48751 "BIOS and Kernel Developer’s Guide (BKDG)
@@ -144,6 +145,13 @@ static int tco_timer_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static unsigned int tco_timer_get_timeleft(struct watchdog_device *wdd)
+{
+	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
+
+	return readl(SP5100_WDT_COUNT(tco->tcobase));
+}
+
 static u8 sp5100_tco_read_pm_reg8(u8 index)
 {
 	outb(index, SP5100_IO_PM_INDEX_REG);
@@ -386,6 +394,7 @@ static const struct watchdog_ops sp5100_tco_wdt_ops = {
 	.stop = tco_timer_stop,
 	.ping = tco_timer_ping,
 	.set_timeout = tco_timer_set_timeout,
+	.get_timeleft = tco_timer_get_timeleft,
 };
 
 static int sp5100_tco_probe(struct platform_device *pdev)

base-commit: 41e73feb1024929e75eaf2f7cd93f35a3feb331b
-- 
2.33.0

