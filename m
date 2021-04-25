Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B532C36A62E
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Apr 2021 11:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhDYJnT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Apr 2021 05:43:19 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:54192 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhDYJnP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Apr 2021 05:43:15 -0400
Received: from localhost (unknown [192.168.167.225])
        by lucky1.263xmail.com (Postfix) with ESMTP id 3248EAB633;
        Sun, 25 Apr 2021 17:42:23 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3565T140663333058304S1619343740259115_;
        Sun, 25 Apr 2021 17:42:22 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c756feb8cf8e1bf199ae898dc058cfda>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 29
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   <cl@rock-chips.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: dts: rockchip: add basic dtsi/dts files for RK3568 SoC
Date:   Sun, 25 Apr 2021 17:42:09 +0800
Message-Id: <20210425094216.25724-1-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

v1:
1. add some dt-bindings for RK3568 devices.
2. add core dtsi for RK3568 SoC.
3. add basic dts for RK3568 EVB

v2:
1. sort device nodes by some rules.

Liang Chen (7):
  dt-bindings: i2c: i2c-rk3x: add description for rk3568
  dt-bindings: serial: snps-dw-apb-uart: add description for rk3568
  dt-bindings: mmc: rockchip-dw-mshc: add description for rk3568
  dt-bindings: watchdog: dw-wdt: add description for rk3568
  arm64: dts: rockchip: add generic pinconfig settings used by most
    Rockchip socs
  arm64: dts: rockchip: add core dtsi for RK3568 SoC
  arm64: dts: rockchip: add basic dts for RK3568 EVB

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../bindings/mmc/rockchip-dw-mshc.yaml        |    9 +-
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3568-evb1-v10.dts     |   80 +
 .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 3119 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  812 +++++
 .../boot/dts/rockchip/rockchip-pinconf.dtsi   |  345 ++
 10 files changed, 4366 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi

-- 
2.17.1



