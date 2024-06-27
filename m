Return-Path: <linux-watchdog+bounces-1196-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79A91A0AF
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 09:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C299C1C21412
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 07:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DC26D1B9;
	Thu, 27 Jun 2024 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOVrz/IA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E96D1C1;
	Thu, 27 Jun 2024 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474230; cv=none; b=DOX28PkU2h48KD4XdM/DYmbyvyvkGVr4dJUBMFhi3mUDeU87Y7py9DPcyANTeoKc4dITl1S1SHjNa3FneHeMTm7WG7Wirud9sxMF4KMVJOE1Cim2q3W411kaU9en0yoDn4sh3z35cFuHX2STF25agp8rX4zyroN37fyXBLDp5/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474230; c=relaxed/simple;
	bh=Txg11idvk4edpmbv/vtn9BlOcN62jy107xH7mN+N8Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaUtfk6je10eynNElFTbiR0pecurFONIecFPzoIUyNsU1wEYQfIWs2tH37gM4R0UNq+tyy+qLxUbuMy8u9bqX6GdR0qAs4FUE6ZFK/KD7OenB3U/pGlW0IIuQPZdRuYlHn4uR35Y7M1iImLzE23I67//nugeqCsZa9cHXKiW56s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOVrz/IA; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso49385341fa.0;
        Thu, 27 Jun 2024 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474226; x=1720079026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rB6vY8gB5+tJTRNIDKB2fLjALvBtxJUSBj3dFPCCZPw=;
        b=ZOVrz/IA0vZnfEo5YYFvN1vTJxBFmmKcZD2/ChxoOLWZxAeXXTaXRxiK2AHfPd1oTk
         BVKbRvVGP2HgVebqwM2dKpzQFwCWwcxaUQTaO6D1rIjpjF+u4Dcg6RoqxSysuJcq+NE5
         8h8LqBHMTNjPi0q9/IygO0xeRB2QyxtQIwa1aXLPIXWXvKQ/y5orXPP2uX1A1X4Xdk/h
         6abtWi76eqkG6qL2Gd7BDox0cnGXV9h5/OOvQMj4jDI1o1NvacFwpW35kTSTOh1g5p5K
         km3ZQh3+gdM1sjQKovI0vapjHcR/CGXfHSC7rOT9cPpwwp7Ay6E0EhqxSZMFAKhhDDz8
         V2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474226; x=1720079026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rB6vY8gB5+tJTRNIDKB2fLjALvBtxJUSBj3dFPCCZPw=;
        b=B8W1uThG61Rdndc8mS/8zYqnZtkhTpaCws9oLJi/Ba7FU2+T4JO3sXSNOBr/yVd8sR
         3U6SO2TvvaEnjLe9rEjHCIUb1uEurzolzN/6+TxFPwJEA02nBQ+QKhuFmVYP22IISzXu
         /mOYBEiVGG6mfYbkQ2LMzZyj0xuAam/1SDG2U0HoLuvrls7BqffZCj060L5nTJCBgxR7
         w15qc0OTV2LYw2sk+ZV8ZjThPozjhTbDNBbkWHtpxUaGbVgyChbAXXWYsQ2wzPGMxmCV
         aiNrhj1z06GDNNSo8YlheBI6dWdu71sh47Mj0Chlf3XS/3tS3ucfan8MmCuJxfT/EzLr
         v6lw==
X-Forwarded-Encrypted: i=1; AJvYcCW7DKKq+dQqVASkDwi6KTycOTH634S1eJyN9GI99bVGjdDrsRbkc7N43i9B/lLQQv03Z8oOn0HJwzW3NLaQfAMc/6EL+qKutVa8Wv4WzM6/OubUl8QJguZMvAPwB7/EjHikWUTwHcO/pcFfm8xc5A/JQM7lrqK6mOAHrQATg7Z82q0rME2oV7e4
X-Gm-Message-State: AOJu0Yzk8guNL8D694yJhqN02B4KB48pFeOWoovQ7rye9slo56rRLDGk
	Qq8fgXu6+JRINEsWnOq00/wcSGd8aPJJaflDORr0gqxP/FBxJ4v8
X-Google-Smtp-Source: AGHT+IGWit/o49xyRJlxXXQmRY22TpO8r5FaPJSEEeksF0OG674nJRUQQH0fsa358COAQh5I8pGOtA==
X-Received: by 2002:a05:651c:1991:b0:2ec:5bb2:c236 with SMTP id 38308e7fff4ca-2ec5bb2c276mr99658371fa.33.1719474225324;
        Thu, 27 Jun 2024 00:43:45 -0700 (PDT)
Received: from fedora ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a4a8eedsm1467031fa.100.2024.06.27.00.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:43:44 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:43:40 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v5 4/6] regulator: bd96801: ROHM BD96801 PMIC regulators
Message-ID: <50cf02b046df218a21a0f9c4820531d821fc20d4.1719473802.git.mazziesaccount@gmail.com>
References: <cover.1719473802.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GaLALLvK3s42iRZT"
Content-Disposition: inline
In-Reply-To: <cover.1719473802.git.mazziesaccount@gmail.com>


--GaLALLvK3s42iRZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96801 "Scalable PMIC" is an automotive grade PMIC which can
scale to different applications by allowing chaining of PMICs. The PMIC
also supports various protection features which can be configured either
to fire IRQs - or to shut down power outputs when failure is detected.

