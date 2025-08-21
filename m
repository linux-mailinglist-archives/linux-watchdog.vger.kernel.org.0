Return-Path: <linux-watchdog+bounces-4031-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D085BB2FECE
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 17:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E6B68622F
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 15:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F192749D7;
	Thu, 21 Aug 2025 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSscwe17"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F394626CE1A;
	Thu, 21 Aug 2025 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790526; cv=none; b=QXL8Q7IuSH3LKNk6MXdF7L9JpRNG0uKm6jR3RpVOQ4ruGGvAZx93J98mcj2zTLZNOG5YiLOwjNS9Z7bfh3gyTCx66Lq4jUHg/VBo5S1uBjcczOdWpVz2X46pcsbXdGgLXx+3YWAV1fPZ8D+enBc0B6a2rLS4XuVsQmZRPzJoA/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790526; c=relaxed/simple;
	bh=XGZwmyktTF3C/a02Lah+HIxdNfFdSHtbitKKNGwwcbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0Z7OCfxJUr/6pFeIw0NaVga7nUY9cVyXC8nDkl2Ttv1sDf1bFEOH0EkvC+igED+bWSvDSbH/ocfRi9qBAc+kryd310YTLtNMHKkVUgbv/Nca4IhX60PYsz7geiwSbRSLrIokDbCNBpm31dJZYIS7wLaC9K3affdbkVZzRwqUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSscwe17; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-244580523a0so10787395ad.1;
        Thu, 21 Aug 2025 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790524; x=1756395324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLSpwY6RNF1An/589ykdgqwqMQlC8m6DMs4VS5fCzsA=;
        b=aSscwe17/syvC7ArfLKndYI6cVbYBDVwjhGimZJ8fXJBI/W4ZK4Bow4VloR8D+fyTT
         IoYQqvOuMVJlLMmiCfqAYZ6qUj2WGDs+IyWDxthetF8JFXb5Eo51g8HEp2Zux7U3CEdK
         P/H0XlMcs+QT8NOS7R49OA+zRljs/ef72c64ygwa8kMyT+I3DxbMyNnWPDSg6m9M+vfN
         A0fsyg4xSGd5gadN0s47ARJpEx0P5A4J6cw3FttCzN4P//MCOcdn7U7sRGWESXoGD1/G
         cjSCPuMSDQVScrCbWzXdGZOEfmMoVkuc8EcQnfbdsWSck9hAgU75cUo6f1Kv9G/KlNyf
         9FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790524; x=1756395324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLSpwY6RNF1An/589ykdgqwqMQlC8m6DMs4VS5fCzsA=;
        b=Nx0ugepDZeWL6Xume4eYx/CinA1uyGfQX0c1hvsfgUJ47vSEwuegWICxPp9/8Y7d+G
         SekuVPAJ5uxNOopmiI6Ta9D2nlVqxBP1x1ZiRmHXQqs13+5Um+tSW0+gOVYkAdDnxyGJ
         v6ephD6kSouVYe+B+lnva4NddU7xigSCqyGvCNYFoWwrSHMP5w6go8slV580rnn+2gnz
         Dt/MqZ6r2HO49351qtVeQA24Xvy4Ch5IepijIGWyCl7+WckHF0M5BzkEZYrPGcF3/dMC
         263HZYpP6wA1LFjQj8p//55ljUDXTdUARGI8tqpAo6NxRUiMJpu5hgWHdyaO8oix1w7P
         SB3g==
X-Forwarded-Encrypted: i=1; AJvYcCUrlzeKRfpGgxX6sQ25dJbkJOlqnoP9wwDINE9UWwYUcs4/LmFZXzYmJAkhI8yuv6edzHSCzx5lqZPLafs0xcg=@vger.kernel.org, AJvYcCVBojLZYJkSjYTqq3N86KRZGNQ02r+vFESL53HA43cx/gz+GyhtRCuuSYGbL0A/msFvqr5Wieepq+RvlMFEEGHz58Y=@vger.kernel.org, AJvYcCXrafEdmGb2cvtch4ewe1mnOT9IYcdChx4U+vIkj3ZDtwh7nOWXXGQTJffQj5+SbuxMDR4VzRl1jxGnC28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu58DcpGk+Eu4IYSU6OG9rr+bUfHJdJDRzHndqpCpK5D5qvmpk
	itx3M8fXXXLArc7S5N8ZTjTdbXFNIkR/QXmDzZHQEy5bbxF63x7+cbfS
