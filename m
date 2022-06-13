Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4E3549C16
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jun 2022 20:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbiFMSrt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jun 2022 14:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245317AbiFMSr0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jun 2022 14:47:26 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A35B2D8097;
        Mon, 13 Jun 2022 08:06:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,297,1647270000"; 
   d="scan'208";a="122769625"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Jun 2022 00:05:59 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B4B7D425F851;
        Tue, 14 Jun 2022 00:05:56 +0900 (JST)
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
Subject: [PATCH v2 0/2] arm64: renesas: Add RZ/V2M watchdog support
Date:   Mon, 13 Jun 2022 16:05:48 +0100
Message-Id: <20220613150550.70334-1-phil.edworthy@renesas.com>
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

v2:
 - dt-bindings: Added minItems for interrupt-names and clock-names
 - driver: Replace use of parity error registers in restart
 - driver: Commit msg modified to reflect different contents

Phil Edworthy (2):
  dt-bindings: watchdog: renesas,wdt: Add r9a09g011 (RZ/V2M) support
  watchdog: rzg2l_wdt: Add rzv2m support

 .../bindings/watchdog/renesas,wdt.yaml        | 71 ++++++++++++-------
 drivers/watchdog/rzg2l_wdt.c                  | 37 +++++++---
 2 files changed, 76 insertions(+), 32 deletions(-)

-- 
2.34.1

