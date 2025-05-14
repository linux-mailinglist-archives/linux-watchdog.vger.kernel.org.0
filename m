Return-Path: <linux-watchdog+bounces-3477-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F92AB7413
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 20:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1FFF189A729
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 18:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87DE289E35;
	Wed, 14 May 2025 18:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elpIh2hI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FE289838;
	Wed, 14 May 2025 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245936; cv=none; b=ZX4iLD2CvFtk1lmY2oJoMpK3+5eJj7fkj87Dg+t1euE8VMiHFYh1P+0zl2OSYE86rDFxdtE2B1LSc5rZqllv95Ur4bH+xpsvPzeOkRKxrL9blqZYLK5UWecEojUaPEp/iE2bXxYC9J1t+c649PoVZP2wvyM85XrlMPaIPV73EPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245936; c=relaxed/simple;
	bh=NKLCWMtT9bUeH7wNJNs83ozV84X8TXUuwcufTbcj4lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnyXbULSoW7cYjsC2UmVmbKJIkhH6K/2G2a3IIuCY4Q+PRKsRS3g7DBvOZl0rXVjCmcvQwgs4IlM0z0/rTG981CeBhuXgVUHmHKiYl3036IIT2mFuoxA0qnDztGkKQYSQ6ig1gdIO7sNwY8QtOm+ru2l5OvBjpExeH5InSes6+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elpIh2hI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c336fcdaaso865975ad.3;
        Wed, 14 May 2025 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245934; x=1747850734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bdpZ7A9mhCIkEnuwUrHpmchCoydgr+FaDnHXJaGXt58=;
        b=elpIh2hIECJ+5PFpcHxhf/OyaotXx/i3jk4egJEvt4NlavxdLS7Kg66wEZ3g/XBDIK
         bVcb9JOz0YXzWFPeInZAi0iIbOu/ki8rUEAj8BkPPh14W1iSTjbULq3xm526i7hS+QVM
         frsJz2OZyvI9LFee6YjU/ufsGgbrKAJh2PxREVKPtjp9/CMtbfcymThD1NsmXIRZEHRh
         Au6uFXZ77REDz2pw91hVyqcruUUnhJLjbsClWqNQ1jSPPLsZeuCyEk6j3Sm0jideaOBa
         ntJ/A2WTC+OJa4eVjUU/iqT2HjAbNCsIHpfn1ySZCumU/Ibo66dg0BVxTjm30pAdHHX2
         UB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245934; x=1747850734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdpZ7A9mhCIkEnuwUrHpmchCoydgr+FaDnHXJaGXt58=;
        b=TPtr8P7w9rzbAo4ssSNbvIgujDO39D559EOZPv6pBm5jWRhWHl3aESxASgSmgcyEFJ
         2tABqAIb84bdB3hjmEgBLvfFreOz3fNA7DHpZV1zX4rTmqFjSkFUZtt6+L3x6JaAX06F
         IwxLVMN4To8E7Y1RdpBdXryQGp7HYg4TWn/BbgvEyEdxaoZk1q6Xf2naaSuuVM6555fD
         hgfzlz7oyhsiqe+VrxSBvlSrm/i0hHYPEdOE3Km7Z4jfbwpJGosHpAhuFArdLl0Vl5MI
         fOuA2X6JtStgZNkMi1QyF56wAVor9eCtbkWPZDRzpbHC7LmCfhjF+ehYIKCVmqd3734G
         0djQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaAQsKONWk7BNvU7XC8Gyhg0k2ejleL/7tO4dL2hz/FtDI+WOrEGOgHz3NchVKJYEhJ7vCJ7zhJ40UaebnXq8=@vger.kernel.org, AJvYcCVz5h1vR7k3kVLzzU80tM1gYEC6ZFmhcdaHzbO2OYhW5Z6s1S6lSAAJ3f+Um8i8I1xpYYmswMxZhKbbOnEO@vger.kernel.org, AJvYcCXVkXIn8Bq6PWCVSdC2iQejQ4wMkjJDAMLWBKSKqU/C//8ozym1mXFbOi+M+z9GMBsvY2dB65mUbSxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8i/qHkzVgybBYjSR39MvtNjWRssrRXUSQMn7RlbHEEhxNh4p1
	EQKcRa370FjLMn/Bhx4ZHIIWNoq9OVacDykLA/tq7lwL4YRJW/qyaWzfoA==
