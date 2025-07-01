Return-Path: <linux-watchdog+bounces-3793-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5DAEFE7D
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1FC4188717E
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1354278170;
	Tue,  1 Jul 2025 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HfYb6PGW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00C1D5CC6;
	Tue,  1 Jul 2025 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383962; cv=none; b=MUO7Fc6DISJIsHtxPnI0QAwQSC03lfmNAWa/urtNyups5tb1v+CNjCpxrt4yUTP+gDnuFBhgcPBZoAjflwgVs4OfF+4yolrigveFGTpmLdM64VoSkPzFJW8I7zHD7hz4x6tap3Q68WEA52kCZZ8mzY6sWTRvoqootyblpIPUSUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383962; c=relaxed/simple;
	bh=+SSFv0hwrDzIL/TT/dGM60enfkAii5FwDqdxefO91yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3vTznd6UOjeU5FiLEu0/8aRgiAyahP9Q6HnzCk/PwV9a3qi7t2HqHYMY6s/e/Askwl/XjEcwpe7TMdRPTt2C3YQsJ8USj7nezfer3U3B5Wniuye6O5+xATPjbWoSqGN2EYRMI00UUcac2y+x2OUkFP9777HZzggwOWeA5dwhvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HfYb6PGW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751383958;
	bh=+SSFv0hwrDzIL/TT/dGM60enfkAii5FwDqdxefO91yY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HfYb6PGWldbXX1aRGd+H5pCPI32KVnpcDanYeWZMC81I/jN5ytDsWRV0QksB5Hd4/
	 vEMqWef8J5FWfY3cbCrXDKtLMON6urTZAYuX5bYXkRLpp5aJwQWxiSdaYxeFEIL8DN
	 v+nJiUMMJLAh3kudkqHU+mZXVfCGt4+c+0tGY9E6Q5zokoGApTAzr+wf88NIfGrwOD
	 jvitwM0jIPqotjIhd7m7XKkEpZ2BzGe54aug9AQKTEJT6XucaCStDteDTq+xlPQo96
	 mdF3aKM5lV2klIMwyhAy/waH9tFiXIyYobQW9+MFkXqFovdIcrbXPDRoJfuzp8g5h+
	 W/wQHIwVg42zA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8386B17E03A5;
	Tue,  1 Jul 2025 17:32:37 +0200 (CEST)
Message-ID: <c7f00050-dc56-4ac7-b89d-5f315cef2aa5@collabora.com>
Date: Tue, 1 Jul 2025 17:32:36 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] ARM: Add support for MediaTek MT6572 SoC
To: Rob Herring <robh@kernel.org>, Max Shevchenko <wctrl@proton.me>
Cc: linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
 <175138000372.1627755.5505703571113478205.robh@kernel.org>
 <CAL_JsqLSa+1MYR6f6NcApGFdjCL0dDXSzpntVHCPGmKgytVfdQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqLSa+1MYR6f6NcApGFdjCL0dDXSzpntVHCPGmKgytVfdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 01/07/25 17:30, Rob Herring ha scritto:
> On Tue, Jul 1, 2025 at 10:27 AM Rob Herring (Arm) <robh@kernel.org> wrote:
>>
>>
>> On Tue, 01 Jul 2025 09:06:54 +0300, Max Shevchenko wrote:
>>> This series of patches adds support for the MT6572 SoC and
>>> the JTY D101 tablet and Lenovo A369i smartphone based on it.
>>>
>>> Signed-off-by: Max Shevchenko <wctrl@proton.me>
>>> ---
>>> Changes in v3:
>>> - Remove the compatible property from the SoC devicetree
>>> - Link to v2: https://lore.kernel.org/r/20250626-mt6572-v2-0-f7f842196986@proton.me
>>>
>>> Changes in v2:
>>> - Drop the status property for the board devicetrees
>>> - Add an soc node for the MT6572 and reorder the nodes and properties
>>> - Change the commit title to a more descriptive one
>>> - Change the cover title to the correct one
>>> - Link to v1: https://lore.kernel.org/r/20250620-mt6572-v1-0-e2d47820f042@proton.me
>>>
>>> ---
>>> Max Shevchenko (11):
>>>        dt-bindings: serial: mediatek,uart: add MT6572
>>>        dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
>>>        dt-bindings: timer: mediatek: add MT6572
>>>        dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
>>>        dt-bindings: vendor-prefixes: add JTY
>>>        dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
>>>        ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
>>>        ARM: mediatek: add MT6572 smp bring up code
>>>        ARM: dts: mediatek: add basic support for MT6572 SoC
>>>        ARM: dts: mediatek: add basic support for JTY D101 board
>>>        ARM: dts: mediatek: add basic support for Lenovo A369i board
>>>
>>>   .../devicetree/bindings/arm/mediatek.yaml          |   5 +
>>>   .../mediatek,mt6577-sysirq.yaml                    |   1 +
>>>   .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
>>>   .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
>>>   .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>>>   .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
>>>   arch/arm/boot/dts/mediatek/Makefile                |   2 +
>>>   arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  61 ++++++++++++
>>>   arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  56 +++++++++++
>>>   arch/arm/boot/dts/mediatek/mt6572.dtsi             | 108 +++++++++++++++++++++
>>>   arch/arm/mach-mediatek/Kconfig                     |   4 +
>>>   arch/arm/mach-mediatek/mediatek.c                  |   1 +
>>>   arch/arm/mach-mediatek/platsmp.c                   |   7 ++
>>>   13 files changed, 250 insertions(+)
>>> ---
>>> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
>>> change-id: 20250619-mt6572-ef78a3d45168
>>>
>>> Best regards,
>>> --
>>> Max Shevchenko <wctrl@proton.me>
>>>
>>>
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>    pip3 install dtschema --upgrade
>>
>>
>> This patch series was applied (using b4) to base:
>>   Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
>>
>> If this is not the correct base, please add 'base-commit' tag
>> (or use b4 which does this automatically)
>>
>> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20250701-mt6572-v3-0-8937cfa33f95@proton.me:
>>
>> arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
>>          from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
>>          from schema $id: http://devicetree.org/schemas/root-node.yaml#
> 
> 'memory' node without a unit-address has long been deprecated. Please
> don't add more cases.
> 

Agreed.

Cheers,
Angelo


