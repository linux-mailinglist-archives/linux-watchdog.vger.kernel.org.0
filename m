Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682B654007F
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jun 2022 15:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243857AbiFGN4f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jun 2022 09:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235352AbiFGN4d (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jun 2022 09:56:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE12A97299;
        Tue,  7 Jun 2022 06:56:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,284,1647270000"; 
   d="scan'208";a="123619751"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2022 22:56:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B7B94487B18;
        Tue,  7 Jun 2022 22:56:27 +0900 (JST)
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
Subject: [PATCH 0/2] arm64: renesas: Add RZ/V2M watchdog support
Date:   Tue,  7 Jun 2022 14:56:17 +0100
Message-Id: <20220607135619.174110-1-phil.edworthy@renesas.com>
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

Phil Edworthy (2):
  dt-bindings: watchdog: renesas,wdt: Add r9a09g011 (RZ/V2M) support
  watchdog: rzg2l_wdt: Add rzv2m compatible string

 .../bindings/watchdog/renesas,wdt.yaml        | 63 ++++++++++++-------
 drivers/watchdog/rzg2l_wdt.c                  |  1 +
 2 files changed, 43 insertions(+), 21 deletions(-)

-- 
2.34.1

