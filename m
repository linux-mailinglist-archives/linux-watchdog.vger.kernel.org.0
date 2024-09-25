Return-Path: <linux-watchdog+bounces-2049-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F603985627
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 11:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C00E21C22DE7
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 09:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB32315C123;
	Wed, 25 Sep 2024 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niZQvyuw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C26D15A858;
	Wed, 25 Sep 2024 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255641; cv=none; b=bZ3Fsqk+yBPjJ0bHp07ZKgaGWBR1ic71nScowtrfXRgzy7njVLrUgM2wxAbvikxKzSoWf7vfoPHRGFpoQt29sNUJryWmRKMUwY38hjuBrtyo/ST6I62djVOVftTYjJDrnL0Vzxp1VMP85F9euPkTwXi0/gfV2XgqnriT7h/tMkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255641; c=relaxed/simple;
	bh=ncQGDjVqIcmqLB13jlbaC2EccM0p0Skycwurb7HuorM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwF8vui+WlWJYFWq6eavIDswUPqH104ErOOxccpJ8nUNl3mAP0He6It47v9pg9d/uEIzLwr/49I/X+EchbNehUX6LycC/+DU0a34OZpPj5J89R+YX37Dmu8G/7kB1G2W+V61gnyE0P3XFvhigqEOGRRL/8P5cAACVGhp8erjH9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niZQvyuw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso82734555e9.2;
        Wed, 25 Sep 2024 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727255638; x=1727860438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FAu/jToo6vv9tVssK1OXqICVkrR1vSVMbEXikZEdW4=;
        b=niZQvyuwXrnqcRs7HV8/FAz/bfrgxccF6TmH4jziRH2K7d/nS1ZUWTQCm0HHrIrQGH
         ChhDnvu+cRhMt3PwuIW0XMA8AkECg0koxt20jugUwu2kEdwtAKWHs4x5kr13nfv87gTM
         8DGyWTS2FcBI82+UfAt6v0FjImPrUUoE8hZfA+yEF69ybww/MFgCsf7nR7BwMCBnwUBT
         TP0MWjRXHt2/EjXppurIJ/s22eYTygVmGAVRJamTyGfCyzpYkXHvNkCI6+CN8QBURTLj
         afMLGOlieIstANp3vWxcrAxvtoGMM9AIZBwKsOavnLyDWQB7x79CMt258n9891SKDaC3
         ygtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727255638; x=1727860438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FAu/jToo6vv9tVssK1OXqICVkrR1vSVMbEXikZEdW4=;
        b=v1QSSytdSLquaPZBqpWHMv3+mauQ/YlQ3vLjkpXPklSmhMLDY1nrV5cNGpLM9kPXci
         3B73rQEveL/1AqWmX1auUPV3XZrIn+jk2j7+3ykhgGJDNXnWcDn1bB87BoyqMs4ZzqZz
         tcyLq1sN5n62Wb8c/0CNlJPK3rMgtFba6g6rRNDDkypgOpzPxMYEvrWy3H4PGGk+sS+0
         7/w4H7bykyBHjTyUc4qjvYrBOnuECroixh3Hiq6uyMJ83Xh8SqfocjbFhR+eS/bEVTc9
         PU4NRmckdYmtHUItERArs0QN5WzZzINuHCaj0puuLua6IdzOHnGnz0asOSzdfMY5eYaX
         VQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUwmF/ebtTDiEsTjFnUmDWwmAbcYyjtPDUv+lqVpj5T+2ZPwDBiYjcppRSHOy5DU9ZSY9qRPs/gNoDUfZJQ@vger.kernel.org, AJvYcCWPHu9DcUGl0RpwauGpP+kvMF/idNIfoZsp1pFi3n3eQJDCbo8hfGLVx7tqU6j8exuy1I0j2mTMQGlR@vger.kernel.org, AJvYcCWpu3pnb4Kk2D0C+a+7Faw90VEO2ZOq1xMKBAW9K/2fIUSmoP/ug6c+7j1SXHGQFGhwbf4CgqP0A7lGARqImu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8rg5IDjpwu8erz1i1RyEuGihWsoB/4bdgDF+83NdAmmUHtmXc
	S/+302oFs8O5/tEcvT1qoPYO1KdcgJMGG4vuIuuaHNJEXfw7JURw
X-Google-Smtp-Source: AGHT+IG+sa+aNF+e5tdi4vrxiKj7dJ1NgIdoA7e4HcPtFFu9dVz99A2qyrm0Cxp/nYxMvwobWz8T6A==
X-Received: by 2002:a05:600c:4b97:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-42e96ab6d1fmr14188585e9.29.1727255637487;
        Wed, 25 Sep 2024 02:13:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a16aa3sm12045605e9.39.2024.09.25.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:13:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	upstream@airoha.com
