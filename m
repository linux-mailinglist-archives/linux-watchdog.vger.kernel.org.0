Return-Path: <linux-watchdog+bounces-3202-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1513BA7BCF1
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 14:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79AD13B6EE1
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 12:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960151DF993;
	Fri,  4 Apr 2025 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp3xg1ls"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB94319CCFC;
	Fri,  4 Apr 2025 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770996; cv=none; b=Tp46gaVhXL4JuPNayjQGo7TagWfbz7QGR4oV/6MfUeutg+bGQD/ny0tM5ydvAVD8waDVoBnEqumtNB5UhrEUCdNHmCvoT4ftgqA0FrxhB1AKpzFyLxK3snQdSgtNC0pBD5C90Mgy7MSZUYUX0EjHEih3vfkP7eUH85nT24BRoqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770996; c=relaxed/simple;
	bh=U4sU0OfCwuPLDopYA4CBD9cOeGPYVZFQOcuGXNOAwj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uCUrt36k/GgscGROGIa7qI9+o8vml7SOFWw9DNSYS0j9tiO5WXrJ7tZVw6G9edOEyPomJK0tTFDISJHGVcslhQWe56C1GA9GXaWgaoWMUJfqNKGRTMKZs5w8suBhhckmcNuYaEXNXmmmz2qtT6F7DhEt2DbECaemyN80UOM/ifI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bp3xg1ls; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225df540edcso35064045ad.0;
        Fri, 04 Apr 2025 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743770993; x=1744375793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cTWRSZfYwp28ZApkbGn5bu5uVaaW7j6ekfDrYEF68Is=;
        b=Bp3xg1lsAale8EkmEiUTLezfI/obnVPHDx2NwmC1yOKO/eOl6whh/MHTd/9Gf16yW5
         YT6D+eNSdcch+EPgLZ0m4n4++FBFllOxCtXj3wsoh6bUq2o5Cpvdb2uq4OnWfvCXBwcI
         KkJxfchHH/hsHl7aGcAv7Tgtex+6bK8ECzTA+xhmuXtDMPuo5QhbfrPgll4RgIg7zyc7
         GXbsnZEwTKUsONCafsFyAa7zdhuOimKm0pqCXV+WNltgCBS7YeCXsf5twHH/bB98TDf4
         dKy9Nau8bYsI4T9FVuffby4IJ9B46n71VZWNGONWpP0TqXY656F4tWsSYcVhhz27h6NH
         yp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770993; x=1744375793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTWRSZfYwp28ZApkbGn5bu5uVaaW7j6ekfDrYEF68Is=;
        b=aiSwWsNpgs7L7O1a7by05kBexjyYrw73vNCnLroiKUmTVbsPBN9e337c68EOTewGcS
         7951d/jP9p7H2O7qQqF/kqOmxCEOLv2SLC0jkExLdegJIb7nW6sA1hYEh1ylu9ZxPMbW
         20tA7DEosvz004oTlzqFnelDsoA8nR9rqjfj2AwQsJxlehuSsLnHT2pRjAbmHe2RLObh
         cvctCvEEwVZjGQ0TGUZLkOZ9/XlmgWH7+Z+mOfqW8+QVNe0V/w+HFdQVtVgORNeIgz3C
         o88xA38ExpS2L+BDwmyhF+onRrONkJs+2+WEK72MnLVd5D+jrLsPJ9Mxn8LnLl4NQh4D
         C1MA==
X-Forwarded-Encrypted: i=1; AJvYcCVYnMaywHLLkY4jL5lQH7HYZJHtgYkKOolHyR5ZyTh2WNLjbvluO2hEQn6JyIp9pOCRKqOoQjkPrukGql4=@vger.kernel.org, AJvYcCVceZmHkzSnzofgTv32AXN/KG478R+rDVYSGdL8ULSW1ILX/PGgU9G8VTMlId352hbEcmmWkM4E0JiH4C55O4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyohi0P/mlc+CsT8+ncMVEEeUf6jPidVKxEEiF4OwgXShj6iYgg
	N/Wy5nL1GfwYj/V9VdbfUy86pDp4tGsvDTtQoaKsfGqZI9hkVNytyi6TVQ==
X-Gm-Gg: ASbGnctzNc3sCO+NfTOREiDz2ggMMWCg6rA9O8TFpZRtvT+dBbQ3cB1KkTJ8dobfWgU
	ja9KO17UCzRDnDY3t8ICOvh2hAEF4kKCT7jxkILNnKZ27RwSJcoQs0WR9AQzY+5yZDRLMRxd0cy
	pnjLGW8DgEKJHyDnPKYWo8LCubVMU1uAnFOMhYAoUCfd6dHpFVzxnXhmYCj0IQN2Lu7Tappazu7
	7i/Ly8mZGdCQmg9qyQybdbsRAWNTaldOFIuBH8vUpr0lLRdCpj4bdGbZlZGokZO+xsrXop6nAcQ
	3kJDV7UgglRBzI68DxYWl6DgP6Djkr8Eea5hxThFmv82tP9gnGXB6cneHOtqdtw8PHsMN7fecmQ
	6fB2h5gsuBs5Avp/X4nzVM90tM2k6
X-Google-Smtp-Source: AGHT+IEIvADKCPSHP5xmmR4+nmjxNuWZCLtL0MDHH7w8lvYb3VYm9gcbSL4/AHj4wdR0RvGXr3fOvQ==
X-Received: by 2002:a17:903:1aa6:b0:221:1356:10c5 with SMTP id d9443c01a7336-229765bc866mr99356775ad.9.1743770992875;
        Fri, 04 Apr 2025 05:49:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1bfbsm3261314b3a.4.2025.04.04.05.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:49:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8b6ede05-281a-4fb1-bcdc-457e6f2610ff@roeck-us.net>
Date: Fri, 4 Apr 2025 05:49:50 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/25 05:39, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.
> 

Sorry, I seem to be missing something.

Isn't that what COMPILE_TEST is all about, that it enables everything ?

Guenter

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/watchdog/Kconfig | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0d8d37f712e8..1d29e5f4f40c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1001,7 +1001,7 @@ config STM32_WATCHDOG
>   	tristate "STM32 Independent WatchDoG (IWDG) support"
>   	depends on ARCH_STM32 || COMPILE_TEST
>   	select WATCHDOG_CORE
> -	default y
> +	default ARCH_STM32
>   	help
>   	  Say Y here to include support for the watchdog timer
>   	  in stm32 SoCs.
> @@ -1869,7 +1869,7 @@ config OCTEON_WDT
>   config MARVELL_GTI_WDT
>   	tristate "Marvell GTI Watchdog driver"
>   	depends on ARCH_THUNDER || (COMPILE_TEST && 64BIT)
> -	default y
> +	default ARCH_THUNDER
>   	select WATCHDOG_CORE
>   	help
>   	  Marvell GTI hardware supports watchdog timer. First timeout
> @@ -2035,7 +2035,7 @@ config 8xxx_WDT
>   config PIKA_WDT
>   	tristate "PIKA FPGA Watchdog"
>   	depends on WARP || (PPC64 && COMPILE_TEST)
> -	default y
> +	default WARP
>   	help
>   	  This enables the watchdog in the PIKA FPGA. Currently used on
>   	  the Warp platform.


