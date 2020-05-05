Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D521C4C8B
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 05:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgEEDOE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 4 May 2020 23:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgEEDOD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 4 May 2020 23:14:03 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B5AC061A0F
        for <linux-watchdog@vger.kernel.org>; Mon,  4 May 2020 20:14:03 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t11so457092pgg.2
        for <linux-watchdog@vger.kernel.org>; Mon, 04 May 2020 20:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V7XTGrsejpZ7a1erL4lmcEaA1r5NdULG+/NqeICMKGo=;
        b=ntFVgGUeSweqLnvKxVBOKLxb3ixkLriEjm0TfvqKVm++2/bm3hH74eCJ3M4X8PvvsK
         ZeCEIJOfR5oLaHTq1JlNCPxJo/u1475ZcZI7dFCtbQWxkjV8/ZCGgIMgsOeGvBQPyd5E
         ylROsYiXgjxilXqB+WTPX+iDuowADnN5R7dXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V7XTGrsejpZ7a1erL4lmcEaA1r5NdULG+/NqeICMKGo=;
        b=Jy2HJH3ewtic2LWN5+fKRqQ5ggyG89COZrlXRCimcoIp7rdbQ3kdLZ00fny1zvqPHq
         JRHjiMyqMQjuPUDYmDjjMaN69IFMDTAvhOgSzqdjAs1/0UJUdkorILOZ1YEgZqfTtkko
         zkdA3M77DRELrtBiuD21vLp7rqa93rX2wkmrbnkx5BISNNw4Ar36XqDYFdEx236ciUxV
         ZdW9Ukpm4l9cn29RG8LahBAEeN0ZnG4Zx0RyyTJnzxLXZ6IbH/hRMv2vtEuUEOsXRXcd
         ZFuk2AbSl9KWlXDgi9UWq6F0n23pid7nXc6qmUJFaayCeVMHMvNJmcu8xc1Py1WZcm7P
         sd2A==
X-Gm-Message-State: AGi0PuaGbbdhlrQuxYnn/HQL+PyGCiYOYLGXLqz2o3cryd/oPLsBk6Y6
        /XL5d2gf1jVPIcCdsQGnkNO/ZLyh/ps=
X-Google-Smtp-Source: APiQypLTQHNH1z26tL4jDfuzsnjexXFeBSO+77yjdh9PXye9T8Q0rJsCutEpQgfmGoGWXFTaL3hVkw==
X-Received: by 2002:a62:3784:: with SMTP id e126mr1101858pfa.303.1588648443042;
        Mon, 04 May 2020 20:14:03 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id 67sm497515pfx.108.2020.05.04.20.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 20:14:02 -0700 (PDT)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, xingyu.chen@amlogic.com,
        Evan Benn <evanbenn@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v6 2/2] watchdog: Add new arm_smc_wdt watchdog driver
Date:   Tue,  5 May 2020 13:13:31 +1000
Message-Id: <20200505131242.v6.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200505031331.122781-1-evanbenn@chromium.org>
References: <20200505031331.122781-1-evanbenn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Julius Werner <jwerner@chromium.org>

This patch adds a watchdog driver that can be used on ARM systems
with the appropriate watchdog implemented in Secure Monitor firmware.
The driver communicates with firmware via a Secure Monitor Call.
This may be useful for platforms using TrustZone that want
the Secure Monitor firmware to have the final control over the watchdog.

This is implemented on mt8173 chromebook devices oak, elm and hana in
arm trusted firmware file plat/mediatek/mt8173/drivers/wdt/wdt.c.

Signed-off-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Evan Benn <evanbenn@chromium.org>

---

Changes in v6:
- Use default arm,smc-id value if non provided by dt

Changes in v5:
- Make timeleft return 0 on error
- Use type punning on smc_func_id to save an alloc
- Change compatible to arm,smc-wdt

Changes in v4:
- Get smc-id from of property
- Return a1 instead of a0 in timeleft

Changes in v3:
- Add optional get_timeleft op
- change name to arm_smc_wdt

Changes in v2:
- use watchdog_stop_on_reboot
- use watchdog_stop_on_unregister
- use devm_watchdog_register_device
- remove smcwd_shutdown, smcwd_remove
- change error codes

 MAINTAINERS                    |   1 +
 arch/arm64/configs/defconfig   |   1 +
 drivers/watchdog/Kconfig       |  13 +++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/arm_smc_wdt.c | 188 +++++++++++++++++++++++++++++++++
 5 files changed, 204 insertions(+)
 create mode 100644 drivers/watchdog/arm_smc_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f2b39767bfa9..2b782bbff200a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1462,6 +1462,7 @@ M:	Julius Werner <jwerner@chromium.org>
 R:	Evan Benn <evanbenn@chromium.org>
 S:	Maintained
 F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
+F:	drivers/watchdog/arm_smc_wdt.c
 
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 24e534d850454..0619df80f7575 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -513,6 +513,7 @@ CONFIG_UNIPHIER_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
 CONFIG_ARM_SBSA_WATCHDOG=y
+CONFIG_ARM_SMC_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
 CONFIG_DW_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=m
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0663c604bd642..c440b576d23bf 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -867,6 +867,19 @@ config DIGICOLOR_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called digicolor_wdt.
 
+config ARM_SMC_WATCHDOG
+	tristate "ARM Secure Monitor Call based watchdog support"
+	depends on ARM || ARM64
+	depends on OF
+	depends on HAVE_ARM_SMCCC
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for a watchdog timer
+	  implemented by the EL3 Secure Monitor on ARM platforms.
+	  Requires firmware support.
+	  To compile this driver as a module, choose M here: the
+	  module will be called arm_smc_wdt.
+
 config LPC18XX_WATCHDOG
 	tristate "LPC18xx/43xx Watchdog"
 	depends on ARCH_LPC18XX || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 6de2e4ceef190..97bed1d3d97cb 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -94,6 +94,7 @@ obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
 obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
 obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
 obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
+obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
new file mode 100644
index 0000000000000..8f3d0c3a005fb
--- /dev/null
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Secure Monitor Call watchdog driver
+ *
+ * Copyright 2020 Google LLC.
+ * Julius Werner <jwerner@chromium.org>
+ * Based on mtk_wdt.c
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+#include <uapi/linux/psci.h>
+
+#define DRV_NAME		"arm_smc_wdt"
+#define DRV_VERSION		"1.0"
+
+enum smcwd_call {
+	SMCWD_INIT		= 0,
+	SMCWD_SET_TIMEOUT	= 1,
+	SMCWD_ENABLE		= 2,
+	SMCWD_PET		= 3,
+	SMCWD_GET_TIMELEFT	= 4,
+};
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+static unsigned int timeout;
+
+static int smcwd_call(struct watchdog_device *wdd, enum smcwd_call call,
+		      unsigned long arg, struct arm_smccc_res *res)
+{
+	struct arm_smccc_res local_res;
+
+	if (!res)
+		res = &local_res;
+
+	arm_smccc_smc((u32)(uintptr_t)watchdog_get_drvdata(wdd), call, arg, 0,
+		      0, 0, 0, 0, res);
+
+	if (res->a0 == PSCI_RET_NOT_SUPPORTED)
+		return -ENODEV;
+	if (res->a0 == PSCI_RET_INVALID_PARAMS)
+		return -EINVAL;
+	if (res->a0 != PSCI_RET_SUCCESS)
+		return -EIO;
+	return 0;
+}
+
+static int smcwd_ping(struct watchdog_device *wdd)
+{
+	return smcwd_call(wdd, SMCWD_PET, 0, NULL);
+}
+
+static unsigned int smcwd_get_timeleft(struct watchdog_device *wdd)
+{
+	struct arm_smccc_res res;
+
+	smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, &res);
+	if (res.a0)
+		return 0;
+	return res.a1;
+}
+
+static int smcwd_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	int res;
+
+	res = smcwd_call(wdd, SMCWD_SET_TIMEOUT, timeout, NULL);
+	if (!res)
+		wdd->timeout = timeout;
+	return res;
+}
+
+static int smcwd_stop(struct watchdog_device *wdd)
+{
+	return smcwd_call(wdd, SMCWD_ENABLE, 0, NULL);
+}
+
+static int smcwd_start(struct watchdog_device *wdd)
+{
+	return smcwd_call(wdd, SMCWD_ENABLE, 1, NULL);
+}
+
+static const struct watchdog_info smcwd_info = {
+	.identity	= DRV_NAME,
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_KEEPALIVEPING |
+			  WDIOF_MAGICCLOSE,
+};
+
+static const struct watchdog_ops smcwd_ops = {
+	.start		= smcwd_start,
+	.stop		= smcwd_stop,
+	.ping		= smcwd_ping,
+	.set_timeout	= smcwd_set_timeout,
+};
+
+static const struct watchdog_ops smcwd_timeleft_ops = {
+	.start		= smcwd_start,
+	.stop		= smcwd_stop,
+	.ping		= smcwd_ping,
+	.set_timeout	= smcwd_set_timeout,
+	.get_timeleft	= smcwd_get_timeleft,
+};
+
+static int smcwd_probe(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd;
+	int err;
+	struct arm_smccc_res res;
+	u32 smc_func_id;
+
+	wdd = devm_kzalloc(&pdev->dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, wdd);
+
+	if (of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
+				 &smc_func_id))
+		smc_func_id = 0x82003D06;
+	watchdog_set_drvdata(wdd, (void *)(uintptr_t)smc_func_id);
+
+	err = smcwd_call(wdd, SMCWD_INIT, 0, &res);
+	if (err < 0)
+		return err;
+
+	wdd->info = &smcwd_info;
+	/* get_timeleft is optional */
+	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
+		wdd->ops = &smcwd_ops;
+	else
+		wdd->ops = &smcwd_timeleft_ops;
+	wdd->timeout = res.a2;
+	wdd->max_timeout = res.a2;
+	wdd->min_timeout = res.a1;
+	wdd->parent = &pdev->dev;
+
+	watchdog_stop_on_reboot(wdd);
+	watchdog_stop_on_unregister(wdd);
+	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_init_timeout(wdd, timeout, &pdev->dev);
+	err = smcwd_set_timeout(wdd, wdd->timeout);
+	if (err)
+		return err;
+
+	err = devm_watchdog_register_device(&pdev->dev, wdd);
+	if (err)
+		return err;
+
+	dev_info(&pdev->dev,
+		 "Watchdog registered (timeout=%d sec, nowayout=%d)\n",
+		 wdd->timeout, nowayout);
+
+	return 0;
+}
+
+static const struct of_device_id smcwd_dt_ids[] = {
+	{ .compatible = "arm,smc-wdt" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
+
+static struct platform_driver smcwd_driver = {
+	.probe		= smcwd_probe,
+	.driver		= {
+		.name		= DRV_NAME,
+		.of_match_table	= smcwd_dt_ids,
+	},
+};
+
+module_platform_driver(smcwd_driver);
+
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds");
+
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Julius Werner <jwerner@chromium.org>");
+MODULE_DESCRIPTION("ARM Secure Monitor Call Watchdog Driver");
+MODULE_VERSION(DRV_VERSION);
-- 
2.26.2.526.g744177e7f7-goog

