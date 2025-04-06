Return-Path: <linux-watchdog+bounces-3209-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34BEA7D055
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 22:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5597B7A1916
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 20:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9224A21;
	Sun,  6 Apr 2025 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImTvZbGc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9804190678
	for <linux-watchdog@vger.kernel.org>; Sun,  6 Apr 2025 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971621; cv=none; b=Fo6hwktoy8nj3fPmfnOjZziXQhjy/OZG80+zYqP8+3tGAch8B31x0cyZHePPr4YQyqG/KeXyWl438kWvlsAneFAiAteFy3sSNQDRqYryIeXUEO9HPoh7n5dyJV/S1EN8z178khP6yeOwOX5U/AYtIwCaVoxdXoL2givcSCZN5cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971621; c=relaxed/simple;
	bh=DWya8jh2xYXaCJnsy7kqSiKaD73itXYuK6UFzHlZibY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNx9Rdwso7DuDgpjXbya53imdDj8X0CUpE4gj+WG43Mx2MChpOg7tqHV9Yz44dkHwHWzPCfykNyKZSAkgUHiw9ilDPei27DFSkDlmUJhTBTfVAQWesl/Xcv9wook1PkVNwzlmkzIwoNFVsSXb3E2xG3F52ZhROag9DTE8FPjIpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImTvZbGc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c14016868so3262485f8f.1
        for <linux-watchdog@vger.kernel.org>; Sun, 06 Apr 2025 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743971618; x=1744576418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCGCDpg/t2fUSVKec7gttoFuR8UXHlXhKq+zwaUKf+Y=;
        b=ImTvZbGcmN2jdytwRlcqg8IlmbaQNmT9jBtN0b9qDXUoG4kHr+NdVepnEtHsG4eSpf
         s8R74LMKTUJRp+RDeGEPiemjUwE8rxrnJpoV1mFVOqWtgThh2L/Tn8JzRu+Ht2t0FDi2
         cr4IyptAaRwmgy0pNZHZKAMxpJzAGXBY9oDFUEnn05D3rqpy6rdB+3i6wqwcmMBJ6FIo
         DS0TbyRhzo64s5DH3+fWYEyKecHTca3MKKMJL1DFcnns9MwRsKXMMyxQEcFpIeOL4njB
         zc4vfkY3VNcIH+vjNLNO21AW5OzOq2s7QK10PstJ96FIZKfKEZrQcI/PbjV1b6m++ZnX
         0fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971618; x=1744576418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCGCDpg/t2fUSVKec7gttoFuR8UXHlXhKq+zwaUKf+Y=;
        b=mTX7Vj0ZtAq2K/pV3r1E88A9cEpsgewUZNKE98AUacS1rFnmivURl5/LvyT3M5DiSw
         jgBBwKCfsBLKC6sr7Ld/UT5DJ2IrN5R3U/whoM0e0/Ua+do2qgaSFh3esgWeJukg7Y6a
         JkSdIuHYUQIfMI/7UD0zX/lsKwX8mlagyEp7AmPVJdzq14bnMShzlK81epOYkKH9hCFm
         k/B7rP0l+5hQzQiq3yJ1qLlSGTlU5ULT3s5SZv5ABxWlG/O5cz5uvtTznr0zqJlRTXII
         CQ0b6v9H1m/2MFnspJB7k/ddd3f6A5Hprzbl1p0nKeJujeuscfmUUa6lcpbxTPe6T2gC
         bhcw==
X-Forwarded-Encrypted: i=1; AJvYcCUXqvZPs/1PPFU1gqFdSfLiN/U0zh/Ei8q29P0AcxwjC37FcaWuXtjtfOb1FN/J9lYd/gshdWJM7CiHxebuLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8tx3WvFil5/eBlJc/pv9O1FGdZ0arLtamb4bM85rPa5zlIPl
	0PYNLINczBdGsUDrIdDGgntbBFhUCeQucr1rhLOb+dM3BT099hxcum0bPzicfG8=
