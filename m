Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C7D1B2496
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Apr 2020 13:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgDULGC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Apr 2020 07:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgDULGA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Apr 2020 07:06:00 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D62C061A0F
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 04:06:00 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id q18so3070987pgm.11
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z6/8C4oa9QlfkP6T/TF0bK1AUsLOdimzyYALyY4eY0M=;
        b=goAporC6/Dil0Et77TDr7GRh+FrIXEoN1OWLehzLNZQ9KmBbj0XuFzaeVGtcjIZPRe
         upEXXhrIiHjADUNeXquZW2pCvPUUDNx14BRbhDHoehW0Ma6hvrAhVMCZzZPAC1+NmQ2B
         JlzCvo0klC2W2GSPbOFnxmW+FqQmAngxczZ9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z6/8C4oa9QlfkP6T/TF0bK1AUsLOdimzyYALyY4eY0M=;
        b=mPFd5Z4xpmW4dHfNE3W/MqMW0TU5g62C+dyDSfvBdxlHYdZwf0N/dUwYbfch3YgsWX
         XMw6sTFmq8urlFeUcvHN2jPWdXihsuW5dLnqLxXqQHTzZ1LmjULFREaL66bhJXGDE2iS
         VK61ej6szx3Qtrfo/hGFGTqwtD1+7MdGoxHKs0a8JyvHYACAHoH9cnZ8aNgTRXfFINNr
         Crl82eREaPrEEyn5632KET+yecCdo8sOYjITsYz/plkC1EGowZVSIDPCfTn0H0mpoGK5
         3+QKgYhGrhRXQValvEVoj62r4q/JM5ICKwae1x2Xt3Sxg9rw2cgigd4stAHd8zl4NRE8
         QkbQ==
X-Gm-Message-State: AGi0PubSH5Grn2X2ZobQLcOEJYKQMxBuQ7gRlFJ57vX3Fr2znlRkT8V1
        Tz7PzPvZOE5sxHocV6bl5Kvz5A==
X-Google-Smtp-Source: APiQypKXU6B+lNxTQ6z+mmlmD+azeUp0c6GJsncfRgZv3gPxv15vR/XFlyx5vIh1kCmNOHZG4GtG/A==
X-Received: by 2002:a63:5d7:: with SMTP id 206mr19924816pgf.136.1587467159847;
        Tue, 21 Apr 2020 04:05:59 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id f3sm2209809pfd.144.2020.04.21.04.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 04:05:59 -0700 (PDT)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     xingyu.chen@amlogic.com, jwerner@chromium.org,
        Evan Benn <evanbenn@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
Date:   Tue, 21 Apr 2020 21:05:20 +1000
Message-Id: <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421110520.197930-1-evanbenn@chromium.org>
References: <20200421110520.197930-1-evanbenn@chromium.org>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

---

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
 drivers/watchdog/arm_smc_wdt.c | 194 +++++++++++++++++++++++++++++++++
 5 files changed, 210 insertions(+)
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
index 0000000000000..29d2573b2ca11
--- /dev/null
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -0,0 +1,194 @@
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
+#define get_smc_func_id(wdd) (*(u32 *)watchdog_get_drvdata(wdd))
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
+static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
+		      unsigned long arg, struct arm_smccc_res *res)
+{
+	struct arm_smccc_res local_res;
+
+	if (!res)
+		res = &local_res;
+
+	arm_smccc_smc(smc_func_id, call, arg, 0, 0, 0, 0, 0, res);
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
+	return smcwd_call(get_smc_func_id(wdd), SMCWD_PET, 0, NULL);
+}
+
+static unsigned int smcwd_get_timeleft(struct watchdog_device *wdd)
+{
+	struct arm_smccc_res res;
+
+	smcwd_call(get_smc_func_id(wdd), SMCWD_GET_TIMELEFT, 0, &res);
+	return res.a1;
+}
+
+static int smcwd_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	int res;
+
+	res = smcwd_call(get_smc_func_id(wdd), SMCWD_SET_TIMEOUT, timeout,
+			 NULL);
+	if (!res)
+		wdd->timeout = timeout;
+	return res;
+}
+
+static int smcwd_stop(struct watchdog_device *wdd)
+{
+	return smcwd_call(get_smc_func_id(wdd), SMCWD_ENABLE, 0, NULL);
+}
+
+static int smcwd_start(struct watchdog_device *wdd)
+{
+	return smcwd_call(get_smc_func_id(wdd), SMCWD_ENABLE, 1, NULL);
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
+	u32 *smc_func_id;
+
+	smc_func_id =
+		devm_kzalloc(&pdev->dev, sizeof(*smc_func_id), GFP_KERNEL);
+	if (!smc_func_id)
+		return -ENOMEM;
+
+	err = of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
+				   smc_func_id);
+	if (err < 0)
+		return err;
+
+	err = smcwd_call(*smc_func_id, SMCWD_INIT, 0, &res);
+	if (err < 0)
+		return err;
+
+	wdd = devm_kzalloc(&pdev->dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, wdd);
+	watchdog_set_drvdata(wdd, smc_func_id);
+
+	wdd->info = &smcwd_info;
+	/* get_timeleft is optional */
+	if (smcwd_call(*smc_func_id, SMCWD_GET_TIMELEFT, 0, NULL))
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
+	{ .compatible = "mediatek,mt8173-smc-wdt" },
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
2.26.1.301.g55bc3eb7cb9-goog

