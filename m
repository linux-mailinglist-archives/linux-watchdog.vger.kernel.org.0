Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F831EED03
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Jun 2020 23:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgFDVLz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Jun 2020 17:11:55 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:33465 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgFDVLY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Jun 2020 17:11:24 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B103C22FB6;
        Thu,  4 Jun 2020 23:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1591305081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4mFIR/qp6p8Dd1lUX1n/XWTqcwQsfsjN4TlvVRpq1HE=;
        b=Z0wmyxONUYO0KLMCfFopTsxChxsOGhiODLQxE13ngSLnBnApbvNRjhqphSTr21G/Ca4eXf
        FhQ05QpDTmpMkNstY5s8tIWLtrqNV9m5GLeug7nRqAu8qH+Nu1z/iGYwgbunxjf/qby50e
        JBl2cZjy4d6apOr6UdGng53WM86jOD4=
From:   Michael Walle <michael@walle.cc>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v4 05/11] pwm: add support for sl28cpld PWM controller
Date:   Thu,  4 Jun 2020 23:10:33 +0200
Message-Id: <20200604211039.12689-6-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604211039.12689-1-michael@walle.cc>
References: <20200604211039.12689-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add support for the PWM controller of the sl28cpld board management
controller. This is part of a multi-function device driver.

The controller has one PWM channel and can just generate four distinct
frequencies.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/pwm/Kconfig        |  10 ++
 drivers/pwm/Makefile       |   1 +
 drivers/pwm/pwm-sl28cpld.c | 201 +++++++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/pwm/pwm-sl28cpld.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index cb8d739067d2..a39371c11ff6 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -437,6 +437,16 @@ config PWM_SIFIVE
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sifive.
 
+config PWM_SL28CPLD
+	tristate "Kontron sl28 PWM support"
+	depends on MFD_SL28CPLD
+	help
+	  Generic PWM framework driver for board management controller
+	  found on the Kontron sl28 CPLD.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-sl28cpld.
+
 config PWM_SPEAR
 	tristate "STMicroelectronics SPEAr PWM support"
 	depends on PLAT_SPEAR || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index a59c710e98c7..c479623724e8 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
 obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
+obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
 obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
 obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
 obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
