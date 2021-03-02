Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DC932B55C
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Mar 2021 08:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235449AbhCCG7o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 01:59:44 -0500
Received: from gecko.sbs.de ([194.138.37.40]:57470 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1579466AbhCBQ6j (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Mar 2021 11:58:39 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 122GmE6S021402
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 2 Mar 2021 17:48:14 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.44.113])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 122GXBHP025192;
        Tue, 2 Mar 2021 17:33:13 +0100
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
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH 2/4] leds: simatic-ipc-leds: add new driver for Siemens Industial PCs
Date:   Tue,  2 Mar 2021 17:33:07 +0100
Message-Id: <20210302163309.25528-3-henning.schild@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302163309.25528-1-henning.schild@siemens.com>
References: <20210302163309.25528-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Henning Schild <henning.schild@siemens.com>

This driver adds initial support for several devices from Siemens. It is
based on a platform driver introduced in an earlier commit.

Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/leds/Kconfig            |  11 ++
 drivers/leds/Makefile           |   1 +
 drivers/leds/simatic-ipc-leds.c | 224 ++++++++++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 drivers/leds/simatic-ipc-leds.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..3ee6fc613a0a 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -928,6 +928,17 @@ config LEDS_ACER_A500
 	  This option enables support for the Power Button LED of
 	  Acer Iconia Tab A500.
 
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
+
 comment "Flash and Torch LED drivers"
 source "drivers/leds/flash/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2a698df9da57..c15e1e3c5958 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
+obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/simatic-ipc-leds.c b/drivers/leds/simatic-ipc-leds.c
new file mode 100644
index 000000000000..760aef1d4ae1
--- /dev/null
+++ b/drivers/leds/simatic-ipc-leds.c
@@ -0,0 +1,224 @@
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
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/ioport.h>
+#include <linux/sizes.h>
+#include <linux/leds.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/platform_data/x86/simatic-ipc-base.h>
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
+	{1 << 15, "simatic-ipc:green:run-stop"},
+	{1 << 7,  "simatic-ipc:yellow:run-stop"},
+	{1 << 14, "simatic-ipc:red:error"},
+	{1 << 6,  "simatic-ipc:yellow:error"},
+	{1 << 13, "simatic-ipc:red:maint"},
+	{1 << 5,  "simatic-ipc:yellow:maint"},
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
+	{0x500 + 0x1A0, "simatic-ipc:red:run-stop"},
+	{0x500 + 0x1A8, "simatic-ipc:green:run-stop"},
+	{0x500 + 0x1C8, "simatic-ipc:red:error"},
+	{0x500 + 0x1D0, "simatic-ipc:green:error"},
+	{0x500 + 0x1E0, "simatic-ipc:red:maint"},
+	{0x500 + 0x198, "simatic-ipc:green:maint"},
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
+	struct device *dev = &pdev->dev;
+	struct led_classdev *cdev;
+	struct resource *res;
+	int err, type;
+	struct simatic_ipc_led *ipcled;
+	struct simatic_ipc_platform *plat;
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
+		if (!simatic_ipc_led_memory)
+			return -ENOMEM;
+
+		/* initialize power/watchdog LED */
+		p = simatic_ipc_led_memory + 0x500 + 0x1D8; // PM_WDT_OUT
+		*p = (*p & ~1);
+		p = simatic_ipc_led_memory + 0x500 + 0x1C0; // PM_BIOS_BOOT_N
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
+static int __init simatic_ipc_led_init_module(void)
+{
+	return platform_driver_register(&led_driver);
+}
+
+static void simatic_ipc_led_exit_module(void)
+{
+	platform_driver_unregister(&led_driver);
+}
+
+module_init(simatic_ipc_led_init_module);
+module_exit(simatic_ipc_led_exit_module);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
-- 
2.26.2

