Return-Path: <linux-watchdog+bounces-4420-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A501C13E0C
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 10:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 33D3C501026
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 09:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F95A3019DE;
	Tue, 28 Oct 2025 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTPgwUxk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7EC2D7DCC;
	Tue, 28 Oct 2025 09:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644264; cv=none; b=nWxuwz1+K0o5IzDTFC3TZwpvwfIu9cbL7va9qa9DKIMN/mK1KTVQ4YznkHseQt187GcZBYdaF9/HYNFj1tvF/hfSQBcV+Y7O/J0yGcri2sllryFQYzW2MtBnam+4yM5NszmvRUq9irQnwNLBAjHVIIyI/Ye25de3Oo86wWDUkXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644264; c=relaxed/simple;
	bh=hmyvX54e/Pq3wH702n0mGK5fdV7/dkwgW0qSOzyj5fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eNrugUnJipeX+9aUHuPTWeAycJF507uwLpP7Y8SIzuTKlAIa1DQVW79Pi+0pCzff7lSoD69kg2tivGGTzIjorUcsvVFJ+58uwIpCQJRe0EpuPbGdIuuM/Jh/QM7ijIzQUZ9ExvaZjy/ibzZT/Ei5TPDHvddK2R2plPASjyZ7Cb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTPgwUxk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1C09C4CEE7;
	Tue, 28 Oct 2025 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761644263;
	bh=hmyvX54e/Pq3wH702n0mGK5fdV7/dkwgW0qSOzyj5fY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bTPgwUxkTcosqtTku+ynQ/uhSnmi5DqhVai49YtSS2LMEePvoj/hs7q7HhUo1NPVW
	 ibs3UOef2Zadr5UXYj2pijaJCFY7LzZUpYdeJkpqmOWQnPu/LI9uzegJSPpjnu59k1
	 hf+4yJdXB+uetJFlaiop8uED1tMcl93s8yaoQf9Rq+bO8qhKpYklPSfP+a29NfWlQl
	 w63NVkmt8g3fcExksteZ/dMzqG6trQzpt9v/z0iVnjcnmjlHgNBirQ/4UW2r0CNCwV
	 wf2EbhPBPXkwijNxlRAawedRgcSBWvbtxGV7/lyZNXWz8yGqrDNElc9xf1NMg08WaR
	 py3IYHgp/g35Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57B1CCF9EC;
	Tue, 28 Oct 2025 09:37:43 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Tue, 28 Oct 2025 09:35:34 +0000
Subject: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGWOAGkC/3XNSw6CMBCA4auQri2Zvoh15T2MMYVW2kSotlAlh
 LtbWLhRN5P8k8w3M4omOBPRoZhRMMlF5/scbFegxqq+Ndjp3IgCFSCB4XbsJ2UvTzU0VvsWU00
 rLjnbGypRvroHc3WvTTydc1sXBx+m7UEi6/a/lQgGzJSpJAgGhtdHH2P5GNWt8V1X5oFWMtEPQ
 wCqb4ZigmspNSeaCy7gB7Msyxvza20f/AAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761644261; l=13489;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=MsgkxXEQLrUcgc18mOIJvkj4vn6RKTSELgz/x6vMGUA=;
 b=IFDKkzAVK45MxZGXlmXm2NjEo9a7KJyeR3nrHv899VWMBJd7b9B9uU4BoNDKnpIVes6UhabO7
 ataVwIJBQGxB8js1dosWVLDzd52C3CZX/OsTFh6zDwGsTTpuBMVtLfm
X-Developer-Key: i=hrishabh.rajput@oss.qualcomm.com; a=ed25519;
 pk=syafMitrjr3b/OYAtA2Im06AUb3fxZY2vJ/t4iCPmgw=
X-Endpoint-Received: by B4 Relay for
 hrishabh.rajput@oss.qualcomm.com/20250903 with auth_id=509
X-Original-From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Reply-To: hrishabh.rajput@oss.qualcomm.com

From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
through MMIO is not available on all platforms. Depending on the
hypervisor configuration, the watchdog is either fully emulated or
exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
Specific Hypervisor Service Calls space.

When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
the devicetree. If we detect either of the device nodes, we don't
proceed ahead. Otherwise, we go ahead and invoke GUNYAH_WDT_STATUS SMC
to initiate the discovery of the SMC-based watchdog.

Add driver to support the SMC-based watchdog provided by the Gunyah
Hypervisor. module_exit() is intentionally not implemented as this
driver is intended to be a persistent module.

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
Gunyah is a Type-I hypervisor which was introduced in the patch series
[1]. It is an open source hypervisor. The source repo is available at
[2].

The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
access the MMIO watchdog. It either provides the fully emulated MMIO
based watchdog interface or the SMC-based watchdog interface depending
on the hypervisor configuration.
The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
version 1.1 and uses Vendor Specific Hypervisor Service Calls space.

This patch series adds support for the SMC-based watchdog interface
provided by the Gunyah Hypervisor.

This series is tested on SM8750 platform.

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

[2]
https://github.com/quic/gunyah-hypervisor
---
Changes in v3:
- Move back to platform driver model. In module init, determine if we're
  running on a Qualcomm device and there is no supported memory-mapped
  watchdog present. Then proceed to register platform device and driver
  for SMC-based Gunyah watchdog.
- To determine if we're running on a Qualcomm device we're checking the
  presence of "qcom,smem" compatible devicetree node. As an alternative,
  we also tried using socinfo for the same purpose. When both
  gunyah_wdt and socinfo drivers were made built-in, it couldn't be
  ensured that the socinfo driver probed successfully before gunyah_wdt
  init was called. Hence, we resorted to the devicetree node approach.
- Limit the errors listed in gunyah_error to the ones that can be
  produced by the driver.
