Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528EA260F11
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Sep 2020 11:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgIHJ4e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Sep 2020 05:56:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:54256 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728971AbgIHJ4d (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Sep 2020 05:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=kdys38ltkUcOsNtVbzQt140YnYm
        SZcearclRh6YNAkY=; b=yt71cDQR0KgQcFo2EFRXxdpuxazhetPjgEJ8fhD/bAe
        YxuDhvhxXIz4IB4LYU9lUMJcaDPUbVd9QLYKzCRHZugPKcBZ140opdsFEc9gWxNi
        3I5ydL5STSK7+k/ETjRcgEDVM8Cl/RML/ishY9pSZuySsHmCPG3E1yqVonPMzKks
        =
Received: (qmail 698135 invoked from network); 8 Sep 2020 11:56:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Sep 2020 11:56:30 +0200
X-UD-Smtp-Session: l3s3148p1@bW9oWcquzqsgAwDPXxByAJWTgSFCfQZP
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND v2] watchdog: renesas_wdt: support handover from bootloader
Date:   Tue,  8 Sep 2020 11:56:15 +0200
Message-Id: <20200908095615.31376-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Support an already running watchdog by checking its enable bit and set
up the status accordingly before registering the device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is the same patch as V2 sent out nearly one year ago. There was one
issue when probe() failed and the clocks were disabled, so the WDT
wouldn't fire despite the FW set it up before. We fixed this at clk
driver level and all the commits are upstream now. I tested this on a
Renesas Salvator-XS board (R-Car M3N) with all combinations of
HANDLE_BOOT_ENABLED, open_timeout values and injected failures I could
think of. This patch is now good to go IMO.

 drivers/watchdog/renesas_wdt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 00662a8e039c..47fce4de0110 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -194,6 +194,7 @@ static int rwdt_probe(struct platform_device *pdev)
 	struct clk *clk;
 	unsigned long clks_per_sec;
 	int ret, i;
+	u8 csra;
 
 	if (rwdt_blacklisted(dev))
 		return -ENODEV;
@@ -213,8 +214,8 @@ static int rwdt_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 	priv->clk_rate = clk_get_rate(clk);
-	priv->wdev.bootstatus = (readb_relaxed(priv->base + RWTCSRA) &
-				RWTCSRA_WOVF) ? WDIOF_CARDRESET : 0;
+	csra = readb_relaxed(priv->base + RWTCSRA);
+	priv->wdev.bootstatus = csra & RWTCSRA_WOVF ? WDIOF_CARDRESET : 0;
 	pm_runtime_put(dev);
 
 	if (!priv->clk_rate) {
@@ -252,6 +253,13 @@ static int rwdt_probe(struct platform_device *pdev)
 	/* This overrides the default timeout only if DT configuration was found */
 	watchdog_init_timeout(&priv->wdev, 0, dev);
 
+	/* Check if FW enabled the watchdog */
+	if (csra & RWTCSRA_TME) {
+		/* Ensure properly initialized dividers */
+		rwdt_start(&priv->wdev);
+		set_bit(WDOG_HW_RUNNING, &priv->wdev.status);
+	}
+
 	ret = watchdog_register_device(&priv->wdev);
 	if (ret < 0)
 		goto out_pm_disable;
-- 
2.20.1

