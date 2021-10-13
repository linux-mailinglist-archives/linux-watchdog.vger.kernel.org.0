Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93ECA42C174
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Oct 2021 15:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbhJMNgl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Oct 2021 09:36:41 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:38014 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhJMNgk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Oct 2021 09:36:40 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Oct 2021 09:36:40 EDT
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:ca:6d5e:c3e3:69a5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 628F0260DB5;
        Wed, 13 Oct 2021 15:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1634131750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=QtAibD/jKHbHT2fZ2hmCY1IBJUZhTrukIpsqol6hjTI=;
        b=WtUnBWkktvxYEjKD7gb/DqRx5MW4tyxeS9QEHf9ZK8TTdEgtPe3lhf4jiR30SSCrAQZ7fw
        JYMRXNO5QNSFz+s+LcIvB6SZjFByZYTFnPBvReebDQJ94APLm+H8wb4WVzpvyH9N0bTmYj
        wq7Y9/Ca8BUqHPH3HMYqtmAOHUm3BA0hRsP2CYGpy4eXlidbymsSQ7BMb8vs9XjJ647RxU
        PyItgqB2RHWjtd+ySyxTMLf1FfH+S1/7EGaAv/vK4uv2LoW3W0e+Xh6jNWjhtFGfOHi0nH
        l4amv8i65t7fh5xPfRtkH9VqxLe6TJpGFHgRNXDeboUBXlQAN3uYcluSDb23/Q==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 0/2] Add Realtek Otto WDT support
Date:   Wed, 13 Oct 2021 15:28:58 +0200
Message-Id: <cover.1634131707.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This watchdog timer found on Realtek's Otto MIPS platforms, including the
RTL838x and RTL839x series of ethernet switch SoCs. It has a number of reset
modes (SoC, CPU, software), and can provide pretimeout interrupts.

The timer has two timeout phases. Both phases have a maximum duration of 32
prescaled clock ticks, which is ca. 43s with a clock of 200MHz:
- Phase 1: During this phase, the WDT can be pinged to reset the timeout.
- Phase 2: Starts after phase 1 has timed out, and only serves to give the
  system some time to clean up, or notify others that it's going to reset.
  During this phase, pinging the WDT has no effect, and a reset is unavoidable.

The driver has been tested on a Zyxel GS1900-8 (RTL8380, mainline kernel and
OpenWrt), a Zyxel GS1900-48 (RTL8393, mainline), and a Netgear GS110TPPv1
(RTL8381, mainline).

Sander Vanheule (2):
  dt-bindings: watchdog: Realtek Otto WDT binding
  watchdog: Add Realtek Otto watchdog timer

 .../bindings/watchdog/realtek,otto-wdt.yaml   |  89 ++++
 MAINTAINERS                                   |   7 +
 drivers/watchdog/Kconfig                      |  13 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/realtek_otto_wdt.c           | 411 ++++++++++++++++++
 5 files changed, 521 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
 create mode 100644 drivers/watchdog/realtek_otto_wdt.c

-- 
2.31.1

