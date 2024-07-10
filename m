Return-Path: <linux-watchdog+bounces-1350-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F892D1F8
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2024 14:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7955DB249E3
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2024 12:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19FB1922C7;
	Wed, 10 Jul 2024 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U3krA5jB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263741E4AF;
	Wed, 10 Jul 2024 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720615847; cv=none; b=usIbXsf28on+ovkmWvGdq8wsr16OJmq/VUD26FX1Gird08GB7J5xy3WErF3H2/5L45OSWWITWbb+H+84LBS6kUyyeHAAyW+Up5sakeRhkYsfKd5oDd159ezKhxSP4bJrlZWaPktfGiyfFXi1la3B9b1fTSbJnlb04PG1bXySwKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720615847; c=relaxed/simple;
	bh=sPxM8NaCsBvhlryktLPvPiUn7nj8vj/D3dzAifCOTmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2GywiEH1xUDHDnRxwsO5yr/Yo6YaR3nKbhR96kum+HJ9BMIpyZwAEAiXG42MKiziTP5tt7YMqCNMuq9NcLVJOXvwiC5FoWsM1a/D6zNM2dZSFYge9v//JhCr2A80IKZxirU+/+tVTikO95ZLFDxaiyNuFRxzrPw95elN4Q+gag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U3krA5jB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720615844;
	bh=sPxM8NaCsBvhlryktLPvPiUn7nj8vj/D3dzAifCOTmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U3krA5jBxVGjqTr4jjxuUNvlDgil7oP64q+KUqpJGEUP6+i1DMqZFNTgCHA14mqdx
	 J5JZfEIQpi5VJYQUy69C3lWEaSVpab/097nZMmDl3ao9akZTBLsGtxcicNpKqehAKT
	 asRnUAx+ysAr1FMXjKaX82z8pzzBE1tw7CdkqVsUt23rvqLRvO6v17QbYUSw/8ikbL
	 gY7Cey1BX+s4I/0VkXwIfsQq0nh8Fo0BRiFehRHAQiHXD8MfMa6vZK+H3OMDDGbKn0
	 knas+p3BJQZTxZK2ijQwlNZb6h37Ivo7P9jbduNRF1bXY8MFZ1QnqO6IagcLKVw99s
	 vWrQ0q2hu9SCA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 304093780029;
	Wed, 10 Jul 2024 12:50:43 +0000 (UTC)
Message-ID: <23369ea1-12d2-4386-a8ac-431620b75e2e@collabora.com>
Date: Wed, 10 Jul 2024 14:50:42 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: [PATCH v1 0/4] add syscon requirement for mt7988
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Golle <daniel@makrotopia.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20240709101328.102969-1-linux@fw-web.de>
 <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
 <trinity-93a5ed81-b890-4d49-bfec-1bbb1219cb65-1720611282583@3c-app-gmx-bs04>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <trinity-93a5ed81-b890-4d49-bfec-1bbb1219cb65-1720611282583@3c-app-gmx-bs04>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/07/24 13:34, Frank Wunderlich ha scritto:
> Hi
> 
>> Gesendet: Mittwoch, 10. Juli 2024 um 12:45 Uhr
>> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> Betreff: Re: [PATCH v1 0/4] add syscon requirement for mt7988
>>
>> Il 09/07/24 12:13, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Some nodes require the syscon fallback at least in u-boot when using
>>> OF_UPSTREAM.
>>>
>>> This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
>>> "mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.
>>>
>>
>> I wonder what's the major blocker here to modify the u-boot driver to take
>> the upstream devicetree as-is, instead of using syscon_node_to_regmap?
> 
> in uboot there is no driver for all syscon and to handle parallel access this is done with the syscon fallback.
> 
> The syscon uclass is a small driver which is generic and only handle the regmap in global context.
> 
> In theory it could be possible that regmap is aquired twice when used from 2+ other drivers...to prevent this without
> adding the syscon fallback each syscon needs a dedicated driver like in linux which does only syscon stuff (code
> duplication at its best :) ).
> 
> of course i can use regmap_init_mem in the uboot ethernet driver
> 
> https://elixir.bootlin.com/u-boot/latest/source/drivers/core/regmap.c#L242
> 
> like it's done once for syscon-uclass.
> 
> but i will cause issues when a second device tries to access this regmap. So it was be much easier (for me) to add this
> fallback and not writing 3 device-drivers in uboot doing the exactly same as syscon.
> 
> if you have a better idea how to handle it, let me know :)
> 

I see. The problem is that, from your description, it looks like u-boot
uses that as a kind of workaround for concurrent access to MMIO...

...looks like a good topic to discuss in the u-boot mailing lists.

Definitely, the TOPRGU and the XFI PLL are not system controllers, so the actual
"syscon" definition would be wrong for these, that's it.

Cheers

> regards Frank
> 
>> Regards,
>> Angelo
> 




