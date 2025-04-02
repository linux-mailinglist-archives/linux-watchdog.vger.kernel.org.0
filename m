Return-Path: <linux-watchdog+bounces-3190-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDC1A7926E
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 17:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF1DD1895A6D
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 15:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF4C18DF80;
	Wed,  2 Apr 2025 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bS2SX+i4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF0189528
	for <linux-watchdog@vger.kernel.org>; Wed,  2 Apr 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609000; cv=none; b=A8xmj+Zuv2Ri0MYASYx4TFlpZYqo6rWyGXgA0O3aJlI/A+q8mUzk/kmngjwnG2SR46sds6888tYDiIxMU0d2pxZ1ownPV+VkniMy5P3Gtez7sWYcrovMJAC4gtT52FSKT69/0/7+eP48v4P+bjdDl2bV6UpTax+4TpO83CzHS9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609000; c=relaxed/simple;
	bh=d5wzqhF1C6/brSGYtVhBYh/qx/95Dh4C+p/dbB29ox4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCYXl6ced2sCbtlwL9W9CQs+uvrEEfeu9t0ajrUUPzVmOrC9e5BiufJ4U5fnZNWSloNxuPXsfeZVPQ8DL7BhZLx0zQAx5hQyNAjmEpDjOp76j1qDLKMDXLaTApVuwSaTZ8JRTgN5p30F8vUflrh9J76cSn/TLopcbsHpbnjzdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bS2SX+i4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso45608925e9.0
        for <linux-watchdog@vger.kernel.org>; Wed, 02 Apr 2025 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743608997; x=1744213797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVtLkb2Bbr4/7b8+mKoLKaWYpy6EsWqHyXglOpYgfE0=;
        b=bS2SX+i4FHX1F/iSWKFZU2uxIUvbCGMwEgMtNrKt1YVLEFw9HkvoOoTEj/7YD3BF0t
         rPA9AD0Rp0hMDCehNwQ8hzdEN1y+TH13iYXwS3TuXvR1SNPa5/28ybPPGHadmOdyBqeL
         Od6T9FUFh+AscD7A7Kq4oSePO/cweBD4MvGnznPhf5vrYUrgCc+cxHbXUkZpsEpp0clP
         MqWCP5wpFTn+XWtTPORsf5QeRTQUK8den2tNR9ElHwcJw1EECpbIGpbuiXKVIZtkdevX
         zli3+cBr3aDkb3HJXy2SygeS5v9i6oSv1GSijhuu/Y1ijn6Jjc/yWwpt8M9NABz1yCfS
         lDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608997; x=1744213797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVtLkb2Bbr4/7b8+mKoLKaWYpy6EsWqHyXglOpYgfE0=;
        b=RlU9P0lDfBLBBTE1K4yMJjyR8ZJXJGnLTcrMPr8ZGZmL2BsILxZ0T7AYFaFM/7wmBl
         Uwvhp5Vs32QVao27aYRXA27VLxIgk2a1UURfDkmu0HOrVinHiK+TfBx/Z1SJG4Xk4HI3
         I/FC9bem6HwZNEHJSyIiw4r2RXvRhKD+LvOYfcEID7H2c6Nq/sWQ2bU1jw2Kb9/dvysg
         w8vW3UN8KhE0L01RNc7wAPVbvcYbjv19MLl7OK0fucWTFrXlqvYkTGHM2rxfqoWE6xaI
         +io1H0ebEAMDZXb6pNCkSuuLPgaHtaRw3jKp4vmpHVwsGeuAUsGxUU9lHEiKeN0Umhqr
         bLOg==
X-Forwarded-Encrypted: i=1; AJvYcCXwyqmiPwEghFjIAn5eVFdj1ULcdC5Jf1It0VsLAsM5uJJ5zogVjoDwh8L9dyNQThGBZrGKeHUtHsPEc8q+3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkn8EIClFZ+gr0EH8AlISrrvJZC1ggc695cRsCYtoVeCQiTEaI
	Vf56b3/vs91l32k7BNw27v+vjx2zfN5e9b36gwFHued4v622DbtgARcTfuFqKwQ=
