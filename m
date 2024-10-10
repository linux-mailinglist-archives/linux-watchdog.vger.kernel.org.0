Return-Path: <linux-watchdog+bounces-2187-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A79994F5
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 00:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A2881F24686
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 22:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1071E1027;
	Thu, 10 Oct 2024 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnVxOBoo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268D19CD1D
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 22:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728598268; cv=none; b=qfeQAVausuGeBtYSeIno4Sk+SP1k8/bMvZFNfFfasN7wNhcKZUDBBe6FM4POt3HX5+vEnJ3ul/JEZRkupxVyLdZGrv9VyYabZaqLzRnyhFzJtn5xuF00vMzdwccjOAxGY6Gkst62+nCPMbM0fVTRjN1gCEZvWMB1rp5hWwEdzWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728598268; c=relaxed/simple;
	bh=hm3Dznw9hVoykFfQP02bs/PDc5Q6/Sip3vfpgWaDC9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYR2SBNwAXhvRWwDk2f1e4sHT4tvm0LRjsR7/fGCpx0R/aJXNxiOhqniMxCvSG7Zuuy0MXBxULqvAVzRRB39L/cDMh1LDhFskKl5u1KLoYygW8zr564E+R9d+9CR5pahcZOLFBCD7nt3yevwQyss+oJjV6hov47xD5LWOR05Vdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnVxOBoo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71dfc250001so1248144b3a.2
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 15:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728598265; x=1729203065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BHKdV4c0FfLNk92jCeFkksxOq3Z7p0+mxBks7A+r+C4=;
        b=DnVxOBoo6xeg3VwswvdmesXt76T6AxMH+qKJTUQd0MvDnWuF3y8ljE1ZtQ8cRLECe8
         YHGDrt6lr/8kx/QIaMlG8GyCWq5UX8szBFIpu/Nz2V1RPsQS6o/j3UpOIKoWszybg2KD
         037woeNnvSp0Wht/flwyDu/Xln46tClvpTpx5120DxYumJLYKoQauZIMiW2yCNFOaQWp
         Vav9hrV6N95u5BFZHv5n4aIbHuLtXMvLb6rVz32XzIhPReIm2NSZFRbfZIeCRoDUuF1w
         OnEwgI/5VGOZfTqDOXG022sVhxcrW3mpfE+hduBZNb7bRxsGOoQcZB5hFbSi+aFvsNTz
         ih3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728598265; x=1729203065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHKdV4c0FfLNk92jCeFkksxOq3Z7p0+mxBks7A+r+C4=;
        b=lIm9T0/vhemlguxj7qTN5jEPcmszVaLoMFXQRttZsPkebXQj1euqxlqS8OSuGEU4Cg
         9N3YVdnKZqz6uRZhCfVXp/wJdpUG8TRRr4GVddAJ4+YAyKWK9zsR2Whnks1cuTtDt2jr
         OYef2UkNUCzrLJtteDA/JSCuBOHfr0QA5a06XfpLpIXq19GiMidtCoe6EWONsMy2JFuC
         uizybnoLO4ljPVMII9pbipUqo8081xqtej98kCzt/9nmLBCtKjmLD0nyR3hYfU3KIXHY
         4fSEevesq8RGCQYjIGX4zH96/ZmgRGNBItZlRBXH2KXqjRARf5gJN6M+zw42Ka2qOxsi
         ZbdQ==
X-Gm-Message-State: AOJu0YwofWai5Py+74wJrXd7ra74KcMdxJus1XftHUMMhbqS9Z5g5+tE
	xi6GZ8/kHrTYmsBOv48f8V5sgQwrAH1d1BubG69wH60zxfbfQVakpn+aIw==
X-Google-Smtp-Source: AGHT+IF/qklpaKYBIcINnt6Cv91Prx867IJwLiQYuxUDULjKpgBQ76wR898tv+SBbA90Mb+cNuVVGA==
X-Received: by 2002:a05:6a00:1145:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-71e37e49da7mr867196b3a.12.1728598265285;
        Thu, 10 Oct 2024 15:11:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aaba1ccsm1498056b3a.156.2024.10.10.15.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:11:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <384ee6ca-ace2-4277-8380-c8ae1af182d5@roeck-us.net>
