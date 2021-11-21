Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E018C458518
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Nov 2021 17:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238708AbhKURA1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 12:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238450AbhKURAM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:12 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C713C061574
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:07 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id t26so68944871lfk.9
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OvsJs1z0EoONBkIDY+ObaS2w1FG1p8iBA+QuP/XaAVQ=;
        b=KG8ssA5Kc7reiTXrtmxuu4rwOsqFJ1zwZBv0omvoQmGTDBU6F4QK5tEJLm3ZMMPsk9
         EaaUDApM9BvNIwHysE2xFONLZSVOJxMMw+ezSp8V+u2N2Xy0WBXdwV9IYWMkj0JQcZfw
         lqjD7yViA5XhNfZoEPEplJM4bZOHXyDy/RQPXnXqakZwHfAw6tIXggsYdoH9SB9lNXdz
         RUCNKRdIzxCkkNsW9Q9BdXPP0Gk7t+DiuOk4lZ6nKf1i299e2SsU7FUcHRmDH56XNpy1
         wyYSkoBeXm2Pgfr5DXeJjlNuGcoWMnq2dQua1FSBn7RBpIEc10y1iTwDGss4/7og8Ksx
         JLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OvsJs1z0EoONBkIDY+ObaS2w1FG1p8iBA+QuP/XaAVQ=;
        b=SC/6LrSERqMIdyVNY17qECZNCsgXW0J7iW8Lg8rVnZU12T9fDFua9VQ1F57ttrXMTO
         23no7a0SMZs0uJb8nYj7KQds8gmJkzmvFBQNsaWf6TsJFkDI41vQ7D3/MjaURS2pxKuX
         R0PqTtcHp9+at4LWLEjXJwhfwlmjP9DjD4f0gLoXb8WFb5NmFYlar0NavPjCoHtRUNsU
         KHX0DJq7K+lxyPQbGNWaOPvoS7IEa8uhS47zigVcv1L48n9b3Ld2NyoUFMLxv5x6VdIU
         0Iu9SHrYvoHXQ2LRhM+pHMX2RsAIPZ4iMI/6aG7U1xP2KkWI/RB1uOKevKA/KHMaR6Lr
         Hkpw==
X-Gm-Message-State: AOAM533sCsghxZMY6adidCzYTin4MH2F5PWIFHEPQofQEbNY6CPOpFvF
        ichAjabB+fLW4CwyJkQV3Md98w==
X-Google-Smtp-Source: ABdhPJyrLxWCL2sDnS/NRjmzmAyRKHEG2ZP2KMfZyZ8hYmRvR0OQNp/JpF+prD97Dsl7IsGB40U6jQ==
X-Received: by 2002:a05:6512:ac5:: with SMTP id n5mr47282435lfu.246.1637513825612;
        Sun, 21 Nov 2021 08:57:05 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q6sm693228lfa.267.2021.11.21.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:57:05 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 10/12] watchdog: s3c2410: Support separate source clock
Date:   Sun, 21 Nov 2021 18:56:45 +0200
Message-Id: <20211121165647.26706-11-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Right now all devices supported in the driver have the single clock: it
acts simultaneously as a bus clock (providing register interface
clocking) and source clock (driving watchdog counter). Some newer Exynos
chips, like Exynos850, have two separate clocks for that. In that case
two clocks will be passed to the driver from the resource provider, e.g.
Device Tree. Provide necessary infrastructure to support that case:
  - use source clock's rate for all timer related calculations
  - use bus clock to gate/ungate the register interface

All devices that use the single clock are kept intact: if only one clock
is passed from Device Tree, it will be used for both purposes as before.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Removed has_src_clk field: clk framework can handle NULL clk; added
    s3c2410wdt_get_freq() function instead, to figure out which clock to
    use for getting the rate

Changes in v2:
  - Reworded commit message to be more formal
  - Used separate "has_src_clk" trait to tell if source clock is present
  - Renamed clock variables to match their purpose
  - Removed caching source clock rate, obtaining it in place each time
    instead
  - Renamed err labels for more consistency

 drivers/watchdog/s3c2410_wdt.c | 56 +++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index f211be8bf976..f31bc765a8a5 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -153,7 +153,8 @@ struct s3c2410_wdt_variant {
 
 struct s3c2410_wdt {
 	struct device		*dev;
-	struct clk		*clock;
+	struct clk		*bus_clk; /* for register interface (PCLK) */
+	struct clk		*src_clk; /* for WDT counter */
 	void __iomem		*reg_base;
 	unsigned int		count;
 	spinlock_t		lock;
@@ -231,9 +232,14 @@ MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
 
 /* functions */
 
-static inline unsigned int s3c2410wdt_max_timeout(struct clk *clock)
+static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
 {
-	unsigned long freq = clk_get_rate(clock);
+	return clk_get_rate(wdt->src_clk ? wdt->src_clk : wdt->bus_clk);
+}
+
+static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
+{
+	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
 	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
 				       / S3C2410_WTCON_MAXDIV);
@@ -383,7 +389,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 				    unsigned int timeout)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
-	unsigned long freq = clk_get_rate(wdt->clock);
+	unsigned long freq = s3c2410wdt_get_freq(wdt);
 	unsigned int count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
@@ -632,26 +638,42 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	wdt->clock = devm_clk_get(dev, "watchdog");
-	if (IS_ERR(wdt->clock)) {
-		dev_err(dev, "failed to find watchdog clock source\n");
-		ret = PTR_ERR(wdt->clock);
+	wdt->bus_clk = devm_clk_get(dev, "watchdog");
+	if (IS_ERR(wdt->bus_clk)) {
+		dev_err(dev, "failed to find bus clock\n");
+		ret = PTR_ERR(wdt->bus_clk);
 		goto err;
 	}
 
-	ret = clk_prepare_enable(wdt->clock);
+	ret = clk_prepare_enable(wdt->bus_clk);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable clock\n");
+		dev_err(dev, "failed to enable bus clock\n");
 		return ret;
 	}
 
+	/*
+	 * "watchdog_src" clock is optional; if it's not present -- just skip it
+	 * and use "watchdog" clock as both bus and source clock.
+	 */
+	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
+	if (!IS_ERR(wdt->src_clk)) {
+		ret = clk_prepare_enable(wdt->src_clk);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable source clock\n");
+			ret = PTR_ERR(wdt->src_clk);
+			goto err_bus_clk;
+		}
+	} else {
+		wdt->src_clk = NULL;
+	}
+
 	wdt->wdt_device.min_timeout = 1;
-	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->clock);
+	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
 	ret = s3c2410wdt_cpufreq_register(wdt);
 	if (ret < 0) {
 		dev_err(dev, "failed to register cpufreq\n");
-		goto err_clk;
+		goto err_src_clk;
 	}
 
 	watchdog_set_drvdata(&wdt->wdt_device, wdt);
@@ -729,8 +751,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
  err_cpufreq:
 	s3c2410wdt_cpufreq_deregister(wdt);
 
- err_clk:
-	clk_disable_unprepare(wdt->clock);
+ err_src_clk:
+	clk_disable_unprepare(wdt->src_clk);
+
+ err_bus_clk:
+	clk_disable_unprepare(wdt->bus_clk);
 
  err:
 	return ret;
@@ -749,7 +774,8 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 
 	s3c2410wdt_cpufreq_deregister(wdt);
 
-	clk_disable_unprepare(wdt->clock);
+	clk_disable_unprepare(wdt->src_clk);
+	clk_disable_unprepare(wdt->bus_clk);
 
 	return 0;
 }
-- 
2.30.2

