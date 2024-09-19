Return-Path: <linux-watchdog+bounces-1966-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8397C92C
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 14:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A79728343A
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 12:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C79619DF9F;
	Thu, 19 Sep 2024 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPXfzG2p"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964DB19B3C5;
	Thu, 19 Sep 2024 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726748928; cv=none; b=nVVZmTEJMJVa08Nk6U75hflIjMGc2irCMHwQbKL28TVQylKQQg3yMkCphWjHbuH4kozmIx9vcqwoF9tAst8X/0QlKeZ9fWDjuvKmts7XbIyvxLwIQyv1mLmcE+vmhIX5tVCQz4ilLIYQP1GsHYEeSozNyg1qLWyXw2T8qttf0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726748928; c=relaxed/simple;
	bh=mwljqCgcRmSy3M6FsoDSXPczCloXkYijL+Rk8OlQFZo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOGBFBLngs8V/AYt//zrUfqQdGWV4KbIZ46qoi/jn02nSYtis2YC5S8YkAjEaD2ey8dBE4JIIID6K4liIyOcmVZ3N8/PZBPcpNUz4tBhewn1+c6ZIDMTfUDgK7l/qudXwTB+voM2pr0+8mIsi8r+HkvG/v2LxAoUjcwhSUPhKXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPXfzG2p; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so7045055e9.1;
        Thu, 19 Sep 2024 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726748925; x=1727353725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZqHWHKD8G90msmHfdERi2k3H3OBi9Wvldi9rwajcD0=;
        b=KPXfzG2pySCVYcK89+dD+xa4BTkpCR33v+9nEqBYGuJzYRbGKhI4++Tt886Ac82uKK
         7jcV6qbV9CfCinoH5pFusQOSfG693khAXMQkQQwzKU2r0aa7vGuliX/eJDkLCHw4Tm2d
         5ILmPydJpblRL+QkO4C4AfEW/mfR3+BJnlmEPSwAcz0R61TnEbvTtAjV75em1pkBuS1l
         69N7p+fBzNhjV/AcLiTTOjoc836dH1cWs7mNMJoVCTYowBje8INC3GXjA0b1XoZvBYfw
         i4fz/WnwzMzK30/jFR3zIBWd/8F+vjuzQ8YfWc4rf+0EoTG65yoXqT5H5HXwCx4/r1m5
         lCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726748925; x=1727353725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZqHWHKD8G90msmHfdERi2k3H3OBi9Wvldi9rwajcD0=;
        b=WbiFa1bgmySdsHn3jfm53aeRyH26lr9ud0dRi6czlpRUJQkYsEDGbgnJ08kY3LVJpR
         4JEk8B539Iz5cIFC1zMn8yuvHVdQeyh5gwMIGrA5IgvRvEb6oyU2vexvm4uA3Xu9TaTV
         Af9AxhacjAZglc/JD2+1PKBE+SRQkasysaDWsdrUi/jhFvLo9L54khC648omKTntzCWz
         Dh8ZW3E/1K7xuQsKTwO8MmpqVWSmBAA0vciNd6JkAcupHHSacj+z6/cZb1/BJ04BUPAF
         ovp8wCzWckLpuzJuvfPjn1zn/C9pgrWrWiiQZMJ4of26Bva+l+dPmnEwHDumtnGcvibR
         rStQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtBfm1W7fladQ9guTW3hwu4ywvEQlLmd1x8g78X+TGjaJERAX+1XJjPn/Pz1DAo50Ky06K7qXvcqDO@vger.kernel.org, AJvYcCX3b7R+s1lYsV6l6C7o8L+x2PBsgs5aNZ5iASF0ga2vT2l81RiMCm2daYYn3W+baxs0lnbswDO2SkzClm2x@vger.kernel.org, AJvYcCXQOj3CC1/FA4X9rHxoUAIqf9Zr45hz9BNYtfZsq0JypjkI2ama6b369wKwn2SIKxlSkqvWJ9R1b7nanovbZwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdnFxZFeI40bVIRtEBi3bN4Iuvvgj8Q5tQBN68k4f3qgP62kp+
	viZ/VRit8+fOEwNpWIJj9qv9sCdE9LUC36STtVMpTyeV5e4J6dvz
X-Google-Smtp-Source: AGHT+IFJwIc4Nxom3IhTXGEmqaxOGv5kDtNBRunlLTJlfp3TwDEqrB+MzbNB8Rt+ewiWPkz/yftdoQ==
X-Received: by 2002:a05:600c:19c8:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-42cdb579f3cmr200240945e9.30.1726748924586;
        Thu, 19 Sep 2024 05:28:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e754ce37bsm20509115e9.48.2024.09.19.05.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 05:28:43 -0700 (PDT)
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
Subject: [PATCH 2/2] watchdog: Add support for Airoha EN7851 watchdog
Date: Thu, 19 Sep 2024 14:26:18 +0200
Message-ID: <20240919122759.10456-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919122759.10456-1-ansuelsmth@gmail.com>
References: <20240919122759.10456-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha EN7851 watchdog. This is a very basic watchdog
with no pretimeout support, max timeout is 28 seconds and it ticks based
on half the SoC bus clock.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/watchdog/Kconfig      |   8 ++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/airoha_wdt.c | 214 ++++++++++++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
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
index 000000000000..3bbcd7c1f2c4
--- /dev/null
+++ b/drivers/watchdog/airoha_wdt.c
@@ -0,0 +1,214 @@
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
+	struct device *dev = &pdev->dev;
+	struct watchdog_device *wdog_dev;
+	struct airoha_wdt_desc *airoha_wdt;
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
+	ret = device_property_read_u32(dev, "clock-frequency",
+				       &airoha_wdt->wdt_freq);
+	if (ret)
+		return -EINVAL;
+
+	/* Watchdog ticks at half the bus rate */
+	airoha_wdt->wdt_freq /= 2;
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
+MODULE_DESCRIPTION("Airoha Watchdog Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


