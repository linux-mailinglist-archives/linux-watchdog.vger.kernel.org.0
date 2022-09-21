Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 326DE5BFF70
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Sep 2022 16:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiIUOBB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Sep 2022 10:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiIUOAh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Sep 2022 10:00:37 -0400
X-Greylist: delayed 4389 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 21 Sep 2022 07:00:10 PDT
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8D18673F
        for <linux-watchdog@vger.kernel.org>; Wed, 21 Sep 2022 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=sM0XFEPhPTKE/IRkxxsc91U+dBBL0dwvOHyXU7uHCds=; b=GL65vcWrRDF9FHxnNQwOta+OEe
        +YxqKFF7jvx/9BLxkH/xM7cgkfc3UGCzqvd4E3wtF3sYcVcPoegmbNvKuuHVcD4UtrVCQ3BChKUWS
        77x8tPnalRo+dK7JS8jrXND/IXO6MYPLNSICnRk5D4bhnLUL4e1L4K52hbUimMDRr6WoT8B+ukkrq
        wSPbyV5HD7hvFHqBetQIKv8b78WRGwJuWxFR3xYGqz94WeCbFLctvj+qp28ZFypxZH/5HX4dah+E9
        /+8ZoLbNasMVSjJoDAqCKjMB5h9P3ZnXET5mqvL8uVUDPfPUwjbwQ79EcfKm9V+zoMRuPYM1wW560
        5aZaBVpA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50376 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <andrej.picej@norik.com>)
        id 1oaz7v-00Etmy-2C;
        Wed, 21 Sep 2022 14:46:55 +0200
From:   Andrej Picej <andrej.picej@norik.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
Subject: [RFC PATCH 1/1] watchdog: imx2_wdg: suspend watchdog in WAIT mode
Date:   Wed, 21 Sep 2022 14:46:47 +0200
Message-Id: <20220921124647.1521667-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921124647.1521667-1-andrej.picej@norik.com>
References: <20220921124647.1521667-1-andrej.picej@norik.com>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Putting device into the "Suspend-To-Idle" mode causes watchdog to
trigger and reset the board after set watchdog timeout period elapses.
Setting WDW bit in WCR (Watchdog Control Register) suspends watchdog in
WAIT mode (corresponds to "Suspend-To-Idle" mode) and allows board to be
in idle for infinite amount of time. Watchdog operation is restored
after exiting WAIT mode as expected.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 drivers/watchdog/imx2_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 51bfb796898b..f888f29f50dd 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -35,6 +35,7 @@
 
 #define IMX2_WDT_WCR		0x00		/* Control Register */
 #define IMX2_WDT_WCR_WT		(0xFF << 8)	/* -> Watchdog Timeout Field */
+#define IMX2_WDT_WCR_WDW	BIT(7)		/* -> Watchdog disable for WAIT */
 #define IMX2_WDT_WCR_WDA	BIT(5)		/* -> External Reset WDOG_B */
 #define IMX2_WDT_WCR_SRS	BIT(4)		/* -> Software Reset Signal */
 #define IMX2_WDT_WCR_WRE	BIT(3)		/* -> WDOG Reset Enable */
@@ -128,6 +129,8 @@ static inline void imx2_wdt_setup(struct watchdog_device *wdog)
 
 	/* Suspend timer in low power mode, write once-only */
 	val |= IMX2_WDT_WCR_WDZST;
+	/* Suspend timer in low power WAIT mode, write once-only */
+	val |= IMX2_WDT_WCR_WDW;
 	/* Strip the old watchdog Time-Out value */
 	val &= ~IMX2_WDT_WCR_WT;
 	/* Generate internal chip-level reset if WDOG times out */
-- 
2.25.1

