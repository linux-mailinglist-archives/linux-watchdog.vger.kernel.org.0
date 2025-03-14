Return-Path: <linux-watchdog+bounces-3110-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19662A618B6
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 18:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DD237A5CE0
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 17:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7B1126BF1;
	Fri, 14 Mar 2025 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk2HVToZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D089786340;
	Fri, 14 Mar 2025 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974909; cv=none; b=Mz8ZQM2n6Oc9pClEy9ymMqPPdduCKrmiBeMEvIgmdKfrI8SKYWJRXCC/YgnrI3NAWHn0ViJZvr6Y+4z9a/UHSw8FDNQqmWql3BZvuL57C/DbLSFVjjYYLfKephY29ayxY+j74e8GmXEwEi5mbW6XtMJiD9K/jkBmxQMcxhEirrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974909; c=relaxed/simple;
	bh=4okzVPUdM9En8c5yooV0gbqCGswcmF1Sld+zafunyC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlMW7FunsW+JQR2nl9au6IyoGTXB6HcUob34+1hauI+mPVGJp90z4DhYcg7FBrpR2UXDiM0o+7zipHogEJBZ513+gcmasls2MMZcKfhfzRAXuJyaZi27loofoyUiGBK6kS09wx7of4vFazUcOuCEupA0PxB1jq7pvkIbmYVPmT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk2HVToZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2239aa5da08so48904475ad.3;
        Fri, 14 Mar 2025 10:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741974907; x=1742579707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GYuaoE2tpXVMoioaikSazmkTcaXhz8QWbIRrJWb/YhI=;
        b=fk2HVToZGXuc6xvZCwH1cQ8Q2912L/1JmESeLsHz36bISCranFHunLvsS4wHaL5ZJE
         sr7CQ1OTHU2tqOxH+RUNWIFdm/UNQuNaNgD1q4dBfmXOCspEtc5nZAkYhJ99JQNvK2R5
         6X9mRSFyEk0+AGjFy/fOJx6VI9KYK2f2O4m5yZoGce/Sc0Qmg3KFqsP4ZkIdaT5s3uDR
         MUVPPrsaIYJeVoijerQzPayalsQVy71dWs+bCcf7IS+29l72bzcnjYFm7XetlHECaCIP
         Hii1UrOhyyLDPSJ925WYl4hHhKiTtxpYGl69Wwv+2zxhAzORn74+iAgpToJRJwUxG21u
         okRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974907; x=1742579707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYuaoE2tpXVMoioaikSazmkTcaXhz8QWbIRrJWb/YhI=;
        b=X9iDFOodT6Lojc4/tjfey65C+//qI7b/lSLs0tBx4dI8Oa0V3NC1/k/yLxR5xeAIEJ
         YS7pZ5/wT59W9xV6nUxHZLdT2Y3R2QBExfdVky5FBTPjvVGu4btRacE70Cn3LYe3Nljm
         imm+JMap87EFhOKz+LNb7loUx44qxpvCg8yKLc0g3F0eSo8CVwMmRnQ8QKzzsKEcjXl5
         9f9kTBj2apRmp00LcTY3Dzp7pdTaBPIuvcVsA7Nw0QK8QVs3pJFdqH99gDFy9FOiiUwN
         h+VtSkhnt6dL3UV3c839z1JriyQiX2HYbJnSX73DaCjK3o1f3ATD2Qpv8E5xlGzkV/kg
         eJDg==
X-Forwarded-Encrypted: i=1; AJvYcCUGVYlBRCEO7ce7dyEoYckELqo9jpI3WKkjHhrgpPG3U13mU33UOGLQ42ImXchddFaqO1d0nnUdkSZ8c/juI78=@vger.kernel.org, AJvYcCVKO2V04JWRIqgX8/+h2K9HylmZ9/O34sjlpadj9piIcvyJhe4xB6h/ppdEZFRz2sy6LjJtMqekGZ5tk9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoodRJOySaSHuVs3aYcS0+MU+4723HQPyrsRnj8psAV7Y0+5k8
	RmGejGYIW1mbiGrtcJb0POWFHa+jllLuYlJB8OMK4pq6T6jDyMsV
X-Gm-Gg: ASbGncu3AiXeY8PLPHBJJ530m4Bsb+FqNCPqCkcGuR2Q+UvmL7L3jmQE2Jk79fFRIuy
	rYGHErpgA7CNN0Xiqaiarl3/rzx+if1VrpUIElVHcudrZ8hJmH/8DWCY494fHGeWKIF3zl6eWZH
	pdxBt8ucqFW1lcT/mTIDzoz1MiHUh8obJQ0nwc2SPeM/yb1LgoCjhtxow3eMRA003Mbf46HHkkA
	hn9SMPxoKDnNCsNj7kVIpUctgElMCKAq7ILx7g7TjtSaM4xzVGXGAMLj11yyTHEClFZy5O1gP5k
	0+G8352Ct3Ob+xvhJ1tP7k7ofIOzaBkF6A5j7C3W6ELk1MJ3E1cd6svUE2xP/CE7oGABxRrciWf
	SzuneoVNZMo67uYn8yg==
X-Google-Smtp-Source: AGHT+IFfzffcjUeInESVFEr7t0qDIWD/oGmdtUB4ui/iRUi+/KiJTJutkbCHfIyZnt3dHb9VK0PZMQ==
X-Received: by 2002:a05:6a00:3c81:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-737223fe959mr3608574b3a.23.1741974906924;
        Fri, 14 Mar 2025 10:55:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559289sm3249490b3a.68.2025.03.14.10.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:55:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e53b32db-7059-4167-992e-d461a996b122@roeck-us.net>
Date: Fri, 14 Mar 2025 10:55:05 -0700
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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


