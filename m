Return-Path: <linux-watchdog+bounces-1205-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C72291C41D
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 18:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 234582861C1
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2024 16:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00C61C9EDA;
	Fri, 28 Jun 2024 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miOjVDyz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F021C9ED4;
	Fri, 28 Jun 2024 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719593340; cv=none; b=scN0GqSrVKj6+dMZtPJQoDLZt/Ub82+eCPhq9p9B0q241hnTWa+dXcCRDULHi4gA7ZdpDwv3x6oZau9Psrjo4X5YtV/3R57xRoWuEBQughFkEBA5vAdD85NFB8xVxspet1ZOsfg1cQpb0/RWYbM/BvTPGqnTTaMWUJQWmbXhHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719593340; c=relaxed/simple;
	bh=j95cM/d5z9HKqvFhw36xElRJ+ODwQKK1fG8Z1dNQmps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXd5uyx/Owg3rq5pO1cNzxA6XpPui/c/MCbrvvkrU1Ng1YHpqLwZsk5Av3SW0jKvA3kyGkDACntuJKz50EoHhBjhKTXL987XQSDTwuBwL0rjqe42Jc+ZxWc4fFgLvJ2pPXRKktTp+M8kTHj2Pv1jdYdGcKp36b62BPX8vBCI1jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miOjVDyz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f70c457823so4516035ad.3;
        Fri, 28 Jun 2024 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719593338; x=1720198138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5uI4LJfJFV/GBlsW5LjFsGjuX2Y/XiOBvRyUaPOHrnA=;
        b=miOjVDyzTFsbZSz66N+O0v780QxYYZqn+1raTH05qC868YD5NL36MvPk2z5ujE2yLM
         ABGlpshUVCF/QhEl4OB9Oo9hRZFqizkUGc578TtBvqWhn7VngIzO5+pGex2U/Lj7lwow
         g5+TWi8V/SBRdSutMqPSdeabIplNheWF3ao0OmTH+RWxXEkkPM3cexMJNhDj8OHXYlhw
         rSP1/U/JDncgoQ7uLVTKFi7NwIDO3A+u3e5Hhv5KHaGoMX2TqgTd3/8sqWesMGAfUFDF
         yUAjTxT4t6WbzYpSUE/RTJ26wB333HkaG4XPXHIMDjCRq4R/GvB2LvTBdSL8PoIvx7mk
         p3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719593338; x=1720198138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uI4LJfJFV/GBlsW5LjFsGjuX2Y/XiOBvRyUaPOHrnA=;
        b=S0/X1iSSWzreODa9nsRLg3oclFJ02ySsHJWDrxPUkXjxT1zsd519BzK7qgmWlh0MoQ
         1Ohe/bCGdI33ubWnpxXQQVZBK/4R4OUIWUm3Il6X77G3YKy5OrhOb/Rc0XKW/RAUl/XR
         Hd6aVgSSzgEBZE7z/rPhQjte5pTl92xd7qYBwFiKzFdo6urlkLGrtZ7E7/EN2Ffzom+H
         Z7VaMopaYxV6B8Xd7N76TDc7q7IrYE4ywDz2Fq/+btebzf+EWybiTnv0xIM0YySV8toM
         OoA2fVGu0fDeiI4M5Ip0Od428CXeJINmjZvb9DuJjBIX2ST6Ee+QUPut3yjj3QiVYuOU
         HOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwyz2gTTgNjFG4noqsyG6uKoy5js8Xjg4pUBlUkJkdIyHMXCnl4ywqEEzN4IVk67yHkrpZ6NCKM6dpu09c2QKTjb4bHwsCl3+60g2q
X-Gm-Message-State: AOJu0Yzk+LC5AMrwL/I9pOR42JFxupadCb6lbghL+2j4fMn83xZ/bsCQ
	bKoLRWSvEUNzwtd2xozBvs1bLmKD3L/esv0BDmrXiLw2YhN6w8Nyb5gnRw==
X-Google-Smtp-Source: AGHT+IHczgOa70F6xEmF0Dn6XS+XVyH3jpRZ1YiH5gYe8q6e1Qdf1xnaYBVpoM/6J20eliGbCAMicg==
X-Received: by 2002:a17:902:ecc7:b0:1f7:42c6:50a5 with SMTP id d9443c01a7336-1fa23ed9805mr166122915ad.28.1719593338483;
        Fri, 28 Jun 2024 09:48:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e392asm17532875ad.78.2024.06.28.09.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 09:48:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6f15268-e2e4-4ee2-9e17-40785b9861c9@roeck-us.net>
Date: Fri, 28 Jun 2024 09:48:55 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: starfive: Add missing clk_disable_unprepare()
To: Chen Ni <nichen@iscas.ac.cn>, xingyu.wu@starfivetech.com,
 samin.guo@starfivetech.com, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240628033508.281058-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240628033508.281058-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/24 20:35, Chen Ni wrote:
> Add the missing clk_disable_unprepare() before return in
> starfive_wdt_enable_clock().
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/starfive-wdt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
> index b4b059883618..19a2620d3d38 100644
> --- a/drivers/watchdog/starfive-wdt.c
> +++ b/drivers/watchdog/starfive-wdt.c
> @@ -152,8 +152,10 @@ static int starfive_wdt_enable_clock(struct starfive_wdt *wdt)
>   		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable apb clock\n");
>   
>   	ret = clk_prepare_enable(wdt->core_clk);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(wdt->apb_clk);
>   		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable core clock\n");
> +	}
>   
>   	return 0;
>   }


