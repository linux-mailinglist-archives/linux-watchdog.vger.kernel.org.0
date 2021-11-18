Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD17A456078
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 17:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhKRQdB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 11:33:01 -0500
Received: from polaris.svanheule.net ([84.16.241.116]:57086 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbhKRQdB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 11:33:01 -0500
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:baf4:d6c5:5600:301])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id D10C6273809;
        Thu, 18 Nov 2021 17:29:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1637253000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1JTDewxmDd3Uj2UDDhFbVjaroT1xBd19dnBZLJEMz1A=;
        b=XH5kuUG7tAmftkxkqBU4En1mrcWH48Lxsfz5bZpjGpgTzrFpzWMJxhN+fo9XNFwQAusX2c
        fs2VJoGa0br6Ay5sBsyjusGeeWMKZNxw0bfh/Uj/B0+0TnPSQf5qgchjkyXurZVfVDIQLS
        gNRPx3mqlZ7MJiMoTT3ZmF+47W42l7c05UK1THAmA0N9hIN/4LUftwsgk4Q3uZoue2IKYA
        6rgIkp2RNEwd5bvedItGTTDl6OBnmlSezQQqtC3OHXOx98uQt5rnzeSosFlBl6X7RR25TM
        fjklzZhKoiy6JoxTWZ3vfhaIiQs8X0nGKxVHoIW8ASJTlruF52qhRXSI6jNqsQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v4 0/2] Add Realtek Otto WDT support
Date:   Thu, 18 Nov 2021 17:29:50 +0100
Message-Id: <cover.1637252610.git.sander@svanheule.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This watchdog timer is found on Realtek's Otto MIPS platforms, including the
RTL838x, RTL839x, and RTL930x series of ethernet switch SoCs. It has a number
of reset modes (SoC, CPU, software), and can provide pretimeout interrupts.

The timer has two timeout phases. Both phases have a maximum duration of 32
prescaled clock ticks, which is ca. 43s with a clock of 200MHz:
- Phase 1: During this phase, the WDT can be pinged to reset the timeout.
- Phase 2: Starts after phase 1 has timed out, and only serves to give the
  system some time to clean up, or notify others that it's going to reset.
  During this phase, pinging the WDT has no effect, and a reset is unavoidable.

The driver has been tested on a Zyxel GS1900-8 (RTL8380, mainline kernel and
OpenWrt), a Zyxel GS1900-48 (RTL8393, mainline), a Netgear GS110TPPv1
(RTL8381, mainline), and a Zyxel XGS1250-12 (RTL9203B, Openwrt).

Changes since v3:
Link: https://lore.kernel.org/all/cover.1636018117.git.sander@svanheule.net/
- Improve clock initialisation

Changes since v2:
Link: https://lore.kernel.org/all/20211104085952.13572-1-sander@svanheule.net/
- Fix off-by-one error in prescale assignment

Main changes since v1:
Link: https://lore.kernel.org/all/cover.1634131707.git.sander@svanheule.net/
- Drop implementation of phase2 irq, since it is only triggered on system reset
- Drop redundant value checks and lock
- Add RTL930x compatibility

Sander Vanheule (2):
  dt-bindings: watchdog: Realtek Otto WDT binding
  watchdog: Add Realtek Otto watchdog timer

 .../bindings/watchdog/realtek,otto-wdt.yaml   |  91 +++++
 MAINTAINERS                                   |   7 +
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/realtek_otto_wdt.c           | 384 ++++++++++++++++++
 5 files changed, 496 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
 create mode 100644 drivers/watchdog/realtek_otto_wdt.c

-- 
2.33.1

