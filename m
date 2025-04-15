Return-Path: <linux-watchdog+bounces-3305-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7AA8A48A
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 18:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13DFB7A51D8
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 16:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D767D218AC3;
	Tue, 15 Apr 2025 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJE2w4Mw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0823D2A6;
	Tue, 15 Apr 2025 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744735900; cv=none; b=e4V9pqI3O+enToUntjVkuEpH7pm03lShbzLM1xPtp9OF0vvEt4xI3lAg7pIuitsWzp0oPtTB3eb3CCufmFtMKpqycz5mJEi2kUhXC+rPEGWkZXkeC+Eh6zm5zoMjSqLkJgMNCuzDXFm+jNNwrZbQk7MSQFgZoB4dTk7hV/p1Lq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744735900; c=relaxed/simple;
	bh=0F/6aQI1nGI7FzyabXlWuaDBLREyazuiuGVjdy61YZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcB8wXZRVC5qw260PWfJWqJj+e9MXEPK73rZ71Lv29squpnfpteY39LGOSsrIr6fT1EU4ekDYN9484AU70eeozO5xYDmDSSPAEoSRnMxoC7fxlGv4rqchMHwbpNhphskZIqrI/L4BfChC/hypP3HO4t0F/uEJb6vnzmLcsa7HpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJE2w4Mw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c1138ae5so5743695b3a.3;
        Tue, 15 Apr 2025 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744735898; x=1745340698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9/Uh4JROa1aJpHkRa6T5vFRzaOD5k0ox4o4t+TNtF0U=;
        b=KJE2w4Mw/tzpW/z80TDHtc6msfJoR/ihqCK4WqKPsqoIm4RjEFgJoqgBpuodtMVpUp
         bzSuZJbnPRvPGeIhyUqBHWUQbFGlItJL6dtlVSdNzcCPkj/p15tkSIh2W+fwvhqRLjzR
         a8m279xHjPrsorhZLyRCp2lduarOoGuAgOsDvayAtOwU8M+0/i3BXJ0eivhlOvcjBx1X
         MMyMvtTM2ccdNZcL3yUOlBlODmwI+F1nIzr5gRAcr0Hhzx1afrOYZWr1gy4eztZW/YbI
         JkHoSdrSmEM+3AK6vTvakoYycGoEPJmlofPnvqxb5Qier+s8lMzjzortU9cAjx64qlTZ
         H20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744735898; x=1745340698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/Uh4JROa1aJpHkRa6T5vFRzaOD5k0ox4o4t+TNtF0U=;
        b=u9IGZfvl/BdHBtOmNXZlrQ5CRVPhdUMYlU5EDIQy6xHunQOdvDQnw+XIgGouqAiElI
         3Jcqz9xebaBv+XCzqQbLJ+TjimmP9+dLpMSRZgcb9Dc8RIY43MeT2lWuahaChllFhfsE
         Ppyw15EdWqNJnT0N99nUEI5R8pUCTMMfBrspzSAKtS4ql8z23gqDwT2So5etnSm8XTeR
         0k1n+4rQlgf5DRPmHklb+ZlxpDWola6gSnkyv1KZ/rV3FQYT3FBz3jWi2yM3/st1D9dk
         8y41WsHZUWbfAOH4HODfe+COwusST9yFAjArdICvI2askv+ACTD7Izrbw1EFVOJR/w/U
         uQGg==
X-Forwarded-Encrypted: i=1; AJvYcCUg6wGlIa0XnmkditmUy5vnlw2UIbuw+5DPgu3Auksj8r0Wa2srmFNy4koJ5ky9DZYHTYSbpaid+bgZfppHd7k=@vger.kernel.org, AJvYcCV6jGuv5BA4lj5NHXHxhZXFLIzmQC3s1I6HFoNC1/yhPa2zfwirSJyYRZ4oQKdHEx2xBMCcaZ2AAOizdQ==@vger.kernel.org, AJvYcCXD4AfPRUUln9F07efU8+dOvHDtJkP9FWngRwXp9llY8RUUXF8jo1s1a84bW7/VFB6vsKp7Za67U4nTf5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGoHyL4hB6R8Yxg2BlmxL2zot+Z3L/CYj2pgv0pHWYSUxm3KRm
	YrXbNUwehhqJ2bHbcWHC0u84khNGahwN+P+FyoohfcD5if/6rxd5
