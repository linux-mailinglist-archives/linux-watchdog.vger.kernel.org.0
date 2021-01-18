Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B754E2FA007
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 13:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391693AbhARMjQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 07:39:16 -0500
Received: from aclms3.advantech.com.tw ([125.252.70.86]:57631 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391461AbhARMjN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 07:39:13 -0500
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te423a07b8eac1401c812dc@ACLMS4.ADVANTECH.CORP>;
 Mon, 18 Jan 2021 20:37:43 +0800
Received: from localhost (172.16.12.146) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 20:37:58 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v6 5/6] hwmon: ahc1ec0-hwmon: Add sub-device hwmon for Advantech embedded controller
Date:   Mon, 18 Jan 2021 20:37:48 +0800
Message-ID: <20210118123749.4769-5-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210118123749.4769-1-campion.kang@advantech.com.tw>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.12.146]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: EAA571C403B5202C79C00140ADCE961CC8482AA6B269BEF12E73FFABF951F0FC2000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is one of sub-device driver for Advantech embedded controller
AHC1EC0. This driver provides sysfs ABI for Advantech related
applications to monitor the system status.

Changed since V5:
	- remove unnecessary header files
	- Using [devm_]hwmon_device_register_with_info() to register
hwmon driver based on reviewer's suggestion

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 drivers/hwmon/Kconfig         |  10 +
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/ahc1ec0-hwmon.c | 660 ++++++++++++++++++++++++++++++++++
 3 files changed, 671 insertions(+)
 create mode 100644 drivers/hwmon/ahc1ec0-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 1ecf697d8d99..bfa007026679 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2139,6 +2139,16 @@ config SENSORS_INTEL_M10_BMC_HWMON
 	  sensors monitor various telemetry data of different components on the
 	  card, e.g. board temperature, FPGA core temperature/voltage/current.
 
