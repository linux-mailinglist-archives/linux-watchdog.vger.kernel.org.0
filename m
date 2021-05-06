Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2BC3750C6
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbhEFI1z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:27:55 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:61945 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbhEFI1v (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:27:51 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 04:27:37 EDT
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te64ee014c0ac14110e2c04@ACLMS4.ADVANTECH.CORP>;
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
Subject: [PATCH v7 4/7] platform: x86: ahc1ec0-core: Add support for Advantech embedded controller
Date:   Thu, 6 May 2021 16:16:16 +0800
Message-ID: <20210506081619.2443-4-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: CE3AE33B2EEA98806142404774C292A3A55FC1A4D037B182BCE642BF1950D3522000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

AHC1EC0 is the embedded controller for Advantech industrial products.
This provides core functions in lower layer to access EC chip.

Changed in V7:
	Fix the patch according to reviewer's comment:
	- move some common functions from drivers/mfd/ahc1ec0.c
	- add prefix for function name

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 drivers/platform/x86/Kconfig          |   9 +
 drivers/platform/x86/Makefile         |   1 +
 drivers/platform/x86/ahc1ec0-core.c   | 570 ++++++++++++++++++++++++++
 include/linux/platform_data/ahc1ec0.h | 279 +++++++++++++
 4 files changed, 859 insertions(+)
 create mode 100644 drivers/platform/x86/ahc1ec0-core.c
 create mode 100644 include/linux/platform_data/ahc1ec0.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2714f7c3843e..4afeca634432 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -215,6 +215,15 @@ config ADV_SWBUTTON
 	  To compile this driver as a module, choose M here. The module will
 	  be called adv_swbutton.
 
+config AHC1EC0_CORE
+	tristate "Advantech AHC1EC0 Embedded Controller Core"
+	depends on X86
+	help
+	  This driver provides core functionality for the Advantech AHC1EC0
+	  Embedded Controller (EC) along with registration for HWMON and
+	  Watchdog sub-devices. It also provides lower read and write APIs for
+	  communication with the EC chip.
+
 config APPLE_GMUX
 	tristate "Apple Gmux Driver"
 	depends on ACPI && PCI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dcc8cdb95b4d..74f057343f77 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
 
 # Advantech
 obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
+obj-$(CONFIG_AHC1EC0_CORE)	+= ahc1ec0-core.o
 
 # Apple
 obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
diff --git a/drivers/platform/x86/ahc1ec0-core.c b/drivers/platform/x86/ahc1ec0-core.c
new file mode 100644
index 000000000000..863916d17220
--- /dev/null
+++ b/drivers/platform/x86/ahc1ec0-core.c
@@ -0,0 +1,570 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Advantech AHC1EC0 Embedded Controller Core
+ *
+ * Copyright 2021 Advantech IIoT Group
+ */
+
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/platform_data/ahc1ec0.h>
+#include <linux/module.h>
+
+/* Wait IBF (Input Buffer Full) clear */
+static int ec_wait_write(void)
+{
+	int i;
+
+	for (i = 0; i < EC_MAX_TIMEOUT_COUNT; i++) {
+		if ((inb(EC_COMMAND_PORT) & EC_COMMAND_BIT_IBF) == 0)
+			return 0;
+
+		udelay(EC_RETRY_UDELAY);
+	}
+
+	return -ETIMEDOUT;
+}
+
+/* Wait OBF (Output Buffer Full) data ready */
+static int ec_wait_read(void)
+{
+	int i;
+
+	for (i = 0; i < EC_MAX_TIMEOUT_COUNT; i++) {
+		if ((inb(EC_COMMAND_PORT) & EC_COMMAND_BIT_OBF) != 0)
+			return 0;
+
+		udelay(EC_RETRY_UDELAY);
+	}
+
+	return -ETIMEDOUT;
+}
+
+/* Read data from EC HW RAM, the process is the following:
+ * Step 0. Wait IBF clear to send command
+ * Step 1. Send read command to EC command port
+ * Step 2. Wait IBF clear that means command is got by EC
+ * Step 3. Send read address to EC data port
+ * Step 4. Wait OBF data ready
+ * Step 5. Get data from EC data port
+ */
+int ahc1ec_read_hw_ram(struct adv_ec_ddata *ddata,
+		       unsigned char addr, unsigned char *data)
+{
+	int ret;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_HW_RAM_READ, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(addr, EC_STATUS_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+	*data = inb(EC_STATUS_PORT);
+
+	mutex_unlock(&ddata->lock);
+
+	return ret;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_read_hw_ram);
+
+/* Write data to EC HW RAM
+ * Step 0. Wait IBF clear to send command
+ * Step 1. Send write command to EC command port
+ * Step 2. Wait IBF clear that means command is got by EC
+ * Step 3. Send write address to EC data port
+ * Step 4. Wait IBF clear that means command is got by EC
+ * Step 5. Send data to EC data port
+ */
+int ahc1ec_write_hw_ram(struct adv_ec_ddata *ddata,
+			unsigned char addr, unsigned char data)
+{
+	int ret;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_HW_RAM_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(addr, EC_STATUS_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(data, EC_STATUS_PORT);
+
+	mutex_unlock(&ddata->lock);
+
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_write_hw_ram);
+
+/* Get dynamic control table */
+int adv_get_dynamic_tab(struct adv_ec_ddata *ddata)
+{
+	int i, ret;
+	unsigned char pin_tmp, device_id;
+
+	mutex_lock(&ddata->lock);
+
+	for (i = 0; i < EC_MAX_TBL_NUM; i++) {
+		ddata->dym_tbl[i].device_id = EC_TBL_NOTFOUND;
+		ddata->dym_tbl[i].hw_pin_num = EC_TBL_NOTFOUND;
+	}
+
+	for (i = 0; i < EC_MAX_TBL_NUM; i++) {
+		ret = ec_wait_write();
+		if (ret)
+			goto error;
+		outb(EC_TBL_WRITE_ITEM, EC_COMMAND_PORT);
+
+		ret = ec_wait_write();
+		if (ret)
+			goto error;
+		outb(i, EC_STATUS_PORT);
+
+		ret = ec_wait_read();
+		if (ret)
+			goto error;
+
+		/*
+		 *  If item is defined, EC will return item number.
+		 *  If table item is not defined, EC will return EC_TBL_NOTFOUND(0xFF).
+		 */
+		pin_tmp = inb(EC_STATUS_PORT);
+		if (pin_tmp == EC_TBL_NOTFOUND)
+			goto pass;
+
+		ret = ec_wait_write();
+		if (ret)
+			goto error;
+		outb(EC_TBL_GET_PIN, EC_COMMAND_PORT);
+
+		ret = ec_wait_read();
+		if (ret)
+			goto error;
+		pin_tmp = inb(EC_STATUS_PORT) & EC_STATUS_BIT;
+		if (pin_tmp == EC_TBL_NOTFOUND)
+			goto pass;
+
+		ret = ec_wait_write();
+		if (ret)
+			goto error;
+		outb(EC_TBL_GET_DEVID, EC_COMMAND_PORT);
+
+		ret = ec_wait_read();
+		if (ret)
+			goto error;
+		device_id = inb(EC_STATUS_PORT) & EC_STATUS_BIT;
+
+		ddata->dym_tbl[i].device_id = device_id;
+		ddata->dym_tbl[i].hw_pin_num = pin_tmp;
+	}
+
+pass:
+	mutex_unlock(&ddata->lock);
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+
+	return ret;
+}
+EXPORT_SYMBOL(adv_get_dynamic_tab);
+
+int adv_ec_get_productname(struct adv_ec_ddata *ddata, char *product)
+{
+	const char *vendor, *device;
+	int length = 0;
+
+	/* Check it is Advantech board */
+	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	if (memcmp(vendor, "Advantech", sizeof("Advantech")) != 0)
+		return -ENODEV;
+
+	/* Get product model name */
+	device = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (device) {
+		while ((device[length] != ' ') && (length < AMI_ADVANTECH_BOARD_ID_LENGTH))
+			length++;
+		memset(product, 0, AMI_ADVANTECH_BOARD_ID_LENGTH);
+		memmove(product, device, length);
+
+		dev_info(ddata->dev, "BIOS Product Name = %s\n", product);
+
+		return 0;
+	}
+
+	dev_warn(ddata->dev, "This device is not Advantech Devices (%s)!\n", product);
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL(adv_ec_get_productname);
+
+int ahc1ec_read_adc_value(struct adv_ec_ddata *ddata, unsigned char hwpin,
+			  unsigned char multi)
+{
+	int ret;
+	u32 ret_val;
+	unsigned int LSB, MSB;
+
+	mutex_lock(&ddata->lock);
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_ADC_INDEX_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(hwpin, EC_STATUS_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+
+	if (inb(EC_STATUS_PORT) == EC_TBL_NOTFOUND) {
+		mutex_unlock(&ddata->lock);
+		return -1;
+	}
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_ADC_LSB_READ, EC_COMMAND_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+	LSB = inb(EC_STATUS_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_ADC_MSB_READ, EC_COMMAND_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+	MSB = inb(EC_STATUS_PORT);
+	ret_val = ((MSB << 8) | LSB) & EC_ADC_VALID_BIT;
+	ret_val = ret_val * multi * 100;
+
+	mutex_unlock(&ddata->lock);
+	return ret_val;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_read_adc_value);
+
+int ahc1ec_read_acpi_value(struct adv_ec_ddata *ddata,
+			   unsigned char addr, unsigned char *pvalue)
+{
+	int ret;
+	unsigned char value;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_ACPI_RAM_READ, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(addr, EC_STATUS_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+	value = inb(EC_STATUS_PORT);
+	*pvalue = value;
+
+	mutex_unlock(&ddata->lock);
+
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_read_acpi_value);
+
+int ahc1ec_write_acpi_value(struct adv_ec_ddata *ddata,
+			    unsigned char addr, unsigned char value)
+{
+	int ret;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_ACPI_DATA_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(addr, EC_STATUS_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(value, EC_STATUS_PORT);
+
+	mutex_unlock(&ddata->lock);
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_write_acpi_value);
+
+int ahc1ec_read_gpio_status(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			    unsigned char *pvalue)
+{
+	int ret;
+
+	unsigned char gpio_status_value;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(pin_number, EC_STATUS_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+
+	if (inb(EC_STATUS_PORT) == EC_TBL_NOTFOUND) {
+		ret = -1;
+		goto error;
+	}
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_STATUS_READ, EC_COMMAND_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+	gpio_status_value = inb(EC_STATUS_PORT);
+
+	*pvalue = gpio_status_value;
+	mutex_unlock(&ddata->lock);
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_read_gpio_status);
+
+int ahc1ec_write_gpio_status(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			     unsigned char value)
+{
+	int ret;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(pin_number, EC_STATUS_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+
+	if (inb(EC_STATUS_PORT) == EC_TBL_NOTFOUND) {
+		ret = -1;
+		goto error;
+	}
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_STATUS_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(value, EC_STATUS_PORT);
+
+	mutex_unlock(&ddata->lock);
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_write_gpio_status);
+
+int ahc1ec_read_gpio_dir(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			 unsigned char *pvalue)
+{
+	int ret;
+	unsigned char gpio_dir_value;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(pin_number, EC_STATUS_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+
+	if (inb(EC_STATUS_PORT) == EC_TBL_NOTFOUND) {
+		ret = -1;
+		goto error;
+	}
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_DIR_READ, EC_COMMAND_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+	gpio_dir_value = inb(EC_STATUS_PORT);
+	*pvalue = gpio_dir_value;
+
+	mutex_unlock(&ddata->lock);
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_read_gpio_dir);
+
+int ahc1ec_write_gpio_dir(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			  unsigned char value)
+{
+	int ret;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_INDEX_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(pin_number, EC_STATUS_PORT);
+
+	ret = ec_wait_read();
+	if (ret)
+		goto error;
+
+	if (inb(EC_STATUS_PORT) == EC_TBL_NOTFOUND) {
+		mutex_unlock(&ddata->lock);
+		return -1;
+	}
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(EC_GPIO_DIR_WRITE, EC_COMMAND_PORT);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(value, EC_STATUS_PORT);
+
+	mutex_unlock(&ddata->lock);
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_write_gpio_dir);
+
+int ahc1ec_write_hwram_command(struct adv_ec_ddata *ddata, unsigned char data)
+{
+	int ret;
+
+	mutex_lock(&ddata->lock);
+
+	ret = ec_wait_write();
+	if (ret)
+		goto error;
+	outb(data, EC_COMMAND_PORT);
+
+	mutex_unlock(&ddata->lock);
+	return 0;
+
+error:
+	mutex_unlock(&ddata->lock);
+	dev_err(ddata->dev, "Wait for IBF or OBF too long.\n");
+	return ret;
+}
+EXPORT_SYMBOL(ahc1ec_write_hwram_command);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ahc1ec0-core");
+MODULE_DESCRIPTION("Advantech AHC1EC0 Embedded Controller Core");
+MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
+MODULE_VERSION("1.0");
diff --git a/include/linux/platform_data/ahc1ec0.h b/include/linux/platform_data/ahc1ec0.h
new file mode 100644
index 000000000000..934cfe60e0b4
--- /dev/null
+++ b/include/linux/platform_data/ahc1ec0.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __LINUX_AHC1EC0_H
+#define __LINUX_AHC1EC0_H
+
+#include <linux/device.h>
+
+#define EC_COMMAND_PORT		0x29A /* EC I/O command port */
+#define EC_STATUS_PORT		0x299 /* EC I/O data port */
+
+#define EC_RETRY_UDELAY		200  /* EC command retry delay in microseconds */
+#define EC_MAX_TIMEOUT_COUNT	5000 /* EC command max retry count */
+#define EC_COMMAND_BIT_OBF	0x01 /* Bit 0 is for OBF ready (Output buffer full) */
+#define EC_COMMAND_BIT_IBF	0x02 /* Bit 1 is for IBF ready (Input buffer full) */
+
+/* Analog to digital converter command */
+#define EC_ADC_INDEX_WRITE	0x15 /* Write ADC port number into index */
+#define EC_ADC_LSB_READ		0x16 /* Read ADC LSB value from ADC port */
+#define EC_ADC_MSB_READ		0x1F /* Read ADC MSB value from ADC port */
+#define EC_ADC_VALID_BIT	0x03FF
+
+/* Voltage device ID */
+#define EC_DID_SMBOEM0		0x28 /* SMBUS/I2C. Smbus channel 0 */
+#define EC_DID_CMOSBAT		0x50 /* CMOS coin battery voltage */
+#define EC_DID_CMOSBAT_X2	0x51 /* CMOS coin battery voltage*2 */
+#define EC_DID_CMOSBAT_X10	0x52 /* CMOS coin battery voltage*10 */
+#define EC_DID_5VS0		0x56 /* 5VS0 voltage */
+#define EC_DID_5VS0_X2		0x57 /* 5VS0 voltage*2 */
+#define EC_DID_5VS0_X10		0x58 /* 5VS0 voltage*10 */
+#define EC_DID_5VS5		0x59 /* 5VS5 voltage */
+#define EC_DID_5VS5_X2		0x5A /* 5VS5 voltage*2 */
+#define EC_DID_5VS5_X10		0x5B /* 5VS5 voltage*10 */
+#define EC_DID_12VS0		0x62 /* 12VS0 voltage */
+#define EC_DID_12VS0_X2		0x63 /* 12VS0 voltage*2 */
+#define EC_DID_12VS0_X10	0x64 /* 12VS0 voltage*10 */
+#define EC_DID_VCOREA		0x65 /* CPU A core voltage */
+#define EC_DID_VCOREA_X2	0x66 /* CPU A core voltage*2 */
+#define EC_DID_VCOREA_X10	0x67 /* CPU A core voltage*10 */
+#define EC_DID_VCOREB		0x68 /* CPU B core voltage */
+#define EC_DID_VCOREB_X2	0x69 /* CPU B core voltage*2 */
+#define EC_DID_VCOREB_X10	0x6A /* CPU B core voltage*10 */
+#define EC_DID_DC		0x6B /* ADC. onboard voltage */
+#define EC_DID_DC_X2		0x6C /* ADC. onboard voltage*2 */
+#define EC_DID_DC_X10		0x6D /* ADC. onboard voltage*10 */
+
+/* Current device ID */
+#define EC_DID_CURRENT		0x74
+
+/* ACPI commands */
+#define EC_ACPI_RAM_READ	0x80
+#define EC_ACPI_RAM_WRITE	0x81
+
+/*
+ *  Dynamic control table commands
+ *  The table includes HW pin number, Device ID, and Pin polarity
+ */
+#define EC_TBL_WRITE_ITEM		0x20
+#define EC_TBL_GET_PIN			0x21
+#define EC_TBL_GET_DEVID		0x22
+#define EC_MAX_TBL_NUM			32
+#define EC_TBL_NOTFOUND			0xFF /*If table item is not defined, EC will return 0xFF.*/
+#define EC_STATUS_BIT			0xFF
+
+/* LED Device ID table */
+#define EC_DID_LED_RUN			0xE1
+#define EC_DID_LED_ERR			0xE2
+#define EC_DID_LED_SYS_RECOVERY		0xE3
+#define EC_DID_LED_D105_G		0xE4
+#define EC_DID_LED_D106_G		0xE5
+#define EC_DID_LED_D107_G		0xE6
+
+/* LED control HW RAM address 0xA0-0xAF */
+#define EC_HWRAM_LED_BASE_ADDR		0xA0
+#define EC_HWRAM_LED_PIN(N)		(EC_HWRAM_LED_BASE_ADDR + (4 * (N))) /* N:0-3 */
+#define EC_HWRAM_LED_CTRL_HIBYTE(N)	(EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 1)
+#define EC_HWRAM_LED_CTRL_LOBYTE(N)	(EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 2)
+#define EC_HWRAM_LED_DEVICE_ID(N)	(EC_HWRAM_LED_BASE_ADDR + (4 * (N)) + 3)
+
+/* LED control bit */
+#define LED_CTRL_ENABLE_BIT()		BIT(4)
+#define LED_CTRL_INTCTL_BIT()		BIT(5)
+#define LED_CTRL_LEDBIT_MASK		(0x03FF << 6)
+#define LED_CTRL_POLARITY_MASK		(0x000F << 0)
+#define LED_CTRL_INTCTL_EXTERNAL	0
+#define LED_CTRL_INTCTL_INTERNAL	1
+
+#define LED_DISABLE	0x0
+#define LED_ON		0x1
+#define LED_FAST	0x3
+#define LED_NORMAL	0x5
+#define LED_SLOW	0x7
+#define LED_MANUAL	0xF
+
+#define LED_CTRL_LEDBIT_DISABLE		0x0000
+#define LED_CTRL_LEDBIT_ON		0x03FF
+#define LED_CTRL_LEDBIT_FAST		0x02AA
+#define LED_CTRL_LEDBIT_NORMAL		0x0333
+#define LED_CTRL_LEDBIT_SLOW		0x03E0
+
+/* Get the device name */
+#define AMI_ADVANTECH_BOARD_ID_LENGTH	32
+
+/*
+ * Advantech Embedded Controller watchdog commands
+ * EC can send multi-stage watchdog event. System can setup watchdog event
+ * independently to make up event sequence.
+ */
+#define EC_COMMANS_PORT_IBF_MASK	0x02
+#define EC_RESET_EVENT			0x04
+#define	EC_WDT_START			0x28
+#define	EC_WDT_STOP			0x29
+#define	EC_WDT_RESET			0x2A
+#define	EC_WDT_BOOTTMEWDT_STOP		0x2B
+
+#define EC_HW_RAM			0x89
+
+#define EC_EVENT_FLAG			0x57
+#define EC_ENABLE_DELAY_H		0x58
+#define EC_ENABLE_DELAY_L		0x59
+#define EC_POWER_BTN_TIME_H		0x5A
+#define EC_POWER_BTN_TIME_L		0x5B
+#define EC_RESET_DELAY_TIME_H		0x5E
+#define EC_RESET_DELAY_TIME_L		0x5F
+#define EC_PIN_DELAY_TIME_H		0x60
+#define EC_PIN_DELAY_TIME_L		0x61
+#define EC_SCI_DELAY_TIME_H		0x62
+#define EC_SCI_DELAY_TIME_L		0x63
+
+/* EC ACPI commands */
+#define EC_ACPI_DATA_READ		0x80
+#define EC_ACPI_DATA_WRITE		0x81
+
+/* Brightness ACPI Addr */
+#define BRIGHTNESS_ACPI_ADDR		0x50
+
+/* EC HW RAM commands */
+#define EC_HW_EXTEND_RAM_READ		0x86
+#define EC_HW_EXTEND_RAM_WRITE		0x87
+#define	EC_HW_RAM_READ			0x88
+#define EC_HW_RAM_WRITE			0x89
+
+/* EC Smbus commands */
+#define EC_SMBUS_CHANNEL_SET		0x8A /* Set selector number (SMBUS channel) */
+#define EC_SMBUS_ENABLE_I2C		0x8C /* Enable channel I2C */
+#define EC_SMBUS_DISABLE_I2C		0x8D /* Disable channel I2C */
+
+/* Smbus transmit protocol */
+#define EC_SMBUS_PROTOCOL		0x00
+
+/* SMBUS status */
+#define EC_SMBUS_STATUS			0x01
+
+/* SMBUS device slave address (bit0 must be 0) */
+#define EC_SMBUS_SLV_ADDR		0x02
+
+/* SMBUS device command */
+#define EC_SMBUS_CMD			0x03
+
+/* 0x04-0x24 Data In read process, return data are stored in this address */
+#define EC_SMBUS_DATA			0x04
+
+#define EC_SMBUS_DAT_OFFSET(n)	(EC_SMBUS_DATA + (n))
+
+/* SMBUS channel selector (0-4) */
+#define EC_SMBUS_CHANNEL		0x2B
+
+/* EC SMBUS transmit Protocol code */
+#define SMBUS_QUICK_WRITE		0x02 /* Write Quick Command */
+#define SMBUS_QUICK_READ		0x03 /* Read Quick Command */
+#define SMBUS_BYTE_SEND			0x04 /* Send Byte */
+#define SMBUS_BYTE_RECEIVE		0x05 /* Receive Byte */
+#define SMBUS_BYTE_WRITE		0x06 /* Write Byte */
+#define SMBUS_BYTE_READ			0x07 /* Read Byte */
+#define SMBUS_WORD_WRITE		0x08 /* Write Word */
+#define SMBUS_WORD_READ			0x09 /* Read Word */
+#define SMBUS_BLOCK_WRITE		0x0A /* Write Block */
+#define SMBUS_BLOCK_READ		0x0B /* Read Block */
+#define SMBUS_PROC_CALL			0x0C /* Process Call */
+#define SMBUS_BLOCK_PROC_CALL		0x0D /* Write Block-Read Block Process Call */
+#define SMBUS_I2C_READ_WRITE		0x0E /* I2C block Read-Write */
+#define SMBUS_I2C_WRITE_READ		0x0F /* I2C block Write-Read */
+
+/* GPIO control commands */
+#define EC_GPIO_INDEX_WRITE		0x10
+#define EC_GPIO_STATUS_READ		0x11
+#define EC_GPIO_STATUS_WRITE		0x12
+#define EC_GPIO_DIR_READ		0x1D
+#define EC_GPIO_DIR_WRITE		0x1E
+
+/* One Key Recovery commands */
+#define EC_ONE_KEY_FLAG			0x9C
+
+/* ASG OEM commands */
+#define EC_ASG_OEM			0xEA
+#define EC_ASG_OEM_READ			0x00
+#define EC_ASG_OEM_WRITE		0x01
+#define EC_OEM_POWER_STATUS_VIN1	0X10
+#define EC_OEM_POWER_STATUS_VIN2	0X11
+#define EC_OEM_POWER_STATUS_BAT1	0X12
+#define EC_OEM_POWER_STATUS_BAT2	0X13
+
+/* GPIO DEVICE ID */
+#define EC_DID_ALTGPIO_0		0x10    /* 0x10 AltGpio0 User define gpio */
+#define EC_DID_ALTGPIO_1		0x11    /* 0x11 AltGpio1 User define gpio */
+#define EC_DID_ALTGPIO_2		0x12    /* 0x12 AltGpio2 User define gpio */
+#define EC_DID_ALTGPIO_3		0x13    /* 0x13 AltGpio3 User define gpio */
+#define EC_DID_ALTGPIO_4		0x14    /* 0x14 AltGpio4 User define gpio */
+#define EC_DID_ALTGPIO_5		0x15    /* 0x15 AltGpio5 User define gpio */
+#define EC_DID_ALTGPIO_6		0x16    /* 0x16 AltGpio6 User define gpio */
+#define EC_DID_ALTGPIO_7		0x17    /* 0x17 AltGpio7 User define gpio */
+
+/* Lmsensor Chip Register */
+#define NSLM96163_CHANNEL		0x02
+
+/* NS_LM96163 address 0x98 */
+#define NSLM96163_ADDR			0x98
+
+/* LM96163 index(0x00) Local Temperature (Signed MSB) */
+#define NSLM96163_LOC_TEMP		0x00
+
+/* HWMON registers */
+#define INA266_REG_VOLTAGE		0x02    /* 1.25mV */
+#define INA266_REG_POWER		0x03    /* 25mW */
+#define INA266_REG_CURRENT		0x04    /* 1mA */
+
+struct ec_hw_pin_table {
+	unsigned int vbat[2];
+	unsigned int v5[2];
+	unsigned int v12[2];
+	unsigned int vcore[2];
+	unsigned int vdc[2];
+	unsigned int ec_current[2];
+	unsigned int power[2];
+};
+
+struct ec_dynamic_table {
+	unsigned char device_id;
+	unsigned char hw_pin_num;
+};
+
+struct ec_smbuso_em0 {
+	unsigned char hw_pin_num;
+};
+
+struct pled_hw_pin_tbl {
+	unsigned int pled[6];
+};
+
+struct adv_ec_ddata {
+	char *bios_product_name;
+	struct mutex lock; /* lock EC access */
+	struct device *dev;
+	struct class *adv_ec_class;
+
+	struct ec_dynamic_table *dym_tbl;
+};
+
+int adv_get_dynamic_tab(struct adv_ec_ddata *ddata);
+int adv_ec_get_productname(struct adv_ec_ddata *ddata, char *product);
+int ahc1ec_read_adc_value(struct adv_ec_ddata *ddata, unsigned char hwpin,
+			  unsigned char multi);
+int ahc1ec_read_acpi_value(struct adv_ec_ddata *ddata,
+			   unsigned char addr, unsigned char *pvalue);
+int ahc1ec_write_acpi_value(struct adv_ec_ddata *ddata,
+			    unsigned char addr, unsigned char value);
+int ahc1ec_read_hw_ram(struct adv_ec_ddata *ddata,
+		       unsigned char addr, unsigned char *data);
+int ahc1ec_write_hw_ram(struct adv_ec_ddata *ddata,
+			unsigned char addr, unsigned char data);
+int ahc1ec_write_hwram_command(struct adv_ec_ddata *ddata, unsigned char data);
+int ahc1ec_read_gpio_status(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			    unsigned char *pvalue);
+int ahc1ec_write_gpio_status(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			     unsigned char value);
+int ahc1ec_read_gpio_dir(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			 unsigned char *pvalue);
+int ahc1ec_write_gpio_dir(struct adv_ec_ddata *ddata, unsigned char pin_number,
+			  unsigned char value);
+
+#endif /* __LINUX_AHC1EC0_H */
-- 
2.17.1

