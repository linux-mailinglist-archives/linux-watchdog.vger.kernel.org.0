Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9B7540085
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jun 2022 15:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244997AbiFGN5F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jun 2022 09:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245003AbiFGN5E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jun 2022 09:57:04 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24F2BB2259;
        Tue,  7 Jun 2022 06:56:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,284,1647270000"; 
   d="scan'208";a="123619772"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2022 22:56:57 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 96DC14487F01;
        Tue,  7 Jun 2022 22:56:54 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 2/2] watchdog: rzg2l_wdt: Add rzv2m compatible string
Date:   Tue,  7 Jun 2022 14:56:19 +0100
Message-Id: <20220607135619.174110-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607135619.174110-1-phil.edworthy@renesas.com>
References: <20220607135619.174110-1-phil.edworthy@renesas.com>
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

The WDT on RZ/V2M devices is basically the same as RZ/G2L, with the
exception that the RZ/V2M has a single combined interrupt, whereas the
RZ/G2L has time out and error interrupts.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/watchdog/rzg2l_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 6eea0ee4af49..cee3eef7cc47 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -256,6 +256,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 static const struct of_device_id rzg2l_wdt_ids[] = {
 	{ .compatible = "renesas,rzg2l-wdt", },
+	{ .compatible = "renesas,rzv2m-wdt", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
-- 
2.34.1