+config SENSORS_AHC1EC0_HWMON
+	tristate "Advantech AHC1EC0 Hardware Monitor Function"
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
index 000000000000..688f07e6a6e0
--- /dev/null
+++ b/drivers/hwmon/ahc1ec0-hwmon.c
@@ -0,0 +1,660 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HWMON Driver for Advantech Embedded Controller chip AHC1EC0
+ *
+ * Copyright 2020, Advantech IIoT Group
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/mfd/ahc1ec0.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+struct ec_hwmon_attrs {
+	const char		*name;
+	umode_t			mode;
+	int (*read)(struct device *dev, long *val);
+};
+
+struct adv_hwmon_profile {
+	int offset;
+	unsigned long resolution, resolution_vin, resolution_sys, resolution_curr, resolution_power;
+	unsigned long r1, r1_vin, r1_sys, r1_curr, r1_power;
+	unsigned long r2, r2_vin, r2_sys, r2_curr, r2_power;
+	int hwmon_in_list_cnt;
+	int temp_list_cnt;
+	int *hwmon_in_list;
+	int *temp_list;
+};
+
+struct ec_hwmon_data {
+	struct device *dev;
+	struct device *hwmon_dev;
+	struct adv_ec_platform_data *adv_ec_data;
+	unsigned long temperature[3];
+	unsigned long ec_current[5];
+	unsigned long power[5];
+	unsigned long voltage[7];
+
+	struct ec_hw_pin_table pin_tbl;
+	struct ec_smbuso_em0 ec_smboem0;
+	struct adv_hwmon_profile *profile;
+};
+
+static int get_ec_in_vbat_input(struct device *dev, long *val);
+static int get_ec_in_v5_input(struct device *dev, long *val);
+static int get_ec_in_v12_input(struct device *dev, long *val);
+static int get_ec_in_vcore_input(struct device *dev, long *val);
+static int get_ec_current1_input(struct device *dev, long *val);
+static int get_ec_cpu_temp(struct device *dev, long *val);
+static int get_ec_sys_temp(struct device *dev, long *val);
+
+const struct ec_hwmon_attrs ec_hwmon_in_attr_template[] = {
+	{"VBAT",	0444, get_ec_in_vbat_input},	// in1
+	{"5VSB",	0444, get_ec_in_v5_input},	// in2
+	{"Vin",		0444, get_ec_in_v12_input},	// in3 (== in8)
+	{"VCORE",	0444, get_ec_in_vcore_input},	// in4
+	{"Vin1",	0444, NULL},	// in5
+	{"Vin2",	0444, NULL},	// in6
+	{"System Voltage", 0444, NULL},	// in7
+	{"Current",	0444, get_ec_current1_input},
+};
+
+const struct ec_hwmon_attrs ec_temp_attrs_template[] = {
+	{"CPU Temp",	0444, get_ec_cpu_temp},
+	{"System Temp",	0444, get_ec_sys_temp},
+};
+
+enum ec_hwmon_in_type {
+	EC_HWMON_IN_VBAT,
+	EC_HWMON_IN_5VSB,
+	EC_HWMON_IN_12V,
+	EC_HWMON_IN_VCORE,
+	EC_HWMON_IN_VIN1,
+	EC_HWMON_IN_VIN2,
+	EC_HWMON_IN_SYS_VOL,
+	EC_HWMON_IN_CURRENT,
+};
+
+enum ec_temp_type {
+	EC_TEMP_CPU,
+	EC_TEMP_SYS,
+};
+
+static int hwmon_in_list_0[] = {
+	EC_HWMON_IN_VBAT,
+	EC_HWMON_IN_5VSB,
+	EC_HWMON_IN_12V,
+	EC_HWMON_IN_VCORE,
+	EC_HWMON_IN_CURRENT,
+};
+
+static int hwmon_in_list_1[] = {
+	EC_HWMON_IN_VBAT,
+	EC_HWMON_IN_5VSB,
+	EC_HWMON_IN_12V,
+	EC_HWMON_IN_VCORE,
+};
+
+static int temp_list_0[] = {
+	EC_TEMP_CPU,
+};
+
+static int temp_list_1[] = {
+	EC_TEMP_CPU,
+	EC_TEMP_SYS,
+};
+
+static struct adv_hwmon_profile advec_profile[] = {
+	/*
+	 * TPC-8100TR, TPC-651T-E3AE, TPC-1251T-E3AE, TPC-1551T-E3AE,
+	 * TPC-1751T-E3AE, TPC-1051WP-E3AE, TPC-1551WP-E3AE, TPC-1581WP-433AE,
+	 * TPC-1782H-433AE, UNO-1483G-434AE, UNO-2483G-434AE, UNO-3483G-374AE,
+	 * UNO-2473G, UNO-2484G-6???AE, UNO-2484G-7???AE, UNO-3283G-674AE,
+	 * UNO-3285G-674AE
+	 * [0] AHC1EC0_HWMON_PRO_TEMPLATE
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_0),
+		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
+		.hwmon_in_list = hwmon_in_list_0,
+		.temp_list = temp_list_0,
+	},
+	/*
+	 * TPC-B500-6??AE, TPC-5???T-6??AE, TPC-5???W-6??AE, TPC-B200-???AE,
+	 * TPC-2???T-???AE, TPC-2???W-???AE
+	 * [1] AHC1EC0_HWMON_PRO_TPC5XXX
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
+		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
+		.hwmon_in_list = hwmon_in_list_1,
+		.temp_list = temp_list_0,
+	},
+	/* PR/VR4
+	 * [2] AHC1EC0_HWMON_PRO_PRVR4
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
+		.temp_list_cnt = ARRAY_SIZE(temp_list_1),
+		.hwmon_in_list = hwmon_in_list_1,
+		.temp_list = temp_list_1,
+	},
+	/* UNO-2271G-E22AE/E23AE/E022AE/E023AE,UNO-420
+	 * [3] AHC1EC0_HWMON_PRO_UNO2271G
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
+		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
+		.hwmon_in_list = hwmon_in_list_1,
+		.temp_list = temp_list_0,
+	},
+};
+
+static void adv_ec_init_hwmon_profile(u32 profile, struct ec_hwmon_data *lmsensor_data)
+{
+	int i;
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
+	struct ec_dynamic_table *dym_tbl = adv_ec_data->dym_tbl;
+
+	if (profile >= ARRAY_SIZE(advec_profile))
+		return;
+
+	lmsensor_data->profile = &advec_profile[profile];
+
+	for (i = 0; i < EC_MAX_TBL_NUM ; i++) {
+		switch (dym_tbl[i].device_id) {
+		case EC_DID_CMOSBAT:
+			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vbat[1] = 1;
+			break;
+		case EC_DID_CMOSBAT_X2:
+			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vbat[1] = 2;
+			break;
+		case EC_DID_CMOSBAT_X10:
+			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vbat[1] = 10;
+			break;
+		case EC_DID_5VS0:
+		case EC_DID_5VS5:
+			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
+			ptbl->v5[1] = 1;
+			break;
+		case EC_DID_5VS0_X2:
+		case EC_DID_5VS5_X2:
+			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
+			ptbl->v5[1] = 2;
+			break;
+		case EC_DID_5VS0_X10:
+		case EC_DID_5VS5_X10:
+			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
+			ptbl->v5[1] = 10;
+			break;
+		case EC_DID_12VS0:
+			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
+			ptbl->v12[1] = 1;
+			break;
+		case EC_DID_12VS0_X2:
+			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
+			ptbl->v12[1] = 2;
+			break;
+		case EC_DID_12VS0_X10:
+			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
+			ptbl->v12[1] = 10;
+			break;
+		case EC_DID_VCOREA:
+		case EC_DID_VCOREB:
+			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vcore[1] = 1;
+			break;
+		case EC_DID_VCOREA_X2:
+		case EC_DID_VCOREB_X2:
+			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vcore[1] = 2;
+			break;
+		case EC_DID_VCOREA_X10:
+		case EC_DID_VCOREB_X10:
+			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vcore[1] = 10;
+			break;
+		case EC_DID_DC:
+			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vdc[1] = 1;
+			break;
+		case EC_DID_DC_X2:
+			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vdc[1] = 2;
+			break;
+		case EC_DID_DC_X10:
+			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
+			ptbl->vdc[1] = 10;
+			break;
+		case EC_DID_CURRENT:
+			ptbl->ec_current[0] = dym_tbl[i].hw_pin_num;
+			ptbl->ec_current[1] = 1;
+			break;
+		case EC_DID_SMBOEM0:
+			lmsensor_data->ec_smboem0.hw_pin_num = dym_tbl[i].hw_pin_num;
+			break;
+		default:
+			break;
+		}
+	}
+}
+
+static int get_ec_in_vbat_input(struct device *dev, long *val)
+{
+	unsigned int temp = 0;
+	unsigned long voltage = 0;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
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
+	lmsensor_data->voltage[0] = 10 * voltage;
+
+	*val = lmsensor_data->voltage[0];
+	return 0;
+}
+
+static int get_ec_in_v5_input(struct device *dev, long *val)
+{
+	unsigned int temp;
+	unsigned long voltage = 0;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
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
+	lmsensor_data->voltage[1] = 10 * voltage;
+
+	*val = lmsensor_data->voltage[1];
+	return 0;
+}
+
+static int get_ec_in_v12_input(struct device *dev, long *val)
+{
+	int temp;
+	unsigned long voltage = 0;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
+
+	temp = read_ad_value(adv_ec_data, ptbl->v12[0], ptbl->v12[1]);
+	if (temp == -1)
+		temp = read_ad_value(adv_ec_data, ptbl->vdc[0], ptbl->vdc[1]);
+
+	if (profile->r2 != 0)
+		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
+
+	if (profile->resolution != 0)
+		voltage =  temp * profile->resolution / 1000 / 1000;
+
+	if (profile->offset != 0)
+		voltage += profile->offset * 100;
+
+	lmsensor_data->voltage[2] = 10 * voltage;
+
+	*val = lmsensor_data->voltage[2];
+	return 0;
+}
+
+static int get_ec_in_vcore_input(struct device *dev, long *val)
+{
+	int temp;
+	unsigned int voltage = 0;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
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
+		voltage += profile->offset * 100;
+
+	lmsensor_data->voltage[3] = 10 * voltage;
+
+	*val = lmsensor_data->voltage[3];
+	return 0;
+}
+
+static int get_ec_current1_input(struct device *dev, long *val)
+{
+	int temp;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
+
+	temp = read_ad_value(adv_ec_data, ptbl->ec_current[0], ptbl->ec_current[1]);
+
+	if (profile->r2 != 0)
+		temp = temp * (profile->r1 + profile->r2) / profile->r2;
+
+	if (profile->resolution != 0)
+		temp = temp * profile->resolution / 1000 / 1000;
+
+	if (profile->offset != 0)
+		temp += profile->offset * 100;
+
+	lmsensor_data->ec_current[3] = 10 * temp;
+
+	*val = lmsensor_data->ec_current[3];
+	return 0;
+}
+
+static int get_ec_cpu_temp(struct device *dev, long *val)
+{
+	#define EC_ACPI_THERMAL1_REMOTE_TEMP 0x61
+
+	unsigned char value;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
+
+	read_acpi_value(adv_ec_data, EC_ACPI_THERMAL1_REMOTE_TEMP, &value);
+	*val = 1000 * value;
+	return 0;
+}
+
+static int get_ec_sys_temp(struct device *dev, long *val)
+{
+	#define EC_ACPI_THERMAL1_LOCAL_TEMP 0x60
+
+	unsigned char value;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+	struct adv_ec_platform_data *adv_ec_data = lmsensor_data->adv_ec_data;
+
+	read_acpi_value(adv_ec_data, EC_ACPI_THERMAL1_LOCAL_TEMP, &value);
+	*val = 1000 * value;
+	return 0;
+}
+
+
+static int
+ahc1ec0_read_in(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	if (!(lmsensor_data && lmsensor_data->profile))
+		return -EINVAL;
+
+	if (attr == hwmon_in_input &&
+		lmsensor_data->profile->hwmon_in_list_cnt > channel) {
+		int index = lmsensor_data->profile->hwmon_in_list[channel];
+		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_hwmon_in_attr_template[index];
+
+		return ec_hwmon_attr->read(dev, val);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int
+ahc1ec0_read_temp(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	if (!(lmsensor_data && lmsensor_data->profile))
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (lmsensor_data->profile->temp_list_cnt > channel) {
+			int index = lmsensor_data->profile->temp_list[channel];
+			const struct ec_hwmon_attrs *devec_hwmon_attr =
+				&ec_temp_attrs_template[index];
+
+			return devec_hwmon_attr->read(dev, val);
+		}
+		return -EOPNOTSUPP;
+	case hwmon_temp_crit:
+		// both CPU temp and System temp are all this value
+		*val = 100000;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+ahc1ec0_read_string(struct device *dev,
+					enum hwmon_sensor_types type,
+					u32 attr,
+					int channel,
+					const char **str)
+{
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	if (!(lmsensor_data && lmsensor_data->profile))
+		return -EINVAL;
+
+	if ((type == hwmon_in && attr == hwmon_in_label) &&
+		(lmsensor_data->profile->hwmon_in_list_cnt > channel)) {
+		int index = lmsensor_data->profile->hwmon_in_list[channel];
+		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_hwmon_in_attr_template[index];
+
+		*str = ec_hwmon_attr->name;
+		return 0;
+	}
+
+	if ((type == hwmon_temp && attr == hwmon_temp_label) &&
+		(lmsensor_data->profile->temp_list_cnt > channel)) {
+		int index = lmsensor_data->profile->temp_list[channel];
+		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_temp_attrs_template[index];
+
+		*str = ec_hwmon_attr->name;
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int
+ahc1ec0_read(struct device *dev,
+			enum hwmon_sensor_types type,
+			u32 attr,
+			int channel,
+			long *val)
+{
+	switch (type) {
+	case hwmon_in:
+		return ahc1ec0_read_in(dev, attr, channel, val);
+	case hwmon_temp:
+		return ahc1ec0_read_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t
+ec_hwmon_in_visible(const void *data, u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_in_input:
+	case hwmon_in_label:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static umode_t
+ec_temp_in_visible(const void *data, u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_crit:
+	case hwmon_temp_label:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static umode_t
+ahc1ec0_is_visible(const void *data,
+					enum hwmon_sensor_types type, u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		return ec_hwmon_in_visible(data, attr, channel);
+	case hwmon_temp:
+		return ec_temp_in_visible(data, attr, channel);
+	default:
+		return 0;
+	}
+}
+
+static const u32 ahc1ec0_in_config[] = {
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	HWMON_I_INPUT | HWMON_I_LABEL,
+	0
+};
+
+static const struct hwmon_channel_info ahc1ec0_in = {
+	.type = hwmon_in,
+	.config = ahc1ec0_in_config,
+};
+
+static const u32 ahc1ec0_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
+	0
+};
+
+static const struct hwmon_channel_info ahc1ec0_temp = {
+	.type = hwmon_temp,
+	.config = ahc1ec0_temp_config,
+};
+
+static const struct hwmon_channel_info *ahc1ec0_info[] = {
+	&ahc1ec0_in,
+	&ahc1ec0_temp,
+	NULL
+};
+
+static const struct hwmon_ops ahc1ec0_hwmon_ops = {
+	.is_visible = ahc1ec0_is_visible,
+	.read = ahc1ec0_read,
+	.read_string = ahc1ec0_read_string,
+};
+
+static const struct hwmon_chip_info ahc1ec0_chip_info = {
+	.ops = &ahc1ec0_hwmon_ops,
+	.info = ahc1ec0_info,
+};
+
+static int adv_ec_hwmon_probe(struct platform_device *pdev)
+{
+	int ret;
+	u32 profile;
+	struct device *dev = &pdev->dev;
+	struct adv_ec_platform_data *adv_ec_data;
+	struct ec_hwmon_data *lmsensor_data;
+
+	adv_ec_data = dev_get_drvdata(dev->parent);
+	if (!adv_ec_data)
+		return -EINVAL;
+
+	ret = device_property_read_u32(dev->parent, "advantech,hwmon-profile", &profile);
+	if (ret < 0) {
+		dev_err(dev, "get hwmon-profile failed! (%d)", ret);
+		return ret;
+	}
+
+	if (!(profile < ARRAY_SIZE(advec_profile))) {
+		dev_err(dev, "not support hwmon profile(%d)!\n", profile);
+		return -EINVAL;
+	}
+
+	lmsensor_data = devm_kzalloc(dev, sizeof(struct ec_hwmon_data), GFP_KERNEL);
+	if (!lmsensor_data)
+		return -ENOMEM;
+
+	lmsensor_data->adv_ec_data = adv_ec_data;
+	lmsensor_data->dev = dev;
+	dev_set_drvdata(dev, lmsensor_data);
+
+	adv_ec_init_hwmon_profile(profile, lmsensor_data);
+
+	lmsensor_data->hwmon_dev  = devm_hwmon_device_register_with_info(dev,
+			"ahc1ec0.hwmon", lmsensor_data, &ahc1ec0_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(lmsensor_data->hwmon_dev);
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
+MODULE_AUTHOR("Jianfeng Dai <jianfeng.dai@advantech.com.cn>");
+MODULE_VERSION("1.0");
-- 
2.17.1

