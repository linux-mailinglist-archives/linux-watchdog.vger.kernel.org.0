Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178C45B85A7
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Sep 2022 11:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiINJyu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Sep 2022 05:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbiINJyI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Sep 2022 05:54:08 -0400
X-Greylist: delayed 379 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Sep 2022 02:53:25 PDT
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A542778238
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Sep 2022 02:53:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTP id 1973B16550;
        Wed, 14 Sep 2022 11:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elsoft.ch; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :x-mailer:message-id:date:date:subject:subject:from:from
        :received:received; s=sel2011a; t=1663148823; bh=LqxF1mFReX+HH69
        peUUUz0fMCeEif6/D6lgQREso6+s=; b=2vn2zbzpjT/kOmM3cV/f0kAw0eL3HS+
        QIuwArSzODfcs9xky4EOJmNDhzWq8UgUJsMfJL4qQ7UsdV7iiI74nqnkYV2irFug
        bAFJVCJKIAoo63ikXh8LknUcb50szjGOfx/jgHkgspBgoPtlQnJB2IwLouw8Mr9N
        Ann+n8ocVXQo=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
        by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
        with ESMTP id 9Of3_OnecNOt; Wed, 14 Sep 2022 11:47:03 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.hostpark.net (Postfix) with ESMTPSA id CD07316479;
        Wed, 14 Sep 2022 11:47:00 +0200 (CEST)
From:   =?UTF-8?q?David=20M=C3=BCller?= <d.mueller@elsoft.ch>
To:     linux-watchdog@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3] watchdog: Exar/MaxLinear XR28V38x driver
Date:   Wed, 14 Sep 2022 11:46:05 +0200
Message-Id: <20220914094605.93377-1-d.mueller@elsoft.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

v3:
 - fix typo in comment
 - use scnprintf()

