Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F3D166C9F
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 03:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbgBUCG2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Feb 2020 21:06:28 -0500
Received: from inva021.nxp.com ([92.121.34.21]:41664 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbgBUCG2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Feb 2020 21:06:28 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 04AEB2063D0;
        Fri, 21 Feb 2020 03:06:27 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BD1802062CE;
        Fri, 21 Feb 2020 03:06:21 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9FF42402AB;
        Fri, 21 Feb 2020 10:06:15 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/3] watchdog: imx_sc_wdt: Remove unused includes
Date:   Fri, 21 Feb 2020 10:00:28 +0800
Message-Id: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is nothing in use from init.h/reboot.h, remove them.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/imx_sc_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 8ed89f0..60a3246 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -6,13 +6,11 @@
 #include <linux/arm-smccc.h>
 #include <linux/firmware/imx/sci.h>
 #include <linux/io.h>
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/reboot.h>
 #include <linux/watchdog.h>
 
 #define DEFAULT_TIMEOUT 60
-- 
2.7.4

