Return-Path: <linux-watchdog+bounces-4162-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08160B429FB
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 21:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C749716413A
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 19:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F88036932E;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7Y6IA9U"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707112D5939;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756928067; cv=none; b=bPxVP33G3dXVH4qV589ksar/BBDZ3xhQe+mBeKw17Ey2EfBP60dUdcbtYVRkmfmsShLmVzEmgXJ86XPpH64aEOz8mOAGxyCEyWB1GIgD+uxzSqBkoHrX1gB8OBUdJ8DY0QwhPH6jtZQodJacvrqXVMW480Y6YbDi6nrZaxfeWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756928067; c=relaxed/simple;
	bh=o81YVSKeW3tvRGfMaHMEjAaj2OsPMPNGBmri6Xmj9Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qmd9FpzOAd9EBAGFcRMbhC+VJ5yBNJbuy5iBoLgYan5mHt5nmRRheo/VIoyp0Q0yzgodXZ5Cp8PhF24zeZ1tSmAJabiykiCbudHTj9++/7UFoLnOFa2QW20wYbENvJumqzqLDT113+mqM4cBUkr8yI4zkjgza3SGLMxYn7y/XV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7Y6IA9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20A37C4CEFA;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756928067;
	bh=o81YVSKeW3tvRGfMaHMEjAaj2OsPMPNGBmri6Xmj9Xs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q7Y6IA9UiiGW5hx2AK8szv6rpZ8bAxToc2xHDAUbtkuiqBkoJmtESFS2Dn0lYwfQ7
	 g1xii8/L70M4fHPT1Bv+35iPIzg9iDSUo9kR7NDihNitMLQYss1V+TKu6+CQn7/pUn
	 FcNdEeNFdCJSqhQ7+WNO7gzblYdfcUoeiovRM1Tmf59vtgXmfy6inHxTpiFTnrxX1o
	 GQ1GLUyqBTfai+VPDOCW9LuhqV+KI9Nmch9bhY7yhIpPgWjPIJX6ENCyGiZfzbBsUK
	 R9x0CjJK+ms62LMtdEvbJ7cZSVB+R05+K0l5lPcRadPRCG59BqdwlrPhyO+GrxNGxL
	 eSwMULXfwgSDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07031CA1012;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Wed, 03 Sep 2025 19:34:00 +0000
Subject: [PATCH 2/2] watchdog: Add driver for Gunyah Watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
In-Reply-To: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756928065; l=12454;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=Xtt4m7Jt8ZJRdeUJz96dYVKzAz7zEp5pMNor8sqoRL8=;
 b=u9n/ecpjD38B0naKtMZ0ZPbRwB1zUgJaaUYIViBsSpNYmtWkt6UH/P1cGnC2XXZpToEiN2cje
 ZdpULZCJl7yCvVX2WAaPG36O/r/pVH4UIPCQK5KviFlLtkesaW5DDam
X-Developer-Key: i=hrishabh.rajput@oss.qualcomm.com; a=ed25519;
 pk=syafMitrjr3b/OYAtA2Im06AUb3fxZY2vJ/t4iCPmgw=
X-Endpoint-Received: by B4 Relay for
 hrishabh.rajput@oss.qualcomm.com/20250903 with auth_id=509
X-Original-From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Reply-To: hrishabh.rajput@oss.qualcomm.com

From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

Add driver to support the SMC-based watchdog timer provided by the
Gunyah Hypervisor.

On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
through MMIO is not available. Depending on the hypervisor
configuration, the watchdog is either fully emulated or exposed via
ARM's SMC Calling Conventions (SMCCC) through the Vendor Specific
Hypervisor Service Calls space.

When the SMC-based interface is enabled, a device tree overlay is used
to provide the pretimeout interrupt configuration.

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
 MAINTAINERS                   |   2 +
 drivers/watchdog/Kconfig      |  13 ++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/gunyah_wdt.c | 268 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/gunyah_errno.h  |  77 ++++++++++++
 5 files changed, 361 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03b74513e4ac..5e491211d96c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3084,10 +3084,12 @@ F:	arch/arm64/boot/dts/qcom/
 F:	drivers/bus/qcom*
 F:	drivers/firmware/qcom/
 F:	drivers/soc/qcom/
+F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
 F:	include/linux/firmware/qcom
+F:	include/linux/gunyah_errno.h
 F:	include/linux/soc/qcom/
 F:	include/soc/qcom/
 
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0c25b2ed44eb..2fed83e06990 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2343,4 +2343,17 @@ config KEEMBAY_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called keembay_wdt.
 
+config GUNYAH_WATCHDOG
+	tristate "Qualcomm Gunyah Watchdog"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on HAVE_ARM_SMCCC
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for watchdog timer provided by the
+	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
+	  to interact with Gunyah Watchdog.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gh_wdt.
+
 endif # WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index bbd4d62d2cc3..308379782bc3 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
 obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
 obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
+obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
new file mode 100644
index 000000000000..56e8e21510d3
--- /dev/null
+++ b/drivers/watchdog/gunyah_wdt.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/gunyah_errno.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
+			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
+
+/* SMCCC function IDs for watchdog operations */
+#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
+#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
+#define GUNYAH_WDT_PING       GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
+#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
+
+/*
+ * Control values for GUNYAH_WDT_CONTROL.
+ * Bit 0 is used to enable or disable the watchdog. If this bit is set,
+ * then the watchdog is enabled and vice versa.
+ * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
+ * it's expected to be 1.
+ */
+#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
+#define WDT_CTRL_DISABLE BIT(1)
+
+struct gunyah_wdt {
+	unsigned int pretimeout_irq;
+	struct watchdog_device wdd;
+};
+
+static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
+			   unsigned long arg2, struct arm_smccc_res *res)
+{
+	arm_smccc_1_1_smc(func_id, arg1, arg2, res);
+	return gunyah_error_remap(res->a0);
+}
+
+static int gunyah_wdt_start(struct watchdog_device *wdd)
+{
+	struct arm_smccc_res res;
+	unsigned int timeout_ms;
+	unsigned int pretimeout_ms;
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
+	if (ret)
+		return ret;
+
+	timeout_ms = wdd->timeout * 1000;
+	pretimeout_ms = wdd->pretimeout * 1000;
+	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
+			      pretimeout_ms, timeout_ms, &res);
+	if (ret)
+		return ret;
+
+	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
+}
+
+static int gunyah_wdt_stop(struct watchdog_device *wdd)
+{
+	struct arm_smccc_res res;
+
+	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
+}
+
+static int gunyah_wdt_ping(struct watchdog_device *wdd)
+{
+	struct arm_smccc_res res;
+
+	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
+}
+
+static int gunyah_wdt_set_timeout(struct watchdog_device *wdd,
+		     unsigned int timeout_sec)
+{
+	wdd->timeout = timeout_sec;
+
+	if (watchdog_active(wdd))
+		return gunyah_wdt_start(wdd);
+
+	return 0;
+}
+
+static int gunyah_wdt_set_pretimeout(struct watchdog_device *wdd,
+				     unsigned int pretimeout_sec)
+{
+	wdd->pretimeout = pretimeout_sec;
+
+	if (watchdog_active(wdd))
+		return gunyah_wdt_start(wdd);
+
+	return 0;
+}
+
+static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct arm_smccc_res res;
+	unsigned int seconds_since_last_ping;
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
+	if (ret)
+		return 0;
+
+	seconds_since_last_ping = res.a2 / 1000;
+	if (seconds_since_last_ping > wdd->timeout)
+		return 0;
+
+	return wdd->timeout - seconds_since_last_ping;
+}
+
+static int gunyah_wdt_restart(struct watchdog_device *wdd,
+			      unsigned long action, void *data)
+{
+	struct arm_smccc_res res;
+
+	/* Set timeout and pretimeout to 1ms and send a ping */
+	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
+	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1, &res);
+	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
+
+	/* Wait to make sure reset occurs */
+	mdelay(100);
+
+	return 0;
+}
+
+static const struct watchdog_info gunyah_wdt_info = {
+	.identity = "Gunyah Watchdog",
+	.firmware_version = 0,
+	.options = WDIOF_SETTIMEOUT
+		 | WDIOF_PRETIMEOUT
+		 | WDIOF_KEEPALIVEPING
+		 | WDIOF_MAGICCLOSE,
+};
+
+static const struct watchdog_ops gunyah_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = gunyah_wdt_start,
+	.stop = gunyah_wdt_stop,
+	.ping = gunyah_wdt_ping,
+	.set_timeout = gunyah_wdt_set_timeout,
+	.set_pretimeout = gunyah_wdt_set_pretimeout,
+	.get_timeleft = gunyah_wdt_get_timeleft,
+	.restart = gunyah_wdt_restart
+};
+
+static irqreturn_t gunyah_wdt_pretimeout_handler(int irq, void *arg)
+{
+	struct watchdog_device *wdd = arg;
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
+static int gunyah_wdt_probe(struct platform_device *pdev)
+{
+	struct gunyah_wdt *wdt;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdt->wdd.info = &gunyah_wdt_info;
+	wdt->wdd.ops = &gunyah_wdt_ops;
+	wdt->wdd.parent = dev;
+
+	/*
+	 * Although Gunyah expects 16-bit unsigned int values as timeout values
+	 * in milliseconds, values above 0x8000 are reserved. This limits the
+	 * max timeout value to 32 seconds.
+	 */
+	wdt->wdd.max_timeout = 32; /* seconds */
+	wdt->wdd.min_timeout = 1; /* seconds */
+	wdt->wdd.timeout = wdt->wdd.max_timeout;
+	wdt->wdd.pretimeout = wdt->wdd.timeout - 2;
+
+	gunyah_wdt_stop(&wdt->wdd);
+	watchdog_init_timeout(&wdt->wdd, 0, dev);
+
+	platform_set_drvdata(pdev, wdt);
+
+	watchdog_set_restart_priority(&wdt->wdd, 0);
+	ret = devm_watchdog_register_device(dev, &wdt->wdd);
+	if (ret) {
+		dev_err(dev, "Failed to register watchdog device: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Register the pretimeout irq as rising edge triggered irrespective of
+	 * the irqflags passed by Gunyah to make the driver compatible with
+	 * pretimeout governors like noop.
+	 */
+	wdt->pretimeout_irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(dev, wdt->pretimeout_irq,
+			       gunyah_wdt_pretimeout_handler,
+			       IRQF_TRIGGER_RISING,
+			       "wdt_pretimeout", &wdt->wdd);
+	if (ret) {
+		dev_err(dev, "Failed to register pretimeout irq: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "Gunyah watchdog registered\n");
+	return 0;
+}
+
+static int __maybe_unused gunyah_wdt_suspend(struct device *dev)
+{
+	struct gunyah_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		gunyah_wdt_stop(&wdt->wdd);
+
+	return 0;
+}
+
+static int __maybe_unused gunyah_wdt_resume(struct device *dev)
+{
+	struct gunyah_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdd))
+		gunyah_wdt_start(&wdt->wdd);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
+
+static const struct of_device_id gunyah_wdt_of_match[] = {
+	{ .compatible = "qcom,gh-watchdog" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gunyah_wdt_of_match);
+
+static struct platform_driver gunyah_wdt_driver = {
+	.probe = gunyah_wdt_probe,
+	.driver = {
+		.name = "gunyah-wdt",
+		.of_match_table = gunyah_wdt_of_match,
+		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
+	},
+};
+
+static int __init gunyah_wdt_init(void)
+{
+	return platform_driver_register(&gunyah_wdt_driver);
+}
+
+module_init(gunyah_wdt_init);
+
+MODULE_DESCRIPTION("Gunyah Watchdog Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/gunyah_errno.h b/include/linux/gunyah_errno.h
new file mode 100644
index 000000000000..518228e333bd
--- /dev/null
+++ b/include/linux/gunyah_errno.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _LINUX_GUNYAH_ERRNO_H
+#define _LINUX_GUNYAH_ERRNO_H
+
+#include <linux/errno.h>
+
+enum gunyah_error {
+	GUNYAH_ERROR_OK				= 0,
+	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
+	GUNYAH_ERROR_RETRY			= -2,
+
+	GUNYAH_ERROR_ARG_INVAL			= 1,
+	GUNYAH_ERROR_ARG_SIZE			= 2,
+	GUNYAH_ERROR_ARG_ALIGN			= 3,
+
+	GUNYAH_ERROR_NOMEM			= 10,
+
+	GUNYAH_ERROR_ADDR_OVFL			= 20,
+	GUNYAH_ERROR_ADDR_UNFL			= 21,
+	GUNYAH_ERROR_ADDR_INVAL			= 22,
+
+	GUNYAH_ERROR_DENIED			= 30,
+	GUNYAH_ERROR_BUSY			= 31,
+	GUNYAH_ERROR_IDLE			= 32,
+
+	GUNYAH_ERROR_IRQ_BOUND			= 40,
+	GUNYAH_ERROR_IRQ_UNBOUND		= 41,
+
+	GUNYAH_ERROR_CSPACE_CAP_NULL		= 50,
+	GUNYAH_ERROR_CSPACE_CAP_REVOKED		= 51,
+	GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
+	GUNYAH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
+	GUNYAH_ERROR_CSPACE_FULL		= 54,
+
+	GUNYAH_ERROR_MSGQUEUE_EMPTY		= 60,
+	GUNYAH_ERROR_MSGQUEUE_FULL		= 61,
+};
+
+/**
+ * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
+ * @gunyah_error: Gunyah hypercall return value
+ */
+static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
+{
+	switch (gunyah_error) {
+	case GUNYAH_ERROR_OK:
+		return 0;
+	case GUNYAH_ERROR_NOMEM:
+		return -ENOMEM;
+	case GUNYAH_ERROR_DENIED:
+	case GUNYAH_ERROR_CSPACE_CAP_NULL:
+	case GUNYAH_ERROR_CSPACE_CAP_REVOKED:
+	case GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE:
+	case GUNYAH_ERROR_CSPACE_INSUF_RIGHTS:
+	case GUNYAH_ERROR_CSPACE_FULL:
+		return -EACCES;
+	case GUNYAH_ERROR_BUSY:
+	case GUNYAH_ERROR_IDLE:
+		return -EBUSY;
+	case GUNYAH_ERROR_IRQ_BOUND:
+	case GUNYAH_ERROR_IRQ_UNBOUND:
+	case GUNYAH_ERROR_MSGQUEUE_FULL:
+	case GUNYAH_ERROR_MSGQUEUE_EMPTY:
+		return -EIO;
+	case GUNYAH_ERROR_UNIMPLEMENTED:
+	case GUNYAH_ERROR_RETRY:
+		return -EOPNOTSUPP;
+	default:
+		return -EINVAL;
+	}
+}
+
+#endif

-- 
2.43.0



