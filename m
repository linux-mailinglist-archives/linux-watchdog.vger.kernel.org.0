Return-Path: <linux-watchdog+bounces-688-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA685AD64
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Feb 2024 21:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9B431F25056
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Feb 2024 20:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6584954BE9;
	Mon, 19 Feb 2024 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="teM3boAp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4388A54BF5
	for <linux-watchdog@vger.kernel.org>; Mon, 19 Feb 2024 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708375369; cv=none; b=TtiwJe5Rc6Bi27agaEnjWO3MQ6LhgtaW9YdPDrLBF4/vhct5wHgcQHZU6AWxGbcwueCuD8s+BP9LeCWehH/KoEFbqhYEwF59YLs3CVTGPtzgEsHSxtucoBsiJ77PANW99RNndstOC0SaN+Q6j6ymCMXJ7tamLy75/uUBaOHkcEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708375369; c=relaxed/simple;
	bh=wQH2swOgWvZybE5CuNHKcjVYAvHDU0BLb3ku7RawWsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tc6VgFQHtGiA/qIWg4orA8eOwds8zuzg/XhJAGIEAkIvq8ZBC/gdneRgRWVHGS/fBcBCJdBqdSTvUFJolZCLKxR6eMNW1tOVVVqhjigM0bDSzJgaNmuaKotlsyjWvtaVcV9Hwz4JFJ8fGkCXEnhipjbmKzVnab9g70xMFUgExhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=teM3boAp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41262eaa95aso12427505e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Feb 2024 12:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708375364; x=1708980164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRf8ZhDd2nE4V1DPnXuILg8S+ErKEgrU0/GhUaAau00=;
        b=teM3boApQsf5iAfQDk9eRimVDrOFL3xRCVpBA0dTbs8Io5G5r0Vyptfuh+2ttq6Adk
         VqsHe2a+iI2zZ7+TROS4+0kX/1badFepnUWJDbBpLj3tySDMrKGt7xFBTwe8iZ9TkubE
         W67OV6CEzeUxqpBXUtXJuSIDVACrQU2LATZLPMxinzrYg+hxc2Q43zK5USVGSeV5YeQi
         CF6+ailuchNF2qaeYMjbQ1puAQaGNYC+lNLj2XZZgszoYQNUURspQBqSzqkdWOqPN4+g
         9Kn/b9fAQ+zhfgMxuiwDMSoHFnQtmNYaOESwJRo6zvJRSGbeoqVFYtXy/m4Cz5q9f6pM
         zPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708375365; x=1708980165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRf8ZhDd2nE4V1DPnXuILg8S+ErKEgrU0/GhUaAau00=;
        b=wEzRMyQG4DYp/qxqW7OpE14bv+b6ecR7BtKqtTpnklMSuhGta1FcpF/w0wfnenbICW
         RjTkvmjuZ/Jov1bChMYbf81oRKCRN5Gs5EjmrLiqpWlJxHP/BMu4Rc+GpxOE46L1952M
         NzOj7pLVghGalxeJvWsidVdqpGnNZk/L4RAFg7Mxulm78/EaCC6gRKXLAaWtpyS84+wE
         +QheS0RHk2VGY6biYnhLdrRxJTkGOefBXgDxL4oHVGgHeStoqyD83+v8xGSBZCHcLurG
         40i4Us0ZAEfEM0zDhzjrXRH5hPL4KpTdtyXxAUwUOf+AD9B3YlqfNAaJXRQfDzunza+M
         pWAg==
X-Forwarded-Encrypted: i=1; AJvYcCV6++v0v6ZTQW33KtxOvdZTb8jhyfC9x/9QINXG7kAkwuD32tWhqNxR3ShimI0fCdjeFiaaHbsjBZ5X1fSuDjs7WPxFxX0LOVAU4IYM66E=
X-Gm-Message-State: AOJu0YzDgo1OvRXLAlaT4937tw6s+ZwHcTd9ENKXETrdDwjT+gdfYcWu
	7Sj92i0m4LQQ00fz5CKXd1/bSWNR1lKv50gdC25BiShX41UOgwLtYIi/I/aq0BaC1Dmt2g9icI6
	l
