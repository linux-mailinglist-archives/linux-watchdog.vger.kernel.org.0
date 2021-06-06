Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED9C39CEF2
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Jun 2021 14:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhFFMSu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Jun 2021 08:18:50 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57575 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbhFFMSt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Jun 2021 08:18:49 -0400
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MRTIx-1m2HvI0993-00NSMz; Sun, 06 Jun 2021 14:16:33 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 0/7] ARM: dts: Add Raspberry Pi 400 support
Date:   Sun,  6 Jun 2021 14:16:10 +0200
Message-Id: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:cKdZAghuMN9u/MoXRONPhzTKOrn/mHEJNZp99Sxo8X78wXXiy6M
 tj7C3B3SeODAb/YZPhIv5eUGOIYbpEPWjmCqhS7HCmEhqYEr1gwB1A0VB304wDVTcgKs9mi
 n6Ldmd2vzgDV3U919Z3dgMok3snEs1Cbm+yji1DmRSohmcAKUu8px3k5mOa/0hYdA2T8JFZ
 DO9ssTRMA+pWHjWgWvy3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XRWkM5WYsaM=:+jSITSSqJUfariSKqZ7TNf
 aAI40weEZwnI1Pv/N4g4xBKBa6PxYU4H6o2WcGjKYWJ/CYr4IQGQeDWEbNBTj/Pf3gWv48ECS
 q9NLGyc8gJPThw2OFFh/KgAoyPHCZCxMaZEgfTpzvcck7djL6WLXaxiZyM1cJKRwUAAvQNVOq
 AwjzVIqXq/jKwHjAJN9uG1WhcIrvBSnOz8JonTTh5/t82ksTEpSE2Hksnk7RNxVqw4eDWVZqh
 RlCBOo8ZnRoPdDPf1BBp+U8DZF0LZeYfjWrmfq5WMbYb5GAfj/fIQL5OzHgHldCKJPC1j9yET
 jvX7GDapqmFQgzGdPhietSn/MQLnA2UI8H2ym8wu+ytBHDLoAcwVGZtHTtaLdysY95syb4RLF
 Q/GnphLqrlAULv14R9izCXdaQk65i72UVXgGy4C4gPO/Y9zBUpxjmU+VqmzFR05Bn4HQeOQv7
 K29X5y5XiU8WLXqbXZMMqpxCAuwvulst+pQOq7oX/YhUIFp02hvztLD+TlxDVPTLWw6KBSaUZ
 zIKrEdDrmH1IwFA0C27B9U=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series adds support for the Raspberry Pi 400.

Changes in V2:
- add collected Reviewed-by and Acked-by
- add memory node, ethernet alias and gpio expander to bcm2711-rpi.dtsi
- drop PCIe USB reset control from bcm2711-rpi.dtsi
- add patch to fixup LED node names
- include RPi 4 B dts into RPi 400 dts

Stefan Wahren (7):
  ARM: dts: bcm283x: Fix up MMC node names
  watchdog: bcm2835_wdt: consider system-power-controller property
  ARM: dts: Move BCM2711 RPi specific into separate dtsi
  dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to DT schema
  ARM: dts: bcm283x: Fix up GPIO LED node names
  ARM: dts: Add Raspberry Pi 400 support
  arm64: dts: broadcom: Add reference to RPi 400

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |  1 +
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              | 85 +++-------------------
 arch/arm/boot/dts/bcm2711-rpi-400.dts              | 45 ++++++++++++
 arch/arm/boot/dts/bcm2711-rpi.dtsi                 | 74 +++++++++++++++++++
 arch/arm/boot/dts/bcm2711.dtsi                     |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |  4 +-
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |  4 +-
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi             |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           |  2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |  2 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |  2 +-
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |  4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts         |  4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         |  4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  2 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             |  2 +-
 arch/arm/boot/dts/bcm283x.dtsi                     |  2 +-
 arch/arm64/boot/dts/broadcom/Makefile              |  3 +-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts   |  2 +
 drivers/watchdog/bcm2835_wdt.c                     | 10 ++-
 24 files changed, 165 insertions(+), 98 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts

-- 
2.7.4

