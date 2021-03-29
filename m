Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63A634D66E
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 20:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhC2SAK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 14:00:10 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:51262 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhC2SAA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 14:00:00 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12THxbna029326
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Mar 2021 19:59:37 +0200
Received: from localhost.localdomain ([167.87.41.127])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12THnYmw025235;
        Mon, 29 Mar 2021 19:49:36 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Henning Schild <henning.schild@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Weigelt <lkml@metux.net>
Subject: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for Siemens Industrial PCs
Date:   Mon, 29 Mar 2021 19:49:27 +0200
Message-Id: <20210329174928.18816-4-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210329174928.18816-1-henning.schild@siemens.com>
References: <20210329174928.18816-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This driver adds initial support for several devices from Siemens. It is
based on a platform driver introduced in an earlier commit.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig           |  11 ++
 drivers/watchdog/Makefile          |   1 +
 drivers/watchdog/simatic-ipc-wdt.c | 215 +++++++++++++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/watchdog/simatic-ipc-wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 1fe0042a48d2..948497eb4bef 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1575,6 +1575,17 @@ config NIC7018_WDT
 	  To compile this driver as a module, choose M here: the module will be
 	  called nic7018_wdt.
 
+config SIEMENS_SIMATIC_IPC_WDT
+	tristate "Siemens Simatic IPC Watchdog"
+	depends on SIEMENS_SIMATIC_IPC
+	select WATCHDOG_CORE
+	help
+	  This driver adds support for several watchdogs found in Industrial
+	  PCs from Siemens.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called simatic-ipc-wdt.
+
 # M68K Architecture
 
 config M54xx_WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f3a6540e725e..7f5c73ec058c 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
 obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
 obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
 obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
+obj-$(CONFIG_SIEMENS_SIMATIC_IPC_WDT) += simatic-ipc-wdt.o
 
 # M68K Architecture
 obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
