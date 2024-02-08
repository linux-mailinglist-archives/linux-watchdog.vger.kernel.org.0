Return-Path: <linux-watchdog+bounces-636-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4932C84E4EE
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Feb 2024 17:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04BE128EA6B
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Feb 2024 16:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A3C7EF10;
	Thu,  8 Feb 2024 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7XS626l"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053D7EEF3
	for <linux-watchdog@vger.kernel.org>; Thu,  8 Feb 2024 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707409290; cv=none; b=O6TOF7WATcyQo9dN/s4xgbUTgdCUC7LaBWVRlo8wAY6Hyc91juxIh9uHr1E3gSIg+CvfLHckRHEHL7io28olotWrl6psDE6MjdnCBhEk25qzxbZGddIVxHCucIsQLDq5RF4KE1sdPitDt0NWvn8/v0EthzrXg7/n69RmJ6HDpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707409290; c=relaxed/simple;
	bh=4BFXoEKq0dKkvxzn8sylQVAACo62MxLym87l7SMkOww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhnWEu5fwjwyuBubavP+zy9iz41ivuVPynHIP8zyWVSAg6+GSuc4wrNGjogvZpPvYraXmLFBzDmo1UMBTPoxYY2kY4g69oKlROEjzgCiNAMsA6wFcXmnepmYlNprAW6Lc5DlAOPKC+yIdbRKynEk+d0xINCBiklMXJwPFPUC++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7XS626l; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33b45e8a670so1108723f8f.3
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Feb 2024 08:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707409287; x=1708014087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxb698xf8QkMydB4z0YB9c3r/9JegaMn6kB+mk5+8LA=;
        b=J7XS626lTjGcri5LhjN1kT1BMZlUZlBR1M7U5MFL5DKLmZOlsVtiS1sKRFyIMDkvkh
         Oa5Sms0tfWuLQ1M1q3YR/q/qHvqUE6MHApSzfOKXUMib2VGWhdTiSwBEmE+4I9LcdXEB
         N8V1Ev63db+q2IqOktK3Cz3fYWHhlE5cVhgVT6kKElakAQk/1PWJIYGeaNjCGxoyXvFa
         aPAMnUOgcJeXAeSsZI05ZgNJaoQgyKro9peSF9IVb5H6QUk+O6z1H/v6p731J9O30HnK
         /IWDYJ/tBGe+Q3YFPiBWf994+jDbYThl/241sH/YURQJ+S9c8lxjSGB4ZqL1QGHK5dbm
         NS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707409287; x=1708014087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxb698xf8QkMydB4z0YB9c3r/9JegaMn6kB+mk5+8LA=;
        b=sx6WwSNnop8DZKUxpIfdSEang6PBb3EAdndKvTbjty1rXQTJVoJJB0pYt0slm9I5RU
         44JCGTr5mNUQkzrEMDcli0KXtJfzhU3VBU7x9VeS6nFMb42i/gesOvFaVahTRUJprt1m
         NiVnfHzz8brzw0BVngLR04aWhkg009Hus/Y7yGsS1vGBqGInnJaIY47E1oNfmLf+zXec
         PvdZrJMKKePTKnx794nnfxFicQhaxktP8seTA2BWdwsGqh33mavfgotWOSXny+sKNq5F
         2oC1nC/42A9+oBQENak7Ha+66tYetWGVAgPlIsf13PriUTIcNhSY2EVwigEoTKo7UlmA
         +lmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4DRZoM52YaQS9YGYxYXfkyyWl6ODSbPnJYbu54Fcbrl45rOIHISxxKc8kbjl4AU4a2ZjIwwANKEShs4C2VvlNQOm1N1tnGu75//yH+jM=
X-Gm-Message-State: AOJu0YzVPnQ/jd2e3oPSZa7SuT5sJLuY+kDjWR/Pb0Kpb1xxgmA+I0a1
	QbLiTFnImaGq8jq8E1EyopOTYas2LSYB8rr/HGitTj9kcEIobK5VIW7+uKZIDsI=
