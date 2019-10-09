Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC6CD0874
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2019 09:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfJIHkM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Oct 2019 03:40:12 -0400
Received: from inva020.nxp.com ([92.121.34.13]:41440 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfJIHkM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Oct 2019 03:40:12 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E08CB1A09EF;
        Wed,  9 Oct 2019 09:40:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0E29A1A09F3;
        Wed,  9 Oct 2019 09:40:06 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CA114402B1;
        Wed,  9 Oct 2019 15:39:59 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] watchdog: imx_sc_wdt: Pretimeout should follow SCU firmware format
Date:   Wed,  9 Oct 2019 15:37:47 +0800
Message-Id: <1570606667-16729-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SCU firmware calculates pretimeout based on current time stamp
instead of watchdog timeout stamp, need to convert the pretimeout
to SCU firmware's timeout value.

Fixes: 15f7d7fc5542 ("watchdog: imx_sc: Add pretimeout support")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/imx_sc_wdt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 7ea5cf5..8ed89f0 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -99,8 +99,14 @@ static int imx_sc_wdt_set_pretimeout(struct watchdog_device *wdog,
 {
 	struct arm_smccc_res res;
 
+	/*
+	 * SCU firmware calculates pretimeout based on current time
+	 * stamp instead of watchdog timeout stamp, need to convert
+	 * the pretimeout to SCU firmware's timeout value.
+	 */
 	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_PRETIME_WDOG,
-		      pretimeout * 1000, 0, 0, 0, 0, 0, &res);
+		      (wdog->timeout - pretimeout) * 1000, 0, 0, 0,
+		      0, 0, &res);
 	if (res.a0)
 		return -EACCES;
 
-- 
2.7.4

