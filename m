Return-Path: <linux-watchdog+bounces-3478-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B134AB741A
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 20:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C75C5177989
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 18:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E43E1EB5C2;
	Wed, 14 May 2025 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBHecUyM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE2196C7C;
	Wed, 14 May 2025 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747246162; cv=none; b=XKkXH77iwKbd54Mcf4W76Zwfr3dLCEHZsn7z6PlTA/mFtECzuYsuH4XqU9S3EiwDmNFQ6zrVHTctYwX1FUJRElkCVZfuyw43ljFKXw8TBgPJApGgq8D68M9jwIuYOsK4JL+P1qVnBkjVWAa8Va/IfOeYLCgGt2w/3MK6dr5kysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747246162; c=relaxed/simple;
	bh=TWEeF3FIwffivcD69LOpbpJvcTv56PwYnVjLEOxgtac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNNzbd3nNb8Xdec0THrrPali/iY0lTn5fItRHJNHANOfCB7zyDgO//XWVlG9NiGtwvg6EMabQcifRmLRW0tS88B1X8e1xV4xl13KrKPagdjtIZp7BYimUpAXhMOrL4AlmCrXEAkgAg43tl9+KJNi1Iewxctlz5cOeeQ2V7WsRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBHecUyM; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b1fd59851baso17121a12.0;
        Wed, 14 May 2025 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747246158; x=1747850958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ULDTPZ/Q8WDC42rx45jcf2YeFArXxWDu9Vq6TcbBvkc=;
        b=PBHecUyMo/KZ7G6uiIh0e5YZmHhDqr0PvMCHPzn9UHZGgwoNbImxRXkqRVsxNoGTh1
         Ny4noHAnnOgVO9nUzAVvhlKRYO9ys39ZFRNnekDDlSKfuJhRHdsRpV5sy7ETB4vZnktb
         Hoqt0WG51f949v+nJRoHAnHrBaXV+Fv5yv+tZayIADoEBUjTOOabVp7YIOO1BBWWKNEz
         m8+z/RH3xgOSNpJ6IOBIxnyu5Al5oeLZ87pFTstzRzq1HQgiulh8v+Mtltzb/QhWq0Oy
         CKOhM3qRjQv7fnXYxzD+DnfmSspFl2Rim+zb0K9TR54xigUsT9G9n4/h1SQr+S01UGvy
         +rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747246158; x=1747850958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULDTPZ/Q8WDC42rx45jcf2YeFArXxWDu9Vq6TcbBvkc=;
        b=OIxWU2Ae38cD+Ilq2ucGPVur1I9Nb5MdHoSTXBnTwstc7cgQTW5iSMF/VhYHBgiLbT
         NWWJxaAAIDHil69+Top3nzy0X7jNPOk6E8YETLzUGE7HK1SvKN3urMFfd0gjNw5IHWfG
         +K+vUwfcaGXY5v+EluAeVsehk/BBxFn/200AdO37cuA6nfS3FC8+M12KMT3hXaVWTt5C
         9TesUxrHXKEj6tp8b/ve5el9Y8oMVOGnyYE0aYXAMYY7ohDX9UjrqPUylj9wgJ/pAgaK
         h7xB7/Ptx0RbCQOQO/B3Vcx5WmtyIjhBNojYYRKBNhrt0OQd7bRAn7aGYnAtMyCLRUhj
         PRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1WCRb0Sw9EetYIUX+uKM5OnTMUA9MbKdckLi53S1r3lNSz0iLh9actxG20Gkblxp9zmHQ9w64zZw6@vger.kernel.org, AJvYcCXxkwX/Dmo/FX6zQVBOeq5ZEN0rrVm9TKAwkrwkJyMbzU9hl8raX6Xvs61UIgsycrnK8zN8L9n718f/U52J@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3lz9Kj8ZU/LbVyivfV0FAzXR7EB73SmJSBulK7Rd7QjMIeoN
	L7YcnDs3ap74GqfrLmPmLUXuWGdTl28lPIMMl3cOseGgOkYQ+C2t
