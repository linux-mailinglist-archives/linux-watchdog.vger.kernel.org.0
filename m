Return-Path: <linux-watchdog+bounces-1892-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B304D978769
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 20:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 248A31F236DE
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 18:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2781F22338;
	Fri, 13 Sep 2024 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/m2zG6e"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5A12EBE7;
	Fri, 13 Sep 2024 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250483; cv=none; b=a6wqn2wM7sVHyaMDTFU9N8s/FEOTrfI1FOuX6FAkIHDdm255bgnUFeIjl8Ofp21pGMqWHlQIo/9HP1CK5phwAcvtAD6LUL6S/pVrxFYE6ZOX/llo275LZ0SynXMbaPCFc4JbiTK/q++TQRtnKpCM0WphZQf7iMdJB5r232D4pKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250483; c=relaxed/simple;
	bh=MRUmy9fH9REIARa8LTrlm+xyN1Wirz7vvVg+vUDfNhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q+aNWuDkG1klmMrZodvohaEksk6soW80RoMrZyy8wj5MP/p/MpldgyvDqUhjjjGdi9fGz+wcmQKhRFJIt27QyvwI5GINee2CRgmjTzQBUcPDa56R303GGQrXnCtiskP3yWp788p0H+wrKpo29ukclmD34xeLM8BQRErG/q76zRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/m2zG6e; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7c1324be8easo2517970a12.1;
        Fri, 13 Sep 2024 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726250481; x=1726855281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2dckvaybq7fry1kkYplM9IN78HtEe+9o+W93LYPvx3M=;
        b=G/m2zG6eGa3EJD6W/5i6VPuitkuBWrW+ygJ2+NW3EJatOySrRAZNcldQ7A+/n9Avsj
         UBvom6M+ykG6NivTcyfBI1WuFhw2FQLwlI/kQDeTLwL1kGCsap1Bf4YejNmIDa0696Hy
         D0Rd8z9jBeMgfHBVwimeivG0NJQ4kjAuaSemIj+uzbjwEygD+MmhVI8LEV7iL/FlGjjU
         Wg1evAiRDFo4Szx8uJHCNebnbt6NiHzrgVBc95s2apKS3Ahy0mOUUbhMLsvZQsNNpITM
         a5tVPeTo2KmX7vbs9Mn0rLQBfvtqLvtv89AGQpz282QIlhimUsgzrATT1Y9ujNDD8oso
         e9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250481; x=1726855281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dckvaybq7fry1kkYplM9IN78HtEe+9o+W93LYPvx3M=;
        b=cPqMNMSLIuikNosBVp2ydjWGvMj/QP5dgfHFHPBAofuEccK/3dLektf+IB76TFuUVg
         HR15uoIMGdyrZNS+RRdigso4YSCkcS98fUqy344FOBtRjMIPTfB4py9RyKxpZLuldUca
         KSVZNhMj4KpUCbOitLMUVAHTkZUFJXygSNKoYfddLcldqKzYkhCbZXkqsL/D4r7I8AWV
         fzPXtEG5oJNQT7AlTCfr3AwvbLHtGdOBMLIk0NqwC2nuXvtHnwDbCoQgkeJDg/InyKKZ
         uIrFpzHRJsuus8ivfOS2xECRqe6lUkzGuKekl/58rhgZc6xC9A4QRj+TejJkbA82Szfp
         SeSA==
X-Forwarded-Encrypted: i=1; AJvYcCV5dHckaPb2C8R1r9FHtfGpQGIzDVwmOzbhip7CIhI1a24q6O3ntyqVy4fKvwQLeI6pfYGj5JklCDdk+WM=@vger.kernel.org, AJvYcCWGrGKzX3ZwDR5scb096q9na3sIRuZ+KLZc65rAZqQWi5yAm/34SQUdTyUB3FbTAv8IhVfMXHOPJDKfgTcMloE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYB/JYPyNcPuhF70jI6WdCPL5e57TECQxQBxkujwukB7YJc1xH
	Xpvozo/eT/vTIWoq3av2R51r/ZD/WyfKpEDgLh9cKKmOT0RXu+9g1Ruv+Q==
X-Google-Smtp-Source: AGHT+IEAjLTAGf0Obih6pBdKsCv3yrOccpjThO9JsZS4IT2ANER59+R1FDo2DpiyuRHU5bBfmkSAOg==
X-Received: by 2002:a17:90b:694:b0:2d8:7445:7ab2 with SMTP id 98e67ed59e1d1-2db9fcd533fmr9947002a91.20.1726250477556;
        Fri, 13 Sep 2024 11:01:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c9175asm2107663a91.15.2024.09.13.11.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 11:01:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1081ea3e-73e7-4e98-9a2e-127238a9ed42@roeck-us.net>
Date: Fri, 13 Sep 2024 11:01:14 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: apple: Increase reset delay to 150ms
To: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240913174540.45551-1-towinchenmi@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240913174540.45551-1-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 10:45, Nick Chan wrote:
> The Apple A8X SoC seems to be slowest at resetting, taking up to around
> 125ms to reset. Wait 150ms to be safe here.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/apple_wdt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index d4f739932f0b..353ecf0b04dc 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -127,11 +127,11 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
>   	/*
>   	 * Flush writes and then wait for the SoC to reset. Even though the
>   	 * reset is queued almost immediately experiments have shown that it
> -	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
> -	 * 50ms here to be safe.
> +	 * can take up to ~120-125ms until the SoC is actually reset. Just
> +	 * wait 150ms here to be safe.
>   	 */
>   	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> -	mdelay(50);
> +	mdelay(150);
>   
>   	return 0;
>   }
> 
> base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6


