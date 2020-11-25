Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487D42C39F0
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 08:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgKYHR4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 02:17:56 -0500
Received: from aclms3.advantech.com.tw ([125.252.70.86]:20993 "EHLO
        ACLMS3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgKYHRz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 02:17:55 -0500
X-Greylist: delayed 605 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Nov 2020 02:17:51 EST
Received: from taipei08.ADVANTECH.CORP (unverified [172.20.0.235]) by ACLMS3.advantech.com.tw
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te30c5b8eabac1401c8114@ACLMS3.advantech.com.tw>;
 Wed, 25 Nov 2020 15:08:23 +0800
Received: from localhost (124.9.5.81) by taipei08.ADVANTECH.CORP
 (172.20.0.235) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 25 Nov
 2020 15:08:14 +0800
From:   Shihlun Lin <shihlun.lin@advantech.com.tw>
To:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        Campion Kang <campion.kang@advantech.com.tw>,
        Shihlun Lin <shihlun.lin@advantech.com.tw>,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: [RESEND PATCH v4 5/6] hwmon: ahc1ec0-hwmon: Add sub-device hwmon for Advantech embedded controller
Date:   Wed, 25 Nov 2020 15:07:43 +0800
Message-ID: <20201125070744.4651-5-shihlun.lin@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
References: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [124.9.5.81]
X-ClientProxiedBy: taipei09.ADVANTECH.CORP (172.20.0.236) To
 taipei08.ADVANTECH.CORP (172.20.0.235)
X-StopIT: No
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is one of sub-device driver for Advantech embedded controller
AHC1EC0. This driver provides sysfs ABI for Advantech related
applications to monitor the system status.

Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>
---
 drivers/hwmon/Kconfig         |    8 +
 drivers/hwmon/Makefile        |    1 +
 drivers/hwmon/ahc1ec0-hwmon.c | 1504 +++++++++++++++++++++++++++++++++
 3 files changed, 1513 insertions(+)
 create mode 100644 drivers/hwmon/ahc1ec0-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index a850e4f0e0bd..577dd1dd60ee 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2095,6 +2095,14 @@ config SENSORS_INTEL_M10_BMC_HWMON
 	  sensors monitor various telemetry data of different components on the
 	  card, e.g. board temperature, FPGA core temperature/voltage/current.
 
+config SENSORS_AHC1EC0_HWMON
+	tristate "Advantech EC Hardware Monitor Function"
+	depends on MFD_AHC1EC0
+	help
+	  This is sub-device for Advantech embedded controller AHC1EC0. This
+	  driver provides the sysfs attributes for applications to monitor
+	  the system status.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 9db2903b61e5..e06ddc314b4a 100644
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
index 000000000000..d71eb8e01422
--- /dev/null
+++ b/drivers/hwmon/ahc1ec0-hwmon.c
@@ -0,0 +1,1504 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HWMON Driver for Advantech controlling EC chip AHC1EC0
+ *
+ * Copyright (C) 2020, Advantech Automation Corp.
+ *
+ * Change Log:
+ *	Version 1.00 <11/05/2015> Jiangwei.Zhu
+ *	  - Initial version
+ *	Version 1.01 <03/04/2016> Jiangwei.Zhu
+ *	  - Support UNO-1372G-E3AE, TPC-1782H-433AE, APAX-5580-433AE
+ *	Version 1.02 <05/09/2016> Ji.Xu
+ *	  - Support APAX-5580-473AE/4C3AE
+ *	  - Modify the device name check method to fuzzy matching.
+ *	Version 1.03 <05/09/2017> Ji.Xu
+ *	  - Support UNO-2271G-E2xAE
+ *	  - Support UNO-2271G-E02xAE
+ *	  - Support ECU-4784
+ *	  - Support UNO-2473G-JxAE
+ *	Version 1.04 <09/20/2017> Ji.Xu
+ *	  - Support UNO-2484G-633xAE
+ *	  - Support UNO-2484G-653xAE
+ *	  - Support UNO-2484G-673xAE
+ *	  - Support UNO-2484G-733xAE
+ *	  - Support UNO-2484G-753xAE
+ *	  - Support UNO-2484G-773xAE
+ *	Version 1.05 <10/26/2017> Ji.Xu
+ *	  - Support PR/VR4
+ *	  - Support UNO-3283G-674AE
+ *	  - Support UNO-3285G-674AE
+ *	Version 1.06 <11/16/2017> Zhang.Yang
+ *	  - Support UNO-1372G-J021AE/J031AE
+ *	  - Support UNO-2372G
+ *	Version 1.07 <02/02/2018> Ji.Xu
+ *	  - Convert the driver to use new hwmon API after kernel version 4.10.0
+ *	  - Support EC TPC-B500-6??AE
+ *	  - Support EC TPC-5???T-6??AE
+ *	Version 1.08 <02/20/2019> Ji.Xu
+ *	  - Support EC UNO-420
+ *	  - Support EC TPC-B200-???AE
+ *	  - Support EC TPC-2???T-???AE
+ *	  - Support EC TPC-2???W-???AE
+ *	Version 1.09 <04/24/2020> Yao.Kang
+ *	  - Support EC UNO-2473G
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/ioctl.h>
+#include <linux/io.h>
+#include <linux/wait.h>
+#include <linux/sched.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/errno.h>
+#include <asm/msr.h>
+#include <asm/msr-index.h>
+#include <linux/version.h>
+#include <linux/i2c.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/sysfs.h>
+#include <linux/mfd/ahc1ec0.h>
+
+#define ADVANTECH_EC_HWMON_VER     "1.09"
+#define ADVANTECH_EC_HWMON_DATE    "04/24/2020"
+
+/* Addresses to scan */
+static const unsigned short normal_i2c[] = { 0x2d, 0x2e, I2C_CLIENT_END };
+
+enum chips { f75373, f75375, f75387 };
+
+/* Fintek F75375 registers  */
+#define F75375_REG_CONFIG0		0x0
+#define F75375_REG_CONFIG1		0x1
+#define F75375_REG_CONFIG2		0x2
+#define F75375_REG_CONFIG3		0x3
+#define F75375_REG_ADDR			0x4
+#define F75375_REG_INTR			0x31
+#define F75375_CHIP_ID			0x5A
+#define F75375_REG_VERSION		0x5C
+#define F75375_REG_VENDOR		0x5D
+
+#define F75375_REG_TEMP(nr)		(0x14 + (nr))
+#define F75387_REG_TEMP11_LSB(nr)	(0x1c + (nr))
+#define F75375_REG_TEMP_HIGH(nr)	(0x28 + (nr) * 2)
+#define F75375_REG_TEMP_HYST(nr)	(0x29 + (nr) * 2)
+
+/*
+ * Data structures and manipulation thereof
+ */
+
+struct f75375_data {
+	unsigned short addr;
+	struct device *hwmon_dev;
+
+	const char *name;
+	int kind;
+	struct mutex update_lock; /* protect register access */
+	char valid;
+	unsigned long last_updated;	/* In jiffies */
+	unsigned long last_limits;	/* In jiffies */
+
+	/* Register values */
+	/*
+	 * f75387: For remote temperature reading, it uses signed 11-bit
+	 * values with LSB = 0.125 degree Celsius, left-justified in 16-bit
+	 * registers. For original 8-bit temp readings, the LSB just is 0.
+	 */
+	s16 temp11[2];
+	s8 temp_high[2];
+	s8 temp_max_hyst[2];
+};
+
+static int f75375_detect(struct i2c_client *client, struct i2c_board_info *info);
+static int f75375_probe(struct i2c_client *client, const struct i2c_device_id *id);
+static int f75375_remove(struct i2c_client *client);
+static int adspname_detect(const char *bios_product_name, const char *standard_name);
+
+static const struct i2c_device_id f75375_id[] = {
+	{ "f75387", f75387 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, f75375_id);
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
+	uchar temperature[3];
+	uchar ec_current[5];
+	uchar power[5];
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
+static struct i2c_driver f75375_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "f75375",
+	},
+	.probe = f75375_probe,
+	.remove = f75375_remove,
+	.id_table = f75375_id,
+	.detect = f75375_detect,
+	.address_list = normal_i2c,
+};
+
+static inline int f75375_read8(struct i2c_client *client, u8 reg)
+{
+	return i2c_smbus_read_byte_data(client, reg);
+}
+
+/* in most cases, should be called while holding update_lock */
+static inline u16 f75375_read16(struct i2c_client *client, u8 reg)
+{
+	return (i2c_smbus_read_byte_data(client, reg) << 8)
+		| i2c_smbus_read_byte_data(client, reg + 1);
+}
+
+static inline void f75375_write8(struct i2c_client *client, u8 reg,
+		u8 value)
+{
+	i2c_smbus_write_byte_data(client, reg, value);
+}
+
+static inline void f75375_write16(struct i2c_client *client, u8 reg,
+		u16 value)
+{
+	int err = i2c_smbus_write_byte_data(client, reg, (value >> 8));
+
+	if (err)
+		return;
+	i2c_smbus_write_byte_data(client, reg + 1, (value & 0xFF));
+}
+
+
+static struct f75375_data *f75375_update_device(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct f75375_data *data = i2c_get_clientdata(client);
+	int nr;
+
+	mutex_lock(&data->update_lock);
+
+	/* Limit registers cache is refreshed after 60 seconds */
+	if (time_after(jiffies, data->last_limits + 60 * HZ)
+			|| !data->valid) {
+		for (nr = 0; nr < 2; nr++) {
+			data->temp_high[nr] =
+				f75375_read8(client, F75375_REG_TEMP_HIGH(nr));
+			data->temp_max_hyst[nr] =
+				f75375_read8(client, F75375_REG_TEMP_HYST(nr));
+		}
+		data->last_limits = jiffies;
+	}
+
+	/* Measurement registers cache is refreshed after 2 second */
+	if (time_after(jiffies, data->last_updated + 2 * HZ)
+			|| !data->valid) {
+		for (nr = 0; nr < 2; nr++) {
+			/* assign MSB, therefore shift it by 8 bits */
+			data->temp11[nr] = f75375_read8(client, F75375_REG_TEMP(nr)) << 8;
+			if (data->kind == f75387)
+				/* merge F75387's temperature LSB (11-bit) */
+				data->temp11[nr] |= f75375_read8(client, F75387_REG_TEMP11_LSB(nr));
+		}
+		data->last_updated = jiffies;
+		data->valid = 1;
+	}
+
+	mutex_unlock(&data->update_lock);
+	return data;
+}
+
+#define TEMP_FROM_REG(val) ((val) * 1000)
+#define TEMP_TO_REG(val) ((val) / 1000)
+#define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
+
+static ssize_t show_temp11(struct device *dev, struct device_attribute *attr,
+		char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct f75375_data *data = f75375_update_device(dev);
+
+	return sprintf(buf, "%d\n", TEMP11_FROM_REG(data->temp11[nr]));
+}
+
+static ssize_t show_temp_max(struct device *dev, struct device_attribute *attr,
+		char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct f75375_data *data = f75375_update_device(dev);
+
+	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_high[nr]));
+}
+
+static ssize_t show_temp_max_hyst(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct f75375_data *data = f75375_update_device(dev);
+
+	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max_hyst[nr]));
+}
+
+static ssize_t set_temp_max(struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct i2c_client *client = to_i2c_client(dev);
+	struct f75375_data *data = i2c_get_clientdata(client);
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	val = clamp_val(TEMP_TO_REG(val), 0, 127);
+	mutex_lock(&data->update_lock);
+	data->temp_high[nr] = val;
+	f75375_write8(client, F75375_REG_TEMP_HIGH(nr), data->temp_high[nr]);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
+static ssize_t set_temp_max_hyst(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	int nr = to_sensor_dev_attr(attr)->index;
+	struct i2c_client *client = to_i2c_client(dev);
+	struct f75375_data *data = i2c_get_clientdata(client);
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	val = clamp_val(TEMP_TO_REG(val), 0, 127);
+	mutex_lock(&data->update_lock);
+	data->temp_max_hyst[nr] = val;
+	f75375_write8(client, F75375_REG_TEMP_HYST(nr),
+			data->temp_max_hyst[nr]);
+	mutex_unlock(&data->update_lock);
+	return count;
+}
+
+static ssize_t get_ec_hwmon_name(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return	sprintf(buf, "advhwmon\n");
+}
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
+static ssize_t get_ec_in5_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "VIN1\n");
+}
+
+static ssize_t get_ec_in6_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "VIN2\n");
+}
+
+static ssize_t get_ec_in7_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "System Voltage\n");
+}
+
+static ssize_t get_ec_in8_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return  sprintf(buf, "Vin\n");
+}
+
+static ssize_t get_ec_curr1_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "Current\n");
+}
+
+static ssize_t get_ec_curr2_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "Current\n");
+}
+
+static ssize_t get_ec_power1_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "Power\n");
+}
+
+static ssize_t get_ec_temp1_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "Temp Board\n");
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
+static ssize_t get_ec_temp3_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "Temp System\n");
+}
+
+static ssize_t get_ec_temp3_crit(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "100000\n");
+}
+
+static ssize_t get_ec_temp3_crit_alarm(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "0\n");
+}
+
+static ssize_t get_ec_in1_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar temp;
+	uchar voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	temp = read_ad_value(ptbl->vbat[0], ptbl->vbat[1]);
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
+	uchar temp;
+	uchar voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	temp = read_ad_value(ptbl->v5[0], ptbl->v5[1]);
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
+	uchar temp;
+	uchar voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	temp = read_ad_value(ptbl->v12[0], ptbl->v12[1]);
+	if (temp == -1)
+		temp  =  read_ad_value(ptbl->vdc[0], ptbl->vdc[1]);
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
+	uchar temp;
+	uchar voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	temp = read_ad_value(ptbl->vcore[0], ptbl->vcore[1]);
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
+static ssize_t get_ec_curr1_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar temp;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	temp = read_ad_value(ptbl->ec_current[0], ptbl->ec_current[1]);
+
+	if (profile->r2 != 0)
+		temp = temp * (profile->r1 + profile->r2) / profile->r2;
+
+	if (profile->resolution != 0)
+		temp =  temp * profile->resolution / 1000 / 1000;
+
+	if (profile->offset != 0)
+		temp += (int)profile->offset * 100;
+
+	lmsensor_data.ec_current[3] = temp;
+	return sprintf(buf, "%d\n", 10*lmsensor_data.ec_current[3]);
+}
+
+static void get_temperaturedts(uchar *pvalue)
+{
+	u32 eax, edx;
+	uchar temp;
+
+	rdmsr_on_cpu(1, MSR_IA32_THERM_STATUS, &eax, &edx);
+	temp = 100000-((eax>>16)&0x7f) * 1000;
+	*pvalue = temp;
+}
+
+static void ec_get_temperature_value_via_lm96163_ec_smbus(uchar *temperature)
+{
+	int ret;
+	struct EC_SMBUS_READ_BYTE in_data = {
+		.Channel = NSLM96163_CHANNEL,
+		.Address = NSLM96163_ADDR,
+		.Register = NSLM96163_LOC_TEMP,
+		.Data = 0,
+	};
+
+	ret = smbus_read_byte(&in_data);
+	if (ret)
+		dev_err(lmsensor_data.dev, "smbus_read_byte error.");
+	else
+		*temperature = (unsigned long)in_data.Data * 10;
+}
+
+static ssize_t ec_get_sys_temperature_value_via_f75387_ec_smbus(uchar *temperature)
+{
+	int ret;
+	uchar Temp_MSB, Temp_LSB;
+
+	struct EC_SMBUS_READ_BYTE in_data = {
+		.Channel = lmsensor_data.ec_smboem0.HWPinNumber & 0x03,
+		.Address = LMF75387_SMBUS_SLAVE_ADDRESS_5A,
+		.Register = F75387_REG_R_TEMP0_MSB,
+		.Data = 0,
+	};
+
+	ret = smbus_read_byte(&in_data);
+	if (ret)
+		dev_err(lmsensor_data.dev, "smbus_read_byte error.\n");
+
+	Temp_MSB = in_data.Data;
+	if (Temp_MSB != 0xFF) {
+		in_data.Register = F75387_REG_R_TEMP0_LSB;
+		ret = smbus_read_byte(&in_data);
+		if (ret)
+			dev_err(lmsensor_data.dev, "smbus_read_byte error.\n");
+
+		Temp_LSB = in_data.Data;
+	} else {
+		Temp_MSB = 0;
+		Temp_LSB = 0;
+	}
+	*temperature = Temp_MSB + Temp_LSB/256;
+
+	return 0;
+}
+
+static int ec_get_voltage_v1_value_via_f75387_ec_smbus(uchar *voltage)
+{
+	int ret;
+	struct EC_SMBUS_READ_BYTE in_data = {
+		.Channel = lmsensor_data.ec_smboem0.HWPinNumber & 0x03,
+		.Address = LMF75387_SMBUS_SLAVE_ADDRESS_5A,
+		.Register = F75387_REG_R_V1,
+		.Data = 0,
+	};
+
+	ret = smbus_read_byte(&in_data);
+	if (ret)
+		dev_err(lmsensor_data.dev, "smbus_read_byte error.\n");
+
+	*voltage = in_data.Data;
+	return 0;
+}
+
+static int ec_get_voltage_v2_value_via_f75387_ec_smbus(uchar *voltage)
+{
+	int ret;
+	struct EC_SMBUS_READ_BYTE in_data = {
+		.Channel = lmsensor_data.ec_smboem0.HWPinNumber & 0x03,
+		.Address = LMF75387_SMBUS_SLAVE_ADDRESS_5A,
+		.Register = F75387_REG_R_V2,
+		.Data = 0,
+	};
+
+	ret = smbus_read_byte(&in_data);
+	if (ret)
+		dev_err(lmsensor_data.dev, "smbus_read_byte error.\n");
+
+	*voltage = in_data.Data;
+	return 0;
+}
+
+static int ec_get_voltage_system_value_via_ina226_ec_smbus(uchar *voltage)
+{
+	int ret;
+	struct EC_SMBUS_WORD_DATA in_data = {
+		.Channel = lmsensor_data.ec_smboem0.HWPinNumber & 0x03,
+		.Address = INA266_SMBUS_SLAVE_ADDRESS_8A,
+		.Register = INA266_REG_VOLTAGE,
+		.Value = 0,
+	};
+
+	ret = smbus_read_word(&in_data);
+	if (ret)
+		dev_err(lmsensor_data.dev, "smbus_read_word error.\n");
+
+	*voltage = in_data.Value;
+	return 0;
+}
+
+static int ec_get_current_value_via_ina226_ec_smbus(uchar *curr)
+{
+	int ret;
+	struct EC_SMBUS_WORD_DATA in_data = {
+		.Channel = lmsensor_data.ec_smboem0.HWPinNumber & 0x03,
+		.Address = INA266_SMBUS_SLAVE_ADDRESS_8A,
+		.Register = INA266_REG_CURRENT,
+		.Value = 0,
+	};
+
+	ret = smbus_read_word(&in_data);
+	if (ret)
+		dev_err(lmsensor_data.dev, "smbus_read_word error.\n");
+
+	*curr = in_data.Value;
+	return 0;
+}
+
+static int ec_get_power_value_via_ina226_ec_smbus(uchar *power)
+{
+	int ret;
+	struct EC_SMBUS_WORD_DATA in_data = {
+		.Channel = lmsensor_data.ec_smboem0.HWPinNumber & 0x03,
+		.Address = INA266_SMBUS_SLAVE_ADDRESS_8A,
+		.Register = INA266_REG_POWER,
+		.Value = 0,
+	};
+
+	ret = smbus_read_word(&in_data);
+	if (ret)
+		dev_err(lmsensor_data.dev, "smbus_read_word error.\n");
+
+	*power = in_data.Value;
+	return 0;
+}
+
+static ssize_t get_ec_temp2_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar temp = 0;
+	uchar value;
+	char *product = lmsensor_data.bios_product_name;
+
+	if (!adspname_detect(product, "TPC-8100TR")) {
+		get_temperaturedts(&temp);
+		return sprintf(buf, "%d\n", temp);
+	} else if (!adspname_detect(product, "TPC-*51T-E??E")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if ((!adspname_detect(product, "TPC-*51WP-E?AE"))
+			|| (!adspname_detect(product, "TPC-*81WP-4???E"))) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "TPC-1?82H-4???E")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if ((!adspname_detect(product, "TPC-B500-6??AE"))
+				|| (!adspname_detect(product, "TPC-5???T-6??AE"))
+				|| (!adspname_detect(product, "TPC-5???W-6??AE"))
+				|| (!adspname_detect(product, "TPC-B200-???AE"))
+				|| (!adspname_detect(product, "TPC-2???T-???AE"))
+				|| (!adspname_detect(product, "TPC-2???W-???AE"))) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-1172A")) {
+		ec_get_temperature_value_via_lm96163_ec_smbus(&temp);
+		return sprintf(buf, "%d\n", 100*temp);
+	} else if (!adspname_detect(product, "UNO-1372G-E?AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-1372G-J0?1AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-1483G-4??AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-2372G")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-2473G")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-2271G-E??AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-2271G-E???AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-420")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-2483G-4??AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-2484G-6???AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-2484G-7???AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-3283G/3285G-674AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "UNO-3483G-3??AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "PR/VR4")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "ECU-4784")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	} else if (!adspname_detect(product, "APAX-5580-4??AE")) {
+		read_acpi_value(0x61, &value);
+		return sprintf(buf, "%d\n", 1000*value);
+	}
+
+	return 0;
+}
+
+static ssize_t get_ec_temp3_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar temp = 0;
+	char *product = lmsensor_data.bios_product_name;
+
+	if (!adspname_detect(product, "APAX-5580-4??AE")) {
+		ec_get_sys_temperature_value_via_f75387_ec_smbus(&temp);
+		return sprintf(buf, "%d\n", 1000*temp);
+	} else if (!adspname_detect(product, "PR/VR4")) {
+		read_acpi_value(0x60, &temp);
+		return sprintf(buf, "%d\n", 1000*temp);
+	}
+
+	return 0;
+}
+
+static ssize_t get_ec_in5_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar voltage = 0;
+	char *product = lmsensor_data.bios_product_name;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	if (!adspname_detect(product, "APAX-5580-4??AE")) {
+		ec_get_voltage_v1_value_via_f75387_ec_smbus(&voltage);
+
+		if (profile->r2_vin != 0)
+			voltage = voltage * (profile->r1_vin + profile->r2_vin) / profile->r2_vin;
+
+		if (profile->resolution_vin != 0)
+			voltage = voltage * profile->resolution_vin / 1000;
+
+		if (profile->offset != 0)
+			voltage += (int)profile->offset * 100;
+
+		lmsensor_data.voltage[4] = voltage;
+		return sprintf(buf, "%d\n", lmsensor_data.voltage[4]);
+	}
+
+	return 0;
+}
+
+static ssize_t get_ec_in6_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar voltage = 0;
+	char *product = lmsensor_data.bios_product_name;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	if (!adspname_detect(product, "APAX-5580-4??AE")) {
+		ec_get_voltage_v2_value_via_f75387_ec_smbus(&voltage);
+
+		if (profile->r2_vin != 0)
+			voltage = voltage * (profile->r1_vin + profile->r2_vin) / profile->r2_vin;
+
+		if (profile->resolution_vin != 0)
+			voltage = voltage * profile->resolution_vin / 1000;
+
+		if (profile->offset != 0)
+			voltage += (int)profile->offset * 100;
+
+		lmsensor_data.voltage[5] = voltage;
+		return sprintf(buf, "%d\n", lmsensor_data.voltage[5]);
+	}
+
+	return 0;
+}
+
+static ssize_t get_ec_in7_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar voltage = 0;
+	char *product = lmsensor_data.bios_product_name;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	if (!adspname_detect(product, "APAX-5580-4??AE")) {
+		ec_get_voltage_system_value_via_ina226_ec_smbus(&voltage);
+
+		if (profile->r2_sys != 0)
+			voltage = voltage * (profile->r1_sys + profile->r2_sys) / profile->r2_sys;
+
+		if (profile->resolution_sys != 0)
+			voltage = voltage * profile->resolution_sys / 1000;
+
+		if (profile->offset != 0)
+			voltage += (int)profile->offset * 100;
+
+		lmsensor_data.voltage[5] = voltage;
+		return sprintf(buf, "%d\n", lmsensor_data.voltage[5]);
+	}
+
+	return 0;
+}
+
+static ssize_t get_ec_in8_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar temp;
+	uchar voltage = 0;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	temp  =  read_ad_value(ptbl->v12[0], ptbl->v12[1]);
+	if (temp == -1)
+		temp  =  read_ad_value(ptbl->vdc[0], ptbl->vdc[1]);
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
+	return sprintf(buf, "%d\n", lmsensor_data.voltage[2]);
+}
+
+static ssize_t get_ec_curr2_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar temp = 0;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	ec_get_current_value_via_ina226_ec_smbus(&temp);
+	if (profile->r2_curr != 0)
+		temp = temp * (profile->r1_curr + profile->r2_curr) / profile->r2_curr;
+
+	if (profile->resolution_curr != 0)
+		temp = temp * profile->resolution_curr / 1000;
+
+	if (profile->offset != 0)
+		temp += (int)profile->offset * 100;
+
+	lmsensor_data.ec_current[4] = temp;
+	return sprintf(buf, "%d\n", lmsensor_data.ec_current[4]);
+}
+
+static ssize_t get_ec_power1_input(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	uchar temp = 0;
+	struct adv_hwmon_profile *profile = lmsensor_data.profile;
+
+	ec_get_power_value_via_ina226_ec_smbus(&temp);
+
+	if (profile->r2_power != 0)
+		temp = temp * (profile->r1_power + profile->r2_power) / profile->r2_power;
+
+	if (profile->resolution_power != 0)
+		temp = temp * profile->resolution_power / 1000;
+
+	if (profile->offset != 0)
+		temp += (int)profile->offset * 100;
+
+	lmsensor_data.power[1] = 1000*temp;
+	return sprintf(buf, "%d\n", lmsensor_data.power[1]);
+}
+
+static SENSOR_DEVICE_ATTR(name, 0444, get_ec_hwmon_name, NULL, 0);
+static SENSOR_DEVICE_ATTR(in1_input, 0444, get_ec_in1_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in1_label, 0444, get_ec_in1_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in2_input, 0444, get_ec_in2_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in2_label, 0444, get_ec_in2_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in3_input, 0444, get_ec_in3_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in3_label, 0444, get_ec_in3_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in4_input, 0444, get_ec_in4_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in4_label, 0444, get_ec_in4_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in5_input, 0444, get_ec_in5_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in5_label, 0444, get_ec_in5_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in6_input, 0444, get_ec_in6_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in6_label, 0444, get_ec_in6_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in7_input, 0444, get_ec_in7_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in7_label, 0444, get_ec_in7_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(in8_input, 0444, get_ec_in8_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(in8_label, 0444, get_ec_in8_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(curr1_label, 0444, get_ec_curr1_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(curr1_input, 0444, get_ec_curr1_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(curr2_label, 0444, get_ec_curr2_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(curr2_input, 0444, get_ec_curr2_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(power1_label, 0444, get_ec_power1_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(power1_input, 0444, get_ec_power1_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_label, 0444, get_ec_temp1_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, show_temp11, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_max_hyst, 0644, show_temp_max_hyst, set_temp_max_hyst, 0);
+static SENSOR_DEVICE_ATTR(temp1_max, 0644, show_temp_max, set_temp_max, 0);
+static SENSOR_DEVICE_ATTR(temp2_label, 0444, get_ec_temp2_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_input, 0444, get_ec_temp2_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_crit, 0400, get_ec_temp2_crit, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_crit_alarm, 0400, get_ec_temp2_crit_alarm, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp3_label, 0444, get_ec_temp3_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp3_input, 0444, get_ec_temp3_input, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp3_crit, 0400, get_ec_temp3_crit, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp3_crit_alarm, 0400, get_ec_temp3_crit_alarm, NULL, 0);
+
+/*
+ * Support list:
+ * TPC-8100TR, TPC-651T-E3AE, TPC-1251T-E3AE, TPC-1551T-E3AE,
+ * TPC-1751T-E3AE, TPC-1051WP-E3AE, TPC-1551WP-E3AE, TPC-1581WP-433AE
+ * TPC-1782H-433AE,
+ * UNO-1483G-434AE, UNO-2483G-434AE, UNO-3483G-374AE, UNO-2473G
+ * UNO-2484G-6???AE, UNO-2484G-7???AE, UNO-3283G-674AE, UNO-3285G-674AE
+ */
+static const struct attribute *ec_hwmon_attrs_TEMPLATE[] = {
+	&sensor_dev_attr_name.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in3_input.dev_attr.attr,
+	&sensor_dev_attr_in3_label.dev_attr.attr,
+	&sensor_dev_attr_in4_input.dev_attr.attr,
+	&sensor_dev_attr_in4_label.dev_attr.attr,
+	&sensor_dev_attr_curr1_label.dev_attr.attr,
+	&sensor_dev_attr_curr1_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	NULL
+};
+
+/*
+ * Support list:
+ * TPC-B500-6??AE
+ * TPC-5???T-6??AE
+ * TPC-5???W-6??AE
+ * TPC-B200-???AE
+ * TPC-2???T-???AE
+ * TPC-2???W-???AE
+ */
+static const struct attribute *ec_hwmon_attrs_TPC5XXX[] = {
+	&sensor_dev_attr_name.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in3_input.dev_attr.attr,
+	&sensor_dev_attr_in3_label.dev_attr.attr,
+	&sensor_dev_attr_in4_input.dev_attr.attr,
+	&sensor_dev_attr_in4_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	NULL
+};
+
+/*
+ * Support list:
+ * PR/VR4
+ */
+static const struct attribute *ec_hwmon_attrs_PRVR4[] = {
+	&sensor_dev_attr_name.dev_attr.attr,
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
+	&sensor_dev_attr_temp3_label.dev_attr.attr,
+	&sensor_dev_attr_temp3_input.dev_attr.attr,
+	&sensor_dev_attr_temp3_crit.dev_attr.attr,
+	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
+	NULL
+};
+
+/*
+ * Support list:
+ * UNO-2271G-E22AE/E23AE/E022AE/E023AE, UNO-420
+ */
+static const struct attribute *ec_hwmon_attrs_UNO2271G[] = {
+	&sensor_dev_attr_name.dev_attr.attr,
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
+
+/*
+ * Support list:
+ * UNO-1172A
+ * ECU-4784
+ */
+static const struct attribute *ec_hwmon_attrs_UNO1172A[] = {
+	&sensor_dev_attr_name.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in3_input.dev_attr.attr,
+	&sensor_dev_attr_in3_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	NULL
+};
+
+/*
+ * Support list:
+ * UNO-1372G
+ */
+static const struct attribute *ec_hwmon_attrs_UNO1372G[] = {
+	&sensor_dev_attr_name.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in4_input.dev_attr.attr,
+	&sensor_dev_attr_in4_label.dev_attr.attr,
+	&sensor_dev_attr_in8_input.dev_attr.attr,
+	&sensor_dev_attr_in8_label.dev_attr.attr,
+	&sensor_dev_attr_curr1_label.dev_attr.attr,
+	&sensor_dev_attr_curr1_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	NULL
+};
+
+/*
+ * Support list:
+ * UNO-2372G, UNO-1372G-J021AE/J031AE
+ */
+static const struct attribute *ec_hwmon_attrs_UNO2372G[] = {
+	//sor_dev_attr_name.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in4_input.dev_attr.attr,
+	&sensor_dev_attr_in4_label.dev_attr.attr,
+	&sensor_dev_attr_in8_input.dev_attr.attr,
+	&sensor_dev_attr_in8_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	NULL
+};
+
+/*
+ * Support list:
+ * APAX-5580-433AE/473AE/4C3AE
+ */
+static const struct attribute *ec_hwmon_attrs_APAX5580[] = {
+	&sensor_dev_attr_name.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_input.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in5_input.dev_attr.attr,
+	&sensor_dev_attr_in5_label.dev_attr.attr,
+	&sensor_dev_attr_in6_input.dev_attr.attr,
+	&sensor_dev_attr_in6_label.dev_attr.attr,
+	&sensor_dev_attr_in7_input.dev_attr.attr,
+	&sensor_dev_attr_in7_label.dev_attr.attr,
+	&sensor_dev_attr_curr2_label.dev_attr.attr,
+	&sensor_dev_attr_curr2_input.dev_attr.attr,
+	&sensor_dev_attr_power1_label.dev_attr.attr,
+	&sensor_dev_attr_power1_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp3_label.dev_attr.attr,
+	&sensor_dev_attr_temp3_input.dev_attr.attr,
+	&sensor_dev_attr_temp3_crit.dev_attr.attr,
+	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
+	NULL
+};
+
+static struct attribute *f75375_attributes[] = {
+	&sensor_dev_attr_temp1_label.dev_attr.attr,
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group f75375_group = {
+	.attrs = f75375_attributes,
+};
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
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_TEMPLATE,
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
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_TPC5XXX,
+	},
+	/* PR/VR4 (2) */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_PRVR4,
+	},
+	/* UNO-2271G-E22AE/E23AE/E022AE/E023AE,UNO-420 (3) */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_UNO2271G,
+	},
+	/* UNO-1172A, ECU-4784 (4) */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_UNO1172A,
+	},
+	/* UNO-1372G (5) */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_UNO1372G,
+	},
+	/* UNO-2372G, UNO-1372G-J021AE/J031AE (6) */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_UNO2372G,
+	},
+	/* APAX-5580-433AE, APAX-5580-473AE, APAX-5580-4C3AE (7) */
+	{
+		.resolution = 2929,
+		.resolution_sys = 1250,
+		.resolution_curr = 1000,
+		.resolution_power = 25000,
+		.r1 = 0,
+		.r1_vin = 1120,
+		.r1_sys = 0,
+		.r1_curr = 0,
+		.r1_power = 0,
+		.r2 = 0,
+		.r2_vin = 56,
+		.r2_sys = 0,
+		.r2_curr = 0,
+		.r2_power = 0,
+		.offset = 0,
+		.ec_hwmon_group.attrs = (struct attribute **)ec_hwmon_attrs_APAX5580,
+	},
+};
+
+static int adspname_detect(const char *bios_product_name, const char *standard_name)
+{
+	int i, j;
+
+	i = 0;
+
+	for (j = 0; j < strlen(bios_product_name); j++) {
+		if (standard_name[i] == '*') {
+			if (i) {
+				if (bios_product_name[j] == standard_name[(i + 1)])
+					i += 2;
+
+				if (i >= (strlen(standard_name) - 1))
+					return 0;
+			}
+		} else if (standard_name[i] == '?') {
+			if (i) {
+				i++;
+				if (i >= strlen(standard_name))
+					return 0;
+			}
+		} else if (bios_product_name[j] == standard_name[i]) {
+			i++;
+			if (i >= strlen(standard_name))
+				return 0;
+		}
+	}
+
+	return 1;
+}
+
+static void adv_ec_init_hwmon_profile(u32 profile, struct adv_ec_platform_data *plat_data)
+{
+	int i;
+	struct HW_PIN_TBL *ptbl = &lmsensor_data.pin_tbl;
+	struct Dynamic_Tab *dym_tbl = plat_data->dym_tbl;
+
+	lmsensor_data.bios_product_name = plat_data->bios_product_name;
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
+static int f75375_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct f75375_data *data;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -EIO;
+	data = devm_kzalloc(&client->dev, sizeof(struct f75375_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, data);
+	mutex_init(&data->update_lock);
+	data->kind = id->driver_data;
+
+	err = sysfs_create_group(&client->dev.kobj, &f75375_group);
+	if (err)
+		return err;
+
+	data->hwmon_dev = hwmon_device_register(&client->dev);
+	if (IS_ERR(data->hwmon_dev)) {
+		err = PTR_ERR(data->hwmon_dev);
+		goto exit_remove;
+	}
+	return 0;
+
+exit_remove:
+	sysfs_remove_group(&client->dev.kobj, &f75375_group);
+	return err;
+}
+
+static int f75375_remove(struct i2c_client *client)
+{
+	struct f75375_data *data = i2c_get_clientdata(client);
+
+	hwmon_device_unregister(data->hwmon_dev);
+	sysfs_remove_group(&client->dev.kobj, &f75375_group);
+	return 0;
+}
+
+/* Return 0 if detection is successful, -ENODEV otherwise */
+static int f75375_detect(struct i2c_client *client, struct i2c_board_info *info)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	u16 vendid, chipid;
+	u8 version;
+	const char *name;
+
+	vendid = f75375_read16(client, F75375_REG_VENDOR);
+	chipid = f75375_read16(client, F75375_CHIP_ID);
+	dev_info(&adapter->dev, "VendID: 0x%x, ChipID: 0x%x", vendid, chipid);
+
+	if (vendid != 0x1934)
+		return -ENODEV;
+
+	if (chipid == 0x0306)
+		name = "f75375";
+	else if (chipid == 0x0204)
+		name = "f75373";
+	else if (chipid == 0x0410)
+		name = "f75387";
+	else
+		return -ENODEV;
+
+	version = f75375_read8(client, F75375_REG_VERSION);
+	dev_info(&adapter->dev, "found %s version: %02X\n", name, version);
+	strlcpy(info->type, name, I2C_NAME_SIZE);
+
+	return 0;
+}
+
+static int adv_ec_hwmon_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+	u32 profile;
+	struct adv_ec_platform_data *adv_ec_data = NULL;
+
+	adv_ec_data = (struct adv_ec_platform_data *)dev_get_drvdata(pdev->dev.parent);
+
+	ret = device_property_read_u32(pdev->dev.parent, "advantech,hwmon-profile", &profile);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "get hwmon-profile failed! (%d)", ret);
+		return ret;
+	}
+
+	adv_ec_init_hwmon_profile(profile, adv_ec_data);
+
+	lmsensor_data.dev = &pdev->dev;
+	lmsensor_data.hwmon_dev = hwmon_device_register(NULL);
+
+	if (IS_ERR(lmsensor_data.hwmon_dev)) {
+		ret = -ENOMEM;
+		dev_err(lmsensor_data.dev, "hwmon_dev register failed\n");
+		goto fail_hwmon_device_register;
+	}
+
+	ret = sysfs_create_group(&lmsensor_data.hwmon_dev->kobj,
+			&lmsensor_data.profile->ec_hwmon_group);
+	if (ret) {
+		dev_err(lmsensor_data.dev, "failed to creat ec hwmon\n");
+		goto fail_create_group_hwmon;
+	}
+
+	if (!adspname_detect(adv_ec_data->bios_product_name, "UNO-1172A")) {
+		ret = i2c_add_driver(&f75375_driver);
+		if (ret)
+			dev_err(lmsensor_data.dev, "failed to register driver f75375.\n");
+	}
+
+	dev_info(&pdev->dev, "Ver:%s, Data:%s, probe done",
+			ADVANTECH_EC_HWMON_VER, ADVANTECH_EC_HWMON_DATE);
+
+	return ret;
+
+fail_create_group_hwmon:
+	sysfs_remove_group(&lmsensor_data.hwmon_dev->kobj, &lmsensor_data.profile->ec_hwmon_group);
+fail_hwmon_device_register:
+	hwmon_device_unregister(lmsensor_data.hwmon_dev);
+
+	return ret;
+}
+
+static int adv_ec_hwmon_remove(struct platform_device *pdev)
+{
+	sysfs_remove_group(&lmsensor_data.hwmon_dev->kobj, &lmsensor_data.profile->ec_hwmon_group);
+	hwmon_device_unregister(lmsensor_data.hwmon_dev);
+	if (!adspname_detect(lmsensor_data.bios_product_name, "UNO-1172A"))
+		i2c_del_driver(&f75375_driver);
+
+	return 0;
+}
+
+static struct platform_driver adv_hwmon_drv = {
+	.driver = {
+		.name = "adv-ec-hwmon",
+	},
+	.probe = adv_ec_hwmon_probe,
+	.remove = adv_ec_hwmon_remove,
+};
+
+module_platform_driver(adv_hwmon_drv);
+
+MODULE_DESCRIPTION("Advantech EC Hwmon Driver.");
+MODULE_AUTHOR("Jiangwei.Zhu");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.17.1

