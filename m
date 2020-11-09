Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2882AAFB0
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Nov 2020 04:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbgKIDBO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 22:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIDBO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 22:01:14 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF5FC0613CF;
        Sun,  8 Nov 2020 19:01:14 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id x23so3983979plr.6;
        Sun, 08 Nov 2020 19:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eergAcVwrV/Vdb1ywFVydhk3J6PWGYILWqD6MtGIY3Q=;
        b=viGoncLBKe05fI7/d15315arj7wLwmrBflFy4yggT1WjYM52xA7NyK+qv8xSk56uNJ
         BxxV7tMat7v21Zp9sy31bguTwcc7xjBaWvq4ArjyN481XkzMUg6UIrVkLhK3mRiafWSk
         TWtW3EKVwK5fCuJ68PUxSVaH7/miPy3wu4ZC/JtfBlr5F6mC2eFfuOicGwQmhaGvn2p1
         cwOoAE8cLcjK6VYyJ0IJJD+abwq54WFLs2g3gYEy+NQCZ/QwLkdzB49Pn7WSTskblboo
         MDu3lrOOi/AcBgp6+eonXYxu1FSqX6LWVtcdJhEyGYCK87izfSL0B+ltLw5c5QpCfhO1
         e4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eergAcVwrV/Vdb1ywFVydhk3J6PWGYILWqD6MtGIY3Q=;
        b=QhoKOlZWHhiFzbxLcir4Bk0E2OWbi80rWxgXZ3nHchfulw0Z01d8NDe6zI/1P4U4t0
         S4zbGTZ/4IClIWIzatUvWTOP3e19Rlbp3iJ/38S25rZIRIGv2Y4X+gnxYfpqYcK7qbZs
         CT9JW9Q7CrnYSoU7TVH28NQvwJfr/aidgAtcL5VltiUYWfq1wqxatIDsfhlNSSRT6aHj
         iTQdXq907dC9MI875X/0MD+MLmPou1J+Y/xD4oKjkGDjfnhqE8Cs8pfCP6dPxq0Plkdv
         esas8SNlVm1ElZLxB1OR2eOXXmVNcCYoZzwILT94rYYNkK1nMsnfgrnn4Rk+lulq7zKx
         JgDQ==
X-Gm-Message-State: AOAM530OFtvY62CpUnII7RZzjfE/qzzGrik4a07ViNomIk5xxNX9WuGo
        GVkZFg/gLk15ohnHI08pS7Q=
X-Google-Smtp-Source: ABdhPJyLMqTT6dToDAs20txqLGCqIcuL5onR+HrvyPSTjTNCZDtQ9165pUMR+gn2MLHkfGfwBIaIxQ==
X-Received: by 2002:a17:902:7606:b029:d4:c797:a186 with SMTP id k6-20020a1709027606b02900d4c797a186mr10658530pll.38.1604890873966;
        Sun, 08 Nov 2020 19:01:13 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u197sm4344606pfc.127.2020.11.08.19.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 19:01:13 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Lingling Xu <ling_ling.xu@unisoc.com>,
        Jingchao Ye <jingchao.ye@unisoc.com>,
        Xiaoqing Wu <xiaoqing.wu@unisoc.com>
Subject: [PATCH v3 3/3] watchdog: sprd: change to use usleep_range() instead of busy loop
Date:   Mon,  9 Nov 2020 11:00:55 +0800
Message-Id: <20201109030055.27378-4-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109030055.27378-1-zhang.lyra@gmail.com>
References: <20201109030055.27378-1-zhang.lyra@gmail.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/sprd_wdt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index b9b1daa9e2a4..4e689b6ff141 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -53,7 +54,7 @@
 
 #define SPRD_WDT_CNT_HIGH_SHIFT		16
 #define SPRD_WDT_LOW_VALUE_MASK		GENMASK(15, 0)
-#define SPRD_WDT_LOAD_TIMEOUT		1000
+#define SPRD_WDT_LOAD_TIMEOUT		11
 
 struct sprd_wdt {
 	void __iomem *base;
@@ -109,15 +110,17 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
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

