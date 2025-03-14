Return-Path: <linux-watchdog+bounces-3107-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA2A61829
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 18:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99A3B1B63499
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 17:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FCD204F90;
	Fri, 14 Mar 2025 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORJj8sj/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFD7204F8C;
	Fri, 14 Mar 2025 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973842; cv=none; b=mzUjjALpFf8Ax98/8bjfoz6BOq2YxDBwp9zSy4SFjYIFBw9pW4uoJuwKWd/D5hb0iMqWZGFsep8QjrO+ZmaTdHgxWwMvddbHh6UaBkiKbujGNVK06ffCmZ8mjHmGoDhGrUpPiEqos545y2nK/6eGPipD+sWhmqtYu7C8qQTP1Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973842; c=relaxed/simple;
	bh=ohSwTjd2avrllQbO2MNZFQyOHeD3BNhTixKELYKH+Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax8EoXvYHB63AnOfNJzvbwRXxZH73BgX/M1vAOvFPTqNoR1XrsTB02vqzUhbhW+ZtfujjR/ae54hALoJ+dc7YTZdCRt1Umt6eg9wd06+RzFvuwxTJXewvwJ2Pynulph0PuUDgA0S2zjArB2QiP92L/joTm1r9OpU8lPI/RKAoqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORJj8sj/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224171d6826so59417615ad.3;
        Fri, 14 Mar 2025 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741973840; x=1742578640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dlPNsSQRPTHB22Ndp+VzvIgQN0PVNLvyrZ2jAW0mJYE=;
        b=ORJj8sj/6MZxhaUwv0tl063TlQoFf7VnqKKYqWPkhOYb9bHAfehCEaMqZeuna+aSmm
         9I9278/0yThAJKFQ3kvBcKYBI5zjzZtZI7JSv2tTOVrnHZ+daz23m3GyWe10MY8ugezH
         cVaIE9h/RmOWy2UvdJXw1MMcuwOHpmzRdEVZQLHvwYdyWq8U7hxCs55Q1mFa0V9e0uwN
         a63vaB9bPDER4YvGkZ3780ac17OVwW6IWS+krhpHpEt37KyGIXOImNLYC4flhEuJqzA3
         cYg9aPS/2yEitbYClzeiZ4aPXXoTo2HM4yBw3GP4wUHo0fjF6NH2LFGfXyE76O0sgQnW
         TmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973840; x=1742578640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlPNsSQRPTHB22Ndp+VzvIgQN0PVNLvyrZ2jAW0mJYE=;
        b=Oi8LnH0fWSqza0LddZIuXl9IfLLYd3LCmPA+96uVqMAQtiplXxQrTXVSFOTcRnYX3Z
         whxIlcv9G8Jw2ohgWIENGwHMo7UzCbnUihwQv51+uwuf5luQXyAqu6fiFKRVyE5/4kxP
         zSPgdav+6Z87LOKhsR9yOxB5DGX21X2BMdStuqOzjWLjXqtUx43CKQbG+iitdL/GYldq
         NZu4XDILzn52PBXbOL6qjF4/BvfgugvqpWg0Nho2DfX4E5Z921m3UiVSpcN+4+FMeJSG
         3twTB01EDdpRNK52xIk+/EcejkwE7RwSpB55UqzGqjonEoNLIHwzfkTftbBPaBMvs6Kp
         VQeg==
X-Forwarded-Encrypted: i=1; AJvYcCVc/TTz7fywOCdSfZeRJz6i7oroADQCL8w42Y/7JyFlQeSH5mP+ZrjJehPy8Ie3hQsA9/piIvaE8zFGUZc=@vger.kernel.org, AJvYcCXhZAJT6utSP/SN8YazgTztcdzgZ0dvWl9IVajmzW16C5a86r5NAy0YfRntGV87/5Di/bjn4b8ow85dyHpZ1Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvxhiw4vMTCi6JTbeiYWDA3uscn8ABl+lFCwdA+9KwAgSx2R9
	QFVK8UaeKx7ax7rjvbR5mH+ClrotyGzEX1bc1ZZXEKUNNh14LPdL
X-Gm-Gg: ASbGncu8IWXW9uxYGaVB9gu4Wogobe9YueIJGPdCkglI07NSBx4FU6JAblbxqrT2M7Q
	rFrYt7V+w8l5tsw014fh9TftHrDrReClmBSDP5NANpjLog+FK6mm4d2vrqkU761XYmzaWJIe9j0
	o0VbpaeCuo9nHIArDDZktN7wy5f9N69BCPHZY+dV+QfvxAWr46I1zK2ODhw8/CC+CV9PylgE8YR
	owXyzUxjCYdbdtk91LMkDYoyJWyn1b5raYAQ5L8C1SLmpXPCH0taBxzaxu4DrmhlxpsGOph3QeL
	dpN6RPgQaPtN7/zSb5MUL3nFqqzVCD/bsvlM3pLuz1C4L/5lSJUA6WdzIpscMo/2zC0OOgaxNCA
	ULsVOP40jrnRDUHi09Q==
X-Google-Smtp-Source: AGHT+IFizML3rPWYBYQ1V1FDTrUWu2FNB4+D28MCfjpVbIvX13A36EX+sYbjaqnDQpl7bfbEsig6wQ==
X-Received: by 2002:a17:903:4284:b0:224:1781:a947 with SMTP id d9443c01a7336-225e0aa0986mr38262895ad.21.1741973840125;
        Fri, 14 Mar 2025 10:37:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa5ffsm31198125ad.82.2025.03.14.10.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:37:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
Date: Fri, 14 Mar 2025 10:37:17 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
To: Arnd Bergmann <arnd@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250314160248.502324-1-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250314160248.502324-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 09:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On 32-bit architectures, the new calculation causes a build failure:
> 
> ld.lld-21: error: undefined symbol: __aeabi_uldivmod
> 
> Since neither value is ever larger than a register, cast both
> sides into a uintptr_t.
> 
> Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/watchdog/aspeed_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 369635b38ca0..837e15701c0e 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -254,7 +254,7 @@ static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
>   
>   	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
> +		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
>   	}
>   
>   	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
Does that help if the pointers are 64-bit on a 32-bit platform (multi_v7_lpae_defconfig) ?

Guenter


