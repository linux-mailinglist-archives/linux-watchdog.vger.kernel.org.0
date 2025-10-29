Return-Path: <linux-watchdog+bounces-4446-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC433C18039
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 03:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7143D3BFE04
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 02:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052572E8881;
	Wed, 29 Oct 2025 02:09:13 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE482E8DE5;
	Wed, 29 Oct 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703752; cv=none; b=rZdVA830I9JNZ8oCmfiZ8e4TXh36JG9OkF0H7ZfgKqvp1xR88GTUnSRqSgJtEVPf6ncYQy8Gyz2oI5UPjKa4TZbUjiHTnjWTVRjKRsguJtmP2PL2THv1dF6xMNMaOjnE2zRp2IlA86krad7ZCy5W9cd4JQ8bDYc3lY8wey34Ols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703752; c=relaxed/simple;
	bh=yBMtFBUZvizMQlJxRXXcRumSA9FMgXICf73Q7zwjW+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yw9F0p6UlIUsrwdKFgb+xUUUfNyp77wr327RfpAEPASrJRGb9SVBoAGrTufc7u1QsE47iZFZ9xlvgeLi8oxrZwZhnxC019hslrY5olQu5M7jvmSER2B37bsc1SAR6NbKO2d/+qM9iYHZT9i0WV6i5p3nl3oSyTlUG52V1QxxZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8Dxfb9BdwFpUNobAA--.58479S3;
	Wed, 29 Oct 2025 10:09:05 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJDxqcA5dwFpbrAXAQ--.64967S3;
	Wed, 29 Oct 2025 10:09:04 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/6] watchdog: loongson1: Rename the prefix from ls1x to loongson
Date: Wed, 29 Oct 2025 10:08:45 +0800
Message-ID: <20251029020847.1946295-2-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
References: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxqcA5dwFpbrAXAQ--.64967S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGkAWywU5wAAsv
X-Coremail-Antispam: 1Uk129KBj93XoW3AF13Kr43tF4UZw4fAFyUXFc_yoW3KrWfpF
	WUAwn5GrW5tr4j9rZIq3yDCFnaka4fX343JF4xKw1fuF98Kr15Xa4rKF9xt39rAFZ7Jr13
	XF1rKryfGa15KrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4eMKDUUUU

In order to introduce the watchdog driver of the Loongson-2K0300 SoC,
which is similar to Loongson-1.

As preparation, rename all prefixes from ls1x-specific to
Loongson-generic.

No functional change intended.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/Kconfig                      |  6 +-
 drivers/watchdog/Makefile                     |  2 +-
 .../{loongson1_wdt.c => loongson_wdt.c}       | 86 +++++++++----------
 3 files changed, 46 insertions(+), 48 deletions(-)
 rename drivers/watchdog/{loongson1_wdt.c => loongson_wdt.c} (50%)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0c25b2ed44eb..74edeb13e95b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1963,12 +1963,12 @@ config LANTIQ_WDT
 	help
 	  Hardware driver for the Lantiq SoC Watchdog Timer.
 
-config LOONGSON1_WDT
-	tristate "Loongson1 SoC hardware watchdog"
+config LOONGSON_WDT
+	tristate "Loongson SoC hardware watchdog"
 	depends on MACH_LOONGSON32 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
-	  Hardware driver for the Loongson1 SoC Watchdog Timer.
+	  Hardware driver for the Loongson SoC Watchdog Timer.
 
 config RALINK_WDT
 	tristate "Ralink SoC watchdog"
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index bbd4d62d2cc3..70be11bf7bbf 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -178,7 +178,7 @@ obj-$(CONFIG_TXX9_WDT) += txx9wdt.o
 obj-$(CONFIG_OCTEON_WDT) += octeon-wdt.o
 octeon-wdt-y := octeon-wdt-main.o octeon-wdt-nmi.o
 obj-$(CONFIG_LANTIQ_WDT) += lantiq_wdt.o
-obj-$(CONFIG_LOONGSON1_WDT) += loongson1_wdt.o
+obj-$(CONFIG_LOONGSON_WDT) += loongson_wdt.o
 obj-$(CONFIG_RALINK_WDT) += rt2880_wdt.o
 obj-$(CONFIG_IMGPDC_WDT) += imgpdc_wdt.o
 obj-$(CONFIG_MT7621_WDT) += mt7621_wdt.o
diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson_wdt.c
similarity index 50%
rename from drivers/watchdog/loongson1_wdt.c
rename to drivers/watchdog/loongson_wdt.c
index 0587ff44d3a1..19f6a19fc811 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson_wdt.c
@@ -10,7 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
-/* Loongson 1 Watchdog Register Definitions */
+/* Loongson Watchdog Register Definitions */
 #define WDT_EN			0x0
 #define WDT_TIMER		0x4
 #define WDT_SET			0x8
@@ -23,26 +23,25 @@ module_param(nowayout, bool, 0444);
 static unsigned int heartbeat;
 module_param(heartbeat, uint, 0444);
 
