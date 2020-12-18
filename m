Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934D32DE84A
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 18:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731582AbgLRRiU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 12:38:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:35628 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730270AbgLRRiT (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 12:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=TGknKXM6Qe5ZJYWFCEHpNo135/r
        ukfSQ0kDyG0JgwkA=; b=BJ6iOEdYqUKeqnbhrJluWZWEvjPnYIfGTutPlSfrA51
        OjeaHjy59ii/kyEmSem58nEkB5FIiW1r/c6q4rvMWZZrCIxYyCU7tkRvANCKlb0r
        9cpkbZlh7bIh/WWcCrQNneobkvJ3FwaU637gOLyCE7JMmLJTWbmt6Tzm4GHV6rjs
        =
Received: (qmail 3906654 invoked from network); 18 Dec 2020 18:37:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2020 18:37:35 +0100
X-UD-Smtp-Session: l3s3148p1@pU8fkMC2ZJggAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 0/5] v3u: add support for RWDT
Date:   Fri, 18 Dec 2020 18:37:25 +0100
Message-Id: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Here is the series to enable the RWDT on V3U. I took the DTS patches
from the BSP, the rest was developed on mainline tree. Note that
currently, the bootloader does not unmask the RWDT reset for us. This is
why patch #5 is needed if you want a reboot. We need to see if this is
going to be added to the bootloader later. Also, while the normal
watchdog trigger works flawlessly, the 'reboot' command will triger a
OOPS. This is a known issue also present on other Gen3 SoCs and will
be addressed seperately soon.

Other than that, patch #1 should go in via watchdog, the rest via
Geert's various trees :)

Looking forward to comments.

Happy hacking and have a nice weekend!


Hoang Vo (2):
  arm64: dts: renesas: r8a779a0: Add RWDT node
  arm64: dts: renesas: falcon: Enable watchdog timer

Wolfram Sang (3):
  dt-bindings: watchdog: renesas,wdt: add r8a779a0 (V3U) support
  clk: renesas: r8a779a0: Add RWDT clocks
  WIP soc: v3u: allow WDT reset

 .../devicetree/bindings/watchdog/renesas,wdt.yaml      |  1 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts        |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi              | 10 ++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c                |  9 +++++++++
 drivers/soc/renesas/rcar-rst.c                         |  8 ++++++++
 5 files changed, 33 insertions(+)

-- 
2.29.2

