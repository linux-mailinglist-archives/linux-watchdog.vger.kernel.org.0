Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE0626D631
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Sep 2020 10:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIQIOf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Sep 2020 04:14:35 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39300 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgIQIOd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Sep 2020 04:14:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id u21so1227283ljl.6
        for <linux-watchdog@vger.kernel.org>; Thu, 17 Sep 2020 01:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WRZ0Y7kIrCTDSzpuefNW9GDk2H3+Emq6/atHIbpRWMQ=;
        b=X6Jj67UKo4d5ApseDOJlA4Rm7piTGauKWeLo9jK5GnmYY1JxlVRIL2+k/l7mBfeoH1
         rwV72BEAlzsNkteoV3ryemB+hem63nG+ls/Wh4FXl+Dy7v1my+b6wc0IUvLulVsLLRVH
         zbLT6UNG34PqFyzYroc8LGp/UVpOVytckuYuX8fHvGCCBk7QzuQPTBMgS2JYYmh9Qt8B
         NoVYgYei/W5tsV+pqgcjBlK09f2uMsSbR8y/WdjdMeXymyteGYi9kt6wkuoFPTPBu+im
         +NRpCqHm29aOVZwdK5SrrBHCZBfxV8jfBK3/05d1ycMA6VYkUxelLhLI4hJqSWYDdNlx
         qFmA==
X-Gm-Message-State: AOAM532E2SDKiYUIWZjELnuFL4OAKPj634zNgNL+2ulqU252uZN7xFrx
        TZd+z3wV1HiHFCGmxp2A5QmnFAeeiNg8MA==
X-Google-Smtp-Source: ABdhPJzQboJnZEA2rsnxPLchMStCyosRTQnS0T59Ju+c6aUAIy92pIXcPlNb+iP9EWgeupxOdWsy2Q==
X-Received: by 2002:ac2:568e:: with SMTP id 14mr8898140lfr.156.1600329774357;
        Thu, 17 Sep 2020 01:02:54 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id f12sm5413693lfp.69.2020.09.17.01.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:02:51 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:02:44 +0300
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
Subject: [PATCH v1 3/6] mfd: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <f07067ace54379979cb5b96b1ce1216ac756d35b.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
mainly used to power the R-Car series processors.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/mfd/Kconfig              |  11 +++
 drivers/mfd/Makefile             |   1 +
 drivers/mfd/rohm-bd9576.c        | 130 +++++++++++++++++++++++++++++++
 include/linux/mfd/rohm-bd957x.h  |  61 +++++++++++++++
 include/linux/mfd/rohm-generic.h |   2 +
 5 files changed, 205 insertions(+)
 create mode 100644 drivers/mfd/rohm-bd9576.c
 create mode 100644 include/linux/mfd/rohm-bd957x.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df0837ab41..e8275526818a 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1975,6 +1975,17 @@ config MFD_ROHM_BD71828
 	  Also included is a Coulomb counter, a real-time clock (RTC), and
 	  a 32.768 kHz clock gate.
 
