Return-Path: <linux-watchdog+bounces-4564-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F31C54441
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 20:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECFCC3BA419
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 19:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82A4351FAD;
	Wed, 12 Nov 2025 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVZ+M2/w"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C8350D54;
	Wed, 12 Nov 2025 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762976129; cv=none; b=pj2PMyP6Oht7CMfllMwFPMEoXYduxxV7ZTJb2pfwh5rJad7DKXfuMSdtB8tDHHpP5iTGbshlMVnwf3rfjX8s7tnwsUdH34NmznoKIzlrfU4Sti1n/awwH1E1A7+YFlolDdy1TGEUuL73tM7nTOBGt7ZK3lrE1NEv+5UbhhDrc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762976129; c=relaxed/simple;
	bh=VcND7Hs+9hV86E+jfRbt5AG2/esnNfXiIcPPkolodBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fh8pp51uTJ7iPHAcHvGA7apw/R9q0eZ7evwUGaKqU6ccW2vl8mlpYEN5G0avSTGvCFTq+8moZPORJfTFfTPwV197wKYZj+59X8Oh1xEO7+HcPoBxZzKPlOghg/I4DY080dBzVJhWFO/zl5ramXFIIkwjZJ9YmgpeCTqSAR/RoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVZ+M2/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38412C2BCB2;
	Wed, 12 Nov 2025 19:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762976129;
	bh=VcND7Hs+9hV86E+jfRbt5AG2/esnNfXiIcPPkolodBY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WVZ+M2/wa8mYJh09LACM8eALn5JTxgicu7lWLdyUt0PY7EV8uKTZjZBxZPGLtzIXO
	 bmup4lhl9wnDBuhF+ns1lL6hWa66K1YMDIunhznoINf9mcziJMI9JkR89wp4elpHzv
	 aJjByakC+wpQOt9L2SYXgXreaaceCS79IGFE03+UOoulei3+hMcI90P+nlQUmktyJY
	 NUuTlFw+/4npKfbTJDw1sHWln2/dGhirp+ebURdLvKu7d8dRhBOlZTI5o8peGnuN4h
	 I+cHXlGdhc+Vssvn2f13pcox0NIdsY0XV7iGRCNmqEmONuoyoWJ7QMubgW7r3Z1ZNm
	 JEJVFJSX8rYGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1692ACD379F;
	Wed, 12 Nov 2025 19:35:29 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Wed, 12 Nov 2025 19:35:21 +0000
Subject: [PATCH v6 2/2] watchdog: Add driver for Gunyah Watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gunyah_watchdog-v6-2-38ad01f8dac0@oss.qualcomm.com>
References: <20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com>
In-Reply-To: <20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762976127; l=10259;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=ECUfSNKpRF16znzGrxztaElU7x47/pUt8RC+TOvDh2A=;
 b=FH+fB0oFw3kQ0Fiw5mqrp0LGxgKFCPex3nHxefYWE+We/jwMFOpd0tiLeI1RipSUS63DoG01v
 KDqvvza4g07AVS588Zc6fLbZne3xVw422QLouqjNm6xzSVN2orbc+bJ
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

Add driver to support the SMC-based watchdog provided by the Gunyah
Hypervisor. Device registration is done in the QCOM SCM driver after
checks to restrict the watchdog initialization to Qualcomm devices
running under Gunyah.

Gunyah watchdog is not a hardware but an SMC-based vendor-specific
hypervisor interface provided by the Gunyah hypervisor. The design
involving QCOM SCM driver for registering the platform device has been
devised to avoid adding non-hardware nodes to devicetree.

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
 MAINTAINERS                   |   1 +
 drivers/watchdog/Kconfig      |  13 +++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/gunyah_wdt.c | 260 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 275 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46bd8e033042..b93237883f18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3215,6 +3215,7 @@ F:	arch/arm64/boot/dts/qcom/
 F:	drivers/bus/qcom*
 F:	drivers/firmware/qcom/
 F:	drivers/soc/qcom/
+F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 05008d937e40..bc6db9a1c116 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2354,4 +2354,17 @@ config KEEMBAY_WATCHDOG
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
+	  module will be called gunyah_wdt.
+
 endif # WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index b680e4d3c1bc..1215efb7816d 100644
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
index 000000000000..addfd1733ad1
--- /dev/null
+++ b/drivers/watchdog/gunyah_wdt.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
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
+			   unsigned long arg2)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_smc(func_id, arg1, arg2, &res);
+	return gunyah_error_remap(res.a0);
+}
+
+static int gunyah_wdt_start(struct watchdog_device *wdd)
+{
+	unsigned int timeout_ms;
+	struct device *dev = wdd->parent;
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
+	if (ret && watchdog_active(wdd)) {
+		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
+		return ret;
+	}
+
+	timeout_ms = wdd->timeout * 1000;
+	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME, timeout_ms, timeout_ms);
+	if (ret) {
+		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
+	if (ret)
+		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int gunyah_wdt_stop(struct watchdog_device *wdd)
+{
+	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
+}
+
+static int gunyah_wdt_ping(struct watchdog_device *wdd)
+{
+	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
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
+static int gunyah_wdt_get_time_since_last_ping(void)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_smc(GUNYAH_WDT_STATUS, 0, 0, &res);
+	if (res.a0)
+		return gunyah_error_remap(res.a0);
+
+	return res.a2 / 1000;
+}
+
+static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	int seconds_since_last_ping;
+
+	seconds_since_last_ping = gunyah_wdt_get_time_since_last_ping();
+	if (seconds_since_last_ping < 0 ||
+	    seconds_since_last_ping > wdd->timeout)
+		return 0;
+
+	return wdd->timeout - seconds_since_last_ping;
+}
+
+static int gunyah_wdt_restart(struct watchdog_device *wdd,
+			      unsigned long action, void *data)
+{
+	/* Set timeout to 1ms and send a ping */
+	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
+	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1);
+	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
+	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
+
+	/* Wait to make sure reset occurs */
+	mdelay(100);
+
+	return 0;
+}
+
+static const struct watchdog_info gunyah_wdt_info = {
+	.identity = "Gunyah Watchdog",
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
+	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0);
+	if (ret) {
+		dev_err_probe(dev, ret, "status check failed\n");
+		return ret;
+	}
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
+	return devm_watchdog_register_device(dev, wdd);
+}
+
+static void gunyah_wdt_remove(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd = platform_get_drvdata(pdev);
+
+	gunyah_wdt_stop(wdd);
+}
+
+static int gunyah_wdt_suspend(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	if (watchdog_active(wdd))
+		gunyah_wdt_stop(wdd);
+
+	return 0;
+}
+
+static int gunyah_wdt_resume(struct device *dev)
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
+/*
+ * Gunyah watchdog is a vendor-specific hypervisor interface provided by the
+ * Gunyah hypervisor. Using QCOM SCM driver to detect Gunyah watchdog SMCCC
+ * hypervisor service and register platform device when the service is available
+ * allows this driver to operate independently of the devicetree and avoids
+ * adding the non-hardware nodes to the devicetree.
+ */
+static const struct platform_device_id gunyah_wdt_id[] = {
+	{ .name = "gunyah-wdt" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, gunyah_wdt_id);
+
+static struct platform_driver gunyah_wdt_driver = {
+	.driver = {
+		.name = "gunyah-wdt",
+		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
+	},
+	.id_table = gunyah_wdt_id,
+	.probe = gunyah_wdt_probe,
+	.remove = gunyah_wdt_remove,
+};
+
+module_platform_driver(gunyah_wdt_driver);
+
+MODULE_DESCRIPTION("Gunyah Watchdog Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0