diff --git a/drivers/watchdog/simatic-ipc-wdt.c b/drivers/watchdog/simatic-ipc-wdt.c
new file mode 100644
index 000000000000..e901718d05b9
--- /dev/null
+++ b/drivers/watchdog/simatic-ipc-wdt.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Siemens SIMATIC IPC driver for Watchdogs
+ *
+ * Copyright (c) Siemens AG, 2020-2021
+ *
+ * Authors:
+ *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_data/x86/simatic-ipc-base.h>
+#include <linux/platform_device.h>
+#include <linux/sizes.h>
+#include <linux/util_macros.h>
+#include <linux/watchdog.h>
+
+#define WD_ENABLE_IOADR			0x62
+#define WD_TRIGGER_IOADR		0x66
+#define GPIO_COMMUNITY0_PORT_ID		0xaf
+#define PAD_CFG_DW0_GPP_A_23		0x4b8
+#define SAFE_EN_N_427E			0x01
+#define SAFE_EN_N_227E			0x04
+#define WD_ENABLED			0x01
+#define WD_TRIGGERED			0x80
+#define WD_MACROMODE			0x02
+
+#define TIMEOUT_MIN	2
+#define TIMEOUT_DEF	64
+#define TIMEOUT_MAX	64
+
+#define GP_STATUS_REG_227E	0x404D	/* IO PORT for SAFE_EN_N on 227E */
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0000);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static struct resource gp_status_reg_227e_res =
+	DEFINE_RES_IO_NAMED(GP_STATUS_REG_227E, SZ_1, KBUILD_MODNAME);
+
+static struct resource io_resource =
+	DEFINE_RES_IO_NAMED(WD_ENABLE_IOADR, SZ_1,
+			    KBUILD_MODNAME " WD_ENABLE_IOADR");
+
+/* the actual start will be discovered with pci, 0 is a placeholder */
+static struct resource mem_resource =
+	DEFINE_RES_MEM_NAMED(0, SZ_4, "WD_RESET_BASE_ADR");
+
+static u32 wd_timeout_table[] = {2, 4, 6, 8, 16, 32, 48, 64 };
+static void __iomem *wd_reset_base_addr;
+
+static int wd_start(struct watchdog_device *wdd)
+{
+	outb(inb(WD_ENABLE_IOADR) | WD_ENABLED, WD_ENABLE_IOADR);
+	return 0;
+}
+
+static int wd_stop(struct watchdog_device *wdd)
+{
+	outb(inb(WD_ENABLE_IOADR) & ~WD_ENABLED, WD_ENABLE_IOADR);
+	return 0;
+}
+
+static int wd_ping(struct watchdog_device *wdd)
+{
+	inb(WD_TRIGGER_IOADR);
+	return 0;
+}
+
+static int wd_set_timeout(struct watchdog_device *wdd, unsigned int t)
+{
+	int timeout_idx = find_closest(t, wd_timeout_table,
+				       ARRAY_SIZE(wd_timeout_table));
+
+	outb((inb(WD_ENABLE_IOADR) & 0xc7) | timeout_idx << 3, WD_ENABLE_IOADR);
+	wdd->timeout = wd_timeout_table[timeout_idx];
+	return 0;
+}
+
+static const struct watchdog_info wdt_ident = {
+	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
+			  WDIOF_SETTIMEOUT,
+	.identity	= KBUILD_MODNAME,
+};
+
+static const struct watchdog_ops wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= wd_start,
+	.stop		= wd_stop,
+	.ping		= wd_ping,
+	.set_timeout	= wd_set_timeout,
+};
+
+static void wd_secondary_enable(u32 wdtmode)
+{
+	u16 resetbit;
+
+	/* set safe_en_n so we are not just WDIOF_ALARMONLY */
+	if (wdtmode == SIMATIC_IPC_DEVICE_227E) {
+		/* enable SAFE_EN_N on GP_STATUS_REG_227E */
+		resetbit = inw(GP_STATUS_REG_227E);
+		outw(resetbit & ~SAFE_EN_N_227E, GP_STATUS_REG_227E);
+	} else {
+		/* enable SAFE_EN_N on PCH D1600 */
+		resetbit = ioread16(wd_reset_base_addr);
+		iowrite16(resetbit & ~SAFE_EN_N_427E, wd_reset_base_addr);
+	}
+}
+
+static int wd_setup(u32 wdtmode)
+{
+	unsigned int bootstatus = 0;
+	int timeout_idx;
+
+	timeout_idx = find_closest(TIMEOUT_DEF, wd_timeout_table,
+				   ARRAY_SIZE(wd_timeout_table));
+
+	if (inb(WD_ENABLE_IOADR) & WD_TRIGGERED)
+		bootstatus |= WDIOF_CARDRESET;
+
+	/* reset alarm bit, set macro mode, and set timeout */
+	outb(WD_TRIGGERED | WD_MACROMODE | timeout_idx << 3, WD_ENABLE_IOADR);
+
+	wd_secondary_enable(wdtmode);
+
+	return bootstatus;
+}
+
+static struct watchdog_device wdd_data = {
+	.info = &wdt_ident,
+	.ops = &wdt_ops,
+	.min_timeout = TIMEOUT_MIN,
+	.max_timeout = TIMEOUT_MAX
+};
+
+static int simatic_ipc_wdt_probe(struct platform_device *pdev)
+{
+	struct simatic_ipc_platform *plat = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	switch (plat->devmode) {
+	case SIMATIC_IPC_DEVICE_227E:
+		if (!devm_request_region(dev, gp_status_reg_227e_res.start,
+					 resource_size(&gp_status_reg_227e_res),
+					 KBUILD_MODNAME)) {
+			dev_err(dev,
+				"Unable to register IO resource at %pR\n",
+				&gp_status_reg_227e_res);
+			return -EBUSY;
+		}
+		fallthrough;
+	case SIMATIC_IPC_DEVICE_427E:
+		wdd_data.parent = dev;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!devm_request_region(dev, io_resource.start,
+				 resource_size(&io_resource),
+				 io_resource.name)) {
+		dev_err(dev,
+			"Unable to register IO resource at %#x\n",
+			WD_ENABLE_IOADR);
+		return -EBUSY;
+	}
+
+	if (plat->devmode == SIMATIC_IPC_DEVICE_427E) {
+		res = &mem_resource;
+
+		/* get GPIO base from PCI */
+		res->start = simatic_ipc_get_membase0(PCI_DEVFN(0x1f, 1));
+		if (res->start == 0)
+			return -ENODEV;
+
+		/* do the final address calculation */
+		res->start = res->start + (GPIO_COMMUNITY0_PORT_ID << 16) +
+			     PAD_CFG_DW0_GPP_A_23;
+		res->end += res->start;
+
+		wd_reset_base_addr = devm_ioremap_resource(dev, res);
+		if (IS_ERR(wd_reset_base_addr))
+			return PTR_ERR(wd_reset_base_addr);
+	}
+
+	wdd_data.bootstatus = wd_setup(plat->devmode);
+	if (wdd_data.bootstatus)
+		dev_warn(dev, "last reboot caused by watchdog reset\n");
+
+	watchdog_set_nowayout(&wdd_data, nowayout);
+	watchdog_stop_on_reboot(&wdd_data);
+	return devm_watchdog_register_device(dev, &wdd_data);
+}
+
+static struct platform_driver simatic_ipc_wdt_driver = {
+	.probe = simatic_ipc_wdt_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+	},
+};
+
+module_platform_driver(simatic_ipc_wdt_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
-- 
2.26.3

