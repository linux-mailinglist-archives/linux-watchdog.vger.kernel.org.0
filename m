Return-Path: <linux-watchdog+bounces-1970-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075F97CA22
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 15:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251DB1C228CA
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EF019F10E;
	Thu, 19 Sep 2024 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxPAeT9u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5019F106;
	Thu, 19 Sep 2024 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726752210; cv=none; b=cO/K43ovp+c2oH23kJHeSwqnvbzvzl6Giaht8FkAaTHSDv/9NgiAkedqKNiSShrrU5CDPGuaiST59s0SCowqe29aw3etp/7BpANUSsyzpZJksN9uVXtsWM6IPr2dLbKNn7aEWj8JV8H5BX5hzDyL2VcmZaL+d7+TgS8MIEax0OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726752210; c=relaxed/simple;
	bh=+lipuIgi0xD/2ETdQydvdYiUCV0tPG14JkguziY120I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7zDa7J0SqSInjp6/cD+5p6plAmrQWhyPQ5Su2e/roNcmD8NNg2u5bGWQS8h7t8z+FboJx+bBu7oQ+sFvEgJ3QErNruJp/QvqUlEgrdphCEajEsIFmCxdTaRNTJQ6boALQycPVh7cgONC3HcGOZH00neObv1vYEcmlbUlC5p9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxPAeT9u; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71971d20ad9so623396b3a.3;
        Thu, 19 Sep 2024 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726752208; x=1727357008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+L/aDtPlxP1+h0gT36L9k9qxRKZsNEDO3N+lh/9wh4k=;
        b=XxPAeT9uDuLFvVU6EsHT+AaYGHh+4q2Nu4wkI4HrC9y+i+Y5UvK1GSmyNkrDGMnDn3
         XiJF1Ugw7juUIbczdmr15MZXl9mN/UmM9J3tukXOyeWG6Z80MGSuqvVtNFhZ8cxXNM/a
         51doG2YadyTd3joZ0yhZ+VD0AfkYvGtOmjZnv8de/LkbFrFHEwfaky2BCBNaqqDBjwAX
         2k+/2UW3UyFXgyaFlcgBINKvTv8eFZoB6lUFZ7Vhu9ZFYpcm3Uwc3cZ8rh9tBD2CK11D
         70lA5CJ6hDMjkReSuk1VAWVc7JAr/1FDEZS65F3ijf2CL6mwDoQwvu3ZwjfHlUdQpaC2
         j0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726752208; x=1727357008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L/aDtPlxP1+h0gT36L9k9qxRKZsNEDO3N+lh/9wh4k=;
        b=Cw+bcfQVfKQrGJgdwnRmCvq0ZV/fxYMV9hQ6OnvI85LbzfhVouZOWR2nO5ymdAYWSq
         0BaXCImnbazXMaUOkLNYJ+fTsdt/bBUut+r7ouQm/skRzeILwX1qnpZR20kgDP445DJU
         2Y2wSXVwhuGHJ2ZeBWx/M29HVrAUHeyDaXcSyNXubOxOq0OtHXb4klVMggxZeyZMy4fG
         Np2/yx1yf6Pm/GC0nFfQauTj5cYHW31CKcrlKTHcDwgFzTigbL12kpsVKPpvhxgveWqb
         LKT9eqJEsVGURBk1tqOhwON4TXtmmHoL7+KYvWKZMIWhyL+QJlRr9zglTBSmpxIUxogW
         ZZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV1rYFW2Itf5i/KI78v6NTEIJupIG/SbNEm1wFeSCIYB0Lv/jq2GQSZRM2MiDv8EqUoozbKMRtOef1KnPu@vger.kernel.org, AJvYcCWG81GfoCTSU/lEA5lfzfEuLMLnDejUE+s4Y1x+sHehWjOPEMhsgEVLwOAPa2Uy+Vipp2TcdIXEUap450ECcgY=@vger.kernel.org, AJvYcCXEBtDlazdSFTPvh1Z3KE1dGrCiT3zMq4SBhH5FRfzU+kAAMpL8zIQertnCkKeziLMDK8bNLsA2V1hm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6jIxsDQlGClgnfqOjGFZzpXTNYybHnPDvs1n8cN2cNjodm4b
	n5K0WiHCvGoOj4fiRP1Zym/C+KjyeWkzPGj1i4sRW/E6X+gg7ai2
X-Google-Smtp-Source: AGHT+IGJCCALpQaH6fv2x1ENFsuyJZMAH5l2nCKDkHNRHFY0kGMHBZxieG9qTxkARNx/m0AAHAt6gQ==
X-Received: by 2002:a05:6a00:3e15:b0:717:88eb:824d with SMTP id d2e1a72fcca58-71936a49609mr35821476b3a.7.1726752207634;
        Thu, 19 Sep 2024 06:23:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab9a1bsm8236118b3a.81.2024.09.19.06.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 06:23:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85e5e88b-524f-4e57-a5cf-6e7eed65839d@roeck-us.net>
Date: Thu, 19 Sep 2024 06:23:24 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: airoha: document watchdog for
 Airoha EN7581
To: Christian Marangi <ansuelsmth@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, upstream@airoha.com
References: <20240919122759.10456-1-ansuelsmth@gmail.com>
 <08288a0b-3e10-4f83-8bc7-0587328ee9a0@kernel.org>
 <66ec1ba3.050a0220.2c6214.5dd4@mx.google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <66ec1ba3.050a0220.2c6214.5dd4@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/24 05:39, Christian Marangi wrote:
> On Thu, Sep 19, 2024 at 02:35:02PM +0200, Krzysztof Kozlowski wrote:
>> On 19/09/2024 14:26, Christian Marangi wrote:
>>> Document watchdog for Airoha EN7581. This SoC implement a simple
>>> watchdog that supports a max timeout of 28 seconds.
>>>
>>> The watchdog ticks on half the BUS clock and require the BUS frequency
>>> to be provided.
>>
>> Clock provider should implement clk_get_rate()...
>>
> 
> The BUS clock is internal and not exposed to the system hence
> clk_get_rate is not possible saddly.
> 
>>>
>>
>> ...
>>
>>> +maintainers:
>>> +  - Christian Marangi <ansuelsmth@gmail.com>
>>> +
>>> +allOf:
>>> +  - $ref: watchdog.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: airoha,en7581-wdt
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clock-frequency:
>>> +    description: BUS frequency in Hz (timer ticks at half the BUS freq)
>>> +    const: 300000000
>>
>> Which bus frequency? Aren't you missing here clock input?
> 
> I'm putting here property to describe the internal clock to what the
> watchdog is attached. Should I drop this and just hardcode it
> internally to the driver or maybe declare the clock to be 150000000
> directly?
> 
> Tick frequency is already not well defined so I tought it was a good
> idea to describe it in DT.
> 

If the value is a constant it should not be in devicetree.

Guenter