Subject: [PATCH v2 2/2] watchdog: Add support for Airoha EN7851 watchdog
Date: Wed, 25 Sep 2024 11:13:10 +0200
Message-ID: <20240925091326.2900-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925091326.2900-1-ansuelsmth@gmail.com>
References: <20240925091326.2900-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha EN7851 watchdog. This is a very basic watchdog
with no pretimeout support, max timeout is 28 seconds and it ticks based
on half the SoC BUS clock.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Drop clock-frequency implementation
- Add missing bitfield.h header
- Attach BUS clock

 drivers/watchdog/Kconfig      |   8 ++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/airoha_wdt.c | 216 ++++++++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/watchdog/airoha_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 85eea38dbdf4..be4616d18b29 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -394,6 +394,14 @@ config SL28CPLD_WATCHDOG
 
 # ARM Architecture
 
+config AIROHA_WATCHDOG
+	tristate "Airoha EN7581 Watchdog"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Watchdog timer embedded into Airoha SoC. This will reboot your
+	  system when the timeout is reached.
+
 config ARM_SP805_WATCHDOG
 	tristate "ARM SP805 Watchdog"
 	depends on (ARM || ARM64 || COMPILE_TEST) && ARM_AMBA
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 2d1117564f5b..32a0f689a9be 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
 obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
 obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
 obj-$(CONFIG_ARMADA_37XX_WATCHDOG) += armada_37xx_wdt.o
+obj-$(CONFIG_AIROHA_WATCHDOG) += airoha_wdt.o
 obj-$(CONFIG_ASM9260_WATCHDOG) += asm9260_wdt.o
 obj-$(CONFIG_AT91RM9200_WATCHDOG) += at91rm9200_wdt.o
 obj-$(CONFIG_AT91SAM9X_WATCHDOG) += at91sam9_wdt.o
