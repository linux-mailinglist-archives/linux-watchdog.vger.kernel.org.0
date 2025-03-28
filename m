Return-Path: <linux-watchdog+bounces-3170-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62673A74D96
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 16:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830B73BDD9F
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFA01D63FC;
	Fri, 28 Mar 2025 15:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vUzjMu3J"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6095A1D416E
	for <linux-watchdog@vger.kernel.org>; Fri, 28 Mar 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174959; cv=none; b=O//raXXMQHUJGckmG5sMCsBK42KtyWSiWt1thfZXp+PHDTq+zxGuGsrWbNUfsdMBIDAOToRVdZ8w87nTKbcrP56Kh7WJRmN6/YD3/1K9Bb4LL7749uaU16QvtU5I/018qFzwUKtd1yCIsaj9B+fHhIzEkYMX++jRZ8LzWrAFC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174959; c=relaxed/simple;
	bh=csLAjwEnGwdTZPm2fmwfXNDOEWoleA+paOegAtseumU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spJArVcCkvpOlt3ruMvM1MpqD2QkBlVKRqpLQtpbCQutmfrmM9TJqJJdXPCExWWY/nlo/x5SNu1nVaZ39O4pkIVHmq3iSQPfdLNcVR9cYznHWzLKHI+aumPCBjpoShTvijgWzpWYNbKQPiDfcoYICKBGN1h0tn8558LNwyK+WH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vUzjMu3J; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so13230895e9.2
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Mar 2025 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174954; x=1743779754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGzd55TOXiSmDrDkLygudm8JpJpJ6jy7cbt9e11ExGs=;
        b=vUzjMu3JkHauz4ukfgFep3vOdwrLnCSqZbtmnHlUwYR7M4iCRpFJt92ILEerfHQuiM
         rKsOs3Pp/AP1KU91fQuoMMW8RxljxDREYsNHwBVaS7Vw1hO4mxMw95UUaWOAPb8oVF41
         OAiqBwdmunOLw10rAhz3Cg997mze+EdLeAmNa5FBl6cDGr6ZG2AtO4bVuqXjGaj+GTeq
         AxU5Y67g2KXPiIu8aYB+goMVUoT/S6du6pH5KhDH2qw8lxMPAjzZcYfjbfkaGKY+n7b1
         +Yi/mK6nxeGzbFTS48I87CiQDM9tA+/Mu3fQ9rc2vy95kWhucf+0AkXOX+VTGzBXgYgI
         B57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174954; x=1743779754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGzd55TOXiSmDrDkLygudm8JpJpJ6jy7cbt9e11ExGs=;
        b=SoN3bk8kRp6EB8TTZl0SGrX+s8aMENMoqvuKSm6OjOaA3DxGiyRahw9hQ64T5DAqt9
         fEgBB7d1iqKgYI8qZZiI+fPhVxYJtgi94q5WCjGuMO0OsoHdnavIdd9ORJ+X37EV0Jj3
         1Kjpp671hCEx/x3GHcHPeI3Vv6lPfjgCxgUelJgGEa2xUnVsUcxrheJWDfBfslkpS6+R
         dmlYbclabZKFcUYMr8oqlsuYqsFvx7tW3VHl92jmmEoSoNaXlGwgQnYOHQvlyCFVcp5t
         fUkjpq3YWrZhki3VmIRhx4xXhczg9NXzDGkDzZd8U1HgPgvbSiVxnRjfsVrvK+Pz/Y3J
         GCqw==
X-Forwarded-Encrypted: i=1; AJvYcCWlZzSLQW8HKoECTGrJKOS1iwKwdvzmSy7fuXckzA/PCBR/Xwmc/KoTumwyUecpO3/P9UJmAzYvaj778ztk1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTwMmMoeQALJAsnIaIHJDYNfNO9uR1sjoyA0nEHdQDoEcOoO8
	/wzf+AfKVLPmP5JhE1MSE6pM8PmYnm0sSGm6ML0vTCuzbWJxdhpAwS3IgUKsQJE=
