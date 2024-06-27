Return-Path: <linux-watchdog+bounces-1195-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9491A0AD
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 09:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF99B1C21142
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 07:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3766661FCE;
	Thu, 27 Jun 2024 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNNSa7sR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC660EC4;
	Thu, 27 Jun 2024 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474217; cv=none; b=lbZ/n9SPeygyz9Uu3ZVpf2cNjP9rPRXvs04wgLXOIxcgsrwLyMtS1tXm/6W8h1inhgtLGfFkMv1Hk4raJm+dsA6dZl+guOhaHaTUufel6bgs7TXojILtvitoGJxGcVLa+YYgc+DTjslf3BH/RrwvkX5v9L6Jq8EajMSGY83gj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474217; c=relaxed/simple;
	bh=hByCsgJS9DBQ3YkzA0d2XcMT94YyUZS5ZtmLbHWsp0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezhRV+Zyp80XG3LN2jCz/AcudzK50+NMbE/qfagHB4LwSvMbeOeyzpQAdlH8hoLGTNPFxT1Rd81DtSbpSA34JLltVNPUyHMACS8LA9D9uKvFEmeJJntP9agmqxy2mO1eOjgEuycrg3/LYyYKSdl0DQDl2/N6H6O2YOKj0XKCTIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNNSa7sR; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cd628f21cso6971807e87.3;
        Thu, 27 Jun 2024 00:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474213; x=1720079013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bN/bZR0zSsgUCvetx4105Mk4Qlk93VH+isuMvttLoes=;
        b=MNNSa7sR296MMx9fEGOMD/5O9MeLl2fN4u+YduJHS7YN0NRSr9/Q4wuabRXBuTq6JN
         FCsg1t375G6gK782utwoUWJ2fP4hKA3kBl/YKWQpYgwrwt3lEUevsuqoi38bMaRkpl4f
         bNkqL+0rYJNmMDIDfwrS+1gro+5ZXuqpYeDgNwC4LKyZugyV9wgBvR3oLMOuzmxFi2tB
         r680Hzq3tBuc5LLSamSLzzHHDpCXA4+SCdU3IrgC2vk5rv5SCQwVzhTrEoi2OTnCKSBh
         9Y5qAe5VVKBU2I6FadMAkflfX6g8csuHK9g3NR8mJ8jjbUro17kixpFcSmCznWwFwHGT
         EjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474213; x=1720079013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bN/bZR0zSsgUCvetx4105Mk4Qlk93VH+isuMvttLoes=;
        b=E1+nPFx3pKEJ/VHhLPhg/qR+08Dr8yF2D2tmyvRx3CE/b+IlOKafdD6aWZier2BjmA
         FR8XGuV2uhO1rJ9xOxtlDEDODdL8x7WE4hy5trDWBlV7ZwFgp/RVrfnWQjKBIuTCrIlc
         ROPl8o8yMhgHZtVJjQ0TAx1P2zxmEoC010kDXW6wS0rmqexZx4BuWT1IBAL3Uns9nfwN
         rYqiHt/I21E8R+SLcTdvMXPfo9bYHOv/xkbNAXZZyNAlKPVQZY8RrNwNLlY7cOMTY/IF
         aUYZ//4PBoOVQrr3bg5XU9zeRqDZFoh28Nvuq/yWOlVsyif5sqLtcClMVc8HbYTk6BvN
         nLyw==
X-Forwarded-Encrypted: i=1; AJvYcCX0DkUZ6lX2oyTAEOwI3verNtsc/dbuPl9u4fcAnPStgO2ehE40SVw523dByyP4jLucnijHZ7HCiARiNlvdNorwrUep+2xOYS06AJx68ysVFSnc8VN5256v7/+O9GjI01D3YgyMuEHL6BE3NC8MQs0nE3R3XI6mbsKbUylY27cIDVitfKHd9bCB
X-Gm-Message-State: AOJu0YzLJyv0iGy32UNV7Dol7xVAGXjsNhTbpmlcuVCZnO0ur6ChVxzz
	zQelpykfymrzotYyyEetUGMwXIRLSxn/9gqVAe+Pf5z+dNQNxmaX
