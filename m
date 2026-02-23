Return-Path: <linux-watchdog+bounces-4964-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGTICnImnGlfAAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4964-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:38 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9BC174773
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B5AB3017BD4
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 10:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024323563C4;
	Mon, 23 Feb 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KG1ASrQi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0833354AE2;
	Mon, 23 Feb 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841118; cv=none; b=dBIK91zgamFP566uqWrKyhoQ/r8We35uSUrmdYFEDZQBMXuzsTSTcw88hGtYldzSHDq4F5qeAPVb222STOBu+WcnOLTMlNJNu7ZgQL0KaSthy+/pAdq4HpYVaNBPEpi/1tSjI6oyWYA8vQJDs1BOxvsgdVvp/FNHhp4oEf1vj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841118; c=relaxed/simple;
	bh=C4S7MdMK5ArzO4tWRcii5CYklyy2NH2boIUrfzkqudc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkGSKpRY4yQTDs2rBDG8SzZz7l9YnnWuSaIXUeYmj4kaXjgtY3Gy12zt5LpELOGz1IMMxF++ywxVkUfrQqfw+r/o9t/DUjt9bHvKuH5yMlIKct72Mgy1LE+SdGDWr0moiIjfKk3M37ZYFFQ2S94zy+Bab6tIIqXvxzB8HxGdYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KG1ASrQi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D849FC116D0;
	Mon, 23 Feb 2026 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841118;
	bh=C4S7MdMK5ArzO4tWRcii5CYklyy2NH2boIUrfzkqudc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KG1ASrQiNwmvevWeA13FvAaPuEkcGXKtffakDKZub8GXSk9BDEY0LmL2LflyUxxy1
	 9pGwFF/6HsL2BsRNq/vRKgrYKqwdSIWtcZSqpAPFUNxMq1CI4e2HNLCdp/WZKzwgtn
	 ln1P2y0zXcxhoiTl4naplmdEIwEjjyhOyB6NynNh0SAEXR5QIo4NdUSeYyS2wjZ5Dd
	 r1nkNyGc7Ry3SJjZTaat1Hm/Thkq2odTsbRJY8CDBDDB2W1xBZbEr7DubvP1qqHg2/
	 EM9GWQ1x96jo5JbIly6iL2MAuY9JMRlLrouFtU3+JkM/IN5GTmJRcsHuk+iufB0VpE
	 kLTApAdrdtstw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 3/8] Revert "hwmon: add SMARC-sAM67 support"
Date: Mon, 23 Feb 2026 11:04:48 +0100
Message-ID: <20260223100459.844967-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-4964-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F9BC174773
X-Rspamd-Action: no action

This reverts commit 443b39c82c322c9f3c38bea0389fe927ba00b3b4.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/hwmon/index.rst |   1 -
 Documentation/hwmon/sa67.rst  |  41 ---------
 MAINTAINERS                   |   1 -
 drivers/hwmon/Kconfig         |  10 ---
 drivers/hwmon/Makefile        |   1 -
 drivers/hwmon/sa67mcu-hwmon.c | 161 ----------------------------------
 6 files changed, 215 deletions(-)
 delete mode 100644 Documentation/hwmon/sa67.rst
 delete mode 100644 drivers/hwmon/sa67mcu-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d91dbb20c7dc..b2ca8513cfcd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -220,7 +220,6 @@ Hardware Monitoring Kernel Drivers
    q54sj108a2
    qnap-mcu-hwmon
    raspberrypi-hwmon
-   sa67
    sbrmi
    sbtsi_temp
    sch5627
diff --git a/Documentation/hwmon/sa67.rst b/Documentation/hwmon/sa67.rst
deleted file mode 100644
index 029c7c169b7f..000000000000
--- a/Documentation/hwmon/sa67.rst
+++ /dev/null
@@ -1,41 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0-only
-
-Kernel driver sa67mcu
-=====================
-
-Supported chips:
-
-   * Kontron sa67mcu
-
-     Prefix: 'sa67mcu'
-
-     Datasheet: not available
-
-Authors: Michael Walle <mwalle@kernel.org>
-
-Description
------------
-
-The sa67mcu is a board management controller which also exposes a hardware
-monitoring controller.
-
-The controller has two voltage and one temperature sensor. The values are
-hold in two 8 bit registers to form one 16 bit value. Reading the lower byte
-will also capture the high byte to make the access atomic. The unit of the
-volatge sensors are 1mV and the unit of the temperature sensor is 0.1degC.
-
-Sysfs entries
--------------
-
-The following attributes are supported.
-
-======================= ========================================================
-in0_label		"VDDIN"
-in0_input		Measured VDDIN voltage.
-
-in1_label		"VDD_RTC"
-in1_input		Measured VDD_RTC voltage.
-
-temp1_input		MCU temperature. Roughly the board temperature.
-======================= ========================================================
-
diff --git a/MAINTAINERS b/MAINTAINERS
index 71f76fddebbf..d34f7057610c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24340,7 +24340,6 @@ F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.
 F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
 F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
 F:	drivers/gpio/gpio-sl28cpld.c
-F:	drivers/hwmon/sa67mcu-hwmon.c
 F:	drivers/hwmon/sl28cpld-hwmon.c
 F:	drivers/irqchip/irq-sl28cpld.c
 F:	drivers/pwm/pwm-sl28cpld.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 41c381764c2b..486152a8ea77 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1927,16 +1927,6 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