X-Gm-Gg: ASbGnctavPIgeJ2EO74fDnUAcSc07ZmgGyPjTZ93c85dn/jGz+HTpwdv+JzAdeaEuCp
	DqnHLgSvacblGMzEqcJArrLNie90GGFCT5cSJOI5lgRmvBiHbQvsChFjlJfLZo/NSYBQT8jj9bF
	ZSBE7PnKZTkf43nr3HzSFVc3kxt8bZA+Mk7MJBq2qtMIqrsLSf+WLpElJkcBeK9PjgqRx0rfMDq
	DIUHjSWo6zPQmBcUEmE4SzcCLAYx/MDm78+KxyqruTZZaxSYJSVqAMU0RldWUt943FDwtrIf0rf
	ZahhE7H6IpMbWbY6XLb9faGJMIZ7EDNtfks7XVSXENvbP7d5rf4C01Ap7SKSm6EstCD2GbutAFL
	VVrqDOA==
X-Google-Smtp-Source: AGHT+IGA8JiZ/I4x0IDKzofQSAyqPJIiX1cc0HxEbtXmB1vz/sn3zyPYOdu87lK4JA+AoJ9JhXjfnA==
X-Received: by 2002:a05:600c:3c89:b0:43d:7588:6687 with SMTP id 5b1f17b1804b1-43d84f8b894mr78704665e9.12.1743174954393;
        Fri, 28 Mar 2025 08:15:54 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5b41sm75979335e9.27.2025.03.28.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:53 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.lezcano@linaro.org,
	S32@nxp.com,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 2/2] watchdog: Add the Software Watchdog Timer for the NXP S32 platform
Date: Fri, 28 Mar 2025 16:15:14 +0100
Message-ID: <20250328151516.2219971-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S32 platform has several Software Watchdog Timer available and
tied with a CPU. The SWT0 is the only one which directly asserts the
reset line, other SWT require an external setup to configure the reset
behavior which is not part of this change.

The maximum watchdog value depends on the clock feeding the SWT
counter which is 32bits wide. On the s32g274-rb2, the clock has a rate
of 51MHz which lead to 83 seconds maximum timeout.

The timeout can be specified via the device tree with the usual
existing bindings 'timeout-sec' or via the module param timeout.

The watchdog can be loaded with the 'nowayout' option, preventing the
watchdog to be stopped.

The watchdog can be started at boot time with the 'early-enable'
option, thus letting the watchdog framework to service the watchdog
counter.