X-Google-Smtp-Source: AGHT+IFi41Rsbj7Uezs8NmsBsBC/v9GBQRCIlinKgMT7x3M9H1uo8tv4lvXxdcTKgobEXKp4LpwMPw==
X-Received: by 2002:ac2:4437:0:b0:52c:c9d1:ad32 with SMTP id 2adb3069b0e04-52ce1835a80mr8265682e87.22.1719474212287;
        Thu, 27 Jun 2024 00:43:32 -0700 (PDT)
Received: from fedora ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e713054d6sm107223e87.152.2024.06.27.00.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:43:31 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:43:27 +0300
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
Subject: [PATCH v5 3/6] mfd: support ROHM BD96801 PMIC core
Message-ID: <c5260e2dd222e3c64cdf410802bba195637ccb93.1719473802.git.mazziesaccount@gmail.com>
References: <cover.1719473802.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QKXzC6PSEn5XvWEE"
Content-Disposition: inline
In-Reply-To: <cover.1719473802.git.mazziesaccount@gmail.com>


--QKXzC6PSEn5XvWEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96801 PMIC is highly customizable automotive grade PMIC
which integrates regulator and watchdog funtionalities.

Provide INTB IRQ and register accesses for regulator/watchdog drivers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Changelog:
v4 =3D>:
- No changes

v3 =3D> v4:
- change regulator cell name
- minor styling

v2 =3D>:
- No changes

v1 =3D> v2:
- Drop unused enum
- Improve error prints
- improve comments

 RFCv2 =3D> v1:
- drop ERRB interrupts (for now)
- bd96801: Unlock registers in core driver

Changelog: RFCv1 =3D> RFCv2
- Work-around the IRQ domain name conflict
- Add watchdog IRQ
- Various styling fixes based on review by Lee
---
 drivers/mfd/Kconfig              |  13 ++
 drivers/mfd/Makefile             |   1 +
 drivers/mfd/rohm-bd96801.c       | 273 +++++++++++++++++++++++++++++++
 include/linux/mfd/rohm-bd96801.h | 215 ++++++++++++++++++++++++
 include/linux/mfd/rohm-generic.h |   1 +
 5 files changed, 503 insertions(+)
 create mode 100644 drivers/mfd/rohm-bd96801.c
 create mode 100644 include/linux/mfd/rohm-bd96801.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 266b4f54af60..68cc7af9ef97 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2089,6 +2089,19 @@ config MFD_ROHM_BD957XMUF
 	  BD9573MUF Power Management ICs. BD9576 and BD9573 are primarily
 	  designed to be used to power R-Car series processors.
