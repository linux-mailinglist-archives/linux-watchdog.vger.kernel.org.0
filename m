Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3014456D8
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 17:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbhKDQLp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Nov 2021 12:11:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34037 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231639AbhKDQLo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Nov 2021 12:11:44 -0400
X-IronPort-AV: E=Sophos;i="5.87,209,1631545200"; 
   d="scan'208";a="99217950"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Nov 2021 01:09:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.57])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F3DD94017892;
        Fri,  5 Nov 2021 01:09:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 1/4] clk: renesas: rzg2l: Add support for watchdog reset selection
Date:   Thu,  4 Nov 2021 16:08:55 +0000
Message-Id: <20211104160858.15550-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch adds support for watchdog reset selection.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  6 ++++++
 drivers/clk/renesas/rzg2l-cpg.h     | 14 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 47c16265fca9..8618b0f19d7a 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -8,6 +8,7 @@
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 
 #include <dt-bindings/clock/r9a07g044-cpg.h>
@@ -271,7 +272,28 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+#define CPG_WDTRST_SEL			0xb14
+#define CPG_WDTRST_SEL_WDTRSTSEL(n)	BIT(n)
+
+#define CPG_WDTRST_SEL_WDTRST	(CPG_WDTRST_SEL_WDTRSTSEL(0) | \
+				 CPG_WDTRST_SEL_WDTRSTSEL(1) | \
+				 CPG_WDTRST_SEL_WDTRSTSEL(2))
+
+int r9a07g044_wdt_rst_setect(void __iomem *base)
+{
+	writel((CPG_WDTRST_SEL_WDTRST << 16) | CPG_WDTRST_SEL_WDTRST,
+	       base + CPG_WDTRST_SEL);
+
+	return 0;
+}
+
+static const struct rzg2l_cpg_soc_operations r9a07g044_cpg_ops = {
+	.wdt_rst_setect = r9a07g044_wdt_rst_setect,
+};
+
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
+	.ops = &r9a07g044_cpg_ops,
+
 	/* Core Clocks */
 	.core_clks = r9a07g044_core_clks,
 	.num_core_clks = ARRAY_SIZE(r9a07g044_core_clks),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a77cb47b75e7..f9dfee14a33e 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -932,6 +932,12 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	if (info->ops && info->ops->wdt_rst_setect) {
+		error = info->ops->wdt_rst_setect(priv->base);
+		if (error)
+			return error;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 484c7cee2629..e1b1497002ed 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -156,9 +156,20 @@ struct rzg2l_reset {
 		.bit = (_bit) \
 	}
 
+/**
+ * struct rzg2l_cpg_soc_operations - SoC-specific CPG Operations
+ *
+ * @wdt_rst_setect: WDT reset selection
+ */
+struct rzg2l_cpg_soc_operations {
+	int (*wdt_rst_setect)(void __iomem *base); /* Platform specific WDT reset selection */
+};
+
 /**
  * struct rzg2l_cpg_info - SoC-specific CPG Description
  *
+ * @ops: SoC-specific CPG Operations
+ *
  * @core_clks: Array of Core Clock definitions
  * @num_core_clks: Number of entries in core_clks[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
@@ -176,6 +187,9 @@ struct rzg2l_reset {
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
  */
 struct rzg2l_cpg_info {
+	/* CPG Operations */
+	const struct rzg2l_cpg_soc_operations *ops;
+
 	/* Core Clocks */
 	const struct cpg_core_clk *core_clks;
 	unsigned int num_core_clks;
-- 
2.17.1

