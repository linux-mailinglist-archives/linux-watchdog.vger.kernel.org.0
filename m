Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13D84450C4
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 10:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbhKDJC7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Nov 2021 05:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhKDJCz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Nov 2021 05:02:55 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEF9C061714
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Nov 2021 02:00:15 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:bf08:f0c1:3ec1:1bfc])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id E6B8026C25B;
        Thu,  4 Nov 2021 10:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1636016413;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=aSVaAzJ3m5980KKgm3JRaFImGZ0s3xafSnre4Y/uNJU=;
        b=UnK9Aj4wg7GMeEqd89bq+LKinLThwgLHmSxpS8+5EifF2rysoZidBPNmOQdpzBjsoPM3WG
        4q5x4Mx+5WHhjSMc7dr0AWsIfFUZO9zJMM6fdOX7dq0J2jF3uIuIXaWa4cbdPySLW5lPe8
        EIgjA1LbLlMODhAcBwGOIzRb9jqcJn1GQ6BDkAUfIdijC2MG/CKZeGvUjMHtbznRCSYMq5
        BnnYYYcjeSmYmm1vAxK7OD94/pHHtQlEYpiTQIxZ9Vn3MClJUVKNp0FNdhpbeBSKfkYOjQ
        SrKh65A69VZpw7TSvWmfaf73Qh6uY5gsndFctCjaRdU0bUoXuu2s9wYNum8fQA==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v2 0/2] Add Realtek Otto WDT support
Date:   Thu,  4 Nov 2021 09:59:51 +0100
Message-Id: <20211104085952.13572-1-sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
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
 drivers/watchdog/realtek_otto_wdt.c           | 359 ++++++++++++++++++
 5 files changed, 471 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
 create mode 100644 drivers/watchdog/realtek_otto_wdt.c

-- 
2.31.1

