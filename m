Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81BE2166CA2
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 03:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbgBUCGa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Feb 2020 21:06:30 -0500
Received: from inva021.nxp.com ([92.121.34.21]:41690 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729564AbgBUCGa (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Feb 2020 21:06:30 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E6CA2062CE;
        Fri, 21 Feb 2020 03:06:28 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 232612063D5;
        Fri, 21 Feb 2020 03:06:23 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8E106402C4;
        Fri, 21 Feb 2020 10:06:16 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 2/3] watchdog: imx7ulp: Remove unused include of init.h
Date:   Fri, 21 Feb 2020 10:00:29 +0800
Message-Id: <1582250430-8872-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
References: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is nothing in use from init.h, remove it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 11b9e7c..7993c8c 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.7.4

