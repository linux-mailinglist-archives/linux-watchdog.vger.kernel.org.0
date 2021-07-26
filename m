Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750CC3D598C
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 14:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbhGZLut (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 07:50:49 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:37628 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234046AbhGZLus (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 07:50:48 -0400
X-UUID: 92342404ecb9441fbd87c87ac267d95d-20210726
X-UUID: 92342404ecb9441fbd87c87ac267d95d-20210726
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1286335394; Mon, 26 Jul 2021 20:31:15 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 20:31:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 20:31:14 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>,
        Christine Zhu <Christine.Zhu@mediatek.com>
Subject: [v7,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller header file
Date:   Mon, 26 Jul 2021 20:29:01 +0800
Message-ID: <20210726122901.12195-3-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726122901.12195-1-Christine.Zhu@mediatek.com>
References: <20210726122901.12195-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add toprgu reset-controller header file for MT8195 platform.

Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
---
 include/dt-bindings/reset/mt8195-resets.h | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8195-resets.h

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
new file mode 100644
index 000000000000..2a7335d56c59
--- /dev/null
+++ b/include/dt-bindings/reset/mt8195-resets.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)*/
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Christine Zhu <christine.zhu@mediatek.com>
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
\ No newline at end of file
-- 
2.18.0

