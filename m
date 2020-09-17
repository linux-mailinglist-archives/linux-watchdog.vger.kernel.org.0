Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078F126D620
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Sep 2020 10:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgIQINc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Sep 2020 04:13:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38814 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgIQIN1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Sep 2020 04:13:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id g4so1016367wrs.5
        for <linux-watchdog@vger.kernel.org>; Thu, 17 Sep 2020 01:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=toXwBkTb4ax6qvYa0IwMxQ6v0bcL7Gdok5RVoZ0x4vU=;
        b=H2StpvFJLL5BTkOJAdNPM/PqctRrNiXpuSss23unnV/R5BI2brUGFNfm/yl6MUgz59
         jeuIvNzvJxwtQAVTO0wGRi7hAQLSXZWW9DMMka5fl/+P14+C7KNu3l9hbgBc/fFPataK
         K6cnznOAb9MTgGQ4AUyFGU8nrRBzv+xzSRPjILfkp87O1SS6MkJ7A+ro95GZaI/QYR/t
         2qv8jq+u7FJOa0d4h2u2oxLQEXWck8YHkNa8Y8xVz2D3QuPodvf47GG7up7eaLR5E4WJ
         +h0oF6HMZw/DIhx+qc40d0cQzuzymcn9UOLYKWM/20pW3YpaxtBM0ZC+mhfsPWzQ6dNN
         mOdQ==
X-Gm-Message-State: AOAM532ooVFDAWqnQNW0QsgfbxfwfVrEmLJKvBEaO14xViSYbqIh0tmQ
        EcthcC9L7tfddKb8oN905uikBXRt/NgTYg==
X-Google-Smtp-Source: ABdhPJxVmhZ7tzIdFMham6OFeTbFNPmqug19t7pNDYJ0iGTkjh1RgMby+ZielRqbgZcwL5zk8n3pdA==
X-Received: by 2002:a2e:8e63:: with SMTP id t3mr8979352ljk.132.1600329820266;
        Thu, 17 Sep 2020 01:03:40 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id i5sm5461581lfe.8.2020.09.17.01.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:03:38 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:03:31 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v1 5/6] regulator: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <78baea1d7922506827ca717e277e4e6b391bbb78.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add initial support for ROHM BD9576MUF and BD9573MUF PMICs regulators.
These PMICs are mainly used to power the R-Car series processors.

The BD9576 includes some functional-safety features which are not
present on BD9573.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/Kconfig            |  10 +
 drivers/regulator/Makefile           |   1 +
 drivers/regulator/bd9576-regulator.c | 337 +++++++++++++++++++++++++++
 3 files changed, 348 insertions(+)
 create mode 100644 drivers/regulator/bd9576-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index de17ef7e18f0..49e698c042b8 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -231,6 +231,16 @@ config REGULATOR_BD9571MWV
 	  This driver can also be built as a module. If so, the module
 	  will be called bd9571mwv-regulator.
 
+config REGULATOR_BD957XMUF
+	tristate "ROHM BD9576MUF and BD9573MUF Regulators"
+	depends on MFD_ROHM_BD957XMUF
+	help
+	  This driver supports voltage regulators on ROHM BD9576MUF and
+	  BD9573MUF PMICs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called bd9576-regulator.
+
 config REGULATOR_CPCAP
 	tristate "Motorola CPCAP regulator"
 	depends on MFD_CPCAP
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index d8d3ecf526a8..92f50f12ca6d 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_REGULATOR_BD70528) += bd70528-regulator.o
 obj-$(CONFIG_REGULATOR_BD71828) += bd71828-regulator.o
 obj-$(CONFIG_REGULATOR_BD718XX) += bd718x7-regulator.o
 obj-$(CONFIG_REGULATOR_BD9571MWV) += bd9571mwv-regulator.o
