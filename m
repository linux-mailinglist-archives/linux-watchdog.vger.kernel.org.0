Return-Path: <linux-watchdog+bounces-2376-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B73F9B5276
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 20:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E597A1F24056
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 19:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B61206E9D;
	Tue, 29 Oct 2024 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSQ4kbZN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBE206E92
	for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2024 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229098; cv=none; b=CtQVvpMbCyTXHjdiiMU5nNrL46whCkjQPIpYwZZesKwgZF6AEoijeGyeaCVJ7P+wYO7BPZZbc/MXwzD+gzTQaOGGbIooWWY0+RZYs0yWNhjnSrayttvaOXlOsyEv7USde7g2wWSKyLkFNFi2kHZonaQFKAbg0TehvuLFcWba5qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229098; c=relaxed/simple;
	bh=A3EDvAkBsrD1MH46YizbfS4xXWc+4ZiRgWy4gj950+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/+vPJ+v5WLmcdNOyKv9ftB7CvBYKnCdro2TwkVkWQaRLXZLDMWIFV+jb8TjCxzKO4c/p9+nf3V2F+NI5JGyMIjzjRcKt4muH3bv3rWonKFNEB7Mpl8pICnOtImlWTsk6mPNleDUEizr41/CdsWsBXLzqyET5EmExTGzgiysc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSQ4kbZN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431481433bdso56889945e9.3
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2024 12:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730229095; x=1730833895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg+9BLrsm9SBOJJP8ytNsGKOTVgu1Tvrspr3N36bIrM=;
        b=tSQ4kbZN64zIMrB53lopahtZmEGgQ55O7R+aHFCXjsLQOqgyECJafO5evxr7YYoVmI
         2DdK6+gRG6YZ/jJZyqGAem4bgninLqTRRa2Ntp+RPl5a1p1+dYjmrwmyt8R+C+RMIxOi
         dK4wUun6QbDGDDL5iCKZy8lcQrw90XiZVVZ8NAvtR0253Emo0f40SnHMnPLNV7QJ9+D7
         NjC6+kg9PhrZbR2S/9ECUTOJpbhp8wttXEDY100j69i7lViXUu20AM6R0trYu6W3wgQp
         TPYVHP0dlQK8Ic8qC1AVgxCMDwrtsikCYhCRIQ/0y8LbFN+NVcRva+9Yq6LoZ6D08xcl
         z+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229095; x=1730833895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qg+9BLrsm9SBOJJP8ytNsGKOTVgu1Tvrspr3N36bIrM=;
        b=RVnpoCcDLi145rrJdjJoiDtdxdA4BKuj6kr77kqwQ000uG3mP/p4wkCMe4dyzkekp7
         XaRBIZ03Qs0Fm3g9+giS0PZVTwf3VgRsqiaOMbgLpy5GYE8dYPTowqQSjR08eVVvG1Vd
         NgTtobSwSSCPL8JzpEP7Z7I3c5JB//sBCFpadkTBmqiEh6vrbT8fINlHJBJ53W7PXqXJ
         cQ3z6S4TTNyn+Ef9kuLhIRdFzwoPBlL4mescoDP995t2zih3zn2gtoodD9AquNx7h+8+
         Qey4iIBpiSfUUfU+auAzLurU+45GSzwi5l1ExBuitrK6v+kW046eFWhGGQOEeYtUPC4g
         otcg==
X-Gm-Message-State: AOJu0YxnOqYIDsFv/2/JPqoqsihLovtMumLb204VWW3wZG7m1e9z5YvK
	BU7HB4+QxsYfvdhTnyyqZlsZyhx1jF46DkscqlV3SdfVNM48DRTq9K+NeeZOq+8=
X-Google-Smtp-Source: AGHT+IFp4YehJs7QQecchQgE7zUujr1IPc5oNzBTFVOT84j09Z72l+JK7DtHPQFmUWtHpLEwEKBdQw==
X-Received: by 2002:a05:600c:4f85:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-4319ac7408dmr115069765e9.2.1730229094979;
        Tue, 29 Oct 2024 12:11:34 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4724sm13318763f8f.115.2024.10.29.12.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:11:34 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"
Date: Tue, 29 Oct 2024 19:11:31 +0000
Message-ID: <20241029191131.2329414-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.

Now that we can register a SoC specific regmap with syscon using
of_syscon_register_regmap() api we can switch back to using
syscon_regmap_lookup_by_phandle() in the client drivers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/Kconfig       | 1 +
 drivers/watchdog/s3c2410_wdt.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 684b9fe84fff..f3cd402e5795 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -549,6 +549,7 @@ config S3C2410_WATCHDOG
 	tristate "S3C6410/S5Pv210/Exynos Watchdog"
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON if ARCH_EXYNOS
 	help
 	  Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
 	  SoCs. This will reboot the system when the timer expires with
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 686cf544d0ae..349d30462c8c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -24,9 +24,9 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
-#include <linux/soc/samsung/exynos-pmu.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
-		wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
-						 "samsung,syscon-phandle");
+		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
+						"samsung,syscon-phandle");
 		if (IS_ERR(wdt->pmureg))
 			return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
-					     "PMU regmap lookup failed.\n");
+					     "syscon regmap lookup failed.\n");
 	}
 
 	wdt_irq = platform_get_irq(pdev, 0);
-- 
2.47.0.163.g1226f6d8fa-goog