v2:
 - removed pointless comments and debug output, fix and improve others
 - removed checks already done by framework
 - update hardware if new timeout value is set and watchdog is active
 - separate init, probe and config code parts
 - create watchdog devices for all active hardware instances

 drivers/watchdog/Kconfig    |  11 +
 drivers/watchdog/Makefile   |   1 +
 drivers/watchdog/exar_wdt.c | 427 ++++++++++++++++++++++++++++++++++++
 3 files changed, 439 insertions(+)
 create mode 100644 drivers/watchdog/exar_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9295492d24f7..72d8c3dc984b 100644
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
index cdeb119e6e61..d41e5f830ae7 100644
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
index 000000000000..35058d8b21bc
--- /dev/null
+++ b/drivers/watchdog/exar_wdt.c
@@ -0,0 +1,427 @@
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
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/watchdog.h>
+
+#define DRV_NAME	"exar_wdt"
+
+static const unsigned short sio_config_ports[] = { 0x2e, 0x4e };
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
+#define EXAR_WDT_LDEV	0x08
+
+#define EXAR_VEN_ID	0x13A8
+#define EXAR_DEV_382	0x0382
+#define EXAR_DEV_384	0x0384
+
+/* WDT runtime registers */
+#define WDT_CTRL	0x00
+#define WDT_VAL		0x01
+
+#define WDT_UNITS_10MS	0x0	/* the 10 millisec unit of the HW is not used */
+#define WDT_UNITS_SEC	0x2
+#define WDT_UNITS_MIN	0x4
+
+/* default WDT control for WDTOUT signal activ / rearm by read */
+#define EXAR_WDT_DEF_CONF	0
+
+struct wdt_pdev_node {
+	struct list_head list;
+	struct platform_device *pdev;
+	const char name[16];
+};
+
+struct wdt_priv {
+	/* the lock for WDT io operations */
+	spinlock_t io_lock;
+	struct resource wdt_res;
+	struct watchdog_device wdt_dev;
+	unsigned short did;
+	unsigned short config_port;
+	unsigned char enter_key;
+	unsigned char unit;
+	unsigned char timeout;
+};
+
+#define WATCHDOG_TIMEOUT 60
+
+static int timeout = WATCHDOG_TIMEOUT;
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
+	unsigned char msb, lsb;
+
+	msb = exar_sio_read(config_port, reg);
+	lsb = exar_sio_read(config_port, reg + 1);
+
+	return (msb << 8) | lsb;
+}
+
+static void exar_sio_select_wdt(const unsigned short config_port)
+{
+	exar_sio_write(config_port, EXAR_LDN, EXAR_WDT_LDEV);
+}
+
+static void exar_wdt_arm(const struct wdt_priv *priv)
+{
+	unsigned short rt_base = priv->wdt_res.start;
+
+	/* write timeout value twice to arm watchdog */
+	outb(priv->timeout, rt_base + WDT_VAL);
+	outb(priv->timeout, rt_base + WDT_VAL);
+}
+
+static void exar_wdt_disarm(const struct wdt_priv *priv)
+{
+	unsigned short rt_base = priv->wdt_res.start;
+
+	/*
+	 * use two accesses with different values to make sure
+	 * that a combination of a previous single access and
+	 * the ones below with the same value are not falsely
+	 * interpreted as "arm watchdog"
+	 */
+	outb(0xFF, rt_base + WDT_VAL);
+	outb(0, rt_base + WDT_VAL);
+}
+
+static int exar_wdt_start(struct watchdog_device *wdog)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+	unsigned short rt_base = priv->wdt_res.start;
+
+	spin_lock(&priv->io_lock);
+
+	exar_wdt_disarm(priv);
+	outb(priv->unit, rt_base + WDT_CTRL);
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
+	exar_wdt_disarm(priv);
+
+	spin_unlock(&priv->io_lock);
+	return 0;
+}
+
+static int exar_wdt_keepalive(struct watchdog_device *wdog)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+	unsigned short rt_base = priv->wdt_res.start;
+
+	spin_lock(&priv->io_lock);
+
+	/* reading the WDT_VAL reg will feed the watchdog */
+	inb(rt_base + WDT_VAL);
+
+	spin_unlock(&priv->io_lock);
+	return 0;
+}
+
+static int exar_wdt_set_timeout(struct watchdog_device *wdog, unsigned int t)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+	bool unit_min = false;
+
+	/*
+	 * if new timeout is bigger then 255 seconds, change the
+	 * unit to minutes and round the timeout up to the next whole minute
+	 */
+	if (t > 255) {
+		unit_min = true;
+		t = DIV_ROUND_UP(t, 60);
+	}
+
+	/* save for later use in exar_wdt_start() */
+	priv->unit = unit_min ? WDT_UNITS_MIN : WDT_UNITS_SEC;
+	priv->timeout = t;
+
+	wdog->timeout = unit_min ? t * 60 : t;
+
+	if (watchdog_hw_running(wdog))
+		exar_wdt_start(wdog);
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
+static int exar_wdt_config(struct watchdog_device *wdog,
+			   const unsigned char conf)
+{
+	struct wdt_priv *priv = watchdog_get_drvdata(wdog);
+	int ret;
+
+	ret = exar_sio_enter(priv->config_port, priv->enter_key);
+	if (ret)
+		return ret;
+
+	exar_sio_select_wdt(priv->config_port);
+	exar_sio_write(priv->config_port, EXAR_WDT, conf);
+
+	exar_sio_exit(priv->config_port);
+
+	return 0;
+}
+
+static int __init exar_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wdt_priv *priv = dev->platform_data;
+	struct watchdog_device *wdt_dev = &priv->wdt_dev;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!res)
+		return -ENXIO;
+
+	spin_lock_init(&priv->io_lock);
+
+	wdt_dev->info = &exar_wdt_info;
+	wdt_dev->ops = &exar_wdt_ops;
+	wdt_dev->min_timeout = 1;
+	wdt_dev->max_timeout = 255 * 60;
+
+	watchdog_init_timeout(wdt_dev, timeout, NULL);
+	watchdog_set_nowayout(wdt_dev, nowayout);
+	watchdog_stop_on_reboot(wdt_dev);
+	watchdog_stop_on_unregister(wdt_dev);
+	watchdog_set_drvdata(wdt_dev, priv);
+
+	ret = exar_wdt_config(wdt_dev, EXAR_WDT_DEF_CONF);
+	if (ret)
+		return ret;
+
+	exar_wdt_set_timeout(wdt_dev, timeout);
+	/* Make sure that the watchdog is not running */
+	exar_wdt_stop(wdt_dev);
+
+	ret = devm_watchdog_register_device(dev, wdt_dev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "XR28V%X WDT initialized. timeout=%d sec (nowayout=%d)\n",
+		 priv->did, timeout, nowayout);
+
+	return 0;
+}
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
+	if (ret)
+		return 0;
+
+	vid = exar_sio_read16(config_port, EXAR_VID);
+	did = exar_sio_read16(config_port, EXAR_DID);
+
+	/* check for the vendor and device IDs we currently know about */
+	if (vid == EXAR_VEN_ID &&
+	    (did == EXAR_DEV_382 ||
+	     did == EXAR_DEV_384)) {
+		exar_sio_select_wdt(config_port);
+		/* is device active? */
+		if (exar_sio_read(config_port, EXAR_ACT) == 0x01)
+			base = exar_sio_read16(config_port, EXAR_RTBASE);
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
+static struct platform_driver exar_wdt_driver = {
+	.driver = {
+		.name = DRV_NAME,
+	},
+};
+
+static LIST_HEAD(pdev_list);
+
+static int __init exar_wdt_register(struct wdt_priv *priv, const int idx)
+{
+	struct wdt_pdev_node *n;
+
+	n = kzalloc(sizeof(*n), GFP_KERNEL);
+	if (!n)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&n->list);
+
+	scnprintf((char *)n->name, sizeof(n->name), DRV_NAME ".%d", idx);
+	priv->wdt_res.name = n->name;
+
+	n->pdev = platform_device_register_resndata(NULL, DRV_NAME, idx,
+						    &priv->wdt_res, 1,
+						    priv, sizeof(*priv));
+	if (IS_ERR(n->pdev)) {
+		kfree(n);
+		return PTR_ERR(n->pdev);
+	}
+
+	list_add_tail(&n->list, &pdev_list);
+
+	return 0;
+}
+
+static void exar_wdt_unregister(void)
+{
+	struct wdt_pdev_node *n, *t;
+
+	list_for_each_entry_safe(n, t, &pdev_list, list) {
+		platform_device_unregister(n->pdev);
+		list_del(&n->list);
+		kfree(n);
+	}
+}
+
+static int __init exar_wdt_init(void)
+{
+	int ret, i, j, idx = 0;
+
+	/* search for active Exar watchdogs on all possible locations */
+	for (i = 0; i < ARRAY_SIZE(sio_config_ports); i++) {
+		for (j = 0; j < ARRAY_SIZE(sio_enter_keys); j++) {
+			unsigned short did, rt_base = 0;
+
+			did = exar_detect(sio_config_ports[i],
+					  sio_enter_keys[j],
+					  &rt_base);
+
+			if (did) {
+				struct wdt_priv priv = {
+					.wdt_res = DEFINE_RES_IO(rt_base, 2),
+					.did = did,
+					.config_port = sio_config_ports[i],
+					.enter_key = sio_enter_keys[j],
+				};
+
+				ret = exar_wdt_register(&priv, idx);
+				if (!ret)
+					idx++;
+			}
+		}
+	}
+
+	if (!idx)
+		return -ENODEV;
+
+	ret = platform_driver_probe(&exar_wdt_driver, exar_wdt_probe);
+	if (ret)
+		exar_wdt_unregister();
+
+	return ret;
+}
+
+static void __exit exar_wdt_exit(void)
+{
+	exar_wdt_unregister();
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

