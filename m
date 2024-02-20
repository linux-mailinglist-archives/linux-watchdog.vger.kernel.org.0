Return-Path: <linux-watchdog+bounces-696-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CE85CA66
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Feb 2024 23:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 447CC282DA5
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Feb 2024 22:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A1D1534F8;
	Tue, 20 Feb 2024 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="meEQlzaU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5739152E18
	for <linux-watchdog@vger.kernel.org>; Tue, 20 Feb 2024 22:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708466783; cv=none; b=ZWlRjQ+2UIuwrcaF8OmBxLzWM21zFGDAdojTLGMF2pt7Y321hNSQjJyWLwK/4Sr0o9PW3LsFh9MjMx9p4+q7agzc9WzvmYwY9wprq4s0Do3f/t90F6o0sIDROl3HacPgmPKUNc776MNGSUG2/+ijqzHxrnZmg0PSN1d2tTWDXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708466783; c=relaxed/simple;
	bh=0qlxg4Wl4LV4zmhyFrXH9tW2Y2omtNhqxGLvqo65VnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXqOSwYAHLU7u6HIqLDHUFVyoDmLoI9ANNnpO+KcBW9MMZkJ9f9PDC6dNw8BJX6+3XBSfnDr1LgvHdO6uFTPjHCpuRKSvEiSV7E8Rb6UgbB2sU4xyXfDrkA+w21zAP4wYun/l7WsMH54b1TOYsHt71yGgINRSq9m2FUR3AsGuPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=meEQlzaU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3ee69976c9so238143866b.0
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Feb 2024 14:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708466780; x=1709071580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daii2vCQdv00wY9FjSBPTiVONH9pzRxUrLR+kFtKtA4=;
        b=meEQlzaULVexn+WCqEta3SKhfTZpGxWvDmvRU4Ecd6Li3id1n1LC0el6bdccUEWhpW
         VbpSHtE418jrwI6eyW0taaX0dg1Hw3zfra0oLEiSv2Hz1VLxKzE3P6FxAhfH4PsSuz2t
         xubyCRo9xypCY06e9Zgxj2KbpTW6SusQhOCobKPVY/GFE4wxHpIgeTxXQreIGFsqlM/v
         9c1atNnGDY0yJDGEDzRtTQiPu6EoE9w+3RPidU8Qrrm/v+YwheHAGQaJii/WxIC8/wOP
         4aa4SsnMJrMAr162mDmNb8ZJCtAmOMDJLFfqBTdkybOaSJhFodbK253iOGpnJBbsBF+8
         +A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708466780; x=1709071580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daii2vCQdv00wY9FjSBPTiVONH9pzRxUrLR+kFtKtA4=;
        b=Pi0xtg58dayzuf3uWSTxt7veGKgo7To9JX7xurOB1NSP6mEO0cPNf3Z/nX1NlKTO/U
         Zn15bOjeUaOAT/G/IcoTWGfXVwdJk0b58kzs5q7PZQozeYc6J1rWqZa7n+lYxjbvW58Y
         dg8eN7+aFMjqo6Yc7AA0QM0uHP3jaLMbpjXC8rYRJUhqpERy7ShgDdTZKWSHvlSsnb/c
         QTWyfEFv3j/lkfDgwApDxJ0xvXwVwiZxEKrc0WdYZGQQz9rh3gVIOTyzaJHLF8hmZ00m
         DA9rJM9CosP/yW4dfePaeC/V3RmVxrAZI2r3qF/UaYorF3f2psB53lcyTnMZp+8h+4oK
         qdZA==
X-Forwarded-Encrypted: i=1; AJvYcCUAl7wpyFgdzu+wzlpLm7ZprNxdmd474JkRuKJmas4oAhm2kgTtaAd2VeFjN2EQf9doz25i39yFJUExhf7Vs5SjVSdS2dBbuyV2Vbk98go=
X-Gm-Message-State: AOJu0YyLveZqYBlDgDl4x2J3QwIZJaRWaEm3AZ9PhRoG1vhtM6jNy4tV
	LVxfQMhFqSF1osRo+5ubvQ9eMvX29TANqpjk4SJAuFG8sfZ7RuAC2K0yC46pgOE=
X-Google-Smtp-Source: AGHT+IENoRCzD3oMuUnlMnFJl867ZBn0wakLan0u2FvzSezPfB3YnUQKoLNvYdv4W+5EI7SAuJXN8g==
X-Received: by 2002:a17:906:793:b0:a3f:2703:1c6a with SMTP id l19-20020a170906079300b00a3f27031c6amr585247ejc.51.1708466780215;
        Tue, 20 Feb 2024 14:06:20 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-74-232.as13285.net. [92.18.74.232])
        by smtp.gmail.com with ESMTPSA id r8-20020a170906364800b00a3e4e7ad9dbsm3413771ejb.68.2024.02.20.14.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:06:19 -0800 (PST)
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
Subject: [PATCH v6 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs
Date: Tue, 20 Feb 2024 22:06:13 +0000
Message-ID: <20240220220613.797068-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240220220613.797068-1-peter.griffin@linaro.org>
References: <20240220220613.797068-1-peter.griffin@linaro.org>
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

Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
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
2.44.0.rc0.258.g7320e95886-goog


