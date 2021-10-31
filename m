Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE34440E4B
	for <lists+linux-watchdog@lfdr.de>; Sun, 31 Oct 2021 13:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhJaMZG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 31 Oct 2021 08:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbhJaMZE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 31 Oct 2021 08:25:04 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63279C061764
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id s1so55008904edd.3
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GkPlDHcYhDfdRgeqEWGfcOpu0nJiBfn8YkWrsXr9/Bk=;
        b=ojuc5cHUFuy+wUSGdRT+SUciRHnPA3T80OsTrbn+0ySKDR+eI2Yzama0nT0hrzrV+z
         nKXojTI81fSXthk+VYayuaPCzHRI/Vq48+iZHGwWUKe5sHaOWjP0GP9Ce7Glxvqxi9tq
         7unDeGKkoGXv4YMyI9qfYMUpjgUDfmBtjFbttk3t4qL9o5KNQ/8wJA12jNLsNlJWVC4d
         G99DHIoFBA08wOmc/R+0HbGWaVc/mO0QL6LxeV2n8xg6603DOp4ahxUVmvdQuO4BL4dM
         8+zYtCldTjL2Cj6VTUNX1QG2uycDR3F4hlSEaF8pI7a4xzZ/KfxKvlNBGw0/MqPBmVXY
         99yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GkPlDHcYhDfdRgeqEWGfcOpu0nJiBfn8YkWrsXr9/Bk=;
        b=dcJ+75JOx+iARgFiri6JYSSrrKCuLn12SpThFgL3k5fj9+dEaFBURrbH3OaESh3rIq
         +qUdU2nZAC8/A64Upgt2/gbrD152eL2QW60ePw6asu51Fkv4BdzEadZyF1EqAuv/8sko
         5kAN60prH2eLDiZdNsFNlsqPgvRAEQp3DwkO4GzGTW6uMyX2gLSU2WRgLQAEGIj2hm7p
         eBeeu3HMF7nqDd9fDDKVunmNxbafb29mKA//rkASDGzzoeCgaCiS2XuikvdBZLrvNxs1
         lq1p+DNgLTgZapGyDOObaV3wTpGisSEnjUj8JP2EmdyncJHPLZ5Q7Id2ZH21RIO8TSe4
         YVtQ==
X-Gm-Message-State: AOAM5314cWUSzuFvfQCJ8q2DrWG7al4IlHGj3OxvOS8/okzWy6ySPjSz
        DJe+uXBGUH9u/o5PzCuceSxr0g==
X-Google-Smtp-Source: ABdhPJzyCkVQM9iQweT+sUTK6AeywY0oMC6urW5iTK7KK+uSwmjquwnahvQEYz2ItInIZukm5Eh1Nw==
X-Received: by 2002:a50:bf01:: with SMTP id f1mr32322256edk.102.1635682950870;
        Sun, 31 Oct 2021 05:22:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id y15sm6293348edd.58.2021.10.31.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:30 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 08/12] watchdog: s3c2410: Add support for WDT counter enable register
Date:   Sun, 31 Oct 2021 14:22:12 +0200
Message-Id: <20211031122216.30212-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On new Exynos chips (e.g. Exynos850) new CLUSTERx_NONCPU_OUT register is
introduced, where CNT_EN_WDT bit must be enabled to make watchdog
counter running. Add corresponding quirk and proper infrastructure to
handle that register if the quirk is set.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Used quirks instead of callbacks for all added PMU registers
  - Used BIT() macro
  - Extracted cleanup code to separate patch to minimize changes and
    ease the review and porting

 drivers/watchdog/s3c2410_wdt.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 2a61b6ea5602..ec341c876225 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -60,11 +60,13 @@
 #define QUIRK_HAS_RST_STAT			(1 << 1)
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
+#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
 						 QUIRK_HAS_RST_STAT | \
-						 QUIRK_HAS_PMU_AUTO_DISABLE)
+						 QUIRK_HAS_PMU_AUTO_DISABLE | \
+						 QUIRK_HAS_PMU_CNT_EN)
 
 static bool nowayout	= WATCHDOG_NOWAYOUT;
 static int tmr_margin;
@@ -98,6 +100,8 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
  * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
  * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
  * reset.
+ * @cnt_en_reg: Offset in pmureg for the register that enables WDT counter.
+ * @cnt_en_bit: Bit number for "watchdog counter enable" in cnt_en register.
  * @quirks: A bitfield of quirks.
  */
 
@@ -108,6 +112,8 @@ struct s3c2410_wdt_variant {
 	int mask_bit;
 	int rst_stat_reg;
 	int rst_stat_bit;
+	int cnt_en_reg;
+	int cnt_en_bit;
 	u32 quirks;
 };
 
@@ -233,6 +239,20 @@ static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 	return ret;
 }
 
+static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
+{
+	const u32 mask_val = BIT(wdt->drv_data->cnt_en_bit);
+	const u32 val = en ? mask_val : 0;
+	int ret;
+
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->cnt_en_reg,
+				 mask_val, val);
+	if (ret < 0)
+		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
+
+	return ret;
+}
+
 static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
 {
 	int ret;
@@ -249,6 +269,12 @@ static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
 			return ret;
 	}
 
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
+		ret = s3c2410wdt_enable_counter(wdt, !mask);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.30.2

