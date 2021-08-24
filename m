Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEBC3F582C
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Aug 2021 08:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhHXG2j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 24 Aug 2021 02:28:39 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53326 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229854AbhHXG2i (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 24 Aug 2021 02:28:38 -0400
X-UUID: d6b05217e38f4be0a01df831c02c2830-20210824
X-UUID: d6b05217e38f4be0a01df831c02c2830-20210824
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 537937534; Tue, 24 Aug 2021 14:27:52 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 14:27:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 14:27:50 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>,
        Christine Zhu <Christine.Zhu@mediatek.com>
Subject: [RESEND v8,1/2] dt-bindings: reset: mt8195: add toprgu reset-controller header file
Date:   Tue, 24 Aug 2021 14:26:35 +0800
Message-ID: <20210824062633.14374-2-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
References: <20210824062633.14374-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add toprgu reset-controller header file for MT8195 platform.

Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 include/dt-bindings/reset/mt8195-resets.h | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8195-resets.h

diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
new file mode 100644
index 000000000000..a26bccc8b957
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
-- 
2.18.0

