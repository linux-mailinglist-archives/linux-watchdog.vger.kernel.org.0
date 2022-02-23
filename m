Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9CC4C17FC
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Feb 2022 17:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiBWQBe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Feb 2022 11:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbiBWQBe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Feb 2022 11:01:34 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0401BC3332;
        Wed, 23 Feb 2022 08:01:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,391,1635174000"; 
   d="scan'208";a="112139496"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2022 01:01:05 +0900
Received: from localhost.localdomain (unknown [10.226.93.140])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 41F854008C76;
        Thu, 24 Feb 2022 01:01:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/6] RZG2L_WDT Fixes and Improvements
Date:   Wed, 23 Feb 2022 16:00:54 +0000
Message-Id: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The first 3 patch in this series fixes the below issues
1) 32 bit overflow issue
2) Runtime PM usage count issue
3) BUG: Invalid context during reset.

The later 3 patches are enhancements to the WDT driver.
1) Adding error check for reset_control_deassert()
2) Generate Parity error for WDT reset
3) Add support for set_timeout callback

Biju Das (6):
  watchdog: rzg2l_wdt: Fix 32bit overflow issue
  watchdog: rzg2l_wdt: Fix Runtime PM usage
  watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'
  watchdog: rzg2l_wdt: Add error check for reset_control_deassert
  watchdog: rzg2l_wdt: Use force reset for WDT reset
  watchdog: rzg2l_wdt: Add set_timeout callback

 drivers/watchdog/rzg2l_wdt.c | 83 ++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 36 deletions(-)

-- 
2.17.1

