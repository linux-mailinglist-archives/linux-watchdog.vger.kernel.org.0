Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25338C144D
	for <lists+linux-watchdog@lfdr.de>; Sun, 29 Sep 2019 13:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfI2LI6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 29 Sep 2019 07:08:58 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:14347 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbfI2LI6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 29 Sep 2019 07:08:58 -0400
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Sun, 29 Sep 2019 07:08:57 EDT
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Sun, 29 Sep 2019
 18:53:53 +0800
From:   Xingyu Chen <xingyu.chen@amlogic.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] watchdog: meson: Fix the wrong value of left time
Date:   Sun, 29 Sep 2019 18:53:49 +0800
Message-ID: <1569754429-17287-1-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.8.22]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The left time value is wrong when we get it by sysfs. The left time value
should be equal to preset timeout value minus elapsed time value. According
to the Meson-GXB/GXL datasheets which can be found at [0], the timeout value
is saved to BIT[0-15] of the WATCHDOG_TCNT, and elapsed time value is saved
to BIT[16-31] of the WATCHDOG_TCNT.

[0]: http://linux-meson.com

Fixes: 683fa50f0e18 ("watchdog: Add Meson GXBB Watchdog Driver")
Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index d17c1a6..5a9ca10 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -89,8 +89,8 @@ static unsigned int meson_gxbb_wdt_get_timeleft(struct watchdog_device *wdt_dev)
 
 	reg = readl(data->reg_base + GXBB_WDT_TCNT_REG);
 
-	return ((reg >> GXBB_WDT_TCNT_CNT_SHIFT) -
-		(reg & GXBB_WDT_TCNT_SETUP_MASK)) / 1000;
+	return ((reg & GXBB_WDT_TCNT_SETUP_MASK) -
+		(reg >> GXBB_WDT_TCNT_CNT_SHIFT)) / 1000;
 }
 
 static const struct watchdog_ops meson_gxbb_wdt_ops = {
-- 
2.7.4