the watchdog support the magic character to stop when the userspace
releases the device.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/watchdog/Kconfig    |   9 +
 drivers/watchdog/Makefile   |   1 +
 drivers/watchdog/s32g_wdt.c | 362 ++++++++++++++++++++++++++++++++++++
 3 files changed, 372 insertions(+)
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
index 000000000000..87207b134c3e
--- /dev/null
+++ b/drivers/watchdog/s32g_wdt.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Watchdog driver for S32G SoC
+ *
+ * Copyright (C) 2014 Freescale Semiconductor, Inc.
+ * Copyright 2017-2019, 2021-2025 NXP.
+ *
+ */
+#include <linux/debugfs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/of.h>
+
+#define DRIVER_NAME "s32g-wdt"
+
+#define S32G_SWT_CR(__base)	(__base + 0x00)		/* Control Register offset	*/
+#define S32G_SWT_CR_SM		BIT(9) | BIT(10)	/* -> Service Mode		*/
+#define S32G_SWT_CR_STP		BIT(2)			/* -> Stop Mode Control		*/
+#define S32G_SWT_CR_FRZ		BIT(1)			/* -> Debug Mode Control	*/
+#define S32G_SWT_CR_WEN		BIT(0)			/* -> Watchdog Enable		*/
+
+#define S32G_SWT_TO(__base)	(__base + 0x08)		/* Timeout Register offset	*/
+
+#define S32G_SWT_SR(__base)	(__base + 0x10)		/* Service Register offset	*/
+#define S32G_WDT_SEQ1		0xA602			/* -> service sequence number 1	*/
+#define S32G_WDT_SEQ2		0xB480			/* -> service sequence number 2	*/
+
+#define S32G_SWT_CO(__base)	(__base + 0x14)		/* Counter output register	*/
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
+static bool early_enable = false;
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
+#ifdef CONFIG_DEBUG_FS
+#define S32G_WDT_DEBUG_FS_REGS(__reg)		\
+{						\
+	.name = __stringify(__reg),		\
+	.offset = __reg(0),			\
+}
+
+static const struct debugfs_reg32 wdt_regs[] = {
+	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_CR),
+	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_TO),
+	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_CO),
+};
+
+static void s32g_wdt_debugfs_init(struct device *dev, struct s32g_wdt_device *wdev)
+{
+	struct debugfs_regset32 *regset;
+	static struct dentry *dentry = NULL;
+
+	if (!dentry)
+		dentry = debugfs_create_dir("watchdog", NULL);
+
+	dentry = debugfs_create_dir(dev_name(dev), dentry);
+
+	regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
+		return;
+
+	regset->base = wdev->base;
+	regset->regs = wdt_regs;
+	regset->nregs = ARRAY_SIZE(wdt_regs);
+
+	debugfs_create_regset32("registers", 0400, dentry, regset);
+}
+#else
+static inline void s32g_wdt_debugfs_init(struct device *dev, struct s32g_wdt_device *wdev)
+{
+}
+#endif
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
+	__raw_writel(S32G_WDT_SEQ1, S32G_SWT_SR(wdev->base));
+	__raw_writel(S32G_WDT_SEQ2, S32G_SWT_SR(wdev->base));
+
+	return 0;
+}
+
+static int s32g_wdt_start(struct watchdog_device *wdog)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+	unsigned long val;
+
+	val = __raw_readl(S32G_SWT_CR(wdev->base));
+
+	val |= S32G_SWT_CR_WEN;
+
+	__raw_writel(val, S32G_SWT_CR(wdev->base));
+
+	return 0;
+}
+
+static int s32g_wdt_stop(struct watchdog_device *wdog)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+	unsigned long val;
+
+	val = __raw_readl(S32G_SWT_CR(wdev->base));
+
+	val &= ~S32G_SWT_CR_WEN;
+
+	__raw_writel(val, S32G_SWT_CR(wdev->base));
+
+	return 0;
+}
+
+static int s32g_wdt_set_timeout(struct watchdog_device *wdog, unsigned int timeout)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+
+	__raw_writel(wdog_sec_to_count(wdev, timeout), S32G_SWT_TO(wdev->base));
+	
+	/*
+	 * Conforming to the documentation, the timeout counter is
+	 * loaded when servicing is operated or when the counter is
+	 * enabled. In case the watchdog is already started it must be
+	 * stopped and started again to update the timeout
+	 * register. Here we choose to service the watchdog for
+	 * simpler code.
+	 */
+	return s32g_wdt_ping(wdog);
+}
+
+static unsigned int s32g_wdt_get_timeleft(struct watchdog_device *wdog)
+{
+	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
+	unsigned long val, counter;
+
+	/*
+	 * The counter output can be read only if the SWT is
+	 * disabled. Given the latency between the internal counter
+	 * and the counter output update, there can be very small
+	 * difference. However, we can accept this matter of fact
+	 * given the resolution is a second based unit for the output.
+	 */
+	val = __raw_readl(S32G_SWT_CR(wdev->base));
+
+	if (test_bit(S32G_SWT_CR_WEN, &val))
+		s32g_wdt_stop(wdog);
+
+	counter = __raw_readl(S32G_SWT_CO(wdev->base));
+
+	if (test_bit(S32G_SWT_CR_WEN, &val))
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
+	__raw_writel(val, S32G_SWT_TO(wdev->base));
+
+	/*
+	 * Get the control register content. We are at init time, the
+	 * watchdog should not be started.
+	 */
+	val = __raw_readl(S32G_SWT_CR(wdev->base));
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
+	__raw_writel(val, S32G_SWT_CR(wdev->base));
+
+	/*
+	 * The watchdog must be started when the module is loaded,
+	 * leading to getting ride of the userspace control. The
+	 * watchdog framework will handle the pings. It is especially
+	 * handy for kernel development.
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
+	wdev = devm_kzalloc(dev, sizeof(struct s32g_wdt_device), GFP_KERNEL);
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
+	/*
+	 * The debugfs will create a directory with the configured
+	 * watchdogs on the platform and a register file to give some
+	 * register content.
+	 */
+	s32g_wdt_debugfs_init(dev, wdev);
+
+	ret = devm_watchdog_register_device(dev, wdog);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register watchdog device\n");
+
+	dev_info(dev, "S32G Watchdog Timer Registered. "
+		 "timeout=%ds, nowayout=%d, early_enable=%d\n",
+		 wdog->timeout, nowayout, early_enable);
+
+	return 0;
+}
+
+static const struct of_device_id s32g_wdt_dt_ids[] = {
+	{ .compatible = "nxp,s32g-wdt" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver s32g_wdt_driver = {
+	.probe = s32g_wdt_probe,
+	.driver = {
+		.name = DRIVER_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = s32g_wdt_dt_ids,
+	},
+};
+
+module_platform_driver(s32g_wdt_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("Watchdog driver for S32G SoC");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.43.0


