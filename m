Return-Path: <linux-watchdog+bounces-3042-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B2A4F046
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 23:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 737487A5513
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 22:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5504D27702C;
	Tue,  4 Mar 2025 22:25:43 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1690B26138F;
	Tue,  4 Mar 2025 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127143; cv=none; b=OKjwe7My40dnEP8ra1rcpdqdj9QEBFoFHtcJRrbXr/Jp/U8G4DxebZQFkkuF7XKy00uP0Xx7vyRgHrZRK8//Xnj9BpTZblhC+qjBRDQFRNmKT3aB78Xr2i1X0UUnsZBa/XQyVrbyAFA+jlKOKgR8C9f3bmv3I9kxY5MnBmHmt9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127143; c=relaxed/simple;
	bh=iaMvK8/SofOaQ1HyAPJ18Zkd4db1ra2dw+VV6AtENSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ibzv93B+6BhZLNUnT5mCT2LpABr/752uqA9lqqC5yrxb2Xks7v8vzESowgB1Cx/0ftNsS7YBQ8VFHEcdGJiGT625FRIGBTCWwgdxpe+dHC2cAfPFticm5glE+DODNNNoXCvlX1v0S93rnRjy4ztktebmliD6w39CSqRDF7RFvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4AEB2F;
	Tue,  4 Mar 2025 14:25:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FEDF3F5A1;
	Tue,  4 Mar 2025 14:25:36 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 00/15] arm64: dts: allwinner: Add basic Allwinner A523 support
Date: Tue,  4 Mar 2025 22:22:54 +0000
Message-ID: <20250304222309.29385-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this in an update to the series introducing the basic DT support for the
Allwinner A523 SoC. It now comes with DTs for three boards, using
slightly different packages of that SoC.[1]
Functionality-wise it relies on the pinctrl[2] and clock[3] support
series, though there are no direct code dependency series between the
series. Three binding patches from there are required to pass dtbs_check,
git put their patch IDs in the footer below.
Compared to v1 this drops the patches that have already been merged
(I2C, USB, RTC), changes the proposed NMI controller binding, extends 
the SoC .dtsi to include more device instances, also the secondary cores,
and adds DTs for two new boards. On top of this I added v2 of the DT patch
for an H616 board, since it shares the newly introduced YuzukiHD vendor
name patch. Also it adds the tags from the diligent reviewers, many thanks
for that! More detailed changelog below.

The first patches add DT binding documentation for the most basic
peripherals, most of them actually being already supported, courtesy of
identical IP being used. This includes MMC and USB 2.0, so with the above
mentioned clock and pinctrl support this gives an already somewhat usable
mainline support for this new SoC family.
The watchdog is not completely compatible, but is an easy addition, so
this bit is included in here as well, the same is true for the NMI
controller, required for delivering PMIC interrupts.

The A523 features 8 Arm Cortex-A55 cores, organised in two clusters,
clocked separately, with different OPP limits, in some kind of
little/LITTLE configuration. The GPU is a Arm Mali G57 MC01, and the chip
also features a single PCIe 2.1 lane, sharing a PHY with some USB 3.1
controller - which means only one of the two can be used.
The rest of the SoC is the usual soup of multimedia SoC IP, with eDP
support and two Gigabit Ethernet MACs among the highlights.

The main feature is patch 08/15, which adds the SoC .dtsi. This for now
is limited to the parts that are supported and could be tested. Compared
to v1 we now have some basic TF-A support, so the PSCI nodes are in now.

The final patches add basic support for the Avaota-A1 router board, the
X96QPro+ TV box, and the Radxa A5E development board.

The mainline firmware side in general is coming together now: we have
basic U-Boot support working (including MMC and USB), most importantly
with proper DRAM support, so no more binary blobs, and some basic TF-A
support.

Please have a look at those DT bits here, ideally compare them to the
available user manual, and test them if you have access to hardware.

Based on v6.14-rc1.
I pushed a branch with all the three series combined here:
https://github.com/apritzel/linux/commits/a523-v2/

Cheers,
Andre

Changelog v1 .. v2:
- drop USB, I2C, RTC binding patches: already merged
- add tags from reviewers (with thanks!)
- drop unrelated deprecation comment from MMC binding patch
- drop fallback compatible for NMI controller, stands on its own now
- adjust PHY binding to merged A100 binding (dropping tag)
- .dtsi: add secondary cores
- .dtsi: enable PSCI
- .dtsi: move 32K oscillator to board .dts files
- .dtsi: adjust CCU source clocks
- .dtsi: add MMC1 node (typcially for SDIO WiFi)
- .dtsi: add remaining UARTs
- .dtsi: add remaing I2C devices
- add two new board .dts files
- add DT bindings for those two new board names
- avaota.dts: drop reserved memory from (TF-A now in SRAM)
- avaota.dts: drop SD card dummy supply node
- avaota.dts: add eMMC node (shipped on most boards)
- avaota.dts: fix OTG mode, explain situation
- add Chameleon .dts file (depends on YuzukiHD vendor name patch)

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://lore.kernel.org/linux-sunxi/20250227231447.20161-1-andre.przywara@arm.com/T/#u
[3] https://lore.kernel.org/linux-sunxi/20250304012805.28594-1-andre.przywara@arm.com/T/#u

Andre Przywara (15):
  dt-bindings: mmc: sunxi: Simplify compatible string listing
  dt-bindings: mmc: sunxi: add compatible strings for Allwinner A523
  dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
  watchdog: sunxi_wdt: Add support for Allwinner A523
  dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI
    controller
  irqchip/sunxi-nmi: Support Allwinner A523 NMI controller
  dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
  arm64: dts: allwinner: Add Allwinner A523 .dtsi file
  dt-bindings: vendor-prefixes: Add YuzukiHD name
  dt-bindings: arm: sunxi: Add new board names for A523 generation
  arm64: dts: allwinner: a523: add Avaota-A1 router support
  arm64: dts: allwinner: a523: add X96Q-Pro+ support
  arm64: dts: allwinner: a523: add Radxa A5E support
  dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
  arm64: dts: allwinner: h616: add YuzukiHD Chameleon support

 .../devicetree/bindings/arm/sunxi.yaml        |  20 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  38 +-
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   4 +
 .../sun50i-h618-yuzukihd-chameleon.dts        | 222 +++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 598 ++++++++++++++++++
 .../dts/allwinner/sun55i-a527-radxa-a5e.dts   | 299 +++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 287 +++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 308 +++++++++
 drivers/irqchip/irq-sunxi-nmi.c               |  50 +-
 drivers/watchdog/sunxi_wdt.c                  |  11 +
 14 files changed, 1807 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: 5b8a883819d2f3dfc975735a855291cb8b02dd39
prerequisite-patch-id: ff4d42c2dcb0c3b4be45a4b0b8e22027207979ee
prerequisite-patch-id: 4596fa402b501a9406821a9535f8329d30bf1ca4
-- 
2.46.3