-struct ls1x_wdt_drvdata {
+struct loongson_wdt_drvdata {
 	void __iomem *base;
 	struct clk *clk;
 	unsigned long clk_rate;
 	struct watchdog_device wdt;
 };
 
-static int ls1x_wdt_ping(struct watchdog_device *wdt_dev)
+static int loongson_wdt_ping(struct watchdog_device *wdt_dev)
 {
-	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
 	writel(0x1, drvdata->base + WDT_SET);
 
 	return 0;
 }
 
-static int ls1x_wdt_set_timeout(struct watchdog_device *wdt_dev,
-				unsigned int timeout)
+static int loongson_wdt_set_timeout(struct watchdog_device *wdt_dev, unsigned int timeout)
 {
-	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 	unsigned int max_hw_heartbeat = wdt_dev->max_hw_heartbeat_ms / 1000;
 	unsigned int counts;
 
@@ -54,28 +53,27 @@ static int ls1x_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
-static int ls1x_wdt_start(struct watchdog_device *wdt_dev)
+static int loongson_wdt_start(struct watchdog_device *wdt_dev)
 {
-	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
 	writel(0x1, drvdata->base + WDT_EN);
 
 	return 0;
 }
 
-static int ls1x_wdt_stop(struct watchdog_device *wdt_dev)
+static int loongson_wdt_stop(struct watchdog_device *wdt_dev)
 {
-	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
 	writel(0x0, drvdata->base + WDT_EN);
 
 	return 0;
 }
 
-static int ls1x_wdt_restart(struct watchdog_device *wdt_dev,
-			    unsigned long action, void *data)
+static int loongson_wdt_restart(struct watchdog_device *wdt_dev, unsigned long action, void *data)
 {
-	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
 	writel(0x1, drvdata->base + WDT_EN);
 	writel(0x1, drvdata->base + WDT_TIMER);
@@ -84,25 +82,25 @@ static int ls1x_wdt_restart(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
-static const struct watchdog_info ls1x_wdt_info = {
+static const struct watchdog_info loongson_wdt_info = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
-	.identity = "Loongson1 Watchdog",
+	.identity = "Loongson Watchdog",
 };
 
-static const struct watchdog_ops ls1x_wdt_ops = {
+static const struct watchdog_ops loongson_wdt_ops = {
 	.owner = THIS_MODULE,
-	.start = ls1x_wdt_start,
-	.stop = ls1x_wdt_stop,
-	.ping = ls1x_wdt_ping,
-	.set_timeout = ls1x_wdt_set_timeout,
-	.restart = ls1x_wdt_restart,
+	.start = loongson_wdt_start,
+	.stop = loongson_wdt_stop,
+	.ping = loongson_wdt_ping,
+	.set_timeout = loongson_wdt_set_timeout,
+	.restart = loongson_wdt_restart,
 };
 
-static int ls1x_wdt_probe(struct platform_device *pdev)
+static int loongson_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct ls1x_wdt_drvdata *drvdata;
-	struct watchdog_device *ls1x_wdt;
+	struct loongson_wdt_drvdata *drvdata;
+	struct watchdog_device *loongson_wdt;
 	unsigned long clk_rate;
 	int err;
 
@@ -123,17 +121,17 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	drvdata->clk_rate = clk_rate;
 
-	ls1x_wdt = &drvdata->wdt;
-	ls1x_wdt->info = &ls1x_wdt_info;
-	ls1x_wdt->ops = &ls1x_wdt_ops;
-	ls1x_wdt->timeout = DEFAULT_HEARTBEAT;
-	ls1x_wdt->min_timeout = 1;
-	ls1x_wdt->max_hw_heartbeat_ms = U32_MAX / clk_rate * 1000;
-	ls1x_wdt->parent = dev;
+	loongson_wdt = &drvdata->wdt;
+	loongson_wdt->info = &loongson_wdt_info;
+	loongson_wdt->ops = &loongson_wdt_ops;
+	loongson_wdt->timeout = DEFAULT_HEARTBEAT;
+	loongson_wdt->min_timeout = 1;
+	loongson_wdt->max_hw_heartbeat_ms = U32_MAX / clk_rate * 1000;
+	loongson_wdt->parent = dev;
 
-	watchdog_init_timeout(ls1x_wdt, heartbeat, dev);
-	watchdog_set_nowayout(ls1x_wdt, nowayout);
-	watchdog_set_drvdata(ls1x_wdt, drvdata);
+	watchdog_init_timeout(loongson_wdt, heartbeat, dev);
+	watchdog_set_nowayout(loongson_wdt, nowayout);
+	watchdog_set_drvdata(loongson_wdt, drvdata);
 
 	err = devm_watchdog_register_device(dev, &drvdata->wdt);
 	if (err)
@@ -141,30 +139,30 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, drvdata);
 
-	dev_info(dev, "Loongson1 Watchdog driver registered\n");
+	dev_info(dev, "Loongson Watchdog driver registered\n");
 
 	return 0;
 }
 
 #ifdef CONFIG_OF
-static const struct of_device_id ls1x_wdt_dt_ids[] = {
+static const struct of_device_id loongson_wdt_dt_ids[] = {
 	{ .compatible = "loongson,ls1b-wdt", },
 	{ .compatible = "loongson,ls1c-wdt", },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
+MODULE_DEVICE_TABLE(of, loongson_wdt_dt_ids);
 #endif
 
-static struct platform_driver ls1x_wdt_driver = {
-	.probe = ls1x_wdt_probe,
+static struct platform_driver loongson_wdt_driver = {
+	.probe = loongson_wdt_probe,
 	.driver = {
-		.name = "ls1x-wdt",
-		.of_match_table = of_match_ptr(ls1x_wdt_dt_ids),
+		.name = "loongson-wdt",
+		.of_match_table = of_match_ptr(loongson_wdt_dt_ids),
 	},
 };
 
-module_platform_driver(ls1x_wdt_driver);
+module_platform_driver(loongson_wdt_driver);
 
 MODULE_AUTHOR("Yang Ling <gnaygnil@gmail.com>");
-MODULE_DESCRIPTION("Loongson1 Watchdog Driver");
+MODULE_DESCRIPTION("Loongson Watchdog Driver");
 MODULE_LICENSE("GPL");
-- 
2.47.3