diff --git a/drivers/pwm/pwm-sl28cpld.c b/drivers/pwm/pwm-sl28cpld.c
new file mode 100644
index 000000000000..d82303f509f5
--- /dev/null
+++ b/drivers/pwm/pwm-sl28cpld.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * sl28cpld PWM driver.
+ *
+ * Copyright 2019 Kontron Europe GmbH
+ */
+
+#include <linux/bitfield.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+/*
+ * PWM timer block registers.
+ */
+#define PWM_CTRL		0x00
+#define   PWM_ENABLE		BIT(7)
+#define   PWM_MODE_250HZ	0
+#define   PWM_MODE_500HZ	1
+#define   PWM_MODE_1KHZ		2
+#define   PWM_MODE_2KHZ		3
+#define   PWM_MODE_MASK		GENMASK(1, 0)
+#define PWM_CYCLE		0x01
+#define   PWM_CYCLE_MAX		0x7f
+
+struct sl28cpld_pwm {
+	struct pwm_chip pwm_chip;
+	struct regmap *regmap;
+	u32 offset;
+};
+
+struct sl28cpld_pwm_periods {
+	u8 ctrl;
+	unsigned long duty_cycle;
+};
+
+struct sl28cpld_pwm_config {
+	unsigned long period_ns;
+	u8 max_duty_cycle;
+};
+
+static struct sl28cpld_pwm_config sl28cpld_pwm_config[] = {
+	[PWM_MODE_250HZ] = { .period_ns = 4000000, .max_duty_cycle = 0x80 },
+	[PWM_MODE_500HZ] = { .period_ns = 2000000, .max_duty_cycle = 0x40 },
+	[PWM_MODE_1KHZ] = { .period_ns = 1000000, .max_duty_cycle = 0x20 },
+	[PWM_MODE_2KHZ] = { .period_ns =  500000, .max_duty_cycle = 0x10 },
+};
+
+static inline struct sl28cpld_pwm *to_sl28cpld_pwm(struct pwm_chip *chip)
+{
+	return container_of(chip, struct sl28cpld_pwm, pwm_chip);
+}
+
+static void sl28cpld_pwm_get_state(struct pwm_chip *chip,
+				   struct pwm_device *pwm,
+				   struct pwm_state *state)
+{
+	struct sl28cpld_pwm *spc = to_sl28cpld_pwm(chip);
+	static struct sl28cpld_pwm_config *config;
+	unsigned int reg;
+	unsigned long cycle;
+	unsigned int mode;
+
+	regmap_read(spc->regmap, spc->offset + PWM_CTRL, &reg);
+
+	state->enabled = reg & PWM_ENABLE;
+
+	mode = FIELD_GET(PWM_MODE_MASK, reg);
+	config = &sl28cpld_pwm_config[mode];
+	state->period = config->period_ns;
+
+	regmap_read(spc->regmap, spc->offset + PWM_CYCLE, &reg);
+	cycle = reg * config->period_ns;
+	state->duty_cycle = DIV_ROUND_CLOSEST_ULL(cycle,
+						  config->max_duty_cycle);
+}
+
+static int sl28cpld_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			      const struct pwm_state *state)
+{
+	struct sl28cpld_pwm *spc = to_sl28cpld_pwm(chip);
+	struct sl28cpld_pwm_config *config;
+	unsigned long long cycle;
+	int ret;
+	int mode;
+	u8 ctrl;
+
+	/* update config, first search best matching period */
+	for (mode = 0; mode < ARRAY_SIZE(sl28cpld_pwm_config); mode++) {
+		config = &sl28cpld_pwm_config[mode];
+		if (state->period == config->period_ns)
+			break;
+	}
+
+	if (mode == ARRAY_SIZE(sl28cpld_pwm_config))
+		return -EINVAL;
+
+	ctrl = FIELD_PREP(PWM_MODE_MASK, mode);
+	if (state->enabled)
+		ctrl |= PWM_ENABLE;
+
+	cycle = state->duty_cycle * config->max_duty_cycle;
+	do_div(cycle, state->period);
+
+	/*
+	 * The hardware doesn't allow to set max_duty_cycle if the
+	 * 250Hz mode is enabled. But since this is "all-high" output
+	 * just use the 500Hz mode with the duty cycle to max value.
+	 */
+	if (cycle == config->max_duty_cycle) {
+		ctrl &= ~PWM_MODE_MASK;
+		ctrl |= FIELD_PREP(PWM_MODE_MASK, PWM_MODE_500HZ);
+		cycle = PWM_CYCLE_MAX;
+	}
+
+	ret = regmap_write(spc->regmap, spc->offset + PWM_CTRL, ctrl);
+	if (ret)
+		return ret;
+
+	return regmap_write(spc->regmap, spc->offset + PWM_CYCLE, (u8)cycle);
+}
+
+static const struct pwm_ops sl28cpld_pwm_ops = {
+	.apply = sl28cpld_pwm_apply,
+	.get_state = sl28cpld_pwm_get_state,
+	.owner = THIS_MODULE,
+};
+
+static int sl28cpld_pwm_probe(struct platform_device *pdev)
+{
+	struct sl28cpld_pwm *pwm;
+	struct pwm_chip *chip;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	pwm = devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm)
+		return -ENOMEM;
+
+	pwm->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!pwm->regmap)
+		return -ENODEV;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &pwm->offset);
+	if (ret)
+		return -EINVAL;
+
+	/* initialize struct pwm_chip */
+	chip = &pwm->pwm_chip;
+	chip->dev = &pdev->dev;
+	chip->ops = &sl28cpld_pwm_ops;
+	chip->base = -1;
+	chip->npwm = 1;
+
+	ret = pwmchip_add(&pwm->pwm_chip);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, pwm);
+
+	return 0;
+}
+
+static int sl28cpld_pwm_remove(struct platform_device *pdev)
+{
+	struct sl28cpld_pwm *pwm = platform_get_drvdata(pdev);
+
+	return pwmchip_remove(&pwm->pwm_chip);
+}
+
+static const struct of_device_id sl28cpld_pwm_of_match[] = {
+	{ .compatible = "kontron,sl28cpld-pwm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sl28cpld_pwm_of_match);
+
+static const struct platform_device_id sl28cpld_pwm_id_table[] = {
+	{"sl28cpld-pwm"},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, sl28cpld_pwm_id_table);
+
+static struct platform_driver sl28cpld_pwm_driver = {
+	.probe = sl28cpld_pwm_probe,
+	.remove	= sl28cpld_pwm_remove,
+	.id_table = sl28cpld_pwm_id_table,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = sl28cpld_pwm_of_match,
+	},
+};
+module_platform_driver(sl28cpld_pwm_driver);
+
+MODULE_DESCRIPTION("sl28cpld PWM Driver");
+MODULE_AUTHOR("Michael Walle <michael@walle.cc>");
+MODULE_LICENSE("GPL");
-- 
2.20.1

