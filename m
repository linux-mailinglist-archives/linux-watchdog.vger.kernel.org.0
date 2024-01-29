Return-Path: <linux-watchdog+bounces-511-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA4841513
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jan 2024 22:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6E631F25B47
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jan 2024 21:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450731586DA;
	Mon, 29 Jan 2024 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZc/IIkI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD83159569
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Jan 2024 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563169; cv=none; b=jmyJumcEzj5wG1syksTRSvIQL4Rn/KrL0IjMNQvzt4zm3aN/D2AK5k29pLmMYvbG3LYHUdbmeXnLzRiKXFSYUgydv0dfgiGtMkegCnYlzsn0p/Frb/hjeQTwJxSaKVyO9mRr2JdXeSdhb/yZO27QLG3BahCWHLary3vUanlxHNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563169; c=relaxed/simple;
	bh=N/dTvAXukJJ3gcdpKEbrdzFSZE0mfVmJtWEBs7Wr1pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=havNAGbIZFprfn+Hi5s4NHqmVvoWc/OSQX1vXdkh+cf+d9MndJA089UhQIQeMZadyrz5lEE+RJiTORS/7RHOmBaCO9XNh1U2b2He96WuRW/ikJL57CZyUpLb80QeVmzBtZ06rl4MM3sedqgdHVf+SdfGdyXukIcqIVENdkNLJOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZc/IIkI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so38420955e9.3
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jan 2024 13:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706563164; x=1707167964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9S0cbpz+w0Ro+UeWqvavBY4QIBfmENEBk/Ib6o78C0=;
        b=WZc/IIkIqjwgtKKvlgBXT/Bft6YF1xHxevLo1ti3rMzyHyFXm1wC4bR/T2Ye6GR2IH
         Klk93wXU6xu/HMHdluV36naKQMvpU5ZkgCptO39ibAFlpDN8GX1ogc/hEU3si6w2K1Jt
         wCVzQk+cuC8mSBbBNhp8WjPxEL5YtU0H7szvpkWBdLQDru5RTZI35m+4Ie02LFaPteoh
         lyd+ew1w/aAJKugFxtVstVBNC7vp/Q+fBZhlRqTdqMugN33v/iFHMwiaD/Bmr/Gm05RW
         1OpoyA0FVVAZ4hqsSqjGkMcNbLV5o3mJWVM5Ko5wuAVVh+luOxugRpkdgd500gmMOR7n
         VC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706563164; x=1707167964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9S0cbpz+w0Ro+UeWqvavBY4QIBfmENEBk/Ib6o78C0=;
        b=VEKNd0GiX6l3O3J8OuwmJ6+GSKO2fy4UB0OHIvX7KLd328SGwFQm1MrmTGhXa7Hgfc
         Ab1NGCXWLWccG0VDLJ4L/FOTIYJJT+ms/woVbnGogTeqc+c1LR9R315LXaakWO1At3uZ
         2OHS7TVm+hC2l5AGqPoAOidtDxSRn6JQI20gI6G4RajSkn0GVZIxGSWIGVqEcdHHcAbs
         UO5AG/gR5Nbfni8ziy6bHfFFrz55JaRyVtXF5dVYjNAB3OmsFMBDJCC4ELi2joXISXuR
         IhMZBEMazJlWqsbPJ9VV9OJ4qiv2prHhi+EmKHMMKuZhEklkGLrAujh9FdEWBbxR/is5
         7xWg==
X-Gm-Message-State: AOJu0Yw5hKrrg2Dla2Ahakx2Djnj9AE8L/YoLWk48A4YjXhSADVQMlHb
	zy9POkMmXqL8maCECfRflK+dJ7/2pK+64YXptHkE8GIG/oDf7CBS8mcVoezqawU=
X-Google-Smtp-Source: AGHT+IGRgk5GtfOJQyRiGtbxBlTIlUTAyVf6cU6RUUU54aSsEc2ZIIRYWl3+Pb5eH74+lrAfwBsHyA==
X-Received: by 2002:a05:600c:ad0:b0:40e:779f:416 with SMTP id c16-20020a05600c0ad000b0040e779f0416mr6409689wmr.2.1706563164594;
        Mon, 29 Jan 2024 13:19:24 -0800 (PST)
Received: from gpeter-l.lan (host-92-21-139-67.as13285.net. [92.21.139.67])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b0040e3635ca65sm15126928wmb.2.2024.01.29.13.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 13:19:24 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs
Date: Mon, 29 Jan 2024 21:19:12 +0000
Message-ID: <20240129211912.3068411-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129211912.3068411-1-peter.griffin@linaro.org>
References: <20240129211912.3068411-1-peter.griffin@linaro.org>
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

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/Kconfig       | 1 -
 drivers/watchdog/s3c2410_wdt.c | 9 +++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

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
index 349d30462c8c..a1e2682c7e57 100644
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
@@ -699,11 +699,12 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
-		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
-						"samsung,syscon-phandle");
+
+		wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
+						 "samsung,syscon-phandle");
 		if (IS_ERR(wdt->pmureg))
 			return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
-					     "syscon regmap lookup failed.\n");
+					     "PMU regmap lookup failed.\n");
 	}
 
 	wdt_irq = platform_get_irq(pdev, 0);
-- 
2.43.0.429.g432eaa2c6b-goog


