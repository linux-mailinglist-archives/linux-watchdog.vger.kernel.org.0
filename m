Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE778492BFC
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jan 2022 18:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347030AbiARRJT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jan 2022 12:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347046AbiARRJR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jan 2022 12:09:17 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B292FC061760
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Jan 2022 09:09:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by laurent.telenet-ops.be with bizsmtp
        id kH992600N0kcUhD01H99pN; Tue, 18 Jan 2022 18:09:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-00AH3C-S8; Tue, 18 Jan 2022 18:09:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-001BlZ-Dq; Tue, 18 Jan 2022 18:09:08 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] watchdog: renesas_wdt: Add R-Car Gen4 support
Date:   Tue, 18 Jan 2022 18:09:03 +0100
Message-Id: <cc395105e1d34aab2c076d368c0737833970b9d2.1642525158.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642525158.git.geert+renesas@glider.be>
References: <cover.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Thanh Quan <thanh.quan.xn@renesas.com>

Add the compatible string for the R-Car Gen4 family.
No further driver changes are needed.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/watchdog/renesas_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 5791198960e6c5bf..41d58ea5eb2f40fd 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -327,6 +327,7 @@ static SIMPLE_DEV_PM_OPS(rwdt_pm_ops, rwdt_suspend, rwdt_resume);
 static const struct of_device_id rwdt_ids[] = {
 	{ .compatible = "renesas,rcar-gen2-wdt", },
 	{ .compatible = "renesas,rcar-gen3-wdt", },
+	{ .compatible = "renesas,rcar-gen4-wdt", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rwdt_ids);
-- 
2.25.1

