Return-Path: <linux-watchdog+bounces-2435-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 263EE9C11A4
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 23:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD68283988
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 22:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A0B2185AA;
	Thu,  7 Nov 2024 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFSrwKl+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD65218306;
	Thu,  7 Nov 2024 22:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731018274; cv=none; b=EFXrcxppe9JEc+RbSBeIlwlkO8pcXaZFlS3Z+EAexe8NaLIHQSweBKRbR0JhlKSss4znuPSsTq1KrdKr7kWPGrGqJiGGgjz8Ijj2wZAc90shnQwgNRA5ns3J8ya9XX7RjJ9udJNpm6R5SrmE91jCoUwAfzt9MxssyoQTwbOOxTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731018274; c=relaxed/simple;
	bh=GXjbCKiclSKx4ZU6R12t9UE0ENSgHf2sy0+gJBFgIko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsnKjVMvxb5YmKu1GA9L+Fq2A0r7fUT/ty+sT77UvbnRCy/ARRWDnVbJw7z13iDmSUWpmAnYRvQJwcImJCkfVI5aykWKnKgFVwfrS+xDazHqXF1lo61SvgSEEocsTTnRFQYSltr8Mey+0nWY3kly6XJZNZTBaaDg3ZIzJezRENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFSrwKl+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21145812538so13947315ad.0;
        Thu, 07 Nov 2024 14:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731018271; x=1731623071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OyMHqHtKhQmqRPRs3Rq3ZCKkEBsLQXEdBNjkLpVnrp0=;
        b=KFSrwKl+bS0/48wjNhyK74v6jLPLzUvlKVx8J1SeZdmqE10iXVsYWZxAg9Mf7cHhUu
         GH+ARwQgyZxfq/MiXw8lcT/bhpwELxF033PRnLPAoq2y00QGXsToWxSCxUnMBIsP49u8
         UBD4HRyhl8HHugt9aNpMoIwxv5+Musoxvu4CxKt5b+hUzcaurXOxbrx13RM0UHg5nlAO
         OZxuMbNE1xPoNeAMsoiBnzIWMjjkla3MhgwkgQr1jHaa5XcDCAtyxs/CuD4AQRHb5X3p
         IB9GMLj0sRSW863ckb3ZXdXNxIgl3sEzbm0HNsYxq+ZmOub/7E0+bC5ZVVCEc6dbcoRC
         NywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731018271; x=1731623071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyMHqHtKhQmqRPRs3Rq3ZCKkEBsLQXEdBNjkLpVnrp0=;
        b=DwTJzGWujkfqN6rS6AW2Tb6K+RuUnImLr9/FwzMTLeOy+xH/xtHji8cjWHPb49rJT7
         X0Xr5uxVOD54Zob/VJycZUOJ55W72/M4rPAF/KVs+PO1kYBf+fuZFm/O4ZcqmgNV2XuP
         xYmhAgA8VnO4Wjx+OfU+SdIp2w6Ovr0B1oCd9M6PIw+ZBx/Xneualc+UlDbfJNFMPiqF
         txvYlUHRP+eOOXUNpe5rBwxL4mXe71jOtYQy0B82/7pJhb1LbgQm8Op5ewD+yC0ER+Xo
         FFRqcPG9ilK7EKgaWaIFajoeJw62Sb43Ev3MHdGTJiU8wEWVuobb59G0KBVibEbSjPtH
         wV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVSH0WQjC6poqWzd2lzWRpai8+Wt1P0VJDoQQDe17OkUTzbgzgV5OOjXOxYUGjAqvrlW9bRfJU@vger.kernel.org, AJvYcCXFw6Cjg1YL+rRgIXmwHJvznAfKhcIPdy0STiwEhNX4NTZskhKvFm9ExnWg1rqDue+5TJy9d2/tbfOEWvZr8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vuqsH43dtnQTuRqASroudx0nKQTJTMQ7S5lXPTHkfcgVBfAi
	1sRPQgM8XJkOx6huR09WB+ANU+obHmdzfVOJ8DFnJO59F1UIak2M
X-Google-Smtp-Source: AGHT+IF9QwWSsdfnfqyrsKRwE62V+XRxqxNIa3yOWut9MpMuSz/EkM77tdtwENzIjhaMbvxiMNstpg==
X-Received: by 2002:a17:902:ea0a:b0:20c:a7d8:e428 with SMTP id d9443c01a7336-21183c43613mr5210635ad.7.1731018271375;
        Thu, 07 Nov 2024 14:24:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e70408sm17942575ad.260.2024.11.07.14.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 14:24:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <204717e5-4cda-4e57-ad0b-62cb17acbcbe@roeck-us.net>
Date: Thu, 7 Nov 2024 14:24:28 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rti: of: honor timeout-sec property
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Judith Mendez <jm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <t-kristo@ti.com>,
 stable@vger.kernel.org
References: <20241107203830.1068456-1-alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241107203830.1068456-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/24 12:38, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Currently "timeout-sec" Device Tree property is being silently ignored:
> even though watchdog_init_timeout() is being used, the driver always passes
> "heartbeat" == DEFAULT_HEARTBEAT == 60 as argument.
> 
> Fix this by setting struct watchdog_device::timeout to DEFAULT_HEARTBEAT
> and passing real module parameter value to watchdog_init_timeout() (which
> may now be 0 if not specified).
> 
> Cc: stable@vger.kernel.org
> Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/rti_wdt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index f410b6e39fb6f..58c9445c0f885 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -61,7 +61,7 @@
>   
>   #define MAX_HW_ERROR		250
>   
> -static int heartbeat = DEFAULT_HEARTBEAT;
> +static int heartbeat;
>   
>   /*
>    * struct to hold data for each WDT device
> @@ -252,6 +252,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>   	wdd->min_timeout = 1;
>   	wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
>   		wdt->freq * 1000;
> +	wdd->timeout = DEFAULT_HEARTBEAT;
>   	wdd->parent = dev;
>   
>   	watchdog_set_drvdata(wdd, wdt);


