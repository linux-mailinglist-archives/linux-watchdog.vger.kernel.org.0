Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5F029E8F0
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 11:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgJ2K11 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 06:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbgJ2K1Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 06:27:25 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C589AC0613CF;
        Thu, 29 Oct 2020 03:27:25 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x23so1085295plr.6;
        Thu, 29 Oct 2020 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lI4GkUdPt6+xJMMHVAdO8QPYkUptmzNDzoT3r6qvrto=;
        b=l2m8wDS8nK7lfpHMZaVHn793wNtqTGp3iQ/MzBg3FTNzGqJPPFnjwMZyxhZCyu9Pde
         gvAOsO7jSKCOaYWQWnAql2/OZXZ7bKvXS08zdhfn+EgMwQeMDQS6EbwDawhYYSBdFZpV
         cKHMsaprUTQfdZG7hPtlDLVtRxCoQx6MwH1J/8nPiuhkA42jo0Fj8eg0dJeEc0UW70ZX
         n2W08r0I5j+Mefd6l34JpPdU6BQid83BNTbrlBIf5ZlFsD16ga+Wc+Xn1drfX3FWiuUu
         sKVX2r9sUsATnGLMeE/1DrPw5Qnbys/WaIpmVP1OY00hE5kCYV9xpJgQHfYk0HS1Kk/Q
         79DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lI4GkUdPt6+xJMMHVAdO8QPYkUptmzNDzoT3r6qvrto=;
        b=izT6vZm8EcVJXP/gsKOtsOgXDz9H7A8TbzlyjLJIbSFKAu5Ol6Tx91zKxFHsw4LbSP
         Abv0SgtorV9mz0MqQI6yhmUuWBDzniW3srtFjN3AaBENkWhs21h9w/IcBcQsi1AbhxPj
         Z+XEYzZ8+0ZlDCWzjg3fpn7/+SaZ/C1pzNYcamiYJb7dGAn+7964mm2f3qgOVCCLoSgy
         e3jjqqd+53x9RYYwL2VVmc5Gcu8nDTDMOocG9RyD8F1IxlswQ0CfXSA8iuDGkS0oD6nm
         WFzBqETRJU+jc0BjAKGgCdh7/TkkqAOoapXKFiJytaA4Ld+IVJpkONdcKXvONQEC7ZSk
         eDHQ==
X-Gm-Message-State: AOAM533E+3gFxj7WVNFWvJsFN8mjXOm8CoBpcIqU04lyt5X2NvVXb2bh
        j6yGK1o3HRmMzn6G2I94W3K/4sy0OAY=
X-Google-Smtp-Source: ABdhPJx1iob7A+v20uolNb32xkngm5aIuSIbzNL/WksqE5Oc4qpLGPm3oAL6hZx++Kv294Fg29ePRA==
X-Received: by 2002:a17:902:ee09:b029:d5:288d:fce4 with SMTP id z9-20020a170902ee09b02900d5288dfce4mr3327147plb.45.1603967245408;
        Thu, 29 Oct 2020 03:27:25 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id cv6sm2485768pjb.2.2020.10.29.03.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 03:27:24 -0700 (PDT)
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
Date:   Thu, 29 Oct 2020 18:27:16 +0800
Message-Id: <20201029102716.4347-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029023933.24548-4-zhang.lyra@gmail.com>
References: <20201029023933.24548-4-zhang.lyra@gmail.com>
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