X-Google-Smtp-Source: AGHT+IGZdiTaB4LIKuvZwI/gGHFS+NZlKUiBzC/T9rBkNgsum/WJ5aOirTtpEc/kaxWSlxuNsNEhIA==
X-Received: by 2002:a5d:5887:0:b0:33d:649c:8c2 with SMTP id n7-20020a5d5887000000b0033d649c08c2mr435242wrf.0.1708375364549;
        Mon, 19 Feb 2024 12:42:44 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-74-232.as13285.net. [92.18.74.232])
        by smtp.gmail.com with ESMTPSA id bx15-20020a5d5b0f000000b0033d202abf01sm10561000wrb.28.2024.02.19.12.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 12:42:43 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: alexey.klimov@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v5 1/2] soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs
Date: Mon, 19 Feb 2024 20:42:37 +0000
Message-ID: <20240219204238.356942-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240219204238.356942-1-peter.griffin@linaro.org>
References: <20240219204238.356942-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
security hardening reasons so that they are only write accessible in el3
via an SMC call.

As most Exynos drivers that need to write PMU registers currently obtain a
regmap via syscon (phys, pinctrl, watchdog). Support for the above usecase
is implemented in this driver using a custom regmap similar to syscon to
handle the SMC call. Platforms that don't secure PMU registers, get a mmio
regmap like before. As regmaps abstract out the underlying register access
changes to the leaf drivers are minimal.

A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
that currently use syscon_regmap_lookup_by_phandle(). This also handles
deferred probing.

Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v4:
 - Use same argument names as in struct regmap_config
 - Remove inline keyword and rely on compiler
 - Update kerneldoc wording
 - property -> propname argument rename
 - reverse Xmas tree
 - Only call of_node_put() when of_parse_phandle is called
 - Collect tags

Changes since v3:
 - Fix PMUALIVE_MASK
 - Add TENSOR_ prefix
 - clear SET_BITS bits on each loop iteration
 - change set_bit to set_bits in func name
 - Fix some alignment
 - Add missing return on dev_err_probe
 - Reduce indentation in loop

Changes since v2
 - Add select REGMAP to Kconfig
 - Add constant for SET/CLEAR bits
 - Replace kerneldoc with one line comment
 - Fix kerneldoc for EXPORT_SYMBOL_GPL funcs
 - remove superfluous extern keyword
 - dev_err_probe() on probe error
 - shorten regmcfg name
 - no compatibles inside probe, use match data
 - don't mix declarations with/without initializations
 - tensor_sec_reg_read() use mmio to avoid access restrictions
 - Collect up Reviewed-by
 - const for regmap_config structs
---
 drivers/soc/samsung/Kconfig            |   1 +
 drivers/soc/samsung/exynos-pmu.c       | 235 ++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h       |   1 +
 include/linux/soc/samsung/exynos-pmu.h |  11 +-
 4 files changed, 245 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 27ec99af77e3..1a5dfdc978dc 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -42,6 +42,7 @@ config EXYNOS_PMU
 	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
 	select EXYNOS_PMU_ARM_DRIVERS if ARM && ARCH_EXYNOS
 	select MFD_CORE
+	select REGMAP_MMIO
 
 # There is no need to enable these drivers for ARMv8
 config EXYNOS_PMU_ARM_DRIVERS
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 250537d7cfd6..d6ae8025fdb4 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -5,6 +5,7 @@
 //
 // Exynos - CPU PMU(Power Management Unit) support
 
+#include <linux/arm-smccc.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/mfd/core.h>
@@ -12,19 +13,134 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/regmap.h>
 
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/soc/samsung/exynos-pmu.h>
 
 #include "exynos-pmu.h"
 
+#define PMUALIVE_MASK			GENMASK(13, 0)
+#define TENSOR_SET_BITS			(BIT(15) | BIT(14))
+#define TENSOR_CLR_BITS			BIT(15)
+#define TENSOR_SMC_PMU_SEC_REG		0x82000504
+#define TENSOR_PMUREG_READ		0
+#define TENSOR_PMUREG_WRITE		1
+#define TENSOR_PMUREG_RMW		2
+
 struct exynos_pmu_context {
 	struct device *dev;
 	const struct exynos_pmu_data *pmu_data;
+	struct regmap *pmureg;
 };
 
 void __iomem *pmu_base_addr;
 static struct exynos_pmu_context *pmu_context;
