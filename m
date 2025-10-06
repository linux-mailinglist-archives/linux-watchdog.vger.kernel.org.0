Return-Path: <linux-watchdog+bounces-4320-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A35BBD3A3
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 09:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E69F33491EF
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 07:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E102571BA;
	Mon,  6 Oct 2025 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAutZWl7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA218254B1F;
	Mon,  6 Oct 2025 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759736273; cv=none; b=dgQZ9la6gylJ8VqPeayhihTmkQZ080cfQQeCRaS/BKBwpVGMGs1FSB5MT6LRvgIoBlJxnJ6WRUtA7+JGGcnngapCqqYKe14hkDkTEdxr68Eo3+pODZlxw/hvid7K09xufsuxztGraLgD12QVjfRdg+jc/PjZKm4KkS964q1ZTF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759736273; c=relaxed/simple;
	bh=y/5BOeetd5j2fEywc55W5ox2cCkF90gtTW7PY+lZrlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P+RmHq/74YoRdwNtgo7gv9AXIOwylWGT2EoDF8ZigbCtTJ0O6goCYZSh1D3eH+INxlixjX3II6CBlIrm90tUlekWR31QuaT8cCThzFsagNbWAmuKr1xN/fpmfZOigzwn0qbX7JSRlo0o96czW4NtnO0tkAxeJLf69/1rUd7QawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAutZWl7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31DD7C4CEF5;
	Mon,  6 Oct 2025 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759736273;
	bh=y/5BOeetd5j2fEywc55W5ox2cCkF90gtTW7PY+lZrlA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qAutZWl7gaZflmcVC3n0WExFJe72K7BLLfcy4fTitT2JbqGkIaVpFq7T/uGf5U64K
	 IA3BRpLqZ+t2ju07qpJAFZjRMc0XtP1y+xeCOwKa7llWngGCSrB0hfdUYAWygpSqaF
	 5pvYK9LSBlX4LwnReGTyBCta0316hxXWuyc/e0bhHaaa5uy6x60BmSXuWhJ92lGFes
	 dup+6ce+7mwgODb+NQg5iAf4Eh2n5VDfOkKnck7fEfTjv7dZUhbkFdpJbnQViDagWx
	 OuHy7uGL7dDBTqWUpslIHronaKXBuB3HhgwXEFtcCYVETDVcuno6sCxbPxfRUzd/eU
	 USkvHpoXL61BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12826CAC5B8;
	Mon,  6 Oct 2025 07:37:53 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Mon, 06 Oct 2025 07:37:20 +0000
Subject: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK9x42gC/3WNQQ6CMBREr0L+2pJPW4h15T0MMRW+tIlQbaFKS
 O9uZe9mkjfJvNkgkLcU4FRs4CnaYN2UgR8K6IyeBmK2zwwceY0KBRuWadXm+tZzZ3o3MN7zRio
 pjsQV5NXT091+duOlzWxsmJ1f94NY/dr/rlgxZEJTo7AWSPJ2diGUr0U/OjeOZQ5oU0pf3Dgon
 7UAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759736271; l=13002;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=8xSved5BPqmRxH5nBgPZPTyI2zCHlJfJxVdZLdAS2Tk=;
 b=wmIBcINST0k+5ZSV3mHR6UYmG3FDCOfpPCYC181eRHt0HmMBctmih90TwjsI23YPMklfwlFPN
 J9bVti/UW0rBFNStXpfYCdSl+UkB3kkAT9gSrlOZEzlZFPjokp7et9U
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
expect MMIO watchdog device to be present in the devicetree. If we
detect this device node, we don't proceed ahead. Otherwise, we go ahead
and invoke GUNYAH_WDT_STATUS SMC to initiate the discovery of the
SMC-based watchdog.

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
 drivers/watchdog/gunyah_wdt.c | 310 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 326 insertions(+)

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
index 0c25b2ed44eb..c6572d707ee9 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2343,4 +2343,18 @@ config KEEMBAY_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called keembay_wdt.
 
+config GUNYAH_WATCHDOG
+	tristate "Qualcomm Gunyah Watchdog"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on HAVE_ARM_SMCCC
+	depends on CONFIG_OF
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
index 000000000000..0e4b8196709e
--- /dev/null
+++ b/drivers/watchdog/gunyah_wdt.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/suspend.h>
+#include <linux/watchdog.h>
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
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
+	if (ret && watchdog_active(wdd)) {
+		pr_err("%s: Failed to stop gunyah wdt %d\n", __func__, ret);
+		return ret;
+	}
+
+	timeout_ms = wdd->timeout * 1000;
+	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
+			      timeout_ms, timeout_ms, &res);
+	if (ret) {
+		pr_err("%s: Failed to set timeout for gunyah wdt %d\n",
+		       __func__,  ret);
+		return ret;
+	}
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
+	if (ret)
+		pr_err("%s: Failed to start gunyah wdt %d\n", __func__, ret);
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
+static int gunyah_wdt_pm_notifier(struct notifier_block *nb, unsigned long mode,
+				  void *data)
+{
+	struct watchdog_device *wdd;
+	int ret = 0;
+
+	wdd = container_of(nb, struct watchdog_device, pm_nb);
+
+	if (!watchdog_active(wdd))
+		return NOTIFY_DONE;
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		gunyah_wdt_ping(wdd);
+		ret = gunyah_wdt_stop(wdd);
+		if (ret)
+			return NOTIFY_BAD;
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = gunyah_wdt_start(wdd);
+		if (ret)
+			return NOTIFY_BAD;
+		gunyah_wdt_ping(wdd);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int __init gunyah_wdt_init(void)
+{
+	struct arm_smccc_res res;
+	struct watchdog_device *wdd;
+	struct device_node *np;
+	int ret;
+
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
+	wdd = kzalloc(sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+
+	wdd->info = &gunyah_wdt_info;
+	wdd->ops = &gunyah_wdt_ops;
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
+
+	watchdog_set_restart_priority(wdd, 0);
+
+	wdd->pm_nb.notifier_call = gunyah_wdt_pm_notifier;
+	ret = register_pm_notifier(&wdd->pm_nb);
+	if (ret)
+		pr_warn("Failed to register pm handler: %d\n", ret);
+
+	ret = watchdog_register_device(wdd);
+	if (ret) {
+		pr_err("Failed to register watchdog device: %d\n", ret);
+		unregister_pm_notifier(&wdd->pm_nb);
+		kfree(wdd);
+		return ret;
+	}
+
+	pr_debug("Gunyah watchdog registered\n");
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



