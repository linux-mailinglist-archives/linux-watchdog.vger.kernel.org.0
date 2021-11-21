Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB5F458511
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Nov 2021 17:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238507AbhKURAI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 12:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238496AbhKURAG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:06 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03349C061748
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:01 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id t26so68944113lfk.9
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w/ReIV9vPB+SlV62g0/7W7w+YosGosPLABDbJjtZop0=;
        b=YSdnJYW/oiUpy6rnmhc7QbCWuopiisa+YOVQXuiJixMUSsN9wUgVCcX2diI8gN/5LB
         6yZqB3gSay4/MYBVrC+8B5f7y0CTV4BD6dMa1e6B3Ox1f0i1h6xxhFh1jnrzpRSde8GS
         yk96729F34/ijiTL+Q4xI9tcrFBnoChpmpgHd902lnpLYtFuUegHDW5pVWLDfuNaZHfT
         x/yBm0u9yOvvs3wBVvvi8Y1vSs9Hpp1DqmeAeLItw7LfYebqDTpmgZDx2T+S7i6/8V9p
         9DRiSl+N12Kd+Sw1DlgEL+RL5pNJHiqnHKlxmb4d8xG4z7xbq9rEogud4q5ncQKP8VZ7
         lfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w/ReIV9vPB+SlV62g0/7W7w+YosGosPLABDbJjtZop0=;
        b=AsejNbVErzqrSDC5iSKHOgur4sYUX6iygzoYmsUVMU2iJUsVBh/KAIB/xhuDZobDgP
         CZPppyAwx6s25DhKoRRmnS0kI07iJQ51i9YbHygAtAX1uIiAB4T+cykAK4/Sy+dJnkRu
         MF3Kb04F/efMUe69HpGUWAsV3mngFQdGXl6u0CeXo1AcTKOM1PE4L9JYiHDqM9e/BcIa
         mITDdHRF/0fx8jgD/bdG1xZH+sXSv8R7SnPHWTNswfhrBq659XrYhkbRHFjSKeveWxEU
         Hs3KGJLp6exWFvPnpoi5eP6LUflNVcdr8ZMna82SxTmksJPSWRM4uz2ntfnRTGk5IyWr
         mdKQ==
X-Gm-Message-State: AOAM533skpzx41UWmkp4jmXMvP+e5dYijQrr7sW9ufIIraude9QxrHui
        SBDKhJBTnkQXIVr4AX5pSh7NBA==
X-Google-Smtp-Source: ABdhPJxES9MI06twnz6pLMWUtyv7RPFPskZMiKkvFzExPfiH40MdmiiwPMiKizWmOQ+yLBJlXhUQlQ==
X-Received: by 2002:a2e:8e88:: with SMTP id z8mr42983183ljk.197.1637513819129;
        Sun, 21 Nov 2021 08:56:59 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w5sm692277lfd.198.2021.11.21.08.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:58 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 06/12] watchdog: s3c2410: Extract disable and mask code into separate functions
Date:   Sun, 21 Nov 2021 18:56:41 +0200
Message-Id: <20211121165647.26706-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

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

