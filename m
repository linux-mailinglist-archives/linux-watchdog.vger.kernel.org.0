Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319BF2FA01D
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 13:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404217AbhARMlJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 07:41:09 -0500
Received: from aclms3.advantech.com.tw ([125.252.70.86]:57706 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404147AbhARMkr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 07:40:47 -0500
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te423a1714fac1401c812dc@ACLMS4.ADVANTECH.CORP>;
 Mon, 18 Jan 2021 20:38:46 +0800
Received: from localhost (172.16.12.146) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 20:39:01 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v6 6/6] watchdog: ahc1ec0-wdt: Add sub-device watchdog for Advantech embedded controller
Date:   Mon, 18 Jan 2021 20:37:49 +0800
Message-ID: <20210118123749.4769-6-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210118123749.4769-1-campion.kang@advantech.com.tw>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.12.146]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: CE6D4BFE29C6B1349ADD14CA04192102ABFADF1D27100920852D4F69D64D178F2000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is one of sub-device driver for Advantech embedded controller
AHC1EC0. This driver provide watchdog functionality for Advantech
related applications to restart the system.

Changed since V5:
	- remove unnecessary header files
	- bug fixed: reboot halt if watchdog enabled
	- Kconfig: add "AHC1EC0" string to clearly define the EC name

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 drivers/watchdog/Kconfig       |  11 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/ahc1ec0-wdt.c | 261 +++++++++++++++++++++++++++++++++
 3 files changed, 273 insertions(+)
 create mode 100644 drivers/watchdog/ahc1ec0-wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7ff941e71b79..1a27836883ac 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1636,6 +1636,17 @@ config NIC7018_WDT
 	  To compile this driver as a module, choose M here: the module will be
 	  called nic7018_wdt.
 
+config AHC1EC0_WDT
+	tristate "Advantech AHC1EC0 Watchdog Function"
+	depends on MFD_AHC1EC0
+	help
+	  This is sub-device for Advantech AHC1EC0 embedded controller.
+
+	  This driver provide watchdog functionality for Advantech related
+	  applications to restart the system.
+	  To compile thie driver as a module, choose M here: the module will be
+	  called ahc1ec0-wdt.
+
 # M68K Architecture
 
 config M54xx_WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 5c74ee19d441..7190811b1e50 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_INTEL_MID_WATCHDOG) += intel-mid_wdt.o
 obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
 obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
 obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
+obj-$(CONFIG_AHC1EC0_WDT) += ahc1ec0-wdt.o
 obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
 
 # M68K Architecture
