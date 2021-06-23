Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19923B1A61
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 14:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhFWMmv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Jun 2021 08:42:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55039 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231157AbhFWMmb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Jun 2021 08:42:31 -0400
X-UUID: 97f8fcefaad8497fb4513dbc8a51f1cc-20210623
X-UUID: 97f8fcefaad8497fb4513dbc8a51f1cc-20210623
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 876596850; Wed, 23 Jun 2021 20:40:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 20:40:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 20:40:02 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>,
        Christine Zhu <Christine.Zhu@mediatek.com>
Subject: [v4,3/3] watchdog: mediatek: mt8195: add wdt support
Date:   Wed, 23 Jun 2021 20:38:54 +0800
Message-ID: <20210623123854.21941-4-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623123854.21941-1-Christine.Zhu@mediatek.com>
References: <20210623123854.21941-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: "Christine Zhu" <Christine.Zhu@mediatek.com>

Support MT8195 watchdog device.

Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993bd009..8231cb9cf5f9 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -12,6 +12,7 @@
 #include <dt-bindings/reset-controller/mt2712-resets.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/reset-controller/mt8192-resets.h>
+#include <dt-bindings/reset-controller/mt8195-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -81,6 +82,10 @@ static const struct mtk_wdt_data mt8192_data = {
 	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt8195_data = {
+	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
+};
+
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -341,6 +346,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
+	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.18.0

