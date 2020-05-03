Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B751C2A2A
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 May 2020 07:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgECFef (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 3 May 2020 01:34:35 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:34411 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726921AbgECFef (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 3 May 2020 01:34:35 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from michaelsh@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 3 May 2020 08:34:29 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0435YQbT008633;
        Sun, 3 May 2020 08:34:29 +0300
From:   michaelsh@mellanox.com
To:     linux@roeck-us.net, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com,
        Michael Shych <michaelsh@mellanox.com>
Subject: [PATCH v3 2/4] platform/x86: mlx-platform: support new watchdog type with longer timeout
Date:   Sun,  3 May 2020 08:34:22 +0300
Message-Id: <20200503053424.31943-3-michaelsh@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200503053424.31943-1-michaelsh@mellanox.com>
References: <20200503053424.31943-1-michaelsh@mellanox.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Michael Shych <michaelsh@mellanox.com>

Add verification of WD capability in order to distinguish between
the existing WD types and new type, implemented in CPLD.
Add configuration for a new WD type.
Change access mode for watchdog registers.

Signed-off-by: Michael Shych <michaelsh@mellanox.com>
Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 106 ++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index c27548fd386a..9d3371cd58d5 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -178,7 +178,9 @@
 #define MLXPLAT_CPLD_WD_RESET_ACT_MASK	GENMASK(7, 1)
 #define MLXPLAT_CPLD_WD_FAN_ACT_MASK	(GENMASK(7, 0) & ~BIT(4))
 #define MLXPLAT_CPLD_WD_COUNT_ACT_MASK	(GENMASK(7, 0) & ~BIT(7))
+#define MLXPLAT_CPLD_WD_CPBLTY_MASK	(GENMASK(7, 0) & ~BIT(6))
 #define MLXPLAT_CPLD_WD_DFLT_TIMEOUT	30
+#define MLXPLAT_CPLD_WD3_DFLT_TIMEOUT	600
 #define MLXPLAT_CPLD_WD_MAX_DEVS	2
 
 /* mlxplat_priv - platform private data
@@ -1959,6 +1961,84 @@ static struct mlxreg_core_platform_data mlxplat_mlxcpld_wd_set_type2[] = {
 	},
 };
 
+/* Watchdog type3: hardware implementation version 3
+ * Can be on all systems. It's differentiated by WD capability bit.
+ * Old systems (MSN2700, MSN2410, MSN2740, MSN2100 and MSN2140)
+ * still have only one main watchdog.
+ */
+static struct mlxreg_core_data mlxplat_mlxcpld_wd_main_regs_type3[] = {
+	{
+		.label = "action",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "timeout",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+		.health_cntr = MLXPLAT_CPLD_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.bit = 6,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_wd_aux_regs_type3[] = {
+	{
+		.label = "action",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+	{
+		.label = "timeout",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+		.health_cntr = MLXPLAT_CPLD_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_mlxcpld_wd_set_type3[] = {
+	{
+		.data = mlxplat_mlxcpld_wd_main_regs_type3,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_wd_main_regs_type3),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-main",
+	},
+	{
+		.data = mlxplat_mlxcpld_wd_aux_regs_type3,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_wd_aux_regs_type3),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-aux",
+	},
+};
+
 static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -1989,8 +2069,10 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_WD2_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
@@ -2601,6 +2683,27 @@ static int mlxplat_mlxcpld_verify_bus_topology(int *nr)
 	return 0;
 }
 
+static int mlxplat_mlxcpld_check_wd_capability(void *regmap)
+{
+	u32 regval;
+	int i, rc;
+
+	rc = regmap_read(regmap, MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+			 &regval);
+	if (rc)
+		return rc;
+
+	if (!(regval & ~MLXPLAT_CPLD_WD_CPBLTY_MASK)) {
+		for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type3); i++) {
+			if (mlxplat_wd_data[i])
+				mlxplat_wd_data[i] =
+					&mlxplat_mlxcpld_wd_set_type3[i];
+		}
+	}
+
+	return 0;
+}
+
 static int __init mlxplat_init(void)
 {
 	struct mlxplat_priv *priv;
@@ -2733,6 +2836,9 @@ static int __init mlxplat_init(void)
 	}
 
 	/* Add WD drivers. */
+	err = mlxplat_mlxcpld_check_wd_capability(priv->regmap);
+	if (err)
+		goto fail_platform_wd_register;
 	for (j = 0; j < MLXPLAT_CPLD_WD_MAX_DEVS; j++) {
 		if (mlxplat_wd_data[j]) {
 			mlxplat_wd_data[j]->regmap = priv->regmap;
-- 
2.11.0

