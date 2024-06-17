Return-Path: <linux-watchdog+bounces-1158-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C990B76E
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2024 19:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89B31B26E1E
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2024 15:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8661D952C;
	Mon, 17 Jun 2024 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4I6+aaq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BE1D9527;
	Mon, 17 Jun 2024 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637983; cv=none; b=TXcPQ1KPv99KhsIsr7vSqEUlyhxBJ1IhnAQ3rZMpDv3MyCUDBWA5EKUGNBZDctsQSxW4C6gbPcNz2hAgVNs0eRsYzMg2/BkdjOTex9SLvFQQiLgUyIS+fyuKccHHNRVXAmKjNOXJGnXb2ezutCHHyHkbh2j61vlOsVEwW8HElps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637983; c=relaxed/simple;
	bh=lbEahdBZ6K3D4EQpTBYJ9XhENTscFCusU2+6PAstxsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZj8sCo19/asTeVYOcYC19LOX06BzzzA8bWjywioIlUe8zB5he+UVL1DtyJsR8Gu1IpKrs8pRQm8oghmDydCcQrhWvFJ67oyP032F+SS7Pk6ywAWARo8O4s2zBEINqL0Ta7L8N9bVGuUs1jLEtexZRMZ+O3L4ul6D1Bobm2UqiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4I6+aaq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA94C4AF48;
	Mon, 17 Jun 2024 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637983;
	bh=lbEahdBZ6K3D4EQpTBYJ9XhENTscFCusU2+6PAstxsA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4I6+aaqkYf4JQg6lnOeRlgk8lL6hasXsDhBoZS0BEyB0u8mxjc9ZK+L5XqjWrNWp
	 /zPNpfle9gAvriVAqEFo71hEHXKy9GyBqLeM7KpW1o8op//A7wgxZxulTh7ZBL1DQJ
	 z1vPAbbwNPSkmveA6CYtiDl4uaDnvmrLck6AZg+wW4lTWgC9iA0w+Z67AURALZ4elt
	 pDus34L9t06BojFiequKoxvoc12tjYzalV2l2UE72Rx1gpuk/U0P2qihkBoaopKtXJ
	 5s9ClQA8UxLKDjN0C/dNql+kJWyincaZ6bwT7khTome2zk07KgU7yYhNAEsYXK3Nys
	 tJPcitfz6O+Pw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v12 2/8] platform: cznic: Add preliminary support for Turris Omnia MCU
Date: Mon, 17 Jun 2024 17:26:00 +0200
Message-ID: <20240617152606.26191-3-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617152606.26191-1-kabel@kernel.org>
References: <20240617152606.26191-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the basic skeleton for a new platform driver for the microcontroller
found on the Turris Omnia board.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  81 ++++
 MAINTAINERS                                   |   3 +
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/cznic/Kconfig                |  25 ++
 drivers/platform/cznic/Makefile               |   4 +
 .../platform/cznic/turris-omnia-mcu-base.c    | 394 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  74 ++++
 include/linux/turris-omnia-mcu-interface.h    | 249 +++++++++++
 9 files changed, 833 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
new file mode 100644
index 000000000000..9bc5aad00de0
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -0,0 +1,81 @@
+What:		/sys/bus/i2c/devices/<mcu_device>/board_revision
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains board revision number.
+
+		Only available if board information is burned in the MCU (older
+		revisions have board information burned in the ATSHA204-A chip).
+
+		Format: %u.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/first_mac_address
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains device first MAC address. Each Turris Omnia is
+		allocated 3 MAC addresses. The two additional addresses are
+		computed from the first one by incrementing it.
+
+		Only available if board information is burned in the MCU (older
+		revisions have board information burned in the ATSHA204-A chip).
+
+		Format: %pM.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_features
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Newer versions of the microcontroller firmware report the
+		features they support. These can be read from this file. If the
+		MCU firmware is too old, this file reads 0x0.
+
+		Format: 0x%x.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_version_hash_application
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the version hash (commit hash) of the application
+		part of the microcontroller firmware.
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_version_hash_bootloader
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the version hash (commit hash) of the bootloader
+		part of the microcontroller firmware.
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/mcu_type
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the microcontroller type (STM32, GD32, MKL).
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/reset_selector
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the selected factory reset level, determined by
+		how long the rear reset button was held by the user during board
+		reset.
+
+		Format: %i.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/serial_number
+Date:		September 2024
+KernelVersion:	6.11
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the 64-bit board serial number in hexadecimal
+		format.
+
+		Only available if board information is burned in the MCU (older
+		revisions have board information burned in the ATSHA204-A chip).
+
+		Format: %016X.
diff --git a/MAINTAINERS b/MAINTAINERS
index 5496c8ec3e1d..6516cf669cd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2206,6 +2206,7 @@ M:	Marek Behún <kabel@kernel.org>
 S:	Maintained
 W:	https://www.turris.cz/
 F:	Documentation/ABI/testing/debugfs-moxtet
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/ABI/testing/sysfs-firmware-turris-mox-rwtm
 F:	Documentation/devicetree/bindings/bus/moxtet.txt
