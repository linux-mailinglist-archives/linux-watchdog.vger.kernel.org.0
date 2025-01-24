Return-Path: <linux-watchdog+bounces-2757-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D615A1B6BE
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 14:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8AAB7A22ED
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C020B33985;
	Fri, 24 Jan 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMF/zwPY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954A3433C0;
	Fri, 24 Jan 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724808; cv=none; b=eepykYZpjvZ/ffHz7smRoD0zwlSH4OKpwJ2jdgWREDHCRZ/JzkFC98cw493VW+And9MN7A0wvNjm7ey1v7ruAC+8D58WBIFsZ8ZTPXmnbzqXeWJ6T6UpEzAHdOECFOTziX3ZZ3z2e/agDOT+xfSoW+BKJnZNAqk8+cTGhdCM+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724808; c=relaxed/simple;
	bh=3tOnS8v67viKut0hFKTdXszuenRunVMYmIDpDvaOPlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezLCPNtQb/Y1ut7dedyTTjJL2zZan+Nr2ATHYHxpYH0FbXS2jT/4TQK+p2NVCSzcof2OhVs4hB5ScHtyUaE1oaagtB29oJqMA600CakDjU+ts7NTvRNje9fqv6bTbXpffWCplTNUf1PG3QmXDsl2ZAuaY7Og4ZuNRh/Rwzo0u/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMF/zwPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7065AC4CED2;
	Fri, 24 Jan 2025 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737724808;
	bh=3tOnS8v67viKut0hFKTdXszuenRunVMYmIDpDvaOPlk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VMF/zwPYtNulA1+PDJZEn4+lz3GL3FbYYfUGQnjSjM1jmUQEJhYTRUNzHwqHXSZ4q
	 Ujc6Mkh6hyFJjJPkzObHrREdnRQvzn6RFY+VfyKL0zyRwEWjehsTDkZ1VQnpB0HC/E
	 y6qRCYTP/OxTCE0G3ThHg0CFdLG/snkda2P4fptNkB+HWsBo6b1OEXVW0+IbFKNPgb
	 jFwfEN4Ly7QATWvZ3VwfhPMMUP5Lyj/SKUM56Dt2okXhvi4zYXMW9JNaa4DQgF7eig
	 JQSkmHK4yJ4q3iZNHlTKrFnIDAIraxazC0FsC3AGf94A1Elb9Bv5zJ6tRKfMF0sDQi
	 Jl4OFfHy1SBUw==
Message-ID: <80bedf6c-ff2b-45e4-93e1-a05f4d3416ec@kernel.org>
Date: Fri, 24 Jan 2025 14:20:02 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
 <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
 <TY3PR01MB11346DC4A22A2EC0CB0DAF61186E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f4cdcb9e-ae30-45ad-87f4-7395db0ab995@kernel.org>
 <TY3PR01MB11346D1E5B190101E7F474BEB86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <305ba07f-e5f3-4d2e-b017-8a817418f16c@kernel.org>
 <TY3PR01MB11346BADEA961847B84D911E986E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <8bdb2cdf-92cd-46e8-b795-7d5d412a4e07@kernel.org>
 <TY3PR01MB1134676CABA2ACBA48395491086E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TY3PR01MB1134676CABA2ACBA48395491086E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/01/2025 14:10, Biju Das wrote:
>>>> Rather tell me why this is supposed to be different than other vendors?
>>>
>>> It is not different from other vendors.
>>>
>>> See, for eg:
>>> config S3C2410_WATCHDOG
>>>  557         tristate "S3C6410/S5Pv210/Exynos Watchdog"
>>>  558         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>>
>> You see - only one ARCH_EXYNOS.
>>
>> That's the arch and vendor. Exynos is the entire arch for arm32 and
>> arm64 consisting of all of SoCs.
> 
> In Renesas case it is ARCH_RENESAS.


So that's your dependency. Said in this thread long time ago.


> 
>>
>> S3C and S5P are entirely different, much older archs - these even could not be combined in one image
>> with Exynos some time ago.
>>
>>>
>>>
>>> 575 config SA1100_WATCHDOG
>>>  576         tristate "SA1100/PXA2xx watchdog"
>>>  577         depends on ARCH_SA1100 || ARCH_PXA || COMPILE_TEST
>>>
>>> and many more.
>>
>> Again: only one SA1100, one PXA. Not per each PXA SoC.
>>
>> So these prove my point - use only your ARCH
>>>
>>>
>>>>
>>>> || ARM64 is already used solution
>>>
>>> If you are correct, then all should depend on either on ARM or ARM64 or RISCV etc...
>>>
>>>
>>>>
>>>>>
>>>>> Since most of IP's in RZ/V2H and RZ/G3E are identical we could
>>>>> introduce a new family SoC ARCH_RZG3E_RZV2H to cover both or top level ARCH_RENESAS??
>>>>
>>>> You should not write drivers per SoCs (or even two or there SoCs) and
>>>> there is really no need to restrict them per each SoC.
>>>
>>> If I am not wrong, The watchdog subsystem uses similar approach.
>>>
>>>>
>>>> Otherwise come with arguments to my first question: why do you need
>>>> exception here from generic kernel approach?
>>>
>>> It is not deviating from generic kernel approach as lot of vendors are doing this way.
>>> eg:
>>>
>>> config OMAP_WATCHDOG
>>>           tristate "OMAP Watchdog"
>>>          depends on ARCH_OMAP16XX || ARCH_OMAP2PLUS || COMPILE_TEST
>>
>> Anyway, that's ancient OMAP, we speak about new devices.
>>
>>>
>>>
>>>  config DAVINCI_WATCHDOG
>>>          tristate "DaVinci watchdog"
>>>           depends on ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST
>>
>> Different ARCH, not SoCs!
>>
>>>
>>>
>>>  config K3_RTI_WATCHDOG
>>>          tristate "Texas Instruments K3 RTI watchdog"
>>>          depends on ARCH_K3 || COMPILE_TEST
>>
>> Dependency on ARCH.
>>
>> Do you understand the difference between ARCH and SoC (ARCH_R9A09G47 is the SoC - individual or
>> family)?
> 
> ARCH_R9A09G47 --> Is a SoC (RZ/G3E)
> ARCH_R9A09G57 --> Is a SoC (RZ/V2H)
> 
> 90%of IP between these SoCs are same. So can't this belongs to same family of SoCs(eg: ARCH_RZ_G3E_V2H family)?


We do not discuss what these SoCs belong to. How does it matter if you
create ARCH_RZ_ONE_TWO_THREE_SOCS? Your dependency is ARCH, so unified
kernel image will be easier to create. This is not helping in unified
image and Greg was talking about this *multiple times*.


Best regards,
Krzysztof