- Link to v2: https://lore.kernel.org/r/20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com

Changes in v2:
- Move away from platform driver model since the devicetree overlay does
  not happen by default.
  See https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/
- Only when MMIO-based watchdog device is absent in the devicetree,
  proceed to detect SMC-based watchdog using GUNYAH_WDT_STATUS SMC and
  initialize if SMC returns success.
- Implement pm notifiers as gunyah_wdt is no longer a platform driver so
  dev_pm_ops cannot be used.
- Pretimeout IRQ is no longer supported.
- Remove struct gunyah_wdt since it is not required.
- Move the contents of gunyah_errno.h to gunyah_wdt.c.
- Link to v1: https://lore.kernel.org/r/20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com
---
 MAINTAINERS                   |   1 +
 drivers/watchdog/Kconfig      |  14 ++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/gunyah_wdt.c | 291 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 307 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c0b444e5fd5a..56dbd0d3e31b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3083,6 +3083,7 @@ F:	arch/arm64/boot/dts/qcom/
 F:	drivers/bus/qcom*
 F:	drivers/firmware/qcom/
 F:	drivers/soc/qcom/
+F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0c25b2ed44eb..f0dee04b3650 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2343,4 +2343,18 @@ config KEEMBAY_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called keembay_wdt.
 
+config GUNYAH_WATCHDOG
+	tristate "Qualcomm Gunyah Watchdog"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on HAVE_ARM_SMCCC
+	depends on OF
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for watchdog timer provided by the
+	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
+	  to interact with Gunyah Watchdog.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gunyah_wdt.
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
index 000000000000..a165aff5be37
--- /dev/null
+++ b/drivers/watchdog/gunyah_wdt.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define GUNYAH_WDT_DRV_NAME "gunyah-wdt"
+
+#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
+			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
+
+/* SMCCC function IDs for watchdog operations */
+#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
+#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
+#define GUNYAH_WDT_PING      GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
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
+enum gunyah_error {
+	GUNYAH_ERROR_OK				= 0,
+	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
+	GUNYAH_ERROR_ARG_INVAL			= 1,
+};
+
+static struct platform_device *gunyah_wdt_dev;
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
+	case GUNYAH_ERROR_UNIMPLEMENTED:
+		return -EOPNOTSUPP;
+	default:
+		return -EINVAL;
+	}
+}
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
+	struct device *dev = wdd->parent;
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
+	if (ret && watchdog_active(wdd)) {
+		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
+		return ret;
+	}
+
+	timeout_ms = wdd->timeout * 1000;
+	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
+			      timeout_ms, timeout_ms, &res);
+	if (ret) {
+		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
+	if (ret)
+		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
+
+	return ret;
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
+				  unsigned int timeout_sec)
+{
+	wdd->timeout = timeout_sec;
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
+	/* Set timeout to 1ms and send a ping */
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
+	.get_timeleft = gunyah_wdt_get_timeleft,
+	.restart = gunyah_wdt_restart
+};
+
+static int gunyah_wdt_probe(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	wdd = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+
+	wdd->info = &gunyah_wdt_info;
+	wdd->ops = &gunyah_wdt_ops;
+	wdd->parent = dev;
+
+	/*
+	 * Although Gunyah expects 16-bit unsigned int values as timeout values
+	 * in milliseconds, values above 0x8000 are reserved. This limits the
+	 * max timeout value to 32 seconds.
+	 */
+	wdd->max_timeout = 32; /* seconds */
+	wdd->min_timeout = 1; /* seconds */
+	wdd->timeout = wdd->max_timeout;
+
+	gunyah_wdt_stop(wdd);
+	platform_set_drvdata(pdev, wdd);
+	watchdog_set_restart_priority(wdd, 0);
+
+	ret = devm_watchdog_register_device(dev, wdd);
+	if (ret) {
+		dev_err(dev, "Failed to register watchdog device: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "Gunyah watchdog registered\n");
+	return 0;
+}
+
+static int __maybe_unused gunyah_wdt_suspend(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	if (watchdog_active(wdd))
+		gunyah_wdt_stop(wdd);
+
+	return 0;
+}
+
+static int __maybe_unused gunyah_wdt_resume(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	if (watchdog_active(wdd))
+		gunyah_wdt_start(wdd);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
+
+static struct platform_driver gunyah_wdt_driver = {
+	.probe = gunyah_wdt_probe,
+	.driver = {
+		.name = GUNYAH_WDT_DRV_NAME,
+		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
+	},
+};
+
+static int __init gunyah_wdt_init(void)
+{
+	struct arm_smccc_res res;
+	struct device_node *np;
+	int ret;
+
+	/* Check if we're running on a Qualcomm device */
+	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
+	if (!np)
+		return -ENODEV;
+	of_node_put(np);
+
+	/*
+	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
+	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
+	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
+	 * the case.
+	 */
+	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
+	if (np) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
+	if (np) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
+	if (ret)
+		return -ENODEV;
+
+	ret = platform_driver_register(&gunyah_wdt_driver);
+	if (ret)
+		return ret;
+
+	gunyah_wdt_dev = platform_device_register_simple(GUNYAH_WDT_DRV_NAME,
+							 -1, NULL, 0);
+	if (IS_ERR(gunyah_wdt_dev)) {
+		platform_driver_unregister(&gunyah_wdt_driver);
+		return PTR_ERR(gunyah_wdt_dev);
+	}
+
+	return 0;
+}
+
+module_init(gunyah_wdt_init);
+
+MODULE_DESCRIPTION("Gunyah Watchdog Driver");
+MODULE_LICENSE("GPL");

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250903-gunyah_watchdog-2d2649438e29

Best regards,
-- 
Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>



