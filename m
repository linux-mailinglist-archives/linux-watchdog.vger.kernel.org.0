Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA99D3B1A5E
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 14:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhFWMm2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Jun 2021 08:42:28 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54968 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230479AbhFWMmW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Jun 2021 08:42:22 -0400
X-UUID: 4e5cbd543fb84cd8b7eead8d0a519483-20210623
X-UUID: 4e5cbd543fb84cd8b7eead8d0a519483-20210623
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1681267014; Wed, 23 Jun 2021 20:40:02 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 20:40:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 20:40:00 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>,
        Christine Zhu <Christine.Zhu@mediatek.com>
Subject: [v4,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller head file
Date:   Wed, 23 Jun 2021 20:38:53 +0800
Message-ID: <20210623123854.21941-3-Christine.Zhu@mediatek.com>
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

Add toprgu reset-controller head file for MT8195 platform.

Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
---
 .../reset-controller/mt8195-resets.h          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h

diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset-controller/mt8195-resets.h
new file mode 100644
index 000000000000..7ec27a64afc7
--- /dev/null
+++ b/include/dt-bindings/reset-controller/mt8195-resets.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Crystal Guo <crystal.guo@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8195
+
+#define MT8195_TOPRGU_CONN_MCU_SW_RST          0
+#define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
+#define MT8195_TOPRGU_APU_SW_RST               2
+#define MT8195_TOPRGU_INFRA_AO_GRST_SW_RST     6
+#define MT8195_TOPRGU_MMSYS_SW_RST             7
+#define MT8195_TOPRGU_MFG_SW_RST               8
+#define MT8195_TOPRGU_VENC_SW_RST              9
+#define MT8195_TOPRGU_VDEC_SW_RST              10
+#define MT8195_TOPRGU_IMG_SW_RST               11
+#define MT8195_TOPRGU_APMIXEDSYS_SW_RST        13
+#define MT8195_TOPRGU_AUDIO_SW_RST             14
+#define MT8195_TOPRGU_CAMSYS_SW_RST            15
+#define MT8195_TOPRGU_EDPTX_SW_RST             16
+#define MT8195_TOPRGU_ADSPSYS_SW_RST           21
+#define MT8195_TOPRGU_DPTX_SW_RST              22
+#define MT8195_TOPRGU_SPMI_MST_SW_RST          23
+
+#define MT8195_TOPRGU_SW_RST_NUM               16
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
-- 
2.18.0

