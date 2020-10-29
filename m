Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820C929E2DB
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 03:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgJ2CkN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Oct 2020 22:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbgJ2Cju (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Oct 2020 22:39:50 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E6FC0613CF;
        Wed, 28 Oct 2020 19:39:50 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 10so1117219pfp.5;
        Wed, 28 Oct 2020 19:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7NbOGNmndi+rIOnMjLwf3HXt/++0dBdrZmVBPBQ34g=;
        b=A5xB+/FutGcdXYvduIAo37EjD6EBpkv41ZSvP4ueMWBQIzdhI775MuY0AoLI9wEo78
         czxhrglQqtNbXZi8RzE4MVomr9sVBof98HEwu9Dt0Xr4wQvUIIacEkpTJ8PKG8endgzu
         XJj/n0ponTZqGmoS/ohuEXCU1tWU8i9FGsRb6JB7IeN+jEuI5kqAoZ5HytQE/uI/LaII
         41ru6jTq6JQt7U1XhCK41Dbpjw3MnZF7gfVORn4mudpVhrcBB+F3wq731lk93nl2/fwp
         h10rznwQMo/wBUsyDIhe941Rw8fDvx8AHTyz1h6XK4CSLUAwVA/AfdgFcFzLBlcwH2VU
         Wu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7NbOGNmndi+rIOnMjLwf3HXt/++0dBdrZmVBPBQ34g=;
        b=APlh1Ku7JubTSdvvqPk20uglE2e2WfEhwkAoqkypuKMSFoHry4JdfU8K7gekFY2gx6
         jOJAbZzSU8TpWNKUMK2AvNxzfur43EIn6YEM/AQK88KbD14eLp38D9JI2mSAfhiOLbNW
         XNC7yY7btggg5/9H41h/OpV/9k+Dv0WNfhqQZcihJkYU33zwFmb6ylkxsjfnFSX7Omcx
         Yo4Au4O8SNtp7Yf8RSxb5GHf1dB7/FxsekSvBsdDQtmewISfNpp4XfermPaNTjYC3xFg
         DPaXqT2CJ/F+YAJzC5jjH5PO2Iyh9VQq1xLfu+E3NrGngCGKLRw7WHrRO0sJ4sZA++fV
         SuVg==
X-Gm-Message-State: AOAM530NNgFN0OHyh5wRUujMtlcE1BbktKV3/1v5k6jj61dTJKekqKLi
        3vdz3M8JcTAjd9Q+BpnGzm8=
X-Google-Smtp-Source: ABdhPJwwzREFJDVi9JpJMqetkwz7Wg5By86tj65YkpFjAbXnJU9hRp6ZBD/FSK6TI2e1Gw5RVgzvuQ==
X-Received: by 2002:a62:ce45:0:b029:160:764f:a9ac with SMTP id y66-20020a62ce450000b0290160764fa9acmr2074566pfg.29.1603939189921;
        Wed, 28 Oct 2020 19:39:49 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id kr14sm566260pjb.26.2020.10.28.19.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 19:39:49 -0700 (PDT)
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
Subject: [PATCH v2 2/3] watchdog: sprd: check busy bit before new loading rather than after that
Date:   Thu, 29 Oct 2020 10:39:32 +0800
Message-Id: <20201029023933.24548-3-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029023933.24548-1-zhang.lyra@gmail.com>
References: <20201029023933.24548-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Lingling Xu <ling_ling.xu@unisoc.com>

As the specification described, users must check busy bit before start
a new loading operation to make sure that the previous loading is done
and the device is ready to accept a new one.

[ chunyan: Massaged changelog ]

Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/watchdog/sprd_wdt.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index f3c90b4afead..b9b1daa9e2a4 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -108,18 +108,6 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
 	u32 tmr_step = timeout * SPRD_WDT_CNT_STEP;
 	u32 prtmr_step = pretimeout * SPRD_WDT_CNT_STEP;
 
-	sprd_wdt_unlock(wdt->base);
-	writel_relaxed((tmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
-		      SPRD_WDT_LOW_VALUE_MASK, wdt->base + SPRD_WDT_LOAD_HIGH);
-	writel_relaxed((tmr_step & SPRD_WDT_LOW_VALUE_MASK),
-		       wdt->base + SPRD_WDT_LOAD_LOW);
-	writel_relaxed((prtmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
-			SPRD_WDT_LOW_VALUE_MASK,
-		       wdt->base + SPRD_WDT_IRQ_LOAD_HIGH);
-	writel_relaxed(prtmr_step & SPRD_WDT_LOW_VALUE_MASK,
-		       wdt->base + SPRD_WDT_IRQ_LOAD_LOW);
-	sprd_wdt_lock(wdt->base);
-
 	/*
 	 * Waiting the load value operation done,
 	 * it needs two or three RTC clock cycles.
@@ -134,6 +122,19 @@ static int sprd_wdt_load_value(struct sprd_wdt *wdt, u32 timeout,
 
 	if (delay_cnt >= SPRD_WDT_LOAD_TIMEOUT)
 		return -EBUSY;
+
+	sprd_wdt_unlock(wdt->base);
+	writel_relaxed((tmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
+		      SPRD_WDT_LOW_VALUE_MASK, wdt->base + SPRD_WDT_LOAD_HIGH);
+	writel_relaxed((tmr_step & SPRD_WDT_LOW_VALUE_MASK),
+		       wdt->base + SPRD_WDT_LOAD_LOW);
+	writel_relaxed((prtmr_step >> SPRD_WDT_CNT_HIGH_SHIFT) &
+			SPRD_WDT_LOW_VALUE_MASK,
+		       wdt->base + SPRD_WDT_IRQ_LOAD_HIGH);
+	writel_relaxed(prtmr_step & SPRD_WDT_LOW_VALUE_MASK,
+		       wdt->base + SPRD_WDT_IRQ_LOAD_LOW);
+	sprd_wdt_lock(wdt->base);
+
 	return 0;
 }
 
-- 
2.20.1

