Return-Path: <linux-watchdog+bounces-349-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3674813476
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 16:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02F22820C8
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 15:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A175C8E4;
	Thu, 14 Dec 2023 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FlzBcC7/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13356126
	for <linux-watchdog@vger.kernel.org>; Thu, 14 Dec 2023 07:16:59 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-551437d5344so5921992a12.1
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Dec 2023 07:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702567017; x=1703171817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9TC9w44p0at14veon8LChvdwV45TKqCHl5xSdplaoU=;
        b=FlzBcC7/CccTV46QPpE/QnAq9ZXfnC5wcOZgDmVTqtnMF2VVy42yJ8FTOPgVl7O0XL
         RA6iVpvSLXc6ETYDCsbLuxQKuqPoJTsztd37BfjTR5ot9hqwVf7FwXvRs7wgsm+Cz3JN
         LPQjEWL8r7LZi54S+N1dCEJbxNr94uRGeWDuJt0SxLrQE4ust8MMq4hY9pJqcDc8eV4c
         50YbePqaXtzhtTa99ZRssfQe6U+6+/CPxCnbF1xQ+ai+ViP4dPEWB/pajC1GnTqH9jVy
         jADpJyfmBvWrMdZpyqSt51s361P6FRZd/CQkeKJA4DRJtVcBcvTwO5B6tIVTb9DWx691
         m5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702567017; x=1703171817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9TC9w44p0at14veon8LChvdwV45TKqCHl5xSdplaoU=;
        b=LmaWM9tVuqdQnbKiRKQva5e+rSzEvQ2Mvv87iPeZ/kq+Q+4L3J1kDcZKtIoP9RXwhD
         4iEdNqt+tT9uvjOCT9cOhFw2KRdofxQl8FQS+jimmM6JsJTE/a4ZfrL7Cfbl4LsUl6nu
         23ORW+whmy47HDzjJjZaMB2yNntweI/U+0ATFKbeceIj9Qfm862qz5F3odLvnTAmhDVi
         qf3suX6y7zRLK8p4iLZ+rX4CMUFVLbhWhz7uEiJeQkvQdhCKmibRJSwdNeFLmIJTzD1C
         orupW99jaGwAhNTeWGbOitNmWqlg6YVsGlYDahXnFGD5FjUkVqz4G7xnirXJ2Ep4qVBH
         97lA==
X-Gm-Message-State: AOJu0Yy+oABQYd2YoOX8Vx7Z42OGLNr7Eek2YdhsPG7/ItIKhtaPiQxJ
	DDxMsfBKWhnjH6g5lzGgCYx2MA==
X-Google-Smtp-Source: AGHT+IGDblrOooy4yt2sn4Jz0hhoCiUz72BBujoWmGS2qpE9GGbrUt3g2m9xmlTAT3ZodDyYmAmOqQ==
X-Received: by 2002:a50:d5d6:0:b0:551:fa18:fa68 with SMTP id g22-20020a50d5d6000000b00551fa18fa68mr1855714edj.18.1702567017511;
        Thu, 14 Dec 2023 07:16:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id q19-20020a50cc93000000b0054d3d20f429sm7116706edi.72.2023.12.14.07.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 07:16:57 -0800 (PST)
Message-ID: <09cf3280-9959-4475-ae0d-03b750f64825@linaro.org>
Date: Thu, 14 Dec 2023 16:16:55 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] watchdog: sbsa_gwdt: add support for Marvell ac5
Content-Language: en-US
To: Elad Nachman <enachman@marvell.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, gregory.clement@bootlin.com,
 chris.packham@alliedtelesis.co.nz, andrew@lunn.ch, fu.wei@linaro.org,
 Suravee.Suthikulpanit@amd.com, al.stone@linaro.org, timur@codeaurora.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: cyuval@marvell.com
References: <20231214150414.1849058-1-enachman@marvell.com>
 <20231214150414.1849058-4-enachman@marvell.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231214150414.1849058-4-enachman@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2023 16:04, Elad Nachman wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> Add support for Marvell ac5/x variant of the ARM
> sbsa global watchdog. This watchdog deviates from
> the standard driver by the following items:
> 
> 1. Registers reside in secure register section.
>    hence access is only possible via SMC calls to ATF.
> 
> 2. There are couple more registers which reside in
>    other register areas, which needs to be configured
>    in order for the watchdog to properly generate
>    reset through the SOC.
> 
> The new Marvell compatibility string differentiates between
> the original sbsa mode of operation and the Marvell mode of
> operation.
> 
> Signed-off-by: Elad Nachman <enachman@marvell.com>
> ---

...

