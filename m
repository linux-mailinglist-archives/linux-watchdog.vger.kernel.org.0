Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E702C458D87
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Nov 2021 12:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239129AbhKVLjV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Nov 2021 06:39:21 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:37976 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233502AbhKVLjU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Nov 2021 06:39:20 -0500
X-IronPort-AV: E=Sophos;i="5.87,254,1631545200"; 
   d="scan'208";a="101061578"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2021 20:36:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CDFA341E9700;
        Mon, 22 Nov 2021 20:36:10 +0900 (JST)
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
Subject: [PATCH v3 0/2] Add WDT driver for RZ/G2L
Date:   Mon, 22 Nov 2021 11:35:52 +0000
Message-Id: <20211122113554.15990-1-biju.das.jz@bp.renesas.com>
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

Current driver supports Normal Watchdog Timer basic functionality.

Tested WDT driver with selftests tool and reboot command

All 3 channels tested with below command.

cat /dev/watchdog  & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800808; done
cat /dev/watchdog1  & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800c08; done
cat /dev/watchdog2 & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800408; done

V2->V3:
 * Added Rb tag from Guenter Roeck
 * Removed Removed patch#1, as the clock changes related to WDT reset selection
   will be handled in TF-A.
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
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/rzg2l_wdt.c                  | 255 ++++++++++++++++++
 4 files changed, 321 insertions(+), 18 deletions(-)
 create mode 100644 drivers/watchdog/rzg2l_wdt.c

-- 
2.17.1

