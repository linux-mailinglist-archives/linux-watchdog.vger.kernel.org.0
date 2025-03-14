Return-Path: <linux-watchdog+bounces-3109-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 013F9A618B2
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 18:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0D927AEB10
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 17:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E36202C21;
	Fri, 14 Mar 2025 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jf28nNDP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0086340;
	Fri, 14 Mar 2025 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974876; cv=none; b=kAgfAGf1117KppeaWau63K7A1+ljsYD4lPgnuwh/3aR1cxLw3hY0W5RUmK0vXTPoDtFxNL1NAvIWNgGOpsdIvK+Urfsn1i5brRbDUFKCtY55K4oLeyn37itJzmF1Sz+h2J9bpcpkFl+1ynFWGPZbhoavgLuFS3uZ6aj1uIdsQzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974876; c=relaxed/simple;
	bh=v2guxyDs4o6AKkAYAjU35r22xwZHraVPonqAjI3QZrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mk0AbaAqlL9Rkq2Iqk0DybV1GhBdNlFmrT3tgb29bapIoYVjNhAmo3vDbflEZT2/fCJrtRzWKXuG+jfVd3oaHSTyZZgYrgaT2MZqcJbW2DHp97sWcSDeb3HwxV7E76AYKZAGxc2AiJhtXSU0pFOO+SlsKI6FNfr0WIUyvcdFK04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jf28nNDP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239c066347so50835645ad.2;
        Fri, 14 Mar 2025 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741974874; x=1742579674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iXntnSZAYPIM+jxaf+mIa8NQuEJqCGZgPyMOWTcNl3Q=;
        b=Jf28nNDPB6Vrfm6bqT42DeNWgnB7aoLY9qz5b3WqBL4cNbT5lZslEs8tiYqT5qMqLQ
         vPMhd59ehdHp9JQhJjKGzuX1OlXT81Vjh0msXSIsCoGw1ARa/2eflb206IUUw5LG8amV
         pgU8SPwqfFOR65cfTqNhQF0bHAnOr8j3z0tNpbHE0Rl6ADtYxZBZMNwAox/pId9arJ+g
         s9gpZjNbLXOQtuL4WJWkme5BjETJCcS+r42Jt04NXHVP3W8xYKuMneqkIRqId2mmbWk3
         nvJMVUyePM6p4PG27np0AOkbreMzgHmd6sE0bTWbOiOB08ghS7Zp/pMypjDOqEDrKv6g
         FWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974874; x=1742579674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXntnSZAYPIM+jxaf+mIa8NQuEJqCGZgPyMOWTcNl3Q=;
        b=FI+ERbRgRARnSDT7NyyiHEwgC0v7ZuEf/PBjC6ILfAsN0QbR6J5ic58mxW5kSZFfZP
         UKwNZQfEf0ECjGyA5/7vv1nMm5PGLI3LFfp1OVotSrzwz6T//w5mXvxnk2EvZwohv5xz
         qenD0l7E4QyG1F24Un+5weEPKGERRxUkOJx0OqqVc+pkYMfrg7FD/0KGLPZ86zcn0glw
         Z3CFnpPzdnk1sLiQuKAgiefYR3SaaUPiQIsXDFP3dAdeBhfbYUheoK2IFQ3RxH8lEIjt
         cOrXlL64dWbzdJPmkUzQm3Pir4haezSOjYS9XMw4a/8id68k4iLcjrY8v59qg5urKDO2
         RuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfMkFxd/2YKtEKMUWOWQicnApvCrA052ws00Urupx10rxzU0Bi6x7qJLP83eItwRmz2843yFUnLYB2ghw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmaCApv7y4P2bM6Z/3wrv7RmjQCIcPc+NfPa1xCtRdaceT/DPq
	ZTR3MseMA9Po+l1cOJBaF2UT6OfjN4uRqMWSnsZFUAlF0LU+hoN7
X-Gm-Gg: ASbGncvrAjRCrDajdZdGxSjn/vQshSFQTGnThK9D+GHiCRkaGkSq+ajXdxGouB+Bdcc
	HdPppFeoYu3hOTvrvBdmrqnk0287XLCEb+l/lcNMiFZx4IVezG7H3j72BcuRZ2APWmuIvAUKQ/E
	IwWwWKzV8YB/iHDMld6skcDAVfMNQANdyiiu8Vx/sy7etAoVMMVaYleLjYABRmrxeEkjuScmHFL
	ltLL+Y2CfwC2AKGiCJFjxocSJSjAWD+WTObTt975KvcTSiqqeE2b5yO7ZhBbw9+e0rzcuB2FCsM
	vHWPdRVhhuU4O/7m8F7iCKvBaeZDE5N7uKAv0Szkj1yhp43/+cv/S3rgT5ZLYD18qLJrECaJMW/
	fG14H9puPwZOQwW1ugQ==
X-Google-Smtp-Source: AGHT+IFRwBgdl7FuQhUqV8cZZzVwzJUCim9MXgjq09Y2aIttdNEczOrIm9VXfo4AxaHvW8u0AXsCIw==
X-Received: by 2002:a17:902:f686:b0:224:c47:cb7 with SMTP id d9443c01a7336-225e0867fa5mr47944505ad.0.1741974874297;
        Fri, 14 Mar 2025 10:54:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4d95sm31420535ad.244.2025.03.14.10.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:54:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <32e3fd04-d44a-4923-8323-02c53e8dbe82@roeck-us.net>
Date: Fri, 14 Mar 2025 10:54:32 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250314160248.502324-1-arnd@kernel.org>
 <9ff3ba59-be59-4a2e-ac1a-5ce23b1b3fba@roeck-us.net>
 <71b81647-aa39-4c33-b92f-2c9e6d1e606d@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <71b81647-aa39-4c33-b92f-2c9e6d1e606d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 10:39, Arnd Bergmann wrote:
> On Fri, Mar 14, 2025, at 18:37, Guenter Roeck wrote:
>> On 3/14/25 09:02, Arnd Bergmann wrote:
>>>    
>>>    	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
>>>    		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
>>> +		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
>>>    	}
>>>    
>>>    	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
>> Does that help if the pointers are 64-bit on a 32-bit platform
>> (multi_v7_lpae_defconfig) ?
> 
> Yes, that is the problem: resource_size() returns a resource_size_t,
> so this is a 32-bit by 64-bit division.
> 
> Pointers are always 32-bit, CONFIG_LPAE only changes phys_addr_t
> and resource_size_t.
> 
Ok. Thanks for the clarification.

Guenter



