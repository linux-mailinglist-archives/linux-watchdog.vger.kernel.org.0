Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4AD3750DA
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbhEFI2O (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:28:14 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:61945 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbhEFI2M (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:28:12 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 04:27:37 EDT
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te64ee12c9cac14110e2c04@ACLMS4.ADVANTECH.CORP>;
 Thu, 6 May 2021 16:17:37 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 16:17:37 +0800
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
Subject: [PATCH v7 7/7] hwmon: ahc1ec0-hwmon: Add sub-device HWMON for Advantech embedded controller
Date:   Thu, 6 May 2021 16:16:19 +0800
Message-ID: <20210506081619.2443-7-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 17D97C150B64FD7FEDCA24745EDD2CB95B1FE93F05CFD4E64C7BC55E3F399E9E2000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is one of sub-device driver for Advantech embedded controller
AHC1EC0. This driver provides sysfs ABI for Advantech related
applications to monitor the system status.

Changed in V7:
	Fix the patch according to reviewer's comment:
	- add new document Documentation/hwmon/ahc1ec0-hwmon.rst to describe
	  the sensors attributes
	- pass the checking by checkpatch --strict command
	- remove unnecessary error checks
	- check channel account, return 0 if the second sensor is not
	  supported
	- make current sensor alone, not in hwmon sensors array

Changed in V6:
	- remove unnecessary header files
	- Using [devm_]hwmon_device_register_with_info() to register
	  HWMON driver based on reviewer's suggestion

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 Documentation/hwmon/ahc1ec0-hwmon.rst |  73 +++
 drivers/hwmon/Kconfig                 |  10 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/ahc1ec0-hwmon.c         | 701 ++++++++++++++++++++++++++
 4 files changed, 785 insertions(+)
 create mode 100644 Documentation/hwmon/ahc1ec0-hwmon.rst
 create mode 100644 drivers/hwmon/ahc1ec0-hwmon.c

diff --git a/Documentation/hwmon/ahc1ec0-hwmon.rst b/Documentation/hwmon/ahc1ec0-hwmon.rst
new file mode 100644
index 000000000000..7fcfb8b025d9
--- /dev/null
+++ b/Documentation/hwmon/ahc1ec0-hwmon.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver ahc1ec0-hwmon
+=================================
+
+Supported chips:
+
+ * Advantech AHC1 Embedded Controller Chip for Advantech Devices
+
+   Prefix: 'ahc1ec0-hwmon'
+
+   Datasheet: Datasheet is not publicly available.
+
+Author: Campion Kang <campion.kang@advantech.com.tw>
+
+
+Description
+-----------
+
+This driver adds the temperature, voltage, current support for the Advantech
+Devices with AHC1 Embedded Controller in Advantech IIoT Group.
+The AHC1EC0 firmware is responsible for sensor data sampling and recording in
+shared registers. The firmware is impleted by Advantech firmware team, it is
+a common design suitable for different hardware pins of Advantech devices.
+The host driver according to its hardware dynamic table and profile access its
+registers and exposes them to users as hwmon interfaces.
+
+The driver now is supports the AHC1EC0 for Advantech UNO, TPC series
+devices.
+
+Usage Notes
+-----------
+
+This driver will automatically probe and start via ahc1ec0 mfd driver
+according to the attributes in ACPI table or device tree. More detail settings
+you can refer the Documentation\devicetree\bindings\mfd\ahc1ec0.yaml.
+
+The ahc1ec0 driver will not probe automatic. You will have to instantiate
+devices explicitly. You can add it to /etc/modules.conf or insert module by
+the following command:
+
+	# insmod ahc1ec0
+
+
+Sysfs attributes
+----------------
+
+The following attributes are supported:
+
+- Advantech AHC1 Embedded Controller for Advantech UNO, TPC series:
+
+======================= =======================================================
+tempX_input             Temperature of the component (specified by tempX_label)
+tempX_crit              Temperature critical setpoint of the component
+temp1_label             "CPU Temp"
+temp2_label             "System Temp"
+
+inX_input               Measured voltage of the component (specified by
+                        inX_label and may different with devices)
+in0_label               "VBAT"
+in1_label               "5VSB"
+in2_label               "Vin"
+in3_label               "VCore"
+in4_label               "Vin1"
+in5_label               "Vin2"
+in6_label               "System Voltage"
+
+curr1_input             Measured current of Vin
+curr1_label             "Current"
+
+======================= =======================================================
+
+All the attributes are read-only.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 87624902ea80..242ea59e994b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2147,6 +2147,16 @@ config SENSORS_INTEL_M10_BMC_HWMON
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
index 59e78bc212cf..2df3381bf124 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
 obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
 obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
 obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
+obj-$(CONFIG_SENSORS_AHC1EC0_HWMON) += ahc1ec0-hwmon.o
 obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
 obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
diff --git a/drivers/hwmon/ahc1ec0-hwmon.c b/drivers/hwmon/ahc1ec0-hwmon.c
new file mode 100644
index 000000000000..5502e645048b
--- /dev/null
+++ b/drivers/hwmon/ahc1ec0-hwmon.c
@@ -0,0 +1,701 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * HWMON Driver for Advantech AHC1EC0 Embedded Controller
+ *
+ * Copyright 2021, Advantech IIoT Group
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/platform_data/ahc1ec0.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#define EC_ACPI_THERMAL1_LOCAL_TEMP	0x60
+#define EC_ACPI_THERMAL1_REMOTE_TEMP	0x61
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
+	int curr_list_cnt;
+	int temp_list_cnt;
+	int *hwmon_in_list;
+	int *curr_list;
+	int *temp_list;
+};
+
+struct ec_hwmon_data {
+	struct device *dev;
+	struct device *hwmon_dev;
+	struct adv_ec_ddata *ddata;
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
+enum ec_hwmon_in_type {
+	EC_HWMON_IN_VBAT,
+	EC_HWMON_IN_5VSB,
+	EC_HWMON_IN_12V,
+	EC_HWMON_IN_VCORE,
+	EC_HWMON_IN_VIN1,
+	EC_HWMON_IN_VIN2,
+	EC_HWMON_IN_SYS_VOL,
+};
+
+enum ec_curr_type {
+	EC_VIN_CURRENT,
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
+};
+
+static int hwmon_in_list_1[] = {
+	EC_HWMON_IN_VBAT,
+	EC_HWMON_IN_5VSB,
+	EC_HWMON_IN_12V,
+	EC_HWMON_IN_VCORE,
+};
+
+static int curr_list_0[] = {
+	EC_VIN_CURRENT,
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
+	/* [0] AHC1EC0_HWMON_PRO_TEMPLATE
+	 * The following Advantech hardware devices are for this configuration:
+	 *		TPC-8100TR, TPC-651T-E3AE, TPC-1251T-E3AE, TPC-1551T-E3AE,
+	 *		TPC-1751T-E3AE, TPC-1051WP-E3AE, TPC-1551WP-E3AE, TPC-1581WP-433AE,
+	 *		TPC-1782H-433AE, UNO-1483G-434AE, UNO-2483G-434AE, UNO-3483G-374AE,
+	 *		UNO-2473G, UNO-2484G-6???AE, UNO-2484G-7???AE, UNO-3283G-674AE,
+	 *		UNO-3285G-674AE
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_0),
+		.hwmon_in_list = hwmon_in_list_0,
+		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
+		.temp_list = temp_list_0,
+		.curr_list_cnt = ARRAY_SIZE(curr_list_0),
+		.curr_list = curr_list_0,
+	},
+	/* [1] AHC1EC0_HWMON_PRO_TPC5XXX
+	 * The following Advantech hardware devices are for 2nd configuration:
+	 *		TPC-B500-6??AE, TPC-5???T-6??AE, TPC-5???W-6??AE, TPC-B200-???AE,
+	 *		TPC-2???T-???AE, TPC-2???W-???AE
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
+		.hwmon_in_list = hwmon_in_list_1,
+		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
+		.temp_list = temp_list_0,
+		.curr_list_cnt = 0,
+	},
+	/* [2] AHC1EC0_HWMON_PRO_PRVR4
+	 * The PR/VR4 devices are this configuration.
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
+		.hwmon_in_list = hwmon_in_list_1,
+		.temp_list_cnt = ARRAY_SIZE(temp_list_1),
+		.temp_list = temp_list_1,
+		.curr_list_cnt = 0,
+	},
+	/* [3] AHC1EC0_HWMON_PRO_UNO2271G
+	 * The following Advantech hardware devices are using this configuration:
+	 *     UNO-2271G-E22AE/E23AE/E022AE/E023AE series and UNO-420 devices
+	 */
+	{
+		.resolution = 2929,
+		.r1 = 1912,
+		.r2 = 1000,
+		.offset = 0,
+		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
+		.hwmon_in_list = hwmon_in_list_1,
+		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
+		.temp_list = temp_list_0,
+		.curr_list_cnt = 0,
+	},
+};
+
+static void adv_ec_init_hwmon_profile(u32 profile, struct ec_hwmon_data *lmsensor_data)
+{
+	int i;
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+	struct ec_dynamic_table *dym_tbl = ddata->dym_tbl;
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
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+
+	temp = ahc1ec_read_adc_value(ddata, ptbl->vbat[0], ptbl->vbat[1]);
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
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+
+	temp = ahc1ec_read_adc_value(ddata, ptbl->v5[0], ptbl->v5[1]);
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
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+
+	temp = ahc1ec_read_adc_value(ddata, ptbl->v12[0], ptbl->v12[1]);
+	if (temp == -1)
+		temp = ahc1ec_read_adc_value(ddata, ptbl->vdc[0], ptbl->vdc[1]);
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
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+
+	temp = ahc1ec_read_adc_value(ddata, ptbl->vcore[0], ptbl->vcore[1]);
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
+	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
+	struct adv_hwmon_profile *profile = lmsensor_data->profile;
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+
+	temp = ahc1ec_read_adc_value(ddata, ptbl->ec_current[0], ptbl->ec_current[1]);
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
+	int ret;
+	unsigned char value;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+
+	ret = ahc1ec_read_acpi_value(ddata, EC_ACPI_THERMAL1_REMOTE_TEMP, &value);
+	if (!ret)
+		*val = 1000 * value;
+	return ret;
+}
+
+static int get_ec_sys_temp(struct device *dev, long *val)
+{
+	int ret;
+	unsigned char value;
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
+
+	ret = ahc1ec_read_acpi_value(ddata, EC_ACPI_THERMAL1_LOCAL_TEMP, &value);
+	if (!ret)
+		*val = 1000 * value;
+	return ret;
+}
+
+const struct ec_hwmon_attrs ec_hwmon_in_attr_template[] = {
+	{"VBAT",	0444, get_ec_in_vbat_input},
+	{"5VSB",	0444, get_ec_in_v5_input},
+	{"Vin",		0444, get_ec_in_v12_input},
+	{"VCORE",	0444, get_ec_in_vcore_input},
+	{"Vin1",	0444, NULL},
+	{"Vin2",	0444, NULL},
+	{"System Voltage", 0444, NULL},
+	{"Current",	0444, get_ec_current1_input},
+};
+
+const struct ec_hwmon_attrs ec_curr_attr_template[] = {
+	{"Current",	0444, get_ec_current1_input},
+};
+
+const struct ec_hwmon_attrs ec_temp_attrs_template[] = {
+	{"CPU Temp",	0444, get_ec_cpu_temp},
+	{"System Temp",	0444, get_ec_sys_temp},
+};
+
+static int ahc1ec0_read_in(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	if (attr == hwmon_in_input) {
+		int index = lmsensor_data->profile->hwmon_in_list[channel];
+		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_hwmon_in_attr_template[index];
+
+		return ec_hwmon_attr->read(dev, val);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int ahc1ec0_read_curr(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	if (attr == hwmon_curr_input) {
+		int index = lmsensor_data->profile->curr_list[channel];
+		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_curr_attr_template[index];
+
+		return ec_hwmon_attr->read(dev, val);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int ahc1ec0_read_temp(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_temp_input: {
+		int index = lmsensor_data->profile->temp_list[channel];
+		const struct ec_hwmon_attrs *devec_hwmon_attr =
+			&ec_temp_attrs_template[index];
+
+		return devec_hwmon_attr->read(dev, val);
+	}
+	case hwmon_temp_crit:
+		/* both CPU temp and System temp are all this value */
+		*val = 100000;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ahc1ec0_read_string(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
+
+	if (type == hwmon_in && attr == hwmon_in_label) {
+		int index = lmsensor_data->profile->hwmon_in_list[channel];
+		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_hwmon_in_attr_template[index];
+
+		*str = ec_hwmon_attr->name;
+		return 0;
+	}
+
+	if (type == hwmon_curr && attr == hwmon_curr_label) {
+		int index = lmsensor_data->profile->curr_list[channel];
+		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_curr_attr_template[index];
+
+		*str = ec_hwmon_attr->name;
+		return 0;
+	}
+
+	if (type == hwmon_temp && attr == hwmon_temp_label) {
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
+static int ahc1ec0_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_in:
+		return ahc1ec0_read_in(dev, attr, channel, val);
+	case hwmon_curr:
+		return ahc1ec0_read_curr(dev, attr, channel, val);
+	case hwmon_temp:
+		return ahc1ec0_read_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t ec_hwmon_in_visible(const void *data, u32 attr, int channel)
+{
+	struct ec_hwmon_data *lmsensor_data = (struct ec_hwmon_data *)data;
+
+	switch (attr) {
+	case hwmon_in_input:
+	case hwmon_in_label:
+		if (lmsensor_data->profile->hwmon_in_list_cnt > channel)
+			return 0444;
+		else
+			return 0;
+	default:
+		return 0;
+	}
+}
+
+static umode_t ec_curr_visible(const void *data, u32 attr, int channel)
+{
+	struct ec_hwmon_data *lmsensor_data = (struct ec_hwmon_data *)data;
+
+	switch (attr) {
+	case hwmon_curr_input:
+	case hwmon_curr_label:
+		if (lmsensor_data->profile->curr_list_cnt > channel)
+			return 0444;
+		else
+			return 0;
+	default:
+		return 0;
+	}
+}
+
+static umode_t ec_temp_visible(const void *data, u32 attr, int channel)
+{
+	struct ec_hwmon_data *lmsensor_data = (struct ec_hwmon_data *)data;
+
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_crit:
+	case hwmon_temp_label:
+		if (lmsensor_data->profile->temp_list_cnt > channel)
+			return 0444;
+		else
+			return 0;
+	default:
+		return 0;
+	}
+}
+
+static umode_t ahc1ec0_is_visible(const void *data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		return ec_hwmon_in_visible(data, attr, channel);
+	case hwmon_curr:
+		return ec_curr_visible(data, attr, channel);
+	case hwmon_temp:
+		return ec_temp_visible(data, attr, channel);
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
+static const u32 ahc1ec0_curr_config[] = {
+	HWMON_C_INPUT | HWMON_C_LABEL,
+	0
+};
+
+static const struct hwmon_channel_info ahc1ec0_curr = {
+	.type = hwmon_curr,
+	.config = ahc1ec0_curr_config,
+};
+
+static const u32 ahc1ec0_temp_config[] = {
+	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
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
+	&ahc1ec0_curr,
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
+	struct adv_ec_ddata *ddata;
+	struct ec_hwmon_data *lmsensor_data;
+
+	ddata = dev_get_drvdata(dev->parent);
+	if (!ddata)
+		return -EINVAL;
+
+	ret = device_property_read_u32(dev->parent, "advantech,hwmon-profile", &profile);
+	if (ret < 0) {
+		dev_dbg(dev, "get hwmon-profile failed! (%d)", ret);
+		return ret;
+	}
+
+	if (profile >= ARRAY_SIZE(advec_profile)) {
+		dev_dbg(dev, "not support hwmon profile(%d)!\n", profile);
+		return -EINVAL;
+	}
+
+	lmsensor_data = devm_kzalloc(dev, sizeof(*lmsensor_data), GFP_KERNEL);
+	if (!lmsensor_data)
+		return -ENOMEM;
+
+	lmsensor_data->ddata = ddata;
+	lmsensor_data->dev = dev;
+	dev_set_drvdata(dev, lmsensor_data);
+
+	adv_ec_init_hwmon_profile(profile, lmsensor_data);
+
+	lmsensor_data->hwmon_dev  =
+		devm_hwmon_device_register_with_info(dev, "ahc1ec0.hwmon", lmsensor_data,
+						     &ahc1ec0_chip_info, NULL);
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

