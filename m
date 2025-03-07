Return-Path: <linux-watchdog+bounces-3069-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC385A55C54
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 01:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26B4B188F653
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 00:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEE4149C41;
	Fri,  7 Mar 2025 00:57:27 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2AA82899;
	Fri,  7 Mar 2025 00:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309047; cv=none; b=FARt3qobduzS5D8pe67ZDxRI35f85kTntfWVHzfieRbgLdLOuhTMY8rMJadhkcFygPCruqQqivHaTgifuhx7GPE0lVgaUqtZwLLD3vqp43xwp6XwLIQTMSVDBuoefe7fg+OHhScDpnY5zLpEVnnbaj+UmaZWbz87LM+q6rYuUY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309047; c=relaxed/simple;
	bh=9twom87IHTGfsyCWE1bmuXJ+e7gcxIEIiCveblaTr1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qiqLI4NCw3CZj8yMxcZtNIm+8jRSJiV83h7Cx2ARetpg3MZhMnW9OIXWTecbbmW+ohK4V35IN67YdmdgMqHBQvDD4wEch4CmJ6mtz0yzMaLtE68o6czCCORSmwCbgMiYmQWuCKvbbAbo0doxV58Obw0zFGCJK1GvVSKbm2Yh94g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53AB7169E;
	Thu,  6 Mar 2025 16:57:35 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22E7A3F5A1;
	Thu,  6 Mar 2025 16:57:20 -0800 (PST)
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
Subject: [PATCH v3 00/15] arm64: dts: allwinner: Add basic Allwinner A523 support
Date: Fri,  7 Mar 2025 00:56:57 +0000
Message-ID: <20250307005712.16828-1-andre.przywara@arm.com>
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
series. Two binding patches from there are required to pass dtbs_check,
git put their patch IDs in the footer below.
Compared to v2 only small fixes in the NMI controller driver: renaming
the struct to better reflect its new usage, add adding the DS pin to
the eMMC pingroup list. Adding accrued tags on the way, many thanks to
the diligent reviewers! More detailed changelog below.

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
https://github.com/apritzel/linux/commits/a523-v3/

Cheers,
Andre

Changelog v2 .. v3:
- split NMI controller register offset into sub-struct
- properly align NMI controller data definition
- adding ACKs from Rob and Jernej (with thanks!)

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
[2] https://lore.kernel.org/linux-sunxi/20250306235827.4895-1-andre.przywara@arm.com/T/#u
[3] https://lore.kernel.org/linux-sunxi/20250307002628.10684-1-andre.przywara@arm.com/T/#u

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
 drivers/irqchip/irq-sunxi-nmi.c               |  76 ++-
 drivers/watchdog/sunxi_wdt.c                  |  11 +
 14 files changed, 1821 insertions(+), 51 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: 5b8a883819d2f3dfc975735a855291cb8b02dd39
prerequisite-patch-id: 26d4fd19d9e9cf345261bbad4b8c3697fe773e7c
-- 
2.46.3


