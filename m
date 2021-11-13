Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1D044F256
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Nov 2021 10:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbhKMJul (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Nov 2021 04:50:41 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:34591 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235783AbhKMJuk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Nov 2021 04:50:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2DC67580C07;
        Sat, 13 Nov 2021 04:47:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 13 Nov 2021 04:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=5qZsDmJMjEczA
        1Lcn1+u3Y17zKkrQFWnWaJH1zb5Ah8=; b=p2yBDX6z1+6xK8OBsXYCE9ZjzWrVf
        CwnJITa57CqeD4DwfSBSEgOvEL2MGQMY8oArjr3WtlHsP5rk6Td1TZ0XeZPwaeE/
        jY6FuTgMsbWOqu3xixEr9J98Y9k/kKAZf2eN9Yt4Jz5VGaG6428vHjZ5bG4Enpou
        Wxk46J5bSATD3R3SLK25/3cnJhPj22NbjsZ/Oanqmm3GljZM0/lGTHCh7OGoG99L
        S3OIeX89eLG/9rsC0ZCMyfB7cbd+IIrZ/Sl4sMqCm9qiaSSuoRTL6Qcdj0nsn1Y3
        tUoYxqQ0QQaEm3X0wBh6NG81emWlMXWg821RtXZG6Lfjpr8TVPE/IE7+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=5qZsDmJMjEczA1Lcn1+u3Y17zKkrQFWnWaJH1zb5Ah8=; b=egVXhmHw
        XdfVsn2x7jmAxRbNr4M7d2aW3U0e8L+7tibwujFMPUdEN4Wh7+7uuZ06oxvCEQq8
        FZWG0xYtnsQFxgGrOGobF/qgXwISmt8ydRKVucqvl/IMSEeC7exCC32bfOcQzwqW
        r1Rp6WlqncuShfH3M8EG25y0Kz0JLv9kbUoIX7sQBKWT65g/SSBtomnjWsgLH6ts
        n5CEFK1AojUDfPJwLrv1hrNIFiFBhGZkVUYFljuxRp4uxxqnz7AIZLNPPM654L/6
        W8G96QYs5OZEP7vWu6l9altqeXjrah9wRgJ/XWLkz/ZueH7x2CNSeQ+SONyJmQGF
        OhV0saZRaDmmIw==
X-ME-Sender: <xms:w4mPYdXcDUBs3PWaTq5SR_lr1aSy1kXiyn3q7rmjD2es77Fe_OUoMQ>
    <xme:w4mPYdmAoEzE8iIkMhpsixlSGTcuPZO9HNbhKUds6HZni6ostk8E-yVOijx2pEVzr
    xm8tAxEwfg7mZB2mn0>
X-ME-Received: <xmr:w4mPYZYqhsHPtwk0quCcJWqls5-zsEGQp5rKWjCCO29qE22FYnI2q2u6_9rsAzGQNqoGb1EQdCmy_yC5zwKPwoX_WfMZZrw_jT6UgesaFbiEX755ncTZtNpPvTugFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdehgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghnucfr
    vghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtthgvrh
    hnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfefjeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnh
    esshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:w4mPYQVSjosDKjkUbSo5X5DEcXQyTm5lrmNsqYU54cR-X9pZ-9OtvQ>
    <xmx:w4mPYXkuKXg6ZrQDSIhtnU7xJiNeeIjhCtwZnrkqG48sm8mmRWq3Pw>
    <xmx:w4mPYdcbvG9oCLNkdWd8aEoqhPWYAawXoT6l_gqtbjLY3SzQ7qrNtQ>
    <xmx:xImPYQj-H7PY9ivkSSa50LuGbQ_gKfrgrwSW0SYLDXiRc7MKhFGIYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Nov 2021 04:47:45 -0500 (EST)
From:   Sven Peter <sven@svenpeter.dev>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] watchdog: Add Apple SoC watchdog driver
Date:   Sat, 13 Nov 2021 10:47:32 +0100
Message-Id: <20211113094732.73889-2-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211113094732.73889-1-sven@svenpeter.dev>
References: <20211113094732.73889-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add support for the watchdog timer found in Apple SoCs. This driver is
also required to reboot these machines.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 MAINTAINERS                  |   1 +
 drivers/watchdog/Kconfig     |  12 ++
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/apple_wdt.c | 223 +++++++++++++++++++++++++++++++++++
 4 files changed, 237 insertions(+)
 create mode 100644 drivers/watchdog/apple_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ba480837724d..30a1444297a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1756,6 +1756,7 @@ F:	drivers/i2c/busses/i2c-pasemi-platform.c
 F:	drivers/irqchip/irq-apple-aic.c
 F:	drivers/mailbox/apple-mailbox.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
