Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A02458050
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Nov 2021 21:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhKTUco (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Nov 2021 15:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbhKTUcn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Nov 2021 15:32:43 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2FBC061574;
        Sat, 20 Nov 2021 12:29:40 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bf8so28987614oib.6;
        Sat, 20 Nov 2021 12:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZDrGzH3m3kCQZZzzRryqaMclRzMqAO2y432BfChnYk8=;
        b=XyP6cSJbipHbGuKp/9x5pZQk32XgCfy+4W/wmwSUCJkRP7agFSQE1OAvjhqWz6UJfP
         RU5iU+egBBFyvIWr3DNg7s+AhY9Tfom1RNaqlaF+uRw4Cb5pLT6IJ4BF/ywBzlzvQpgJ
         d7OqnK1hYuTqRQ0wPkSEKMZm0yOuu1TAH46/eLnbD6+ci4e0saaF4UK0XbQH1RgnpDGR
         tmhHV5cjV7416DwD9ig0cyxRcdrIIYyE2suuU+B3E52HVk3UttUX/wLFT3Q5NuKKHCtr
         n95v0fOHZ3aNokTwkT3zzeP8M8ZuhI1ENZqeQUiJw9CANKnacCbYrjtV1Snm+zXAXTsg
         DaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZDrGzH3m3kCQZZzzRryqaMclRzMqAO2y432BfChnYk8=;
        b=vSONcMF0deynHOnrAaJDBT6ZNCUqNxsLJK55vxj+xg05aP4QgA1arGMk7CXPEuNHPu
         0x2lyg20hOpPuYzzPl3Xt0kSpddXcA/oMMOKiBO79oNNX7vfy40P/61cwekYiw56ghAL
         118/GmoEMQhlJwNuid9B2XT8m8HM57am3JrIdWmCe2fTeSyeUuPoYOheEE9r2g6ruuGe
         aKWi8QV+McZB3Lt7hCFDjKNMg1J3FvAyQ3LDrKcN2J65ZIyUafvvie6+akVBnjrCnSde
         MjFoL4DcGz+ur/hFoQnw8DFcMXS65bJz8CnMGUJaOTDiwn7q2E2i/jn3+krL3IbCUFji
         KkRQ==
X-Gm-Message-State: AOAM530b3JcAyTzqrRjsIHQ0ZhbJbBkogjm7Ve1ltm0zVCW/54DbjbIA
        UtLIX6VPiVDfzn0OiFBotI13p/IEses=
X-Google-Smtp-Source: ABdhPJzgOgmIHpe7R8pxORMXs9Bwywa7+I7SkwCz2r3AfM72EgE0i9+/53WAxgekQJMMU6Z5+U8WqQ==
X-Received: by 2002:aca:502:: with SMTP id 2mr9339130oif.121.1637440179407;
        Sat, 20 Nov 2021 12:29:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s17sm681036ooj.42.2021.11.20.12.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Nov 2021 12:29:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 12/12] watchdog: s3c2410: Add Exynos850 support
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-13-semen.protsenko@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2c0e5b23-92c5-70c9-3460-e9748f8a869e@roeck-us.net>
Date:   Sat, 20 Nov 2021 12:29:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211107202943.8859-13-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/7/21 12:29 PM, Sam Protsenko wrote:
> Exynos850 is a bit different from SoCs already supported in WDT driver:
>    - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
>      always 0; .disable_auto_reset callback is not set for that reason
>    - MASK_WDT_RESET_REQUEST register is replaced with
>      CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
>      reset interrupt it's now enabled with the same value; .mask_reset
>      callback is reused for that functionality though
>    - To make WDT functional, WDT counter needs to be enabled in
>      CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
>      callback
> 
> Also Exynos850 has two CPU clusters, each has its own dedicated WDT
> instance. Different PMU registers and bits are used for each cluster. So
> driver data is now modified in probe, adding needed info depending on
> cluster index passed from device tree.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>    - Renamed "samsung,index" property to more descriptive
>      "samsung,cluster-index"
>    - Used pre-defined and completely set driver data for cluster0 and
>      cluster1
> 
> Changes in v2:
>    - Used single compatible for Exynos850, populating missing driver data
>      in probe
>    - Added "index" property to specify CPU cluster index
> 
>   drivers/watchdog/s3c2410_wdt.c | 62 +++++++++++++++++++++++++++++++++-
>   1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 96aa5d9c6ed4..1456201f27de 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -56,6 +56,13 @@
>   #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
>   #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
>   #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
> +#define EXYNOS850_CLUSTER0_NONCPU_OUT		0x1220
> +#define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
> +#define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
> +#define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
> +
> +#define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
> +#define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
>   
>   /**
>    * Quirk flags for different Samsung watchdog IP-cores.
> @@ -205,6 +212,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>   		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>   };
>   
> +static const struct s3c2410_wdt_variant drv_data_exynos850_cl0 = {
> +	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
> +	.mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +};
> +
>   static const struct of_device_id s3c2410_wdt_match[] = {
>   	{ .compatible = "samsung,s3c2410-wdt",
>   	  .data = &drv_data_s3c2410 },
> @@ -216,6 +247,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>   	  .data = &drv_data_exynos5420 },
>   	{ .compatible = "samsung,exynos7-wdt",
>   	  .data = &drv_data_exynos7 },
> +	{ .compatible = "samsung,exynos850-wdt",
> +	  .data = &drv_data_exynos850_cl0 },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -587,14 +620,38 @@ static inline const struct s3c2410_wdt_variant *
>   s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>   {
>   	const struct s3c2410_wdt_variant *variant;
> +	struct device *dev = &pdev->dev;
>   
> -	variant = of_device_get_match_data(&pdev->dev);
> +	variant = of_device_get_match_data(dev);
>   	if (!variant) {
>   		/* Device matched by platform_device_id */
>   		variant = (struct s3c2410_wdt_variant *)
>   			   platform_get_device_id(pdev)->driver_data;
>   	}
>   
> +	/* Choose Exynos850 driver data w.r.t. cluster index */
> +	if (variant == &drv_data_exynos850_cl0) {

0-day has a point here. drv_data_exynos850_cl0 is declared inside a CONFIG_OF
conditional, causing compile failure if CONFIG_OF is not enabled.

Please fix and resubmit.

Guenter
