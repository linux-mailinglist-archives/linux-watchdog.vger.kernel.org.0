Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A4C440E44
	for <lists+linux-watchdog@lfdr.de>; Sun, 31 Oct 2021 13:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhJaMZE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 31 Oct 2021 08:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbhJaMZB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 31 Oct 2021 08:25:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282CFC061766
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w15so55105705edc.9
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z4vMRg1vAVSeQbV55CTlWjlCDqRPB9slwpTyoiHK4A0=;
        b=f3T/rIi/etVAeX8RmKrzHok3GaBewveAiH3ErcVAIfklb18owG4ueG2/FWkCDdhNv8
         FHYPoeBsceadrDGC1wh0rbDWA/U2RsIgPcPxnGSt230vdwOBRw7m5dJczhjd2VbVKPsN
         h6x8PUONefWFZalp1YFTHT8zh4Uusyt7FHN8Ks2IBzzmipWR9T63JoeczOYb/WZ0qM9z
         SHk3/DcDztBJLnlnP60fNoCCENo/25dwEy4ndyCK2dQUckeiRE06mELC46UiRNXPF4KY
         CSCt21qBG2R4L3YI6JiRLzQhcvhqZGD5YD62smWhpnYJFIywFD3mLoqwmIJGehViaB6I
         0Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z4vMRg1vAVSeQbV55CTlWjlCDqRPB9slwpTyoiHK4A0=;
        b=teRHts4E5Jj4urS+vK2fZhdkYQEkYf8o3YKwAO2nD1ueS1WncDvi94eJnM1Z3UbX1m
         VnjUH29toLUxpMuqGxEN+8Stte2eldoqiFsLXZ/8zL/T6paRzy1Ru82IvD09F1OSGXJd
         1gLH4jnI5TpBmyJt2bA/ptHnSxamaN/6QfrlZf7Jn6ADVaxm5wYBm9x3N+J0A712sFiu
         T3YGjA1Gy+cMVY2MKoE8+s/gUCdr41ujCCcokLUp95kig3YYSOn8sSi1zkKVxOFNG8d7
         gUHEOVxqMROjSrjX9Iy2/QqboorcpVtMq3E1i13887KrocFM5IXT25ADv4UHxsgENgqF
         yuPw==
X-Gm-Message-State: AOAM5311SRXtL51ySmWo1776sOOdoL71Y6bV8a+G+i50R8DlRCHZlBh/
        K13FPFay3EC1rX/VFQlm4kmj2KIrr9UYMe+9
X-Google-Smtp-Source: ABdhPJyhYWF0HOiJ5n/yQOlDbNXcWBm2pC8rDr77g+qHLPKEx318aNlgaTK/AUPkfTNwj/y5Ei3bag==
X-Received: by 2002:a17:906:7304:: with SMTP id di4mr28024439ejc.179.1635682947741;
        Sun, 31 Oct 2021 05:22:27 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id sh36sm5597473ejc.113.2021.10.31.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:27 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 06/12] watchdog: s3c2410: Extract disable and mask code into separate functions
Date:   Sun, 31 Oct 2021 14:22:10 +0200
Message-Id: <20211031122216.30212-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The s3c2410wdt_mask_and_disable_reset() function content is bound to be
changed further. Prepare it for upcoming changes by splitting into
separate "mask reset" and "disable reset" functions. But keep
s3c2410wdt_mask_and_disable_reset() function present as a facade.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 54 ++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 048ca47d0b8a..4ac0a30e835e 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -202,37 +202,53 @@ static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
 	return container_of(nb, struct s3c2410_wdt, freq_transition);
 }
 
-static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
+static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 {
+	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
+	const u32 val = mask ? mask_val : 0;
 	int ret;
-	u32 mask_val = 1 << wdt->drv_data->mask_bit;
-	u32 val = 0;
 
-	/* No need to do anything if no PMU CONFIG needed */
-	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG))
-		return 0;
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->disable_reg,
+				 mask_val, val);
+	if (ret < 0)
+		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
 
-	if (mask)
-		val = mask_val;
+	return ret;
+}
 
-	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
-		ret = regmap_update_bits(wdt->pmureg,
-				wdt->drv_data->disable_reg,
-				mask_val, val);
-		if (ret < 0)
-			goto error;
-	}
+static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
+{
+	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
+	const u32 val = mask ? mask_val : 0;
+	int ret;
 
-	ret = regmap_update_bits(wdt->pmureg,
-			wdt->drv_data->mask_reset_reg,
-			mask_val, val);
- error:
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
+				 mask_val, val);
 	if (ret < 0)
 		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
 
 	return ret;
 }
 
+static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
+{
+	int ret;
+
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
+		ret = s3c2410wdt_disable_wdt_reset(wdt, mask);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG) {
+		ret = s3c2410wdt_mask_wdt_reset(wdt, mask);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
-- 
2.30.2