The driver implements basic voltage control and sending error
notifications.

NOTE:
The driver does not support doing configuration which require the PMIC
to be in STBY state. The omitted feature set includes setting safety
limit values, changing LDO voltages and controlling enable state for
some regulators.
Also, the ERRB IRQ is not handled.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Mark Brown <broonie@kernel.org>

---
Revision history:
v4 =3D> v5:
 - drop unintended Makefile change

v3 =3D> v4:
 - changed device ID to bd96801-regulator as was requested by Lee during
   the MFD driver review.

v2 =3D> v3:
 - no changes

v1 =3D> v2:
 - regulator: bd96801: lowercase DT node names
 - split intb registration to own function

RFCv2 =3D> v1:
 - Drop STBY mode configurations
 - Drop ERRB IRQs
 - drop PMIC register unlock (moved to MFD to prevent races)

RFCv1 =3D> RFCv2:
- Use devm_kcalloc() instead of devm_kzalloc() where appropriate
- Use devm_kmemdup()
- Add MODULE_DEVICE_TABLE
- drop MODULE_ALIAS
---
 drivers/regulator/Kconfig             |  12 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/bd96801-regulator.c | 908 ++++++++++++++++++++++++++
 3 files changed, 921 insertions(+)
 create mode 100644 drivers/regulator/bd96801-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d333be2bea3b..88b8c1a23bcf 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -268,6 +268,18 @@ config REGULATOR_BD957XMUF
 	  This driver can also be built as a module. If so, the module
 	  will be called bd9576-regulator.
=20
+config REGULATOR_BD96801
+	tristate "ROHM BD96801 Power Regulator"
+	depends on MFD_ROHM_BD96801
+	select REGULATOR_ROHM
+	help
+	  This driver supports voltage regulators on ROHM BD96801 PMIC.
+	  This will enable support for the software controllable buck
+	  and LDO regulators.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called bd96801-regulator.
+
 config REGULATOR_CPCAP
 	tristate "Motorola CPCAP regulator"
 	depends on MFD_CPCAP
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index ba15fa5f30ad..9f36331df771 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_REGULATOR_BD718XX) +=3D bd718x7-regulator.o
 obj-$(CONFIG_REGULATOR_BD9571MWV) +=3D bd9571mwv-regulator.o
 obj-$(CONFIG_REGULATOR_BD957XMUF) +=3D bd9576-regulator.o
 obj-$(CONFIG_REGULATOR_DA903X)	+=3D da903x-regulator.o
+obj-$(CONFIG_REGULATOR_BD96801) +=3D bd96801-regulator.o
 obj-$(CONFIG_REGULATOR_DA9052)	+=3D da9052-regulator.o
 obj-$(CONFIG_REGULATOR_DA9055)	+=3D da9055-regulator.o
 obj-$(CONFIG_REGULATOR_DA9062)	+=3D da9062-regulator.o
diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96=
801-regulator.c
new file mode 100644
index 000000000000..46ca81f18703
--- /dev/null
+++ b/drivers/regulator/bd96801-regulator.c
@@ -0,0 +1,908 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2024 ROHM Semiconductors
+// bd96801-regulator.c ROHM BD96801 regulator driver
+
+/*
+ * This version of the "BD86801 scalable PMIC"'s driver supports only very
+ * basic set of the PMIC features. Most notably, there is no support for
+ * the ERRB interrupt and the configurations which should be done when the
+ * PMIC is in STBY mode.
+ *
+ * Supporting the ERRB interrupt would require dropping the regmap-IRQ
+ * usage or working around (or accepting a presense of) a naming conflict
+ * in debugFS IRQs.
+ *
+ * Being able to reliably do the configurations like changing the
+ * regulator safety limits (like limits for the over/under -voltages, over
+ * current, thermal protection) would require the configuring driver to be
+ * synchronized with entity causing the PMIC state transitions. Eg, one
+ * should be able to ensure the PMIC is in STBY state when the
+ * configurations are applied to the hardware. How and when the PMIC state
+ * transitions are to be done is likely to be very system specific, as will
+ * be the need to configure these safety limits. Hence it's not simple to
+ * come up with a generic solution.
+ *
+ * Users who require the ERRB handling and STBY state configurations can
+ * have a look at the original RFC:
+ * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.c=
om/
+ * which implements a workaround to debugFS naming conflict and some of
+ * the safety limit configurations - but leaves the state change handling
+ * and synchronization to be implemented.
+ *
+ * It would be great to hear (and receive a patch!) if you implement the
+ * STBY configuration support or a proper fix to the debugFS naming
+ * conflict in your downstream driver ;)
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/linear_range.h>
+#include <linux/mfd/rohm-generic.h>
+#include <linux/mfd/rohm-bd96801.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/coupler.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+
+enum {
+	BD96801_BUCK1,
+	BD96801_BUCK2,
+	BD96801_BUCK3,
+	BD96801_BUCK4,
+	BD96801_LDO5,
+	BD96801_LDO6,
+	BD96801_LDO7,
+	BD96801_REGULATOR_AMOUNT,
+};
+
+enum {
+	BD96801_PROT_OVP,
+	BD96801_PROT_UVP,
+	BD96801_PROT_OCP,
+	BD96801_PROT_TEMP,
+	BD96801_NUM_PROT,
+};
+
+#define BD96801_ALWAYS_ON_REG		0x3c
+#define BD96801_REG_ENABLE		0x0b
+#define BD96801_BUCK1_EN_MASK		BIT(0)
+#define BD96801_BUCK2_EN_MASK		BIT(1)
+#define BD96801_BUCK3_EN_MASK		BIT(2)
+#define BD96801_BUCK4_EN_MASK		BIT(3)
+#define BD96801_LDO5_EN_MASK		BIT(4)
+#define BD96801_LDO6_EN_MASK		BIT(5)
+#define BD96801_LDO7_EN_MASK		BIT(6)
+
+#define BD96801_BUCK1_VSEL_REG		0x28
+#define BD96801_BUCK2_VSEL_REG		0x29
+#define BD96801_BUCK3_VSEL_REG		0x2a
+#define BD96801_BUCK4_VSEL_REG		0x2b
+#define BD96801_LDO5_VSEL_REG		0x25
+#define BD96801_LDO6_VSEL_REG		0x26
+#define BD96801_LDO7_VSEL_REG		0x27
+#define BD96801_BUCK_VSEL_MASK		0x1F
+#define BD96801_LDO_VSEL_MASK		0xff
+
+#define BD96801_MASK_RAMP_DELAY		0xc0
+#define BD96801_INT_VOUT_BASE_REG	0x21
+#define BD96801_BUCK_INT_VOUT_MASK	0xff
+
+#define BD96801_BUCK_VOLTS		256
+#define BD96801_LDO_VOLTS		256
+
+#define BD96801_OVP_MASK		0x03
+#define BD96801_MASK_BUCK1_OVP_SHIFT	0x00
+#define BD96801_MASK_BUCK2_OVP_SHIFT	0x02
+#define BD96801_MASK_BUCK3_OVP_SHIFT	0x04
+#define BD96801_MASK_BUCK4_OVP_SHIFT	0x06
+#define BD96801_MASK_LDO5_OVP_SHIFT	0x00
+#define BD96801_MASK_LDO6_OVP_SHIFT	0x02
+#define BD96801_MASK_LDO7_OVP_SHIFT	0x04
+
+#define BD96801_PROT_LIMIT_OCP_MIN	0x00
+#define BD96801_PROT_LIMIT_LOW		0x01
+#define BD96801_PROT_LIMIT_MID		0x02
+#define BD96801_PROT_LIMIT_HI		0x03
+
+#define BD96801_REG_BUCK1_OCP		0x32
+#define BD96801_REG_BUCK2_OCP		0x32
+#define BD96801_REG_BUCK3_OCP		0x33
+#define BD96801_REG_BUCK4_OCP		0x33
+
+#define BD96801_MASK_BUCK1_OCP_SHIFT	0x00
+#define BD96801_MASK_BUCK2_OCP_SHIFT	0x04
+#define BD96801_MASK_BUCK3_OCP_SHIFT	0x00
+#define BD96801_MASK_BUCK4_OCP_SHIFT	0x04
+
+#define BD96801_REG_LDO5_OCP		0x34
+#define BD96801_REG_LDO6_OCP		0x34
+#define BD96801_REG_LDO7_OCP		0x34
+
+#define BD96801_MASK_LDO5_OCP_SHIFT	0x00
+#define BD96801_MASK_LDO6_OCP_SHIFT	0x02
+#define BD96801_MASK_LDO7_OCP_SHIFT	0x04
+
+#define BD96801_MASK_SHD_INTB		BIT(7)
+#define BD96801_INTB_FATAL		BIT(7)
+
+#define BD96801_NUM_REGULATORS		7
+#define BD96801_NUM_LDOS		4
+
+/*
+ * Ramp rates for bucks are controlled by bits [7:6] as follows:
+ * 00 =3D> 1 mV/uS
+ * 01 =3D> 5 mV/uS
+ * 10 =3D> 10 mV/uS
+ * 11 =3D> 20 mV/uS
+ */
+static const unsigned int buck_ramp_table[] =3D { 1000, 5000, 10000, 20000=
 };
