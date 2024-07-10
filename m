Return-Path: <linux-watchdog+bounces-1347-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC392CFBF
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2024 12:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB1111C239E4
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2024 10:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A22191493;
	Wed, 10 Jul 2024 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oac1qC1t"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6B418FDB1;
	Wed, 10 Jul 2024 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720608362; cv=none; b=DYqL9o8RQzHYriTVGVVllhQLGohDQclw6vitBr5DHPuyLnhbtp34lQhKhchR8nZi8CXY5XNPkm2MkqDnxNk/PeBS9Z9PX6DMW0nEs58D8bEoxfEIO24Hw6P5m18tUnSYuHP00OcbIIn0D14+iEZBWG06/hYhQH59duZTLqlGnn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720608362; c=relaxed/simple;
	bh=OT6YCCN0htNhieZjFLd6a0qp/JNFJI1m8IJPRRTsawA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DA+tQtpyQYUqJihFam7KCt0oIMa+cGIHe9AZLG/3tTjz+CjfzPbAngrGWEUbJKbovd1IBqVHjFozgGyW4PXSGLSeQygwyJo5v9P1wrYIk1E2mQAYxrxYSn2hCERKQZ5JBUr3t0GzPz28I6Io8q6TDmWVeG86idkXRjGjd3EYkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oac1qC1t; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720608358;
	bh=OT6YCCN0htNhieZjFLd6a0qp/JNFJI1m8IJPRRTsawA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oac1qC1tpy0MhlTjXLhqCoClYM4Gfwh164dGc8lvoNoEfoVWoLMHJE1CNxOogNBe5
	 cBj81asvYLMdrBhlfKP8xFrICNZjnCEX3KGjqZqD6grjIRSCNC0YcQhcvWjrLqyl1p
	 0iowSCdUXo07D16fndDYL9/5dtvEojPQvNy2T8Ly/o1LJ7wCCaBYxCT2J/EmDR+Li/
	 wPK+8G4EWdmdsjWqH+NbKQIt/UKV+U2KvzMS1iwX8U2L/99CqtwMFa1ebF8NmNXe1q
	 bSNu0lr7BXkvK8C6Vt0J9OfgYShVrFook4OciW1BZdflq2W+2wol84bck2AOcklO6O
	 CqR8kWSpcvrsA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D67F437810CD;
	Wed, 10 Jul 2024 10:45:57 +0000 (UTC)
Message-ID: <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
Date: Wed, 10 Jul 2024 12:45:57 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] add syscon requirement for mt7988
To: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20240709101328.102969-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/07/24 12:13, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Some nodes require the syscon fallback at least in u-boot when using
> OF_UPSTREAM.
> 
> This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
> "mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.
> 

I wonder what's the major blocker here to modify the u-boot driver to take
the upstream devicetree as-is, instead of using syscon_node_to_regmap?

Regards,
Angelo

> Frank Wunderlich (4):
>    dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988 syscon requirement
>    dt-bindings: clock: mediatek: add syscon requirement for mt7988
>      xfi-pll
>    dt-bindings: clock: mediatek: add syscon requirement for mt7988
>      ethwarp
>    arm64: dts: mediatek: mt7988: add syscon for watchdog, xfi-pll and
>      ethwarp
> 
>   .../devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml | 6 ++++--
>   .../devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml | 7 +++++--
>   .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml     | 5 ++++-
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi                  | 6 +++---
>   4 files changed, 16 insertions(+), 8 deletions(-)
> 