-config SENSORS_SA67MCU
-	tristate "Kontron sa67mcu hardware monitoring driver"
-	depends on MFD_SL28CPLD || COMPILE_TEST
-	help
-	  If you say yes here you get support for the voltage and temperature
-	  monitor of the sa67 board management controller.
-
-	  This driver can also be built as a module.  If so, the module
-	  will be called sa67mcu-hwmon.
-
 config SENSORS_SL28CPLD
 	tristate "Kontron sl28cpld hardware monitoring driver"
 	depends on MFD_SL28CPLD || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index eade8e3b1bde..5833c807c688 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -199,7 +199,6 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
-obj-$(CONFIG_SENSORS_SA67MCU)	+= sa67mcu-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
diff --git a/drivers/hwmon/sa67mcu-hwmon.c b/drivers/hwmon/sa67mcu-hwmon.c
deleted file mode 100644
index 22f703b7b256..000000000000
--- a/drivers/hwmon/sa67mcu-hwmon.c
+++ /dev/null
@@ -1,161 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * sl67mcu hardware monitoring driver
- *
- * Copyright 2025 Kontron Europe GmbH
- */
-
-#include <linux/bitfield.h>
-#include <linux/hwmon.h>
-#include <linux/kernel.h>
-#include <linux/mod_devicetable.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/property.h>
-#include <linux/regmap.h>
-
-#define SA67MCU_VOLTAGE(n)	(0x00 + ((n) * 2))
-#define SA67MCU_TEMP(n)		(0x04 + ((n) * 2))
-
-struct sa67mcu_hwmon {
-	struct regmap *regmap;
-	u32 offset;
-};
-
-static int sa67mcu_hwmon_read(struct device *dev,
-			      enum hwmon_sensor_types type, u32 attr,
-			      int channel, long *input)
-{
-	struct sa67mcu_hwmon *hwmon = dev_get_drvdata(dev);
-	unsigned int offset;
-	u8 reg[2];
-	int ret;
-
-	switch (type) {
-	case hwmon_in:
-		switch (attr) {
-		case hwmon_in_input:
-			offset = hwmon->offset + SA67MCU_VOLTAGE(channel);
-			break;
-		default:
-			return -EOPNOTSUPP;
-		}
-		break;
-	case hwmon_temp:
-		switch (attr) {
-		case hwmon_temp_input:
-			offset = hwmon->offset + SA67MCU_TEMP(channel);
-			break;
-		default:
-			return -EOPNOTSUPP;
-		}
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	/* Reading the low byte will capture the value */
-	ret = regmap_bulk_read(hwmon->regmap, offset, reg, ARRAY_SIZE(reg));
-	if (ret)
-		return ret;
-
-	*input = reg[1] << 8 | reg[0];
-
-	/* Temperatures are s16 and in 0.1degC steps. */
-	if (type == hwmon_temp)
-		*input = sign_extend32(*input, 15) * 100;
-
-	return 0;
-}
-
-static const struct hwmon_channel_info * const sa67mcu_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_INPUT | HWMON_I_LABEL,
-			   HWMON_I_INPUT | HWMON_I_LABEL),
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
-	NULL
-};
-
-static const char *const sa67mcu_hwmon_in_labels[] = {
-	"VDDIN",
-	"VDD_RTC",
-};
-
-static int sa67mcu_hwmon_read_string(struct device *dev,
-				     enum hwmon_sensor_types type, u32 attr,
-				     int channel, const char **str)
-{
-	switch (type) {
-	case hwmon_in:
-		switch (attr) {
-		case hwmon_in_label:
-			*str = sa67mcu_hwmon_in_labels[channel];
-			return 0;
-		default:
-			return -EOPNOTSUPP;
-		}
-	default:
-		return -EOPNOTSUPP;
-	}
-}
-
-static const struct hwmon_ops sa67mcu_hwmon_ops = {
-	.visible = 0444,
-	.read = sa67mcu_hwmon_read,
-	.read_string = sa67mcu_hwmon_read_string,
-};
-
-static const struct hwmon_chip_info sa67mcu_hwmon_chip_info = {
-	.ops = &sa67mcu_hwmon_ops,
-	.info = sa67mcu_hwmon_info,
-};
-
-static int sa67mcu_hwmon_probe(struct platform_device *pdev)
-{
-	struct sa67mcu_hwmon *hwmon;
-	struct device *hwmon_dev;
-	int ret;
-
-	if (!pdev->dev.parent)
-		return -ENODEV;
-
-	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
-	if (!hwmon)
-		return -ENOMEM;
-
-	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!hwmon->regmap)
-		return -ENODEV;
-
-	ret = device_property_read_u32(&pdev->dev, "reg", &hwmon->offset);
-	if (ret)
-		return -EINVAL;
-
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "sa67mcu_hwmon", hwmon,
-							 &sa67mcu_hwmon_chip_info,
-							 NULL);
-	if (IS_ERR(hwmon_dev))
-		dev_err(&pdev->dev, "failed to register as hwmon device");
-
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
-
-static const struct of_device_id sa67mcu_hwmon_of_match[] = {
-	{ .compatible = "kontron,sa67mcu-hwmon", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, sa67mcu_hwmon_of_match);
-
-static struct platform_driver sa67mcu_hwmon_driver = {
-	.probe = sa67mcu_hwmon_probe,
-	.driver = {
-		.name = "sa67mcu-hwmon",
-		.of_match_table = sa67mcu_hwmon_of_match,
-	},
-};
-module_platform_driver(sa67mcu_hwmon_driver);
-
-MODULE_DESCRIPTION("sa67mcu Hardware Monitoring Driver");
-MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
-MODULE_LICENSE("GPL");
-- 
2.47.3