X-Gm-Gg: ASbGnct6mJomy64ylOH69tY4jrTYHEl9EyktTgikZGfzmPp+itLp5UwqJoYLygQ9hOS
	VoJ2BWNYbjAVJgOExKQ8J9KBG0WpCjlfPgR5SyKa5J1k0t+K12og7+g/1cJlrXP9bxc9BbnWta9
	3bGcHOqzJxrCNPd5VrHQ/McLQ9CQamhwWXeuPPU8XvnPA8uons/xKIPTOMPiIe9Hedzo7VgbMy6
	jBZGl2ZmYqsjLoRT7hUD/IxgZ8AzqmAT/H8FevMLK3LUZp/zO9/Lm1h61E2A9bHuAsD70leEleT
	+r0YatoqDfgmRdbvyJJQQqEdnMZGHPThyVDuT+PDX5dPEcQnbBCZrKTS5E5Frg8bVpzKvCoEB6j
	S6tAs9zJQGJ6hatQoSdxp/dJNwqmJ0tcS2er9bA80JznHZvhC3QvWf0Ti
X-Google-Smtp-Source: AGHT+IGXKIXj6g5EIXQ9klworLSEI351sbS/X/g2LHpU43eKp02xoQkOVKpnvsmP/2hLrsV8ESH69A==
X-Received: by 2002:a17:903:2ad0:b0:234:8ef1:aa7b with SMTP id d9443c01a7336-245fec06a22mr40906125ad.20.1755790524220;
        Thu, 21 Aug 2025 08:35:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325154999f1sm73194a91.25.2025.08.21.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 Aug 2025 08:35:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] watchdog: s3c2410_wdt: Increase max timeout value
 of watchdog
Message-ID: <d41f8009-7a9d-4c46-b7f7-c8c86abd2e5c@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9@epcas2p1.samsung.com>
 <20250818021826.623830-4-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-4-sw617.shin@samsung.com>

On Mon, Aug 18, 2025 at 11:18:24AM +0900, Sangwook Shin wrote:
> Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
> 
> cat /sys/class/watchdog/watchdog0/max_timeout
> 3665038
> 
> [    0.330082] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099511400000, timeout=3665038, freq=300000
> [    0.330087] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3665038, divisor=256, count=1099511400000 (fffffc87)
> [    0.330127] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
> [    0.330134] s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog: count=0xfffffc87, wtcon=0001ff39
> [    0.330319] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled
> 
> If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk flags,
> and it will operate with a 32-bit counter. If not, it will operate with a 16-bit
> counter like in the previous version.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 1e8cf0299713..d983cbcb975c 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,7 +34,8 @@
>  #define S3C2410_WTCNT		0x08
>  #define S3C2410_WTCLRINT	0x0c
>  
> -#define S3C2410_WTCNT_MAXCNT	0xffff
> +#define S3C2410_WTCNT_MAXCNT_16	0xffff
> +#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
>  
>  #define S3C2410_WTCON_RSTEN		BIT(0)
>  #define S3C2410_WTCON_INTEN		BIT(2)
> @@ -124,6 +125,10 @@
>   * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
>   * Debug mode is determined by the DBGACK CPU signal.
> + *
> + * %QUIRK_HAS_32BIT_CNT: WTDAT and WTCNT are 32-bit registers. With these
> + * 32-bit registers, larger values will be set, which means that larger timeouts
> + * value can be set.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
>  #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
> @@ -131,6 +136,7 @@
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
>  #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT			BIT(5)
> +#define QUIRK_HAS_32BIT_CNT			BIT(6)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -199,6 +205,7 @@ struct s3c2410_wdt {
>  	struct notifier_block	freq_transition;
>  	const struct s3c2410_wdt_variant *drv_data;
>  	struct regmap *pmureg;
> +	u32 max_cnt;
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
> @@ -412,7 +419,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
>  {
>  	const unsigned long freq = s3c2410wdt_get_freq(wdt);
>  	const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
> -			S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
> +			S3C2410_WTCON_MAXDIV * wdt->max_cnt;
>  	u64 t_max = div64_ul(n_max, freq);
>  
>  	if (t_max > UINT_MAX)
> @@ -572,7 +579,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
>  	unsigned long freq = s3c2410wdt_get_freq(wdt);
> -	unsigned int count;
> +	unsigned long count;
>  	unsigned int divisor = 1;
>  	unsigned long wtcon;
>  
> @@ -582,7 +589,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	freq = DIV_ROUND_UP(freq, 128);
>  	count = timeout * freq;
>  
> -	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
> +	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
>  		count, timeout, freq);
>  
>  	/* if the count is bigger than the watchdog register,
> @@ -590,8 +597,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	   actually make this value
>  	*/
>  
> -	if (count >= 0x10000) {
> -		divisor = DIV_ROUND_UP(count, 0xffff);
> +	if (count > wdt->max_cnt) {
> +		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
>  
>  		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>  			dev_err(wdt->dev, "timeout %d too big\n", timeout);
> @@ -599,7 +606,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  		}
>  	}
>  
> -	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
> +	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
>  		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
>  
>  	count = DIV_ROUND_UP(count, divisor);
> @@ -807,6 +814,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->src_clk))
>  		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
>  
> +	if (wdt->drv_data->quirks & QUIRK_HAS_32BIT_CNT)
> +		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
> +	else
> +		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_16;
> +
>  	wdt->wdt_device.min_timeout = 1;
>  	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
>  
> -- 
> 2.25.1
> 
> 

