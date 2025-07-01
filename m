Return-Path: <linux-watchdog+bounces-3791-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2196AEFE6A
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A831C235AF
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14B127C15B;
	Tue,  1 Jul 2025 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rghLY/8B"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08BC27A916;
	Tue,  1 Jul 2025 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383659; cv=none; b=erdn0XUP1xNOkUJWUmBz3dANuhhdE5wdBvYb3TkDXrAEf28WaW3gXrCzTT64zaT0CWB+7JuxIHMVDmEPeWaYI3VqjMtaSNYhUje2WuJaxGAsW4Ee3euOwjXXWlvCSjShUEKP8viQO7K/rDkFvYakD6dAeWFk5pijhcGEiRKIVOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383659; c=relaxed/simple;
	bh=deOOm4QcL7MGMhnnJDbv+UDHPY3BMHSo/frXEHKF5X8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iyAtST2dbQBD/IT7fLoQbzDi1ta07RoVYL9Q069ceoK2IEnmj/129EwKLAPubtZT1nAE86vU0709wKxH+yWol7KTZWOuRogJlVU0LqDw4bGdWMDDbP9lkhFtRZU1NbgGbkU7l2t9N/z8T1nM+WmivR7rPVyIRnlKw2AlyFxQdzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rghLY/8B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0580C4CEEB;
	Tue,  1 Jul 2025 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751383657;
	bh=deOOm4QcL7MGMhnnJDbv+UDHPY3BMHSo/frXEHKF5X8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rghLY/8BHAu53z3akbUfh1aMAkBQZxgMkqEvR+OZUhnTPwkM2hecE5v0hMasdd3TL
	 eet2X0VTNfi6/WccpbmNCHrQuWr7bB3gYn45raboZMyykkrF4onzn6PzPagia78UXJ
	 2nYcMg3k2RuhNokxkghYCwqxUV+kpT4WsXxIV/3blGBRYEDVFnAhl9BqTFyQXXpKQi
	 vV6bXV6C98xDztwRuqaWfxBgH7ceFnEtjEtHiwLvKSG5UNGuzS1FcHcBLcvGej5sDC
	 7/3nVq+QTD22caCiCd6v9VqGgOieyKTbK2GMrXFZK0gH77KtRIAj/lJzQhEne3N1jw
	 a9bLXzseQ/LmA==
Date: Tue, 01 Jul 2025 10:27:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-mediatek@lists.infradead.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
Message-Id: <175138000372.1627755.5505703571113478205.robh@kernel.org>
Subject: Re: [PATCH v3 00/11] ARM: Add support for MediaTek MT6572 SoC


On Tue, 01 Jul 2025 09:06:54 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
> Changes in v3:
> - Remove the compatible property from the SoC devicetree
> - Link to v2: https://lore.kernel.org/r/20250626-mt6572-v2-0-f7f842196986@proton.me
> 
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
>  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 108 +++++++++++++++++++++
>  arch/arm/mach-mediatek/Kconfig                     |   4 +
>  arch/arm/mach-mediatek/mediatek.c                  |   1 +
>  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
>  13 files changed, 250 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/mediatek/' for 20250701-mt6572-v3-0-8937cfa33f95@proton.me:

arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: pcie@1,0: 'device_type' is a required property
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: ethernet@1b100000 (mediatek,mt7623-eth): clocks: [[16, 110], [48, 2], [48, 4], [48, 3], [3, 8]] is too long
	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#