=20
+config MFD_ROHM_BD96801
+	tristate "ROHM BD96801 Power Management IC"
+	depends on I2C=3Dy
+	depends on OF
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	select MFD_CORE
+	help
+	  Select this option to get support for the ROHM BD96801 Power
+	  Management IC. The ROHM BD96801 is a highly scalable Power Management
+	  IC for industrial and automotive use. The BD96801 can be used as a
+	  master PMIC in a chained PMIC solution with suitable companion PMICs.
+
 config MFD_STM32_LPTIMER
 	tristate "Support for STM32 Low-Power Timer"
 	depends on (ARCH_STM32 && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c66f07edcd0e..e792892d4a8b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -264,6 +264,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+=3D rave-sp.o
 obj-$(CONFIG_MFD_ROHM_BD71828)	+=3D rohm-bd71828.o
 obj-$(CONFIG_MFD_ROHM_BD718XX)	+=3D rohm-bd718x7.o
 obj-$(CONFIG_MFD_ROHM_BD957XMUF)	+=3D rohm-bd9576.o
+obj-$(CONFIG_MFD_ROHM_BD96801)	+=3D rohm-bd96801.o
 obj-$(CONFIG_MFD_STMFX) 	+=3D stmfx.o
 obj-$(CONFIG_MFD_KHADAS_MCU) 	+=3D khadas-mcu.o
 obj-$(CONFIG_MFD_ACER_A500_EC)	+=3D acer-ec-a500.o
diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
new file mode 100644
index 000000000000..714f08ed544b
--- /dev/null
+++ b/drivers/mfd/rohm-bd96801.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 ROHM Semiconductors
+ *
+ * ROHM BD96801 PMIC driver
+ *
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
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <linux/mfd/rohm-bd96801.h>
+#include <linux/mfd/rohm-generic.h>
+
+static const struct resource regulator_intb_irqs[] =3D {
+	DEFINE_RES_IRQ_NAMED(BD96801_TW_STAT, "bd96801-core-thermal"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OCPH_STAT, "bd96801-buck1-overcurr-h"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OCPL_STAT, "bd96801-buck1-overcurr-l"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OCPN_STAT, "bd96801-buck1-overcurr-n"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OVD_STAT, "bd96801-buck1-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_UVD_STAT, "bd96801-buck1-undervolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_TW_CH_STAT, "bd96801-buck1-thermal"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OCPH_STAT, "bd96801-buck2-overcurr-h"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OCPL_STAT, "bd96801-buck2-overcurr-l"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OCPN_STAT, "bd96801-buck2-overcurr-n"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OVD_STAT, "bd96801-buck2-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_UVD_STAT, "bd96801-buck2-undervolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_TW_CH_STAT, "bd96801-buck2-thermal"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OCPH_STAT, "bd96801-buck3-overcurr-h"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OCPL_STAT, "bd96801-buck3-overcurr-l"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OCPN_STAT, "bd96801-buck3-overcurr-n"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OVD_STAT, "bd96801-buck3-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_UVD_STAT, "bd96801-buck3-undervolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_TW_CH_STAT, "bd96801-buck3-thermal"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OCPH_STAT, "bd96801-buck4-overcurr-h"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OCPL_STAT, "bd96801-buck4-overcurr-l"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OCPN_STAT, "bd96801-buck4-overcurr-n"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OVD_STAT, "bd96801-buck4-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_UVD_STAT, "bd96801-buck4-undervolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_TW_CH_STAT, "bd96801-buck4-thermal"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_OCPH_STAT, "bd96801-ldo5-overcurr"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_OVD_STAT, "bd96801-ldo5-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_UVD_STAT, "bd96801-ldo5-undervolt"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_OCPH_STAT, "bd96801-ldo6-overcurr"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_OVD_STAT, "bd96801-ldo6-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_UVD_STAT, "bd96801-ldo6-undervolt"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_OCPH_STAT, "bd96801-ldo7-overcurr"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_OVD_STAT, "bd96801-ldo7-overvolt"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_UVD_STAT, "bd96801-ldo7-undervolt"),
+};
+
+static const struct resource wdg_intb_irqs[] =3D {
+	DEFINE_RES_IRQ_NAMED(BD96801_WDT_ERR_STAT, "bd96801-wdg"),
+};
+
+static struct mfd_cell bd96801_cells[] =3D {
+	{
+		.name =3D "bd96801-wdt",
+		.resources =3D wdg_intb_irqs,
+		.num_resources =3D ARRAY_SIZE(wdg_intb_irqs),
+	}, {
+		.name =3D "bd96801-regulator",
+		.resources =3D regulator_intb_irqs,
+		.num_resources =3D ARRAY_SIZE(regulator_intb_irqs),
+	},
+};
+
+static const struct regmap_range bd96801_volatile_ranges[] =3D {
+	/* Status registers */
+	regmap_reg_range(BD96801_REG_WD_FEED, BD96801_REG_WD_FAILCOUNT),
+	regmap_reg_range(BD96801_REG_WD_ASK, BD96801_REG_WD_ASK),
+	regmap_reg_range(BD96801_REG_WD_STATUS, BD96801_REG_WD_STATUS),
+	regmap_reg_range(BD96801_REG_PMIC_STATE, BD96801_REG_INT_LDO7_INTB),
+	/* Registers which do not update value unless PMIC is in STBY */
+	regmap_reg_range(BD96801_REG_SSCG_CTRL, BD96801_REG_SHD_INTB),
+	regmap_reg_range(BD96801_REG_BUCK_OVP, BD96801_REG_BOOT_OVERTIME),
+	/*
+	 * LDO control registers have single bit (LDO MODE) which does not
+	 * change when we write it unless PMIC is in STBY. It's safer to not
+	 * cache it.
+	 */
+	regmap_reg_range(BD96801_LDO5_VOL_LVL_REG, BD96801_LDO7_VOL_LVL_REG),
+};
+
+static const struct regmap_access_table volatile_regs =3D {
+	.yes_ranges =3D bd96801_volatile_ranges,
+	.n_yes_ranges =3D ARRAY_SIZE(bd96801_volatile_ranges),
+};
+
+static const struct regmap_irq bd96801_intb_irqs[] =3D {
+	/* STATUS SYSTEM INTB */
+	REGMAP_IRQ_REG(BD96801_TW_STAT, 0, BD96801_TW_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_WDT_ERR_STAT, 0, BD96801_WDT_ERR_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_I2C_ERR_STAT, 0, BD96801_I2C_ERR_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_CHIP_IF_ERR_STAT, 0, BD96801_CHIP_IF_ERR_STAT_MASK=
),
+	/* STATUS BUCK1 INTB */
+	REGMAP_IRQ_REG(BD96801_BUCK1_OCPH_STAT, 1, BD96801_BUCK_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_OCPL_STAT, 1, BD96801_BUCK_OCPL_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_OCPN_STAT, 1, BD96801_BUCK_OCPN_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_OVD_STAT, 1, BD96801_BUCK_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_UVD_STAT, 1, BD96801_BUCK_UVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_TW_CH_STAT, 1, BD96801_BUCK_TW_CH_STAT_MASK),
+	/* BUCK 2 INTB */
+	REGMAP_IRQ_REG(BD96801_BUCK2_OCPH_STAT, 2, BD96801_BUCK_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_OCPL_STAT, 2, BD96801_BUCK_OCPL_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_OCPN_STAT, 2, BD96801_BUCK_OCPN_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_OVD_STAT, 2, BD96801_BUCK_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_UVD_STAT, 2, BD96801_BUCK_UVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_TW_CH_STAT, 2, BD96801_BUCK_TW_CH_STAT_MASK),
+	/* BUCK 3 INTB */
+	REGMAP_IRQ_REG(BD96801_BUCK3_OCPH_STAT, 3, BD96801_BUCK_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_OCPL_STAT, 3, BD96801_BUCK_OCPL_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_OCPN_STAT, 3, BD96801_BUCK_OCPN_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_OVD_STAT, 3, BD96801_BUCK_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_UVD_STAT, 3, BD96801_BUCK_UVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_TW_CH_STAT, 3, BD96801_BUCK_TW_CH_STAT_MASK),
+	/* BUCK 4 INTB */
+	REGMAP_IRQ_REG(BD96801_BUCK4_OCPH_STAT, 4, BD96801_BUCK_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_OCPL_STAT, 4, BD96801_BUCK_OCPL_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_OCPN_STAT, 4, BD96801_BUCK_OCPN_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_OVD_STAT, 4, BD96801_BUCK_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_UVD_STAT, 4, BD96801_BUCK_UVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_TW_CH_STAT, 4, BD96801_BUCK_TW_CH_STAT_MASK),
+	/* LDO5 INTB */
+	REGMAP_IRQ_REG(BD96801_LDO5_OCPH_STAT, 5, BD96801_LDO_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO5_OVD_STAT, 5, BD96801_LDO_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO5_UVD_STAT, 5, BD96801_LDO_UVD_STAT_MASK),
+	/* LDO6 INTB */
+	REGMAP_IRQ_REG(BD96801_LDO6_OCPH_STAT, 6, BD96801_LDO_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO6_OVD_STAT, 6, BD96801_LDO_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO6_UVD_STAT, 6, BD96801_LDO_UVD_STAT_MASK),
+	/* LDO7 INTB */
+	REGMAP_IRQ_REG(BD96801_LDO7_OCPH_STAT, 7, BD96801_LDO_OCPH_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO7_OVD_STAT, 7, BD96801_LDO_OVD_STAT_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO7_UVD_STAT, 7, BD96801_LDO_UVD_STAT_MASK),
+};
+
+static struct regmap_irq_chip bd96801_irq_chip_intb =3D {
+	.name =3D "bd96801-irq-intb",
+	.main_status =3D BD96801_REG_INT_MAIN,
+	.num_main_regs =3D 1,
+	.irqs =3D &bd96801_intb_irqs[0],
+	.num_irqs =3D ARRAY_SIZE(bd96801_intb_irqs),
+	.status_base =3D BD96801_REG_INT_SYS_INTB,
+	.mask_base =3D BD96801_REG_MASK_SYS_INTB,
+	.ack_base =3D BD96801_REG_INT_SYS_INTB,
+	.init_ack_masked =3D true,
+	.num_regs =3D 8,
+	.irq_reg_stride =3D 1,
+};
+
+static const struct regmap_config bd96801_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+	.volatile_table =3D &volatile_regs,
+	.cache_type =3D REGCACHE_RBTREE,
+};
+
+static int bd96801_i2c_probe(struct i2c_client *i2c)
+{
+	struct regmap_irq_chip_data *intb_irq_data;
+	const struct fwnode_handle *fwnode;
+	struct irq_domain *intb_domain;
+	struct regmap *regmap;
+	int ret, intb_irq;
+
+	fwnode =3D dev_fwnode(&i2c->dev);
+	if (!fwnode)
+		return dev_err_probe(&i2c->dev, -EINVAL, "Failed to find fwnode\n");
+
+	intb_irq =3D fwnode_irq_get_byname(fwnode, "intb");
+	if (intb_irq < 0)
+		return dev_err_probe(&i2c->dev, intb_irq, "INTB IRQ not configured\n");
+
+	regmap =3D devm_regmap_init_i2c(i2c, &bd96801_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
+				    "Regmap initialization failed\n");
+
+	ret =3D regmap_write(regmap, BD96801_LOCK_REG, BD96801_UNLOCK);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Failed to unlock PMIC\n");
+
+	ret =3D devm_regmap_add_irq_chip(&i2c->dev, regmap, intb_irq,
+				       IRQF_ONESHOT, 0, &bd96801_irq_chip_intb,
+				       &intb_irq_data);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Failed to add INTB IRQ chip\n");
+
+	intb_domain =3D regmap_irq_get_domain(intb_irq_data);
+
+	ret =3D devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
+				   bd96801_cells,
+				   ARRAY_SIZE(bd96801_cells), NULL, 0,
+				   intb_domain);
+	if (ret)
+		dev_err(&i2c->dev, "Failed to create subdevices\n");
+
+	return ret;
+}
+
+static const struct of_device_id bd96801_of_match[] =3D {
+	{ .compatible =3D "rohm,bd96801",	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bd96801_of_match);
+
+static struct i2c_driver bd96801_i2c_driver =3D {
+	.driver =3D {
+		.name =3D "rohm-bd96801",
+		.of_match_table =3D bd96801_of_match,
+	},
+	.probe =3D bd96801_i2c_probe,
+};
+
+static int __init bd96801_i2c_init(void)
+{
+	return i2c_add_driver(&bd96801_i2c_driver);
+}
+
+/* Initialise early so consumer devices can complete system boot */
+subsys_initcall(bd96801_i2c_init);
+
+static void __exit bd96801_i2c_exit(void)
+{
+	i2c_del_driver(&bd96801_i2c_driver);
+}
+module_exit(bd96801_i2c_exit);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("ROHM BD96801 Power Management IC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/rohm-bd96801.h b/include/linux/mfd/rohm-bd96=
801.h
new file mode 100644
index 000000000000..e2d9e10b6364
--- /dev/null
+++ b/include/linux/mfd/rohm-bd96801.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2024 ROHM Semiconductors */
+
+#ifndef __MFD_BD96801_H__
+#define __MFD_BD96801_H__
+
+#define BD96801_REG_SSCG_CTRL		0x09
+#define BD96801_REG_SHD_INTB            0x20
+#define BD96801_LDO5_VOL_LVL_REG	0x2c
+#define BD96801_LDO6_VOL_LVL_REG	0x2d
+#define BD96801_LDO7_VOL_LVL_REG	0x2e
+#define BD96801_REG_BUCK_OVP		0x30
+#define BD96801_REG_BUCK_OVD		0x35
+#define BD96801_REG_LDO_OVP		0x31
+#define BD96801_REG_LDO_OVD		0x36
+#define BD96801_REG_BOOT_OVERTIME	0x3a
+#define BD96801_REG_WD_TMO		0x40
+#define BD96801_REG_WD_CONF		0x41
+#define BD96801_REG_WD_FEED		0x42
+#define BD96801_REG_WD_FAILCOUNT	0x43
+#define BD96801_REG_WD_ASK		0x46
+#define BD96801_REG_WD_STATUS		0x4a
+#define BD96801_REG_PMIC_STATE		0x4f
+#define BD96801_REG_EXT_STATE		0x50
+
+#define BD96801_STATE_STBY		0x09
+
+#define BD96801_LOCK_REG		0x04
+#define BD96801_UNLOCK			0x9d
+#define BD96801_LOCK			0x00
+
+/* IRQ register area */
+#define BD96801_REG_INT_MAIN		0x51
+
+/*
+ * The BD96801 has two physical IRQ lines, INTB and ERRB.
+ *
+ * The 'main status register' is located at 0x51.
+ * The ERRB status registers are located at 0x52 ... 0x5B
+ * INTB status registers are at range 0x5c ... 0x63
+ */
+#define BD96801_REG_INT_SYS_ERRB1	0x52
+#define BD96801_REG_INT_SYS_INTB	0x5c
+#define BD96801_REG_INT_LDO7_INTB	0x63
+
+/* MASK registers */
+#define BD96801_REG_MASK_SYS_INTB	0x73
+#define BD96801_REG_MASK_SYS_ERRB	0x69
+
+#define BD96801_MAX_REGISTER		0x7a
+
+#define BD96801_OTP_ERR_MASK		BIT(0)
+#define BD96801_DBIST_ERR_MASK		BIT(1)
+#define BD96801_EEP_ERR_MASK		BIT(2)
+#define BD96801_ABIST_ERR_MASK		BIT(3)
+#define BD96801_PRSTB_ERR_MASK		BIT(4)
+#define BD96801_DRMOS1_ERR_MASK		BIT(5)
+#define BD96801_DRMOS2_ERR_MASK		BIT(6)
+#define BD96801_SLAVE_ERR_MASK		BIT(7)
+#define BD96801_VREF_ERR_MASK		BIT(0)
+#define BD96801_TSD_ERR_MASK		BIT(1)
+#define BD96801_UVLO_ERR_MASK		BIT(2)
+#define BD96801_OVLO_ERR_MASK		BIT(3)
+#define BD96801_OSC_ERR_MASK		BIT(4)
+#define BD96801_PON_ERR_MASK		BIT(5)
+#define BD96801_POFF_ERR_MASK		BIT(6)
+#define BD96801_CMD_SHDN_ERR_MASK	BIT(7)
+#define BD96801_INT_PRSTB_WDT_ERR_MASK	BIT(0)
+#define BD96801_INT_CHIP_IF_ERR_MASK	BIT(3)
+#define BD96801_INT_SHDN_ERR_MASK	BIT(7)
+#define BD96801_OUT_PVIN_ERR_MASK	BIT(0)
+#define BD96801_OUT_OVP_ERR_MASK	BIT(1)
+#define BD96801_OUT_UVP_ERR_MASK	BIT(2)
+#define BD96801_OUT_SHDN_ERR_MASK	BIT(7)
+
+/* ERRB IRQs */
+enum {
+	/* Reg 0x52, 0x53, 0x54 - ERRB system IRQs */
+	BD96801_OTP_ERR_STAT,
+	BD96801_DBIST_ERR_STAT,
+	BD96801_EEP_ERR_STAT,
+	BD96801_ABIST_ERR_STAT,
+	BD96801_PRSTB_ERR_STAT,
+	BD96801_DRMOS1_ERR_STAT,
+	BD96801_DRMOS2_ERR_STAT,
+	BD96801_SLAVE_ERR_STAT,
+	BD96801_VREF_ERR_STAT,
+	BD96801_TSD_ERR_STAT,
+	BD96801_UVLO_ERR_STAT,
+	BD96801_OVLO_ERR_STAT,
+	BD96801_OSC_ERR_STAT,
+	BD96801_PON_ERR_STAT,
+	BD96801_POFF_ERR_STAT,
+	BD96801_CMD_SHDN_ERR_STAT,
+	BD96801_INT_PRSTB_WDT_ERR,
+	BD96801_INT_CHIP_IF_ERR,
+	BD96801_INT_SHDN_ERR_STAT,
+
+	/* Reg 0x55 BUCK1 ERR IRQs */
+	BD96801_BUCK1_PVIN_ERR_STAT,
+	BD96801_BUCK1_OVP_ERR_STAT,
+	BD96801_BUCK1_UVP_ERR_STAT,
+	BD96801_BUCK1_SHDN_ERR_STAT,
+
+	/* Reg 0x56 BUCK2 ERR IRQs */
+	BD96801_BUCK2_PVIN_ERR_STAT,
+	BD96801_BUCK2_OVP_ERR_STAT,
+	BD96801_BUCK2_UVP_ERR_STAT,
+	BD96801_BUCK2_SHDN_ERR_STAT,
+
+	/* Reg 0x57 BUCK3 ERR IRQs */
+	BD96801_BUCK3_PVIN_ERR_STAT,
+	BD96801_BUCK3_OVP_ERR_STAT,
+	BD96801_BUCK3_UVP_ERR_STAT,
+	BD96801_BUCK3_SHDN_ERR_STAT,
+
+	/* Reg 0x58 BUCK4 ERR IRQs */
+	BD96801_BUCK4_PVIN_ERR_STAT,
+	BD96801_BUCK4_OVP_ERR_STAT,
+	BD96801_BUCK4_UVP_ERR_STAT,
+	BD96801_BUCK4_SHDN_ERR_STAT,
+
+	/* Reg 0x59 LDO5 ERR IRQs */
+	BD96801_LDO5_PVIN_ERR_STAT,
+	BD96801_LDO5_OVP_ERR_STAT,
+	BD96801_LDO5_UVP_ERR_STAT,
+	BD96801_LDO5_SHDN_ERR_STAT,
+
+	/* Reg 0x5a LDO6 ERR IRQs */
+	BD96801_LDO6_PVIN_ERR_STAT,
+	BD96801_LDO6_OVP_ERR_STAT,
+	BD96801_LDO6_UVP_ERR_STAT,
+	BD96801_LDO6_SHDN_ERR_STAT,
+
+	/* Reg 0x5b LDO7 ERR IRQs */
+	BD96801_LDO7_PVIN_ERR_STAT,
+	BD96801_LDO7_OVP_ERR_STAT,
+	BD96801_LDO7_UVP_ERR_STAT,
+	BD96801_LDO7_SHDN_ERR_STAT,
+};
+
+/* INTB IRQs */
+enum {
+	/* Reg 0x5c (System INTB) */
+	BD96801_TW_STAT,
+	BD96801_WDT_ERR_STAT,
+	BD96801_I2C_ERR_STAT,
+	BD96801_CHIP_IF_ERR_STAT,
+
+	/* Reg 0x5d (BUCK1 INTB) */
+	BD96801_BUCK1_OCPH_STAT,
+	BD96801_BUCK1_OCPL_STAT,
+	BD96801_BUCK1_OCPN_STAT,
+	BD96801_BUCK1_OVD_STAT,
+	BD96801_BUCK1_UVD_STAT,
+	BD96801_BUCK1_TW_CH_STAT,
+
+	/* Reg 0x5e (BUCK2 INTB) */
+	BD96801_BUCK2_OCPH_STAT,
+	BD96801_BUCK2_OCPL_STAT,
+	BD96801_BUCK2_OCPN_STAT,
+	BD96801_BUCK2_OVD_STAT,
+	BD96801_BUCK2_UVD_STAT,
+	BD96801_BUCK2_TW_CH_STAT,
+
+	/* Reg 0x5f (BUCK3 INTB)*/
+	BD96801_BUCK3_OCPH_STAT,
+	BD96801_BUCK3_OCPL_STAT,
+	BD96801_BUCK3_OCPN_STAT,
+	BD96801_BUCK3_OVD_STAT,
+	BD96801_BUCK3_UVD_STAT,
+	BD96801_BUCK3_TW_CH_STAT,
+
+	/* Reg 0x60 (BUCK4 INTB)*/
+	BD96801_BUCK4_OCPH_STAT,
+	BD96801_BUCK4_OCPL_STAT,
+	BD96801_BUCK4_OCPN_STAT,
+	BD96801_BUCK4_OVD_STAT,
+	BD96801_BUCK4_UVD_STAT,
+	BD96801_BUCK4_TW_CH_STAT,
+
+	/* Reg 0x61 (LDO5 INTB) */
+	BD96801_LDO5_OCPH_STAT, /* bit [0] */
+	BD96801_LDO5_OVD_STAT,	/* bit [3] */
+	BD96801_LDO5_UVD_STAT,  /* bit [4] */
+
+	/* Reg 0x62 (LDO6 INTB) */
+	BD96801_LDO6_OCPH_STAT, /* bit [0] */
+	BD96801_LDO6_OVD_STAT,	/* bit [3] */
+	BD96801_LDO6_UVD_STAT,  /* bit [4] */
+
+	/* Reg 0x63 (LDO7 INTB) */
+	BD96801_LDO7_OCPH_STAT, /* bit [0] */
+	BD96801_LDO7_OVD_STAT,	/* bit [3] */
+	BD96801_LDO7_UVD_STAT,  /* bit [4] */
+};
+
+/* IRQ MASKs */
+#define BD96801_TW_STAT_MASK		BIT(0)
+#define BD96801_WDT_ERR_STAT_MASK	BIT(1)
+#define BD96801_I2C_ERR_STAT_MASK	BIT(2)
+#define BD96801_CHIP_IF_ERR_STAT_MASK	BIT(3)
+
+#define BD96801_BUCK_OCPH_STAT_MASK	BIT(0)
+#define BD96801_BUCK_OCPL_STAT_MASK	BIT(1)
+#define BD96801_BUCK_OCPN_STAT_MASK	BIT(2)
+#define BD96801_BUCK_OVD_STAT_MASK	BIT(3)
+#define BD96801_BUCK_UVD_STAT_MASK	BIT(4)
+#define BD96801_BUCK_TW_CH_STAT_MASK	BIT(5)
+
+#define BD96801_LDO_OCPH_STAT_MASK	BIT(0)
+#define BD96801_LDO_OVD_STAT_MASK	BIT(3)
+#define BD96801_LDO_UVD_STAT_MASK	BIT(4)
+
+#endif
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-gene=
ric.h
index 4eeb22876bad..e7d4e6afe388 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -16,6 +16,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71828,
 	ROHM_CHIP_TYPE_BD71837,
 	ROHM_CHIP_TYPE_BD71847,
+	ROHM_CHIP_TYPE_BD96801,
 	ROHM_CHIP_TYPE_AMOUNT
 };
=20
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

--QKXzC6PSEn5XvWEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZ9GB8ACgkQeFA3/03a
ocV9lQgAupjNHko6yj0iL59+IWEcZmgPk37znVn11LWMhQ02WkBHUT6S/hN7FrtL
gIiEHXKdSFWRhonBKlVJd9XoabqOqk1DlVT1DmYu6Cwd25wt3UQPT6wJAA+z0977
FWWntTXePLPD7A/qrSHe3etO/xp3ViMk9bW4CttktzQMi0N4liXGHI1Yj1D5MfI2
JpJEiMYI0vk+tSglsrdw/JGRI0nWlDRR0jCl2z6cReLWM3M2NFPcxazGYDArLyZN
jrE8yXx2zeW6BuTbW0BJOCp6iHj6KlSRV/72ScOu458hK92JNWlJsR4k80884FZZ
QmvmwNrULrwEQNTpbWPCuyJL/0Fiew==
=J0iA
-----END PGP SIGNATURE-----

--QKXzC6PSEn5XvWEE--

