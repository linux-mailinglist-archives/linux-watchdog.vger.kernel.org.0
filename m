Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5800F23179D
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 04:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbgG2CYs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 22:24:48 -0400
Received: from inva020.nxp.com ([92.121.34.13]:59862 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731004AbgG2CYr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 22:24:47 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B232F1A0975;
        Wed, 29 Jul 2020 04:24:45 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9BD771A0F93;
        Wed, 29 Jul 2020 04:24:41 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3E12940302;
        Wed, 29 Jul 2020 04:24:36 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 2/2] watchdog: imx7ulp: Watchdog should continue running for wait/stop mode
Date:   Wed, 29 Jul 2020 10:20:27 +0800
Message-Id: <1595989227-24700-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When kernel idle, system will enter wait/stop mode, wdog should continue
running in this scenario, and the refresh thread can wake up system from
wait/stop mode.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
no change.
---
 drivers/watchdog/imx7ulp_wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 7d2b12e..2b4ff43 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -22,6 +22,8 @@
 #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
 #define WDOG_CS_EN		BIT(7)
 #define WDOG_CS_UPDATE		BIT(5)
+#define WDOG_CS_WAIT		BIT(1)
+#define WDOG_CS_STOP		BIT(0)
 
 #define WDOG_CNT	0x4
 #define WDOG_TOVAL	0x8
@@ -174,7 +176,8 @@ static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
 	/* set an initial timeout value in TOVAL */
 	writel(timeout, base + WDOG_TOVAL);
 	/* enable 32bit command sequence and reconfigure */
-	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
+	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE |
+	      WDOG_CS_WAIT | WDOG_CS_STOP;
 	writel(val, base + WDOG_CS);
 	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
 	local_irq_enable();
-- 
2.7.4

