Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151693D37BD
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Jul 2021 11:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhGWIwA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Jul 2021 04:52:00 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:33494 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229949AbhGWIv7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Jul 2021 04:51:59 -0400
X-UUID: d4173402705d470d9d8b5dc487989237-20210723
X-UUID: d4173402705d470d9d8b5dc487989237-20210723
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 29985510; Fri, 23 Jul 2021 17:32:30 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 17:32:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 17:32:28 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>,
        <Rex-BC.Chen@mediatek.com>,
        Christine Zhu <Christine.Zhu@mediatek.com>
Subject: [v6,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document
Date:   Fri, 23 Jul 2021 17:31:26 +0800
Message-ID: <20210723093127.24568-2-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210723093127.24568-1-Christine.Zhu@mediatek.com>
References: <20210723093127.24568-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Update mtk-wdt document for MT8195 platform.

Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60de829..ca9b67ab7c44 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -13,6 +13,7 @@ Required properties:
 	"mediatek,mt8183-wdt": for MT8183
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
+	"mediatek,mt8195-wdt": for MT8195
 
 - reg : Specifies base physical address and size of the registers.
 
-- 
2.18.0

