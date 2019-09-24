Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F85BC252
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2019 09:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409201AbfIXHIu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 24 Sep 2019 03:08:50 -0400
Received: from inva020.nxp.com ([92.121.34.13]:41636 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409184AbfIXHIs (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 24 Sep 2019 03:08:48 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9AE031A00B5;
        Tue, 24 Sep 2019 09:08:46 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 087061A03AC;
        Tue, 24 Sep 2019 09:08:42 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2147A402ED;
        Tue, 24 Sep 2019 15:08:36 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 2/3] watchdog: imx2_wdt: Use __maybe_unused instead of #if CONFIG_PM_SLEEP
Date:   Tue, 24 Sep 2019 15:07:07 +0800
Message-Id: <1569308828-8320-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
References: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use __maybe_unused for power management related functions instead
of #if CONFIG_PM_SLEEP to simply the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/imx2_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 6711b4e..034f32c 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -358,9 +358,8 @@ static void imx2_wdt_shutdown(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
 /* Disable watchdog if it is active or non-active but still running */
-static int imx2_wdt_suspend(struct device *dev)
+static int __maybe_unused imx2_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdog = dev_get_drvdata(dev);
 	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
@@ -381,7 +380,7 @@ static int imx2_wdt_suspend(struct device *dev)
 }
 
 /* Enable watchdog and configure it if necessary */
-static int imx2_wdt_resume(struct device *dev)
+static int __maybe_unused imx2_wdt_resume(struct device *dev)
 {
 	struct watchdog_device *wdog = dev_get_drvdata(dev);
 	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
@@ -406,7 +405,6 @@ static int imx2_wdt_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(imx2_wdt_pm_ops, imx2_wdt_suspend,
 			 imx2_wdt_resume);
-- 
2.7.4

