Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F4A77D302
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Aug 2023 21:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236565AbjHOTJK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Aug 2023 15:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239750AbjHOTIo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Aug 2023 15:08:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8832111
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Aug 2023 12:08:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5950360CA4
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Aug 2023 19:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F710C433C7;
        Tue, 15 Aug 2023 19:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692126427;
        bh=MJRTsKjJrCqgZBHh3ucJktBplP659QkvtPqpYoiAoQY=;
        h=From:Date:Subject:To:Cc:From;
        b=e5wIKX0EVRDwQ8ztXhcobA5K0H7FetEp9rCkWJCAkGOuVzNaswxxaDMkJDz/5BLUY
         p3U2fSmikJ/+yYR6zf1Q6hSqg9Na159AiTm9D8+F4NfGfrNd/fjsWuAfUamHcAgdtD
         040pJTC/tEnDHObPF0x37dC+WZgYZmbgstlFKPwIN/q7/aHumtMsf+/j8tSZ85dkCS
         +NDmXcKdcGPYoy51TznvaaItdBvpwDhBP8NWjDoRDZCugP3GKy1OUGc8dU4bGVv0DP
         gaI5fSECd5w3krOG+Uy6QDTpYLf8MbfR8f5RuopIr4q7asAcbHuBxAoViW2z1WJryr
         seDIlPdcvkBmg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Tue, 15 Aug 2023 12:06:50 -0700
Subject: [PATCH] watchdog: xilinx_wwdt: Use div_u64() in
 xilinx_wwdt_start()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230815-watchdog-xilinx-div_u64-v1-1-20b0b5a65c2e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMnM22QC/x3MywqAIBBA0V+JWTdglr1+JSJCpxoIC+0hRP+et
 DyLex/w5Jg8tMkDji72vNmILE1AL6OdCdlEgxQyF3Wm8B4PvZhtxsAr24CGr+EsC6yVlpUulSi
 aHGK9O5o4/Oeuf98PnGt1FGkAAAA=
To:     srinivas.neeli@amd.com, wim@linux-watchdog.org
Cc:     shubhrajyoti.datta@amd.com, michal.simek@amd.com,
        linux@roeck-us.net, ndesaulniers@google.com, trix@redhat.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=nathan@kernel.org;
 h=from:subject:message-id; bh=MJRTsKjJrCqgZBHh3ucJktBplP659QkvtPqpYoiAoQY=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCm3z9za46s+3+aG7cQa/fs105dt+eAvter+059nAv7Xp
 og5zpNt7ShlYRDjYJAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT2bmUkaHTbNGCHMVL139w
 r5namNxs7dgxv8peou6PmCW32LuiSy0M/+uEYhQn/lDSj7JOLxBh8zn4u3xJ2Y5qx4bjS/lvGTh
 PZQQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

After commit f1a43aadb5a6 ("watchdog: Enable COMPILE_TEST for more
drivers"), it is possible to enable this driver on 32-bit architectures.
When building for those architectures with clang, there is an error due
to a 64-bit division in xilinx_wwdt_start():

  ERROR: modpost: "__aeabi_uldivmod" [drivers/watchdog/xilinx_wwdt.ko] undefined!

Use div_u64() to fix this, which takes a 64-bit dividend and 32-bit
divisor. GCC likely avoids the same error due to optimizations it
employs to transform division by a constant into other equivalent
operations, which may be different than what is implemented in clang.

Link: https://github.com/ClangBuiltLinux/linux/issues/1915
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/watchdog/xilinx_wwdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/xilinx_wwdt.c b/drivers/watchdog/xilinx_wwdt.c
index 1d998db41533..d271e2e8d6e2 100644
--- a/drivers/watchdog/xilinx_wwdt.c
+++ b/drivers/watchdog/xilinx_wwdt.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -71,7 +72,7 @@ static int xilinx_wwdt_start(struct watchdog_device *wdd)
 
 	/* Calculate timeout count */
 	time_out = xdev->freq * wdd->timeout;
-	closed_timeout = (time_out * xdev->close_percent) / 100;
+	closed_timeout = div_u64(time_out * xdev->close_percent, 100);
 	open_timeout = time_out - closed_timeout;
 	wdd->min_hw_heartbeat_ms = xdev->close_percent * 10 * wdd->timeout;
 

---
base-commit: 8a504bd61ec7b3ddd72680e15775f2c7c0f9e894
change-id: 20230815-watchdog-xilinx-div_u64-85c27c650493

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

