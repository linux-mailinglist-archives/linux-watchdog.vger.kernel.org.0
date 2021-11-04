Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675414456D4
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 17:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhKDQLo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Nov 2021 12:11:44 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34037 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231642AbhKDQLn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Nov 2021 12:11:43 -0400
X-IronPort-AV: E=Sophos;i="5.87,209,1631545200"; 
   d="scan'208";a="99217943"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Nov 2021 01:09:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.57])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EEFCB4017749;
        Fri,  5 Nov 2021 01:09:00 +0900 (JST)
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
Subject: [RFC 0/4] Add WDT driver for RZ/G2L
Date:   Thu,  4 Nov 2021 16:08:54 +0000
Message-Id: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
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

Current driver support is basic normal Watchdog Timer Function.

Later will extend support to identify the WDT channel that generated
the reset request using CPG_WDTOVF_RST. Need to figure out how to expose
this to WDT driver from CPG driver?

and also Reset Request Function due to CPU Parity Error.

Tested WDT driver with selftests tool and reboot command

All 3 channels tested with below command.

cat /dev/watchdog  & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800808; done
cat /dev/watchdog1  & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800c08; done
cat /dev/watchdog2 & for i in {1..60}; do sleep 1; echo $i; devmem2 0x12800408; done

Please share your valuable comments.

Biju Das (4):
  clk: renesas: rzg2l: Add support for watchdog reset selection
  dt-bindings: watchdog: renesas,wdt: Add support for RZ/G2L
  clk: renesas: r9a07g044: Add WDT clock and reset entries
  watchdog: Add Watchdog Timer driver for RZ/G2L

 .../bindings/watchdog/renesas,wdt.yaml        |  72 +++--
 drivers/clk/renesas/r9a07g044-cpg.c           |  37 +++
 drivers/clk/renesas/rzg2l-cpg.c               |   6 +
 drivers/clk/renesas/rzg2l-cpg.h               |  14 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/rzg2l_wdt.c                  | 281 ++++++++++++++++++
 7 files changed, 401 insertions(+), 18 deletions(-)
 create mode 100644 drivers/watchdog/rzg2l_wdt.c

-- 
2.17.1

