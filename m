Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791B74713CC
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Dec 2021 13:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhLKMgo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Dec 2021 07:36:44 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:51903 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229668AbhLKMgn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Dec 2021 07:36:43 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 52D19320210E;
        Sat, 11 Dec 2021 07:36:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 11 Dec 2021 07:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=k7CwF7o56rh7a
        JELMNBbFG20Hye/Y4lOo/1C2ohQGUc=; b=HNq7iUS2NR/7GYYpJKWidl0uRwTV1
        xKxaLnEYrzlK6Nh0KoL6vnsJL+m0IpYgrLIwwDrqA+8KjPLsZtkQbUPu9cxhTyZ0
        WM4njYKGilj22MR90j/0iUf+rBzVT/aSdy+i6VEsGXLxQ3DVEWjpOmRoIyp+FXta
        PQdykLA0MUDQJQ0appadATaMKyJ/hQw05CHk76A7+7luVltVZDrMyp7EmGwDgr3I
        rt9BfF3Bm+SgaB2bCI77NkykYoX4jqjw/YroV8ErnLyutKY9nk6DpE6v+g/e0n00
        fGK5/BNXQqBYe+0bVwKKLsz83OI70BNBpALKU+Gz9ACruU/mCg5GlHfiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=k7CwF7o56rh7aJELMNBbFG20Hye/Y4lOo/1C2ohQGUc=; b=St24HG72
        mrJOod/SXX73byXBiMnHTDb1K046D5u/kdL/L/PRckchPWfYhdv1D3XZpMNqur1A
        KnCbysyKQegArzQfl9fqLkc81D/lGQLmOWJUP4hLGwjgoA7jHhGiDtl+oU6ETgW5
        LpDUqpGG2t5yyz8d2vpvhgmHU7hklEGrIoiakxqQSCEutAyMEtHzMYMmUs9co/MN
        bpHJfRL87Dg1lQIxh+nxmnRu9iBhcNTc3OgoUpSXvMRIVon51Kjf5eZJ+vpJNwJo
        hfdKQ5sl1HZ/su7WlfXB26BvwabWJWDlUpZHt4ifrkGJiW3397M25rknXRW7pE0y
        KEix+4Zel3acjA==
X-ME-Sender: <xms:WZu0YWHEWu3H5GyaYJeiHnoBBzV3x2hmgRGIVVSC9FaiNDdIxfEh2A>
    <xme:WZu0YXXfdguQhxA-ws_tLW-z5fWpJZVdSvuz7QcuZWvy9-Lyd97bHT0iTxf2RP5Ke
    U3O_PTCDJINQalf7cc>
X-ME-Received: <xmr:WZu0YQKbnBuHepV0-yPgB5zJhH0QOvNgVD2AreXKgeOgLMBg_ks_bRrQBCX8W7vVyS1bTVC5uo_4PNgs0s1cihT5dTORqE9X4W2YwRGCEMMvrIZUUFip00v47dFwPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeeggdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghnucfr
    vghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtthgvrh
    hnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfefjeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnh
    esshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:WZu0YQE4rVtOUedICuMzV8dMWRVp3yKBNyfR9YbpbPvCZu62yoDJ2Q>
    <xmx:WZu0YcWCQWROFL5o-4kP55YLM_47vA2NLHSWQczcVUvxlScYPeDp-g>
    <xmx:WZu0YTNI5G8a21WIryF82Gx8aaGugU65w-lxE1l5In73JaPNLZUtHA>
    <xmx:WZu0YfEwW-qH4zb1EHFeWsuYMoIr5PvAw2CqVGOGN7oFLkgyOHtfJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Dec 2021 07:36:40 -0500 (EST)
From:   Sven Peter <sven@svenpeter.dev>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>
Subject: [PATCH v3 2/2] watchdog: Add Apple SoC watchdog driver
Date:   Sat, 11 Dec 2021 13:36:33 +0100
Message-Id: <20211211123633.4392-2-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211211123633.4392-1-sven@svenpeter.dev>
References: <20211211123633.4392-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add support for the watchdog timer found in Apple SoCs. This driver is
also required to reboot these machines.

Tested-by: Janne Grunau <j@jannau.net>
Reviewed-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v2 -> v3:
 - removed MAINTAINERS changes as requested by Hector Martin
   to be able to take them through the soc tree instead
 - typo fix: s/APPLE_WDTx_WD1_CUR_TIME/APPLE_WDT_WDx_CUR_TIME/
 - added review and test tags

v1 -> v2:
 - set the default timeout to 30s and call watchdog_init_timeout
   to allow the device tree to override it
 - set WDOG_HW_RUNNING if the watchdog is enabled at boot
 - check that the clock rate is not zero
 - use unsigned long instead of u32 for clk_rate
 - use devm_add_action_or_reset instead of manually calling
   clk_disable_unprepare
 - explain the magic number in apple_wdt_restart

 drivers/watchdog/Kconfig     |  12 ++
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/apple_wdt.c | 226 +++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 drivers/watchdog/apple_wdt.c

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
index 000000000000..16aca21f13d6
--- /dev/null
+++ b/drivers/watchdog/apple_wdt.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SoC Watchdog driver
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
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
+ * This information can be used to implement pretimeout support at a later time.
+ *
+ * APPLE_WDT_WDx_CUR_TIME is a simple counter incremented for each tick of the
+ * reference clock. It can also be overwritten to any value.
+ * Whenever APPLE_WDT_CTRL_RESET_EN is set in APPLE_WDT_WDx_CTRL and
+ * APPLE_WDT_WDx_CUR_TIME >= APPLE_WDT_WDx_BITE_TIME the entire machine is
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
+#define APPLE_WDT_TIMEOUT_DEFAULT	30
+
+struct apple_wdt {
+	struct watchdog_device wdd;
+	void __iomem *regs;
+	unsigned long clk_rate;
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
+
+	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	writel_relaxed(wdt->clk_rate * s, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
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
+	/*
+	 * Flush writes and then wait for the SoC to reset. Even though the
+	 * reset is queued almost immediately experiments have shown that it
+	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
+	 * 50ms here to be safe.
+	 */
+	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	mdelay(50);
+
+	return 0;
+}
+
+static void apple_wdt_clk_disable_unprepare(void *data)
+{
+	clk_disable_unprepare(data);
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
+	struct clk *clk;
+	u32 wdt_ctrl;
+	int ret;
+
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wdt->regs))
+		return PTR_ERR(wdt->regs);
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, apple_wdt_clk_disable_unprepare,
+				       clk);
+	if (ret)
+		return ret;
+
+	wdt->clk_rate = clk_get_rate(clk);
+	if (!wdt->clk_rate)
+		return -EINVAL;
+
+	wdt->wdd.ops = &apple_wdt_ops;
+	wdt->wdd.info = &apple_wdt_info;
+	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
+	wdt->wdd.timeout = APPLE_WDT_TIMEOUT_DEFAULT;
+
+	wdt_ctrl = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CTRL);
+	if (wdt_ctrl & APPLE_WDT_CTRL_RESET_EN)
+		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+
+	watchdog_init_timeout(&wdt->wdd, 0, dev);
+	apple_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+	watchdog_stop_on_unregister(&wdt->wdd);
+	watchdog_set_restart_priority(&wdt->wdd, 128);
+
+	return devm_watchdog_register_device(dev, &wdt->wdd);
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
+};
+module_platform_driver(apple_wdt_driver);
+
+MODULE_DESCRIPTION("Apple SoC watchdog driver");
+MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.25.1

