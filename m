Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3BE65FFD3
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Jan 2023 12:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbjAFLyp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Jan 2023 06:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbjAFLyo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Jan 2023 06:54:44 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8101F718B7;
        Fri,  6 Jan 2023 03:54:42 -0800 (PST)
X-UUID: fd29bc19f56b49a299ef7cd42801477a-20230106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2hXwYWe+jSegcz4Df7bZIw4pzdL+uc/kulrqwbGGLYw=;
        b=KMMeE1RqzOSSCc5b+EMSblYd1OumkGv1i/BC0UBV++nX3fmaKBhcljMNjsOZURoSpdMZKy5s2NsrSpLaj9+DJ7japiTLwVeCkXH3zNNPgJDxBIm5DaFVmIh3ZJV5HZUOkYULHdQJ50blvgVxdATqj1bf1xWINzCj7aA2fPCPPpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f6a95baf-a0fc-45ca-b8d3-3c2688fee488,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:f6a95baf-a0fc-45ca-b8d3-3c2688fee488,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
        :quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:22ff788b-8530-4eff-9f77-222cf6e2895b,B
        ulkID:2301061954379M8BZJD6,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
        il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
        I:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: fd29bc19f56b49a299ef7cd42801477a-20230106
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <allen-kh.cheng@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1742996875; Fri, 06 Jan 2023 19:54:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 6 Jan 2023 19:54:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 19:54:33 +0800
From:   Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-watchdog@vger.kernel.org>
CC:     <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 2/2] watchdog: mtk_wdt: Add reset_by_toprgu support
Date:   Fri, 6 Jan 2023 19:53:26 +0800
Message-ID: <20230106115326.15374-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230106115326.15374-1-allen-kh.cheng@mediatek.com>
References: <20230106115326.15374-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In some cases, the MediaTek watchdog requires the toprgu to reset
counter after wdt resets.

Provide a reset_by_toprgu parameter for configuration.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 3e6212591e69..a9c437598e7e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -50,6 +50,7 @@
 #define WDT_MODE_IRQ_EN		(1 << 3)
 #define WDT_MODE_AUTO_START	(1 << 4)
 #define WDT_MODE_DUAL_EN	(1 << 6)
+#define WDT_MODE_CNT_SEL	(1 << 8)
 #define WDT_MODE_KEY		0x22000000
 
 #define WDT_SWRST		0x14
@@ -70,6 +71,7 @@ struct mtk_wdt_dev {
 	spinlock_t lock; /* protects WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
 	bool disable_wdt_extrst;
+	bool reset_by_toprgu;
 };
 
 struct mtk_wdt_data {
@@ -279,6 +281,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	if (mtk_wdt->disable_wdt_extrst)
 		reg &= ~WDT_MODE_EXRST_EN;
+	if (mtk_wdt->reset_by_toprgu)
+		reg |= WDT_MODE_CNT_SEL;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
@@ -408,6 +412,9 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	mtk_wdt->disable_wdt_extrst =
 		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
 
+	mtk_wdt->reset_by_toprgu =
+		of_property_read_bool(dev->of_node, "mediatek,reset-by-toprgu");
+
 	return 0;
 }
 
-- 
2.18.0

