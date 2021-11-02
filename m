Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8F6442B9C
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Nov 2021 11:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhKBK3h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Nov 2021 06:29:37 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34058
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229577AbhKBK3g (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Nov 2021 06:29:36 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 851703F1AD
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Nov 2021 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635848821;
        bh=z7iR2z2NcJ9akwvGR6IqY6ukUGo8KAYdmWM+4kNqiCM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ol0FXBj8QQm4b9PO8lVgI6/DPLPXaUEWqwoZ7r/enL8zBo7jw15gY8LE0NzlrDxCU
         R/nKDchbnpygPqHhq9nBS8TpiKK0y6ghj7Z5lPr5ZiBO+i10SkwgyAuSWXWtaqdCQt
         bWCoFBlIfgG1oLLwW4rD+M9mpBqs64a+C4QHEYzO4jsmpCIttCTVYbM1J633u3aBn5
         Eq3aI6K5ULO+/I3lUWzO0F/FFh9FGcK5PZdBqqver/WWL5zN5mNYm7lexfqG642kF5
         V32q3b5QxXWWAClnw2y78p6Ux1xtwuUp13AI4VqcLXYbW4kvqnxm+GVj5hJVzu/pjP
         2oJwBd04pduww==
Received: by mail-lf1-f72.google.com with SMTP id bq29-20020a056512151d00b003ffce2467adso6854166lfb.3
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Nov 2021 03:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z7iR2z2NcJ9akwvGR6IqY6ukUGo8KAYdmWM+4kNqiCM=;
        b=UxLcjXPmQ06cYlhEfM5Hqz/bIIYUOEz7eqMN9bBFjdaUJ0ptuSGp0+Oibftuz0Wz4E
         gxZTznhWieOuKdhampnJxDAtYXhq9xWOvA9ie00DdXVz/Wau8agd906Vp+BCTXGGJT9q
         y0MeGH5Oum339DD7NtKr82r0xRoQydvdKKP0j5k8yBnVhsdhf9y7pnWeT7tXkoifXVvr
         yrI/rEiRd/kP3+GjtGKxabkiavXYGlNpqpiSsRkwEqW1ji1V3sOT0lhuYgFCaqi8McEI
         etdS0lJBzvmN167nD38BUXVWo9g9NEgfa+fUmyRGnhecSJ1oapXHl+DV8RxqN5wUv+CP
         k8+w==
X-Gm-Message-State: AOAM532hS+GJMo8qvsbW2k6X/oWBDmRbg0IDmDjosOPf7v4qiXOGgHXX
        pBbJLUruI8pxxDHRVjz4iDIhIPeRaor7ch+GSEk8ca3UuhCsxJ9EsXrG0kOb5Vzis2IhBal1OrI
        xgtDN3bTCaWJAMMG3K6+sRYttw1ahETAD8G7if1PIpU7M
X-Received: by 2002:a2e:9c7:: with SMTP id 190mr6786849ljj.91.1635848820894;
        Tue, 02 Nov 2021 03:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9RXSO6O8i0cxbH6VeQ1bTaNuMb4C0T926QQaLyS4vIwYlPhOOokjb14C5NjX5TMoM8ZdeuA==
X-Received: by 2002:a2e:9c7:: with SMTP id 190mr6786816ljj.91.1635848820636;
        Tue, 02 Nov 2021 03:27:00 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h1sm1642556lfu.277.2021.11.02.03.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 03:27:00 -0700 (PDT)
Message-ID: <02e4cd1f-47bf-9bc7-b46c-b6c30943c0b7@canonical.com>
Date:   Tue, 2 Nov 2021 11:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 12/12] watchdog: s3c2410: Add Exynos850 support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-13-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-13-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> Exynos850 is a bit different from SoCs already supported in WDT driver:
>   - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
>     always 0; .disable_auto_reset callback is not set for that reason
>   - MASK_WDT_RESET_REQUEST register is replaced with
>     CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
>     reset interrupt it's now enabled with the same value; .mask_reset
>     callback is reused for that functionality though
>   - To make WDT functional, WDT counter needs to be enabled in
>     CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
>     callback
> 
> Also Exynos850 has two CPU clusters, each has its own dedicated WDT
> instance. Different PMU registers and bits are used for each cluster. So
> driver data is now modified in probe, adding needed info depending on
> cluster index passed from device tree.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Used single compatible for Exynos850, populating missing driver data in
>     probe
>   - Added "index" property to specify CPU cluster index
> 
>  drivers/watchdog/s3c2410_wdt.c | 68 +++++++++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 8fdda2ede1c3..457b725c30ac 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -56,6 +56,14 @@
>  #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
> +#define EXYNOS850_CLUSTER0_NONCPU_OUT		0x1220
> +#define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
> +#define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
> +#define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
> +
> +#define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
> +#define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
> +
>  #define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
>  #define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
>  #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
> @@ -171,6 +179,21 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
> +static const struct s3c2410_wdt_variant drv_data_exynos850 = {
> +	/*
> +	 * Next fields will be set in probe(), based on cluster index:
> +	 *   - .mask_reset_reg
> +	 *   - .rst_stat_bit
> +	 *   - .cnt_en_reg
> +	 */
> +	.mask_reset_inv = true,
> +	.mask_bit = 2,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] = {
>  	{ .compatible = "samsung,s3c2410-wdt",
>  	  .data = &drv_data_s3c2410 },
> @@ -182,6 +205,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos5420 },
>  	{ .compatible = "samsung,exynos7-wdt",
>  	  .data = &drv_data_exynos7 },
> +	{ .compatible = "samsung,exynos850-wdt",
> +	  .data = &drv_data_exynos850 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -548,15 +573,51 @@ static inline const struct s3c2410_wdt_variant *
>  s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>  {
>  	const struct s3c2410_wdt_variant *variant;
> +	struct s3c2410_wdt_variant *data;
> +	struct device *dev = &pdev->dev;
>  
> -	variant = of_device_get_match_data(&pdev->dev);
> +	variant = of_device_get_match_data(dev);
>  	if (!variant) {
>  		/* Device matched by platform_device_id */
>  		variant = (struct s3c2410_wdt_variant *)
>  			   platform_get_device_id(pdev)->driver_data;
>  	}
>  
> -	return variant;
> +	/* Have to copy driver data over to keep its const qualifier intact */
> +	data = devm_kmemdup(dev, variant, sizeof(*variant), GFP_KERNEL);
> +	if (!data)
> +		return NULL;
> +
> +	/* Populate missing fields for Exynos850 w.r.t. cluster index */
> +	if (variant == &drv_data_exynos850) {
> +		u32 index;
> +		int err;

Another approach is to:
1. Define two variants for Exynos850 (s3c2410_wdt_variants), kind of
like before,
2. if (variant == &drv_data_exynos850)
a. Read the index
b. If index is 0, return first variant,
c. If index is 1, return the second variant,
d. Else - NULL.

This way you won't need to copy the memory on the fly, just use
different const data. Benefits: less memory allocations, entire drvdata
set in one place (so nicely visible), drvdata populated safely via const.

> +
> +		err = of_property_read_u32(dev->of_node, "samsung,index",
> +					   &index);
> +		if (err) {
> +			dev_err(dev, "failed to get cluster index\n");
> +			return NULL;
> +		}
> +
> +		switch (index) {
> +		case 0:
> +			data->mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN;
> +			data->rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT;
> +			data->cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT;
> +			break;
> +		case 1:
> +			data->mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN;
> +			data->rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT;
> +			data->cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT;
> +			break;
> +		default:
> +			dev_err(dev, "wrong cluster index: %u\n", index);
> +			return NULL;
> +		}
> +	}
> +
> +	return data;
>  }
>  
>  static int s3c2410wdt_probe(struct platform_device *pdev)
> @@ -576,6 +637,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device = s3c2410_wdd;
>  
>  	wdt->drv_data = s3c2410_get_wdt_drv_data(pdev);
> +	if (!wdt->drv_data)
> +		return -EINVAL;
> +
>  	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
>  		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
>  						"samsung,syscon-phandle");
> 


Best regards,
Krzysztof
