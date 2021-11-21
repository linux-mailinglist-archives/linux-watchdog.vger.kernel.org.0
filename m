Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C11445852A
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Nov 2021 17:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238435AbhKURBU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 12:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237304AbhKURAB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:01 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E09C061714
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:56:55 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b1so68822383lfs.13
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avAIqxonoUpxUgZ8evBQJpwJeOjfCUq9oOQFKLq1vLw=;
        b=l8/nixacKiaxqNeKCxYAE0IUTq5hEDB8TTXvtvby/62PVSbNYfYY6252ILQpVGtR7i
         sbemH3A5gPoGfbrUD6LEW5wIvv6tC1kb1A0t7BeDEdUIMRdwCB1hjNGnjc+9H9rCRsNk
         DXXISrdJn5HHIZXbdLJHiG7Y9ItMeM9TZ/ES3JmOx0e9G2qGzUZuOSe92a6M6u1aOFXF
         R22l12gpRGIxgeJkSiXfNQEeK9ADL6+2q2qrx6U5YawFgqS88WzYpaQkcQoT9LLaob7N
         eOcCpXMC44QyGjOw6QQmYqcDhm4wHPqsDR75s6Mh7apWxp9VUt9JGFwMxszPSsQmLQuf
         wyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=avAIqxonoUpxUgZ8evBQJpwJeOjfCUq9oOQFKLq1vLw=;
        b=lvRKQf2zZPbolvniXZiZVUmWjH4ITUtaAlIfyxzcxX2nKOxyXqGgO/p623Gock7wH2
         R+r6z5nKgKui00JyoL8XSlo/oeoRHNSnAelUWeJKEEfgORJu2qm7Pl8LGJwWsE1XsC4Z
         UrT3A0Yx75xomqiPdReV7lYzeFR4Wku87wsUzNIumH0/HluhNji2meDF1bWk/+Do8jDK
         pZN+R07aAMX9QDWyejYcmzToBLtL60CHt72ez/QKd2CzKRXne10s3/mby4YuPQjOXcJs
         mtdvVf1rdD2fR7GVJEvrm/Cu5DsLtmfMtg4+g899hI58CQOp90s+wAc6LmD6JQ8EYOZs
         vELg==
X-Gm-Message-State: AOAM532Z/7CbpiWFVCUTsCIbqZ2hRIqI6HIy/gxcjdjOzBKO2y0h8cHy
        g8Pg3Q7q3opPAGldQOFK+G/9FA==
X-Google-Smtp-Source: ABdhPJwYEKjZatumNr73KLVhsFjF7ggTEf2VUTH3bcl9kKsPaJy+T2FEelvbOp4Uw4qCh4SilM5EBQ==
X-Received: by 2002:a05:651c:2dd:: with SMTP id f29mr44338195ljo.464.1637513814116;
        Sun, 21 Nov 2021 08:56:54 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id s15sm688642lfp.252.2021.11.21.08.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:53 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 03/12] watchdog: s3c2410: Fail probe if can't find valid timeout
Date:   Sun, 21 Nov 2021 18:56:38 +0200
Message-Id: <20211121165647.26706-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Driver can't work properly if there no valid timeout was found in
s3c2410wdt_set_heartbeat(). Ideally, that function should be reworked in
a way that it's always able to find some valid timeout. As a temporary
solution let's for now just fail the driver probe in case the valid
timeout can't be found in s3c2410wdt_set_heartbeat() function.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 2395f353e52d..00421cf22556 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -515,7 +515,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	struct s3c2410_wdt *wdt;
 	struct resource *wdt_irq;
 	unsigned int wtcon;
-	int started = 0;
 	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
@@ -581,15 +580,15 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
 					wdt->wdt_device.timeout);
 	if (ret) {
-		started = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
-					S3C2410_WATCHDOG_DEFAULT_TIME);
-
-		if (started == 0)
-			dev_info(dev,
-				 "tmr_margin value out of range, default %d used\n",
+		ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
+					       S3C2410_WATCHDOG_DEFAULT_TIME);
+		if (ret == 0) {
+			dev_warn(dev, "tmr_margin value out of range, default %d used\n",
 				 S3C2410_WATCHDOG_DEFAULT_TIME);
-		else
-			dev_info(dev, "default timer value is out of range, cannot start\n");
+		} else {
+			dev_err(dev, "failed to use default timeout\n");
+			goto err_cpufreq;
+		}
 	}
 
 	ret = devm_request_irq(dev, wdt_irq->start, s3c2410wdt_irq, 0,
@@ -613,10 +612,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_unregister;
 
-	if (tmr_atboot && started == 0) {
+	if (tmr_atboot) {
 		dev_info(dev, "starting watchdog timer\n");
 		s3c2410wdt_start(&wdt->wdt_device);
-	} else if (!tmr_atboot) {
+	} else {
 		/* if we're not enabling the watchdog, then ensure it is
 		 * disabled if it has been left running from the bootloader
 		 * or other source */
-- 
2.30.2