diff --git a/drivers/watchdog/airoha_wdt.c b/drivers/watchdog/airoha_wdt.c
new file mode 100644
index 000000000000..dc8ca11c14d8
--- /dev/null
+++ b/drivers/watchdog/airoha_wdt.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *	Airoha Watchdog Driver
+ *
+ *	Copyright (c) 2024, AIROHA  All rights reserved.
+ *
+ *	Mayur Kumar <mayur.kumar@airoha.com>
+ *	Christian Marangi <ansuelsmth@gmail.com>
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/types.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/math.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+/* Base address of timer and watchdog registers */
+#define TIMER_CTRL			0x0
+#define   WDT_ENABLE			BIT(25)
+#define   WDT_TIMER_INTERRUPT		BIT(21)
+/* Timer3 is used as Watchdog Timer */
+#define   WDT_TIMER_ENABLE		BIT(5)
+#define WDT_TIMER_LOAD_VALUE		0x2c
+#define WDT_TIMER_CUR_VALUE		0x30
+#define  WDT_TIMER_VAL			GENMASK(31, 0)
+#define WDT_RELOAD			0x38
+#define   WDT_RLD			BIT(0)
+
+/* Airoha watchdog structure description */
+struct airoha_wdt_desc {
+	struct watchdog_device wdog_dev;
+	unsigned int wdt_freq;
+	void __iomem *base;
+};
+
+#define WDT_HEARTBEAT			24
+static int heartbeat = WDT_HEARTBEAT;
+module_param(heartbeat, int, 0);
+MODULE_PARM_DESC(heartbeat, "Watchdog heartbeats in seconds. (default="
+		 __MODULE_STRING(WDT_HEARTBEAT) ")");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static int airoha_wdt_start(struct watchdog_device *wdog_dev)
+{
+	struct airoha_wdt_desc *airoha_wdt = watchdog_get_drvdata(wdog_dev);
+	u32 val;
+
+	val = readl(airoha_wdt->base + TIMER_CTRL);
+	val |= (WDT_TIMER_ENABLE | WDT_ENABLE | WDT_TIMER_INTERRUPT);
+	writel(val, airoha_wdt->base + TIMER_CTRL);
+	val = wdog_dev->timeout * airoha_wdt->wdt_freq;
+	writel(val, airoha_wdt->base + WDT_TIMER_LOAD_VALUE);
+
+	return 0;
+}
+
+static int airoha_wdt_stop(struct watchdog_device *wdog_dev)
+{
+	struct airoha_wdt_desc *airoha_wdt = watchdog_get_drvdata(wdog_dev);
+	u32 val;
+
+	val = readl(airoha_wdt->base + TIMER_CTRL);
+	val &= (~WDT_ENABLE & ~WDT_TIMER_ENABLE);
+	writel(val, airoha_wdt->base + TIMER_CTRL);
+
+	return 0;
+}
+
+static int airoha_wdt_ping(struct watchdog_device *wdog_dev)
+{
+	struct airoha_wdt_desc *airoha_wdt = watchdog_get_drvdata(wdog_dev);
+	u32 val;
+
+	val = readl(airoha_wdt->base + WDT_RELOAD);
+	val |= WDT_RLD;
+	writel(val, airoha_wdt->base + WDT_RELOAD);
+
+	return 0;
+}
+
+static int airoha_wdt_set_timeout(struct watchdog_device *wdog_dev, unsigned int timeout)
+{
+	wdog_dev->timeout = timeout;
+
+	if (watchdog_active(wdog_dev)) {
+		airoha_wdt_stop(wdog_dev);
+		return airoha_wdt_start(wdog_dev);
+	}
+
+	return 0;
+}
+
+static unsigned int airoha_wdt_get_timeleft(struct watchdog_device *wdog_dev)
+{
+	struct airoha_wdt_desc *airoha_wdt = watchdog_get_drvdata(wdog_dev);
+	u32 val;
+
+	val = readl(airoha_wdt->base + WDT_TIMER_CUR_VALUE);
+	return DIV_ROUND_UP(val, airoha_wdt->wdt_freq);
+}
+
+static const struct watchdog_info airoha_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.identity = "Airoha Watchdog",
+};
+
+static const struct watchdog_ops airoha_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = airoha_wdt_start,
+	.stop = airoha_wdt_stop,
+	.ping = airoha_wdt_ping,
+	.set_timeout = airoha_wdt_set_timeout,
+	.get_timeleft = airoha_wdt_get_timeleft,
+};
+
+static int airoha_wdt_probe(struct platform_device *pdev)
+{
+	struct airoha_wdt_desc *airoha_wdt;
+	struct watchdog_device *wdog_dev;
+	struct device *dev = &pdev->dev;
+	struct clk *bus_clk;
+	int ret;
+
+	airoha_wdt = devm_kzalloc(dev, sizeof(*airoha_wdt), GFP_KERNEL);
+	if (!airoha_wdt)
+		return -ENOMEM;
+
+	airoha_wdt->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(airoha_wdt->base))
+		return PTR_ERR(airoha_wdt->base);
+
+	bus_clk = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(bus_clk))
+		return dev_err_probe(dev, PTR_ERR(bus_clk),
+				     "failed to enable bus clock\n");
+
+	/* Watchdog ticks at half the bus rate */
+	airoha_wdt->wdt_freq = clk_get_rate(bus_clk) / 2;
+
+	/* Initialize struct watchdog device */
+	wdog_dev = &airoha_wdt->wdog_dev;
+	wdog_dev->timeout = heartbeat;
+	wdog_dev->info = &airoha_wdt_info;
+	wdog_dev->ops = &airoha_wdt_ops;
+	/* Bus 300MHz, watchdog 150MHz, 28 seconds */
+	wdog_dev->max_timeout = FIELD_MAX(WDT_TIMER_VAL) / airoha_wdt->wdt_freq;
+	wdog_dev->parent = dev;
+
+	watchdog_set_drvdata(wdog_dev, airoha_wdt);
+	watchdog_set_nowayout(wdog_dev, nowayout);
+	watchdog_stop_on_unregister(wdog_dev);
+
+	ret = devm_watchdog_register_device(dev, wdog_dev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, airoha_wdt);
+	return 0;
+}
+
+static int airoha_wdt_suspend(struct device *dev)
+{
+	struct airoha_wdt_desc *airoha_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&airoha_wdt->wdog_dev))
+		airoha_wdt_stop(&airoha_wdt->wdog_dev);
+
+	return 0;
+}
+
+static int airoha_wdt_resume(struct device *dev)
+{
+	struct airoha_wdt_desc *airoha_wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&airoha_wdt->wdog_dev)) {
+		airoha_wdt_start(&airoha_wdt->wdog_dev);
+		airoha_wdt_ping(&airoha_wdt->wdog_dev);
+	}
+	return 0;
+}
+
+static const struct of_device_id airoha_wdt_of_match[] = {
+	{ .compatible = "airoha,en7581-wdt", },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, airoha_wdt_of_match);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(airoha_wdt_pm_ops, airoha_wdt_suspend, airoha_wdt_resume);
+
+static struct platform_driver airoha_wdt_driver = {
+	.probe = airoha_wdt_probe,
+	.driver = {
+		.name = "airoha-wdt",
+		.pm = pm_sleep_ptr(&airoha_wdt_pm_ops),
+		.of_match_table = airoha_wdt_of_match,
+	},
+};
+
+module_platform_driver(airoha_wdt_driver);
+
+MODULE_AUTHOR("Mayur Kumar <mayur.kumar@airoha.com>");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Airoha EN7581 Watchdog Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


