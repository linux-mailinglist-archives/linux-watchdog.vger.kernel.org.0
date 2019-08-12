Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F0189909
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 10:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfHLIyY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 04:54:24 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58700 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbfHLIyY (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 04:54:24 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C60F12002FB;
        Mon, 12 Aug 2019 10:54:20 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1EE902002DF;
        Mon, 12 Aug 2019 10:54:16 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0D067402D2;
        Mon, 12 Aug 2019 16:54:09 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] watchdog: imx_sc: Remove unnecessary error log
Date:   Mon, 12 Aug 2019 16:44:34 +0800
Message-Id: <20190812084434.13316-1-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

An error message is already displayed by watchdog_register_device()
when failed, so no need to have error log again for failure of
calling devm_watchdog_register_device().

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/imx_sc_wdt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 78eaaf7..9260475 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -175,11 +175,8 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_unregister(wdog);
 
 	ret = devm_watchdog_register_device(dev, wdog);
- 
- 	if (ret) {
- 		dev_err(dev, "Failed to register watchdog device\n");
+	if (ret)
  		return ret;
- 	}
  
 	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
 				       SC_IRQ_WDOG,
-- 
2.7.4