X-Gm-Gg: ASbGnctVv102hF/DtaSaiqFPkpXc1A/fOnwDK+QRCf7McL1nhDI4FtDDjmhH6SG7/fV
	QSbWrJELqkU7feCl2Qgfk2Gc3SQsrTx9KUiqRfqt5pN1RMrf0u4zOmH93k8S8wOAT8fJ6bxqOaY
	DfjA20P9Rtq9T/vlGIGHajbHOSo6mqI9l/u3L94s63DNp5jdSytzY5mUhBUeifKHpYV+nziJZwp
	CHdujljLHWxlhVsQDwHOVrCykPB0VTsXq9lszG2N7p9GPlHq/AnqAFVM/r+R9v8kXKLqleIvgjs
	yIdvGL4KOP2Sw+Q6hswSW6EdMJiT7+rrBUoRP8/4+jGDqbJ+SrFBwrrHAOeMoLVXBwJbNfj5iId
	iSkV8UVhyQHYXNKumJaLKzgwP
X-Google-Smtp-Source: AGHT+IHOu8dDl8zmaHcg+Jhlmv2CjICYrW/SwrhPLBA/5dt/25XpQEFYQzrfzY4CBzUrzX5L1dlSVg==
X-Received: by 2002:a17:903:3baf:b0:220:d257:cdbd with SMTP id d9443c01a7336-2319816fad8mr71443675ad.48.1747245933819;
        Wed, 14 May 2025 11:05:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f6csm102273595ad.129.2025.05.14.11.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 11:05:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9b951404-3bcf-4302-a647-3cef86b4bd3b@roeck-us.net>
Date: Wed, 14 May 2025 11:05:31 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, bod.linux@nxsw.ie,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
 <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
 <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
 <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
 <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/25 06:15, Kathiravan Thirumoorthy wrote:
> 
> On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>>
>> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>>> +{
>>>>>> +    struct regmap *imem;
>>>>>> +    unsigned int val;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>>>>
>>>>> That way all platform specifics will live in the DT, requiring no
>>>>> hardcode-y driver changes on similar platforms
>>>>
>>>> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
>>>>
>>>> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>>
>>>>          imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
>>>>
>>>> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
>>> Let's call the property qcom,restart-reason and only pass the register value
>>>
>>> Because we may have any number of crazy combinations of various restart
>>> reasons, we can go two paths:
>>>
>>> 1. promise really really really hard we won't be too crazy with the number
>>>     of possible values and put them in the driver
>>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>>> `bootstatus-fanfault` etc.
>>
>>
>> Thanks Konrad for the suggestions and the offline discussions.
>>
>> @Guenter, I need a suggestion here. Currently as part of this series, we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, WDIOF_OVERHEAT reasons.
>>
>> Once this is done, we do have the custom reason codes like Kernel Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and few many. Is it okay to expose these values also via the bootstatus sysFS by extending the current list of reasons? Since these are outside the scope of watchdog, need your thoughts on this.
> 
> 
> Konrad / Guenter,
> 
> We had a further discussion on this internally. Outcome is, it wouldn't be ideal to hook the custom restart reason codes in watchdog framework, since there is no involvement of watchdog in such cases. Also I don't find any references to hook the custom values in watchdog's bootstatus.
> 
Correct. The watchdog subsystem can only handle watchdog triggered reboots/resets.


> If this is fine, I'm planning to resend the series to handle only the non secure watchdog timeout case. In that case, as suggested by Konrad, everything will be handled in DT like below to avoid the device data.
> 
> imem,phandle = <&phandle <imem_offset> <value>>;
> 
> Kindly share your thoughts and inputs on this to proceed further.
> 
Sounds good to me.

Guenter

> 
>>
>>
>>>
>>> I'd much prefer to go with 1 really.. If we used nvmem, we could have a map
>>> of cell names to restart reasons, but we've already established IMEM is
>>> volatile and we shouldn't mess up the convention just because that
>>> subsystem has nicer APIs..
>>>
>>> Unless we rename the subsystem to `fuses`, `magic-values` or something..
>>> +Srini? :P
>>>
>>> Konrad


