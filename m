Return-Path: <linux-watchdog+bounces-2058-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59098A7CB
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 16:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEE5428612F
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 14:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA401953AB;
	Mon, 30 Sep 2024 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD1FXrU3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F331F194C9D;
	Mon, 30 Sep 2024 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707873; cv=none; b=PNGeN0fJ1hhzWY8qLlNI5VESNspS3Rp7MDtQ4faarH3XbQsl0y1nzEzvpw8M+BC4x3AhJ+iGj7sGmXGb71GB6EtQiZ7j2qnpE6bUaoXRcEiklKBEoI3aWN6oVuN4YFTAopyLY+nBiaIw0XncZ20ptKl2XNtsKq4EQ+ZLpI3kiM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707873; c=relaxed/simple;
	bh=W/15mwfsMOdUMZCEAQnTUhSMq33MkRfFX+u8/LzbOpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfdrUFqqYYigrOMV1Gww1AcdeEHBM6bBOchReUqmfSu1JyLQdPcGPmz/NNtUwkc8jMYrz5hj6T3r/6pATJDtO/mJL0r6oQCyNYVojqNOUBB0xegC5DWB1jJGLX2wcfjTmSDhfWnd6iOQqfkEquAkgEFlvu4K78LiuwfiKbMB9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD1FXrU3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2db85775c43so3280834a91.0;
        Mon, 30 Sep 2024 07:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727707871; x=1728312671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ei8R9qgMGBNjxfWPS/m3HODUQUOhNth41iRV0XmScp8=;
        b=XD1FXrU3joG37mIzpbYMjMTLk79BJSVVGy6MZVqggS1q9svPfe1KPZBHDwm0wm/Saz
         h2u/86nnMEd0/YuI8hkTGrqgBUZnR1RKYU8vp6INuqNzeqJSouqQtahItvkEyBWXJIFy
         DoUULZqUowwVI7NTyhp05xwAl9Kx3BJpIC1EfkYhFb1Pr5cxfzI2npO9D3XAItlemyxk
         mcvBJt88oJMrx1KuSXEctSzahparNbzqDHKq6z8+GrhIve9mBSxpzV/dh9j6K1wOQdV8
         xeGdBqAkulW7DouvDQ1zJd1qsVU/3bqQNJXkORaxuVsSgvgYZZAcd1sodavvIXx/IH/u
         QFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707871; x=1728312671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ei8R9qgMGBNjxfWPS/m3HODUQUOhNth41iRV0XmScp8=;
        b=AgmmPoQx8F/J+tIj9tPHJvs002CWYFPuGqyqiXb8oJCi3hR7uL1jhlTy1txsUMf3B/
         N3wrCiU8nqmzfAH/MgC89niQBU53opAj9fnJ6kvyDgmpTwRfJIkyVt9FcnwX5d4HT7Zx
         jvjFmpc6BOKOVJsBFxwnpA5DfdxsUCcUBSufq0oFQCKv3AYSv2BRBwSzxz/ywu1tISVH
         m/xGX+FxlMw7Htv1jOqqtqrHCa2T0MaaNoN+6RkbsImcXiyHARPauTYNadEPC9yL4M7+
         ljxn9sVIQx3FrgQj/RMOQ/cLLgGqyqRBp2rP7lqzCP8Kxd7FKgDNFledekqBneGwm2yO
         bqYg==
X-Forwarded-Encrypted: i=1; AJvYcCUcbbkH9oKRjq+aPWvoZyzv7KVIQxdOf8JWokUfBA1vp5+AP26WUOphHylGrzOsqEr2bDhfpVuDckGjCMixF5IemXM=@vger.kernel.org, AJvYcCVnlFeAHSOQO6ek5RaH5DwH++RPwboJ9a10mIZ74PmwoDUbbwe21U1ZSdGPP8nZyB00eaLT1Q3LD1pe@vger.kernel.org, AJvYcCXsVeJZecHyxdq6NcjsDsLaZ3opbUzVW4IVqr84fT72EU1ALKxkEH8pYXr8IFIG4ZqBd5AExeRCFhFFPGrA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7J7/+1nQ37dOHCwVgZtI/Q7b+9jBjE0qHS1xB2P/UmQSSzvbs
	bKy+0PjwR1ri+wM+P4V72DOAChHArOti6b7++WpPzHKwZh3gFh4J
X-Google-Smtp-Source: AGHT+IESj6q0YIuvcr+nnx/mRmuhZjN9eqqic59z9EEnxqUyoXh6hE3HWGSs0IU8MORXMDQo+0yGiw==
X-Received: by 2002:a17:90a:8a8f:b0:2e0:8780:ecb with SMTP id 98e67ed59e1d1-2e0b71d09ebmr19199298a91.12.1727707871194;
        Mon, 30 Sep 2024 07:51:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6ca6563sm7986887a91.34.2024.09.30.07.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:51:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3eaec6e3-c99b-4efb-9456-c157eb484ff3@roeck-us.net>
Date: Mon, 30 Sep 2024 07:51:04 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: s3c2410_wdt: add support for exynosautov920
 SoC
To: Taewan Kim <trunixs.kim@samsung.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>
References: <20240913080325.3676181-1-trunixs.kim@samsung.com>
 <CGME20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b@epcas2p4.samsung.com>
 <20240913080325.3676181-3-trunixs.kim@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240913080325.3676181-3-trunixs.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 01:03, Taewan Kim wrote:
> From: Byoungtae Cho <bt.cho@samsung.com>
> 
> Adds the compatibles and drvdata for the ExynosAuto V920 SoC. This SoC
> is almost similar to ExynosAutoV9, but some CPU configurations are quite
> different, so it should be added. Plus it also support DBGACK like as
> GS101 SoC.
> 
> Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
> Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 686cf544d0ae..c25133348f0e 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -63,6 +63,10 @@
>   #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
>   #define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
>   #define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
> +#define EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT	0x1420
> +#define EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN	0x1444
> +#define EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT	0x1720
> +#define EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN	0x1744
>   
>   #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
>   #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
> @@ -303,6 +307,32 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
>   		  QUIRK_HAS_DBGACK_BIT,
>   };
>   
> +static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
> +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_DBGACK_BIT,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
> +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
> +	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_DBGACK_BIT,
> +};
> +
>   static const struct of_device_id s3c2410_wdt_match[] = {
>   	{ .compatible = "google,gs101-wdt",
>   	  .data = &drv_data_gs101_cl0 },
> @@ -320,6 +350,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>   	  .data = &drv_data_exynos850_cl0 },
>   	{ .compatible = "samsung,exynosautov9-wdt",
>   	  .data = &drv_data_exynosautov9_cl0 },
> +	{ .compatible = "samsung,exynosautov920-wdt",
> +	  .data = &drv_data_exynosautov920_cl0},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -643,7 +675,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>   	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
>   	if (variant == &drv_data_exynos850_cl0 ||
>   	    variant == &drv_data_exynosautov9_cl0 ||
> -	    variant == &drv_data_gs101_cl0) {
> +	    variant == &drv_data_gs101_cl0 ||
> +	    variant == &drv_data_exynosautov920_cl0) {
>   		u32 index;
>   		int err;
>   
> @@ -662,6 +695,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>   				variant = &drv_data_exynosautov9_cl1;
>   			else if (variant == &drv_data_gs101_cl0)
>   				variant = &drv_data_gs101_cl1;
> +			else if (variant == &drv_data_exynosautov920_cl1)
> +				variant = &drv_data_exynosautov920_cl1;
>   			break;
>   		default:
>   			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);


