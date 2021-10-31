Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1828440E5D
	for <lists+linux-watchdog@lfdr.de>; Sun, 31 Oct 2021 13:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbhJaMZQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 31 Oct 2021 08:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232269AbhJaMZI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 31 Oct 2021 08:25:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6B0C0613B9
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:36 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w15so55106307edc.9
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CjpiH6HuPcd1OZ5BrMJwTEc3/gsNQvS0PrQ1dEXc7Io=;
        b=or2lHaDsNVVO97zwHRkP4RiBFYuiraV70N1/LgQ0wBFr/Jdu1hwpC8WqHfM7NB0lRA
         HTr1bh7UKWsSBsQcnvSQy7Uts9tVANJluWUUh7djar9CWrXIwwb/AM+BS9nipcVMH3jL
         8bGK5tMf7lOUnknCjytvXq3W4UNxI/sl6EKM4MdAVqkkirxkgOyEXGcvE/TvW0xGQlDJ
         x8Fa0skSt9WXiqFCX5QApaYQtk4vuuMZIRLXPils/GVCecFhkbb4H2MYTfPL6H3sefqw
         GLz16sJNaK1xqThxpMTAvFkwEiVVkyq0eezaihiXG+23304BBgWK+o7P2X55sBuQVrVU
         3JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CjpiH6HuPcd1OZ5BrMJwTEc3/gsNQvS0PrQ1dEXc7Io=;
        b=OV1xcWxC/t2QjOmYdMw64sPxI4RJ3dvs9CfipkvtgKhDsrReC3RVZgIgbCpql1LWV1
         ulXmlJU1cNtTVPC8/3Cs9f0h1/f0bS4sHyW+UTcUAv7PZfYpIcNZUvkcheEkqL98le4v
         nqq4kR6Re0rjSR3BqbHTLsb5o2+432v3/d04ePWgWw0Auc1A9O/SODinP3XiBGw/h3jE
         +nsMoV7Bugkz57sjqJX5Q53fWShLB7zsx6vpZhz5wEBFw5ciB9EtPgyvwGp1Y86Fz24X
         hBIBzSZ1cYqEtaB0xt+9RlR+KrDSHBYzJiZURf85Xgk7lPhb7foQEJhcEWw0WTRINA9Q
         y0Cw==
X-Gm-Message-State: AOAM5300LUHhGMChGg7VWdXvRUiURuD/0eETxgRVP5WSOmAXL+Nl5T4L
        LlNckPhhshCJXZpU3BYg5JHwtQ==
X-Google-Smtp-Source: ABdhPJy54Pbe/nTge52lDsP1R5TWLciCeqw8ibvHYioX2azue9qihln/nXwaVfizYOKVsWxi+KXwFg==
X-Received: by 2002:a17:907:3fa5:: with SMTP id hr37mr30507519ejc.417.1635682955297;
        Sun, 31 Oct 2021 05:22:35 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m12sm3994046ejj.63.2021.10.31.05.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 11/12] watchdog: s3c2410: Remove superfluous err label
Date:   Sun, 31 Oct 2021 14:22:15 +0200
Message-Id: <20211031122216.30212-12-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

'err' label in probe function is not really need, it just returns.
Remove it and replace all 'goto' statements with actual returns in
place.

No functional change here, just a cleanup patch.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index c733917c5470..8fdda2ede1c3 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -588,22 +588,18 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (wdt_irq == NULL) {
 		dev_err(dev, "no irq resource specified\n");
-		ret = -ENOENT;
-		goto err;
+		return -ENOENT;
 	}
 
 	/* get the memory region for the watchdog timer */
 	wdt->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(wdt->reg_base)) {
-		ret = PTR_ERR(wdt->reg_base);
-		goto err;
-	}
+	if (IS_ERR(wdt->reg_base))
+		return PTR_ERR(wdt->reg_base);
 
 	wdt->bus_clk = devm_clk_get(dev, "watchdog");
 	if (IS_ERR(wdt->bus_clk)) {
 		dev_err(dev, "failed to find bus clock\n");
-		ret = PTR_ERR(wdt->bus_clk);
-		goto err;
+		return PTR_ERR(wdt->bus_clk);
 	}
 
 	ret = clk_prepare_enable(wdt->bus_clk);
@@ -720,7 +716,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
  err_bus_clk:
 	clk_disable_unprepare(wdt->bus_clk);
 
- err:
 	return ret;
 }
 
-- 
2.30.2

