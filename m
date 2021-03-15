Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406A133AF5D
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 10:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCOJ55 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 05:57:57 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:60549 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229624AbhCOJ5p (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 05:57:45 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12F9vHpg028559
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Mar 2021 10:57:17 +0100
Received: from localhost.localdomain ([139.22.41.172])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12F9vFdu002444;
        Mon, 15 Mar 2021 10:57:17 +0100
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
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
Date:   Mon, 15 Mar 2021 10:57:08 +0100
Message-Id: <20210315095710.7140-3-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315095710.7140-1-henning.schild@siemens.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
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
 drivers/leds/simple/simatic-ipc-leds.c | 210 +++++++++++++++++++++++++
 5 files changed, 229 insertions(+)
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
index 000000000000..0f7e6320e10d
--- /dev/null
+++ b/drivers/leds/simple/simatic-ipc-leds.c
@@ -0,0 +1,210 @@
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
+	char name[32];
+	struct led_classdev cdev;
+};
+
+static struct simatic_ipc_led simatic_ipc_leds_io[] = {
+	{1 << 15, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1" },
+	{1 << 7,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-1" },
+	{1 << 14, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2" },
+	{1 << 6,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-2" },
+	{1 << 13, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3" },
+	{1 << 5,  "simatic-ipc:yellow:" LED_FUNCTION_STATUS "-3" },
+	{0, ""},
+};
+
+/* the actual start will be discovered with pci, 0 is a placeholder */
+struct resource simatic_ipc_led_mem_res =
+	DEFINE_RES_MEM_NAMED(0, SZ_4K, KBUILD_MODNAME);
+
+static void *simatic_ipc_led_memory;
+
+static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
+	{0x500 + 0x1A0, "simatic-ipc:red:" LED_FUNCTION_STATUS "-1"},
+	{0x500 + 0x1A8, "simatic-ipc:green:" LED_FUNCTION_STATUS "-1"},
+	{0x500 + 0x1C8, "simatic-ipc:red:" LED_FUNCTION_STATUS "-2"},
+	{0x500 + 0x1D0, "simatic-ipc:green:" LED_FUNCTION_STATUS "-2"},
+	{0x500 + 0x1E0, "simatic-ipc:red:" LED_FUNCTION_STATUS "-3"},
+	{0x500 + 0x198, "simatic-ipc:green:" LED_FUNCTION_STATUS "-3"},
+	{0, ""},
+};
+
+static struct resource simatic_ipc_led_io_res =
+	DEFINE_RES_IO_NAMED(SIMATIC_IPC_LED_PORT_BASE, SZ_1, KBUILD_MODNAME);
+
+static DEFINE_SPINLOCK(reg_lock);
+
+static void simatic_ipc_led_set_io(struct led_classdev *led_cd,
+				   enum led_brightness brightness)
+{
+	struct simatic_ipc_led *led =
+		container_of(led_cd, struct simatic_ipc_led, cdev);
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
+	struct simatic_ipc_led *led =
+		container_of(led_cd, struct simatic_ipc_led, cdev);
+
+	return inw(SIMATIC_IPC_LED_PORT_BASE) & led->value ?
+		LED_OFF : led_cd->max_brightness;
+}
+
+static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
+				    enum led_brightness brightness)
+{
+	struct simatic_ipc_led *led =
+		container_of(led_cd, struct simatic_ipc_led, cdev);
+
+	u32 *p;
+
+	p = simatic_ipc_led_memory + led->value;
+	*p = (*p & ~1) | (brightness == LED_OFF);
+}
+
+static enum led_brightness simatic_ipc_led_get_mem(struct led_classdev *led_cd)
+{
+	struct simatic_ipc_led *led =
+		container_of(led_cd, struct simatic_ipc_led, cdev);
+
+	u32 *p;
+
+	p = simatic_ipc_led_memory + led->value;
+	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
+}
+
+static int simatic_ipc_leds_probe(struct platform_device *pdev)
+{
+	struct simatic_ipc_platform *plat;
+	struct device *dev = &pdev->dev;
+	struct simatic_ipc_led *ipcled;
+	struct led_classdev *cdev;
+	struct resource *res;
+	int err, type;
+	u32 *p;
+
+	plat = pdev->dev.platform_data;
+
+	switch (plat->devmode) {
+	case SIMATIC_IPC_DEVICE_227D:
+	case SIMATIC_IPC_DEVICE_427E:
+		res = &simatic_ipc_led_io_res;
+		ipcled = simatic_ipc_leds_io;
+		/* the 227D is high on while 427E is low on, invert the struct
+		 * we have
+		 */
+		if (plat->devmode == SIMATIC_IPC_DEVICE_227D) {
+			while (ipcled->value) {
+				ipcled->value = swab16(ipcled->value);
+				ipcled++;
+			}
+			ipcled = simatic_ipc_leds_io;
+		}
+		type = IORESOURCE_IO;
+		if (!devm_request_region(dev, res->start,
+					 resource_size(res),
+					 KBUILD_MODNAME)) {
+			dev_err(dev,
+				"Unable to register IO resource at %pR\n",
+				res);
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
+		cdev->brightness_set = simatic_ipc_led_set_io;
+		cdev->brightness_get = simatic_ipc_led_get_io;
+		if (type == IORESOURCE_MEM) {
+			cdev->brightness_set = simatic_ipc_led_set_mem;
+			cdev->brightness_get = simatic_ipc_led_get_mem;
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
+static struct platform_driver led_driver = {
+	.probe = simatic_ipc_leds_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+	},
+};
+
+module_platform_driver(led_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
-- 
2.26.2

