Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2520840ADCE
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Sep 2021 14:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbhINMg1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Sep 2021 08:36:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:40486 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232801AbhINMgV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Sep 2021 08:36:21 -0400
X-UUID: 77751c7b44d8426493af619b85db3633-20210914
X-UUID: 77751c7b44d8426493af619b85db3633-20210914
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <fengquan.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 900585629; Tue, 14 Sep 2021 20:35:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 14 Sep 2021 20:35:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 20:34:59 +0800
From:   Fengquan Chen <Fengquan.Chen@mediatek.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <fengquan.chen@mediatek.com>, <tinghan.shen@mediatek.com>,
        <randy.wu@mediatek.com>, <rex-bc.chen@mediatek.com>,
        <christine.zhu@mediatek.com>, <joe.yang@mediatek.com>,
        <zhishuang.zhang@mediatek.com>
Subject: [v3,2/2] watchdog: mtk: add disable_wdt_extrst support
Date:   Tue, 14 Sep 2021 20:34:54 +0800
Message-ID: <20210914123454.32603-3-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
References: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In some cases, we may need watchdog just to trigger an
internal soc reset without sending any output signal.

Provide a disable_wdt_extrst parameter for configuration.
We can disable or enable it just by configuring dts.

Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/mtk_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 796fbb048cbe..ceb57ea627cd 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -65,6 +65,7 @@ struct mtk_wdt_dev {
 	void __iomem *wdt_base;
 	spinlock_t lock; /* protects WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
+	bool disable_wdt_extrst;
 };
 
 struct mtk_wdt_data {
@@ -256,6 +257,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	else
 		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (mtk_wdt->disable_wdt_extrst)
+		reg &= ~WDT_MODE_EXRST_EN;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
@@ -381,6 +384,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 		if (err)
 			return err;
 	}
+
+	mtk_wdt->disable_wdt_extrst =
+		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
+
 	return 0;
 }
 
-- 
2.25.1

