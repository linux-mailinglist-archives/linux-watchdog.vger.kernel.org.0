Return-Path: <linux-watchdog+bounces-3440-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF954AACD2B
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 20:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C870C1B68B9F
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 18:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53BF286894;
	Tue,  6 May 2025 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2Axxfi7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655A28688C;
	Tue,  6 May 2025 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555834; cv=none; b=Cv++80NRffTRio1JY0ayl4IJsLsHn0s+mxrcSRPY5QR8uVI/a6c4YW2w6M+UD/3JcluxRI42L3UJdn59NakVOdFCww1agxIr3xt3CqR0VTXyX8/uVnZOKfXg0jx9+G4XELis8mqK7EPOkEU1eDR55ufw2vhRNP3Jox84x4CksG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555834; c=relaxed/simple;
	bh=ZEAGjwIFjybc/HGuQRpeGkvdPGM1CPmJpu83eTHjeHY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IWBZaq296TMX/IQglwkDF1kERagpFPZE1cM6Y/XhzWH1fbmjaZcq4zLKQMKCPukdiLJXip+MWLfDvPzcWErS7b3dntkvlZYT1aQCwvQ2+jnwdjhbiZrjFGS4vfkW+GZR+iDECNkwZvs1QBzFvTat1rwd6Y9yGb3ovdbK3GYTHaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2Axxfi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB20C4CEE4;
	Tue,  6 May 2025 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555833;
	bh=ZEAGjwIFjybc/HGuQRpeGkvdPGM1CPmJpu83eTHjeHY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J2Axxfi7zb9TfRjQzYpz4uELBa1yRNXuJU2ZPxuI+nYb26O0ECUNZSZS6C5YYlBZo
	 IMVZgxTBOuHoYLXXKxrxqfTFCLQCAXOvI45dc/Q3IQaUQdl6deseQnjljgop1uvTo/
	 A/+9EnnfP9+WPeNv4aX98MskcNF/yhIGWJDIl7XdyDmN1LdMQXZ6nQVt4GBCEImAbv
	 UXq5igTpjIrBkTGvu36607jrTnccYqTpiRXLpvJxu874m2HlocpzEVD73+GR9WZWBf
	 9MmX4teM14pxvLlQp0PztgVQHt9SDAhS7qD0X1pnlcoQ0Oedcj4HUjx4O33ziLmPJl
	 0Hh0zIv4dsoqw==
Date: Tue, 06 May 2025 13:23:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: heiko@sntech.de, linux-kernel@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dragan Simic <dsimic@manjaro.org>, Yao Zi <ziyao@disroot.org>, 
 Junhao Xie <bigfoot@classfun.cn>, devicetree@vger.kernel.org, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 Jamie Iles <jamie@jamieiles.com>, Guenter Roeck <linux@roeck-us.net>, 
 Frank Wang <frank.wang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Jimmy Hon <honyuenkwun@gmail.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <didi.debian@cknow.org>, 
 Shresth Prasad <shresthprasad7@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Johan Jonker <jbx6244@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20250506025715.33595-1-kever.yang@rock-chips.com>
References: <20250506025715.33595-1-kever.yang@rock-chips.com>
Message-Id: <174655575165.2171034.16453137338500014976.robh@kernel.org>
Subject: Re: [PATCH v5 0/6] rockchip: Add rk3562 SoC and evb support


On Tue, 06 May 2025 10:57:09 +0800, Kever Yang wrote:
> 
> Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
> scmi-shmem from soc node to reserved memory.
> 
> Patch series V4 remove patches already landed, and remove dts nodes for
> modules still under review.
> 
> This patch set adds rk3562 SoC and its evb support.
> 
> I have split out patches need driver change for different subsystem.
> And all the modules with dt-binding document update in this patch set
> do not need any driver change. I put them together to make it clear we
> have a new SoC and board to use the new compatible. Please pick up the
> patch for your subsystem, or please let me know if the patch has to
> send separate.
> 
> Test with USB, PCIe, EMMC, SD Card.
> 
> This patch set is base on the patch set for rk3576 evb1 support.
> 
> V3:
> https://lore.kernel.org/linux-rockchip/20250227111913.2344207-1-kever.yang@rock-chips.com/
> V2:
> https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/
> 
> 
> Changes in v5:
> - Collect review tag
> - Update scmi-shmem from soc to reserved memory
> 
> Changes in v4:
> - Collect ack tag
> - Collect ack tag
> - Collect ack tag
> - remove gmac and otp nodes
> - remove gmac nodes
> 
> Changes in v3:
> - Collect reveiw tag
> - Collect the Acked-by tag
> - remove i2c/serial/spi alias
> - add soc node
> 
> Changes in v2:
> - Update in sort order
> - remove grf in cru
> - Update some properties order
> 
> Finley Xiao (2):
>   arm64: dts: rockchip: add core dtsi for RK3562 Soc
>   arm64: dts: rockchip: Add RK3562 evb2 devicetree
> 
> Kever Yang (4):
>   dt-bindings: watchdog: Add rk3562 compatible
>   dt-bindings: rockchip: pmu: Add rk3562 compatible
>   dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
>   dt-bindings: arm: rockchip: Add rk3562 evb2 board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |    5 +
>  .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
>  .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
>  .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
>  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>  .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  488 ++++
>  .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1270 +++++++++
>  8 files changed, 4126 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
> 
> --
> 2.25.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250506 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250506025715.33595-1-kever.yang@rock-chips.com:

arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/usb2-phy@ff740000: failed to match any schema with compatible: ['rockchip,rk3562-usb2phy']






