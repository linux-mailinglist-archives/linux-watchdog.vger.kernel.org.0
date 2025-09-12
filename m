Return-Path: <linux-watchdog+bounces-4242-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893BB54D40
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 14:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 744E016B263
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 12:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E5D320A0D;
	Fri, 12 Sep 2025 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLOJ00Qp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF483043A0;
	Fri, 12 Sep 2025 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678911; cv=none; b=ioz6Cbe+Nm5tzjH3iQeTwaZXIH5oIAFXjtMAhczufIUiXJ6Ndi8qar+T5fZrvV0mRdnuTfkbaV9e8ef56wClstJBgL0ousVAeyn7fJUGnQxbgDLFINmA1Kx8p3CPP9CsnWOwAjIDmrOaOJiM9lqCPqPQr1XMhI7jKUPFDAfKIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678911; c=relaxed/simple;
	bh=iI6wf8clG2A4L9G78U+CNoUvgKXBC0/MOjNwTHPB0Gs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GngGCitVwo24TrA7r88Y7VYYXIfD/E+ce5/IFqNAQ0Gg3mGF6hhgnygWOLa83t0e1IrLQ2X6IJs6SP83fUf6Jpx4Ep0OzQSwDpRjJo5IrmeMgqOauCG+HFH1nAS2lITuHrr57aPgQVbcMfmYDMmWMBxe6Wgc9N8LdGN782anbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLOJ00Qp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88A8C4CEFA;
	Fri, 12 Sep 2025 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678911;
	bh=iI6wf8clG2A4L9G78U+CNoUvgKXBC0/MOjNwTHPB0Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uLOJ00Qp9BNgR8N8Cm7WfGNe+psOP5/2weFvZ7v84ELpmeO7UxQZDBXMqkqAe2M1R
	 2YuCcTG5uXLUuP2+Nl/N/n1nmVlZXBCY4oq/nqhPowJcwmxssvilwddo5/wckbcpaK
	 24V+gvcgIz0bRssm9siL1p6p97AFq+O9YXgOztps6gGYVknmlV002BwCstEs4/eeiD
	 FwMz1v3chCn7+zqwJUkZBmbZG1E+d7dB7FIdfOIQjQdX+hN4EivwoiK/GAExBVNzyW
	 fNYjw+tTsUE+tUGQzhdDShpe3UdIIsXo9L8ZdA5wc73I4osc4gpgMZhuOVfzxCA19e
	 13VBuTF7GPCNA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: [PATCH v2 6/7] hwmon: add SMARC-sAM67 support
Date: Fri, 12 Sep 2025 14:07:44 +0200
Message-Id: <20250912120745.2295115-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new driver for the Kontron SMARC-sAM67 board management
controller. It has two voltage sensors and one temperature sensor.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/hwmon/sa67.rst  |  41 +++++++++
 MAINTAINERS                   |   1 +
 drivers/hwmon/Kconfig         |  10 +++
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/sa67mcu-hwmon.c | 161 ++++++++++++++++++++++++++++++++++
 5 files changed, 214 insertions(+)
 create mode 100644 Documentation/hwmon/sa67.rst
 create mode 100644 drivers/hwmon/sa67mcu-hwmon.c

diff --git a/Documentation/hwmon/sa67.rst b/Documentation/hwmon/sa67.rst
new file mode 100644
index 000000000000..029c7c169b7f
--- /dev/null
+++ b/Documentation/hwmon/sa67.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver sa67mcu
+=====================
+
+Supported chips:
+
+   * Kontron sa67mcu
+
+     Prefix: 'sa67mcu'
+
+     Datasheet: not available
+
+Authors: Michael Walle <mwalle@kernel.org>
+
+Description
+-----------
+
+The sa67mcu is a board management controller which also exposes a hardware
+monitoring controller.
+
+The controller has two voltage and one temperature sensor. The values are
+hold in two 8 bit registers to form one 16 bit value. Reading the lower byte
+will also capture the high byte to make the access atomic. The unit of the
+volatge sensors are 1mV and the unit of the temperature sensor is 0.1degC.
+
+Sysfs entries
+-------------
+
+The following attributes are supported.
+
+======================= ========================================================
+in0_label		"VDDIN"
+in0_input		Measured VDDIN voltage.
+
+in1_label		"VDD_RTC"
+in1_input		Measured VDD_RTC voltage.
+
+temp1_input		MCU temperature. Roughly the board temperature.
+======================= ========================================================
+
diff --git a/MAINTAINERS b/MAINTAINERS
index fa7f80bd7b2f..69fcd5c077ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23489,6 +23489,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.
 F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
 F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
 F:	drivers/gpio/gpio-sl28cpld.c
