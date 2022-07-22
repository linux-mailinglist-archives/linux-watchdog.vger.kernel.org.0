Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCFD157DF01
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jul 2022 12:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiGVKBG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jul 2022 06:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbiGVKBG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jul 2022 06:01:06 -0400
X-Greylist: delayed 567 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 22 Jul 2022 03:01:03 PDT
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD73A186FD
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Jul 2022 03:01:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTP id 1291916605
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Jul 2022 11:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elsoft.ch; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :x-mailer:message-id:date:date:subject:subject:from:from
        :received:received; s=sel2011a; t=1658483493; bh=gRBPZMRsCpZD7rF
        mI1bPxO21mfOcwmMlZ/0YfuzYzVE=; b=xue/3DgPTOJhbJp4WiJFvL2LbRB8v+X
        JyCLZzahWwOs0q5A9XZXze0f5x8Rt/wzTVoE2+zjb/zSAQdhmPJl7qm8pTZbrejX
        bulgLB8TKp8uOCpa9vBdVZ2iusgsHtbKwI6CS8GVbbfEcFdn/9DSZGVdrRJcdpyD
        tHEZ4x4EQkYg=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
        by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
        with ESMTP id VLadbgmLvlYN for <linux-watchdog@vger.kernel.org>;
        Fri, 22 Jul 2022 11:51:33 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.hostpark.net (Postfix) with ESMTPSA id D59D0165D1
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Jul 2022 11:51:30 +0200 (CEST)
From:   =?UTF-8?q?David=20M=C3=BCller?= <d.mueller@elsoft.ch>
To:     linux-watchdog@vger.kernel.org
Subject: [RFC] [PATCH] watchdog: Exar/MaxLinear XR28V38x driver
Date:   Fri, 22 Jul 2022 11:51:04 +0200
Message-Id: <20220722095104.74635-1-d.mueller@elsoft.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Simple driver for the watchdog present in some Exar/MaxLinear UART chips.
Please see https://www.maxlinear.com/product/interface/uarts/lpc-uarts/xr28v384
for more info.

Signed-off-by: David Müller <d.mueller@elsoft.ch>
---
 drivers/watchdog/Kconfig    |  11 ++
 drivers/watchdog/Makefile   |   1 +
 drivers/watchdog/exar_wdt.c | 364 ++++++++++++++++++++++++++++++++++++
 3 files changed, 376 insertions(+)
 create mode 100644 drivers/watchdog/exar_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 32fd37698932..5849c066609c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1089,6 +1089,17 @@ config EBC_C384_WDT
 	  WinSystems EBC-C384 motherboard. The timeout may be configured via
 	  the timeout module parameter.
 
+config EXAR_WDT
+	tristate "Exar Watchdog Timer"
+	depends on X86
+	select WATCHDOG_CORE
+	help
+	  Enables watchdog timer support for the watchdog timer present
+	  in some Exar/MaxLinear UART chips like the XR28V38x.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called exar_wdt.
+
 config F71808E_WDT
 	tristate "Fintek F718xx, F818xx Super I/O Watchdog"
 	depends on X86
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index c324e9d820e9..31b9bdb47b4e 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_ADVANTECH_WDT) += advantechwdt.o
 obj-$(CONFIG_ALIM1535_WDT) += alim1535_wdt.o
 obj-$(CONFIG_ALIM7101_WDT) += alim7101_wdt.o
 obj-$(CONFIG_EBC_C384_WDT) += ebc-c384_wdt.o
+obj-$(CONFIG_EXAR_WDT) += exar_wdt.o
 obj-$(CONFIG_F71808E_WDT) += f71808e_wdt.o
 obj-$(CONFIG_SP5100_TCO) += sp5100_tco.o
 obj-$(CONFIG_GEODE_WDT) += geodewdt.o
