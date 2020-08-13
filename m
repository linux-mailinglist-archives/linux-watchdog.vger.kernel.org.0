Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636FD243A62
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Aug 2020 14:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHMM6U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Aug 2020 08:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgHMM6T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Aug 2020 08:58:19 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E4FC061757;
        Thu, 13 Aug 2020 05:58:18 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u20so2785912pfn.0;
        Thu, 13 Aug 2020 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gTPtLLpVlGWVqCEQ50i6eGJ0HyGEAaWaZg6X6EHGJ8Y=;
        b=N2wAovWQSI8dNBnAOPeeCXGOCZvLZ/zlHpkRNfRRrXr7TK+FK1x0d0t928qClLtlsJ
         ePcFzX6FIsx+3Zag95C1ASGvtL1i0gN7g4PQrk0FyILr1vLpIE7c1c/DdloHGOAT4DzQ
         S3u9a8O8S3x5c2Ez9w0hxSGirLz2Y0e4r8f545233XTtkXYeCHcV/wqgo41VYDlAobvK
         AYHKoIPG7e4fKvriHYYRgCYaCH/+TTlmmFFi80Bm+buFPoXkja5tV+wLDQQyNC8CaUvF
         w8bWztwBSf9wYmh7/0ApV/eVRfLXtYJ1Fcugvp3IHeReLEom8EYfdMp3iTNFg6Fa8+0u
         LkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gTPtLLpVlGWVqCEQ50i6eGJ0HyGEAaWaZg6X6EHGJ8Y=;
        b=hOYq7ytX7N5gmbc8dEteytU2xHM+y2NBtCaTBL7VSBnFGpIozXaI065cIY5yQGFjt+
         RfBpQv1aRF2KiFofqA6vPMT6JW6/GxOBOyur+XBni1EjYrY1D7wW4EWq6SFwIXuNDvju
         7XniLa0Wq9HFHn+M4ebK7y5L3DJ+hQeALM6LF8UGPStGquq6AVZ+p6AckBuxT+uF84yO
         BCbIh9nLu4nAI5nEGqS5SQuvwY6AC+tcITZVtdf8zKIYCdoPzGnDGQaoXi6ZECZzug/N
         cmAq2lio8qigmnd8YstGkGZ3LwlnML+ltx+2gIkeKg16kcX5oQeehR6BfWQx9ULBwGc1
         rrMA==
X-Gm-Message-State: AOAM533YeM0smjgoof/bBEwhxCNrtkLrBdLlV3hJqzXEak+nNFNYWtIZ
        WDXynJ3EN79NVASME3NIVw==
X-Google-Smtp-Source: ABdhPJw8tVwRtB2mbHav0pWxygwVqsparobl/2DbPyh0e/21PyJK33hzSdGPRKdiUtrobdCikjuXMw==
X-Received: by 2002:a63:925d:: with SMTP id s29mr3531093pgn.423.1597323498077;
        Thu, 13 Aug 2020 05:58:18 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:cea:b0c7:809d:c953:9730:34b1])
        by smtp.gmail.com with ESMTPSA id t19sm5820505pfc.5.2020.08.13.05.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 05:58:16 -0700 (PDT)
From:   madhuparnabhowmik10@gmail.com
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        andrianov@ispras.ru, ldv-project@linuxtesting.org,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Subject: [PATCH] drivers: watchdog: pc87413_wdt: Fix Race condition bug
Date:   Thu, 13 Aug 2020 18:24:51 +0530
Message-Id: <20200813125451.19118-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

After misc_register the open() callback can be called.
However the base address (swc_base_addr) is set after misc_register()
in init.
As a result, if open callback is called before pc87413_get_swc_base_addr()
then in the following call chain: pc87413_open() -> pc87413_refresh() ->
pc87413_swc_bank3() : The value of swc_base_addr will be -1.
Therefore, do misc_register() after pc87413_get_swc_base_addr().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 drivers/watchdog/pc87413_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
index 73fbfc99083b..ad8b8af2bdc0 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -512,6 +512,10 @@ static int __init pc87413_init(void)
 	if (ret != 0)
 		pr_err("cannot register reboot notifier (err=%d)\n", ret);
 
+	pc87413_select_wdt_out();
+	pc87413_enable_swc();
+	pc87413_get_swc_base_addr();
+
 	ret = misc_register(&pc87413_miscdev);
 	if (ret != 0) {
 		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
@@ -520,10 +524,6 @@ static int __init pc87413_init(void)
 	}
 	pr_info("initialized. timeout=%d min\n", timeout);
 
-	pc87413_select_wdt_out();
-	pc87413_enable_swc();
-	pc87413_get_swc_base_addr();
-
 	if (!request_region(swc_base_addr, 0x20, MODNAME)) {
 		pr_err("cannot request SWC region at 0x%x\n", swc_base_addr);
 		ret = -EBUSY;
-- 
2.17.1

