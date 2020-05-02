Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5911C2618
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 May 2020 16:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgEBO04 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 May 2020 10:26:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:57970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbgEBO04 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 May 2020 10:26:56 -0400
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DC2724957;
        Sat,  2 May 2020 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588429616;
        bh=CB2qIt0YCg9YgJ9w+bsz7dbW1Jd2EWMmQ+Y4nnyAh2Q=;
        h=From:To:Cc:Subject:Date:From;
        b=LUbyz7VZinr56lxLh69WLjCpZJL3uX7m/udTre8cgjcLU5NU9vvAgTkjzIoNAZcPd
         hwrOzm9whdu4cfAW4a8h2c2vDmwYg0a81ZuXzhNmLECwedwZZoUjAEXUj5EF23UUQt
         Tk0TzZJslz46Oufr4azQvVG+hK7aYkjK8ADHxSWo=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, Wolfram Sang <wsa@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] watchdog: imx2_wdt: update contact email
Date:   Sat,  2 May 2020 16:26:53 +0200
Message-Id: <20200502142653.19144-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The 'pengutronix' address is defunct for years. Use the proper contact
address.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/watchdog/imx2_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 1fe472f56cb3..b84f80f7d342 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -2,7 +2,7 @@
 /*
  * Watchdog driver for IMX2 and later processors
  *
- *  Copyright (C) 2010 Wolfram Sang, Pengutronix e.K. <w.sang@pengutronix.de>
+ *  Copyright (C) 2010 Wolfram Sang, Pengutronix e.K. <kernel@pengutronix.de>
  *  Copyright (C) 2014 Freescale Semiconductor, Inc.
  *
  * some parts adapted by similar drivers from Darius Augulis and Vladimir
-- 
2.20.1

