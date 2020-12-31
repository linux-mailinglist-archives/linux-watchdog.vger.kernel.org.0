Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BE22E8013
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Dec 2020 13:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgLaMwq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 31 Dec 2020 07:52:46 -0500
Received: from aclms1.advantech.com.tw ([61.58.41.199]:52393 "EHLO
        aclms1.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgLaMwp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 31 Dec 2020 07:52:45 -0500
X-Greylist: delayed 686 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Dec 2020 07:52:09 EST
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS2.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te3c6f011eeac14014b2650@ACLMS2.ADVANTECH.CORP>;
 Thu, 31 Dec 2020 20:39:58 +0800
Received: from localhost (172.16.12.146) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 31 Dec
 2020 20:40:08 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-hwmon@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v5 5/6] hwmon: ahc1ec0-hwmon: Add sub-device hwmon for Advantech embedded controller
Date:   Thu, 31 Dec 2020 20:39:47 +0800
Message-ID: <20201231123948.10473-5-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201231123948.10473-1-campion.kang@advantech.com.tw>
References: <20201231123948.10473-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.12.146]
X-ClientProxiedBy: aclcas3.ADVANTECH.CORP (172.20.1.12) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: C2D5A72FA39E3C6A2D08CF46808400F5C4360196DF8F5A19C179F29D617A904A2000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is one of sub-device driver for Advantech embedded controller
AHC1EC0. This driver provides sysfs ABI for Advantech related
applications to monitor the system status.

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/ahc1ec0-hwmon.c | 398 ++++++++++++++++++++++++++++++++++
 3 files changed, 409 insertions(+)
 create mode 100644 drivers/hwmon/ahc1ec0-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 1ecf697d8d99..cf4a0eb863b0 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2139,6 +2139,16 @@ config SENSORS_INTEL_M10_BMC_HWMON
 	  sensors monitor various telemetry data of different components on the
 	  card, e.g. board temperature, FPGA core temperature/voltage/current.
 
+config SENSORS_AHC1EC0_HWMON
+	tristate "Advantech AHC1 EC Hardware Monitor Function"
+	depends on MFD_AHC1EC0
+	help
+	  This driver provide support for the hardware monitoring functionality
+	  for Advantech AHC1EC0 embedded controller on the board.
+
+	  This driver provides the sysfs attributes for applications to monitor
+	  the system status, including system temperatures, voltages, current.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 09a86c5e1d29..0c37747e8c4f 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
 obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
 obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
 obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
+obj-$(CONFIG_SENSORS_AHC1EC0_HWMON)	+= ahc1ec0-hwmon.o
 obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