X-Gm-Gg: ASbGncsDf20bfjCPz6JMu5WRtkp+JHIvc8DOqIEn4XVvDVQkIPv0br1N/lZBjJLWa7Y
	5tBaYNdDLE+96e+dPax7HEO0CYvmJZMz+mhumPDHnBHb219pBN42VyhkqQFPWA04DN8Oc3x74yl
	rTQQGoKBAwzX1wk8oREFl863v05pRzujDcV4uKtZcLXal5MgBhWwSdkHLwUXI0s1h9BBLAhgAe0
	MNKaMtLY65SamdT1nZa14apj8o7b3Y/eOi3KSuA9n56lleX7797kwHctQKJy+fbbypLVC6YdfAP
	VrceX3o/cP5e8J2c2PLynSx2aw3n+WD+5Hjr6LFmOfsYxpoD6jNrkVrqNugeN7FJ4g+7plgEPlM
	uXR4MPg==
X-Google-Smtp-Source: AGHT+IHhI7QlLg3v5yIM1Xc3dRndQsg7I8qkqKkxG29iOdf4PooPFJp2ZRsxH5pLL43aIVk2wngecw==
X-Received: by 2002:a05:600c:468c:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43db61b52e5mr185578715e9.2.1743608996840;
        Wed, 02 Apr 2025 08:49:56 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1194sm24674555e9.11.2025.04.02.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:49:56 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	S32@nxp.com,
	ghennadi.procopciuc@nxp.com,
	thomas.fossati@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: Add the Watchdog Timer for the NXP S32 platform
Date: Wed,  2 Apr 2025 17:49:40 +0200
Message-ID: <20250402154942.3645283-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S32 platform has several Watchdog Timer available and tied with a
CPU. The SWT0 is the only one which directly asserts the reset line,
other SWT require an external setup to configure the reset behavior
which is not part of this change.

As a side note, in the NXP documentation, the s32g2 and s32g3
reference manuals refer the watchdog as the 'Software Timer Watchdog'
where the name can be misleading as it is actually a hardware
watchdog.

The maximum watchdog timeout value depends on the clock feeding the
SWT counter which is 32bits wide. On the s32g274-rb2, the clock has a
rate of 51MHz which result on 83 seconds maximum timeout.

The timeout can be specified via the device tree with the usual
existing bindings 'timeout-sec' or via the module param timeout.

The watchdog can be loaded with the 'nowayout' option, preventing the
watchdog to be stopped.

The watchdog can be started at boot time with the 'early-enable'
option, thus letting the watchdog framework to service the watchdog
counter.

The watchdog support the magic character to stop when the userspace
releases the device.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/watchdog/Kconfig    |   9 ++
 drivers/watchdog/Makefile   |   1 +
 drivers/watchdog/s32g_wdt.c | 313 ++++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
 create mode 100644 drivers/watchdog/s32g_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..4ab4275ef49f 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -792,6 +792,15 @@ config IMX7ULP_WDT
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx7ulp_wdt.
 
+config S32G_WDT
+	tristate "S32G Watchdog"
+	depends on ARCH_S32 || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  This is the driver for the hardware watchdog on the NXP
+	  S32G platforms. If you wish to have watchdog support
+	  enabled, say Y, otherwise say N.
+
 config DB500_WATCHDOG
 	tristate "ST-Ericsson DB800 watchdog"
 	depends on MFD_DB8500_PRCMU
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 8411626fa162..d0f9826e32c3 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
 obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
 obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
 obj-$(CONFIG_IMX7ULP_WDT) += imx7ulp_wdt.o
+obj-$(CONFIG_S32G_WDT) += s32g_wdt.o
 obj-$(CONFIG_DB500_WATCHDOG) += db8500_wdt.o
 obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
 obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