+config MFD_ROHM_BD957XMUF
+	tristate "ROHM BD9576MUF and BD9573MUF Power Management ICs"
+	depends on I2C=y
+	depends on OF
+	select REGMAP_I2C
+	select MFD_CORE
+	help
+	  Select this option to get support for the ROHM BD9576MUF and
+	  BD9573MUF Power Management ICs. BD9576 and BD9573 are primarily
+	  designed to be used to power R-Car series processors.
+
 config MFD_STM32_LPTIMER
 	tristate "Support for STM32 Low-Power Timer"
 	depends on (ARCH_STM32 && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a60e5f835283..6ad33ccb35f0 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -260,6 +260,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
 obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
 obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
 obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
+obj-$(CONFIG_MFD_ROHM_BD957XMUF)	+= rohm-bd9576.o
 obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
 obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
 
diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
new file mode 100644
index 000000000000..a23ded510209
--- /dev/null
+++ b/drivers/mfd/rohm-bd9576.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Copyright (C) 2020 ROHM Semiconductors
+//
+// ROHM BD9576MUF and BD9573MUF PMIC driver
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/rohm-bd957x.h>
+#include <linux/mfd/rohm-generic.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+static struct mfd_cell bd9573_mfd_cells[] = {
+	{ .name = "bd9573-pmic", },
+	{ .name = "bd9576-wdt", },
+};
+
+
+static struct mfd_cell bd9576_mfd_cells[] = {
+	{ .name = "bd9576-pmic", },
+	{ .name = "bd9576-wdt", },
+};
+
+static const struct regmap_range volatile_ranges[] = {
+	{
+		.range_min = BD957X_REG_SMRB_ASSERT,
+		.range_max = BD957X_REG_SMRB_ASSERT,
+	},
+	{
+		.range_min = BD957X_REG_PMIC_INTERNAL_STAT,
+		.range_max = BD957X_REG_PMIC_INTERNAL_STAT,
+	},
+	{
+		.range_min = BD957X_REG_INT_THERM_STAT,
+		.range_max = BD957X_REG_INT_THERM_STAT,
+	},
+	{
+		.range_min = BD957X_REG_INT_OVP_STAT,
+		.range_max = BD957X_REG_INT_SYS_STAT,
+	}, {
+		.range_min = BD957X_REG_INT_MAIN_STAT,
+		.range_max = BD957X_REG_INT_MAIN_STAT,
+	},
+};
+
+static const struct regmap_access_table volatile_regs = {
+	.yes_ranges = &volatile_ranges[0],
+	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
+};
+
+static struct regmap_config bd957x_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_table = &volatile_regs,
+	.max_register = BD957X_MAX_REGISTER,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int bd957x_i2c_probe(struct i2c_client *i2c,
+			     const struct i2c_device_id *id)
+{
+	int ret;
+	struct regmap *regmap;
+	struct mfd_cell *mfd;
+	int cells;
+	unsigned int chip_type;
+
+	chip_type = (unsigned int)(uintptr_t)
+		    of_device_get_match_data(&i2c->dev);
+
+	switch (chip_type) {
+	case ROHM_CHIP_TYPE_BD9576:
+		mfd = bd9576_mfd_cells;
+		cells = ARRAY_SIZE(bd9576_mfd_cells);
+		break;
+	case ROHM_CHIP_TYPE_BD9573:
+		mfd = bd9573_mfd_cells;
+		cells = ARRAY_SIZE(bd9573_mfd_cells);
+		break;
+	default:
+		dev_err(&i2c->dev, "Unknown device type");
+		return -EINVAL;
+	}
+
+	regmap = devm_regmap_init_i2c(i2c, &bd957x_regmap);
+	if (IS_ERR(regmap)) {
+		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
+		return PTR_ERR(regmap);
+	}
+
+	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, mfd, cells,
+				   NULL, 0, NULL);
+	if (ret)
+		dev_err(&i2c->dev, "Failed to create subdevices\n");
+
+	return ret;
+}
+
+static const struct of_device_id bd957x_of_match[] = {
+	{
+		.compatible = "rohm,bd9576",
+		.data = (void *)ROHM_CHIP_TYPE_BD9576,
+	},
+	{
+		.compatible = "rohm,bd9573",
+		.data = (void *)ROHM_CHIP_TYPE_BD9573,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, bd957x_of_match);
+
+static struct i2c_driver bd957x_drv = {
+	.driver = {
+		.name = "rohm-bd957x",
+		.of_match_table = bd957x_of_match,
+	},
+	.probe = &bd957x_i2c_probe,
+};
+
+module_i2c_driver(bd957x_drv);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("ROHM BD9576MUF and BD9573MUF Power Management IC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rohm-bd957x.h b/include/linux/mfd/rohm-bd957x.h
new file mode 100644
index 000000000000..4432e29d13e4
--- /dev/null
+++ b/include/linux/mfd/rohm-bd957x.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2020 ROHM Semiconductors */
+
+#ifndef __LINUX_MFD_BD957X_H__
+#define __LINUX_MFD_BD957X_H__
+
+enum {
+	BD957X_VD50,
+	BD957X_VD18,
+	BD957X_VDDDR,
+	BD957X_VD10,
+	BD957X_VOUTL1,
+	BD957X_VOUTS1,
+};
+
+#define BD957X_REG_SMRB_ASSERT		0x15
+#define BD957X_REG_PMIC_INTERNAL_STAT	0x20
+#define BD957X_REG_INT_THERM_STAT	0x23
+#define BD957X_REG_INT_THERM_MASK 0x24
+#define BD957X_REG_INT_OVP_STAT 0x25
+#define BD957X_REG_INT_SCP_STAT 0x26
+#define BD957X_REG_INT_OCP_STAT 0x27
+#define BD957X_REG_INT_OVD_STAT 0x28
+#define BD957X_REG_INT_UVD_STAT 0x29
+#define BD957X_REG_INT_UVP_STAT 0x2a
+#define BD957X_REG_INT_SYS_STAT 0x2b
+#define BD957X_REG_INT_SYS_MASK 0x2c
+#define BD957X_REG_INT_MAIN_STAT 0x30
+#define BD957X_REG_INT_MAIN_MASK 0x31
+
+#define BD957X_REG_WDT_CONF 0x16
+
+#define BD957X_REG_POW_TRIGGER1 0x41
+#define BD957X_REG_POW_TRIGGER2 0x42
+#define BD957X_REG_POW_TRIGGER3 0x43
+#define BD957X_REG_POW_TRIGGER4 0x44
+#define BD957X_REG_POW_TRIGGERL1 0x45
+#define BD957X_REG_POW_TRIGGERS1 0x46
+
+#define BD957X_REGULATOR_EN_MASK 0xff
+#define BD957X_REGULATOR_DIS_VAL 0xff
+
+
+#define BD957X_VSEL_REG_MASK	0xff
+
+#define BD957X_MASK_VOUT1_TUNE	0x87
+#define BD957X_MASK_VOUT2_TUNE	0x87
+#define BD957X_MASK_VOUT3_TUNE	0x1f
+#define BD957X_MASK_VOUT4_TUNE	0x1f
+#define BD957X_MASK_VOUTL1_TUNE	0x87
+
+#define BD957X_REG_VOUT1_TUNE	0x50
+#define BD957X_REG_VOUT2_TUNE	0x53
+#define BD957X_REG_VOUT3_TUNE	0x56
+#define BD957X_REG_VOUT4_TUNE	0x59
+#define BD957X_REG_VOUTL1_TUNE	0x5c
+
+#define BD957X_MAX_REGISTER 0x61
+
+
+#endif
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 4283b5b33e04..58b4f1a0f4af 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -12,6 +12,8 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
 	ROHM_CHIP_TYPE_BD71828,
+	ROHM_CHIP_TYPE_BD9576,
+	ROHM_CHIP_TYPE_BD9573,
 	ROHM_CHIP_TYPE_AMOUNT
 };
 
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