diff --git a/drivers/watchdog/exar_wdt.c b/drivers/watchdog/exar_wdt.c
new file mode 100644
index 000000000000..1adf25bf2bc6
--- /dev/null
+++ b/drivers/watchdog/exar_wdt.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *	exar_wdt.c - Driver for the watchdog present in some
+ *		     Exar/MaxLinear UART chips like the XR28V38x.
+ *
+ *	(c) Copyright 2022 D. Müller <d.mueller@elsoft.ch>.
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+/* Includes */
+#include <linux/io.h>			/* For inb() / outb() */
+#include <linux/module.h>		/* For module specific items */
+#include <linux/platform_device.h>	/* For platform_driver framework */
+#include <linux/watchdog.h>		/* For the watchdog specific items */
+
+#define DRV_NAME	"exar_wdt"
+
+/* SIO definitions */
+static const unsigned short sio_config_ports[] = { 0x2e, 0x4e };
+/* there are 4 possible SIO enter keys */
+static const unsigned char sio_enter_keys[] = { 0x67, 0x77, 0x87, 0xA0 };
+#define EXAR_EXIT_KEY	0xAA
+
+#define EXAR_LDN	0x07
+#define EXAR_DID	0x20
+#define EXAR_VID	0x23
+#define EXAR_WDT	0x26
+#define EXAR_ACT	0x30
+#define EXAR_RTBASE	0x60
+
+/* WDT runtime registers */
+#define WDT_CTRL	0x00
+#define WDT_VAL		0x01
+/* the millisec feature is not supported */
+#define WDT_UNITS_SEC	BIT(1)
+#define WDT_UNITS_MIN	BIT(2)
+
+/* The devices private data */
+struct wdt_priv {
+	/* parent device */
+	struct platform_device *pdev;
+	/* the lock for WDT io operations */
+	spinlock_t io_lock;
+	/* the base address of the WDT runtime registers */
+	unsigned short rt_base;
+	/* pre-computed timeout values */
+	unsigned char unit;
+	unsigned char timeout;
+};
+
+/* Module parameters */
+#define WATCHDOG_TIMEOUT 60		/* 60 sec default timeout */
+static int timeout = WATCHDOG_TIMEOUT;	/* in seconds */
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout,
+		 "Watchdog timeout in seconds. 1<=timeout<=15300, default="
+		 __MODULE_STRING(WATCHDOG_TIMEOUT) ".");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		 "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+/* internal variables */
+static struct platform_device *exar_wdt_pdev;
+
+/* "Super-IO" functions */
+
+static int exar_sio_enter(const unsigned short config_port,
+			  const unsigned char key)
+{
+	if (!request_muxed_region(config_port, 2, DRV_NAME))
+		return -EBUSY;
+
+	/* write the ENTER-KEY twice */
+	outb(key, config_port);
+	outb(key, config_port);
+
+	return 0;
+}
+
+static void exar_sio_exit(const unsigned short config_port)
+{
+	outb(EXAR_EXIT_KEY, config_port);
+	release_region(config_port, 2);
+}
+
+static unsigned char exar_sio_read(const unsigned short config_port,
+				   const unsigned char reg)
+{
+	outb(reg, config_port);
+	return inb(config_port + 1);
+}
+
+static void exar_sio_write(const unsigned short config_port,
+			   const unsigned char reg, const unsigned char val)
+{
+	outb(reg, config_port);
+	outb(val, config_port + 1);
+}
+
+static unsigned short exar_sio_read16(const unsigned short config_port,
+				      const unsigned char reg)
+{
+	unsigned short val;
+
+	/* read the MSB */
+	val = exar_sio_read(config_port, reg);
+
+	/* read and merge in the LSB */
+	val = (val << 8) | exar_sio_read(config_port, reg + 1);
+
+	return val;
+}
+
+/* WDT internal functions */
+
+static void exar_wdt_arm(const struct wdt_priv *priv)
+{
+	/* write timeout value twice to arm watchdog */
+	outb(priv->timeout, priv->rt_base + WDT_VAL);
+	outb(priv->timeout, priv->rt_base + WDT_VAL);
+}
+
+static void exar_wdt_disarm(const struct wdt_priv *priv)
+{
+	outb(0xFF, priv->rt_base + WDT_VAL);
+	outb(0, priv->rt_base + WDT_VAL);
+}
+
+/* Watchdog Operations */
+
+static int exar_wdt_start(struct watchdog_device *wdog)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+
+	spin_lock(&priv->io_lock);
+
+	/* disable watchdog */
+	exar_wdt_disarm(priv);
+
+	/* program timeout unit */
+	outb(priv->unit, priv->rt_base + WDT_CTRL);
+	/* and arm watchdog */
+	exar_wdt_arm(priv);
+
+	spin_unlock(&priv->io_lock);
+	return 0;
+}
+
+static int exar_wdt_stop(struct watchdog_device *wdog)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+
+	spin_lock(&priv->io_lock);
+
+	/* disarm watchdog */
+	exar_wdt_disarm(priv);
+
+	spin_unlock(&priv->io_lock);
+	return 0;
+}
+
+static int exar_wdt_keepalive(struct watchdog_device *wdog)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+
+	spin_lock(&priv->io_lock);
+
+	/* reading the WDT_VAL reg will feed the watchdog */
+	inb(priv->rt_base + WDT_VAL);
+
+	spin_unlock(&priv->io_lock);
+	return 0;
+}
+
+static int exar_wdt_set_timeout(struct watchdog_device *wdog, unsigned int t)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+	unsigned char timeout_unit = WDT_UNITS_SEC;
+
+	if (watchdog_timeout_invalid(wdog, t))
+		return -EINVAL;
+
+	/*
+	 * if new timeout is bigger then 255 seconds, change the
+	 * unit to minutes and round the timeout up to the next whole minute
+	 */
+	if (t > 255) {
+		timeout_unit = WDT_UNITS_MIN;
+		t = DIV_ROUND_UP(t, 60);
+	}
+
+	/* save for later use in exar_wdt_start() */
+	priv->unit = timeout_unit;
+	priv->timeout = t;
+
+	wdog->timeout = (timeout_unit == WDT_UNITS_MIN) ? t * 60 : t;
+
+	return 0;
+}
+
+static const struct watchdog_info exar_wdt_info = {
+	.options	= WDIOF_KEEPALIVEPING |
+			  WDIOF_SETTIMEOUT |
+			  WDIOF_MAGICCLOSE,
+	.identity	= "Exar/MaxLinear XR28V38x Watchdog",
+};
+
+static const struct watchdog_ops exar_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= exar_wdt_start,
+	.stop		= exar_wdt_stop,
+	.ping		= exar_wdt_keepalive,
+	.set_timeout	= exar_wdt_set_timeout,
+};
+
+static struct watchdog_device wdt_dev = {
+	.info = &exar_wdt_info,
+	.ops = &exar_wdt_ops,
+	.min_timeout = 1,
+	.max_timeout = 255 * 60,
+};
+
+static unsigned short __init exar_detect(const unsigned short config_port,
+					 const unsigned char key,
+					 unsigned short *rt_base)
+{
+	int ret;
+	unsigned short base = 0;
+	unsigned short vid, did;
+
+	ret = exar_sio_enter(config_port, key);
+	if (ret) {
+		pr_info("config space unavailable\n (err: %d", ret);
+		return 0;
+	}
+
+	vid = exar_sio_read16(config_port, EXAR_VID);
+	did = exar_sio_read16(config_port, EXAR_DID);
+
+	/* check for the vendor and device IDs we currently know about */
+	if (vid == 0x13A8 &&		/* vendor Exar/MaxLinar */
+	    (did == 0x0382 ||		/* UART XR28V382 */
+	     did == 0x0384)) {		/* UART XR28V384 */
+		/* set LD config reg to WDT device (8) */
+		exar_sio_write(config_port, EXAR_LDN, 8);
+		/* is device active? */
+		if (exar_sio_read(config_port, EXAR_ACT) == 0x01) {
+			/* get the WDT runtime registers base address*/
+			base = exar_sio_read16(config_port, EXAR_RTBASE);
+
+			/* set global WDT control to
+			 * assert WDTOUT / rearm by read
+			 */
+			exar_sio_write(config_port, EXAR_WDT, 0);
+		}
+	}
+
+	exar_sio_exit(config_port);
+
+	if (base) {
+		pr_debug("Found a XR28V%X WDT (conf: 0x%x / rt: 0x%04x)\n",
+			 did, config_port, base);
+		*rt_base = base;
+		return did;
+	}
+
+	return 0;
+}
+
+static int __init exar_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wdt_priv *priv;
+	int ret, i, j;
+	unsigned short did = 0, rt_base = 0;
+
+	/* search for the first active Exar WDT on all possible locations */
+	for (i = 0; !did && (i < ARRAY_SIZE(sio_config_ports)); i++) {
+		for (j = 0; !did && (j < ARRAY_SIZE(sio_enter_keys)); j++)
+			did = exar_detect(sio_config_ports[i],
+					  sio_enter_keys[j],
+					  &rt_base);
+	}
+
+	if (!did)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->io_lock);
+	priv->pdev = pdev;
+	priv->rt_base = rt_base;
+
+	if (watchdog_timeout_invalid(&wdt_dev, timeout))
+		/* invalid timeout specified, reset to default */
+		timeout = WATCHDOG_TIMEOUT;
+
+	watchdog_init_timeout(&wdt_dev, timeout, NULL);
+	watchdog_set_nowayout(&wdt_dev, nowayout);
+	watchdog_stop_on_reboot(&wdt_dev);
+	watchdog_stop_on_unregister(&wdt_dev);
+	watchdog_set_drvdata(&wdt_dev, priv);
+
+	if (!devm_request_region(dev,
+				 priv->rt_base + WDT_CTRL, 2, DRV_NAME)) {
+		dev_err(dev, "failed to request region 0x%04x-0x%04x.\n",
+			priv->rt_base + WDT_CTRL, priv->rt_base + WDT_VAL);
+		return -EBUSY;
+	}
+
+	exar_wdt_set_timeout(&wdt_dev, timeout);
+	/* Make sure that the watchdog is not running */
+	exar_wdt_stop(&wdt_dev);
+
+	ret = devm_watchdog_register_device(dev, &wdt_dev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "XR28V%X WDT initialized. timeout=%d sec (nowayout=%d)\n",
+		 did, timeout, nowayout);
+
+	return 0;
+}
+
+static struct platform_driver exar_wdt_driver = {
+	.driver = {
+		.name = DRV_NAME,
+	},
+};
+
+static int __init exar_wdt_init(void)
+{
+	int ret;
+
+	exar_wdt_pdev = platform_device_register_simple(DRV_NAME, -1, NULL, 0);
+	if (IS_ERR(exar_wdt_pdev))
+		return PTR_ERR(exar_wdt_pdev);
+
+	ret = platform_driver_probe(&exar_wdt_driver, exar_wdt_probe);
+	if (ret)
+		platform_device_unregister(exar_wdt_pdev);
+
+	return ret;
+}
+
+static void __exit exar_wdt_exit(void)
+{
+	platform_device_unregister(exar_wdt_pdev);
+	platform_driver_unregister(&exar_wdt_driver);
+}
+
+module_init(exar_wdt_init);
+module_exit(exar_wdt_exit);
+
+MODULE_AUTHOR("David Müller <d.mueller@elsoft.ch>");
+MODULE_DESCRIPTION("Exar/MaxLinear Watchdog Driver");
+MODULE_LICENSE("GPL");
-- 
2.30.2

