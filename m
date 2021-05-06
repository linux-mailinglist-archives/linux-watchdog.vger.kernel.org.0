Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CCA3750BE
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbhEFI1t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:27:49 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:61945 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbhEFI1q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:27:46 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 04:27:37 EDT
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te64ee01491ac14110e2c04@ACLMS4.ADVANTECH.CORP>;
 Thu, 6 May 2021 16:16:26 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 16:16:25 +0800
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
Subject: [PATCH v7 5/7] mfd: ahc1ec0: Add support for Advantech embedded controller
Date:   Thu, 6 May 2021 16:16:17 +0800
Message-ID: <20210506081619.2443-5-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 16471F35810FF41D5EE707AE4D045E917603E579BA28B903F917D2184E6D910A2000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

AHC1EC0 is the embedded controller for Advantech industrial products.
This provides sub-devices such as HWMON and Watchdog, and also exposes
functions for sub-devices to read/write the value to embedded
controller.

Changed in V7:
	Fix the patch according to reviewer's comment:
	- donot need to do memory clear since devm_kzalloc() do it
	  internal
	- rename ADVEC_SUBDEV_{DEVICE} to ADVEC_ACPI_ID_{DEVICE}
	- move some common functions to
	  drivers/platform/x86/ahc1ec0-core.c
	- change the data content of ACPI table, use a clear sub-devices
	  name and properties instead of index to start sub-devices
	- correction of words

Changed in V6:
	- Kconfig: add "AHC1EC0" string to clearly define the EC name
	- fix the code according to reviewer's suggestion
	- remove unnecessary header files
	- change the structure name to lower case, align with others
	  naming

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 drivers/mfd/Kconfig   |  11 +++
 drivers/mfd/Makefile  |   1 +
 drivers/mfd/ahc1ec0.c | 172 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)
 create mode 100644 drivers/mfd/ahc1ec0.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b100191..b61b11506103 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2174,5 +2174,16 @@ config MFD_INTEL_M10_BMC
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_AHC1EC0
+	tristate "Advantech AHC1EC0 Embedded Controller"
+	depends on X86
+	depends on AHC1EC0_CORE
+	select MFD_CORE
+	help
+	  Select this to get support for Advantech Embedded Controller sub-devices.
+	  This driver will instantiate additional drivers such as HWMON, Watchdog,
+	  etc., you also have to select the individual drivers.
+	  The controller is running firmware customized for Advantech hardware.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4f6d2b8a5f76..270db521e1d8 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -271,3 +271,4 @@ obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
 
 obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
 obj-$(CONFIG_MFD_ATC260X_I2C)	+= atc260x-i2c.o
