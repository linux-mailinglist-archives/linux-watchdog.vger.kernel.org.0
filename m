Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DD934D66B
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 20:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhC2SAK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 14:00:10 -0400
Received: from gecko.sbs.de ([194.138.37.40]:34931 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhC2SAD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 14:00:03 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12THxb0N020696
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Mar 2021 19:59:37 +0200
Received: from localhost.localdomain ([167.87.41.127])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12THnYmv025235;
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
Subject: [PATCH v3 2/4] leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
Date:   Mon, 29 Mar 2021 19:49:26 +0200
Message-Id: <20210329174928.18816-3-henning.schild@siemens.com>
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
---
 drivers/leds/Kconfig                   |   3 +
 drivers/leds/Makefile                  |   3 +
 drivers/leds/simple/Kconfig            |  11 ++
 drivers/leds/simple/Makefile           |   2 +
 drivers/leds/simple/simatic-ipc-leds.c | 202 +++++++++++++++++++++++++
 5 files changed, 221 insertions(+)
 create mode 100644 drivers/leds/simple/Kconfig
 create mode 100644 drivers/leds/simple/Makefile
 create mode 100644 drivers/leds/simple/simatic-ipc-leds.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..5c8558a4fa60 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -937,4 +937,7 @@ source "drivers/leds/trigger/Kconfig"
 comment "LED Blink"
 source "drivers/leds/blink/Kconfig"
 
+comment "Simple LED drivers"
+source "drivers/leds/simple/Kconfig"
+
 endif # NEW_LEDS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2a698df9da57..2de7fdd8d629 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -111,3 +111,6 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
 
 # LED Blink
 obj-$(CONFIG_LEDS_BLINK)                += blink/
+
+# Simple LED drivers
+obj-y					+= simple/
diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
new file mode 100644
index 000000000000..9f6a68336659
--- /dev/null
+++ b/drivers/leds/simple/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config LEDS_SIEMENS_SIMATIC_IPC
+	tristate "LED driver for Siemens Simatic IPCs"
+	depends on LEDS_CLASS
+	depends on SIEMENS_SIMATIC_IPC
+	help
+	  This option enables support for the LEDs of several Industrial PCs
+	  from Siemens.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called simatic-ipc-leds.
diff --git a/drivers/leds/simple/Makefile b/drivers/leds/simple/Makefile
new file mode 100644
index 000000000000..8481f1e9e360
--- /dev/null
+++ b/drivers/leds/simple/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
diff --git a/drivers/leds/simple/simatic-ipc-leds.c b/drivers/leds/simple/simatic-ipc-leds.c
new file mode 100644
index 000000000000..043edbf81b76
--- /dev/null
+++ b/drivers/leds/simple/simatic-ipc-leds.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Siemens SIMATIC IPC driver for LEDs
+ *
+ * Copyright (c) Siemens AG, 2018-2021
+ *
+ * Authors:
+ *  Henning Schild <henning.schild@siemens.com>
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
+ */
+
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_data/x86/simatic-ipc-base.h>
+#include <linux/platform_device.h>
+#include <linux/sizes.h>
+#include <linux/spinlock.h>
+
+#define SIMATIC_IPC_LED_PORT_BASE	0x404E
+
+struct simatic_ipc_led {
+	unsigned int value; /* mask for io and offset for mem */
+	char *name;
+	struct led_classdev cdev;
+};
+
+static struct simatic_ipc_led simatic_ipc_leds_io[] = {
+	{1 << 15, "green:" LED_FUNCTION_STATUS "-1" },
+	{1 << 7,  "yellow:" LED_FUNCTION_STATUS "-1" },
+	{1 << 14, "red:" LED_FUNCTION_STATUS "-2" },
+	{1 << 6,  "yellow:" LED_FUNCTION_STATUS "-2" },
+	{1 << 13, "red:" LED_FUNCTION_STATUS "-3" },
+	{1 << 5,  "yellow:" LED_FUNCTION_STATUS "-3" },
+	{ }
+};
+
+/* the actual start will be discovered with PCI, 0 is a placeholder */
+struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);
+
+static void *simatic_ipc_led_memory;
+
+static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
+	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
+	{0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
+	{0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
+	{0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
+	{0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
+	{0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
+	{ }
+};
+
+static struct resource simatic_ipc_led_io_res =
+	DEFINE_RES_IO_NAMED(SIMATIC_IPC_LED_PORT_BASE, SZ_1, KBUILD_MODNAME);
+
+static DEFINE_SPINLOCK(reg_lock);
+
+static inline struct simatic_ipc_led *cdev_to_led(struct led_classdev *led_cd)
+{
+	return container_of(led_cd, struct simatic_ipc_led, cdev);
+}
+
+static void simatic_ipc_led_set_io(struct led_classdev *led_cd,
+				   enum led_brightness brightness)
+{
+	struct simatic_ipc_led *led = cdev_to_led(led_cd);
+	unsigned long flags;
+	unsigned int val;
+
+	spin_lock_irqsave(&reg_lock, flags);
+
+	val = inw(SIMATIC_IPC_LED_PORT_BASE);
+	if (brightness == LED_OFF)
+		outw(val | led->value, SIMATIC_IPC_LED_PORT_BASE);
+	else
+		outw(val & ~led->value, SIMATIC_IPC_LED_PORT_BASE);
+
+	spin_unlock_irqrestore(&reg_lock, flags);
+}
+
+static enum led_brightness simatic_ipc_led_get_io(struct led_classdev *led_cd)
+{
+	struct simatic_ipc_led *led = cdev_to_led(led_cd);
+
+	return inw(SIMATIC_IPC_LED_PORT_BASE) & led->value ? LED_OFF : led_cd->max_brightness;
+}
+
+static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
+				    enum led_brightness brightness)
+{
+	struct simatic_ipc_led *led = cdev_to_led(led_cd);
+
+	u32 *p;
+
+	p = simatic_ipc_led_memory + led->value;
+	*p = (*p & ~1) | (brightness == LED_OFF);
+}
+
+static enum led_brightness simatic_ipc_led_get_mem(struct led_classdev *led_cd)
+{
+	struct simatic_ipc_led *led = cdev_to_led(led_cd);
+
+	u32 *p;
+
+	p = simatic_ipc_led_memory + led->value;
+	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
+}
+
+static int simatic_ipc_leds_probe(struct platform_device *pdev)
+{
+	const struct simatic_ipc_platform *plat = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct simatic_ipc_led *ipcled;
+	struct led_classdev *cdev;
+	struct resource *res;
+	int err, type;
+	u32 *p;
+
+	switch (plat->devmode) {
+	case SIMATIC_IPC_DEVICE_227D:
+	case SIMATIC_IPC_DEVICE_427E:
+		res = &simatic_ipc_led_io_res;
+		ipcled = simatic_ipc_leds_io;
+		/* on 227D the two bytes work the other way araound */
+		if (plat->devmode == SIMATIC_IPC_DEVICE_227D) {
+			while (ipcled->value) {
+				ipcled->value = swab16(ipcled->value);
+				ipcled++;
+			}
+			ipcled = simatic_ipc_leds_io;
+		}
+		type = IORESOURCE_IO;
+		if (!devm_request_region(dev, res->start, resource_size(res), KBUILD_MODNAME)) {
+			dev_err(dev, "Unable to register IO resource at %pR\n", res);
+			return -EBUSY;
+		}
+		break;
+	case SIMATIC_IPC_DEVICE_127E:
+		res = &simatic_ipc_led_mem_res;
+		ipcled = simatic_ipc_leds_mem;
+		type = IORESOURCE_MEM;
+
+		/* get GPIO base from PCI */
+		res->start = simatic_ipc_get_membase0(PCI_DEVFN(13, 0));
+		if (res->start == 0)
+			return -ENODEV;
+
+		/* do the final address calculation */
+		res->start = res->start + (0xC5 << 16);
+		res->end += res->start;
+
+		simatic_ipc_led_memory = devm_ioremap_resource(dev, res);
+		if (IS_ERR(simatic_ipc_led_memory))
+			return PTR_ERR(simatic_ipc_led_memory);
+
+		/* initialize power/watchdog LED */
+		p = simatic_ipc_led_memory + 0x500 + 0x1D8; /* PM_WDT_OUT */
+		*p = (*p & ~1);
+		p = simatic_ipc_led_memory + 0x500 + 0x1C0; /* PM_BIOS_BOOT_N */
+		*p = (*p | 1);
+
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	while (ipcled->value) {
+		cdev = &ipcled->cdev;
+		if (type == IORESOURCE_MEM) {
+			cdev->brightness_set = simatic_ipc_led_set_mem;
+			cdev->brightness_get = simatic_ipc_led_get_mem;
+		} else {
+			cdev->brightness_set = simatic_ipc_led_set_io;
+			cdev->brightness_get = simatic_ipc_led_get_io;
+		}
+		cdev->max_brightness = LED_ON;
+		cdev->name = ipcled->name;
+
+		err = devm_led_classdev_register(dev, cdev);
+		if (err < 0)
+			return err;
+		ipcled++;
+	}
+
+	return 0;
+}
+
+static struct platform_driver simatic_ipc_led_driver = {
+	.probe = simatic_ipc_leds_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+	}
+};
+
+module_platform_driver(simatic_ipc_led_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
-- 
2.26.3

