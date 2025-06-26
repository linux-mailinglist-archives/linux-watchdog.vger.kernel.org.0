Return-Path: <linux-watchdog+bounces-3740-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A106AEA765
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 21:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F217F7AC864
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 19:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590F02EF676;
	Thu, 26 Jun 2025 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdJgSNJl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5E2EAB7F;
	Thu, 26 Jun 2025 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967601; cv=none; b=mCwlP8UTw+ekl/E9ov8OIyCNs72QP01/is4Tw8pOuLMGBd70+X/K3ZEQAhL9iY+r2YUc+kscOMch5kikEj2grYx8kOuwpgfnACBd66OfWy46wFZHyfBE3oMn1zspfqgvw0i/U2S0kspUUGiIeEcBfrj5EqBnsj2t5pUZqseM3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967601; c=relaxed/simple;
	bh=gP/lLAielMQ0FzJZoQVZVvW32nn5aVh+e1xIp7tL+5Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Zm0ZzXauQTv6slLo+WkEDYmJg4vhBR7BBXtuAYpGhAgDY+NmwHliBSz7n69VehgyUJYAhpsiQhKoDWVXcaUTMZD2zDOPa5jS5EQC53reLlWm/c5RXzrU4EYm0D2ICbgDlhZSSrg+H3tNnbPraLBV05DYVdN/zzpn5YAjDK2oEHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdJgSNJl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93113C4CEEB;
	Thu, 26 Jun 2025 19:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750967600;
	bh=gP/lLAielMQ0FzJZoQVZVvW32nn5aVh+e1xIp7tL+5Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mdJgSNJlTCiBsgp1QvD08F4fcua2wPsC395F4cWUyYK5vhobW4WMrk+HNckMyVVnv
	 SyBNxW8pmK1kHZyq62uSz+dqrTw1gWvGDX0uHKIZ95/VXLbqpGGbwJG74X91Vnjsi9
	 +lQzSu24MxCmAgiA8BskBo3XspT8PnF1p1j3naF6V3QQpXBRto/8rg8B0pXSV1nxy/
	 PS9dPFp7nBnSwxPAIaY4YnH4KsI93PilBkhbzyeokHcCVyvvCaYEyHKzk5JbxcnpQU
	 w7YqCokzH58UfMS+MSYQhnF//W+DCn8cHiJPcbX/eUqFZ0koRzligdhE7BpIk9cWlA
	 nEVqcKieCsypQ==
Date: Thu, 26 Jun 2025 14:53:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>
To: Max Shevchenko <wctrl@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
Message-Id: <175096753913.717927.14601371478727547482.robh@kernel.org>
Subject: Re: [PATCH v2 00/11] ARM: Add support for MediaTek MT6572 SoC


On Thu, 26 Jun 2025 11:53:53 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
> Changes in v2:
> - Drop the status property for the board devicetrees
> - Add an soc node for the MT6572 and reorder the nodes and properties
> - Change the commit title to a more descriptive one
> - Change the cover title to the correct one
> - Link to v1: https://lore.kernel.org/r/20250620-mt6572-v1-0-e2d47820f042@proton.me
> 
> ---
> Max Shevchenko (11):
>       dt-bindings: serial: mediatek,uart: add MT6572
>       dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
>       dt-bindings: timer: mediatek: add MT6572
>       dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
>       dt-bindings: vendor-prefixes: add JTY
>       dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
>       ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
>       ARM: mediatek: add MT6572 smp bring up code
>       ARM: dts: mediatek: add basic support for MT6572 SoC
>       ARM: dts: mediatek: add basic support for JTY D101 board
>       ARM: dts: mediatek: add basic support for Lenovo A369i board
> 
>  .../devicetree/bindings/arm/mediatek.yaml          |   5 +
>  .../mediatek,mt6577-sysirq.yaml                    |   1 +
>  .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
>  .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
>  arch/arm/boot/dts/mediatek/Makefile                |   2 +
>  arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  61 ++++++++++++
>  arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  56 +++++++++++
>  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 109 +++++++++++++++++++++
>  arch/arm/mach-mediatek/Kconfig                     |   4 +
>  arch/arm/mach-mediatek/mediatek.c                  |   1 +
>  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
>  13 files changed, 251 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250619-mt6572-ef78a3d45168
> 
> Best regards,
> --
> Max Shevchenko <wctrl@proton.me>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20250626-mt6572-v2-0-f7f842196986@proton.me:

arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: spi@1100a000 (mediatek,mt7623-spi): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7623-spi', 'mediatek,mt2701-spi'] is too long
	'mediatek,mt7623-spi' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt8516-spi']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
	'mediatek,mt7623-spi' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
	'mediatek,mt7622-spi' was expected
	'mediatek,mt2712-spi' was expected
	'mediatek,mt6765-spi' was expected
	'mediatek,spi-ipm' was expected
	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#