+/* forward declaration */
+static struct platform_driver exynos_pmu_driver;
+
+/*
+ * Tensor SoCs are configured so that PMU_ALIVE registers can only be written
+ * from EL3, but are still read accessible. As Linux needs to write some of
+ * these registers, the following functions are provided and exposed via
+ * regmap.
+ *
+ * Note: This SMC interface is known to be implemented on gs101 and derivative
+ * SoCs.
+ */
+
+/* Write to a protected PMU register. */
+static int tensor_sec_reg_write(void *context, unsigned int reg,
+				unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)context;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
+		      TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
+
+	/* returns -EINVAL if access isn't allowed or 0 */
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
+
+	return (int)res.a0;
+}
+
+/* Read/Modify/Write a protected PMU register. */
+static int tensor_sec_reg_rmw(void *context, unsigned int reg,
+			      unsigned int mask, unsigned int val)
+{
+	struct arm_smccc_res res;
+	unsigned long pmu_base = (unsigned long)context;
+
+	arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
+		      TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
+
+	/* returns -EINVAL if access isn't allowed or 0 */
+	if (res.a0)
+		pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
+
+	return (int)res.a0;
+}
+
+/*
+ * Read a protected PMU register. All PMU registers can be read by Linux.
+ * Note: The SMC read register is not used, as only registers that can be
+ * written are readable via SMC.
+ */
+static int tensor_sec_reg_read(void *context, unsigned int reg,
+			       unsigned int *val)
+{
+	*val = pmu_raw_readl(reg);
+	return 0;
+}
+
+/*
+ * For SoCs that have set/clear bit hardware this function can be used when
+ * the PMU register will be accessed by multiple masters.
+ *
+ * For example, to set bits 13:8 in PMU reg offset 0x3e80
+ * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
+ *
+ * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
+ * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
+ */
+static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
+				  u32 mask)
+{
+	int ret;
+	unsigned int i;
+
+	for (i = 0; i < 32; i++) {
+		if (!(mask & BIT(i)))
+			continue;
+
+		offset &= ~TENSOR_SET_BITS;
+
+		if (val & BIT(i))
+			offset |= TENSOR_SET_BITS;
+		else
+			offset |= TENSOR_CLR_BITS;
+
+		ret = tensor_sec_reg_write(ctx, offset, i);
+		if (ret)
+			return ret;
+	}
+	return ret;
+}
+
+static int tensor_sec_update_bits(void *ctx, unsigned int reg,
+				  unsigned int mask, unsigned int val)
+{
+	/*
+	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
+	 * as the target registers can be accessed by multiple masters.
+	 */
+	if (reg > PMUALIVE_MASK)
+		return tensor_sec_reg_rmw(ctx, reg, mask, val);
+
+	return tensor_set_bits_atomic(ctx, reg, val, mask);
+}
 
 void pmu_raw_writel(u32 val, u32 offset)
 {
@@ -75,11 +191,41 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 #define exynos_pmu_data_arm_ptr(data)	NULL
 #endif
 
+static const struct regmap_config regmap_smccfg = {
+	.name = "pmu_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_read = tensor_sec_reg_read,
+	.reg_write = tensor_sec_reg_write,
+	.reg_update_bits = tensor_sec_update_bits,
+};
+
+static const struct regmap_config regmap_mmiocfg = {
+	.name = "pmu_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static const struct exynos_pmu_data gs101_pmu_data = {
+	.pmu_secure = true
+};
+
 /*
  * PMU platform driver and devicetree bindings.
  */
 static const struct of_device_id exynos_pmu_of_device_ids[] = {
 	{
+		.compatible = "google,gs101-pmu",
+		.data = &gs101_pmu_data,
+	}, {
 		.compatible = "samsung,exynos3250-pmu",
 		.data = exynos_pmu_data_arm_ptr(exynos3250_pmu_data),
 	}, {
@@ -113,19 +259,75 @@ static const struct mfd_cell exynos_pmu_devs[] = {
 	{ .name = "exynos-clkout", },
 };
 
+/**
+ * exynos_get_pmu_regmap() - Obtain pmureg regmap
+ *
+ * Find the pmureg regmap previously configured in probe() and return regmap
+ * pointer.
+ *
+ * Return: A pointer to regmap if found or ERR_PTR error value.
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
+ * exynos_get_pmu_regmap_by_phandle() - Obtain pmureg regmap via phandle
+ * @np: Device node holding PMU phandle property
+ * @property: Name of property holding phandle value
+ *
+ * Find the pmureg regmap previously configured in probe() and return regmap
+ * pointer.
+ *
+ * Return: A pointer to regmap if found or ERR_PTR error value.
+ */
+struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
+						const char *propname)
+{
+	struct exynos_pmu_context *ctx;
+	struct device_node *pmu_np;
+	struct device *dev;
+
+	if (propname)
+		pmu_np = of_parse_phandle(np, propname, 0);
+	else
+		pmu_np = np;
+
+	if (!pmu_np)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Determine if exynos-pmu device has probed and therefore regmap
+	 * has been created and can be returned to the caller. Otherwise we
+	 * return -EPROBE_DEFER.
+	 */
+	dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver,
+					    (void *)pmu_np);
+
+	if (propname)
+		of_node_put(pmu_np);
+
+	if (!dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	ctx = dev_get_drvdata(dev);
+
+	return ctx->pmureg;
+}
+EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
+
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct regmap_config pmu_regmcfg;
+	struct regmap *regmap;
+	struct resource *res;
 	int ret;
 
 	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -137,9 +339,38 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 			GFP_KERNEL);
 	if (!pmu_context)
 		return -ENOMEM;
-	pmu_context->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
 	pmu_context->pmu_data = of_device_get_match_data(dev);
 
+	/* For SoCs that secure PMU register writes use custom regmap */
+	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_secure) {
+		pmu_regmcfg = regmap_smccfg;
+		pmu_regmcfg.max_register = resource_size(res) -
+					   pmu_regmcfg.reg_stride;
+		/* Need physical address for SMC call */
+		regmap = devm_regmap_init(dev, NULL,
+					  (void *)(uintptr_t)res->start,
+					  &pmu_regmcfg);
+	} else {
+		/* All other SoCs use a MMIO regmap */
+		pmu_regmcfg = regmap_mmiocfg;
+		pmu_regmcfg.max_register = resource_size(res) -
+					   pmu_regmcfg.reg_stride;
+		regmap = devm_regmap_init_mmio(dev, pmu_base_addr,
+					       &pmu_regmcfg);
+	}
+
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "regmap init failed\n");
+
+	pmu_context->pmureg = regmap;
+	pmu_context->dev = dev;
+
 	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
 		pmu_context->pmu_data->pmu_init();
 
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 1c652ffd79b4..0a49a2c9a08e 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -21,6 +21,7 @@ struct exynos_pmu_conf {
 struct exynos_pmu_data {
 	const struct exynos_pmu_conf *pmu_config;
 	const struct exynos_pmu_conf *pmu_config_extra;
+	bool pmu_secure;
 
 	void (*pmu_init)(void);
 	void (*powerdown_conf)(enum sys_powerdown);
diff --git a/include/linux/soc/samsung/exynos-pmu.h b/include/linux/soc/samsung/exynos-pmu.h
index a4f5516cc956..2bd9d12d9a52 100644
--- a/include/linux/soc/samsung/exynos-pmu.h
+++ b/include/linux/soc/samsung/exynos-pmu.h
@@ -10,6 +10,7 @@
 #define __LINUX_SOC_EXYNOS_PMU_H
 
 struct regmap;
+struct device_node;
 
 enum sys_powerdown {
 	SYS_AFTR,
@@ -20,12 +21,20 @@ enum sys_powerdown {
 
 extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
 #ifdef CONFIG_EXYNOS_PMU
-extern struct regmap *exynos_get_pmu_regmap(void);
+struct regmap *exynos_get_pmu_regmap(void);
+struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
+						const char *propname);
 #else
 static inline struct regmap *exynos_get_pmu_regmap(void)
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
+							      const char *propname)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif /* __LINUX_SOC_EXYNOS_PMU_H */
-- 
2.44.0.rc0.258.g7320e95886-goog


