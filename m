Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D84B40C633
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Sep 2021 15:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbhIONVm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Sep 2021 09:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhIONVl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Sep 2021 09:21:41 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0ECC061764
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Sep 2021 06:20:20 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id uDLH2500Y4C55Sk01DLHEp; Wed, 15 Sep 2021 15:20:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQUng-004eT9-1Q; Wed, 15 Sep 2021 15:18:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQRWi-002T2q-S7; Wed, 15 Sep 2021 11:48:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] watchdog: rza_wdt: Use semicolons instead of commas
Date:   Wed, 15 Sep 2021 11:48:23 +0200
Message-Id: <fa4451efd21e287f8fdf2f7f8495b070544209c0.1631699262.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This code works, but it is cleaner to use semicolons at the end of
statements instead of commas.

Extracted from a big anonymous patch by Julia Lawall
<julia.lawall@inria.fr>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/watchdog/rza_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rza_wdt.c b/drivers/watchdog/rza_wdt.c
index 7b6c365f7cd36297..fe6c2ed35e04cc4b 100644
--- a/drivers/watchdog/rza_wdt.c
+++ b/drivers/watchdog/rza_wdt.c
@@ -189,8 +189,8 @@ static int rza_wdt_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	priv->wdev.info = &rza_wdt_ident,
-	priv->wdev.ops = &rza_wdt_ops,
+	priv->wdev.info = &rza_wdt_ident;
+	priv->wdev.ops = &rza_wdt_ops;
 	priv->wdev.parent = dev;
 
 	priv->cks = (u8)(uintptr_t) of_device_get_match_data(dev);
-- 
2.25.1

