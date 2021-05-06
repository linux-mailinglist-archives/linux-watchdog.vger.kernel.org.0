Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5F33750D1
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbhEFI2I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:28:08 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:61945 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbhEFI2C (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:28:02 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 04:27:37 EDT
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te64ee12911ac14110e2c04@ACLMS4.ADVANTECH.CORP>;
 Thu, 6 May 2021 16:17:37 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 16:17:35 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v7 6/7] Watchdog: ahc1ec0-wdt: Add sub-device Watchdog for Advantech embedded controller
Date:   Thu, 6 May 2021 16:16:18 +0800
Message-ID: <20210506081619.2443-6-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 50F0FB6E8611B1C3BEDA1B31D4B69BAA1D13FF1FAC36246C8BD8B4A252F1F9A22000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is one of sub-device driver for Advantech embedded controller
AHC1EC0. This driver provide Watchdog functionality for Advantech
related applications to restart the system.

Changed in V7:
	Fix the patch according to reviewer's comment:
	- remove unnecessary variables and fix error checks
	- remove error messages that avoid clogging the kernel log
	- remove advwdt_notify_sys(), use watchdog subsystem to process
	  reboot or shutdown
	- delete mutex lock, the watchdog core has processed it

Changed in V6:
	- remove unnecessary header files
	- bug fixed: reboot halt if watchdog enabled
	- Kconfig: add "AHC1EC0" string to clearly define the EC name

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 drivers/watchdog/Kconfig       |  11 +++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/ahc1ec0-wdt.c | 171 +++++++++++++++++++++++++++++++++
 3 files changed, 183 insertions(+)
 create mode 100644 drivers/watchdog/ahc1ec0-wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 355100dad60a..5fe9add0a12d 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1005,6 +1005,17 @@ config ADVANTECH_WDT
 	  feature. More information can be found at
 	  <https://www.advantech.com.tw/products/>
 
+config AHC1EC0_WDT
+	tristate "Advantech AHC1EC0 Watchdog Function"
+	depends on MFD_AHC1EC0
+	help
+	  This is sub-device for Advantech AHC1EC0 embedded controller.
+
+	  This driver provide watchdog functionality for Advantech related
+	  applications to restart the system.
+	  To compile this driver as a module, choose M here: the module will be
+	  called ahc1ec0-wdt.
+
 config ALIM1535_WDT
 	tristate "ALi M1535 PMU Watchdog Timer"
 	depends on X86 && PCI
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index a7eade8b4d45..0d78211e1412 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
 obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
 obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
 obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
+obj-$(CONFIG_AHC1EC0_WDT) += ahc1ec0-wdt.o
 
 # M68K Architecture
 obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
diff --git a/drivers/watchdog/ahc1ec0-wdt.c b/drivers/watchdog/ahc1ec0-wdt.c
new file mode 100644
index 000000000000..efa955c41a81
--- /dev/null
+++ b/drivers/watchdog/ahc1ec0-wdt.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Watchdog Driver for Advantech AHC1EC0 Embedded Controller
+ *
+ * Copyright 2021, Advantech IIoT Group
+ */
+
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_data/ahc1ec0.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+struct ec_wdt_data {
+	struct watchdog_device wdtdev;
+	struct adv_ec_ddata *ddata;
+	unsigned short timeout_in_ds; /* a decisecond */
+};
+
+#define EC_WDT_MIN_TIMEOUT	1   /* The watchdog devices minimum timeout value (in seconds). */
+#define EC_WDT_MAX_TIMEOUT	600 /* The watchdog devices maximum timeout value (in seconds) */
+#define EC_WDT_DEFAULT_TIMEOUT	45
+
+static int set_delay(struct adv_ec_ddata *ddata, unsigned short delay_timeout_in_ms)
+{
+	if (ahc1ec_write_hw_ram(ddata, EC_RESET_DELAY_TIME_L,
+				delay_timeout_in_ms & 0x00FF))
+		return -EINVAL;
+
+	if (ahc1ec_write_hw_ram(ddata, EC_RESET_DELAY_TIME_H,
+				(delay_timeout_in_ms & 0xFF00) >> 8))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ec_wdt_start(struct watchdog_device *wdd)
+{
+	int ret;
+	struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
+	struct adv_ec_ddata *ddata;
+
+	ddata = ec_wdt_data->ddata;
+
+	/*
+	 * Because an unit of ahc1ec0_wdt is 0.1 seconds, timeout 100 is 10 seconds
+	 */
+	ec_wdt_data->timeout_in_ds = wdd->timeout * 10;
+
+	ret = set_delay(ddata, (ec_wdt_data->timeout_in_ds - 1));
+	if (ret)
+		goto exit;
+
+	ahc1ec_write_hwram_command(ddata, EC_WDT_STOP);
+	ret = ahc1ec_write_hwram_command(ddata, EC_WDT_START);
+	if (ret)
+		goto exit;
+
+exit:
+	return ret;
+}
+
+static int ec_wdt_stop(struct watchdog_device *wdd)
+{
+	struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
+	struct adv_ec_ddata *ddata;
+
+	ddata = ec_wdt_data->ddata;
+
+	return ahc1ec_write_hwram_command(ddata, EC_WDT_STOP);
+}
+
+static int ec_wdt_ping(struct watchdog_device *wdd)
+{
+	int ret;
+	struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
+	struct adv_ec_ddata *ddata;
+
+	ddata = ec_wdt_data->ddata;
+
+	ret = ahc1ec_write_hwram_command(ddata, EC_WDT_RESET);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ec_wdt_set_timeout(struct watchdog_device *wdd,
+			      unsigned int timeout)
+{
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
+	struct adv_ec_ddata *ddata;
+	struct ec_wdt_data *ec_wdt_data;
+	struct watchdog_device *wdd;
+
+	ddata = dev_get_drvdata(dev->parent);
+	if (!ddata)
+		return -EINVAL;
+
+	ec_wdt_data = devm_kzalloc(dev, sizeof(*ec_wdt_data), GFP_KERNEL);
+	if (!ec_wdt_data)
+		return -ENOMEM;
+
+	ec_wdt_data->ddata = ddata;
+	wdd = &ec_wdt_data->wdtdev;
+
+	watchdog_init_timeout(&ec_wdt_data->wdtdev, 0, dev);
+
+	/* watchdog_set_nowayout(&ec_wdt_data->wdtdev, WATCHDOG_NOWAYOUT); */
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
+
+	watchdog_stop_on_reboot(wdd);
+	watchdog_stop_on_unregister(wdd);
+
+	ret = devm_watchdog_register_device(dev, wdd);
+	if (ret == 0)
+		dev_info(dev, "ahc1ec0 watchdog register success\n");
+
+	return ret;
+}
+
+static struct platform_driver adv_wdt_drv = {
+	.driver = {
+		.name = "ahc1ec0-wdt",
+	},
+	.probe = adv_ec_wdt_probe,
+};
+module_platform_driver(adv_wdt_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ahc1ec0-wdt");
+MODULE_DESCRIPTION("Advantech Embedded Controller Watchdog Driver.");
+MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
+MODULE_VERSION("1.0");
-- 
2.17.1

