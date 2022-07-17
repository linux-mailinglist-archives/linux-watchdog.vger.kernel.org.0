Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00CB6577545
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Jul 2022 11:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbiGQJQf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 17 Jul 2022 05:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbiGQJQd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 17 Jul 2022 05:16:33 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8B34B1581E;
        Sun, 17 Jul 2022 02:16:31 -0700 (PDT)
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
        by maillog.nuvoton.com (Postfix) with ESMTP id 085CD1C81186;
        Sun, 17 Jul 2022 17:16:28 +0800 (CST)
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 17
 Jul 2022 17:16:27 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sun, 17 Jul
 2022 17:16:27 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Sun, 17 Jul 2022 17:16:27 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 95C0063A52; Sun, 17 Jul 2022 12:16:25 +0300 (IDT)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
        <gregkh@linuxfoundation.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <arnd@arndb.de>, <olof@lixom.net>, <jirislaby@kernel.org>,
        <shawnguo@kernel.org>, <bjorn.andersson@linaro.org>,
        <geert+renesas@glider.be>, <marcel.ziswiler@toradex.com>,
        <vkoul@kernel.org>, <biju.das.jz@bp.renesas.com>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>, <robert.hancock@calian.com>,
        <j.neuschaefer@gmx.net>, <lkundrak@v3.sk>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v9 07/16] reset: npcm: using syscon instead of device data
Date:   Sun, 17 Jul 2022 12:16:00 +0300
Message-ID: <20220717091609.122968-8-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220717091609.122968-1-tmaimon77@gmail.com>
References: <20220717091609.122968-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Using syscon device tree property instead of device data to handle the
NPCM general control registers.

In case the syscon not found the code still search for nuvoton,npcm750-gcr
to support DTS backward compatibility.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/reset/reset-npcm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index 2ea4d3136e15..b08f8d8a1d63 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -138,8 +138,7 @@ static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
 }
 
 static const struct of_device_id npcm_rc_match[] = {
-	{ .compatible = "nuvoton,npcm750-reset",
-		.data = (void *)"nuvoton,npcm750-gcr" },
+	{ .compatible = "nuvoton,npcm750-reset" },
 	{ }
 };
 
@@ -160,10 +159,15 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 	gcr_dt = (const char *)
 	of_match_device(dev->driver->of_match_table, dev)->data;
 
-	gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
+	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
 	if (IS_ERR(gcr_regmap)) {
-		dev_err(&pdev->dev, "Failed to find %s\n", gcr_dt);
-		return PTR_ERR(gcr_regmap);
+		dev_warn(&pdev->dev, "Failed to find nuvoton,sysgcr property, please update the device tree\n");
+		dev_info(&pdev->dev, "Using nuvoton,npcm750-gcr for Poleg backward compatibility\n");
+		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+		if (IS_ERR(gcr_regmap)) {
+			dev_err(&pdev->dev, "Failed to find nuvoton,npcm750-gcr");
+			return PTR_ERR(gcr_regmap);
+		}
 	}
 
 	/* checking which USB device is enabled */
-- 
2.33.0