+
+/*
+ * This is a voltage range that get's appended to selected
+ * bd96801_buck_init_volts value. The range from 0x0 to 0xF is actually
+ * bd96801_buck_init_volts + 0 ... bd96801_buck_init_volts + 150mV
+ * and the range from 0x10 to 0x1f is bd96801_buck_init_volts - 150mV ...
+ * bd96801_buck_init_volts - 0. But as the members of linear_range
+ * are all unsigned I will apply offset of -150 mV to value in
+ * linear_range - which should increase these ranges with
+ * 150 mV getting all the values to >=3D 0.
+ */
+static const struct linear_range bd96801_tune_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(150000, 0x00, 0xF, 10000),
+	REGULATOR_LINEAR_RANGE(0, 0x10, 0x1F, 10000),
+};
+
+static const struct linear_range bd96801_buck_init_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(500000 - 150000, 0x00, 0xc8, 5000),
+	REGULATOR_LINEAR_RANGE(1550000 - 150000, 0xc9, 0xec, 50000),
+	REGULATOR_LINEAR_RANGE(3300000 - 150000, 0xed, 0xff, 0),
+};
+
+static const struct linear_range bd96801_ldo_int_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(300000, 0x00, 0x78, 25000),
+	REGULATOR_LINEAR_RANGE(3300000, 0x79, 0xff, 0),
+};
+
+#define BD96801_LDO_SD_VOLT_MASK	0x1
+#define BD96801_LDO_MODE_MASK		0x6
+#define BD96801_LDO_MODE_INT		0x0
+#define BD96801_LDO_MODE_SD		0x2
+#define BD96801_LDO_MODE_DDR		0x4
+
+static int ldo_ddr_volt_table[] =3D {500000, 300000};
+static int ldo_sd_volt_table[] =3D {3300000, 1800000};
+
+/* Constant IRQ initialization data (templates) */
+struct bd96801_irqinfo {
+	int type;
+	struct regulator_irq_desc irq_desc;
+	int err_cfg;
+	int wrn_cfg;
+	const char *irq_name;
+};
+
+#define BD96801_IRQINFO(_type, _name, _irqoff_ms, _irqname)	\
+{								\
+	.type =3D (_type),					\
+	.err_cfg =3D -1,						\
+	.wrn_cfg =3D -1,						\
+	.irq_name =3D (_irqname),					\
+	.irq_desc =3D {						\
+		.name =3D (_name),				\
+		.irq_off_ms =3D (_irqoff_ms),			\
+		.map_event =3D regulator_irq_map_event_simple,	\
+	},							\
+}
+
+static const struct bd96801_irqinfo buck1_irqinfo[] =3D {
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck1-over-curr-h", 500,
+			"bd96801-buck1-overcurr-h"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck1-over-curr-l", 500,
+			"bd96801-buck1-overcurr-l"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck1-over-curr-n", 500,
+			"bd96801-buck1-overcurr-n"),
+	BD96801_IRQINFO(BD96801_PROT_OVP, "buck1-over-voltage", 500,
+			"bd96801-buck1-overvolt"),
+	BD96801_IRQINFO(BD96801_PROT_UVP, "buck1-under-voltage", 500,
+			"bd96801-buck1-undervolt"),
+	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck1-over-temp", 500,
+			"bd96801-buck1-thermal")
+};
+
+static const struct bd96801_irqinfo buck2_irqinfo[] =3D {
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck2-over-curr-h", 500,
+			"bd96801-buck2-overcurr-h"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck2-over-curr-l", 500,
+			"bd96801-buck2-overcurr-l"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck2-over-curr-n", 500,
+			"bd96801-buck2-overcurr-n"),
+	BD96801_IRQINFO(BD96801_PROT_OVP, "buck2-over-voltage", 500,
+			"bd96801-buck2-overvolt"),
+	BD96801_IRQINFO(BD96801_PROT_UVP, "buck2-under-voltage", 500,
+			"bd96801-buck2-undervolt"),
+	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck2-over-temp", 500,
+			"bd96801-buck2-thermal")
+};
+
+static const struct bd96801_irqinfo buck3_irqinfo[] =3D {
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck3-over-curr-h", 500,
+			"bd96801-buck3-overcurr-h"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck3-over-curr-l", 500,
+			"bd96801-buck3-overcurr-l"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck3-over-curr-n", 500,
+			"bd96801-buck3-overcurr-n"),
+	BD96801_IRQINFO(BD96801_PROT_OVP, "buck3-over-voltage", 500,
+			"bd96801-buck3-overvolt"),
+	BD96801_IRQINFO(BD96801_PROT_UVP, "buck3-under-voltage", 500,
+			"bd96801-buck3-undervolt"),
+	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck3-over-temp", 500,
+			"bd96801-buck3-thermal")
+};
+
+static const struct bd96801_irqinfo buck4_irqinfo[] =3D {
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck4-over-curr-h", 500,
+			"bd96801-buck4-overcurr-h"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck4-over-curr-l", 500,
+			"bd96801-buck4-overcurr-l"),
+	BD96801_IRQINFO(BD96801_PROT_OCP, "buck4-over-curr-n", 500,
+			"bd96801-buck4-overcurr-n"),
+	BD96801_IRQINFO(BD96801_PROT_OVP, "buck4-over-voltage", 500,
+			"bd96801-buck4-overvolt"),
+	BD96801_IRQINFO(BD96801_PROT_UVP, "buck4-under-voltage", 500,
+			"bd96801-buck4-undervolt"),
+	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck4-over-temp", 500,
+			"bd96801-buck4-thermal")
+};
+
+static const struct bd96801_irqinfo ldo5_irqinfo[] =3D {
+	BD96801_IRQINFO(BD96801_PROT_OCP, "ldo5-overcurr", 500,
+			"bd96801-ldo5-overcurr"),
+	BD96801_IRQINFO(BD96801_PROT_OVP, "ldo5-over-voltage", 500,
+			"bd96801-ldo5-overvolt"),
+	BD96801_IRQINFO(BD96801_PROT_UVP, "ldo5-under-voltage", 500,
+			"bd96801-ldo5-undervolt"),
+};
+
+static const struct bd96801_irqinfo ldo6_irqinfo[] =3D {
+	BD96801_IRQINFO(BD96801_PROT_OCP, "ldo6-overcurr", 500,
+			"bd96801-ldo6-overcurr"),
+	BD96801_IRQINFO(BD96801_PROT_OVP, "ldo6-over-voltage", 500,
+			"bd96801-ldo6-overvolt"),
+	BD96801_IRQINFO(BD96801_PROT_UVP, "ldo6-under-voltage", 500,
+			"bd96801-ldo6-undervolt"),
+};
+
+static const struct bd96801_irqinfo ldo7_irqinfo[] =3D {
+	BD96801_IRQINFO(BD96801_PROT_OCP, "ldo7-overcurr", 500,
+			"bd96801-ldo7-overcurr"),
+	BD96801_IRQINFO(BD96801_PROT_OVP, "ldo7-over-voltage", 500,
+			"bd96801-ldo7-overvolt"),
+	BD96801_IRQINFO(BD96801_PROT_UVP, "ldo7-under-voltage", 500,
+			"bd96801-ldo7-undervolt"),
+};
+
+struct bd96801_irq_desc {
+	struct bd96801_irqinfo *irqinfo;
+	int num_irqs;
+};
+
+struct bd96801_regulator_data {
+	struct regulator_desc desc;
+	const struct linear_range *init_ranges;
+	int num_ranges;
+	struct bd96801_irq_desc irq_desc;
+	int initial_voltage;
+	int ldo_vol_lvl;
+	int ldo_errs;
+};
+
+struct bd96801_pmic_data {
+	struct bd96801_regulator_data regulator_data[BD96801_NUM_REGULATORS];
+	struct regmap *regmap;
+	int fatal_ind;
+};
+
+static int ldo_map_notif(int irq, struct regulator_irq_data *rid,
+			 unsigned long *dev_mask)
+{
+	int i;
+
+	for (i =3D 0; i < rid->num_states; i++) {
+		struct bd96801_regulator_data *rdata;
+		struct regulator_dev *rdev;
+
+		rdev =3D rid->states[i].rdev;
+		rdata =3D container_of(rdev->desc, struct bd96801_regulator_data,
+				     desc);
+		rid->states[i].notifs =3D regulator_err2notif(rdata->ldo_errs);
+		rid->states[i].errors =3D rdata->ldo_errs;
+		*dev_mask |=3D BIT(i);
+	}
+	return 0;
+}
+
+static int bd96801_list_voltage_lr(struct regulator_dev *rdev,
+				   unsigned int selector)
+{
+	int voltage;
+	struct bd96801_regulator_data *data;
+
+	data =3D container_of(rdev->desc, struct bd96801_regulator_data, desc);
+
+	/*
+	 * The BD096801 has voltage setting in two registers. One giving the
+	 * "initial voltage" (can be changed only when regulator is disabled.
+	 * This driver caches the value and sets it only at startup. The other
+	 * register is voltage tuning value which applies -150 mV ... +150 mV
+	 * offset to the voltage.
+	 *
+	 * Note that the cached initial voltage stored in regulator data is
+	 * 'scaled down' by the 150 mV so that all of our tuning values are
+	 * >=3D 0. This is done because the linear_ranges uses unsigned values.
+	 *
+	 * As a result, we increase the tuning voltage which we get based on
+	 * the selector by the stored initial_voltage.
+	 */
+	voltage =3D regulator_list_voltage_linear_range(rdev, selector);
+	if (voltage < 0)
+		return voltage;
+
+	return voltage + data->initial_voltage;
+}
+
+
+static const struct regulator_ops bd96801_ldo_table_ops =3D {
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D regulator_list_voltage_table,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+};
+
+static const struct regulator_ops bd96801_buck_ops =3D {
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D bd96801_list_voltage_lr,
+	.set_voltage_sel =3D regulator_set_voltage_sel_regmap,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel =3D regulator_set_voltage_time_sel,
+	.set_ramp_delay =3D regulator_set_ramp_delay_regmap,
+};
+
+static const struct regulator_ops bd96801_ldo_ops =3D {
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D regulator_list_voltage_linear_range,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+};
+
+static int buck_get_initial_voltage(struct regmap *regmap, struct device *=
dev,
+				    struct bd96801_regulator_data *data)
+{
+	int ret =3D 0, sel, initial_uv;
+	int reg =3D BD96801_INT_VOUT_BASE_REG + data->desc.id;
+
+	if (data->num_ranges) {
+		ret =3D regmap_read(regmap, reg, &sel);
+		sel &=3D BD96801_BUCK_INT_VOUT_MASK;
+
+		ret =3D linear_range_get_value_array(data->init_ranges,
+						   data->num_ranges, sel,
+						   &initial_uv);
+		if (ret)
+			return ret;
+
+		data->initial_voltage =3D initial_uv;
+		dev_dbg(dev, "Tune-scaled initial voltage %u\n",
+			data->initial_voltage);
+	}
+
+	return 0;
+}
+
+static int get_ldo_initial_voltage(struct regmap *regmap,
+				   struct device *dev,
+				   struct bd96801_regulator_data *data)
+{
+	int ret;
+	int cfgreg;
+
+	ret =3D regmap_read(regmap, data->ldo_vol_lvl, &cfgreg);
+	if (ret)
+		return ret;
+
+	switch (cfgreg & BD96801_LDO_MODE_MASK) {
+	case BD96801_LDO_MODE_DDR:
+		data->desc.volt_table =3D ldo_ddr_volt_table;
+		data->desc.n_voltages =3D ARRAY_SIZE(ldo_ddr_volt_table);
+		break;
+	case BD96801_LDO_MODE_SD:
+		data->desc.volt_table =3D ldo_sd_volt_table;
+		data->desc.n_voltages =3D ARRAY_SIZE(ldo_sd_volt_table);
+		break;
+	default:
+		dev_info(dev, "Leaving LDO to normal mode");
+		return 0;
+	}
+
+	/* SD or DDR mode =3D> override default ops */
+	data->desc.ops =3D &bd96801_ldo_table_ops,
+	data->desc.vsel_mask =3D 1;
+	data->desc.vsel_reg =3D data->ldo_vol_lvl;
+
+	return 0;
+}
+
+static int get_initial_voltage(struct device *dev, struct regmap *regmap,
+			struct bd96801_regulator_data *data)
+{
+	/* BUCK */
+	if (data->desc.id <=3D BD96801_BUCK4)
+		return buck_get_initial_voltage(regmap, dev, data);
+
+	/* LDO */
+	return get_ldo_initial_voltage(regmap, dev, data);
+}
+
+static int bd96801_walk_regulator_dt(struct device *dev, struct regmap *re=
gmap,
+				     struct bd96801_regulator_data *data,
+				     int num)
+{
+	int i, ret;
+	struct device_node *np;
+	struct device_node *nproot =3D dev->parent->of_node;
+
+	nproot =3D of_get_child_by_name(nproot, "regulators");
+	if (!nproot) {
+		dev_err(dev, "failed to find regulators node\n");
+		return -ENODEV;
+	}
+	for_each_child_of_node(nproot, np)
+		for (i =3D 0; i < num; i++) {
+			if (!of_node_name_eq(np, data[i].desc.of_match))
+				continue;
+			/*
+			 * If STBY configs are supported, we must pass node
+			 * here to extract the initial voltages from the DT.
+			 * Thus we do the initial voltage getting in this
+			 * loop.
+			 */
+			ret =3D get_initial_voltage(dev, regmap, &data[i]);
+			if (ret) {
+				dev_err(dev,
+					"Initializing voltages for %s failed\n",
+					data[i].desc.name);
+				of_node_put(np);
+				of_node_put(nproot);
+
+				return ret;
+			}
+			if (of_property_read_bool(np, "rohm,keep-on-stby")) {
+				ret =3D regmap_set_bits(regmap,
+						      BD96801_ALWAYS_ON_REG,
+						      1 << data[i].desc.id);
+				if (ret) {
+					dev_err(dev,
+						"failed to set %s on-at-stby\n",
+						data[i].desc.name);
+					of_node_put(np);
+					of_node_put(nproot);
+
+					return ret;
+				}
+			}
+		}
+	of_node_put(nproot);
+
+	return 0;
+}
+
+/*
+ * Template for regulator data. Probe will allocate dynamic / driver insta=
nce
+ * struct so we should be on a safe side even if there were multiple PMICs=
 to
+ * control. Note that there is a plan to allow multiple PMICs to be used so
+ * systems can scale better. I am however still slightly unsure how the
+ * multi-PMIC case will be handled. I don't know if the processor will hav=
e I2C
+ * acces to all of the PMICs or only the first one. I'd guess there will be
+ * access provided to all PMICs for voltage scaling - but the errors will =
only
+ * be informed via the master PMIC. Eg, we should prepare to support multi=
ple
+ * driver instances - either with or without the IRQs... Well, let's first
+ * just support the simple and clear single-PMIC setup and ponder the mult=
i PMIC
+ * case later. What we can easly do for preparing is to not use static glo=
bal
+ * data for regulators though.
+ */
+static const struct bd96801_pmic_data bd96801_data =3D {
+	.regulator_data =3D {
+	{
+		.desc =3D {
+			.name =3D "buck1",
+			.of_match =3D of_match_ptr("buck1"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK1,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_tune_volts),
+			.n_voltages =3D BD96801_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK1_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK1_VSEL_REG,
+			.vsel_mask =3D BD96801_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK1_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.init_ranges =3D bd96801_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96801_buck_init_volts),
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck1_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck1_irqinfo),
+		},
+	}, {
+		.desc =3D {
+			.name =3D "buck2",
+			.of_match =3D of_match_ptr("buck2"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK2,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_tune_volts),
+			.n_voltages =3D BD96801_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK2_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK2_VSEL_REG,
+			.vsel_mask =3D BD96801_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK2_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck2_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck2_irqinfo),
+		},
+		.init_ranges =3D bd96801_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96801_buck_init_volts),
+	}, {
+		.desc =3D {
+			.name =3D "buck3",
+			.of_match =3D of_match_ptr("buck3"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK3,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_tune_volts),
+			.n_voltages =3D BD96801_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK3_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK3_VSEL_REG,
+			.vsel_mask =3D BD96801_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK3_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck3_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck3_irqinfo),
+		},
+		.init_ranges =3D bd96801_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96801_buck_init_volts),
+	}, {
+		.desc =3D {
+			.name =3D "buck4",
+			.of_match =3D of_match_ptr("buck4"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK4,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_tune_volts),
+			.n_voltages =3D BD96801_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK4_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK4_VSEL_REG,
+			.vsel_mask =3D BD96801_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK4_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck4_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck4_irqinfo),
+		},
+		.init_ranges =3D bd96801_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96801_buck_init_volts),
+	}, {
+		.desc =3D {
+			.name =3D "ldo5",
+			.of_match =3D of_match_ptr("ldo5"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_LDO5,
+			.ops =3D &bd96801_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_ldo_int_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_ldo_int_volts),
+			.n_voltages =3D BD96801_LDO_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_LDO5_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_LDO5_VSEL_REG,
+			.vsel_mask =3D BD96801_LDO_VSEL_MASK,
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&ldo5_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(ldo5_irqinfo),
+		},
+		.ldo_vol_lvl =3D BD96801_LDO5_VOL_LVL_REG,
+	}, {
+		.desc =3D {
+			.name =3D "ldo6",
+			.of_match =3D of_match_ptr("ldo6"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_LDO6,
+			.ops =3D &bd96801_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_ldo_int_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_ldo_int_volts),
+			.n_voltages =3D BD96801_LDO_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_LDO6_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_LDO6_VSEL_REG,
+			.vsel_mask =3D BD96801_LDO_VSEL_MASK,
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&ldo6_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(ldo6_irqinfo),
+		},
+		.ldo_vol_lvl =3D BD96801_LDO6_VOL_LVL_REG,
+	}, {
+		.desc =3D {
+			.name =3D "ldo7",
+			.of_match =3D of_match_ptr("ldo7"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_LDO7,
+			.ops =3D &bd96801_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96801_ldo_int_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96801_ldo_int_volts),
+			.n_voltages =3D BD96801_LDO_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_LDO7_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_LDO7_VSEL_REG,
+			.vsel_mask =3D BD96801_LDO_VSEL_MASK,
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&ldo7_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(ldo7_irqinfo),
+		},
+		.ldo_vol_lvl =3D BD96801_LDO7_VOL_LVL_REG,
+	},
+	},
+};
+
+static int initialize_pmic_data(struct device *dev,
+				struct bd96801_pmic_data *pdata)
+{
+	int r, i;
+
+	/*
+	 * Allocate and initialize IRQ data for all of the regulators. We
+	 * wish to modify IRQ information independently for each driver
+	 * instance.
+	 */
+	for (r =3D 0; r < BD96801_NUM_REGULATORS; r++) {
+		const struct bd96801_irqinfo *template;
+		struct bd96801_irqinfo *new;
+		int num_infos;
+
+		template =3D pdata->regulator_data[r].irq_desc.irqinfo;
+		num_infos =3D pdata->regulator_data[r].irq_desc.num_irqs;
+
+		new =3D devm_kcalloc(dev, num_infos, sizeof(*new), GFP_KERNEL);
+		if (!new)
+			return -ENOMEM;
+
+		pdata->regulator_data[r].irq_desc.irqinfo =3D new;
+
+		for (i =3D 0; i < num_infos; i++)
+			new[i] =3D template[i];
+	}
+
+	return 0;
+}
+
+static int bd96801_rdev_intb_irqs(struct platform_device *pdev,
+				  struct bd96801_pmic_data *pdata,
+				  struct bd96801_irqinfo *iinfo,
+				  struct regulator_dev *rdev)
+{
+	struct regulator_dev *rdev_arr[1];
+	void *retp;
+	int err =3D 0;
+	int irq;
+	int err_flags[] =3D {
+		[BD96801_PROT_OVP] =3D REGULATOR_ERROR_REGULATION_OUT,
+		[BD96801_PROT_UVP] =3D REGULATOR_ERROR_UNDER_VOLTAGE,
+		[BD96801_PROT_OCP] =3D REGULATOR_ERROR_OVER_CURRENT,
+		[BD96801_PROT_TEMP] =3D REGULATOR_ERROR_OVER_TEMP,
+
+	};
+	int wrn_flags[] =3D {
+		[BD96801_PROT_OVP] =3D REGULATOR_ERROR_OVER_VOLTAGE_WARN,
+		[BD96801_PROT_UVP] =3D REGULATOR_ERROR_UNDER_VOLTAGE_WARN,
+		[BD96801_PROT_OCP] =3D REGULATOR_ERROR_OVER_CURRENT_WARN,
+		[BD96801_PROT_TEMP] =3D REGULATOR_ERROR_OVER_TEMP_WARN,
+	};
+
+	/*
+	 * Don't install IRQ handler if both error and warning
+	 * notifications are explicitly disabled
+	 */
+	if (!iinfo->err_cfg && !iinfo->wrn_cfg)
+		return 0;
+
+	if (WARN_ON(iinfo->type >=3D BD96801_NUM_PROT))
+		return -EINVAL;
+
+	if (iinfo->err_cfg)
+		err =3D err_flags[iinfo->type];
+	else if (iinfo->wrn_cfg)
+		err =3D wrn_flags[iinfo->type];
+
+	iinfo->irq_desc.data =3D pdata;
+	irq =3D platform_get_irq_byname(pdev, iinfo->irq_name);
+	if (irq < 0)
+		return irq;
+	/* Find notifications for this IRQ (WARN/ERR) */
+
+	rdev_arr[0] =3D rdev;
+	retp =3D devm_regulator_irq_helper(&pdev->dev,
+					 &iinfo->irq_desc, irq,
+					 0, err, NULL, rdev_arr,
+					 1);
+	if (IS_ERR(retp))
+		return PTR_ERR(retp);
+
+	return 0;
+}
+
+
+
+static int bd96801_probe(struct platform_device *pdev)
+{
+	struct regulator_dev *ldo_errs_rdev_arr[BD96801_NUM_LDOS];
+	struct bd96801_regulator_data *rdesc;
+	struct regulator_config config =3D {};
+	int ldo_errs_arr[BD96801_NUM_LDOS];
+	struct bd96801_pmic_data *pdata;
+	int temp_notif_ldos =3D 0;
+	struct device *parent;
+	int i, ret;
+	void *retp;
+
+	parent =3D pdev->dev.parent;
+
+	pdata =3D devm_kmemdup(&pdev->dev, &bd96801_data, sizeof(bd96801_data),
+			     GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (initialize_pmic_data(&pdev->dev, pdata))
+		return -ENOMEM;
+
+	pdata->regmap =3D dev_get_regmap(parent, NULL);
+	if (!pdata->regmap) {
+		dev_err(&pdev->dev, "No register map found\n");
+		return -ENODEV;
+	}
+
+	rdesc =3D &pdata->regulator_data[0];
+
+	config.driver_data =3D pdata;
+	config.regmap =3D pdata->regmap;
+	config.dev =3D parent;
+
+	ret =3D bd96801_walk_regulator_dt(&pdev->dev, pdata->regmap, rdesc,
+					BD96801_NUM_REGULATORS);
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < ARRAY_SIZE(pdata->regulator_data); i++) {
+		struct regulator_dev *rdev;
+		struct bd96801_irq_desc *idesc =3D &rdesc[i].irq_desc;
+		int j;
+
+		rdev =3D devm_regulator_register(&pdev->dev,
+					       &rdesc[i].desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev,
+				"failed to register %s regulator\n",
+				rdesc[i].desc.name);
+			return PTR_ERR(rdev);
+		}
+		/*
+		 * LDOs don't have own temperature monitoring. If temperature
+		 * notification was requested for this LDO from DT then we will
+		 * add the regulator to be notified if central IC temperature
+		 * exceeds threshold.
+		 */
+		if (rdesc[i].ldo_errs) {
+			ldo_errs_rdev_arr[temp_notif_ldos] =3D rdev;
+			ldo_errs_arr[temp_notif_ldos] =3D rdesc[i].ldo_errs;
+			temp_notif_ldos++;
+		}
+		if (!idesc)
+			continue;
+
+		/* Register INTB handlers for configured protections */
+		for (j =3D 0; j < idesc->num_irqs; j++) {
+			ret =3D bd96801_rdev_intb_irqs(pdev, pdata,
+						     &idesc->irqinfo[j], rdev);
+			if (ret)
+				return ret;
+		}
+	}
+	if (temp_notif_ldos) {
+		int irq;
+		struct regulator_irq_desc tw_desc =3D {
+			.name =3D "bd96801-core-thermal",
+			.irq_off_ms =3D 500,
+			.map_event =3D ldo_map_notif,
+		};
+
+		irq =3D platform_get_irq_byname(pdev, "bd96801-core-thermal");
+		if (irq < 0)
+			return irq;
+
+		retp =3D devm_regulator_irq_helper(&pdev->dev, &tw_desc, irq, 0,
+						 0, &ldo_errs_arr[0],
+						 &ldo_errs_rdev_arr[0],
+						 temp_notif_ldos);
+		if (IS_ERR(retp))
+			return PTR_ERR(retp);
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id bd96801_pmic_id[] =3D {
+	{ "bd96801-regulator", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);
+
+static struct platform_driver bd96801_regulator =3D {
+	.driver =3D {
+		.name =3D "bd96801-pmic"
+	},
+	.probe =3D bd96801_probe,
+	.id_table =3D bd96801_pmic_id,
+};
+
+module_platform_driver(bd96801_regulator);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("BD96801 voltage regulator driver");
+MODULE_LICENSE("GPL");
--=20
2.45.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--GaLALLvK3s42iRZT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZ9GCwACgkQeFA3/03a
ocVWOwgAyRc9ci1p3ENr1UkV7iIC+MlcKHfn4vKdglI58+2LhTS7hnF2OC1zgfgg
zBAqbx9NxmofAwDDbenRdlH7Hq8STZF0EmCFkc8+ARu51J1vji9vI9amqZ+AGV5t
xuctJAsQLee0IZoQ1+r8Qa3aw5eAQEBivyElOZFSnHYk5UI3eNLBqQ9muWdMCr3e
CyeDhP1b0U9m61EMTCa65iMjv3ic8hqIXGmNq94AHBnmOW572Dl85i0dh2jqITu/
y0rE5I08fY8PU4ZTUQdIF1DiXePcyN+Ygo2lIyeTRGgretTlJTHgU6hoRyrFuua7
pCCGXjKf1NLBWmm/VLpeyT9IKYzsgA==
=tyUq
-----END PGP SIGNATURE-----

--GaLALLvK3s42iRZT--

