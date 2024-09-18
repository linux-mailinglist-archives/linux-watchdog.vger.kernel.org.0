Return-Path: <linux-watchdog+bounces-1962-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70597C1EC
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 00:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E0AA1C20BEB
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2024 22:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3CA1CA686;
	Wed, 18 Sep 2024 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM8U2P8I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016016DEA5;
	Wed, 18 Sep 2024 22:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726699425; cv=none; b=csarCpEXok8dURlszU/asWb6cVkK+DgA9fqqnjFIJTIoNXSptwN36aU5HDJv9IkHL2Fk06weKrq7PEY7BXSTXVwhknx2u3fIr1nJyushfDz5s34R6cDyLihVYmFCpFBZ2duY5C4/fHLE4WDMcjTdqg0Jf9yD6jd0U6yLCk5Xakk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726699425; c=relaxed/simple;
	bh=BBhJOmQ+iUeB17qQnSModNuUaLqN7mk5EHZJDM0hkYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aLdj8JOK05yDWm1O4dldeorg+nRLPYZGUkvIiorWx05DzyaXly4MJ4xDahhhewqI8XwlaqB7kzrawqwMd8o1XYphzSs3YLm0v9J8HYglkTrogyZRA1xIbq73fYAUE6CuPnni2wcVBZm52y3VCtPS61teEIjgsepP1d0tikpOHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM8U2P8I; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d87f34a650so158077a91.1;
        Wed, 18 Sep 2024 15:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726699423; x=1727304223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mfBGT5o+atA+TISO4F0hfEOz472qqvkQ2oNT+vTuCRY=;
        b=dM8U2P8IyD/pMvYpjkgKFouTdXC/LGJMW9zAk32aMNhoxsSQpf31JLcLJ1iSMgXGPp
         poMIl7YjGZJmwV273/VlgkYY7yeyE3GZDdfnlrXL/1hyIC/9tse18w+4RWb7ubXIYGSE
         aihB/yj+H2VxmoygdlN+owp2ukxZpVFxgXtZsSQgbOdbUKLRsKrxNDoFbg3OvFqS2BVO
         dWfqS/TM90D1jpKItJ2ewJV4PkI/YQw4x247AppGVwOYKsuLLeoOeqB+w3dkZiS7ghsy
         a/oNidNBYp+DP16WDFO34mN8VBV3MwdGGGPet8ryoQR7G7BlcX2h+UtZJE7l3YE/3KB5
         1rzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726699423; x=1727304223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfBGT5o+atA+TISO4F0hfEOz472qqvkQ2oNT+vTuCRY=;
        b=ZQTFyRnHwWw1dhUPUedYDADdstc+tlAWRSRc2VlUhhepzn/WXWXWGNh57vqTMIBVih
         uXEVMRXq+UyyuCJWsPE99SlzRLWxW3olRyVaHDhuyqIm7+JzDc97uU1zV86AcXa2t2B0
         tZwYkU8oxsf6GiZsYN6KwDAQ/+AfQJoyuQyVy6Wd0v8AxyNSOIx36douCh+nwXc+3Pni
         2mB1AeLxtcCJyIj5SkL0iHn5U9N0GxG4WjX3v4wRnXh78RYMG+VXi+yqdmkP0MLODeI9
         yqLRzwKulAdGt5hnpQvyTSSM79Dda7fxlCdvM/08OrpVgJJJKtkyCqx8VDzo6jurxYaM
         34HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZzeZFJx3gdzj2VcMAbsJH+E04g/YTvYbQ3UH9eaFXb9nf1JYn1DOGNOEXOtz5sV48JNuuGxAfW9H+Fw=@vger.kernel.org, AJvYcCW2WxYhlM+ie11dQ/OMKYpIHfPaYt6C7atMPRUCxQCEENjpOwdq5wSBlH2bY77/BAGLom5VgCq78V43sci9/m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYDjKChefFVl76UBlVSxGdZdG2HEc2PU45IrqOvxmIoSTx9uI
	5qFSGPPUoHqPSbU1k2NeNRt6f+hE7fLQIwwaLCgsWTkDMNVuurPm2MJh5w==
X-Google-Smtp-Source: AGHT+IFy1HFwmMNnBXc0YVEKuXoBc2r7LZurPd/xLKg0ew2vueaF+TmcjV4Bhe2NIJnp04w2+tFrtg==
X-Received: by 2002:a17:90a:9a8b:b0:2d8:719d:98a2 with SMTP id 98e67ed59e1d1-2dd6ce00481mr1855690a91.7.1726699422735;
        Wed, 18 Sep 2024 15:43:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ee84fdfsm245353a91.2.2024.09.18.15.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 15:43:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f52deaf1-492e-4cbe-8e46-8999ae2e481f@roeck-us.net>
Date: Wed, 18 Sep 2024 15:43:40 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rn5t618: use proper module tables
To: Andreas Kemnade <andreas@kemnade.info>, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240918212925.1191953-1-andreas@kemnade.info>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240918212925.1191953-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/24 14:29, Andreas Kemnade wrote:
> Avoid requiring MODULE_ALIASES by declaring proper device id tables.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

This needs a better rationale. There are more than 40 watchdog drivers
using MODULE_ALIAS. I would hate having to deal with 40+ patches just
for cosmetic reasons, not counting the thousands of instances of
MODULE_ALIAS in the kernel, including the more than 1,000 instances of
"MODULE_ALIAS.*platform:".

Guenter

> ---
>   drivers/watchdog/rn5t618_wdt.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
> index 87d06d210ac9..97ef54f01ed9 100644
> --- a/drivers/watchdog/rn5t618_wdt.c
> +++ b/drivers/watchdog/rn5t618_wdt.c
> @@ -8,6 +8,7 @@
>   #include <linux/device.h>
>   #include <linux/mfd/rn5t618.h>
>   #include <linux/module.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/platform_device.h>
>   #include <linux/watchdog.h>
>   
> @@ -181,16 +182,25 @@ static int rn5t618_wdt_probe(struct platform_device *pdev)
>   	return devm_watchdog_register_device(dev, &wdt->wdt_dev);
>   }
>   
> +static const struct platform_device_id rn5t618_wdt_id[] = {
> +	{
> +		.name = "rn5t618-wdt",
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(platform, rn5t618_wdt_id);
> +
>   static struct platform_driver rn5t618_wdt_driver = {
>   	.probe = rn5t618_wdt_probe,
>   	.driver = {
>   		.name	= DRIVER_NAME,
>   	},
> +	.id_table = rn5t618_wdt_id,
>   };
>   
>   module_platform_driver(rn5t618_wdt_driver);
>   
> -MODULE_ALIAS("platform:rn5t618-wdt");
>   MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
>   MODULE_DESCRIPTION("RN5T618 watchdog driver");
>   MODULE_LICENSE("GPL v2");