Date: Thu, 10 Oct 2024 15:11:03 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>
References: <20241010203622.839625-4-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241010203622.839625-4-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/24 13:36, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/watchdog/ to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> While touching these files, make indention of the struct initializer
> consistent in several files.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Hello,
> 
> given the simplicity of the individual changes I do this all in a single
> patch. I you don't agree, please tell and I will happily split it.
> 
> It's based on todays's next, feel free to drop changes that result
> in a conflict when you come around to apply this. I'll care for the
> fallout at a later time then. (Having said that, if you use b4 am -3 and
> git am -3, there should be hardly any conflict.)
> 
> Note I didn't Cc: all the individual driver maintainers to not trigger
> sending limits and spam filters.
> 
> Best regards
> Uwe
> 
>   drivers/watchdog/acquirewdt.c       | 2 +-
>   drivers/watchdog/advantechwdt.c     | 2 +-
>   drivers/watchdog/at91rm9200_wdt.c   | 2 +-
>   drivers/watchdog/at91sam9_wdt.c     | 2 +-
>   drivers/watchdog/ath79_wdt.c        | 2 +-
>   drivers/watchdog/bcm2835_wdt.c      | 2 +-
>   drivers/watchdog/bcm_kona_wdt.c     | 2 +-
>   drivers/watchdog/cpwd.c             | 2 +-
>   drivers/watchdog/dw_wdt.c           | 2 +-
>   drivers/watchdog/gef_wdt.c          | 2 +-
>   drivers/watchdog/geodewdt.c         | 2 +-
>   drivers/watchdog/ib700wdt.c         | 2 +-
>   drivers/watchdog/ie6xx_wdt.c        | 2 +-
>   drivers/watchdog/lpc18xx_wdt.c      | 2 +-
>   drivers/watchdog/mtx-1_wdt.c        | 2 +-
>   drivers/watchdog/nic7018_wdt.c      | 2 +-
>   drivers/watchdog/nv_tco.c           | 2 +-
>   drivers/watchdog/omap_wdt.c         | 2 +-
>   drivers/watchdog/orion_wdt.c        | 2 +-
>   drivers/watchdog/rc32434_wdt.c      | 2 +-
>   drivers/watchdog/rdc321x_wdt.c      | 2 +-
>   drivers/watchdog/renesas_wdt.c      | 2 +-
>   drivers/watchdog/riowd.c            | 2 +-
>   drivers/watchdog/rti_wdt.c          | 2 +-
>   drivers/watchdog/sa1100_wdt.c       | 4 ++--
>   drivers/watchdog/sch311x_wdt.c      | 2 +-
>   drivers/watchdog/shwdt.c            | 2 +-
>   drivers/watchdog/st_lpc_wdt.c       | 2 +-
>   drivers/watchdog/starfive-wdt.c     | 2 +-
>   drivers/watchdog/stmp3xxx_rtc_wdt.c | 2 +-
>   drivers/watchdog/txx9wdt.c          | 2 +-
>   31 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/watchdog/acquirewdt.c b/drivers/watchdog/acquirewdt.c
> index 08ca18e91124..052f65c48a70 100644
> --- a/drivers/watchdog/acquirewdt.c
> +++ b/drivers/watchdog/acquirewdt.c
> @@ -285,7 +285,7 @@ static void acq_shutdown(struct platform_device *dev)
>   }
>   
>   static struct platform_driver acquirewdt_driver = {
> -	.remove_new	= acq_remove,
> +	.remove		= acq_remove,
>   	.shutdown	= acq_shutdown,
>   	.driver		= {
>   		.name	= DRV_NAME,
> diff --git a/drivers/watchdog/advantechwdt.c b/drivers/watchdog/advantechwdt.c
> index e41cd3ba4e0e..42d3f3771781 100644
> --- a/drivers/watchdog/advantechwdt.c
> +++ b/drivers/watchdog/advantechwdt.c
> @@ -293,7 +293,7 @@ static void advwdt_shutdown(struct platform_device *dev)
>   }
>   
>   static struct platform_driver advwdt_driver = {
> -	.remove_new	= advwdt_remove,
> +	.remove		= advwdt_remove,
>   	.shutdown	= advwdt_shutdown,
>   	.driver		= {
>   		.name	= DRV_NAME,
> diff --git a/drivers/watchdog/at91rm9200_wdt.c b/drivers/watchdog/at91rm9200_wdt.c
> index 17382512a609..1795aaf1ec45 100644
> --- a/drivers/watchdog/at91rm9200_wdt.c
> +++ b/drivers/watchdog/at91rm9200_wdt.c
> @@ -295,7 +295,7 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
>   
>   static struct platform_driver at91wdt_driver = {
>   	.probe		= at91wdt_probe,
> -	.remove_new	= at91wdt_remove,
> +	.remove		= at91wdt_remove,
>   	.shutdown	= at91wdt_shutdown,
>   	.suspend	= pm_ptr(at91wdt_suspend),
>   	.resume		= pm_ptr(at91wdt_resume),
> diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
> index 2c6474cb858b..7be70b98d091 100644
> --- a/drivers/watchdog/at91sam9_wdt.c
> +++ b/drivers/watchdog/at91sam9_wdt.c
> @@ -392,7 +392,7 @@ MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
>   
>   static struct platform_driver at91wdt_driver = {
>   	.probe		= at91wdt_probe,
> -	.remove_new	= at91wdt_remove,
> +	.remove		= at91wdt_remove,
>   	.driver		= {
>   		.name	= "at91_wdt",
>   		.of_match_table = of_match_ptr(at91_wdt_dt_ids),
> diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
> index d16b2c583fa4..7df703e9852a 100644
> --- a/drivers/watchdog/ath79_wdt.c
> +++ b/drivers/watchdog/ath79_wdt.c
> @@ -305,7 +305,7 @@ MODULE_DEVICE_TABLE(of, ath79_wdt_match);
>   
>   static struct platform_driver ath79_wdt_driver = {
>   	.probe		= ath79_wdt_probe,
> -	.remove_new	= ath79_wdt_remove,
> +	.remove		= ath79_wdt_remove,
>   	.shutdown	= ath79_wdt_shutdown,
>   	.driver		= {
>   		.name	= DRIVER_NAME,
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index bb001c5d7f17..9fcfee63905b 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -227,7 +227,7 @@ static void bcm2835_wdt_remove(struct platform_device *pdev)
>   
>   static struct platform_driver bcm2835_wdt_driver = {
>   	.probe		= bcm2835_wdt_probe,
> -	.remove_new	= bcm2835_wdt_remove,
> +	.remove		= bcm2835_wdt_remove,
>   	.driver = {
>   		.name =		"bcm2835-wdt",
>   	},
> diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
> index 49e12d47b073..66bd0324fd68 100644
> --- a/drivers/watchdog/bcm_kona_wdt.c
> +++ b/drivers/watchdog/bcm_kona_wdt.c
> @@ -328,7 +328,7 @@ static struct platform_driver bcm_kona_wdt_driver = {
>   			.of_match_table = bcm_kona_wdt_of_match,
>   		  },
>   	.probe = bcm_kona_wdt_probe,
> -	.remove_new = bcm_kona_wdt_remove,
> +	.remove = bcm_kona_wdt_remove,
>   };
>   
>   module_platform_driver(bcm_kona_wdt_driver);
> diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
> index 8ee81f018dda..4fb92c9e046a 100644
> --- a/drivers/watchdog/cpwd.c
> +++ b/drivers/watchdog/cpwd.c
> @@ -653,7 +653,7 @@ static struct platform_driver cpwd_driver = {
>   		.of_match_table = cpwd_match,
>   	},
>   	.probe		= cpwd_probe,
> -	.remove_new	= cpwd_remove,
> +	.remove		= cpwd_remove,
>   };
>   
>   module_platform_driver(cpwd_driver);
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 84dca3695f86..26efca9ae0e7 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -684,7 +684,7 @@ MODULE_DEVICE_TABLE(of, dw_wdt_of_match);
>   
>   static struct platform_driver dw_wdt_driver = {
>   	.probe		= dw_wdt_drv_probe,
> -	.remove_new	= dw_wdt_drv_remove,
> +	.remove		= dw_wdt_drv_remove,
>   	.driver		= {
>   		.name	= "dw_wdt",
>   		.of_match_table = of_match_ptr(dw_wdt_of_match),
> diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
> index d854fcfbfa5b..bf6f733dfb5f 100644
> --- a/drivers/watchdog/gef_wdt.c
> +++ b/drivers/watchdog/gef_wdt.c
> @@ -305,7 +305,7 @@ static struct platform_driver gef_wdt_driver = {
>   		.of_match_table = gef_wdt_ids,
>   	},
>   	.probe		= gef_wdt_probe,
> -	.remove_new	= gef_wdt_remove,
> +	.remove		= gef_wdt_remove,
>   };
>   
>   static int __init gef_wdt_init(void)
> diff --git a/drivers/watchdog/geodewdt.c b/drivers/watchdog/geodewdt.c
> index 4ed6d139320b..5b80ade1c681 100644
> --- a/drivers/watchdog/geodewdt.c
> +++ b/drivers/watchdog/geodewdt.c
> @@ -248,7 +248,7 @@ static void geodewdt_shutdown(struct platform_device *dev)
>   }
>   
>   static struct platform_driver geodewdt_driver = {
> -	.remove_new	= geodewdt_remove,
> +	.remove		= geodewdt_remove,
>   	.shutdown	= geodewdt_shutdown,
>   	.driver		= {
>   		.name	= DRV_NAME,
> diff --git a/drivers/watchdog/ib700wdt.c b/drivers/watchdog/ib700wdt.c
> index b041ad90a62c..5ce6101d236d 100644
> --- a/drivers/watchdog/ib700wdt.c
> +++ b/drivers/watchdog/ib700wdt.c
> @@ -331,7 +331,7 @@ static void ibwdt_shutdown(struct platform_device *dev)
>   }
>   
>   static struct platform_driver ibwdt_driver = {
> -	.remove_new	= ibwdt_remove,
> +	.remove		= ibwdt_remove,
>   	.shutdown	= ibwdt_shutdown,
>   	.driver		= {
>   		.name	= DRV_NAME,
> diff --git a/drivers/watchdog/ie6xx_wdt.c b/drivers/watchdog/ie6xx_wdt.c
> index e5cbb409df25..5a7bb7e84653 100644
> --- a/drivers/watchdog/ie6xx_wdt.c
> +++ b/drivers/watchdog/ie6xx_wdt.c
> @@ -280,7 +280,7 @@ static void ie6xx_wdt_remove(struct platform_device *pdev)
>   
>   static struct platform_driver ie6xx_wdt_driver = {
>   	.probe		= ie6xx_wdt_probe,
> -	.remove_new	= ie6xx_wdt_remove,
> +	.remove		= ie6xx_wdt_remove,
>   	.driver		= {
>   		.name	= DRIVER_NAME,
>   	},
> diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
> index 19535f4a2fd2..f19580e1b318 100644
> --- a/drivers/watchdog/lpc18xx_wdt.c
> +++ b/drivers/watchdog/lpc18xx_wdt.c
> @@ -281,7 +281,7 @@ static struct platform_driver lpc18xx_wdt_driver = {
>   		.of_match_table	= lpc18xx_wdt_match,
>   	},
>   	.probe = lpc18xx_wdt_probe,
> -	.remove_new = lpc18xx_wdt_remove,
> +	.remove = lpc18xx_wdt_remove,
>   };
>   module_platform_driver(lpc18xx_wdt_driver);
>   
> diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
> index 11f05024a181..f75426cfa425 100644
> --- a/drivers/watchdog/mtx-1_wdt.c
> +++ b/drivers/watchdog/mtx-1_wdt.c
> @@ -233,7 +233,7 @@ static void mtx1_wdt_remove(struct platform_device *pdev)
>   
>   static struct platform_driver mtx1_wdt_driver = {
>   	.probe = mtx1_wdt_probe,
> -	.remove_new = mtx1_wdt_remove,
> +	.remove = mtx1_wdt_remove,
>   	.driver.name = "mtx1-wdt",
>   };
>   
> diff --git a/drivers/watchdog/nic7018_wdt.c b/drivers/watchdog/nic7018_wdt.c
> index c3f0a4926667..44982b37ba6f 100644
> --- a/drivers/watchdog/nic7018_wdt.c
> +++ b/drivers/watchdog/nic7018_wdt.c
> @@ -236,7 +236,7 @@ MODULE_DEVICE_TABLE(acpi, nic7018_device_ids);
>   
>   static struct platform_driver watchdog_driver = {
>   	.probe = nic7018_probe,
> -	.remove_new = nic7018_remove,
> +	.remove = nic7018_remove,
>   	.driver = {
>   		.name = KBUILD_MODNAME,
>   		.acpi_match_table = ACPI_PTR(nic7018_device_ids),
> diff --git a/drivers/watchdog/nv_tco.c b/drivers/watchdog/nv_tco.c
> index f8eb1f65a59e..f16cee5173d5 100644
> --- a/drivers/watchdog/nv_tco.c
> +++ b/drivers/watchdog/nv_tco.c
> @@ -466,7 +466,7 @@ static void nv_tco_shutdown(struct platform_device *dev)
>   
>   static struct platform_driver nv_tco_driver = {
>   	.probe		= nv_tco_init,
> -	.remove_new	= nv_tco_remove,
> +	.remove		= nv_tco_remove,
>   	.shutdown	= nv_tco_shutdown,
>   	.driver		= {
>   		.name	= TCO_MODULE_NAME,
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index b6e0236509bb..d523428a8d22 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -357,7 +357,7 @@ MODULE_DEVICE_TABLE(of, omap_wdt_of_match);
>   
>   static struct platform_driver omap_wdt_driver = {
>   	.probe		= omap_wdt_probe,
> -	.remove_new	= omap_wdt_remove,
> +	.remove		= omap_wdt_remove,
>   	.shutdown	= omap_wdt_shutdown,
>   	.suspend	= pm_ptr(omap_wdt_suspend),
>   	.resume		= pm_ptr(omap_wdt_resume),
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 1fe583e8a95b..0e145f762f6f 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -665,7 +665,7 @@ static void orion_wdt_shutdown(struct platform_device *pdev)
>   
>   static struct platform_driver orion_wdt_driver = {
>   	.probe		= orion_wdt_probe,
> -	.remove_new	= orion_wdt_remove,
> +	.remove		= orion_wdt_remove,
>   	.shutdown	= orion_wdt_shutdown,
>   	.driver		= {
>   		.name	= "orion_wdt",
> diff --git a/drivers/watchdog/rc32434_wdt.c b/drivers/watchdog/rc32434_wdt.c
> index efadbb9d7ce7..0e5c5c96af58 100644
> --- a/drivers/watchdog/rc32434_wdt.c
> +++ b/drivers/watchdog/rc32434_wdt.c
> @@ -309,7 +309,7 @@ static void rc32434_wdt_shutdown(struct platform_device *pdev)
>   
>   static struct platform_driver rc32434_wdt_driver = {
>   	.probe		= rc32434_wdt_probe,
> -	.remove_new	= rc32434_wdt_remove,
> +	.remove		= rc32434_wdt_remove,
>   	.shutdown	= rc32434_wdt_shutdown,
>   	.driver		= {
>   			.name = "rc32434_wdt",
> diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
> index 80490316a27f..8955177072fa 100644
> --- a/drivers/watchdog/rdc321x_wdt.c
> +++ b/drivers/watchdog/rdc321x_wdt.c
> @@ -268,7 +268,7 @@ static void rdc321x_wdt_remove(struct platform_device *pdev)
>   
>   static struct platform_driver rdc321x_wdt_driver = {
>   	.probe = rdc321x_wdt_probe,
> -	.remove_new = rdc321x_wdt_remove,
> +	.remove = rdc321x_wdt_remove,
>   	.driver = {
>   		.name = "rdc321x-wdt",
>   	},
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 12c41d6e5cd6..c0b2a9c5250d 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -337,7 +337,7 @@ static struct platform_driver rwdt_driver = {
>   		.pm = &rwdt_pm_ops,
>   	},
>   	.probe = rwdt_probe,
> -	.remove_new = rwdt_remove,
> +	.remove = rwdt_remove,
>   };
>   module_platform_driver(rwdt_driver);
>   
> diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
> index f47d90d01c19..83806ccf06d1 100644
> --- a/drivers/watchdog/riowd.c
> +++ b/drivers/watchdog/riowd.c
> @@ -238,7 +238,7 @@ static struct platform_driver riowd_driver = {
>   		.of_match_table = riowd_match,
>   	},
>   	.probe		= riowd_probe,
> -	.remove_new	= riowd_remove,
> +	.remove		= riowd_remove,
>   };
>   
>   module_platform_driver(riowd_driver);
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 4895a69015a8..bfad78eb94a3 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -380,7 +380,7 @@ static struct platform_driver rti_wdt_driver = {
>   		.of_match_table = rti_wdt_of_match,
>   	},
>   	.probe = rti_wdt_probe,
> -	.remove_new = rti_wdt_remove,
> +	.remove = rti_wdt_remove,
>   };
>   
>   module_platform_driver(rti_wdt_driver);
> diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
> index 6e91ee3fbfb5..729a8508b31d 100644
> --- a/drivers/watchdog/sa1100_wdt.c
> +++ b/drivers/watchdog/sa1100_wdt.c
> @@ -236,8 +236,8 @@ static void sa1100dog_remove(struct platform_device *pdev)
>   
>   static struct platform_driver sa1100dog_driver = {
>   	.driver.name = "sa1100_wdt",
> -	.probe	  = sa1100dog_probe,
> -	.remove_new	  = sa1100dog_remove,
> +	.probe = sa1100dog_probe,
> +	.remove = sa1100dog_remove,
>   };
>   module_platform_driver(sa1100dog_driver);
>   
> diff --git a/drivers/watchdog/sch311x_wdt.c b/drivers/watchdog/sch311x_wdt.c
> index 76053158d259..9670a1ea57cb 100644
> --- a/drivers/watchdog/sch311x_wdt.c
> +++ b/drivers/watchdog/sch311x_wdt.c
> @@ -445,7 +445,7 @@ static void sch311x_wdt_shutdown(struct platform_device *dev)
>   
>   static struct platform_driver sch311x_wdt_driver = {
>   	.probe		= sch311x_wdt_probe,
> -	.remove_new	= sch311x_wdt_remove,
> +	.remove		= sch311x_wdt_remove,
>   	.shutdown	= sch311x_wdt_shutdown,
>   	.driver		= {
>   		.name = DRV_NAME,
> diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
> index 10f1fba78ec2..7f0150c39421 100644
> --- a/drivers/watchdog/shwdt.c
> +++ b/drivers/watchdog/shwdt.c
> @@ -297,7 +297,7 @@ static struct platform_driver sh_wdt_driver = {
>   	},
>   
>   	.probe		= sh_wdt_probe,
> -	.remove_new	= sh_wdt_remove,
> +	.remove		= sh_wdt_remove,
>   	.shutdown	= sh_wdt_shutdown,
>   };
>   
> diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
> index 4c5b8d98a4f3..d206452072ae 100644
> --- a/drivers/watchdog/st_lpc_wdt.c
> +++ b/drivers/watchdog/st_lpc_wdt.c
> @@ -286,7 +286,7 @@ static struct platform_driver st_wdog_driver = {
>   		.of_match_table = st_wdog_match,
>   	},
>   	.probe = st_wdog_probe,
> -	.remove_new = st_wdog_remove,
> +	.remove = st_wdog_remove,
>   };
>   module_platform_driver(st_wdog_driver);
>   
> diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
> index 19a2620d3d38..5e8ad576073d 100644
> --- a/drivers/watchdog/starfive-wdt.c
> +++ b/drivers/watchdog/starfive-wdt.c
> @@ -597,7 +597,7 @@ MODULE_DEVICE_TABLE(of, starfive_wdt_match);
>   
>   static struct platform_driver starfive_wdt_driver = {
>   	.probe = starfive_wdt_probe,
> -	.remove_new = starfive_wdt_remove,
> +	.remove = starfive_wdt_remove,
>   	.shutdown = starfive_wdt_shutdown,
>   	.driver = {
>   		.name = "starfive-wdt",
> diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
> index 4b2caa9807ac..060447101f48 100644
> --- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
> +++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
> @@ -143,7 +143,7 @@ static struct platform_driver stmp3xxx_wdt_driver = {
>   		.pm = &stmp3xxx_wdt_pm_ops,
>   	},
>   	.probe = stmp3xxx_wdt_probe,
> -	.remove_new = stmp3xxx_wdt_remove,
> +	.remove = stmp3xxx_wdt_remove,
>   };
>   module_platform_driver(stmp3xxx_wdt_driver);
>   
> diff --git a/drivers/watchdog/txx9wdt.c b/drivers/watchdog/txx9wdt.c
> index 8d5f67acbff2..305349844b4f 100644
> --- a/drivers/watchdog/txx9wdt.c
> +++ b/drivers/watchdog/txx9wdt.c
> @@ -159,7 +159,7 @@ static void txx9wdt_shutdown(struct platform_device *dev)
>   
>   static struct platform_driver txx9wdt_driver = {
>   	.probe = txx9wdt_probe,
> -	.remove_new = txx9wdt_remove,
> +	.remove = txx9wdt_remove,
>   	.shutdown = txx9wdt_shutdown,
>   	.driver = {
>   		.name = "txx9wdt",
> 
> base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c


