Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAAA3A49F0
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 22:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhFKULY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 16:11:24 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:45675 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhFKULY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 16:11:24 -0400
Received: by mail-wr1-f45.google.com with SMTP id z8so7251620wrp.12;
        Fri, 11 Jun 2021 13:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PmJ9Jxo4Lbmg6MA3nwKVDYJgcfhZz5j0y7pWVKNZShU=;
        b=tOizCCSuFQSrmfww36al05J3+vWQ/4DaMIJWWm/hc2v+679eV6MEX8FoNldHzEkWn3
         YSmBbwLWzYnnwHoLM6e8E8T5x8VRC6LMQ8afCTpGEwTk39eoRdUaF74ZhddJw1pDH6V5
         Cl1P7veE18uhRE/p/ilnThopDhPvwI6uj7Bc/pbIMe0sbg7nf/zbl89IOZ9HjNQO7nSY
         5LvD4V3jzeOMUkXNILC3dqb3DVAIHwR15GvmrQqZcJ14gzrNTw4qiIcbY8nvfI47kgzf
         0c3y178n5Dr1qnvgzVBpCu1Y8Cj/RLrL4k6vMmKq82QymR76eJI4+0RQOMIUqIJmd7Uu
         XiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PmJ9Jxo4Lbmg6MA3nwKVDYJgcfhZz5j0y7pWVKNZShU=;
        b=YvE0BCoWGyqBGTiyqyQWCGM0Nl9+OEF98+7JEiwz8a4QdeW3WkWW+Yi6U+Pi8vwlrx
         EAJ+LjzBOCx07KzCOrBsDvvgo8w0CXon8CReWymug52L5pzqTqBh+JW9nRYpFHYDlk65
         qfBPrhlkw5kWnkmG5UxacpKDa//8W3NFYYRmcsvPo/sK6T9kc9wuoEfNU6D/u4/jGuhr
         WXXqV9qL0NaILpwgnzUcRYp7OZHCRkmD94It1NKWMK6oTPCfg1rB7zAd6SG9u1zIiX3Z
         SaDKJwkMhg+4wOglCObDfIAMtOKebCCreXiIr6Q/u5PDQS5MKaq/Q8yStydc9Oaomgai
         sNVw==
X-Gm-Message-State: AOAM532A41J9LQa5fAStyMUDwRa49iaTWTyfgWlEerNWmRKQ+NEDLYxd
        7kQLfLHcvWWPlK9oGhzVPa5JEYi8/CI=
X-Google-Smtp-Source: ABdhPJwrMiJ9B238uwRrod6E462j6eBvIsPck7pnBMkUg6Kck2Km1FFRCcItaz8ODUc5pu+MXhZCvg==
X-Received: by 2002:a5d:4fc6:: with SMTP id h6mr5973426wrw.1.1623442092182;
        Fri, 11 Jun 2021 13:08:12 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id l5sm13101481wmi.46.2021.06.11.13.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 13:08:11 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] watchdog: Add Mstar MSC313e WDT driver
Date:   Fri, 11 Jun 2021 22:08:00 +0200
Message-Id: <20210611200801.52139-3-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611200801.52139-1-romain.perier@gmail.com>
References: <20210611200801.52139-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Daniel Palmer <daniel@0x0f.com>

It adds a driver for the IP block handling the watchdog timer found for
Mstar MSC313e SoCs and newer.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Co-developed-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Romain Perier <romain.perier@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS                    |   1 +
 drivers/watchdog/Kconfig       |  12 +++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/msc313e_wdt.c | 166 +++++++++++++++++++++++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 drivers/watchdog/msc313e_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b706dd20ff2b..50e9573494d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2175,6 +2175,7 @@ F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
 F:	drivers/clk/mstar/
 F:	drivers/gpio/gpio-msc313.c
+F:	drivers/watchdog/msc313e_wdt.c
 F:	include/dt-bindings/clock/mstar-*
 F:	include/dt-bindings/gpio/msc313-gpio.h
 
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 355100dad60a..4af84df1ce22 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -980,6 +980,18 @@ config VISCONTI_WATCHDOG
 	  Say Y here to include support for the watchdog timer in Toshiba
 	  Visconti SoCs.
 
+config MSC313E_WATCHDOG
+	tristate "MStar MSC313e watchdog"
+	depends on ARCH_MSTARV7 || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the Watchdog timer embedded
+	  into MStar MSC313e chips. This will reboot your system when the
+	  timeout is reached.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called msc313e_wdt.
+
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index a7eade8b4d45..7fa392ae3000 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
 obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
 obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
 obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
+obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
new file mode 100644
index 000000000000..0d497aa0fb7d
--- /dev/null
+++ b/drivers/watchdog/msc313e_wdt.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MStar WDT driver
+ *
+ * Copyright (C) 2019 - 2021 Daniel Palmer
+ * Copyright (C) 2021 Romain Perier
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define REG_WDT_CLR			0x0
+#define REG_WDT_MAX_PRD_L		0x10
+#define REG_WDT_MAX_PRD_H		0x14
+
+#define MSC313E_WDT_MIN_TIMEOUT		1
+#define MSC313E_WDT_DEFAULT_TIMEOUT	30
+
+static unsigned int timeout;
+
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+struct msc313e_wdt_priv {
+	void __iomem *base;
+	struct watchdog_device wdev;
+	struct clk *clk;
+};
+
+static int msc313e_wdt_start(struct watchdog_device *wdev)
+{
+	struct msc313e_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	u32 timeout;
+	int err;
+
+	err = clk_prepare_enable(priv->clk);
+	if (err)
+		return err;
+
+	timeout = wdev->timeout * clk_get_rate(priv->clk);
+	writew(timeout & 0xffff, priv->base + REG_WDT_MAX_PRD_L);
+	writew((timeout >> 16) & 0xffff, priv->base + REG_WDT_MAX_PRD_H);
+	writew(1, priv->base + REG_WDT_CLR);
+	return 0;
+}
+
+static int msc313e_wdt_ping(struct watchdog_device *wdev)
+{
+	struct msc313e_wdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	writew(1, priv->base + REG_WDT_CLR);
+	return 0;
+}
+
+static int msc313e_wdt_stop(struct watchdog_device *wdev)
+{
+	struct msc313e_wdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	writew(0, priv->base + REG_WDT_MAX_PRD_L);
+	writew(0, priv->base + REG_WDT_MAX_PRD_H);
+	writew(0, priv->base + REG_WDT_CLR);
+	clk_disable_unprepare(priv->clk);
+	return 0;
+}
+
+static int msc313e_wdt_settimeout(struct watchdog_device *wdev, unsigned int new_time)
+{
+	wdev->timeout = new_time;
+
+	return msc313e_wdt_start(wdev);
+}
+
+static const struct watchdog_info msc313e_wdt_ident = {
+	.identity = "MSC313e watchdog",
+	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+};
+
+static const struct watchdog_ops msc313e_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = msc313e_wdt_start,
+	.stop = msc313e_wdt_stop,
+	.ping = msc313e_wdt_ping,
+	.set_timeout = msc313e_wdt_settimeout,
+};
+
+static const struct of_device_id msc313e_wdt_of_match[] = {
+	{ .compatible = "mstar,msc313e-wdt", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, msc313e_wdt_of_match);
+
+static int msc313e_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct msc313e_wdt_priv *priv;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "No input clock\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	priv->wdev.info = &msc313e_wdt_ident,
+	priv->wdev.ops = &msc313e_wdt_ops,
+	priv->wdev.parent = dev;
+	priv->wdev.min_timeout = MSC313E_WDT_MIN_TIMEOUT;
+	priv->wdev.max_timeout = U32_MAX / clk_get_rate(priv->clk);
+	priv->wdev.timeout = MSC313E_WDT_DEFAULT_TIMEOUT;
+
+	watchdog_set_drvdata(&priv->wdev, priv);
+
+	watchdog_init_timeout(&priv->wdev, timeout, dev);
+	watchdog_stop_on_reboot(&priv->wdev);
+	watchdog_stop_on_unregister(&priv->wdev);
+
+	return devm_watchdog_register_device(dev, &priv->wdev);
+}
+
+static int __maybe_unused msc313e_wdt_suspend(struct device *dev)
+{
+	struct msc313e_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (watchdog_active(&priv->wdev))
+		msc313e_wdt_stop(&priv->wdev);
+
+	return 0;
+}
+
+static int __maybe_unused msc313e_wdt_resume(struct device *dev)
+{
+	struct msc313e_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (watchdog_active(&priv->wdev))
+		msc313e_wdt_start(&priv->wdev);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(msc313e_wdt_pm_ops, msc313e_wdt_suspend, msc313e_wdt_resume);
+
+static struct platform_driver msc313e_wdt_driver = {
+	.driver = {
+		.name = "msc313e-wdt",
+		.of_match_table = msc313e_wdt_of_match,
+		.pm = &msc313e_wdt_pm_ops,
+	},
+	.probe = msc313e_wdt_probe,
+};
+module_platform_driver(msc313e_wdt_driver);
+
+MODULE_AUTHOR("Daniel Palmer <daniel@thingy.jp>");
+MODULE_DESCRIPTION("Watchdog driver for MStar MSC313e");
+MODULE_LICENSE("GPL v2");
-- 
2.30.2

