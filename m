Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4D2255ACD
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgH1NIN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:08:13 -0400
Received: from foss.arm.com ([217.140.110.172]:48666 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729172AbgH1NGX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:06:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4216B1FB;
        Fri, 28 Aug 2020 06:06:11 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0ADB3F66B;
        Fri, 28 Aug 2020 06:06:08 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chanho Min <chanho.min@lge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH 00/10] dt-bindings: Convert SP805 to Json-schema (and fix users)
Date:   Fri, 28 Aug 2020 14:05:52 +0100
Message-Id: <20200828130602.42203-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is an attempt to convert the SP805 watchdog DT binding to yaml.
This is done in the first patch, the remaining nine fix some DT users.

I couldn't test any of those DT files on actual machines, but tried
to make the changes in a way that would be transparent to at least the
Linux driver. The only other SP805 DT user I could find is U-Boot, which
seems to only use a very minimal subset of the binding (just the first
clock).
I only tried to fix those DTs that were easily and reliably fixable.
AFAICT, a missing primecell compatible string, for instance, would
prevent the Linux driver from probing the device at all, so I didn't
dare to touch those DTs at all. Missing clocks are equally fatal.

Cheers,
Andre

Andre Przywara (10):
  dt-bindings: watchdog: sp-805: Convert to Json-schema
  arm64: dts: arm: Fix SP805 clock-names
  arm64: dts: broadcom: Fix SP805 clock-names
  arm64: dts: freescale: Fix SP805 clock-names
  arm64: dts: hisilicon: Fix SP805 clocks
  arm64: dts: lg: Fix SP805 clocks
  ARM: dts: arm: Fix SP805 clocks
  ARM: dts: Cygnus: Fix SP805 clocks
  ARM: dts: NSP: Fix SP805 clock-names
  ARM: dts: hisilicon: Fix SP805 clocks

 .../bindings/watchdog/arm,sp805.txt           | 32 ---------
 .../bindings/watchdog/arm,sp805.yaml          | 72 +++++++++++++++++++
 arch/arm/boot/dts/arm-realview-eb.dtsi        |  2 +-
 arch/arm/boot/dts/arm-realview-pb11mp.dts     |  4 +-
 arch/arm/boot/dts/arm-realview-pbx.dtsi       |  4 +-
 arch/arm/boot/dts/bcm-cygnus.dtsi             |  4 +-
 arch/arm/boot/dts/bcm-nsp.dtsi                |  2 +-
 arch/arm/boot/dts/hisi-x5hd2.dtsi             |  5 +-
 arch/arm/boot/dts/mps2.dtsi                   |  4 +-
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi       |  2 +-
 arch/arm/boot/dts/vexpress-v2m.dtsi           |  2 +-
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts   |  4 +-
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts    |  2 +-
 arch/arm/boot/dts/vexpress-v2p-ca9.dts        |  2 +-
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi |  2 +-
 .../boot/dts/arm/rtsm_ve-motherboard.dtsi     |  2 +-
 .../boot/dts/broadcom/northstar2/ns2.dtsi     |  2 +-
 .../boot/dts/broadcom/stingray/stingray.dtsi  |  2 +-
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  4 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 16 ++---
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 16 ++---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     | 10 +--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |  5 +-
 arch/arm64/boot/dts/lg/lg1312.dtsi            |  4 +-
 arch/arm64/boot/dts/lg/lg1313.dtsi            |  4 +-
 25 files changed, 126 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml

-- 
2.17.1

