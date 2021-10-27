Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA4043C9CA
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 14:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240192AbhJ0Mid (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 08:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236394AbhJ0Mid (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 08:38:33 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A9CC061570
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 05:36:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
        by xavier.telenet-ops.be with bizsmtp
        id B0c52600C2hfXWm010c5nf; Wed, 27 Oct 2021 14:36:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mfiA1-008TvA-0j; Wed, 27 Oct 2021 14:36:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mfiA0-00DsVi-8M; Wed, 27 Oct 2021 14:36:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] watchdog: rza_wdt: Use semicolons instead of commas
Date:   Wed, 27 Oct 2021 14:36:03 +0200
Message-Id: <dc4e3692480a136f5c2efdd38862ff2c8741f93c.1635338097.git.geert+renesas@glider.be>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
  - Add Reviewed-by.
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