X-Gm-Gg: ASbGncswMMZGD17ucfnb5QunqKfDhIO/iWe0i+uNZJ9OzUGDUTE0Qf1iu330xMfws0G
	Iu4JO4uq066wE5tT5jWNR0/HEEyNC8ob00SrA4G9doo5YvGR2/AUuJ6H8dZOvsOO5tDiFC+UdQt
	ptu5WOQksvrjdQMVVSqcR5VtnaVEC7sLHbWK/eCbZMOEmyWNy91RkHx8GdnNAm3c2nqPjXVmjf1
	HlnjqV0MAIs0LFHj4BLWyqVp2rkvcWMrGYhJcAhndIdyEP9gvFwhqS4nsHTOIVyADV8KxZQk46k
	WueqOYX3RUAmYarnlVoY2hWnCkPFEWatYNGd1/+xwXogZNtjqxEofVHp87VEdk2YCzjrfJVuWVP
	AncryceUYOYqzRkbaeGQ=
X-Google-Smtp-Source: AGHT+IESJ8Rxdp/XXpq92L2e0M83vsXuVGRWnHDL4atp/VFNNs1LmSeanqZA4fRos5yy9QpaMq7APw==
X-Received: by 2002:a05:6000:178c:b0:391:45e9:face with SMTP id ffacd0b85a97d-39d14662fc6mr8760585f8f.54.1743971617976;
        Sun, 06 Apr 2025 13:33:37 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c301a6a60sm10022277f8f.29.2025.04.06.13.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 13:33:36 -0700 (PDT)
Message-ID: <60132403-d849-47a7-a11c-e829ffefc7a9@linaro.org>
Date: Sun, 6 Apr 2025 22:33:35 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <64b6d599-fe67-586a-e4b0-73d9b73499de@oss.nxp.com>
 <c570c99d-53f5-4f77-a730-42e5a2016dc5@linaro.org>
 <93d83df2-d3bc-e32d-70a6-158571504275@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <93d83df2-d3bc-e32d-70a6-158571504275@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/04/2025 08:35, Ghennadi Procopciuc wrote:
> On 4/3/2025 6:10 PM, Daniel Lezcano wrote:
>> On 03/04/2025 08:19, Ghennadi Procopciuc wrote:
>>> On 4/2/2025 6:49 PM, Daniel Lezcano wrote:
>>> [ ... ]
>>>> +examples:
>>>> +  - |
>>>> +    watchdog@0x40100000 {
>>>> +        compatible = "nxp,s32g2-swt";
>>>> +        reg = <0x40100000 0x1000>;
>>>> +        clocks = <&clks 0x3a>;
>>>> +        timeout-sec = <10>;
>>>> +    };
>>>
>>> The S32G reference manual specifies two clocks for the SWT module: one
>>> for the registers and another for the counter itself. Shouldn't both
>>> clocks be represented in the bindings?
>>
>> AFAICS, there are two clocks as described in the documentation for the
>> s32g2 page 846, section 23.7.3.3 SWT clocking.
> 
> This diagram illustrates the module clocks and their connections to the
> S32GS system clocks. From the module's perspective, there are three
> clocks: MODULE_CLOCK, REG_INTF, and COUNTER_CLOCK. Specifically, on
> S32G2 SoCs, the first two are connected to XBAR_DIV3_CLK, while the
> counter clock is linked to FIRC_CLK. Based on my understanding of the
> device tree, this configuration should be listed as follows:
> 
> clocks = <&clks XBAR_DIV3_CLK>, <&clks XBAR_DIV3_CLK>, <&clks FIRC_CLK>;
> clock-names = "module", "reg", "counter";
> 
> Configuring it this way allows flexibility to reuse the same clocking
> scheme for other SoCs where the integration is performed differently. It
> is possible that the 'module' and 'reg' clocks could be linked to two
> distinct system clocks.

That is something we can handle when the other SoC will be in the 
process of being upstream, no ?

I don't see how that can help with the current hardware we are 
describing. What is the benefit ?

I would prefer to stick to what is needed today

>> The module and the register clock are fed by the XBAR_DIV3_CLK which is
>> an system clock always-on.
> 
> XBAR_DIV3_CLK is not an always-on clock, meaning it is not available
> during suspend, if that is what you mean by always-on. The SIRC can be
> considered the only always-on clock on this device.
> 
>>
>> The counter is fed by the FIRC_CLK which described as "FIRC_CLK is the
>> default clock for the entire system at power-up."
>>
>>  From my understanding, we should not describe the XBAR_DIV3_CLK as it is
>> a system clock.
>>
>> And the FIRC_CLK is only there to get the clock rate in the driver.
>>
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

