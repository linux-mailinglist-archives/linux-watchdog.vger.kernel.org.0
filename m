Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39677395041
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 11:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhE3J20 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 05:28:26 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:53431 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhE3J2Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 05:28:25 -0400
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4Ja3-1ln0jH2v8z-000OhJ; Sun, 30 May 2021 11:26:22 +0200
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
Subject: [PATCH 0/6] ARM: dts: Add Raspberry Pi 400 support
Date:   Sun, 30 May 2021 11:26:09 +0200
Message-Id: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:n2h+CsFKET9/0vn5SBFheUb/aTTZ6EuKdpPV0C01U77riAHAOGl
 3/idd7GDj+7Vlc3XwNNgdTWLHREvPdoU4kdAdWqoqrWwon8NqY3BUOvvY3iWsKUA1han8Ub
 LADu4y9uXUK9SHR/Tor2vlg07F9aUMI5u48oHo2KgnVSso6b7dDExp9YrL8+JcBA1x/0fgK
 OPTS097M65tJ/01XmF+wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N0ncYazpDFY=:fHvpK6R0VkyuaPdpmA71p1
 oINcyQk+vRtJnI7nLZVG+kPeVMtFssMilOOE6io8sd4LTEi4KTYTjq9LLLNzLQThkAUP6kgWT
 ctnKZ/man5dipDEpYiWuHpXxWsmqzV8peN2jL2vVMqo5pHAISgv4UDHLf7XoJuxU521hmIa8N
 GoIMdlacqJ3E+TXAD325r+eM7SuWQjZKjCiDRiy+4Wbf2t3Kxxf7FnxYsnn6gBMUSEQaESKbt
 Ty9RXxqpcSwJ8N707+iOU9cEpvhtHb7VIAPiRODNYnla3DPXFa3Sl0zyIjPJXGE0jTBqnImPF
 QNwUbqb724zKJE1TFWJVGIpE3LVcOmP+oFtRry69imEld5tIdmmE+95r+kmToy3PBiFKSp9iO
 LOKJOts0KXRZzbaTJ8NLS5aYKi6K0vDNp1XRu5p3RaK6nmTHe6IBb2wmKd2b4GMQ2NuriH6mB
 XFZD8EQqsPc8WfSX4SJBEtnFNSvis7LrlmGxdoMOJ+H7zGd0iPsVFJ4Z13YVTxOQXgMQgUkFw
 POsbQdJLdg6K1fLeBHD9yQ=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This series adds support for the Raspberry Pi 400.

Stefan Wahren (6):
  ARM: dts: bcm283x: Fix up MMC node names
  watchdog: bcm2835_wdt: consider system-power-controller property
  ARM: dts: Move BCM2711 RPi specific into separate dtsi
  dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to DT schema
  ARM: dts: Add Raspberry Pi 400 support
  arm64: dts: broadcom: Add reference to RPi 400

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts              |  62 +----
 arch/arm/boot/dts/bcm2711-rpi-400.dts              | 271 +++++++++++++++++++++
 arch/arm/boot/dts/bcm2711-rpi.dtsi                 |  75 ++++++
 arch/arm/boot/dts/bcm2711.dtsi                     |   2 +-
 arch/arm/boot/dts/bcm283x.dtsi                     |   2 +-
 arch/arm64/boot/dts/broadcom/Makefile              |   3 +-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts   |   2 +
 drivers/watchdog/bcm2835_wdt.c                     |  10 +-
 10 files changed, 362 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts

-- 
2.7.4