diff --git a/drivers/watchdog/s32g_wdt.c b/drivers/watchdog/s32g_wdt.c
new file mode 100644
index 000000000000..a585ff1b372c
--- /dev/null
+++ b/drivers/watchdog/s32g_wdt.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Watchdog driver for S32G SoC
+ *
+ * Copyright 2017-2019, 2021-2025 NXP.
+ *
+ */
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define DRIVER_NAME "s32g-swt"
+
+#define S32G_SWT_CR(__base)	((__base) + 0x00)	/* Control Register offset	*/
+#define S32G_SWT_CR_SM		(BIT(9) | BIT(10))	/* -> Service Mode		*/
+#define S32G_SWT_CR_STP		BIT(2)			/* -> Stop Mode Control		*/
+#define S32G_SWT_CR_FRZ		BIT(1)			/* -> Debug Mode Control	*/
+#define S32G_SWT_CR_WEN		BIT(0)			/* -> Watchdog Enable		*/
+
+#define S32G_SWT_TO(__base)	((__base) + 0x08)	/* Timeout Register offset	*/
+
+#define S32G_SWT_SR(__base)	((__base) + 0x10)	/* Service Register offset	*/
+#define S32G_WDT_SEQ1		0xA602			/* -> service sequence number 1	*/
+#define S32G_WDT_SEQ2		0xB480			/* -> service sequence number 2	*/
+
+#define S32G_SWT_CO(__base)	((__base) + 0x14)	/* Counter output register	*/
+
+#define S32G_WDT_DEFAULT_TIMEOUT	30
+
+struct s32g_wdt_device {
+	int rate;
+	void __iomem *base;
+	struct watchdog_device wdog;
+};
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static unsigned int timeout_param = S32G_WDT_DEFAULT_TIMEOUT;
+module_param(timeout_param, uint, 0);
+MODULE_PARM_DESC(timeout_param, "Watchdog timeout in seconds (default="
+		 __MODULE_STRING(S32G_WDT_DEFAULT_TIMEOUT) ")");
+
+static bool early_enable;
+module_param(early_enable, bool, 0);
+MODULE_PARM_DESC(early_enable,
+		 "Watchdog is started on module insertion (default=false)");
+
+static const struct watchdog_info s32g_wdt_info = {
+	.identity = "s32g watchdog",
+	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE |
+	WDIOC_GETTIMEOUT | WDIOC_GETTIMELEFT,
+};
+
+static struct s32g_wdt_device *wdd_to_s32g_wdt(struct watchdog_device *wdd)
+{
+	return container_of(wdd, struct s32g_wdt_device, wdog);
+}
+
+static unsigned int wdog_sec_to_count(struct s32g_wdt_device *wdev, unsigned int timeout)
+{
+	return wdev->rate * timeout;
+}
+
+static int s32g_wdt_ping(struct watchdog_device *wdog)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+
+	writel(S32G_WDT_SEQ1, S32G_SWT_SR(wdev->base));
+	writel(S32G_WDT_SEQ2, S32G_SWT_SR(wdev->base));
+
+	return 0;
+}
+
+static int s32g_wdt_start(struct watchdog_device *wdog)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+	unsigned long val;
+
+	val = readl(S32G_SWT_CR(wdev->base));
+
+	val |= S32G_SWT_CR_WEN;
+
+	writel(val, S32G_SWT_CR(wdev->base));
+
+	return 0;
+}
+
+static int s32g_wdt_stop(struct watchdog_device *wdog)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+	unsigned long val;
+
+	val = readl(S32G_SWT_CR(wdev->base));
+
+	val &= ~S32G_SWT_CR_WEN;
+
+	writel(val, S32G_SWT_CR(wdev->base));
+
+	return 0;
+}
+
+static int s32g_wdt_set_timeout(struct watchdog_device *wdog, unsigned int timeout)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+
+	writel(wdog_sec_to_count(wdev, timeout), S32G_SWT_TO(wdev->base));
+
+	/*
+	 * Conforming to the documentation, the timeout counter is
+	 * loaded when servicing is operated (aka ping) or when the
+	 * counter is enabled. In case the watchdog is already started
+	 * it must be stopped and started again to update the timeout
+	 * register or a ping can be sent to refresh the counter. Here
+	 * we choose to send a ping to the watchdog which is harmless
+	 * if the watchdog is stopped.
+	 */
+	return s32g_wdt_ping(wdog);
+}
+
+static unsigned int s32g_wdt_get_timeleft(struct watchdog_device *wdog)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+	unsigned long counter;
+	bool is_running;
+
+	/*
+	 * The counter output can be read only if the SWT is
+	 * disabled. Given the latency between the internal counter
+	 * and the counter output update, there can be very small
+	 * difference. However, we can accept this matter of fact
+	 * given the resolution is a second based unit for the output.
+	 */
+	is_running = watchdog_hw_running(wdog);
+
+	if (is_running)
+		s32g_wdt_stop(wdog);
+
+	counter = readl(S32G_SWT_CO(wdev->base));
+
+	if (is_running)
+		s32g_wdt_start(wdog);
+
+	return counter / wdev->rate;
+}
+
+static const struct watchdog_ops s32g_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= s32g_wdt_start,
+	.stop		= s32g_wdt_stop,
+	.ping		= s32g_wdt_ping,
+	.set_timeout	= s32g_wdt_set_timeout,
+	.get_timeleft	= s32g_wdt_get_timeleft,
+};
+
+static void s32g_wdt_init(struct s32g_wdt_device *wdev)
+{
+	unsigned long val;
+
+	/* Set the watchdog's Time-Out value */
+	val = wdog_sec_to_count(wdev, wdev->wdog.timeout);
+
+	writel(val, S32G_SWT_TO(wdev->base));
+
+	/*
+	 * Get the control register content. We are at init time, the
+	 * watchdog should not be started.
+	 */
+	val = readl(S32G_SWT_CR(wdev->base));
+
+	/*
+	 * We want to allow the watchdog timer to be stopped when
+	 * device enters debug mode.
+	 */
+	val |= S32G_SWT_CR_FRZ;
+
+	/*
+	 * However, when the CPU is in WFI or suspend mode, the
+	 * watchdog must continue. The documentation refers it as the
+	 * stopped mode.
+	 */
+	val &= ~S32G_SWT_CR_STP;
+
+	/*
+	 * Use Fixed Service Sequence to ping the watchdog which is
+	 * 0x00 configuration value for the service mode. It should be
+	 * already set because it is the default value but we reset it
+	 * in case.
+	 */
+	val &= ~S32G_SWT_CR_SM;
+
+	writel(val, S32G_SWT_CR(wdev->base));
+
+	/*
+	 * When the 'early_enable' option is set, we start the
+	 * watchdog from the kernel.
+	 */
+	if (early_enable) {
+		s32g_wdt_start(&wdev->wdog);
+		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
+	}
+}
+
+static int s32g_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct clk *clk;
+	struct s32g_wdt_device *wdev;
+	struct watchdog_device *wdog;
+	int ret;
+
+	wdev = devm_kzalloc(dev, sizeof(*wdev), GFP_KERNEL);
+	if (!wdev)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	wdev->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(wdev->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(wdev->base), "Can not get resource\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Can't get Watchdog clock\n");
+
+	wdev->rate = clk_get_rate(clk);
+	if (!wdev->rate) {
+		dev_err(dev, "Input clock rate is not valid\n");
+		return -EINVAL;
+	}
+
+	wdog = &wdev->wdog;
+	wdog->info = &s32g_wdt_info;
+	wdog->ops = &s32g_wdt_ops;
+
+	/*
+	 * The code converts the timeout into a counter a value, if
+	 * the value is less than 0x100, then it is clamped by the SWT
+	 * module, so it is safe to specify a zero value as the
+	 * minimum timeout.
+	 */
+	wdog->min_timeout = 0;
+
+	/*
+	 * The counter register is a 32 bits long, so the maximum
+	 * counter value is UINT_MAX and the timeout in second is the
+	 * value divided by the rate.
+	 *
+	 * For instance, a rate of 51MHz lead to 84 seconds maximum
+	 * timeout.
+	 */
+	wdog->max_timeout = UINT_MAX / wdev->rate;
+
+	/*
+	 * The module param and the DT 'timeout-sec' property will
+	 * override the default value if they are specified.
+	 */
+	ret = watchdog_init_timeout(wdog, timeout_param, dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * As soon as the watchdog is started, there is no way to stop
+	 * it if the 'nowayout' option is set at boot time
+	 */
+	watchdog_set_nowayout(wdog, nowayout);
+
+	/*
+	 * The devm_ version of the watchdog_register_device()
+	 * function will call watchdog_unregister_device() when the
+	 * device is removed.
+	 */
+	watchdog_stop_on_unregister(wdog);
+
+	s32g_wdt_init(wdev);
+
+	ret = devm_watchdog_register_device(dev, wdog);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register watchdog device\n");
+
+	dev_info(dev, "S32G Watchdog Timer Registered, timeout=%ds, nowayout=%d, early_enable=%d\n",
+		 wdog->timeout, nowayout, early_enable);
+
+	return 0;
+}
+
+static const struct of_device_id s32g_wdt_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-swt" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s32g_wdt_dt_ids);
+
+static struct platform_driver s32g_wdt_driver = {
+	.probe = s32g_wdt_probe,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = s32g_wdt_dt_ids,
+	},
+};
+
+module_platform_driver(s32g_wdt_driver);
+
+MODULE_AUTHOR("Daniel Lezcano <daniel.lezcano@linaro.org>");
+MODULE_DESCRIPTION("Watchdog driver for S32G SoC");
+MODULE_LICENSE("GPL");
-- 
2.43.0


