Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E90A2329CB
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 04:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgG3CHd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 22:07:33 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57388 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726367AbgG3CHd (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 22:07:33 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F018E201144;
        Thu, 30 Jul 2020 04:07:31 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DADA8201145;
        Thu, 30 Jul 2020 04:07:27 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7BECB40310;
        Thu, 30 Jul 2020 04:07:22 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 2/2] watchdog: imx7ulp: Watchdog should continue running for wait/stop mode
Date:   Thu, 30 Jul 2020 10:03:11 +0800
Message-Id: <1596074591-4207-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596074591-4207-1-git-send-email-Anson.Huang@nxp.com>
References: <1596074591-4207-1-git-send-email-Anson.Huang@nxp.com>
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
index 010ddd1..77773b0 100644
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
@@ -187,7 +189,8 @@ static int imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
 	/* set an initial timeout value in TOVAL */
 	writel(timeout, base + WDOG_TOVAL);
 	/* enable 32bit command sequence and reconfigure */
-	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
+	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE |
+	      WDOG_CS_WAIT | WDOG_CS_STOP;
 	writel(val, base + WDOG_CS);
 	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
 
-- 
2.7.4

