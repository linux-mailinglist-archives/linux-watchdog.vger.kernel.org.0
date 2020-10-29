Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC69429E2D7
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 03:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgJ2CkM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Oct 2020 22:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728814AbgJ2Cjz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Oct 2020 22:39:55 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E86C0613CF;
        Wed, 28 Oct 2020 19:39:54 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o7so1132715pgv.6;
        Wed, 28 Oct 2020 19:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y3qZn9qn5b0CeWsCsiXGc05uFjpKmWEaiZB/5MLhFJE=;
        b=DdQWJtkt4C10ffUpDHjPqKJ7Z3wC6KbxjEEIEvKGpsp3+ZQn7TuJM31CLo8eV90CBp
         yqncrUcE1BvWh/wETNfzbx71bwJIB3yJJYuz/cN9kMdirP97OpDYBMAtyU1rIsi1VFiY
         LrraCktTNrbJkWzvNcsR8QTvTLU2fTWuaYfE9KSP6qpki0gXvEiGPDJ5DkzJ4Oqg4xxY
         ZhgipyNy5g4K3XDLE0Y2+IWxpdjJHs932O4lnTuB03WBhrA7yNdWup9+7I1tcAz0ggww
         mxVtBS2NuXhBGAj/w9EsYksO+RxSpYYEjfGCGwUD9jCEftb2hMbmJYKCjENPMBaxM34i
         FQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y3qZn9qn5b0CeWsCsiXGc05uFjpKmWEaiZB/5MLhFJE=;
        b=Y5+NKorELUAnKsicxPmVCS4NYJJYYzDY+E7gGuL03reCyu686qnmMn4Lz9NIP2nRhV
         dOsO9Pem8U0I6h8FufvbpnAKA79aoPawW0bfNHm0D8zA12dhPElzracX0pvHltTh7p37
         NZbIJBanh3qxsbIL/xesrAbJ+WfxmZmuP/shzsMTPVy1yrpAL2AEUzWHSTxI1y1EBadV
         ZF82723q09dyhh/ZXl/KClsWXBeFRLjgg/upz6+YHpZP26/9bXV1qETzCmjXmmtV9t1k
         OWQJiOiAYH3exLeteeFbx3re6LGRkhv/GrV6ou/wzF+/qEowzThv+ygPw86kCe4lOlWs
         +nHA==
X-Gm-Message-State: AOAM530V5g38EM5nJBpj3vcPt8DBY6vEXTf5/XwFGW4skRyojZyHoXE5
        Xup2LBror0AppxXitZDlr+A=
X-Google-Smtp-Source: ABdhPJzGQX5Y+wBWZ0l8Z2JAqz1C1Yd7lb17n1RuNA9x5YFTWLVted7R7ZAcYZi9L20bH6mFk2Ogjw==
X-Received: by 2002:a62:e516:0:b029:156:3b35:9423 with SMTP id n22-20020a62e5160000b02901563b359423mr2082622pff.19.1603939194469;
        Wed, 28 Oct 2020 19:39:54 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id kr14sm566260pjb.26.2020.10.28.19.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 19:39:53 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Jingchao Ye <jingchao.ye@unisoc.com>,
        Xiaoqing Wu <xiaoqing.wu@unisoc.com>
Subject: [PATCH v2 3/3] watchdog: sprd: change to use usleep_range() instead of busy loop
Date:   Thu, 29 Oct 2020 10:39:33 +0800
Message-Id: <20201029023933.24548-4-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029023933.24548-1-zhang.lyra@gmail.com>
References: <20201029023933.24548-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

After changing to check busy bit for the previous loading operation instead
of the current one, for most of cases, the busy bit is not set for the
first time of read, so there's no need to check so frequently, so this
patch use usleep_range() to replace cpu_relax() to avoid busy loop.

Also this patch change the max times to 11 which would be enough, since
according to the specification, the busy bit would be set after a new
loading operation and last 2 or 3 RTC clock cycles (about 60us~92us).

Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
Original-by: Lingling Xu <ling_ling.xu@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/watchdog/sprd_wdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index b9b1daa9e2a4..e8097551dfcd 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -53,7 +53,7 @@
 
 #define SPRD_WDT_CNT_HIGH_SHIFT		16
 #define SPRD_WDT_LOW_VALUE_MASK		GENMASK(15, 0)
-#define SPRD_WDT_LOAD_TIMEOUT		1000
+#define SPRD_WDT_LOAD_TIMEOUT		11
 
 struct sprd_wdt {
 	void __iomem *base;
@@ -109,15 +109,17 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
 	u32 prtmr_step = pretimeout * SPRD_WDT_CNT_STEP;
 
 	/*
-	 * Waiting the load value operation done,
-	 * it needs two or three RTC clock cycles.
+	 * Checking busy bit to make sure the previous loading operation is
+	 * done. According to the specification, the busy bit would be set
+	 * after a new loading operation and last 2 or 3 RTC clock
+	 * cycles (about 60us~92us).
 	 */
 	do {
 		val = readl_relaxed(wdt->base + SPRD_WDT_INT_RAW);
 		if (!(val & SPRD_WDT_LD_BUSY_BIT))
 			break;
 
-		cpu_relax();
+		usleep_range(10, 100);
 	} while (delay_cnt++ < SPRD_WDT_LOAD_TIMEOUT);
 
 	if (delay_cnt >= SPRD_WDT_LOAD_TIMEOUT)
-- 
2.20.1