@@ -2219,10 +2220,12 @@ F:	drivers/firmware/turris-mox-rwtm.c
 F:	drivers/gpio/gpio-moxtet.c
 F:	drivers/leds/leds-turris-omnia.c
 F:	drivers/mailbox/armada-37xx-rwtm-mailbox.c
+F:	drivers/platform/cznic/
 F:	drivers/watchdog/armada_37xx_wdt.c
 F:	include/dt-bindings/bus/moxtet.h
 F:	include/linux/armada-37xx-rwtm-mailbox.h
 F:	include/linux/moxtet.h
+F:	include/linux/turris-omnia-mcu-interface.h
 
 ARM/FARADAY FA526 PORT
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 81a298517df2..960fd6a82450 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -7,6 +7,8 @@ source "drivers/platform/goldfish/Kconfig"
 
 source "drivers/platform/chrome/Kconfig"
 
+source "drivers/platform/cznic/Kconfig"
+
 source "drivers/platform/mellanox/Kconfig"
 
 source "drivers/platform/olpc/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fbbe4f77aa5d..bf69cc8d7429 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -10,5 +10,6 @@ obj-$(CONFIG_MIPS)		+= mips/
 obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
+obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
 obj-$(CONFIG_ARM64)		+= arm64/
diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
new file mode 100644
index 000000000000..db5f4a673d28
--- /dev/null
+++ b/drivers/platform/cznic/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.rst.
+#
+
+menuconfig CZNIC_PLATFORMS
+	bool "Platform support for CZ.NIC's Turris hardware"
+	help
+	  Say Y here to be able to choose driver support for CZ.NIC's Turris
+	  devices. This option alone does not add any kernel code.
+
+if CZNIC_PLATFORMS
+
+config TURRIS_OMNIA_MCU
+	tristate "Turris Omnia MCU driver"
+	depends on MACH_ARMADA_38X || COMPILE_TEST
+	depends on I2C
+	help
+	  Say Y here to add support for the features implemented by the
+	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
+	  To compile this driver as a module, choose M here; the module will be
+	  called turris-omnia-mcu.
+
+endif # CZNIC_PLATFORMS
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
new file mode 100644
index 000000000000..31adca73bb94
--- /dev/null
+++ b/drivers/platform/cznic/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
+turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
new file mode 100644
index 000000000000..47513ba9b128
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU driver
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/hex.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include <linux/turris-omnia-mcu-interface.h>
+#include "turris-omnia-mcu.h"
+
+#define OMNIA_FW_VERSION_LEN		20
+#define OMNIA_FW_VERSION_HEX_LEN	(2 * OMNIA_FW_VERSION_LEN + 1)
+#define OMNIA_BOARD_INFO_LEN		16
+
+int omnia_cmd_write_read(const struct i2c_client *client,
+			 void *cmd, unsigned int cmd_len,
+			 void *reply, unsigned int reply_len)
+{
+	struct i2c_msg msgs[2];
+	int ret, num;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = cmd_len;
+	msgs[0].buf = cmd;
+	num = 1;
+
+	if (reply_len) {
+		msgs[1].addr = client->addr;
+		msgs[1].flags = I2C_M_RD;
+		msgs[1].len = reply_len;
+		msgs[1].buf = reply;
+		num++;
+	}
+
+	ret = i2c_transfer(client->adapter, msgs, num);
+	if (ret < 0)
+		return ret;
+	if (ret != num)
+		return -EIO;
+
+	return 0;
+}
+
+static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
+				  char version[static OMNIA_FW_VERSION_HEX_LEN])
+{
+	u8 reply[OMNIA_FW_VERSION_LEN];
+	char *p;
+	int err;
+
+	err = omnia_cmd_read(mcu->client,
+			     bootloader ? OMNIA_CMD_GET_FW_VERSION_BOOT
+					: OMNIA_CMD_GET_FW_VERSION_APP,
+			     reply, sizeof(reply));
+	if (err)
+		return err;
+
+	p = bin2hex(version, reply, OMNIA_FW_VERSION_LEN);
+	*p = '\0';
+
+	return 0;
+}
+
+static ssize_t fw_version_hash_show(struct device *dev, char *buf,
+				    bool bootloader)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+	char version[OMNIA_FW_VERSION_HEX_LEN];
+	int err;
+
+	err = omnia_get_version_hash(mcu, bootloader, version);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%s\n", version);
+}
+
+static ssize_t fw_version_hash_application_show(struct device *dev,
+						struct device_attribute *a,
+						char *buf)
+{
+	return fw_version_hash_show(dev, buf, false);
+}
+static DEVICE_ATTR_RO(fw_version_hash_application);
+
+static ssize_t fw_version_hash_bootloader_show(struct device *dev,
+					       struct device_attribute *a,
+					       char *buf)
+{
+	return fw_version_hash_show(dev, buf, true);
+}
+static DEVICE_ATTR_RO(fw_version_hash_bootloader);
+
+static ssize_t fw_features_show(struct device *dev, struct device_attribute *a,
+				char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "0x%x\n", mcu->features);
+}
+static DEVICE_ATTR_RO(fw_features);
+
+static ssize_t mcu_type_show(struct device *dev, struct device_attribute *a,
+			     char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", mcu->type);
+}
+static DEVICE_ATTR_RO(mcu_type);
+
+static ssize_t reset_selector_show(struct device *dev,
+				   struct device_attribute *a, char *buf)
+{
+	u8 reply;
+	int err;
+
+	err = omnia_cmd_read_u8(to_i2c_client(dev), OMNIA_CMD_GET_RESET,
+				&reply);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", reply);
+}
+static DEVICE_ATTR_RO(reset_selector);
+
+static ssize_t serial_number_show(struct device *dev,
+				  struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%016llX\n", mcu->board_serial_number);
+}
+static DEVICE_ATTR_RO(serial_number);
+
+static ssize_t first_mac_address_show(struct device *dev,
+				      struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%pM\n", mcu->board_first_mac);
+}
+static DEVICE_ATTR_RO(first_mac_address);
+
+static ssize_t board_revision_show(struct device *dev,
+				   struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", mcu->board_revision);
+}
+static DEVICE_ATTR_RO(board_revision);
+
+static struct attribute *omnia_mcu_base_attrs[] = {
+	&dev_attr_fw_version_hash_application.attr,
+	&dev_attr_fw_version_hash_bootloader.attr,
+	&dev_attr_fw_features.attr,
+	&dev_attr_mcu_type.attr,
+	&dev_attr_reset_selector.attr,
+	&dev_attr_serial_number.attr,
+	&dev_attr_first_mac_address.attr,
+	&dev_attr_board_revision.attr,
+	NULL
+};
+
+static umode_t omnia_mcu_base_attrs_visible(struct kobject *kobj,
+					    struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+
+	if ((a == &dev_attr_serial_number.attr ||
+	     a == &dev_attr_first_mac_address.attr ||
+	     a == &dev_attr_board_revision.attr) &&
+	    !(mcu->features & OMNIA_FEAT_BOARD_INFO))
+		return 0;
+
+	return a->mode;
+}
+
+static const struct attribute_group omnia_mcu_base_group = {
+	.attrs = omnia_mcu_base_attrs,
+	.is_visible = omnia_mcu_base_attrs_visible,
+};
+
+static const struct attribute_group *omnia_mcu_groups[] = {
+	&omnia_mcu_base_group,
+	NULL
+};
+
+static void omnia_mcu_print_version_hash(struct omnia_mcu *mcu, bool bootloader)
+{
+	const char *type = bootloader ? "bootloader" : "application";
+	struct device *dev = &mcu->client->dev;
+	char version[OMNIA_FW_VERSION_HEX_LEN];
+	int err;
+
+	err = omnia_get_version_hash(mcu, bootloader, version);
+	if (err) {
+		dev_err(dev, "Cannot read MCU %s firmware version: %d\n",
+			type, err);
+		return;
+	}
+
+	dev_info(dev, "MCU %s firmware version hash: %s\n", type, version);
+}
+
+static const char *omnia_status_to_mcu_type(u16 status)
+{
+	switch (status & OMNIA_STS_MCU_TYPE_MASK) {
+	case OMNIA_STS_MCU_TYPE_STM32:
+		return "STM32";
+	case OMNIA_STS_MCU_TYPE_GD32:
+		return "GD32";
+	case OMNIA_STS_MCU_TYPE_MKL:
+		return "MKL";
+	default:
+		return "unknown";
+	}
+}
+
+static void omnia_info_missing_feature(struct device *dev, const char *feature)
+{
+	dev_info(dev,
+		 "Your board's MCU firmware does not support the %s feature.\n",
+		 feature);
+}
+
+static int omnia_mcu_read_features(struct omnia_mcu *mcu)
+{
+	static const struct {
+		u16 mask;
+		const char *name;
+	} features[] = {
+#define _DEF_FEAT(_n, _m) { OMNIA_FEAT_ ## _n, _m }
+		_DEF_FEAT(EXT_CMDS,		"extended control and status"),
+		_DEF_FEAT(WDT_PING,		"watchdog pinging"),
+		_DEF_FEAT(LED_STATE_EXT_MASK,	"peripheral LED pins reading"),
+		_DEF_FEAT(NEW_INT_API,		"new interrupt API"),
+		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
+		_DEF_FEAT(TRNG,			"true random number generator"),
+#undef _DEF_FEAT
+	};
+	struct i2c_client *client = mcu->client;
+	struct device *dev = &client->dev;
+	bool suggest_fw_upgrade = false;
+	u16 status;
+	int err;
+
+	/* status word holds MCU type, which we need below */
+	err = omnia_cmd_read_u16(client, OMNIA_CMD_GET_STATUS_WORD, &status);
+	if (err)
+		return err;
+
+	/*
+	 * Check whether MCU firmware supports the OMNIA_CMD_GET_FEATURES
+	 * command.
+	 */
+	if (status & OMNIA_STS_FEATURES_SUPPORTED) {
+		/* try read 32-bit features */
+		err = omnia_cmd_read_u32(client, OMNIA_CMD_GET_FEATURES,
+					 &mcu->features);
+		if (err) {
+			/* try read 16-bit features */
+			u16 features16;
+
+			err = omnia_cmd_read_u16(client, OMNIA_CMD_GET_FEATURES,
+						 &features16);
+			if (err)
+				return err;
+
+			mcu->features = features16;
+		} else {
+			if (mcu->features & OMNIA_FEAT_FROM_BIT_16_INVALID)
+				mcu->features &= GENMASK(15, 0);
+		}
+	} else {
+		dev_info(dev,
+			 "Your board's MCU firmware does not support feature reading.\n");
+		suggest_fw_upgrade = true;
+	}
+
+	mcu->type = omnia_status_to_mcu_type(status);
+	dev_info(dev, "MCU type %s%s\n", mcu->type,
+		 (mcu->features & OMNIA_FEAT_PERIPH_MCU) ?
+			", with peripheral resets wired" : "");
+
+	omnia_mcu_print_version_hash(mcu, true);
+
+	if (mcu->features & OMNIA_FEAT_BOOTLOADER)
+		dev_warn(dev,
+			 "MCU is running bootloader firmware. Was firmware upgrade interrupted?\n");
+	else
+		omnia_mcu_print_version_hash(mcu, false);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(features); i++) {
+		if (mcu->features & features[i].mask)
+			continue;
+
+		omnia_info_missing_feature(dev, features[i].name);
+		suggest_fw_upgrade = true;
+	}
+
+	if (suggest_fw_upgrade)
+		dev_info(dev,
+			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
+
+	return 0;
+}
+
+static int omnia_mcu_read_board_info(struct omnia_mcu *mcu)
+{
+	u8 reply[1 + OMNIA_BOARD_INFO_LEN];
+	int err;
+
+	err = omnia_cmd_read(mcu->client, OMNIA_CMD_BOARD_INFO_GET, reply,
+			     sizeof(reply));
+	if (err)
+		return err;
+
+	if (reply[0] != OMNIA_BOARD_INFO_LEN)
+		return -EIO;
+
+	mcu->board_serial_number = get_unaligned_le64(&reply[1]);
+
+	/* we can't use ether_addr_copy() because reply is not u16-aligned */
+	memcpy(mcu->board_first_mac, &reply[9], sizeof(mcu->board_first_mac));
+
+	mcu->board_revision = reply[15];
+
+	return 0;
+}
+
+static int omnia_mcu_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct omnia_mcu *mcu;
+	int err;
+
+	if (!client->irq)
+		return dev_err_probe(dev, -EINVAL, "IRQ resource not found\n");
+
+	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	mcu->client = client;
+	i2c_set_clientdata(client, mcu);
+
+	err = omnia_mcu_read_features(mcu);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot determine MCU supported features\n");
+
+	if (mcu->features & OMNIA_FEAT_BOARD_INFO) {
+		err = omnia_mcu_read_board_info(mcu);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Cannot read board info\n");
+	}
+
+	return 0;
+}
+
+static const struct of_device_id of_omnia_mcu_match[] = {
+	{ .compatible = "cznic,turris-omnia-mcu" },
+	{}
+};
+
+static struct i2c_driver omnia_mcu_driver = {
+	.probe		= omnia_mcu_probe,
+	.driver		= {
+		.name	= "turris-omnia-mcu",
+		.of_match_table = of_omnia_mcu_match,
+		.dev_groups = omnia_mcu_groups,
+	},
+};
+module_i2c_driver(omnia_mcu_driver);
+
+MODULE_AUTHOR("Marek Behun <kabel@kernel.org>");
+MODULE_DESCRIPTION("CZ.NIC's Turris Omnia MCU");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
new file mode 100644
index 000000000000..3d0daa6f13ef
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CZ.NIC's Turris Omnia MCU driver
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#ifndef __TURRIS_OMNIA_MCU_H
+#define __TURRIS_OMNIA_MCU_H
+
+#include <linux/if_ether.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+struct i2c_client;
+
+struct omnia_mcu {
+	struct i2c_client *client;
+	const char *type;
+	u32 features;
+
+	/* board information */
+	u64 board_serial_number;
+	u8 board_first_mac[ETH_ALEN];
+	u8 board_revision;
+};
+
+int omnia_cmd_write_read(const struct i2c_client *client,
+			 void *cmd, unsigned int cmd_len,
+			 void *reply, unsigned int reply_len);
+
+static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd,
+				 void *reply, unsigned int len)
+{
+	return omnia_cmd_write_read(client, &cmd, 1, reply, len);
+}
+
+static inline int omnia_cmd_read_u32(const struct i2c_client *client, u8 cmd,
+				     u32 *dst)
+{
+	__le32 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+	if (err)
+		return err;
+
+	*dst = le32_to_cpu(reply);
+
+	return 0;
+}
+
+static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd,
+				     u16 *dst)
+{
+	__le16 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+	if (err)
+		return err;
+
+	*dst = le16_to_cpu(reply);
+
+	return 0;
+}
+
+static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd,
+				    u8 *reply)
+{
+	return omnia_cmd_read(client, cmd, reply, sizeof(*reply));
+}
+
+#endif /* __TURRIS_OMNIA_MCU_H */
diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
new file mode 100644
index 000000000000..2da8cbeb158a
--- /dev/null
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CZ.NIC's Turris Omnia MCU I2C interface commands definitions
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#ifndef __TURRIS_OMNIA_MCU_INTERFACE_H
+#define __TURRIS_OMNIA_MCU_INTERFACE_H
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+enum omnia_commands_e {
+	OMNIA_CMD_GET_STATUS_WORD		= 0x01, /* slave sends status word back */
+	OMNIA_CMD_GENERAL_CONTROL		= 0x02,
+	OMNIA_CMD_LED_MODE			= 0x03, /* default/user */
+	OMNIA_CMD_LED_STATE			= 0x04, /* LED on/off */
+	OMNIA_CMD_LED_COLOR			= 0x05, /* LED number + RED + GREEN + BLUE */
+	OMNIA_CMD_USER_VOLTAGE			= 0x06,
+	OMNIA_CMD_SET_BRIGHTNESS		= 0x07,
+	OMNIA_CMD_GET_BRIGHTNESS		= 0x08,
+	OMNIA_CMD_GET_RESET			= 0x09,
+	OMNIA_CMD_GET_FW_VERSION_APP		= 0x0A, /* 20B git hash number */
+	OMNIA_CMD_SET_WATCHDOG_STATE		= 0x0B, /* 0 - disable
+							 * 1 - enable / ping
+							 * after boot watchdog is started
+							 * with 2 minutes timeout
+							 */
+
+	/* OMNIA_CMD_WATCHDOG_STATUS		= 0x0C, not implemented anymore */
+
+	OMNIA_CMD_GET_WATCHDOG_STATE		= 0x0D,
+	OMNIA_CMD_GET_FW_VERSION_BOOT		= 0x0E, /* 20B Git hash number */
+	OMNIA_CMD_GET_FW_CHECKSUM		= 0x0F, /* 4B length, 4B checksum */
+
+	/* available if FEATURES_SUPPORTED bit set in status word */
+	OMNIA_CMD_GET_FEATURES			= 0x10,
+
+	/* available if EXT_CMD bit set in features */
+	OMNIA_CMD_GET_EXT_STATUS_DWORD		= 0x11,
+	OMNIA_CMD_EXT_CONTROL			= 0x12,
+	OMNIA_CMD_GET_EXT_CONTROL_STATUS	= 0x13,
+
+	/* available if NEW_INT_API bit set in features */
+	OMNIA_CMD_GET_INT_AND_CLEAR		= 0x14,
+	OMNIA_CMD_GET_INT_MASK			= 0x15,
+	OMNIA_CMD_SET_INT_MASK			= 0x16,
+
+	/* available if FLASHING bit set in features */
+	OMNIA_CMD_FLASH				= 0x19,
+
+	/* available if WDT_PING bit set in features */
+	OMNIA_CMD_SET_WDT_TIMEOUT		= 0x20,
+	OMNIA_CMD_GET_WDT_TIMELEFT		= 0x21,
+
+	/* available if POWEROFF_WAKEUP bit set in features */
+	OMNIA_CMD_SET_WAKEUP			= 0x22,
+	OMNIA_CMD_GET_UPTIME_AND_WAKEUP		= 0x23,
+	OMNIA_CMD_POWER_OFF			= 0x24,
+
+	/* available if USB_OVC_PROT_SETTING bit set in features */
+	OMNIA_CMD_SET_USB_OVC_PROT		= 0x25,
+	OMNIA_CMD_GET_USB_OVC_PROT		= 0x26,
+
+	/* available if TRNG bit set in features */
+	OMNIA_CMD_TRNG_COLLECT_ENTROPY		= 0x28,
+
+	/* available if CRYPTO bit set in features */
+	OMNIA_CMD_CRYPTO_GET_PUBLIC_KEY		= 0x29,
+	OMNIA_CMD_CRYPTO_SIGN_MESSAGE		= 0x2A,
+	OMNIA_CMD_CRYPTO_COLLECT_SIGNATURE	= 0x2B,
+
+	/* available if BOARD_INFO it set in features */
+	OMNIA_CMD_BOARD_INFO_GET		= 0x2C,
+	OMNIA_CMD_BOARD_INFO_BURN		= 0x2D,
+
+	/* available only at address 0x2b (LED-controller) */
+	/* available only if LED_GAMMA_CORRECTION bit set in features */
+	OMNIA_CMD_SET_GAMMA_CORRECTION		= 0x30,
+	OMNIA_CMD_GET_GAMMA_CORRECTION		= 0x31,
+
+	/* available only at address 0x2b (LED-controller) */
+	/* available only if PER_LED_CORRECTION bit set in features */
+	/* available only if FROM_BIT_16_INVALID bit NOT set in features */
+	OMNIA_CMD_SET_LED_CORRECTIONS		= 0x32,
+	OMNIA_CMD_GET_LED_CORRECTIONS		= 0x33,
+};
+
+enum omnia_flashing_commands_e {
+	OMNIA_FLASH_CMD_UNLOCK		= 0x01,
+	OMNIA_FLASH_CMD_SIZE_AND_CSUM	= 0x02,
+	OMNIA_FLASH_CMD_PROGRAM		= 0x03,
+	OMNIA_FLASH_CMD_RESET		= 0x04,
+};
+
+enum omnia_sts_word_e {
+	OMNIA_STS_MCU_TYPE_MASK			= GENMASK(1, 0),
+	OMNIA_STS_MCU_TYPE_STM32		= FIELD_PREP_CONST(OMNIA_STS_MCU_TYPE_MASK, 0),
+	OMNIA_STS_MCU_TYPE_GD32			= FIELD_PREP_CONST(OMNIA_STS_MCU_TYPE_MASK, 1),
+	OMNIA_STS_MCU_TYPE_MKL			= FIELD_PREP_CONST(OMNIA_STS_MCU_TYPE_MASK, 2),
+	OMNIA_STS_FEATURES_SUPPORTED		= BIT(2),
+	OMNIA_STS_USER_REGULATOR_NOT_SUPPORTED	= BIT(3),
+	OMNIA_STS_CARD_DET			= BIT(4),
+	OMNIA_STS_MSATA_IND			= BIT(5),
+	OMNIA_STS_USB30_OVC			= BIT(6),
+	OMNIA_STS_USB31_OVC			= BIT(7),
+	OMNIA_STS_USB30_PWRON			= BIT(8),
+	OMNIA_STS_USB31_PWRON			= BIT(9),
+	OMNIA_STS_ENABLE_4V5			= BIT(10),
+	OMNIA_STS_BUTTON_MODE			= BIT(11),
+	OMNIA_STS_BUTTON_PRESSED		= BIT(12),
+	OMNIA_STS_BUTTON_COUNTER_MASK		= GENMASK(15, 13),
+};
+
+enum omnia_ctl_byte_e {
+	OMNIA_CTL_LIGHT_RST	= BIT(0),
+	OMNIA_CTL_HARD_RST	= BIT(1),
+	/* BIT(2) is currently reserved */
+	OMNIA_CTL_USB30_PWRON	= BIT(3),
+	OMNIA_CTL_USB31_PWRON	= BIT(4),
+	OMNIA_CTL_ENABLE_4V5	= BIT(5),
+	OMNIA_CTL_BUTTON_MODE	= BIT(6),
+	OMNIA_CTL_BOOTLOADER	= BIT(7),
+};
+
+enum omnia_features_e {
+	OMNIA_FEAT_PERIPH_MCU		= BIT(0),
+	OMNIA_FEAT_EXT_CMDS		= BIT(1),
+	OMNIA_FEAT_WDT_PING		= BIT(2),
+	OMNIA_FEAT_LED_STATE_EXT_MASK	= GENMASK(4, 3),
+	OMNIA_FEAT_LED_STATE_EXT	= FIELD_PREP_CONST(OMNIA_FEAT_LED_STATE_EXT_MASK, 1),
+	OMNIA_FEAT_LED_STATE_EXT_V32	= FIELD_PREP_CONST(OMNIA_FEAT_LED_STATE_EXT_MASK, 2),
+	OMNIA_FEAT_LED_GAMMA_CORRECTION	= BIT(5),
+	OMNIA_FEAT_NEW_INT_API		= BIT(6),
+	OMNIA_FEAT_BOOTLOADER		= BIT(7),
+	OMNIA_FEAT_FLASHING		= BIT(8),
+	OMNIA_FEAT_NEW_MESSAGE_API	= BIT(9),
+	OMNIA_FEAT_BRIGHTNESS_INT	= BIT(10),
+	OMNIA_FEAT_POWEROFF_WAKEUP	= BIT(11),
+	OMNIA_FEAT_CAN_OLD_MESSAGE_API	= BIT(12),
+	OMNIA_FEAT_TRNG			= BIT(13),
+	OMNIA_FEAT_CRYPTO		= BIT(14),
+	OMNIA_FEAT_BOARD_INFO		= BIT(15),
+
+	/*
+	 * Orginally the features command replied only 16 bits. If more were
+	 * read, either the I2C transaction failed or 0xff bytes were sent.
+	 * Therefore to consider bits 16 - 31 valid, one bit (20) was reserved
+	 * to be zero.
+	 */
+
+	/* Bits 16 - 19 correspond to bits 0 - 3 of status word */
+	OMNIA_FEAT_MCU_TYPE_MASK		= GENMASK(17, 16),
+	OMNIA_FEAT_MCU_TYPE_STM32		= FIELD_PREP_CONST(OMNIA_FEAT_MCU_TYPE_MASK, 0),
+	OMNIA_FEAT_MCU_TYPE_GD32		= FIELD_PREP_CONST(OMNIA_FEAT_MCU_TYPE_MASK, 1),
+	OMNIA_FEAT_MCU_TYPE_MKL			= FIELD_PREP_CONST(OMNIA_FEAT_MCU_TYPE_MASK, 2),
+	OMNIA_FEAT_FEATURES_SUPPORTED		= BIT(18),
+	OMNIA_FEAT_USER_REGULATOR_NOT_SUPPORTED	= BIT(19),
+
+	/* must not be set */
+	OMNIA_FEAT_FROM_BIT_16_INVALID	= BIT(20),
+
+	OMNIA_FEAT_PER_LED_CORRECTION	= BIT(21),
+	OMNIA_FEAT_USB_OVC_PROT_SETTING	= BIT(22),
+};
+
+enum omnia_ext_sts_dword_e {
+	OMNIA_EXT_STS_SFP_nDET		= BIT(0),
+	OMNIA_EXT_STS_LED_STATES_MASK	= GENMASK(31, 12),
+	OMNIA_EXT_STS_WLAN0_MSATA_LED	= BIT(12),
+	OMNIA_EXT_STS_WLAN1_LED		= BIT(13),
+	OMNIA_EXT_STS_WLAN2_LED		= BIT(14),
+	OMNIA_EXT_STS_WPAN0_LED		= BIT(15),
+	OMNIA_EXT_STS_WPAN1_LED		= BIT(16),
+	OMNIA_EXT_STS_WPAN2_LED		= BIT(17),
+	OMNIA_EXT_STS_WAN_LED0		= BIT(18),
+	OMNIA_EXT_STS_WAN_LED1		= BIT(19),
+	OMNIA_EXT_STS_LAN0_LED0		= BIT(20),
+	OMNIA_EXT_STS_LAN0_LED1		= BIT(21),
+	OMNIA_EXT_STS_LAN1_LED0		= BIT(22),
+	OMNIA_EXT_STS_LAN1_LED1		= BIT(23),
+	OMNIA_EXT_STS_LAN2_LED0		= BIT(24),
+	OMNIA_EXT_STS_LAN2_LED1		= BIT(25),
+	OMNIA_EXT_STS_LAN3_LED0		= BIT(26),
+	OMNIA_EXT_STS_LAN3_LED1		= BIT(27),
+	OMNIA_EXT_STS_LAN4_LED0		= BIT(28),
+	OMNIA_EXT_STS_LAN4_LED1		= BIT(29),
+	OMNIA_EXT_STS_LAN5_LED0		= BIT(30),
+	OMNIA_EXT_STS_LAN5_LED1		= BIT(31),
+};
+
+enum omnia_ext_ctl_e {
+	OMNIA_EXT_CTL_nRES_MMC		= BIT(0),
+	OMNIA_EXT_CTL_nRES_LAN		= BIT(1),
+	OMNIA_EXT_CTL_nRES_PHY		= BIT(2),
+	OMNIA_EXT_CTL_nPERST0		= BIT(3),
+	OMNIA_EXT_CTL_nPERST1		= BIT(4),
+	OMNIA_EXT_CTL_nPERST2		= BIT(5),
+	OMNIA_EXT_CTL_PHY_SFP		= BIT(6),
+	OMNIA_EXT_CTL_PHY_SFP_AUTO	= BIT(7),
+	OMNIA_EXT_CTL_nVHV_CTRL		= BIT(8),
+};
+
+enum omnia_int_e {
+	OMNIA_INT_CARD_DET		= BIT(0),
+	OMNIA_INT_MSATA_IND		= BIT(1),
+	OMNIA_INT_USB30_OVC		= BIT(2),
+	OMNIA_INT_USB31_OVC		= BIT(3),
+	OMNIA_INT_BUTTON_PRESSED	= BIT(4),
+	OMNIA_INT_SFP_nDET		= BIT(5),
+	OMNIA_INT_BRIGHTNESS_CHANGED	= BIT(6),
+	OMNIA_INT_TRNG			= BIT(7),
+	OMNIA_INT_MESSAGE_SIGNED	= BIT(8),
+
+	OMNIA_INT_LED_STATES_MASK	= GENMASK(31, 12),
+	OMNIA_INT_WLAN0_MSATA_LED	= BIT(12),
+	OMNIA_INT_WLAN1_LED		= BIT(13),
+	OMNIA_INT_WLAN2_LED		= BIT(14),
+	OMNIA_INT_WPAN0_LED		= BIT(15),
+	OMNIA_INT_WPAN1_LED		= BIT(16),
+	OMNIA_INT_WPAN2_LED		= BIT(17),
+	OMNIA_INT_WAN_LED0		= BIT(18),
+	OMNIA_INT_WAN_LED1		= BIT(19),
+	OMNIA_INT_LAN0_LED0		= BIT(20),
+	OMNIA_INT_LAN0_LED1		= BIT(21),
+	OMNIA_INT_LAN1_LED0		= BIT(22),
+	OMNIA_INT_LAN1_LED1		= BIT(23),
+	OMNIA_INT_LAN2_LED0		= BIT(24),
+	OMNIA_INT_LAN2_LED1		= BIT(25),
+	OMNIA_INT_LAN3_LED0		= BIT(26),
+	OMNIA_INT_LAN3_LED1		= BIT(27),
+	OMNIA_INT_LAN4_LED0		= BIT(28),
+	OMNIA_INT_LAN4_LED1		= BIT(29),
+	OMNIA_INT_LAN5_LED0		= BIT(30),
+	OMNIA_INT_LAN5_LED1		= BIT(31),
+};
+
+enum omnia_cmd_poweroff_e {
+	OMNIA_CMD_POWER_OFF_POWERON_BUTTON	= BIT(0),
+	OMNIA_CMD_POWER_OFF_MAGIC		= 0xdead,
+};
+
+enum omnia_cmd_usb_ovc_prot_e {
+	OMNIA_CMD_xET_USB_OVC_PROT_PORT_MASK	= GENMASK(3, 0),
+	OMNIA_CMD_xET_USB_OVC_PROT_ENABLE	= BIT(4),
+};
+
+#endif /* __TURRIS_OMNIA_MCU_INTERFACE_H */
-- 
2.44.2