X-Google-Smtp-Source: AGHT+IE9GqRr3/H8i68cQfLtU2iGCsiCKO3R5gWttUZU/5XxgjUSyD0tIivpaca4ynGb4xceQrCnNg==
X-Received: by 2002:adf:f70a:0:b0:33b:37fd:eafe with SMTP id r10-20020adff70a000000b0033b37fdeafemr6274601wrp.69.1707409286849;
        Thu, 08 Feb 2024 08:21:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9QSqiihNfbdq7cJ4HSCgq7fx+xjvtIvCIXg1uNCblGGv7Zg6YsinZ5dEMJMj69hMDubW2XrTIRaH6V7oYBE1TZC8bkhHTFZ934qZoXq6oi9iOrCffZd40IW3EcRm+L5xkK57a7Ppt7kZeBlt+Zygiq57SPJdM37Woe2JsiCVeeDVsUZ1PoCHzxHB8fV14T1Y4zjvsLIZZ+dOzFTPdbMFOEqKU0pavc/Lohx+YQypK/LXXMPXfJQzDyOHL7J89SG4dkdanalvgC5BKGvCY/X5vTD1FzWtH9OKWfwkSTGyU1+bYYNm/uPKfETlFW3FDYzcaJTOrhjWXBxAQUxJreX/KIouUaKXP3vlto6kFlc85D4BApqOxAF6y8nrkPNe3Z+CkorGdR1jj67GzDFZ6Oqq+YR7zLHyiwktg8qnrYK9ImbMJEysPJ4Z73rPDIQ6OfMHQU4azQjrWrYCgXQURS3A7kCr0TOuRJAQPZa0jg+zadEv4d0Er4MQzyY840BGFmVxND9EZ7KD5p8b6G8m5mncaAIxZBGl4+h7lils0U0aYEGw9pNJ0HSkEe78rwZNhMgOiH1uZoKT5FOqrBWYXOeVIEIIX2DqWcvhpGGb8H80inclkduhb+myMYQxfQdW3d/Z94mtwlK/CuyzG22kzc2dlxNwiQalosE+9p0E=
Received: from gpeter-l.lan (host-92-21-139-67.as13285.net. [92.21.139.67])
        by smtp.gmail.com with ESMTPSA id v18-20020adfe4d2000000b0033aedaea1b2sm3915846wrm.30.2024.02.08.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 08:21:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: alexey.klimov@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs
Date: Thu,  8 Feb 2024 16:17:00 +0000
Message-ID: <20240208161700.268570-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240208161700.268570-1-peter.griffin@linaro.org>
References: <20240208161700.268570-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtain the PMU regmap using the new API added to exynos-pmu driver rather
than syscon_regmap_lookup_by_phandle(). As this driver no longer depends
on mfd syscon remove that header and Kconfig dependency.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/Kconfig       | 1 -
 drivers/watchdog/s3c2410_wdt.c | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7d22051b15a2..d78fe7137799 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -512,7 +512,6 @@ config S3C2410_WATCHDOG
 	tristate "S3C6410/S5Pv210/Exynos Watchdog"
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select WATCHDOG_CORE
-	select MFD_SYSCON if ARCH_EXYNOS
 	help
 	  Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
 	  SoCs. This will reboot the system when the timer expires with
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 349d30462c8c..686cf544d0ae 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -24,9 +24,9 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
+#include <linux/soc/samsung/exynos-pmu.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
-		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
-						"samsung,syscon-phandle");
+		wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
+						 "samsung,syscon-phandle");
 		if (IS_ERR(wdt->pmureg))
 			return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
-					     "syscon regmap lookup failed.\n");
+					     "PMU regmap lookup failed.\n");
 	}
 
 	wdt_irq = platform_get_irq(pdev, 0);
-- 
2.43.0.594.gd9cf4e227d-goog


