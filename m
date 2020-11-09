Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0174B2AAFAE
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Nov 2020 04:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgKIDBK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 22:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIDBK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 22:01:10 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFF7C0613CF;
        Sun,  8 Nov 2020 19:01:10 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id h6so5810890pgk.4;
        Sun, 08 Nov 2020 19:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1Lz146A6nS95leFWGrokBi9+iBoyGlmNS4AR/tppXk=;
        b=XkY5oP1XfBAo6UT2hHOz2X4SXc++b5QeDald2o1fm2J1/aA/FoSIbDvqWQ5CHyiMuW
         QdQzAGSqMoTNnpvggSkd2yQUgtl1j+vQyhMe48kMUO+1g7gqE797zz0ov+xhGANQvive
         FqRhWJp9VU4tuCz1EBdvqcKVvi5+fgWtM3vxA4wP7IwqvSLm/af71grk/ZqeVbRnD/IA
         rmU0Vp63rUHnJoUf6pH07RYkU2cfLjBrpM0Gdxbmk4jPiPbnfkNgAZ7MegIAAihPxORa
         HWa44qQKeDDIIThWn1i/U2/fFTq0e2GHNwc2OVktftcz13TcM0ovUol2oIwKNq8cDddf
         HGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1Lz146A6nS95leFWGrokBi9+iBoyGlmNS4AR/tppXk=;
        b=S+7nzmwjshypUclRJf9JkFvqXxz7brKGMKhvgQHzCfaSTHHqRXBFTzOwsI3KC85jt7
         ExH9vjycVEyCYMiq8mUhFU+TdPNWG5+5dcr186Vs2XGfzUcwwiemv8ZyxKbT88u3i56f
         xgLFK/CqdckbF8ssM/15QhYc6G71KQVuJlChuHaLTNDoCKZPhyn0WSOdm3xi/5vMNXq9
         f+nK4T2It7gb9aanq+Kl61Q4O4OJN9zhsaG1M7y8yKKdcjfoPyZqnNV4SB30IOuX8iLS
         VhMJHpvldpXXtJeFfbfH0l+KRZCVnUie0yn2jLedgU2A6GTfRLGnAoSWXF9OiRwlR+UF
         vAlA==
X-Gm-Message-State: AOAM531rr8IUsE1fPuFpWtVC4YUSg1IS4eBGRG3x7ejKoTqD+9G0AGpu
        VU48nSr1xjezzaXWHFOxCEg=
X-Google-Smtp-Source: ABdhPJz4awQC08s3emYNgCco0rrREE7QEOjSTd1IIfOM2f7thz6A+oUw206Ylktq9JqBobTN5iXahA==
X-Received: by 2002:a62:1b58:0:b029:18a:df98:24fa with SMTP id b85-20020a621b580000b029018adf9824famr11812933pfb.25.1604890869696;
        Sun, 08 Nov 2020 19:01:09 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u197sm4344606pfc.127.2020.11.08.19.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 19:01:09 -0800 (PST)
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
Subject: [PATCH v3 2/3] watchdog: sprd: check busy bit before new loading rather than after that
Date:   Mon,  9 Nov 2020 11:00:54 +0800
Message-Id: <20201109030055.27378-3-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109030055.27378-1-zhang.lyra@gmail.com>
References: <20201109030055.27378-1-zhang.lyra@gmail.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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