diff --git a/drivers/hwmon/ahc1ec0-hwmon.c b/drivers/hwmon/ahc1ec0-hwmon.c
new file mode 100644
index 000000000000..a05d2c0a25ad
--- /dev/null
+++ b/drivers/hwmon/ahc1ec0-hwmon.c
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HWMON Driver for Advantech Embedded Controller chip AHC1EC0
+ *
+ * Copyright 2020, Advantech IIoT Group
+ *
+ */
+
+#include <asm/msr-index.h>
+#include <asm/msr.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/errno.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/ahc1ec0.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/wait.h>
+
+struct adv_hwmon_profile {
+	int offset;
+	unsigned long resolution, resolution_vin, resolution_sys, resolution_curr, resolution_power;
+	unsigned long r1, r1_vin, r1_sys, r1_curr, r1_power;
+	unsigned long r2, r2_vin, r2_sys, r2_curr, r2_power;
+	const struct attribute_group ec_hwmon_group;
+};
+
+struct EC_HWMON_DATA {
+	unsigned char temperature[3];
+	unsigned char ec_current[5];
+	unsigned char power[5];
+	char *bios_product_name;
+	int voltage[7];
+
+	struct device *dev, *hwmon_dev;
+	struct HW_PIN_TBL pin_tbl;
+	struct EC_SMBOEM0 ec_smboem0;
+	struct adv_hwmon_profile *profile;
+};
+struct EC_HWMON_DATA lmsensor_data;
+
+static ssize_t get_ec_in1_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "VBAT\n");
+}
+
+static ssize_t get_ec_in2_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "5VSB\n");
+}
+
+static ssize_t get_ec_in3_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "VIN\n");
+}
+
+static ssize_t get_ec_in4_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "VCORE\n");
+}
+
+static ssize_t get_ec_temp2_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "Temp CPU\n");
+}
+
+static ssize_t get_ec_temp2_crit(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "100000\n");
+}
+
+static ssize_t get_ec_temp2_crit_alarm(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "0\n");
+}
+
+static ssize_t get_ec_in1_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	unsigned char temp;
+	unsigned char voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+	struct adv_ec_platform_data *adv_ec_data = dev_get_drvdata(dev);
+
+	temp = read_ad_value(adv_ec_data, ptbl->vbat[0], ptbl->vbat[1]);
+
+	if (profile->r2 != 0)
+		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
+
+	if (profile->resolution != 0)
+		voltage =  temp * profile->resolution / 1000 / 1000;
+
+	if (profile->offset != 0)
+		voltage += (int)profile->offset * 100;
+
+	lmsensor_data.voltage[0] = 10*voltage;
+
+	return sprintf(buf, "%d\n", lmsensor_data.voltage[0]);
+}
+
+static ssize_t get_ec_in2_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	unsigned char temp;
+	unsigned char voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+	struct adv_ec_platform_data *adv_ec_data = dev_get_drvdata(dev);
+
+	temp = read_ad_value(adv_ec_data, ptbl->v5[0], ptbl->v5[1]);
+
+	if (profile->r2 != 0)
+		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
+
+	if (profile->resolution != 0)
+		voltage =  temp * profile->resolution / 1000 / 1000;
+
+	if (profile->offset != 0)
+		voltage += (int)profile->offset * 100;
+
+	lmsensor_data.voltage[1] = 10*voltage;
+
+	return sprintf(buf, "%d\n", lmsensor_data.voltage[1]);
+}
+
+static ssize_t get_ec_in3_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	unsigned char temp;
+	unsigned char voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+	struct adv_ec_platform_data *adv_ec_data = dev_get_drvdata(dev);
+
+
+	temp = read_ad_value(adv_ec_data, ptbl->v12[0], ptbl->v12[1]);
+	if (temp == -1)
+		temp  =  read_ad_value(adv_ec_data, ptbl->vdc[0], ptbl->vdc[1]);
+
+	if (profile->r2 != 0)
+		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
+
+	if (profile->resolution != 0)
+		voltage =  temp * profile->resolution / 1000 / 1000;
+
+	if (profile->offset != 0)
+		voltage += (int)profile->offset * 100;
+
+	lmsensor_data.voltage[2] = 10*voltage;
+
+	return sprintf(buf, "%d\n", lmsensor_data.voltage[2]);
+}
+
+static ssize_t get_ec_in4_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	unsigned char temp;
+	unsigned char voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+	struct adv_ec_platform_data *adv_ec_data = dev_get_drvdata(dev);
+
+	temp = read_ad_value(adv_ec_data, ptbl->vcore[0], ptbl->vcore[1]);
+
+	if (profile->r2 != 0)
+		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
+
+	if (profile->resolution != 0)
+		voltage = temp * profile->resolution / 1000 / 1000;
+
+	if (profile->offset != 0)
+		voltage += (int)profile->offset * 100;
+
+	lmsensor_data.voltage[3] = 10*voltage;
+
+	return sprintf(buf, "%d\n", lmsensor_data.voltage[3]);
+}
+
+
+static ssize_t get_ec_temp2_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	unsigned char value = 0;
+	struct adv_ec_platform_data *adv_ec_data = dev_get_drvdata(dev);
+
+	read_acpi_value(adv_ec_data, 0x61, &value);
+	return sprintf(buf, "%d\n", 1000*value);
+}
+
+static struct adv_hwmon_profile advec_profile[] = {
+	/*
+	 * TPC-8100TR, TPC-651T-E3AE, TPC-1251T-E3AE, TPC-1551T-E3AE,
+	 * TPC-1751T-E3AE, TPC-1051WP-E3AE, TPC-1551WP-E3AE, TPC-1581WP-433AE,
+	 * TPC-1782H-433AE, UNO-1483G-434AE, UNO-2483G-434AE, UNO-3483G-374AE,
+	 * UNO-2473G, UNO-2484G-6???AE, UNO-2484G-7???AE, UNO-3283G-674AE,
+	 * UNO-3285G-674AE
+	 * (0)
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		//.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_TEMPLATE,
+	},
+	/*
+	 * TPC-B500-6??AE, TPC-5???T-6??AE, TPC-5???W-6??AE, TPC-B200-???AE,
+	 * TPC-2???T-???AE, TPC-2???W-???AE
+	 * (1)
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		//.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_TPC5XXX,
+	},
+	/* PR/VR4 (2) */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+	},
+	/* UNO-2271G-E22AE/E23AE/E022AE/E023AE,UNO-420 (3) */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		//.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_UNO2271G,
+	},
+};
+
+static void adv_ec_init_hwmon_profile(u32 profile, struct adv_ec_platform_data *adv_ec_data)
+{
+	int i;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct Dynamic_Tab *dym_tbl = adv_ec_data->dym_tbl;
+
+	lmsensor_data.bios_product_name = adv_ec_data->bios_product_name;
+	dev_info(adv_ec_data->dev, "BIOS Product Name = %s\n", lmsensor_data.bios_product_name);
+
+	lmsensor_data.profile = &advec_profile[profile];
+
+	for (i = 0; i < EC_MAX_TBL_NUM ; i++) {
+		switch (dym_tbl[i].DeviceID) {
+		case EC_DID_CMOSBAT:
+			ptbl->vbat[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vbat[1] = 1;
+			break;
+		case EC_DID_CMOSBAT_X2:
+			ptbl->vbat[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vbat[1] = 2;
+			break;
+		case EC_DID_CMOSBAT_X10:
+			ptbl->vbat[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vbat[1] = 10;
+			break;
+		case EC_DID_5VS0:
+		case EC_DID_5VS5:
+			ptbl->v5[0] = dym_tbl[i].HWPinNumber;
+			ptbl->v5[1] = 1;
+			break;
+		case EC_DID_5VS0_X2:
+		case EC_DID_5VS5_X2:
+			ptbl->v5[0] = dym_tbl[i].HWPinNumber;
+			ptbl->v5[1] = 2;
+			break;
+		case EC_DID_5VS0_X10:
+		case EC_DID_5VS5_X10:
+			ptbl->v5[0] = dym_tbl[i].HWPinNumber;
+			ptbl->v5[1] = 10;
+			break;
+		case EC_DID_12VS0:
+			ptbl->v12[0] = dym_tbl[i].HWPinNumber;
+			ptbl->v12[1] = 1;
+			break;
+		case EC_DID_12VS0_X2:
+			ptbl->v12[0] = dym_tbl[i].HWPinNumber;
+			ptbl->v12[1] = 2;
+			break;
+		case EC_DID_12VS0_X10:
+			ptbl->v12[0] = dym_tbl[i].HWPinNumber;
+			ptbl->v12[1] = 10;
+			break;
+		case EC_DID_VCOREA:
+		case EC_DID_VCOREB:
+			ptbl->vcore[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vcore[1] = 1;
+			break;
+		case EC_DID_VCOREA_X2:
+		case EC_DID_VCOREB_X2:
+			ptbl->vcore[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vcore[1] = 2;
+			break;
+		case EC_DID_VCOREA_X10:
+		case EC_DID_VCOREB_X10:
+			ptbl->vcore[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vcore[1] = 10;
+			break;
+		case EC_DID_DC:
+			ptbl->vdc[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vdc[1] = 1;
+			break;
+		case EC_DID_DC_X2:
+			ptbl->vdc[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vdc[1] = 2;
+			break;
+		case EC_DID_DC_X10:
+			ptbl->vdc[0] = dym_tbl[i].HWPinNumber;
+			ptbl->vdc[1] = 10;
+			break;
+		case EC_DID_CURRENT:
+			ptbl->ec_current[0] = dym_tbl[i].HWPinNumber;
+			ptbl->ec_current[1] = 1;
+			break;
+		case EC_DID_SMBOEM0:
+			lmsensor_data.ec_smboem0.HWPinNumber = dym_tbl[i].HWPinNumber;
+			break;
+		default:
+			break;
+		}
+	}
+}
+
+static SENSOR_DEVICE_ATTR_RO(in1_input, get_ec_in1_input, 0);
+static SENSOR_DEVICE_ATTR_RO(in1_label, get_ec_in1_label, 0);
+static SENSOR_DEVICE_ATTR_RO(in2_input, get_ec_in2_input, 0);
+static SENSOR_DEVICE_ATTR_RO(in2_label, get_ec_in2_label, 0);
+static SENSOR_DEVICE_ATTR_RO(in3_input, get_ec_in3_input, 0);
+static SENSOR_DEVICE_ATTR_RO(in3_label, get_ec_in3_label, 0);
+static SENSOR_DEVICE_ATTR_RO(in4_input, get_ec_in4_input, 0);
+static SENSOR_DEVICE_ATTR_RO(in4_label, get_ec_in4_label, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_label, get_ec_temp2_label, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_input, get_ec_temp2_input, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit, get_ec_temp2_crit, 0);
+static SENSOR_DEVICE_ATTR_RO(temp2_crit_alarm, get_ec_temp2_crit_alarm, 0);
+
+static struct attribute *ahc1ec0_attrs[] = {
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in3_input.dev_attr.attr,
+	&sensor_dev_attr_in3_label.dev_attr.attr,
+	&sensor_dev_attr_in4_input.dev_attr.attr,
+	&sensor_dev_attr_in4_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ahc1ec0);
+
+static int adv_ec_hwmon_probe(struct platform_device *pdev)
+{
+	u32 profile;
+	int ret = 0;
+	struct adv_ec_platform_data *adv_ec_data;
+
+	adv_ec_data = dev_get_drvdata(pdev->dev.parent);
+
+	ret = device_property_read_u32(pdev->dev.parent, "advantech,hwmon-profile", &profile);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "get hwmon-profile failed! (%d)", ret);
+		return ret;
+	}
+	adv_ec_init_hwmon_profile(profile, adv_ec_data);
+
+	lmsensor_data.dev = &pdev->dev;
+	lmsensor_data.hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
+			"ahc1ec0-hwmon", adv_ec_data, ahc1ec0_groups);
+	return PTR_ERR_OR_ZERO(lmsensor_data.hwmon_dev);
+}
+
+static struct platform_driver adv_hwmon_drv = {
+	.driver = {
+		.name = "ahc1ec0-hwmon",
+	},
+	.probe = adv_ec_hwmon_probe,
+};
+module_platform_driver(adv_hwmon_drv);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:ahc1ec0-hwmon");
+MODULE_DESCRIPTION("Advantech Embedded Controller HWMON Driver.");
+MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
+MODULE_AUTHOR("Jianfeng Dia <jianfeng.dai@advantech.com.cn>");
+MODULE_VERSION("1.0");
-- 
2.17.1

