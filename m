Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D74544D628
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Nov 2021 12:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbhKKL5Z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Nov 2021 06:57:25 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:33491 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233339AbhKKL5Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Nov 2021 06:57:24 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="99921027"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 20:54:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A879A400F79A;
        Thu, 11 Nov 2021 20:54:30 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Add WDT driver for RZ/G2L
Date:   Thu, 11 Nov 2021 11:54:24 +0000
Message-Id: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch series aims to add WDT driver support for RZ/G2L SoC's.

WDT has 3 channels 
1) CH0 to check the operation of Cortex-A55-CPU Core0
2) CH1 to check the operation of Cortex-A55-CPU Core1
3) CH2 to check the operation of Cortex-M33 CPU

WDT IP supports 
1) Normal Watchdog Timer Function
2) Reset Request Function due to CPU Parity Error

Once the software activates the watchdog timer, the watchdog timer does
not stop until it is reset.

The WDT Overflow System Reset Register (CPG_WDTOVF_RST) and 
WDT Reset Selector Register (CPG_WDTRST_SEL) are in CPG IP
block.

Current driver supports Normal Watchdog Timer basic functionality.

Tested WDT driver with selftests tool and reboot command

All 3 channels tested with below command.

cat /dev/watchdog  & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800808; done
cat /dev/watchdog1  & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800c08; done
cat /dev/watchdog2 & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800408; done

V1->V2:
 * started using clk_get/put instead of devm_clk_get/put
 * Moved devm_add_action_or_reset after set_drvdata() and 
 * removed redundant action on devm_add_action_or_reset() failure.
RFC->V1
 * Removed patch#3, the clk patch is queued for 5.17
 * Added clock-names and interrupt-names as required properties for RZ/G2L
 * Re-order clocknames with internal module clock first
 * Removed pclk_rate from priv.
 * rzg2l_wdt_write() returns void and Removed tiemout related to register update 
 * rzg2l_wdt_init_timeout() returns void and removed delays.
 * removed set_bit(WDOG_HW_RUNNING,..) as we can stop watchdog
 * renamed reset_assert_clock_disable->reset_assert_pm_disable_put
 * started using devm_reset_control_get_exclusive()
 * removed platform_set_drvdata(pdev, priv) as there is no user
 * removed watchdog_set_restart_priority(&priv->wdev, 0) as 0 is the default.
 * removed remove callback as it is empty.

Biju Das (3):
  clk: renesas: rzg2l: Add support for watchdog reset selection
  dt-bindings: watchdog: renesas,wdt: Add support for RZ/G2L
  watchdog: Add Watchdog Timer driver for RZ/G2L

 .../bindings/watchdog/renesas,wdt.yaml        |  75 ++++--
 drivers/clk/renesas/r9a07g044-cpg.c           |  22 ++
 drivers/clk/renesas/rzg2l-cpg.c               |   6 +
 drivers/clk/renesas/rzg2l-cpg.h               |  14 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/rzg2l_wdt.c                  | 255 ++++++++++++++++++
 7 files changed, 363 insertions(+), 18 deletions(-)
 create mode 100644 drivers/watchdog/rzg2l_wdt.c

-- 
2.17.1