X-Gm-Gg: ASbGnct5F2tdZ6sZ7ppdYvgLQADsyC6qnjlBBxZ6ScT9QorSzyj5Zw8MjfCGhdLJfVp
	mXr4jirtEJEDg3Ni0ipL+ejJ6kxUC2k0RBSweZftcn8R9O3PQkuoK0lhX5r0emXOx+VwMHnxhZa
	BnxJmZdCJO2k029OdUmn7w4rIablD54o9epSBJt+fZ39uL11xvEwRkUGTZitbk1uJVbW3PUdU7N
	r79BPj5LMg+WbOGYbJ2bsNyeTOX6lMqXDjKvA8Xz2q/N+ar4ZO9t1s3pQQC3YsVyR558PymnezI
	9zAXc5nuWxd+kYd8EkC+NNlSxn3bxuGzWKxqcCcNWjTjDVU14Uy1any6k1emgZWb5L2ofbVxVS+
	Cy5MVj+nfohxWIjevRZxitBjj
X-Google-Smtp-Source: AGHT+IEW+o/7nHuU3n9jWceYrdb8uyM7bO7kRGY33fwGU7J24OIzl7vJ8KpCEgSRgpMjKR3aAqeIDA==
X-Received: by 2002:a17:90b:1fcd:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-30e2e625db6mr6285302a91.28.1747246157704;
        Wed, 14 May 2025 11:09:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e371d626esm1678651a91.44.2025.05.14.11.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 11:09:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
Date: Wed, 14 May 2025 11:09:15 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, ghennadi.procopciuc@nxp.com, thomas.fossati@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/25 08:30, Daniel Lezcano wrote:
> On 4/10/25 10:26, Daniel Lezcano wrote:
>> The NXP S32 watchdog, referenced in the documentation as the Software
>> Watchdog Timer is actually a hardware watchdog. The system has one
>> watchdog per core but an assertation does not directly reset the
>> system as this behavior relies on a particular setup and another
>> component which is not part of these changes. However the first
>> watchdog on the system, tied with the Cortex-M4 #0 is a particular
>> case where it will reset the system directly. This is enough for the
>> watchdog purpose on Linux.
>>
>> The watchdog relies on the default timeout described in the device
>> tree but if another timeout is needed at boot time, it can be changed
>> with the module parameter.
>>
>> If the kernel has to service the watchdog in place of the userspace,
>> it can specify the 'early-enable' option at boot time.
>>
>> And finally, if starting the watchdog has no wayback then the option
>> 'nowayout' can be also specified in the boot option.
>>
>> Changelog:
>>
>>   - v4:
>>      - Update the watchdog timeout when the callback is called (Alexandru-Catalin Ionita)
>>      - Fix the clocks bindings to have all the clocks described (Krzysztof Kozlowski)
>>
>>   - v3:
>>      - Add the clocks for the module and the register (Ghennadi Procopciuc)
>>      - Use the clock name from the driver
>>      - Removed Review-by tag from Krzysztof Kozlowski as the bindings changed
>>
>>   - v2:
>>      - Removed debugfs code as considered pointless for a such simple
>>        driver (Arnd Bergmann)
>>      - Replaced __raw_readl / __raw_writel by readl and writel (Arnd Bergmann)
>>      - Reordered alphabetically the headers (Guenter Roeck)
>>      - Enclosed macro parameter into parenthesis (Guenter Roeck)
>>      - Fixed checkpatch reported errors (Guenter Roeck)
>>      - Clarified a ping on a stopped timer does not affect it (Guenter Roeck)
>>      - Used wdt_is_running() to save an extra IO (Guenter Roeck)
>>      - Fixed a misleading comment about starting the watchdog at boot time (Guenter Roeck)
>>      - Replaced allocation size sizeof(struct ...) by sizeof(*var) (Krzysztof Kozlowski)
>>      - Drop old way of describing the module and use table module device (Krzysztof Kozlowski)
>>      - Replaced additionalProperties by unevaluatedProperties (Rob Herring)
>>      - Removed the DT bindings description as it is obvious (Ghennadi Procopciuc)
>>      - Fixed DT bindings compatible string (Krzysztof Kozlowski)
>>
>>   - v1: initial posting
>>
>> Daniel Lezcano (2):
>>    dt-bindings: watchdog: Add NXP Software Watchdog Timer
>>    watchdog: Add the Watchdog Timer for the NXP S32 platform
>>
>>   .../bindings/watchdog/nxp,s32g2-swt.yaml      |  54 +++
>>   drivers/watchdog/Kconfig                      |   9 +
>>   drivers/watchdog/Makefile                     |   1 +
>>   drivers/watchdog/s32g_wdt.c                   | 315 ++++++++++++++++++
>>   4 files changed, 379 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
>>   create mode 100644 drivers/watchdog/s32g_wdt.c
> 
> Hi,
> 
> Gentle ping, we are close to the merge window.
> 

AFAICS the patches do have Reviewed-by: tags, so this is just waiting for Wim
to pick it up.

Guenter


