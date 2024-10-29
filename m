Return-Path: <linux-watchdog+bounces-2378-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D069B5336
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 21:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3141F23ED4
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 20:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22252076B3;
	Tue, 29 Oct 2024 20:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="WDLJ8/T7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF04192B74;
	Tue, 29 Oct 2024 20:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730233023; cv=none; b=hn/cpGrVQgyTbV6f2J4MdjycMKawxpcfXZkDx4A44KU+Pal2QSeXp0TTFfYnXpEjPcqo8C8zbe0DRt/rSFhliNgBybhtWJ4z2p47a3CZw3aN2Pt0Zxm4ipWhl4+46KNn0+xI40ehTT4YiN14DKuOPg7WYwMVBedOMQgzQEcYBD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730233023; c=relaxed/simple;
	bh=O0VX/ZrqNKk0Dv4Xs0tKKcQtjHsnFwl5WY0g9IHxX/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8LH1i/1cRyf5qfUjQzUenGMll5uwMzimAsTo4iRqZdqy9vRh3pSmqkrZukQNEhuEAC4lJoHpC7oRqxlXhNpGgwvBMiDSumohslb9KscBFsyHGmilEOUa74jxCajT+jFMPF3vZqMP3jrsvrkwqVud6yzffPM0NLwrZLm74K8eFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=WDLJ8/T7; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2B01789187;
	Tue, 29 Oct 2024 21:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730233013;
	bh=ar9OhxoAhlsVrdr4yEALxcch1UzmR8/RO9WPA/0wzAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDLJ8/T7qdqbh9TU9iY8jrWdf1nchk8L0g2jvT4cfW7AQJD8nDZIrJwrjy0FKAHJi
	 f/JKoSzhzc+xGX1SVPGWRfItrjRRtyEYmclopqU5NjAWHoRRRTlKkAZeMBfwAYwP2C
	 T4LqjD6OJlzTrvz2xi1ULmf2+nsTSVL589+j0/j0Dcb0ttdfbNAM4Nu/zWQ/YpAPHO
	 CycTmQh9hB2YzKIYUFNGfxCKMelC6fVH80CkKcEPJ+Cl2WaTziBsyt3OgwNqtdFwda
	 WWmmVstEMDobAsWNTbpsDrHVUMByRSjw/GoCWEqVKOYUgZKS03G8rlKw4QquM6oTZj
	 v5uX3dBOe3bsA==
Message-ID: <e521394a-a7e1-495e-8a67-637f30d7866d@denx.de>
Date: Tue, 29 Oct 2024 20:07:38 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: stm32: Add IWDG2 EXTI interrupt mapping and
 mark as wakeup source
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org
References: <20240623195136.81522-1-marex@denx.de>
 <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/24 4:16 PM, Alexandre TORGUE wrote:
> Hi Marek

Hello Alexandre,

> On 6/23/24 21:51, Marek Vasut wrote:
>> The IWDG2 is capable of generating pre-timeout interrupt, which can be 
>> used
>> to wake the system up from suspend to mem. Add the EXTI interrupt mapping
>> and mark the IWDG2 as wake up source.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Richard Cochran <richardcochran@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: linux-watchdog@vger.kernel.org
>> ---
>> V2: No change
>> V3: No change
>> ---
>>   arch/arm/boot/dts/st/stm32mp151.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/ 
>> st/stm32mp151.dtsi
>> index 1804e202eb425..68846699b26fd 100644
>> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> @@ -355,6 +355,8 @@ iwdg2: watchdog@5a002000 {
>>               reg = <0x5a002000 0x400>;
>>               clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
>>               clock-names = "pclk", "lsi";
>> +            interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
>> +            wakeup-source;
>>               status = "disabled";
>>           };
> 
> Applied on stm32-next !!
> (late but applied ;))
Woohoo ! Thank you.

