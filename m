Return-Path: <linux-watchdog+bounces-3693-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE3AE33AA
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 04:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83FFB188CD6F
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 02:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D2F1B4240;
	Mon, 23 Jun 2025 02:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kdm5nweS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7F1B0439;
	Mon, 23 Jun 2025 02:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750646349; cv=none; b=taVsoWVK5rIMYaSbu5xCuV3/EtkVRIatOcD2bFLxlZu1XiqfrOSsa70a01fT6YYWWZwaMga3b845o8jFzaSxmQJC6OwBGTakBnOMukHC73IQLS0NYM7yXswNPxhexd9sL2QT/fqVrSNEoZnWAIwo12Ay7bAeDWMyVv8hqS9nls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750646349; c=relaxed/simple;
	bh=Fvdn22+aLwNt5IcX7plkjuYY6MzRdeiquj8xeSPIR2A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SHk5X+lh+0BtYARvnoCSZId9C1cijTsSNNCrQRDFVUGs/oYXegYbTv5Ht7SdurRZzp8LdOpW80MIn3Xt1aSGRr252yeAMa7Yek4jtGL8HVrX/YTxq5I7Kj2KmMbgMdXQ3acTuTb147HFnsK2lfXz/Lq40A1Gb9WLviT++w5Umrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kdm5nweS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A615C4CEF1;
	Mon, 23 Jun 2025 02:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750646349;
	bh=Fvdn22+aLwNt5IcX7plkjuYY6MzRdeiquj8xeSPIR2A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Kdm5nweSN23bTVlDMGIMReXxN4GS3yWfedMLMBuQO7ca+w72Y5ovB3tnUqRWM7gPB
	 AY6DnY76QvHN0OxJ9hLv/cOQf+s48Tey4xdfal9Jp0c/44XjKj4LRJSqNXXrAOaGSh
	 A0fIsDdL1faLQjYHfJUSHFZW28h0fhn3ToCz2Ceq1n8VjrJDygu0/7dveF2P1ZmZj1
	 dUMfsSf83yt/CF5D3MH/pzr6lvx1SYttFn8iH3Yn/TX2HaPsC7HSUC/8cBKIFY0FRf
	 Ly3bm5Dz3a3HwHsFT/9cr50wErRo48wbJF0Lg6hAC5VkYCPSHK7eAiZPAFhBA8t3Y1
	 P5PRYsBHYAqkw==
Date: Sun, 22 Jun 2025 21:39:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-watchdog@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@armlinux.org.uk>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
Message-Id: <175064594753.881101.7250770438494415279.robh@kernel.org>
Subject: Re: [PATCH 00/11] ASoC: mediatek: Add support for MT6572 SoC


On Fri, 20 Jun 2025 18:40:39 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
> Max Shevchenko (11):
>       dt-bindings: serial: mediatek,uart: add MT6572
>       dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
>       dt-bindings: timer: mediatek: add MT6572
>       dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
>       dt-bindings: vendor-prefixes: add JTY
>       dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
>       ARM: mediatek: show the hardware name for the MT6572
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
>  arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  62 ++++++++++++
>  arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  57 +++++++++++
>  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 105 +++++++++++++++++++++
>  arch/arm/mach-mediatek/Kconfig                     |   4 +
>  arch/arm/mach-mediatek/mediatek.c                  |   1 +
>  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
>  13 files changed, 249 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20250620-mt6572-v1-0-e2d47820f042@proton.me:

arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#