+obj-$(CONFIG_REGULATOR_BD957XMUF) += bd9576-regulator.o
 obj-$(CONFIG_REGULATOR_DA903X)	+= da903x-regulator.o
 obj-$(CONFIG_REGULATOR_DA9052)	+= da9052-regulator.o
 obj-$(CONFIG_REGULATOR_DA9055)	+= da9055-regulator.o
diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
new file mode 100644
index 000000000000..4137fa9a73bb
--- /dev/null
+++ b/drivers/regulator/bd9576-regulator.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2020 ROHM Semiconductors
+// ROHM BD9576MUF/BD9573MUF regulator driver
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/rohm-bd957x.h>
+#include <linux/mfd/rohm-generic.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/slab.h>
+
+#define BD957X_VOUTS1_VOLT	3300000
+#define BD957X_VOUTS4_BASE_VOLT	1030000
+#define BD957X_VOUTS34_NUM_VOLT	32
+
+static int vout1_volt_table[] = {5000000, 4900000, 4800000, 4700000, 4600000,
+				 4500000, 4500000, 4500000, 5000000, 5100000,
+				 5200000, 5300000, 5400000, 5500000, 5500000,
+				 5500000};
+
+static int vout2_volt_table[] = {1800000, 1780000, 1760000, 1740000, 1720000,
+				 1700000, 1680000, 1660000, 1800000, 1820000,
+				 1840000, 1860000, 1880000, 1900000, 1920000,
+				 1940000};
+
+static int voutl1_volt_table[] = {2500000, 2540000, 2580000, 2620000, 2660000,
+				  2700000, 2740000, 2780000, 2500000, 2460000,
+				  2420000, 2380000, 2340000, 2300000, 2260000,
+				  2220000};
+
+struct bd957x_regulator_data {
+	struct regulator_desc desc;
+	int base_voltage;
+};
+
+static int bd957x_vout34_list_voltage(struct regulator_dev *rdev,
+				      unsigned int selector)
+{
+	const struct regulator_desc *desc = rdev->desc;
+	int multiplier = selector & desc->vsel_mask & 0x7f;
+	int tune;
+
+	/* VOUT3 and 4 has 10mV step */
+	tune = multiplier * 10000;
+
+	if (!(selector & 0x80))
+		return desc->fixed_uV - tune;
+
+	return desc->fixed_uV + tune;
+}
+
+static int bd957x_list_voltage(struct regulator_dev *rdev,
+			       unsigned int selector)
+{
+	const struct regulator_desc *desc = rdev->desc;
+	int index = selector & desc->vsel_mask & 0x7f;
+
+	if (!(selector & 0x80))
+		index += desc->n_voltages/2;
+
+	if (index >= desc->n_voltages)
+		return -EINVAL;
+
+	return desc->volt_table[index];
+}
+
+static const struct regulator_ops bd957x_vout34_ops = {
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = bd957x_vout34_list_voltage,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+};
+
+static const struct regulator_ops bd957X_vouts1_regulator_ops = {
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct regulator_ops bd957x_ops = {
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = bd957x_list_voltage,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+};
+
+static struct bd957x_regulator_data bd9576_regulators[] = {
+	{
+		.desc = {
+			.name = "VD50",
+			.of_match = of_match_ptr("regulator-vd50"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD957X_VD50,
+			.type = REGULATOR_VOLTAGE,
+			.ops = &bd957x_ops,
+			.volt_table = &vout1_volt_table[0],
+			.n_voltages = ARRAY_SIZE(vout1_volt_table),
+			.vsel_reg = BD957X_REG_VOUT1_TUNE,
+			.vsel_mask = BD957X_MASK_VOUT1_TUNE,
+			.enable_reg = BD957X_REG_POW_TRIGGER1,
+			.enable_mask = BD957X_REGULATOR_EN_MASK,
+			.enable_val = BD957X_REGULATOR_DIS_VAL,
+			.enable_is_inverted = true,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "VD18",
+			.of_match = of_match_ptr("regulator-vd18"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD957X_VD18,
+			.type = REGULATOR_VOLTAGE,
+			.ops = &bd957x_ops,
+			.volt_table = &vout2_volt_table[0],
+			.n_voltages = ARRAY_SIZE(vout2_volt_table),
+			.vsel_reg = BD957X_REG_VOUT2_TUNE,
+			.vsel_mask = BD957X_MASK_VOUT2_TUNE,
+			.enable_reg = BD957X_REG_POW_TRIGGER2,
+			.enable_mask = BD957X_REGULATOR_EN_MASK,
+			.enable_val = BD957X_REGULATOR_DIS_VAL,
+			.enable_is_inverted = true,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "VDDDR",
+			.of_match = of_match_ptr("regulator-vdddr"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD957X_VDDDR,
+			.ops = &bd957x_vout34_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = BD957X_VOUTS34_NUM_VOLT,
+			.vsel_reg = BD957X_REG_VOUT3_TUNE,
+			.vsel_mask = BD957X_MASK_VOUT3_TUNE,
+			.enable_reg = BD957X_REG_POW_TRIGGER3,
+			.enable_mask = BD957X_REGULATOR_EN_MASK,
+			.enable_val = BD957X_REGULATOR_DIS_VAL,
+			.enable_is_inverted = true,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "VD10",
+			.of_match = of_match_ptr("regulator-vd10"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD957X_VD10,
+			.ops = &bd957x_vout34_ops,
+			.type = REGULATOR_VOLTAGE,
+			.fixed_uV = BD957X_VOUTS4_BASE_VOLT,
+			.n_voltages = BD957X_VOUTS34_NUM_VOLT,
+			.vsel_reg = BD957X_REG_VOUT4_TUNE,
+			.vsel_mask = BD957X_MASK_VOUT4_TUNE,
+			.enable_reg = BD957X_REG_POW_TRIGGER4,
+			.enable_mask = BD957X_REGULATOR_EN_MASK,
+			.enable_val = BD957X_REGULATOR_DIS_VAL,
+			.enable_is_inverted = true,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "VOUTL1",
+			.of_match = of_match_ptr("regulator-voutl1"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD957X_VOUTL1,
+			.ops = &bd957x_ops,
+			.type = REGULATOR_VOLTAGE,
+			.volt_table = &voutl1_volt_table[0],
+			.n_voltages = ARRAY_SIZE(voutl1_volt_table),
+			.vsel_reg = BD957X_REG_VOUTL1_TUNE,
+			.vsel_mask = BD957X_MASK_VOUTL1_TUNE,
+			.enable_reg = BD957X_REG_POW_TRIGGERL1,
+			.enable_mask = BD957X_REGULATOR_EN_MASK,
+			.enable_val = BD957X_REGULATOR_DIS_VAL,
+			.enable_is_inverted = true,
+			.owner = THIS_MODULE,
+		},
+	},
+	{
+		.desc = {
+			.name = "VOUTS1",
+			.of_match = of_match_ptr("regulator-vouts1"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD957X_VOUTS1,
+			.ops = &bd957X_vouts1_regulator_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = 1,
+			.fixed_uV = BD957X_VOUTS1_VOLT,
+			.enable_reg = BD957X_REG_POW_TRIGGERS1,
+			.enable_mask = BD957X_REGULATOR_EN_MASK,
+			.enable_val = BD957X_REGULATOR_DIS_VAL,
+			.enable_is_inverted = true,
+			.owner = THIS_MODULE,
+		},
+	},
+};
+
+static int bd957x_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct regulator_config config = { 0 };
+	int i, err;
+	bool vout_mode, ddr_sel;
+	const struct bd957x_regulator_data *reg_data = &bd9576_regulators[0];
+	unsigned int num_reg_data = ARRAY_SIZE(bd9576_regulators);
+	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		dev_err(&pdev->dev, "No regmap\n");
+		return -EINVAL;
+	}
+	vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
+					 "rohm,vout1-en-low");
+	if (vout_mode) {
+		struct gpio_desc *en;
+
+		dev_dbg(&pdev->dev, "GPIO controlled mode\n");
+
+		/* VOUT1 enable state judged by VOUT1_EN pin */
+		/* See if we have GPIO defined */
+		en = devm_gpiod_get_from_of_node(&pdev->dev,
+						 pdev->dev.parent->of_node,
+						 "rohm,vout1-en-gpios", 0,
+						 GPIOD_OUT_LOW, "vout1-en");
+		if (!IS_ERR(en)) {
+			/* VOUT1_OPS gpio ctrl */
+			/*
+			 * Regulator core prioritizes the ena_gpio over
+			 * enable/disable/is_enabled callbacks so no need to
+			 * clear them. We can still use same ops
+			 */
+			config.ena_gpiod = en;
+		} else {
+			/*
+			 * In theory it is possible someone wants to set
+			 * vout1-en LOW during OTP loading and set VOUT1 to be
+			 * controlled by GPIO - but control the GPIO from some
+			 * where else than this driver. For that to work we
+			 * should unset the is_enabled callback here.
+			 *
+			 * I believe such case where rohm,vout1-en-low is set
+			 * and vout1-en-gpios is not is likely to be a
+			 * misconfiguration. So let's just err out for now.
+			 */
+			dev_err(&pdev->dev,
+				"Failed to get VOUT1 control GPIO\n");
+			return PTR_ERR(en);
+		}
+	}
+
+	/*
+	 * If more than one PMIC needs to be controlled by same processor then
+	 * allocate the regulator data array here and use bd9576_regulators as
+	 * template. At the moment I see no such use-case so I spare some
+	 * bytes and use bd9576_regulators directly for non-constant configs
+	 * like DDR voltage selection.
+	 */
+	ddr_sel =  of_property_read_bool(pdev->dev.parent->of_node,
+					 "rohm,ddr-sel-low");
+	if (ddr_sel)
+		bd9576_regulators[2].desc.fixed_uV = 1350000;
+	else
+		bd9576_regulators[2].desc.fixed_uV = 1500000;
+
+	switch (chip) {
+	case ROHM_CHIP_TYPE_BD9576:
+		dev_dbg(&pdev->dev, "Found BD9576MUF\n");
+		break;
+	case ROHM_CHIP_TYPE_BD9573:
+		pr_info(&pdev->dev, "Found BD9573MUF\n");
+		break;
+	default:
+		dev_err(&pdev->dev, "Unsupported chip type\n");
+		err = -EINVAL;
+		goto err;
+	}
+
+	config.dev = pdev->dev.parent;
+	config.regmap = regmap;
+
+	for (i = 0; i < num_reg_data; i++) {
+
+		const struct regulator_desc *desc;
+		struct regulator_dev *rdev;
+		const struct bd957x_regulator_data *r;
+
+		r = &reg_data[i];
+		desc = &r->desc;
+
+		rdev = devm_regulator_register(&pdev->dev, desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev,
+				"failed to register %s regulator\n",
+				desc->name);
+			err = PTR_ERR(rdev);
+			goto err;
+		}
+		/*
+		 * Clear the VOUT1 GPIO setting - rest of the regulators do not
+		 * support GPIO control
+		 */
+		config.ena_gpiod = NULL;
+	}
+
+err:
+	return err;
+}
+
+static const struct platform_device_id bd957x_pmic_id[] = {
+	{ "bd9573-pmic", ROHM_CHIP_TYPE_BD9573 },
+	{ "bd9576-pmic", ROHM_CHIP_TYPE_BD9576 },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, bd957x_pmic_id);
+
+static struct platform_driver bd957x_regulator = {
+	.driver = {
+		.name = "bd957x-pmic",
+	},
+	.probe = bd957x_probe,
+	.id_table = bd957x_pmic_id,
+};
+
+module_platform_driver(bd957x_regulator);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("ROHM BD9576/BD9573 voltage regulator driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:bd957x-pmic");
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