>  	gwdt = devm_kzalloc(dev, sizeof(*gwdt), GFP_KERNEL);
>  	if (!gwdt)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, gwdt);
>  
> -	cf_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(cf_base))
> -		return PTR_ERR(cf_base);
> -
> -	rf_base = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(rf_base))
> -		return PTR_ERR(rf_base);
> +	if (of_device_is_compatible(np, "marvell,ac5-wd")) {

No, use match data. That's its purpose, don't put comaptibles inside code.

> +		marvell = true;
> +		gwdt->soc_reg_ops = &smc_reg_ops;
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (IS_ERR(res))
> +			return PTR_ERR(res);
> +		cf_base = res->start;

Why do you use entirely different code?

> +
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +		if (IS_ERR(res))
> +			return PTR_ERR(res);
> +		rf_base = res->start;
> +
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +		if (IS_ERR(res))
> +			return PTR_ERR(res);
> +		cpu_ctrl_base = res->start;
> +		mng_base = devm_platform_ioremap_resource(pdev, 3);
> +		if (IS_ERR(mng_base))
> +			return PTR_ERR(mng_base);
> +		rst_ctrl_base = devm_platform_ioremap_resource(pdev, 4);
> +		if (IS_ERR(rst_ctrl_base))
> +			return PTR_ERR(rst_ctrl_base);
> +	} else {
> +		gwdt->soc_reg_ops = &direct_reg_ops;
> +		cf_base = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(cf_base))
> +			return PTR_ERR(cf_base);

Why? This is shared.

> +
> +		rf_base = devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(rf_base))
> +			return PTR_ERR(rf_base);

Ditto

> +	}
>  
>  	/*
>  	 * Get the frequency of system counter from the cp15 interface of ARM
> @@ -299,7 +482,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>  	else
>  		wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
>  
> -	status = readl(cf_base + SBSA_GWDT_WCS);
> +	status = gwdt->soc_reg_ops->reg_read32(cf_base + SBSA_GWDT_WCS);
>  	if (status & SBSA_GWDT_WCS_WS1) {
>  		dev_warn(dev, "System reset by WDT.\n");
>  		wdd->bootstatus |= WDIOF_CARDRESET;
> @@ -317,7 +500,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>  			 * In case there is a pending ws0 interrupt, just ping
>  			 * the watchdog before registering the interrupt routine
>  			 */
> -			writel(0, rf_base + SBSA_GWDT_WRR);
> +			gwdt->soc_reg_ops->reg_write32(0, rf_base + SBSA_GWDT_WRR);
>  			if (devm_request_irq(dev, irq, sbsa_gwdt_interrupt, 0,
>  					     pdev->name, gwdt)) {
>  				action = 0;
> @@ -347,7 +530,28 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>  	ret = devm_watchdog_register_device(dev, wdd);
>  	if (ret)
>  		return ret;
> -
> +	/*
> +	 * Marvell AC5/X/IM: need to configure the watchdog
> +	 * HW to trigger reset on WS1 (Watchdog Signal 1):
> +	 *
> +	 * 1. Configure the watchdog signal enable (routing)
> +	 *    according to configuration
> +	 * 2. Unmask the wd_rst input signal to the reset unit
> +	 */
> +	if (marvell) {
> +		gwdt->soc_reg_ops->reg_write32(reset, cpu_ctrl_base +
> +					       SBSA_GWDT_MARVELL_CPU_WD_RST_EN_REG);
> +		id = readl(mng_base + SBSA_GWDT_MARVELL_MNG_ID_REG) &
> +			   SBSA_GWDT_MARVELL_ID_MASK;
> +
> +		if (id == SBSA_GWDT_MARVELL_AC5_ID)
> +			val = SBSA_GWDT_MARVELL_AC5_RST_UNIT_WD_BIT;
> +		else
> +			val = SBSA_GWDT_MARVELL_IRONMAN_RST_UNIT_WD_BIT;
> +
> +		writel(readl(rst_ctrl_base + SBSA_GWDT_MARVELL_RST_CTRL_REG) & ~val,
> +		       rst_ctrl_base + SBSA_GWDT_MARVELL_RST_CTRL_REG);
> +	}
>  	dev_info(dev, "Initialized with %ds timeout @ %u Hz, action=%d.%s\n",
>  		 wdd->timeout, gwdt->clk, action,
>  		 status & SBSA_GWDT_WCS_EN ? " [enabled]" : "");
> @@ -383,6 +587,7 @@ static const struct dev_pm_ops sbsa_gwdt_pm_ops = {
>  
>  static const struct of_device_id sbsa_gwdt_of_match[] = {
>  	{ .compatible = "arm,sbsa-gwdt", },
> +	{ .compatible = "marvell,ac5-wd", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sbsa_gwdt_of_match);

Best regards,
Krzysztof