diff --git a/drivers/watchdog/ahc1ec0-wdt.c b/drivers/watchdog/ahc1ec0-wdt.c
new file mode 100644
index 000000000000..4497b6106b24
--- /dev/null
+++ b/drivers/watchdog/ahc1ec0-wdt.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Watchdog Driver for Advantech Embedded Controller chip AHC1EC0
+ *
+ * Copyright 2020, Advantech IIoT Group
+ *
+ */
+
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mfd/ahc1ec0.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#define DRV_NAME      "ahc1ec0-wdt"
+
+struct ec_wdt_data {
+	struct watchdog_device wdtdev;
+	struct adv_ec_platform_data *adv_ec_data;
+	struct notifier_block reboot_nb;
+	struct mutex lock_ioctl;
+	int is_enable;
+	int current_timeout;
+};
+
+#define EC_WDT_MIN_TIMEOUT 1	/* The watchdog devices minimum timeout value (in seconds). */
+#define EC_WDT_MAX_TIMEOUT 600  /* The watchdog devices maximum timeout value (in seconds) */
+#define EC_WDT_DEFAULT_TIMEOUT 45
+
+static int set_delay(struct adv_ec_platform_data *adv_ec_data, unsigned short delay_timeout_in_ms)
+{
+	if (write_hw_ram(adv_ec_data, EC_RESET_DELAY_TIME_L, delay_timeout_in_ms & 0x00FF)) {
+		pr_err("Failed to set Watchdog Retset Time Low byte.");
+		return -EINVAL;
+	}
+
+	if (write_hw_ram(adv_ec_data, EC_RESET_DELAY_TIME_H, (delay_timeout_in_ms & 0xFF00) >> 8)) {
+		pr_err("Failed to set Watchdog Retset Time Hight byte.");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int advwdt_set_heartbeat(unsigned long t)
+{
+	if (t < 1 || t > 6553) {
+		pr_err("%s: the input timeout is out of range.",  __func__);
+		pr_err("Please choose valid data between 1 ~ 6553.");
+		return -EINVAL;
+	}
+
+	return (t * 10);
+}
+
+/* Notifier for system down */
+static int advwdt_notify_sys(struct notifier_block *nb, unsigned long code, void *data)
+{
+	if (code == SYS_DOWN || code == SYS_HALT) {
+		struct ec_wdt_data *ec_wdt_data;
+
+		ec_wdt_data = container_of(nb, struct ec_wdt_data, reboot_nb);
+		if (!ec_wdt_data)
+			return NOTIFY_BAD;
+
+		/* Turn the WDT off */
+		if (write_hwram_command(ec_wdt_data->adv_ec_data, EC_WDT_STOP)) {
+			pr_err("Failed to set Watchdog stop.");
+			return -EINVAL;
+		}
+		ec_wdt_data->is_enable = 0;
+		pr_info("%s: notify sys shutdown", __func__);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int ec_wdt_start(struct watchdog_device *wdd)
+{
+	int ret;
+	int timeout, timeout_in_ms;
+	struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
+	struct adv_ec_platform_data *adv_ec_data;
+
+	dev_dbg(wdd->parent, "%s\n", __func__);
+
+	adv_ec_data = ec_wdt_data->adv_ec_data;
+	timeout = wdd->timeout; /* The watchdog devices timeout value (in seconds). */
+
+	mutex_lock(&ec_wdt_data->lock_ioctl);
+
+	timeout_in_ms = advwdt_set_heartbeat(timeout);
+	if (timeout_in_ms < 0) {
+		mutex_unlock(&ec_wdt_data->lock_ioctl);
+		return timeout_in_ms;
+	}
+
+	ret = set_delay(adv_ec_data, (unsigned short)(timeout_in_ms-1));
+	if (ret) {
+		dev_err(wdd->parent, "Failed to set Watchdog delay (ret=%x).\n", ret);
+		mutex_unlock(&ec_wdt_data->lock_ioctl);
+		return ret;
+	}
+	ret = write_hwram_command(adv_ec_data, EC_WDT_STOP);
+	ret = write_hwram_command(adv_ec_data, EC_WDT_START);
+	if (ret) {
+		dev_err(wdd->parent, "Failed to set Watchdog start (ret=%x).\n", ret);
+		mutex_unlock(&ec_wdt_data->lock_ioctl);
+		return ret;
+	}
+	ec_wdt_data->is_enable = 1;
+	ec_wdt_data->current_timeout = timeout_in_ms/10;
+
+	mutex_unlock(&ec_wdt_data->lock_ioctl);
+	return 0;
+}
+
+static int ec_wdt_stop(struct watchdog_device *wdd)
+{
+	int ret;
+	struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
+	struct adv_ec_platform_data *adv_ec_data;
+
+	dev_dbg(wdd->parent, "%s\n", __func__);
+
+	adv_ec_data = ec_wdt_data->adv_ec_data;
+
+	mutex_lock(&ec_wdt_data->lock_ioctl);
+	ret = write_hwram_command(adv_ec_data, EC_WDT_STOP);
+	mutex_unlock(&ec_wdt_data->lock_ioctl);
+	if (ret)
+		pr_err("Failed to set Watchdog stop.");
+	else
+		ec_wdt_data->is_enable = 0;
+
+	return ret;
+}
+
+static int ec_wdt_ping(struct watchdog_device *wdd)
+{
+	int ret;
+	struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
+	struct adv_ec_platform_data *adv_ec_data;
+
+	dev_dbg(wdd->parent, "%s\n", __func__);
+
+	adv_ec_data = ec_wdt_data->adv_ec_data;
+
+	mutex_lock(&ec_wdt_data->lock_ioctl);
+	ret = write_hwram_command(adv_ec_data, EC_WDT_RESET);
+	mutex_unlock(&ec_wdt_data->lock_ioctl);
+	if (ret) {
+		pr_err("Failed to set Watchdog reset.");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ec_wdt_set_timeout(struct watchdog_device *wdd,
+				unsigned int timeout)
+{
+	dev_dbg(wdd->parent, "%s, timeout=%d\n", __func__, timeout);
+
+	wdd->timeout = timeout;
+
+	if (watchdog_active(wdd))
+		return ec_wdt_start(wdd);
+
+	return 0;
+}
+
+static const struct watchdog_info ec_watchdog_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "AHC1EC0 Watchdog",
+};
+
+static const struct watchdog_ops ec_watchdog_ops = {
+	.owner = THIS_MODULE,
+	.start = ec_wdt_start,
+	.stop = ec_wdt_stop,
+	.ping = ec_wdt_ping,
+	.set_timeout = ec_wdt_set_timeout,
+};
+
+static int adv_ec_wdt_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct adv_ec_platform_data *adv_ec_data;
+	struct ec_wdt_data *ec_wdt_data;
+	struct watchdog_device *wdd;
+
+	dev_info(dev, "watchdog probe start\n");
+
+	adv_ec_data = dev_get_drvdata(dev->parent);
+	if (!adv_ec_data)
+		return -EINVAL;
+
+	ec_wdt_data = devm_kzalloc(dev, sizeof(struct ec_wdt_data), GFP_KERNEL);
+	if (!ec_wdt_data)
+		return -ENOMEM;
+
+	mutex_init(&ec_wdt_data->lock_ioctl);
+
+	ec_wdt_data->adv_ec_data = adv_ec_data;
+	wdd = &ec_wdt_data->wdtdev;
+
+	watchdog_init_timeout(&ec_wdt_data->wdtdev, 0, dev);
+
+	//watchdog_set_nowayout(&ec_wdt_data->wdtdev, WATCHDOG_NOWAYOUT);
+	watchdog_set_drvdata(&ec_wdt_data->wdtdev, ec_wdt_data);
+	platform_set_drvdata(pdev, ec_wdt_data);
+
+	wdd->info = &ec_watchdog_info;
+	wdd->ops = &ec_watchdog_ops;
+	wdd->min_timeout = EC_WDT_MIN_TIMEOUT;
+	wdd->max_timeout = EC_WDT_MAX_TIMEOUT;
+	wdd->parent = dev;
+
+	ec_wdt_data->wdtdev.timeout = EC_WDT_DEFAULT_TIMEOUT;
+	ec_wdt_data->is_enable = 0;
+	ec_wdt_data->current_timeout = EC_WDT_DEFAULT_TIMEOUT;
+
+	watchdog_stop_on_unregister(wdd);
+
+	ec_wdt_data->reboot_nb.notifier_call = advwdt_notify_sys;
+	ret = devm_register_reboot_notifier(dev, &ec_wdt_data->reboot_nb);
+	if (ret) {
+		dev_err(dev, "watchdog%d: Cannot register reboot notifier (%d)\n",
+			wdd->id, ret);
+		return ret;
+	}
+
+	ret = devm_watchdog_register_device(dev, wdd);
+	if (ret != 0)
+		dev_err(dev, "watchdog_register_device() failed: %d\n",
+			ret);
+
+	dev_info(dev, "watchdog register success\n");
+
+	return 0;
+}
+
+static struct platform_driver adv_wdt_drv = {
+	.driver = {
+		.name = DRV_NAME,
+	},
+	.probe = adv_ec_wdt_probe,
+};
+module_platform_driver(adv_wdt_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DESCRIPTION("Advantech Embedded Controller Watchdog Driver.");
+MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
+MODULE_VERSION("1.0");
-- 
2.17.1