+F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
 F:	include/linux/apple-mailbox.h
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9d222ba17ec6..170dec880c8f 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -976,6 +976,18 @@ config MSC313E_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called msc313e_wdt.
 
+config APPLE_WATCHDOG
+	tristate "Apple SoC watchdog"
+	depends on ARCH_APPLE || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the Watchdog found in Apple
+	  SoCs such as the M1. Next to the common watchdog features this
+	  driver is also required in order to reboot these SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called apple_wdt.
+
 # X86 (i386 + ia64 + x86_64) Architecture
 
 config ACQUIRE_WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 2ee97064145b..270a518bd8f3 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
 obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
 obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
 obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
+obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
new file mode 100644
index 000000000000..ff6d98aadffc
--- /dev/null
+++ b/drivers/watchdog/apple_wdt.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SoC Watchdog driver
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+/*
+ * Apple Watchdog MMIO registers
+ *
+ * This HW block has three separate watchdogs. WD0 resets the machine
+ * to recovery mode and is not very useful for us. WD1 and WD2 trigger a normal
+ * machine reset. WD0 additionally supports a configurable interrupt.
+ *
+ * APPLE_WDT_WDx_CUR_TIME is a simple counter incremented for each tick of the
+ * reference clock. It can also be overwritten to any value.
+ * Whenever APPLE_WDT_CTRL_RESET_EN is set in APPLE_WDT_WDx_CTRL and
+ * APPLE_WDTx_WD1_CUR_TIME >= APPLE_WDTx_WD1_BITE_TIME the entire machine is
+ * reset.
+ * Whenever APPLE_WDT_CTRL_IRQ_EN is set and APPLE_WDTx_WD1_CUR_TIME >=
+ * APPLE_WDTx_WD1_BARK_TIME an interrupt is triggered and
+ * APPLE_WDT_CTRL_IRQ_STATUS is set. The interrupt can be cleared by writing
+ * 1 to APPLE_WDT_CTRL_IRQ_STATUS.
+ */
+#define APPLE_WDT_WD0_CUR_TIME		0x00
+#define APPLE_WDT_WD0_BITE_TIME		0x04
+#define APPLE_WDT_WD0_BARK_TIME		0x08
+#define APPLE_WDT_WD0_CTRL		0x0c
+
+#define APPLE_WDT_WD1_CUR_TIME		0x10
+#define APPLE_WDT_WD1_BITE_TIME		0x14
+#define APPLE_WDT_WD1_CTRL		0x1c
+
+#define APPLE_WDT_WD2_CUR_TIME		0x20
+#define APPLE_WDT_WD2_BITE_TIME		0x24
+#define APPLE_WDT_WD2_CTRL		0x2c
+
+#define APPLE_WDT_CTRL_IRQ_EN		BIT(0)
+#define APPLE_WDT_CTRL_IRQ_STATUS	BIT(1)
+#define APPLE_WDT_CTRL_RESET_EN		BIT(2)
+
+struct apple_wdt {
+	struct watchdog_device wdd;
+	void __iomem *regs;
+	struct clk *clk;
+	u32 clk_rate;
+};
+
+static struct apple_wdt *to_apple_wdt(struct watchdog_device *wdd)
+{
+	return container_of(wdd, struct apple_wdt, wdd);
+}
+
+static int apple_wdt_start(struct watchdog_device *wdd)
+{
+	struct apple_wdt *wdt = to_apple_wdt(wdd);
+
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	writel_relaxed(APPLE_WDT_CTRL_RESET_EN, wdt->regs + APPLE_WDT_WD1_CTRL);
+
+	return 0;
+}
+
+static int apple_wdt_stop(struct watchdog_device *wdd)
+{
+	struct apple_wdt *wdt = to_apple_wdt(wdd);
+
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CTRL);
+
+	return 0;
+}
+
+static int apple_wdt_ping(struct watchdog_device *wdd)
+{
+	struct apple_wdt *wdt = to_apple_wdt(wdd);
+
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+
+	return 0;
+}
+
+static int apple_wdt_set_timeout(struct watchdog_device *wdd, unsigned int s)
+{
+	struct apple_wdt *wdt = to_apple_wdt(wdd);
+	u64 timeout;
+
+	timeout = mul_u32_u32(wdt->clk_rate, s);
+	if (timeout > U32_MAX)
+		return -EINVAL;
+
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	writel_relaxed(timeout, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
+
+	wdd->timeout = s;
+
+	return 0;
+}
+
+static unsigned int apple_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct apple_wdt *wdt = to_apple_wdt(wdd);
+	u32 cur_time, reset_time;
+
+	cur_time = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	reset_time = readl_relaxed(wdt->regs + APPLE_WDT_WD1_BITE_TIME);
+
+	return (reset_time - cur_time) / wdt->clk_rate;
+}
+
+static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
+			     void *cmd)
+{
+	struct apple_wdt *wdt = to_apple_wdt(wdd);
+
+	writel_relaxed(APPLE_WDT_CTRL_RESET_EN, wdt->regs + APPLE_WDT_WD1_CTRL);
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+
+	/* flush writes and wait for the reset to be triggered */
+	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	mdelay(150);
+
+	return 0;
+}
+
+static struct watchdog_ops apple_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = apple_wdt_start,
+	.stop = apple_wdt_stop,
+	.ping = apple_wdt_ping,
+	.set_timeout = apple_wdt_set_timeout,
+	.get_timeleft = apple_wdt_get_timeleft,
+	.restart = apple_wdt_restart,
+};
+
+static struct watchdog_info apple_wdt_info = {
+	.identity = "Apple SoC Watchdog",
+	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+};
+
+static int apple_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct apple_wdt *wdt;
+	int ret;
+
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, wdt);
+
+	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wdt->regs))
+		return PTR_ERR(wdt->regs);
+
+	/* reset watchdog to safe defaults */
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CTRL);
+	writel_relaxed(U32_MAX, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
+
+	wdt->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(wdt->clk))
+		return PTR_ERR(wdt->clk);
+
+	ret = clk_prepare_enable(wdt->clk);
+	if (ret)
+		return ret;
+
+	wdt->clk_rate = clk_get_rate(wdt->clk);
+	wdt->wdd.ops = &apple_wdt_ops;
+	wdt->wdd.info = &apple_wdt_info;
+	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
+	wdt->wdd.timeout = wdt->wdd.max_timeout;
+
+	watchdog_stop_on_unregister(&wdt->wdd);
+	watchdog_set_restart_priority(&wdt->wdd, 128);
+
+	ret = devm_watchdog_register_device(dev, &wdt->wdd);
+	if (ret < 0) {
+		clk_disable_unprepare(wdt->clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int apple_wdt_remove(struct platform_device *pdev)
+{
+	struct apple_wdt *wdt = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(wdt->clk);
+	return 0;
+}
+
+static const struct of_device_id apple_wdt_of_match[] = {
+	{ .compatible = "apple,wdt" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apple_wdt_of_match);
+
+static struct platform_driver apple_wdt_driver = {
+	.driver = {
+		.name = "apple-watchdog",
+		.of_match_table = apple_wdt_of_match,
+	},
+	.probe = apple_wdt_probe,
+	.remove = apple_wdt_remove,
+};
+module_platform_driver(apple_wdt_driver);
+
+MODULE_DESCRIPTION("Apple SoC watchdog driver");
+MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.25.1

