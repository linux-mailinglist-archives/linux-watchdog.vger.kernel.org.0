Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78153FFA45
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 08:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347087AbhICGRx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 02:17:53 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:36278 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1344368AbhICGRx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 02:17:53 -0400
X-UUID: 5c6a12ea3dd94529b5b78c902de5e13e-20210903
X-UUID: 5c6a12ea3dd94529b5b78c902de5e13e-20210903
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <fengquan.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1754092337; Fri, 03 Sep 2021 14:16:51 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 14:16:50 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 14:16:49 +0800
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
Subject: [v2,1/2] watchdog: mtk: add disable_wdt_extrst support
Date:   Fri, 3 Sep 2021 14:16:22 +0800
Message-ID: <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
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

Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993bd009..276b6cb7d225 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -63,6 +63,7 @@ struct mtk_wdt_dev {
 	void __iomem *wdt_base;
 	spinlock_t lock; /* protects WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
+	bool disable_wdt_extrst;
 };
 
 struct mtk_wdt_data {
@@ -240,6 +241,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 
 	reg = ioread32(wdt_base + WDT_MODE);
 	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (mtk_wdt->disable_wdt_extrst)
+		reg &= ~WDT_MODE_EXRST_EN;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
@@ -309,6 +312,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
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

