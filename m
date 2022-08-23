Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1889059E06F
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Aug 2022 14:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358708AbiHWL5B (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Aug 2022 07:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358798AbiHWLyS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Aug 2022 07:54:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BD828D571D;
        Tue, 23 Aug 2022 02:33:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,257,1654527600"; 
   d="scan'208";a="132257342"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Aug 2022 18:32:42 +0900
Received: from localhost.localdomain (unknown [10.226.93.107])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CC2B6423AE51;
        Tue, 23 Aug 2022 18:32:39 +0900 (JST)
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
Subject: [PATCH v4 0/2] arm64: renesas: Add RZ/V2M watchdog support
Date:   Tue, 23 Aug 2022 10:32:31 +0100
Message-Id: <20220823093233.8577-1-phil.edworthy@renesas.com>
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

v4:
 - driver: Fix enum names from I2C_* to WDT_*
 - driver: Change cast from of_device_get_match_data() to avoid clang warning
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

