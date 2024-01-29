Return-Path: <linux-watchdog+bounces-510-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576084150E
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jan 2024 22:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6EF11F259FB
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jan 2024 21:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513E215956E;
	Mon, 29 Jan 2024 21:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDLhRJIf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D7158D68
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Jan 2024 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563165; cv=none; b=Y2hGSC53+Tz03wm/w8T/Smtx3D9ZAYHaFMuFZLr4v3pX4KXk2PMqyvu3v0VOlM0wlBVgrEVtmVmZRT87QzC1UtX7+0i9OG6Ohnh4/TPUbBehG+eW/2aDjS/wMo+lPLLIGjr80TPS8Jdtsz0pBDZd2z2kdLw3JHGjrdunKv8LD70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563165; c=relaxed/simple;
	bh=/ugR5s+M8bY3zdX2bhDZ4xqGChDvsokzBXYol4bVq3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jyo+D1PpJ7n064mgpNJTdbWhmo1kRYXV3F9PI2CQR3eel04OPrEK+ENNtB24NPDPuu3R/Po/4Xgh442BfvEHI/zYJCh17XuoMgebPUI7hoXuP6JMhzAPvV8au8HEQtRj1rOTwEg6VTaLURHftm6a/yTuy4wtsU9qQ1/pf+VBa5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDLhRJIf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so40577305e9.1
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jan 2024 13:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706563160; x=1707167960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpbxmGmuZYrvIhn48LubQTFMeBUE52UDQ+rws3cLcIw=;
        b=pDLhRJIfVbfMoKNsYhR+M15kpzdQa1g774VlTyQyp5UW3BDXj0CpxnID+ZH7avZWaC
         db5AZ0h810CYc3JAxIsyzde0wim3yaCj9SmG2YVRrBrNP/Zal2EQ6GtUz+56sPlvUu21
         WTAnZyWhZtodpDZrTzC0sTO2Lyl9kibMJbLVYnWLhTHD/0h7einL5rq712wmAjbshMjV
         RlQs9VRYZ0bcgQ+bosfqG28Md/GxhUtqpmxXOKWdvFHkbiR/oeMTUHYhDoujnOoyYbn4
         LYacx13jlez8Askbexhgy2UZ0YRcfuhTHYJCluaaU43agD8qHUk9BALoFJAwl6S9W/Lc
         Kxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706563160; x=1707167960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpbxmGmuZYrvIhn48LubQTFMeBUE52UDQ+rws3cLcIw=;
        b=jaH1zE3/f2O1/A9n3D+VzUAvGU1qhL8ulizwSkpnqTiN2hn6Gamb1aN59P2Jf9QHX8
         U8vcPnGeLEWYL9BoeeG26f9mt2UzsH4XVM+yblim25bVVg+dnAaLWP05IkSo4Tvg1YgA
         Gebz9IjLEzUBlLS+e/gRVdycQXApdcMh3g+c9KlC+MT7m3wuPBY8JYRW4DbHl1CsU5pc
         zKb7WJFCgm63MJim8EuzBkVut2TFVmpX4dNx/cCGAtcyjAYibFNkN+0eYmDQlb3GNO5E
         GT67jgkRYxefJb/t480gYYfBCs0hjpqrpqpJzgCnKH6IFQ55LjWycbrh1nBcgMKH2p2x
         c3rQ==
X-Gm-Message-State: AOJu0Ywlx+LFY6IMzllodH626gIgh5S6fHODhQ8EkGnqMrUJyM268cTV
	4rEDvzL5j+4lnj3tnWui/RAYfhV8V/vB4XylkDTVQa9WGiIICvcYhuThKche3ow=
X-Google-Smtp-Source: AGHT+IGq496WvoS458/OV6ogIzPiHEOahmR7jXJ5JCsbQm8flYz8BsDEO8BZFz8Bw9ljv/Bn9hrfhQ==
X-Received: by 2002:a05:600c:3b0e:b0:40e:f56e:712c with SMTP id m14-20020a05600c3b0e00b0040ef56e712cmr3775905wms.37.1706563160295;
        Mon, 29 Jan 2024 13:19:20 -0800 (PST)
Received: from gpeter-l.lan (host-92-21-139-67.as13285.net. [92.21.139.67])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b0040e3635ca65sm15126928wmb.2.2024.01.29.13.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 13:19:19 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/2] soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs
Date: Mon, 29 Jan 2024 21:19:11 +0000
Message-ID: <20240129211912.3068411-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129211912.3068411-1-peter.griffin@linaro.org>
References: <20240129211912.3068411-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
security hardening reasons so that they are only accessible in el3 via an
SMC call.