+obj-$(CONFIG_MFD_AHC1EC0)	+= ahc1ec0.o
diff --git a/drivers/mfd/ahc1ec0.c b/drivers/mfd/ahc1ec0.c
new file mode 100644
index 000000000000..575b654ade5f
--- /dev/null
+++ b/drivers/mfd/ahc1ec0.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Advantech AHC1EC0 Embedded Controller
+ *
+ * Copyright 2021 Advantech IIoT Group
+ */
+
+#include <linux/acpi.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/ahc1ec0.h>
+
+/* This order cannot be changed, it is use in enum and may in BIOS ACPI table. */
+enum {
+	ADVEC_ACPI_ID_BRIGHTNESS = 0,
+	ADVEC_ACPI_ID_EEPROM,
+	ADVEC_ACPI_ID_GPIO,
+	ADVEC_ACPI_ID_HWMON,
+	ADVEC_ACPI_ID_LED,
+	ADVEC_ACPI_ID_WDT,
+	ADVEC_ACPI_ID_MAX,
+};
+
+static const struct mfd_cell adv_ec_sub_cells[] = {
+	{ .name = "adv-ec-brightness", },
+	{ .name = "adv-ec-eeprom", },
+	{ .name = "adv-ec-gpio", },
+	{ .name = "ahc1ec0-hwmon", },
+	{ .name = "adv-ec-led", },
+	{ .name = "ahc1ec0-wdt", },
+};
+
+static int adv_ec_init_ec_data(struct adv_ec_ddata *ddata)
+{
+	int ret;
+
+	mutex_init(&ddata->lock);
+
+	/* Get product name */
+	ddata->bios_product_name =
+		devm_kzalloc(ddata->dev, AMI_ADVANTECH_BOARD_ID_LENGTH, GFP_KERNEL);
+	if (!ddata->bios_product_name)
+		return -ENOMEM;
+
+	ret = adv_ec_get_productname(ddata, ddata->bios_product_name);
+	if (ret)
+		return ret;
+
+	/* Get pin table */
+	ddata->dym_tbl = devm_kzalloc(ddata->dev,
+				      EC_MAX_TBL_NUM * sizeof(struct ec_dynamic_table),
+				      GFP_KERNEL);
+	if (!ddata->dym_tbl)
+		return -ENOMEM;
+
+	return adv_get_dynamic_tab(ddata);
+}
+
+static int adv_ec_parse_prop(struct adv_ec_ddata *ddata)
+{
+	int ret;
+	u32 value;
+	bool has_watchdog = true;
+
+	/* check whether this EC has the following subdevices, hwmon and watchdog. */
+	if (device_property_read_u32(ddata->dev, "advantech,hwmon-profile", &value) >= 0) {
+		ret = mfd_add_hotplug_devices(ddata->dev,
+					      &adv_ec_sub_cells[ADVEC_ACPI_ID_HWMON], 1);
+		if (ret) {
+			dev_err(ddata->dev, "Failed to add %s subdevice: %d\n",
+				adv_ec_sub_cells[ADVEC_ACPI_ID_HWMON].name, ret);
+		} else {
+			dev_info(ddata->dev, "Success to add %s subdevice\n",
+				 adv_ec_sub_cells[ADVEC_ACPI_ID_HWMON].name);
+		}
+	} else {
+		dev_err(ddata->dev, "No 'advantech,hwmon-profile' property: %d\n",
+			ret);
+	}
+
+	/* default is true for watchdog even if it is not existed */
+	if (device_property_present(ddata->dev, "advantech,has-watchdog"))
+		has_watchdog = device_property_read_bool(ddata->dev, "advantech,has-watchdog");
+	if (has_watchdog) {
+		ret = mfd_add_hotplug_devices(ddata->dev, &adv_ec_sub_cells[ADVEC_ACPI_ID_WDT], 1);
+		if (ret) {
+			dev_err(ddata->dev, "Failed to add %s subdevice: %d\n",
+				adv_ec_sub_cells[ADVEC_ACPI_ID_WDT].name, ret);
+		} else {
+			dev_info(ddata->dev, "Success to add %s subdevice\n",
+				 adv_ec_sub_cells[ADVEC_ACPI_ID_WDT].name);
+		}
+	}
+
+	return 0;
+}
+
+static int adv_ec_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct adv_ec_ddata *ddata;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ddata);
+	ddata->dev = dev;
+
+	ret = adv_ec_init_ec_data(ddata);
+	if (ret)
+		goto err_prop;
+
+	ret = adv_ec_parse_prop(ddata);
+	if (ret)
+		goto err_prop;
+
+	dev_info(ddata->dev, "Advantech AHC1EC0 probe done");
+
+	return 0;
+
+err_prop:
+	mutex_destroy(&ddata->lock);
+
+	dev_dbg(dev, "Failed to init data and probe\n");
+	return ret;
+}
+
+static int adv_ec_remove(struct platform_device *pdev)
+{
+	struct adv_ec_ddata *ddata;
+
+	ddata = dev_get_drvdata(&pdev->dev);
+
+	mutex_destroy(&ddata->lock);
+	return 0;
+}
+
+static const struct of_device_id adv_ec_of_match[] __maybe_unused = {
+	{ .compatible = "advantech,ahc1ec0" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adv_ec_of_match);
+
+static const struct acpi_device_id adv_ec_acpi_match[] __maybe_unused = {
+	{ "AHC1EC0", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, adv_ec_acpi_match);
+
+static struct platform_driver adv_ec_driver = {
+	.driver = {
+		.name = "ahc1ec0",
+		.of_match_table = of_match_ptr(adv_ec_of_match),
+		.acpi_match_table = ACPI_PTR(adv_ec_acpi_match),
+	},
+	.probe = adv_ec_probe,
+	.remove = adv_ec_remove,
+};
+module_platform_driver(adv_ec_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ahc1ec0");
+MODULE_DESCRIPTION("Advantech AHC1EC0 Embedded Controller");
+MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
+MODULE_AUTHOR("Jianfeng Dai <jianfeng.dai@advantech.com.cn>");
+MODULE_VERSION("1.0");
-- 
2.17.1

