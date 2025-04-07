Return-Path: <linux-watchdog+bounces-3219-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9243A7E5D2
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 18:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE8AD176EA5
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 16:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604F120A5E0;
	Mon,  7 Apr 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4HUXeq5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2839C206F03
	for <linux-watchdog@vger.kernel.org>; Mon,  7 Apr 2025 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041825; cv=none; b=uYkhFwgq1g6I+gaIjrhnH/8+Nrk27hMAFUmRzdsQngVUhMgZs2usfA+dNW/RYyGgW1d3Y5RPWBdDiyOpSVMmnK72mLRWwMvlk5TURf9wjnotl8Hkc+XzF0qxxCze1mlZj3/0Oy48+bU6JmUwcrs51QG9n7CsuIBxCWWXrcDOOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041825; c=relaxed/simple;
	bh=W0gT9T+Y/rLewOC8430cdKW7jrE6Czo6lGNGw7FIZdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh4PLPEL9T90CTTfuhsai+k0nf14MZt1eIFcVgmoC4CPdHLC5qUZzwfETKG4ZQcmxYdbhycJifxRMbniKbV8dNWykTGKP5fca51lcdWT0SCyHsWfU5aV+aCdXpkIRzre9QkDoGk2nSNyGPpW6LpJRILDEc3KdQy1MSl96KH4Toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4HUXeq5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edb40f357so21864375e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 07 Apr 2025 09:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041821; x=1744646621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oq0LoJnjHMVsrmCQmRrhBcUFErmi4KUqj1rAYGtayes=;
        b=M4HUXeq5BcauhYC23nO8rC818p5lUvcaAojYMyal6KaU1/W/gd+3TA81G7VIxPYWmN
         AX6dZRH50jQAURgYNvHaU86vEWpEQNT9863JeyvCLC5FuegV4Idd/qkH75MAoSh4zqMB
         Xi03YU4kkQTTr7g4BXik5cw3N9wB6YRYrH3hyBNAXDr+7qGWTfKwCI2TphP/yipGTXhx
         nSGpFUUvFbMoLuYQMlDobizRsofdl2nBhZC5qrfFTdA2uLYki2Ewp59RWSWwHsbcVgmt
         siD5fvCn6rHzY4Oyq9Bj4gcJosoH0yobV1WNiiJYgejlL2kY9r0MYSDPhfIzoPJPZowQ
         XOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041821; x=1744646621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oq0LoJnjHMVsrmCQmRrhBcUFErmi4KUqj1rAYGtayes=;
        b=TdA3xsvYS6iuf0eTQq/2lYlN//aYFiKQ8wmayvYiwe8vDSmAUHvMkmYUwlVP/ow1LG
         V678Br/Vxbm1Yjv+3gkXtC47k+S/W0DsYYehlC3QJNy0AY264VWwqpGHkfrqU+Bldt+7
         EUQDLJhSwZZxKgxiShdIkWD1tPDbvJAF/bTqTCPRreKLg+L0yHxwGnOKq96gFDn981qg
         IbFXFw4d/X9rBamFK2zoPbfZodDnR4tyv2IGAmptcGiDkpO0N755ek+AfiIepn9XeihU
         jLoez1pjj59get5ef0TxEyt3DW6oYsf5A6WRrSlXWxyySuInzFKZwQsu8VsuR/5aPE8G
         Eugw==
X-Forwarded-Encrypted: i=1; AJvYcCVvx0X5EIUilyzwHyAcPWgjvGinVVyHQdkSy+xKPNxc/tGzdXB9RhBK7s4yJwX9iyEpz6+3+IZbCIHTm32wOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKx4PaNeKyia2W5bk3xeMJ7eukbdzO/N6sn2PMvLNJY4d4JKe8
	D7mB0ogf8AjKWDRMNLYiyWZRo9DUJiBh8yCsvmS0FgftiHCqFSEGHK4sE/ztEhw=
X-Gm-Gg: ASbGncveL8geSxnOV3DGyfZUIanMTUSoCK6Z8cqDQUXhN0kLeOiS8+fmCqe01ioO1lU
	EeExgH2uYM/r3mDBBG+1pvqZWCLUmHtgnYJJCLEPoj4lmH+8QLc+y7aSYLx6N1EX7hxhpGrbYws
	TJmkEFehg1eVgwP52WqoMGT12u+ltXOgvi7CdHXSASoTehVxx9yXUC794SykNczogSm0k/p044k
	a/xdLVi0/hhIyzVpO2qX69zaescZQc7W5hFEsYb3ajf9mgwGX9XCwTueTac+V+aBBrrLrIMAq6o
	m2JtuQ/MdfrXwULUwV9Gx3FLYE2lTkjPIpik1RlpCjqBAUino9vaI+pCUJzz7Xetou6OBvE=
X-Google-Smtp-Source: AGHT+IEaOPNZ55E0jL5Q5wFU6TOJjT4ILPjdaEq5V1twcqbLAouVO720iTO2LCMwirBP/FJpkB0CKw==
X-Received: by 2002:a05:600c:4684:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-43ee061708bmr95789835e9.4.1744041819586;
        Mon, 07 Apr 2025 09:03:39 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b3572sm137701205e9.39.2025.04.07.09.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:03:38 -0700 (PDT)
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
Subject: [PATCH v3 2/2] watchdog: Add the Watchdog Timer for the NXP S32 platform
Date: Mon,  7 Apr 2025 18:03:17 +0200
Message-ID: <20250407160318.936142-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407160318.936142-1-daniel.lezcano@linaro.org>
References: <20250407160318.936142-1-daniel.lezcano@linaro.org>
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
index 000000000000..f7e44c39aace
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
+	clk = devm_clk_get_enabled(dev, "counter");
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