X-Gm-Gg: ASbGncsUypkXEJaAOVL28Npq2/419O+Hldx5MBaAkCS6rb5qCFQEt8R61S8mPnMF58i
	OthNht/+7VGP7MQdEP+XFRC3JwIOe86QU7JtfTxpdXlargyjU2TcuTIU641x0kanztNZEJ1q2fX
	J4qqZZekcs5JBFEKqLsSP1CnUsIWTNGbIoGcwlYmivy7SlQ3I0O0KaOmzclI6jC4Pmkz5CRq6JB
	A4PhzRfW6Lw0cXUFhR+Xk9f7oN+BberbgK5LtnVmBn9CH5oiiOyzSAAHs4YKjjhhDNsNCrzI/9G
	6qyB7mD6d4rOL99tZmF6y/E7zdTXVLh5KOw/+a6VgcldGsKKmTlz9hFxaVhXsGSjrF3n2Cuo9XO
	vY9yA46zsbZRy4gANJsBJ+wcN
X-Google-Smtp-Source: AGHT+IFFPWYKh788y3gJXuB8EDEip7dNbuK+UfhK4c7EjKX5ZLvXRVWIqOaRJ65vtjh/PL7ebVTnGw==
X-Received: by 2002:a05:6a00:2286:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-73c1f95bf65mr219998b3a.14.1744735898020;
        Tue, 15 Apr 2025 09:51:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e00e8sm8729435b3a.80.2025.04.15.09.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 09:51:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bd9de770-7e51-4ed9-bbef-2a11ad7eb1b3@roeck-us.net>
Date: Tue, 15 Apr 2025 09:51:35 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: diag288_wdt: Implement module autoload
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
References: <20250410095036.1525057-1-hca@linux.ibm.com>
 <abe3b3f3-0c9d-4ac2-af1f-59aa186c723c@roeck-us.net>
 <20250415162440.7369A19-hca@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250415162440.7369A19-hca@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 09:24, Heiko Carstens wrote:
> On Thu, Apr 10, 2025 at 05:10:50AM -0700, Guenter Roeck wrote:
>> On 4/10/25 02:50, Heiko Carstens wrote:
>>> The s390 specific diag288_wdt watchdog driver makes use of the virtual
>>> watchdog timer, which is available in most machine configurations.
>>> If executing the diagnose instruction with subcode 0x288 results in an
>>> exception the watchdog timer is not available, otherwise it is available.
>>>
>>> In order to allow module autoload of the diag288_wdt module, move the
>>> detection of the virtual watchdog timer to early boot code, and provide
>>> its availability as a cpu feature.
>>>
>>> This allows to make use of module_cpu_feature_match() to automatically load
>>> the module iff the virtual watchdog timer is available.
>>>
>>> Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>>> Tested-by: Mete Durlu <meted@linux.ibm.com>
>>> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
>>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>
>>> ---
>>>    arch/s390/boot/startup.c           | 17 ++++++++++
>>>    arch/s390/include/asm/cpufeature.h |  1 +
>>>    arch/s390/include/asm/diag288.h    | 41 +++++++++++++++++++++++
>>>    arch/s390/include/asm/machine.h    |  1 +
>>>    arch/s390/kernel/cpufeature.c      |  5 +++
>>>    drivers/watchdog/diag288_wdt.c     | 53 ++----------------------------
>>>    6 files changed, 68 insertions(+), 50 deletions(-)
>>>    create mode 100644 arch/s390/include/asm/diag288.h
> 
> Guenter, Wim, I assume this can/should go upstream via the s390 tree?

It touches s390 core code, and you did not suggest otherwise when submitting
the patch, so that was my assumption.

Guenter


