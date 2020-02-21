Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C871166F45
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 06:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbgBUFim (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Feb 2020 00:38:42 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:39136 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgBUFil (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Feb 2020 00:38:41 -0500
Received: by mail-pj1-f68.google.com with SMTP id e9so235979pjr.4
        for <linux-watchdog@vger.kernel.org>; Thu, 20 Feb 2020 21:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ihebwe3wpv8TVI2Q+rKN93pQGL38v53adMqGT/gjBKI=;
        b=YW8gO+coOvx+JcdbsuG4ZcZbjmeoHxzIhZjg0NFDBPa0xyzI7n60/g46BdJPdqNeq+
         lEAdpfrthUVphl8fO/+pgXgelLyg3lIQVgwFrzruzjYJ5w5+jQYKSGLoneqo7GA8PgRf
         JDaxKJ5DI5xUMB64saHppf7Q1Q51iMc0AkRkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ihebwe3wpv8TVI2Q+rKN93pQGL38v53adMqGT/gjBKI=;
        b=FjeEs6iDmLqQ2Wz65pgQF0qERuCoRANRMwEHpBGIEm/lIPaEYJ3jfjGPqS0IgbYpla
         12xlF9pUInZisf6JUvb/jdasQ+jmal1Sy4sDPWABr0VHsyp0GNFXmpLeHcBMZD8D40EY
         /TsNkzqN54ekcOfDSrA9GcXuXEzhR42fDxEA38wgo6CQP3Y+tRoMNkroQtLvCt2RY+Df
         UdBV9FMeXYw+PuecgHRmlgF0o55khH211LtICJGgnFrtnrC2A77d7OGMFDp1eH8RGxZP
         Wb0ghceIXA9kBNf6UAIoGe3Q50uh+JVfWcjW/36dG17JXP0dL8F93Wiy8jvxY0RId3n5
         L32g==
X-Gm-Message-State: APjAAAUPZf5IH6JEKuyKiqyHT/6YAHp3SUyZZ56uCbyRmPfsmsokfc5K
        5826sIhQynGJUFEK5CpdXmSfrQ==
X-Google-Smtp-Source: APXvYqx/6KGlYHS4T9Zfe8IxLNfGJ8OG+MYBFpk7RP/CnmSAeGWAOxlIc75L68Uthhnb4jRkuJNbng==
X-Received: by 2002:a17:90a:26ab:: with SMTP id m40mr1097883pje.42.1582263520883;
        Thu, 20 Feb 2020 21:38:40 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id y197sm1373877pfc.79.2020.02.20.21.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 21:38:40 -0800 (PST)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, Evan Benn <evanbenn@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: Add new mt8173_smc_wdt watchdog driver
Date:   Fri, 21 Feb 2020 16:38:02 +1100
Message-Id: <20200221163717.v2.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200221053802.70716-1-evanbenn@chromium.org>
References: <20200221053802.70716-1-evanbenn@chromium.org>
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

Changes in v2:
- use watchdog_stop_on_reboot
- use watchdog_stop_on_unregister
- use devm_watchdog_register_device
- remove smcwd_shutdown, smcwd_remove
- change error codes

 MAINTAINERS                       |   1 +
 arch/arm64/configs/defconfig      |   1 +
 drivers/watchdog/Kconfig          |  13 +++
 drivers/watchdog/Makefile         |   1 +
 drivers/watchdog/mt8173_smc_wdt.c | 160 ++++++++++++++++++++++++++++++
 5 files changed, 176 insertions(+)
 create mode 100644 drivers/watchdog/mt8173_smc_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 59e8779363c12..94e295e16e128 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1426,6 +1426,7 @@ M:	Julius Werner <jwerner@chromium.org>
 R:	Evan Benn <evanbenn@chromium.org>
 S:	Maintained
 F:	devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
+F:	drivers/watchdog/mt8173_smc_wdt.c
 
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b2f667307f829..11d94c9258b79 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -451,6 +451,7 @@ CONFIG_QCOM_TSENS=y
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
+CONFIG_MT8173_SMC_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
 CONFIG_DW_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=m
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index cec868f8db3f9..b4e55db7a4dcf 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -857,6 +857,19 @@ config DIGICOLOR_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called digicolor_wdt.
 
+config MT8173_SMC_WATCHDOG
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
index 2ee352bf3372d..d1381234892ef 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
 obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
 obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
 obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
+obj-$(CONFIG_MT8173_SMC_WATCHDOG) += mt8173_smc_wdt.o
 obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
diff --git a/drivers/watchdog/mt8173_smc_wdt.c b/drivers/watchdog/mt8173_smc_wdt.c
new file mode 100644
index 0000000000000..681aa42c7d277
--- /dev/null
+++ b/drivers/watchdog/mt8173_smc_wdt.c
@@ -0,0 +1,160 @@
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
+#define DRV_NAME		"mt8173_smc_wdt"
+#define DRV_VERSION		"1.0"
+
+#define SMCWD_FUNC_ID		0x82003d06
+
+enum smcwd_call {
+	SMCWD_INFO		= 0,
+	SMCWD_SET_TIMEOUT	= 1,
+	SMCWD_ENABLE		= 2,
+	SMCWD_PET		= 3,
+};
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+static unsigned int timeout;
+
+static int smcwd_call(enum smcwd_call call, unsigned long arg,
+		      struct arm_smccc_res *res)
+{
+	struct arm_smccc_res local_res;
+
+	if (!res)
+		res = &local_res;
+
+	arm_smccc_smc(SMCWD_FUNC_ID, call, arg, 0, 0, 0, 0, 0, res);
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
+	return smcwd_call(SMCWD_PET, 0, NULL);
+}
+
+static int smcwd_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	int res;
+
+	res = smcwd_call(SMCWD_SET_TIMEOUT, timeout, NULL);
+	if (!res)
+		wdd->timeout = timeout;
+	return res;
+}
+
+static int smcwd_stop(struct watchdog_device *wdd)
+{
+	return smcwd_call(SMCWD_ENABLE, 0, NULL);
+}
+
+static int smcwd_start(struct watchdog_device *wdd)
+{
+	return smcwd_call(SMCWD_ENABLE, 1, NULL);
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
+static int smcwd_probe(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd;
+	int err;
+	struct arm_smccc_res res;
+
+	err = smcwd_call(SMCWD_INFO, 0, &res);
+	if (err < 0)
+		return err;
+
+	wdd = devm_kzalloc(&pdev->dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, wdd);
+
+	wdd->info = &smcwd_info;
+	wdd->ops = &smcwd_ops;
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
+	dev_info(&pdev->dev, "Watchdog registered (timeout=%d sec, nowayout=%d)\n",
+		 wdd->timeout, nowayout);
+
+	return 0;
+}
+
+static const struct of_device_id smcwd_dt_ids[] = {
+	{ .compatible = "mt8173,smc-wdt" },
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
2.25.0.265.gbab2e86ba0-goog

