Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1602F45B693
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 09:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240896AbhKXIgS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 03:36:18 -0500
Received: from cpanel.siel.si ([46.19.9.99]:47024 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240831AbhKXIgR (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 03:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=0GFj0ec5nvqhJicygYIAPY76a2qiNJxCIyQsOhKxA64=; b=RACAbDAe23kvZ4Emc1mQGF6zsA
        euZ21JKF+F70DH7Bf94xW7w0Ypo8jLeOKuOO1VuAlch2Kk7Sr4K00/YVMzb7bTxOu+DUMyRzBWDbK
        mgXQ5pWRgHiwCV3PXHQQAyyKAyD94MkakKBwS+UGsPnwu/kSkwl/weT2QiKNpEC7fYozFVdH4qW+k
        CEM1lirok3TYMACYgtKdU3+RIn+wKJ+OLJvDtCk6C2kA+2KEG2OvpyePWRnk+Lr6trnZB4zlAjYS/
        84qk0xIRQqiGvkkXxG6hU1AkXQh6ZweGeYYxJtS0fD6OrKC4Ld3jJGebcd5cvhuVGT3xjnSyBWvzC
        ub5Uy67Q==;
Received: from [89.212.21.243] (port=40936 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <andrej.picej@norik.com>)
        id 1mpni2-006FoM-J7; Wed, 24 Nov 2021 09:33:01 +0100
From:   Andrej Picej <andrej.picej@norik.com>
To:     support.opensource@diasemi.com, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Cc:     andrej.picej@norik.com, y.bas@phytec.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] watchdog: da9062: reset board on watchdog timeout
Date:   Wed, 24 Nov 2021 09:32:58 +0100
Message-Id: <20211124083258.2606511-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124083258.2606511-1-andrej.picej@norik.com>
References: <20211124083258.2606511-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Stefan Christ <s.christ@phytec.de>

In the default fuse configuration the watchdog poweroffs the system
instead of resetting it on a watchdog timeout. This patch changes the
behavior. Now the board is reseted and reboots.

Note: This patch requires that the config register CONFIG_I is
configured as writable in the da9062 multi function device.

Signed-off-by: Stefan Christ <s.christ@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 drivers/watchdog/da9062_wdt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index f02cbd530538..a04613e68f4a 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -87,6 +87,20 @@ static int da9062_wdt_start(struct watchdog_device *wdd)
 	unsigned int selector;
 	int ret;
 
+	/*
+	 * Use da9062's SHUTDOWN mode instead of POWERDOWN for watchdog reset.
+	 * On timeout the PMIC should reset the system, not powering it
+	 * off.
+	 */
+	ret = regmap_update_bits(wdt->hw->regmap,
+				 DA9062AA_CONFIG_I,
+				 DA9062AA_WATCHDOG_SD_MASK,
+				 DA9062AA_WATCHDOG_SD_MASK);
+	if (ret)
+		dev_err(wdt->hw->dev,
+			"failed to set wdt reset mode. Expect poweroff on watchdog reset: %d\n",
+			ret);
+
 	selector = da9062_wdt_timeout_to_sel(wdt->wdtdev.timeout);
 	ret = da9062_wdt_update_timeout_register(wdt, selector);
 	if (ret)
-- 
2.25.1