As most Exynos drivers that need to write PMU registers currently obtain a
regmap via syscon (phys, pinctrl, watchdog). Support for the above usecase
is implemented in this driver using a custom regmap similar to syscon to
handle the SMC call. Platforms that don't secure PMU registers, get a mmio
regmap like before. As regmaps abstract out the underlying register access
changes to the leaf drivers are minimal.

A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
that currently use syscon_regmap_lookup_by_phandle(). This also handles
deferred probing.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c       | 227 ++++++++++++++++++++++++-
 include/linux/soc/samsung/exynos-pmu.h |  10 ++
 2 files changed, 236 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 250537d7cfd6..7bcc144e53a2 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -5,6 +5,7 @@
 //
 // Exynos - CPU PMU(Power Management Unit) support
 
+#include <linux/arm-smccc.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -12,20 +13,159 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/regmap.h>
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/soc/samsung/exynos-pmu.h>
 
 #include "exynos-pmu.h"
 
+static struct platform_driver exynos_pmu_driver;
+
+#define PMUALIVE_MASK GENMASK(14, 0)
+
 struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
+	struct regmap *pmureg;
 };
 
 void __iomem *pmu_base_addr;
 static struct exynos_pmu_context *pmu_context;
 
+/*
+ * Tensor SoCs are configured so that PMU_ALIVE registers can only be written
+ * from el3. As Linux needs to write some of these registers, the following
+ * SMC register read/write/read,write,modify interface is used.
+ *
+ * Note: This SMC interface is known to be implemented on gs101 and derivative
+ * SoCs.
+ */
+#define TENSOR_SMC_PMU_SEC_REG			(0x82000504)
+#define TENSOR_PMUREG_READ			0
+#define TENSOR_PMUREG_WRITE			1
+#define TENSOR_PMUREG_RMW			2
+
+/**
+ * tensor_sec_reg_write
+ * Write to a protected SMC register.
+ * @base: Base address of PMU
+ * @reg:  Address offset of register
+ * @val:  Value to write
+ * Return: (0) on success
+ *
+ */
+static int tensor_sec_reg_write(void *base, unsigned int reg, unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)base;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG,
+		      pmu_base + reg,
+		      TENSOR_PMUREG_WRITE,
+		      val, 0, 0, 0, 0, &res);
+
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %lu\n", __func__, res.a0);
+
+	return (int)res.a0;
+}
+
+/**
+ * tensor_sec_reg_rmw
+ * Read/Modify/Write to a protected SMC register.
+ * @base: Base address of PMU
+ * @reg:  Address offset of register
+ * @val:  Value to write
+ * Return: (0) on success
+ *
+ */
+static int tensor_sec_reg_rmw(void *base, unsigned int reg,
+			      unsigned int mask, unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)base;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG,
+		      pmu_base + reg,
+		      TENSOR_PMUREG_RMW,
+		      mask, val, 0, 0, 0, &res);
+
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %lu\n", __func__, res.a0);
+
+	return (int)res.a0;
+}
+
+/**
+ * tensor_sec_reg_read
+ * Read a protected SMC register.
+ * @base: Base address of PMU
+ * @reg:  Address offset of register
+ * @val:  Value read
+ * Return: (0) on success
+ */
+static int tensor_sec_reg_read(void *base, unsigned int reg, unsigned int *val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)base;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG,
+		      pmu_base + reg,
+		      TENSOR_PMUREG_READ,
+		      0, 0, 0, 0, 0, &res);
+
+	*val = (unsigned int)res.a0;
+
+	return 0;
+}
+
+
+/*
+ * For SoCs that have set/clear bit hardware this function
+ * can be used when the PMU register will be accessed by
+ * multiple masters.
+ *
+ * For example, to set bits 13:8 in PMU reg offset 0x3e80
+ * tensor_set_bit_atomic(0x3e80, 0x3f00, 0x3f00);
+ *
+ * To clear bits 13:8 in PMU offset 0x3e80
+ * tensor_set_bit_atomic(0x3e80, 0x0, 0x3f00);
+ */
+static inline void tensor_set_bit_atomic(void *ctx, unsigned int offset,
+					 u32 val, u32 mask)
+{
+	unsigned int i;
+
+	for (i = 0; i < 32; i++) {
+		if (mask & BIT(i)) {
+			if (val & BIT(i)) {
+				offset |= 0xc000;
+				tensor_sec_reg_write(ctx, offset, i);
+			} else {
+				offset |= 0x8000;
+				tensor_sec_reg_write(ctx, offset, i);
+			}
+		}
+	}
+}
+
+int tensor_sec_update_bits(void *ctx, unsigned int reg, unsigned int mask, unsigned int val)
+{
+	int ret = 0;
+
+	/*
+	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
+	 * as the target registers can be accessed by multiple masters.
+	 */
+	if (reg > PMUALIVE_MASK)
+		return tensor_sec_reg_rmw(ctx, reg, mask, val);
+
+	tensor_set_bit_atomic(ctx, reg, val, mask);
+
+	return ret;
+}
+
 void pmu_raw_writel(u32 val, u32 offset)
 {
 	writel_relaxed(val, pmu_base_addr + offset);
@@ -80,6 +220,8 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
  */
 static const struct of_device_id exynos_pmu_of_device_ids[] = {
 	{
+		.compatible = "google,gs101-pmu",
+	}, {
 		.compatible = "samsung,exynos3250-pmu",
 		.data = exynos_pmu_data_arm_ptr(exynos3250_pmu_data),
 	}, {
@@ -113,19 +255,73 @@ static const struct mfd_cell exynos_pmu_devs[] = {
 	{ .name = "exynos-clkout", },
 };
 
+/**
+ * exynos_get_pmu_regmap
+ * Find the pmureg previously configured in probe() and return regmap property.
+ * Return: regmap if found or error if not found.
+ */
 struct regmap *exynos_get_pmu_regmap(void)
 {
 	struct device_node *np = of_find_matching_node(NULL,
 						      exynos_pmu_of_device_ids);
 	if (np)
-		return syscon_node_to_regmap(np);
+		return exynos_get_pmu_regmap_by_phandle(np, NULL);
 	return ERR_PTR(-ENODEV);
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 
+/**
+ * exynos_get_pmu_regmap_by_phandle
+ * Find the pmureg previously configured in probe() and return regmap property.
+ * Return: regmap if found or error if not found.
+ *
+ * @np: Pointer to device's Device Tree node
+ * @property: Device Tree property name which references the pmu
+ */
+struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
+						const char *property)
+{
+	struct device *dev;
+	struct exynos_pmu_context *ctx;
+	struct device_node *pmu_np;
+
+	if (property)
+		pmu_np = of_parse_phandle(np, property, 0);
+	else
+		pmu_np = np;
+
+	if (!pmu_np)
+		return ERR_PTR(-ENODEV);
+
+	dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver,
+					    (void *)pmu_np);
+	of_node_put(pmu_np);
+	if (!dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	ctx = dev_get_drvdata(dev);
+
+	return ctx->pmureg;
+}
+EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
+
+static struct regmap_config pmu_regs_regmap_cfg = {
+	.name = "pmu_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
+	struct resource *res;
+	struct regmap *regmap;
+	struct regmap_config pmuregmap_config = pmu_regs_regmap_cfg;
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	int ret;
 
 	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -137,6 +333,35 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			GFP_KERNEL);
 	if (!pmu_context)
 		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	pmuregmap_config.max_register = resource_size(res) -
+				     pmuregmap_config.reg_stride;
+
+	if (of_device_is_compatible(np, "google,gs101-pmu")) {
+		pmuregmap_config.reg_read = tensor_sec_reg_read;
+		pmuregmap_config.reg_write = tensor_sec_reg_write;
+		pmuregmap_config.reg_update_bits = tensor_sec_update_bits;
+
+		/* Need physical address for SMC call */
+		regmap = devm_regmap_init(dev, NULL,
+					  (void *)(uintptr_t)res->start,
+					  &pmuregmap_config);
+	} else {
+		pmuregmap_config.max_register = resource_size(res) - 4;
+		regmap = devm_regmap_init_mmio(dev, pmu_base_addr,
+					       &pmuregmap_config);
+	}
+
+	if (IS_ERR(regmap)) {
+		pr_err("regmap init failed\n");
+		return PTR_ERR(regmap);
+	}
+
+	pmu_context->pmureg = regmap;
 	pmu_context->dev = dev;
 	pmu_context->pmu_data = of_device_get_match_data(dev);
 
diff --git a/include/linux/soc/samsung/exynos-pmu.h b/include/linux/soc/samsung/exynos-pmu.h
index a4f5516cc956..68fb01ba6bef 100644
--- a/include/linux/soc/samsung/exynos-pmu.h
+++ b/include/linux/soc/samsung/exynos-pmu.h
@@ -21,11 +21,21 @@ enum sys_powerdown {
 extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
 #ifdef CONFIG_EXYNOS_PMU
 extern struct regmap *exynos_get_pmu_regmap(void);
+
+extern struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
+						       const char *property);
+
 #else
 static inline struct regmap *exynos_get_pmu_regmap(void)
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
+							      const char *property)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif /* __LINUX_SOC_EXYNOS_PMU_H */
-- 
2.43.0.429.g432eaa2c6b-goog