+F:	drivers/hwmon/sa67mcu-hwmon.c
 F:	drivers/hwmon/sl28cpld-hwmon.c
 F:	drivers/irqchip/irq-sl28cpld.c
 F:	drivers/pwm/pwm-sl28cpld.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d6769288a76e..c2f288ebdf44 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1905,6 +1905,16 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_SA67MCU
+	tristate "Kontron sa67mcu hardware monitoring driver"
+	depends on MFD_SL28CPLD || COMPILE_TEST
+	help
+	  If you say yes here you get support for the voltage and temperature
+	  monitor of the sa67 board management controller.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called sa67mcu-hwmon.
+
 config SENSORS_SL28CPLD
 	tristate "Kontron sl28cpld hardware monitoring driver"
 	depends on MFD_SL28CPLD || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 051981eb8a50..2956898776bb 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -197,6 +197,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
+obj-$(CONFIG_SENSORS_SA67MCU)	+= sa67mcu-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
diff --git a/drivers/hwmon/sa67mcu-hwmon.c b/drivers/hwmon/sa67mcu-hwmon.c
new file mode 100644
index 000000000000..22f703b7b256
--- /dev/null
+++ b/drivers/hwmon/sa67mcu-hwmon.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * sl67mcu hardware monitoring driver
+ *
+ * Copyright 2025 Kontron Europe GmbH
+ */
+
+#include <linux/bitfield.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define SA67MCU_VOLTAGE(n)	(0x00 + ((n) * 2))
+#define SA67MCU_TEMP(n)		(0x04 + ((n) * 2))
+
+struct sa67mcu_hwmon {
+	struct regmap *regmap;
+	u32 offset;
+};
+
+static int sa67mcu_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type, u32 attr,
+			      int channel, long *input)
+{
+	struct sa67mcu_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int offset;
+	u8 reg[2];
+	int ret;
+
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			offset = hwmon->offset + SA67MCU_VOLTAGE(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			offset = hwmon->offset + SA67MCU_TEMP(channel);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Reading the low byte will capture the value */
+	ret = regmap_bulk_read(hwmon->regmap, offset, reg, ARRAY_SIZE(reg));
+	if (ret)
+		return ret;
+
+	*input = reg[1] << 8 | reg[0];
+
+	/* Temperatures are s16 and in 0.1degC steps. */
+	if (type == hwmon_temp)
+		*input = sign_extend32(*input, 15) * 100;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info * const sa67mcu_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const char *const sa67mcu_hwmon_in_labels[] = {
+	"VDDIN",
+	"VDD_RTC",
+};
+
+static int sa67mcu_hwmon_read_string(struct device *dev,
+				     enum hwmon_sensor_types type, u32 attr,
+				     int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+			*str = sa67mcu_hwmon_in_labels[channel];
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops sa67mcu_hwmon_ops = {
+	.visible = 0444,
+	.read = sa67mcu_hwmon_read,
+	.read_string = sa67mcu_hwmon_read_string,
+};
+
+static const struct hwmon_chip_info sa67mcu_hwmon_chip_info = {
+	.ops = &sa67mcu_hwmon_ops,
+	.info = sa67mcu_hwmon_info,
+};
+
+static int sa67mcu_hwmon_probe(struct platform_device *pdev)
+{
+	struct sa67mcu_hwmon *hwmon;
+	struct device *hwmon_dev;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return -ENOMEM;
+
+	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!hwmon->regmap)
+		return -ENODEV;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &hwmon->offset);
+	if (ret)
+		return -EINVAL;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+							 "sa67mcu_hwmon", hwmon,
+							 &sa67mcu_hwmon_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		dev_err(&pdev->dev, "failed to register as hwmon device");
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id sa67mcu_hwmon_of_match[] = {
+	{ .compatible = "kontron,sa67mcu-hwmon", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sa67mcu_hwmon_of_match);
+
+static struct platform_driver sa67mcu_hwmon_driver = {
+	.probe = sa67mcu_hwmon_probe,
+	.driver = {
+		.name = "sa67mcu-hwmon",
+		.of_match_table = sa67mcu_hwmon_of_match,
+	},
+};
+module_platform_driver(sa67mcu_hwmon_driver);
+
+MODULE_DESCRIPTION("sa67mcu Hardware Monitoring Driver");
+MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.39.5


