Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0323A5515C2
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 12:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240020AbiFTK0S (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 06:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240137AbiFTK0Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 06:26:16 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D80E413F8A;
        Mon, 20 Jun 2022 03:26:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,306,1650898800"; 
   d="scan'208";a="123489267"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jun 2022 19:26:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.116])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DE7854273C6A;
        Mon, 20 Jun 2022 19:26:04 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: renesas: Add RZ/V2M watchdog support
Date:   Mon, 20 Jun 2022 11:25:58 +0100
Message-Id: <20220620102600.52349-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello all,

This patch series adds support for the Watchdog Timer (WDT) in the
RZ/V2M SoC.

v3:
 - dt-bindings: Add check for too many interrupts or clocks
 - driver: Don't call pm_runtime_get_sync() in restart()
 - driver: Use mdelay instead of udelay, avoids DIV64_U64_ROUND_UP
v2:
 - dt-bindings: Added minItems for interrupt-names and clock-names
 - driver: Replace use of parity error registers in restart
 - driver: Commit msg modified to reflect different contents

Phil Edworthy (2):
  dt-bindings: watchdog: renesas,wdt: Add r9a09g011 (RZ/V2M) support
  watchdog: rzg2l_wdt: Add rzv2m support

 .../bindings/watchdog/renesas,wdt.yaml        | 73 +++++++++++++------
 drivers/watchdog/rzg2l_wdt.c                  | 39 ++++++++--
 2 files changed, 85 insertions(+), 27 deletions(-)

-- 
2.34.1

