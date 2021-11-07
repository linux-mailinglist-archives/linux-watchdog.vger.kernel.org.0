Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF74D4475C4
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbhKGUcv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbhKGUcl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:41 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE23C061766
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:29:57 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y26so31537404lfa.11
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9WvSdbDOGkJMWFwlueKJ7OSnxuu3S90DVplyKp+a4Js=;
        b=OB6JCw3XmoDqOjnlMDJkbVgti6ueJnByCDUtaZnVZv92Goc+QJLtn/vr6QCdjb17mZ
         z7+/6ghtTVY5NEKgKqp5rGORTCjMVLuUMCNkb8NKu8Ra1Cd3QrlFsUkuWiVb08MqEIvZ
         11sE5Xro5Yyq+Zw0jktwSFnCgMJmxLHeFd7w9GcIJSmvX/Abuo8nminRK74nkRSkbKQy
         fqJXqIuV3xMqPvPJgj0IvkMtCnpNWyRm5L0PaTy0Hzl/EeMnex6o2P+3cIlCVjuc0Zaq
         8cIWT5pJScvwa4zH6PJqaM3wRpCcSW84EqjoCb5t3unfykCorAepYxFlGMEequ8sCfoX
         6xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9WvSdbDOGkJMWFwlueKJ7OSnxuu3S90DVplyKp+a4Js=;
        b=AgUTYQlhyLx5dyHpiQbQ7HKPAFrz21Ys0HtkuZNRXv4Yo4pMxnAd3YUPqYNwRzuWjj
         Fdottbp9q5beul5vZtjR27h5xAHXxE8CRgjmpRQQ/0arX+xZh7Qs0FEFbVJGLGLIP/co
         MiOwa70uYv6tL8Y7g2P5im8EkFUQbUVGz53S9wuhDyns5vbZXtBp72fq1bCNkuw1XFYl
         oHxg243khTx6tO6YAtHte7ocKcCvRcOv9kMOLO4Z8ohGwDsPI9dEZuUHfQS6hewyUiT6
         1tQZHz62Aw9lIeH5SVsumATjKhVgq1eKVnqhOu1ytqKWcxkWDWbliczFpnaCQE2QQ5t1
         VmJA==
X-Gm-Message-State: AOAM531mWQYt9n8R6M5zdb0IH83Us8TrkXtE/fmVGmv1ts9c41JWxWIp
        KjX3IvWXwu0vj6W7IJNvvU+h4w==
X-Google-Smtp-Source: ABdhPJyMqo5JVtbOKHlcu+SXEbG0CiLH2F8CqaGM+3Zy8I90GVOq0Cfjc9m9GFiRm47l894XIR6Xgw==
X-Received: by 2002:a05:6512:104e:: with SMTP id c14mr7626046lfb.30.1636316996150;
        Sun, 07 Nov 2021 12:29:56 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b12sm1575370lfb.212.2021.11.07.12.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:55 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 06/12] watchdog: s3c2410: Extract disable and mask code into separate functions
Date:   Sun,  7 Nov 2021 22:29:37 +0200
Message-Id: <20211107202943.8859-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 54 ++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 2cc4923a98a5..4ac0a30e835e 100644
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
-					 wdt->drv_data->disable_reg, mask_val,
-					 val);
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

