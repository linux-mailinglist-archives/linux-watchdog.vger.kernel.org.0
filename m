Return-Path: <linux-watchdog+bounces-2132-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616E9937B8
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 21:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BE1D1F2254D
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 19:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273C11DE3B8;
	Mon,  7 Oct 2024 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYqgWwPr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8E15B97D;
	Mon,  7 Oct 2024 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728330901; cv=none; b=PQSoyYFlTAjJ27WeiIZhlS/qrnU7/j8CTs0ndcV4zX7JNzjF7s7oFcaNtOUVTyXR2aZy0qc8BjpyLtiGR3Plj6zabZowqFCG+xrqhipx5HsHaqGwdQpTWx/6/ByWcFp4VMpg7FGjp0Z/PJLuGmKjtEHG1RSQXODx5+zg67nYIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728330901; c=relaxed/simple;
	bh=otmBxP2wU0qb42wxzeFY7ds/4prLmvrOFAtfw+3GsAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sts3kMs59mK+s+R9E/r8kLqSyElU0eHUJ5VjHmk4iv7zxSMOtE4CeXL9txqleDZUc0VnsLiM2527XL/yvmZ7zpnoUtBk8Rzm12zIxrTWJFkHW56L92L1MDdhuSuUijPkNYpKO3DixXtHrsloKi9AJcpdWiuLuYd9yfzkncjJQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYqgWwPr; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e06ba441cso863251b3a.1;
        Mon, 07 Oct 2024 12:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728330897; x=1728935697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AaBVrQcRg42Tut+8gGqYU0anqbHtTgHx9qwiR+A7fg4=;
        b=VYqgWwPr6IIhr5zoLUhTq3xZ4aLDmcwVAgl0fiZbQO19bOWdYCzQcWORuJ30vB7V+F
         cNojGY6MeZ3DLtamwEBkHsnOXgZHaCQ5suvsNTDqzKFYfk95DIbH4MzOfIjEjJb6Ky+W
         3MV8LY2qo0kUftTVQLXUik0i60ZzfraMtxttyfnMHnsg9hLnbC6JE3An0F/0B6Dfum/k
         PJiRERuAF6MnqXIma/OJN/luFK6SLPGr/6abnJsXFDwCY/gewrBWMjmGH8kdsLb3+qVf
         3Fky2DxJ9RW/8i9N4hLsBRWmTeVU2FdHMuswK6XT3h2sXy1b1zmp8EBNDKzyDNmb0hqP
         O3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728330897; x=1728935697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaBVrQcRg42Tut+8gGqYU0anqbHtTgHx9qwiR+A7fg4=;
        b=ih7ZJkIxtUl1gGPlFd7YOjYY1xHdNolNguLcfrQc9wHL1iDzdKVbJeTQNp5bF22m2k
         Sn36O0MDGe+0zAqLo0xSYgyqvoP+dD6Q8KNQz6vIPQ7+8P9y9Ifu325B8foemEoM4VEj
         bFfQBpTTOcEWMJxpQ+ZEfKhbu3kFr1QXZ4JmqIEy/aiSFw9kpqnnxNxef16sy2l+aY0B
         MHfIHIR5UsimNSE3pGxXuL63tire9jA6A26scBLl1aBOzaWRjpwRkbSQHw3D6p1tyCJn
         XC04M/TsLnCWnF/R+uxTE8CKdU106KUfGAkM3AdcRSRZJWVHuO47hv7dEqsYujO/FGfQ
         r9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVNwTDidz+HIm5cAew31VdeFOBR6lBRGajEpjrA7sCa7y2+Pa/NeIQzSCEMPPbnPkAC9WDdVCo3T0pd@vger.kernel.org, AJvYcCVPhLi7WUahMHJmV1+cBa8b3i6V4JDlbRUSL2tQLCPnAhQZkDnXqv1MYYMFWdAPSU9pPHh00qtfxqVLj9xV@vger.kernel.org, AJvYcCWgdv3RuQ40/aYfUYZyTiGKK+GvOcpqxbD8Np3pWln/TtBoSeVOXVT9UwjDbaXnittd5+Wk/cmGG4vgY59zpOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+rwzcZdttIGik+1n/1gDjP6945GkD7h1w+OXTnWMiFMs1s0Bm
	F/hAg2CpSwMxiKzFJ33CtcPLaFI8Fuf7Jsoc3VToYSffL5HjlHtT
X-Google-Smtp-Source: AGHT+IFWmlUeNm2a1gkEwaFmcSWer2IaG4mXhmY4npLRsbIVe/0z6F5Cfb/puPUuqsr62PL3sC1PMw==
X-Received: by 2002:a05:6a21:1519:b0:1d2:ba7c:c6e7 with SMTP id adf61e73a8af0-1d6dfa5a199mr18852585637.30.1728330897339;
        Mon, 07 Oct 2024 12:54:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d45207sm4791772b3a.111.2024.10.07.12.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 12:54:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3b7e7305-5711-4b4e-abdd-a9a3e11ca33b@roeck-us.net>
Date: Mon, 7 Oct 2024 12:54:54 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
To: Rob Herring <robh@kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: patrick@stwcx.xyz, wim@linux-watchdog.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Peter.Yin@quantatw.com,
 Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com, DELPHINE_CHIU@wiwynn.com,
 BMC-SW@aspeedtech.com
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
 <20241007175949.GA1738291-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241007175949.GA1738291-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/24 10:59, Rob Herring wrote:
> On Mon, Oct 07, 2024 at 02:34:05PM +0800, Chin-Ting Kuo wrote:
>> Add "aspeed,restart-sw" property to distinguish normal WDT
>> reset from system restart triggered by SW consciously.
>>
>> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> ---
>>   .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>> index be78a9865584..6cc3604c295a 100644
>> --- a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>> @@ -95,6 +95,17 @@ properties:
>>         array with the first word defined using the AST2600_WDT_RESET1_* macros,
>>         and the second word defined using the AST2600_WDT_RESET2_* macros.
>>   
>> +  aspeed,restart-sw:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: >
>> +      Normally, ASPEED WDT reset may occur when system hangs or reboot
>> +      triggered by SW consciously. However, system doesn't know whether the
>> +      restart is triggered by SW consciously since the reset event flag is
>> +      the same as normal WDT timeout reset. With this property, SW can
>> +      restart the system immediately and directly without wait for WDT
>> +      timeout occurs. The reset event flag is also different from the normal
>> +      WDT reset. This property is only supported since AST2600 platform.
> 
> Why can't this be implicit based on the ast2600 compatible string?
> 

Same question here.

Guenter


