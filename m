Return-Path: <linux-watchdog+bounces-1115-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92715907803
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 18:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F29F1B23189
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 16:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D995314198E;
	Thu, 13 Jun 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol3MwQIB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A972D12D741;
	Thu, 13 Jun 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718295314; cv=none; b=py6Fkfb0D+EBCs8JdTJqYRKb5dLMWkJv/r45+vUDvo9unWgqJYxmrocQaz+LdJX3+goswJML1psQR2bzpRWizR9/g2WGQbhW0c+3idWYB0rVxR4XeK4vsMIJatoI6IjaeRgFurphz1Z/1kVh7g9rn/vB8QP8grevEamPctwciYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718295314; c=relaxed/simple;
	bh=mxz72ufUHZ7fkgp+FBvJTAgCm9Q5dZMzzKC07YccjzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fznpt1Zd92w+0XbFcFw7QD5fx6ag5n3UW0Tp9DJB/r0guXEQDQ67b0Y7mpT1rsKJZFBob/IMY6TxbL24OwxJbMIu/EadG6NwgUgCWjGkNuWHWlZ2GQjmv+K1ms20z7eQ2pzx1i17AsGKZ45bsBvKpdDDYRordIW1VbcvsA/BxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol3MwQIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62216C2BBFC;
	Thu, 13 Jun 2024 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295314;
	bh=mxz72ufUHZ7fkgp+FBvJTAgCm9Q5dZMzzKC07YccjzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol3MwQIBIMHv1m+vszYfgXKaULZ7ZaEcFm8LSZAHE2qCIvYtIjQuxavxL9t9+Mdfl
	 hDqnB7qjY+RC4FJJdMl8/PbV0+H+wbkETl4G9WxgIUoqlG5rqI1ITW90TsGL01ZxlI
	 9cXIVnHDkrzY729tFIYf5QZZkoNrHwE3aatPOsIxcnIzjQpLcnJMDEuWXWfSREJIdP
	 hzbvFU/WqCVrN21tDaLutuxBG6t00zIRvAsHTuY4iIXCYOQZZ0G7mDR9iyiyGNhYda
	 /ZR7cb0JCI1YqV2AmgZNdx0p09yFgPVZfgDELK8dlJN5oOqQiVnmZn7P+uBEp3rr96
	 0wkdYSjXJRKBQ==
Date: Thu, 13 Jun 2024 17:15:08 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 03/10] mfd: support ROHM BD96801 PMIC core
Message-ID: <20240613161508.GM2561462@google.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <97cd372d4502597bf051f0ff52f718eab9b186aa.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97cd372d4502597bf051f0ff52f718eab9b186aa.1717486682.git.mazziesaccount@gmail.com>

On Tue, 04 Jun 2024, Matti Vaittinen wrote:

> The ROHM BD96801 PMIC is highly customizable automotive grade PMIC
> which integrates regulator and watchdog funtionalities.
> 
> Provide INTB IRQ and register accesses for regulator/watchdog drivers.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Changelog:
> v2 =>:
> - No changes
> 
> v1 => v2:
> - Drop unused enum
> - Improve error prints
> - improve comments
> 
>  RFCv2 => v1:
> - drop ERRB interrupts (for now)
> - bd96801: Unlock registers in core driver
> 
> Changelog: RFCv1 => RFCv2
> - Work-around the IRQ domain name conflict
> - Add watchdog IRQ
> - Various styling fixes based on review by Lee
> ---
>  drivers/mfd/Kconfig              |  13 ++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/rohm-bd96801.c       | 273 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd96801.h | 215 ++++++++++++++++++++++++
>  include/linux/mfd/rohm-generic.h |   1 +
>  5 files changed, 503 insertions(+)
>  create mode 100644 drivers/mfd/rohm-bd96801.c
>  create mode 100644 include/linux/mfd/rohm-bd96801.h

Pretty nice.  Uses generic interfaces.  Just a couple of nits.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 266b4f54af60..68cc7af9ef97 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2089,6 +2089,19 @@ config MFD_ROHM_BD957XMUF
>  	  BD9573MUF Power Management ICs. BD9576 and BD9573 are primarily
>  	  designed to be used to power R-Car series processors.
>  
> +config MFD_ROHM_BD96801
> +	tristate "ROHM BD96801 Power Management IC"
> +	depends on I2C=y
> +	depends on OF
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	select MFD_CORE
> +	help
> +	  Select this option to get support for the ROHM BD96801 Power
> +	  Management IC. The ROHM BD96801 is a highly scalable Power Management
> +	  IC for industrial and automotive use. The BD96801 can be used as a
> +	  master PMIC in a chained PMIC solution with suitable companion PMICs.
> +
>  config MFD_STM32_LPTIMER
>  	tristate "Support for STM32 Low-Power Timer"
>  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c66f07edcd0e..e792892d4a8b 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -264,6 +264,7 @@ obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>  obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
>  obj-$(CONFIG_MFD_ROHM_BD957XMUF)	+= rohm-bd9576.o
> +obj-$(CONFIG_MFD_ROHM_BD96801)	+= rohm-bd96801.o
>  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>  obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
>  obj-$(CONFIG_MFD_ACER_A500_EC)	+= acer-ec-a500.o
> diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
> new file mode 100644
> index 000000000000..1c2a9591be7b
> --- /dev/null
> +++ b/drivers/mfd/rohm-bd96801.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 ROHM Semiconductors
> + *
> + * ROHM BD96801 PMIC driver
> + *
> + * This version of the "BD86801 scalable PMIC"'s driver supports only very
> + * basic set of the PMIC features. Most notably, there is no support for
> + * the ERRB interrupt and the configurations which should be done when the
> + * PMIC is in STBY mode.
> + *
> + * Supporting the ERRB interrupt would require dropping the regmap-IRQ
> + * usage or working around (or accepting a presense of) a naming conflict
> + * in debugFS IRQs.
> + *
> + * Being able to reliably do the configurations like changing the
> + * regulator safety limits (like limits for the over/under -voltages, over
> + * current, thermal protection) would require the configuring driver to be
> + * synchronized with entity causing the PMIC state transitions. Eg, one
> + * should be able to ensure the PMIC is in STBY state when the
> + * configurations are applied to the hardware. How and when the PMIC state
> + * transitions are to be done is likely to be very system specific, as will
> + * be the need to configure these safety limits. Hence it's not simple to
> + * come up with a generic solution.
> + *
> + * Users who require the ERRB handling and STBY state configurations can
> + * have a look at the original RFC:
> + * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.com/
> + * which implements a workaround to debugFS naming conflict and some of
> + * the safety limit configurations - but leaves the state change handling
> + * and synchronization to be implemented.
> + *
> + * It would be great to hear (and receive a patch!) if you implement the
> + * STBY configuration support or a proper fix to the debugFS naming
> + * conflict in your downstream driver ;)
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#include <linux/mfd/rohm-bd96801.h>
> +#include <linux/mfd/rohm-generic.h>

Nit: '\n'

> +static const struct resource regulator_intb_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(BD96801_TW_STAT, "bd96801-core-thermal"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OCPH_STAT, "bd96801-buck1-overcurr-h"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OCPL_STAT, "bd96801-buck1-overcurr-l"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OCPN_STAT, "bd96801-buck1-overcurr-n"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OVD_STAT, "bd96801-buck1-overvolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_UVD_STAT, "bd96801-buck1-undervolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_TW_CH_STAT, "bd96801-buck1-thermal"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OCPH_STAT, "bd96801-buck2-overcurr-h"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OCPL_STAT, "bd96801-buck2-overcurr-l"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OCPN_STAT, "bd96801-buck2-overcurr-n"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OVD_STAT, "bd96801-buck2-overvolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_UVD_STAT, "bd96801-buck2-undervolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_TW_CH_STAT, "bd96801-buck2-thermal"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OCPH_STAT, "bd96801-buck3-overcurr-h"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OCPL_STAT, "bd96801-buck3-overcurr-l"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OCPN_STAT, "bd96801-buck3-overcurr-n"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OVD_STAT, "bd96801-buck3-overvolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_UVD_STAT, "bd96801-buck3-undervolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_TW_CH_STAT, "bd96801-buck3-thermal"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OCPH_STAT, "bd96801-buck4-overcurr-h"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OCPL_STAT, "bd96801-buck4-overcurr-l"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OCPN_STAT, "bd96801-buck4-overcurr-n"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OVD_STAT, "bd96801-buck4-overvolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_UVD_STAT, "bd96801-buck4-undervolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_TW_CH_STAT, "bd96801-buck4-thermal"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_OCPH_STAT, "bd96801-ldo5-overcurr"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_OVD_STAT, "bd96801-ldo5-overvolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_UVD_STAT, "bd96801-ldo5-undervolt"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_OCPH_STAT, "bd96801-ldo6-overcurr"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_OVD_STAT, "bd96801-ldo6-overvolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_UVD_STAT, "bd96801-ldo6-undervolt"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_OCPH_STAT, "bd96801-ldo7-overcurr"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_OVD_STAT, "bd96801-ldo7-overvolt"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_UVD_STAT, "bd96801-ldo7-undervolt"),
> +};
> +
> +static const struct resource wdg_intb_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(BD96801_WDT_ERR_STAT, "bd96801-wdg"),
> +};
> +
> +static struct mfd_cell bd96801_mfd_cells[] = {

This is an MFD driver, you can drop the 'mfd_' part.

> +	{
> +		.name = "bd96801-wdt",
> +		.resources = wdg_intb_irqs,
> +		.num_resources = ARRAY_SIZE(wdg_intb_irqs),
> +	}, {
> +		.name = "bd96801-pmic",

I thought this was the PMIC?

What is this device?  Regulators?

"bd96801-regulator"?

> +		.resources = regulator_intb_irqs,
> +		.num_resources = ARRAY_SIZE(regulator_intb_irqs),
> +	},
> +};
> +
> +static const struct regmap_range bd96801_volatile_ranges[] = {
> +	/* Status registers */
> +	regmap_reg_range(BD96801_REG_WD_FEED, BD96801_REG_WD_FAILCOUNT),
> +	regmap_reg_range(BD96801_REG_WD_ASK, BD96801_REG_WD_ASK),
> +	regmap_reg_range(BD96801_REG_WD_STATUS, BD96801_REG_WD_STATUS),
> +	regmap_reg_range(BD96801_REG_PMIC_STATE, BD96801_REG_INT_LDO7_INTB),
> +	/* Registers which do not update value unless PMIC is in STBY */
> +	regmap_reg_range(BD96801_REG_SSCG_CTRL, BD96801_REG_SHD_INTB),
> +	regmap_reg_range(BD96801_REG_BUCK_OVP, BD96801_REG_BOOT_OVERTIME),
> +	/*
> +	 * LDO control registers have single bit (LDO MODE) which does not
> +	 * change when we write it unless PMIC is in STBY. It's safer to not
> +	 * cache it.
> +	 */
> +	regmap_reg_range(BD96801_LDO5_VOL_LVL_REG, BD96801_LDO7_VOL_LVL_REG),
> +};
> +
> +static const struct regmap_access_table volatile_regs = {
> +	.yes_ranges = bd96801_volatile_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(bd96801_volatile_ranges),
> +};
> +
> +static const struct regmap_irq bd96801_intb_irqs[] = {
> +	/* STATUS SYSTEM INTB */
> +	REGMAP_IRQ_REG(BD96801_TW_STAT, 0, BD96801_TW_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_WDT_ERR_STAT, 0, BD96801_WDT_ERR_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_I2C_ERR_STAT, 0, BD96801_I2C_ERR_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_CHIP_IF_ERR_STAT, 0, BD96801_CHIP_IF_ERR_STAT_MASK),
> +	/* STATUS BUCK1 INTB */
> +	REGMAP_IRQ_REG(BD96801_BUCK1_OCPH_STAT, 1, BD96801_BUCK_OCPH_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_OCPL_STAT, 1, BD96801_BUCK_OCPL_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_OCPN_STAT, 1, BD96801_BUCK_OCPN_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_OVD_STAT, 1, BD96801_BUCK_OVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_UVD_STAT, 1, BD96801_BUCK_UVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_TW_CH_STAT, 1, BD96801_BUCK_TW_CH_STAT_MASK),
> +	/* BUCK 2 INTB */
> +	REGMAP_IRQ_REG(BD96801_BUCK2_OCPH_STAT, 2, BD96801_BUCK_OCPH_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_OCPL_STAT, 2, BD96801_BUCK_OCPL_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_OCPN_STAT, 2, BD96801_BUCK_OCPN_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_OVD_STAT, 2, BD96801_BUCK_OVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_UVD_STAT, 2, BD96801_BUCK_UVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_TW_CH_STAT, 2, BD96801_BUCK_TW_CH_STAT_MASK),
> +	/* BUCK 3 INTB */
> +	REGMAP_IRQ_REG(BD96801_BUCK3_OCPH_STAT, 3, BD96801_BUCK_OCPH_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_OCPL_STAT, 3, BD96801_BUCK_OCPL_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_OCPN_STAT, 3, BD96801_BUCK_OCPN_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_OVD_STAT, 3, BD96801_BUCK_OVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_UVD_STAT, 3, BD96801_BUCK_UVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_TW_CH_STAT, 3, BD96801_BUCK_TW_CH_STAT_MASK),
> +	/* BUCK 4 INTB */
> +	REGMAP_IRQ_REG(BD96801_BUCK4_OCPH_STAT, 4, BD96801_BUCK_OCPH_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_OCPL_STAT, 4, BD96801_BUCK_OCPL_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_OCPN_STAT, 4, BD96801_BUCK_OCPN_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_OVD_STAT, 4, BD96801_BUCK_OVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_UVD_STAT, 4, BD96801_BUCK_UVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_TW_CH_STAT, 4, BD96801_BUCK_TW_CH_STAT_MASK),
> +	/* LDO5 INTB */
> +	REGMAP_IRQ_REG(BD96801_LDO5_OCPH_STAT, 5, BD96801_LDO_OCPH_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO5_OVD_STAT, 5, BD96801_LDO_OVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO5_UVD_STAT, 5, BD96801_LDO_UVD_STAT_MASK),
> +	/* LDO6 INTB */
> +	REGMAP_IRQ_REG(BD96801_LDO6_OCPH_STAT, 6, BD96801_LDO_OCPH_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO6_OVD_STAT, 6, BD96801_LDO_OVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO6_UVD_STAT, 6, BD96801_LDO_UVD_STAT_MASK),
> +	/* LDO7 INTB */
> +	REGMAP_IRQ_REG(BD96801_LDO7_OCPH_STAT, 7, BD96801_LDO_OCPH_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO7_OVD_STAT, 7, BD96801_LDO_OVD_STAT_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO7_UVD_STAT, 7, BD96801_LDO_UVD_STAT_MASK),
> +};
> +
> +static struct regmap_irq_chip bd96801_irq_chip_intb = {
> +	.name = "bd96801-irq-intb",
> +	.main_status = BD96801_REG_INT_MAIN,
> +	.num_main_regs = 1,
> +	.irqs = &bd96801_intb_irqs[0],
> +	.num_irqs = ARRAY_SIZE(bd96801_intb_irqs),
> +	.status_base = BD96801_REG_INT_SYS_INTB,
> +	.mask_base = BD96801_REG_MASK_SYS_INTB,
> +	.ack_base = BD96801_REG_INT_SYS_INTB,
> +	.init_ack_masked = true,
> +	.num_regs = 8,
> +	.irq_reg_stride = 1,
> +};
> +
> +static const struct regmap_config bd96801_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.volatile_table = &volatile_regs,
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +static int bd96801_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct regmap_irq_chip_data *intb_irq_data;
> +	const struct fwnode_handle *fwnode;
> +	struct irq_domain *intb_domain;
> +	struct regmap *regmap;
> +	int ret, intb_irq;
> +
> +	fwnode = dev_fwnode(&i2c->dev);
> +	if (!fwnode)
> +		return dev_err_probe(&i2c->dev, -EINVAL, "Failed to find fwnode\n");
> +
> +	intb_irq = fwnode_irq_get_byname(fwnode, "intb");
> +	if (intb_irq < 0)
> +		return dev_err_probe(&i2c->dev, intb_irq, "INTB IRQ not configured\n");
> +
> +	regmap = devm_regmap_init_i2c(i2c, &bd96801_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
> +				    "Regmap initialization failed\n");
> +
> +	ret = regmap_write(regmap, BD96801_LOCK_REG, BD96801_UNLOCK);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret, "Failed to unlock PMIC\n");
> +
> +	ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, intb_irq,
> +				       IRQF_ONESHOT, 0, &bd96801_irq_chip_intb,
> +				       &intb_irq_data);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret, "Failed to add INTB IRQ chip\n");
> +
> +	intb_domain = regmap_irq_get_domain(intb_irq_data);
> +
> +	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> +				   bd96801_mfd_cells,
> +				   ARRAY_SIZE(bd96801_mfd_cells), NULL, 0,
> +				   intb_domain);
> +

Remove this line.

> +	if (ret)
> +		dev_err(&i2c->dev, "Failed to create subdevices\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id bd96801_of_match[] = {
> +	{ .compatible = "rohm,bd96801",	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bd96801_of_match);
> +
> +static struct i2c_driver bd96801_i2c_driver = {
> +	.driver = {
> +		.name = "rohm-bd96801",
> +		.of_match_table = bd96801_of_match,
> +	},
> +	.probe = bd96801_i2c_probe,
> +};
> +
> +static int __init bd96801_i2c_init(void)
> +{
> +	return i2c_add_driver(&bd96801_i2c_driver);
> +}
> +
> +/* Initialise early so consumer devices can complete system boot */
> +subsys_initcall(bd96801_i2c_init);
> +
> +static void __exit bd96801_i2c_exit(void)
> +{
> +	i2c_del_driver(&bd96801_i2c_driver);
> +}
> +module_exit(bd96801_i2c_exit);
> +
> +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
> +MODULE_DESCRIPTION("ROHM BD96801 Power Management IC driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/rohm-bd96801.h b/include/linux/mfd/rohm-bd96801.h
> new file mode 100644
> index 000000000000..e2d9e10b6364
> --- /dev/null
> +++ b/include/linux/mfd/rohm-bd96801.h
> @@ -0,0 +1,215 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (C) 2024 ROHM Semiconductors */
> +
> +#ifndef __MFD_BD96801_H__
> +#define __MFD_BD96801_H__
> +
> +#define BD96801_REG_SSCG_CTRL		0x09
> +#define BD96801_REG_SHD_INTB            0x20
> +#define BD96801_LDO5_VOL_LVL_REG	0x2c
> +#define BD96801_LDO6_VOL_LVL_REG	0x2d
> +#define BD96801_LDO7_VOL_LVL_REG	0x2e
> +#define BD96801_REG_BUCK_OVP		0x30
> +#define BD96801_REG_BUCK_OVD		0x35
> +#define BD96801_REG_LDO_OVP		0x31
> +#define BD96801_REG_LDO_OVD		0x36
> +#define BD96801_REG_BOOT_OVERTIME	0x3a
> +#define BD96801_REG_WD_TMO		0x40
> +#define BD96801_REG_WD_CONF		0x41
> +#define BD96801_REG_WD_FEED		0x42
> +#define BD96801_REG_WD_FAILCOUNT	0x43
> +#define BD96801_REG_WD_ASK		0x46
> +#define BD96801_REG_WD_STATUS		0x4a
> +#define BD96801_REG_PMIC_STATE		0x4f
> +#define BD96801_REG_EXT_STATE		0x50
> +
> +#define BD96801_STATE_STBY		0x09
> +
> +#define BD96801_LOCK_REG		0x04
> +#define BD96801_UNLOCK			0x9d
> +#define BD96801_LOCK			0x00
> +
> +/* IRQ register area */
> +#define BD96801_REG_INT_MAIN		0x51
> +
> +/*
> + * The BD96801 has two physical IRQ lines, INTB and ERRB.
> + *
> + * The 'main status register' is located at 0x51.
> + * The ERRB status registers are located at 0x52 ... 0x5B
> + * INTB status registers are at range 0x5c ... 0x63
> + */
> +#define BD96801_REG_INT_SYS_ERRB1	0x52
> +#define BD96801_REG_INT_SYS_INTB	0x5c
> +#define BD96801_REG_INT_LDO7_INTB	0x63
> +
> +/* MASK registers */
> +#define BD96801_REG_MASK_SYS_INTB	0x73
> +#define BD96801_REG_MASK_SYS_ERRB	0x69
> +
> +#define BD96801_MAX_REGISTER		0x7a
> +
> +#define BD96801_OTP_ERR_MASK		BIT(0)
> +#define BD96801_DBIST_ERR_MASK		BIT(1)
> +#define BD96801_EEP_ERR_MASK		BIT(2)
> +#define BD96801_ABIST_ERR_MASK		BIT(3)
> +#define BD96801_PRSTB_ERR_MASK		BIT(4)
> +#define BD96801_DRMOS1_ERR_MASK		BIT(5)
> +#define BD96801_DRMOS2_ERR_MASK		BIT(6)
> +#define BD96801_SLAVE_ERR_MASK		BIT(7)
> +#define BD96801_VREF_ERR_MASK		BIT(0)
> +#define BD96801_TSD_ERR_MASK		BIT(1)
> +#define BD96801_UVLO_ERR_MASK		BIT(2)
> +#define BD96801_OVLO_ERR_MASK		BIT(3)
> +#define BD96801_OSC_ERR_MASK		BIT(4)
> +#define BD96801_PON_ERR_MASK		BIT(5)
> +#define BD96801_POFF_ERR_MASK		BIT(6)
> +#define BD96801_CMD_SHDN_ERR_MASK	BIT(7)
> +#define BD96801_INT_PRSTB_WDT_ERR_MASK	BIT(0)
> +#define BD96801_INT_CHIP_IF_ERR_MASK	BIT(3)
> +#define BD96801_INT_SHDN_ERR_MASK	BIT(7)
> +#define BD96801_OUT_PVIN_ERR_MASK	BIT(0)
> +#define BD96801_OUT_OVP_ERR_MASK	BIT(1)
> +#define BD96801_OUT_UVP_ERR_MASK	BIT(2)
> +#define BD96801_OUT_SHDN_ERR_MASK	BIT(7)
> +
> +/* ERRB IRQs */
> +enum {
> +	/* Reg 0x52, 0x53, 0x54 - ERRB system IRQs */
> +	BD96801_OTP_ERR_STAT,
> +	BD96801_DBIST_ERR_STAT,
> +	BD96801_EEP_ERR_STAT,
> +	BD96801_ABIST_ERR_STAT,
> +	BD96801_PRSTB_ERR_STAT,
> +	BD96801_DRMOS1_ERR_STAT,
> +	BD96801_DRMOS2_ERR_STAT,
> +	BD96801_SLAVE_ERR_STAT,
> +	BD96801_VREF_ERR_STAT,
> +	BD96801_TSD_ERR_STAT,
> +	BD96801_UVLO_ERR_STAT,
> +	BD96801_OVLO_ERR_STAT,
> +	BD96801_OSC_ERR_STAT,
> +	BD96801_PON_ERR_STAT,
> +	BD96801_POFF_ERR_STAT,
> +	BD96801_CMD_SHDN_ERR_STAT,
> +	BD96801_INT_PRSTB_WDT_ERR,
> +	BD96801_INT_CHIP_IF_ERR,
> +	BD96801_INT_SHDN_ERR_STAT,
> +
> +	/* Reg 0x55 BUCK1 ERR IRQs */
> +	BD96801_BUCK1_PVIN_ERR_STAT,
> +	BD96801_BUCK1_OVP_ERR_STAT,
> +	BD96801_BUCK1_UVP_ERR_STAT,
> +	BD96801_BUCK1_SHDN_ERR_STAT,
> +
> +	/* Reg 0x56 BUCK2 ERR IRQs */
> +	BD96801_BUCK2_PVIN_ERR_STAT,
> +	BD96801_BUCK2_OVP_ERR_STAT,
> +	BD96801_BUCK2_UVP_ERR_STAT,
> +	BD96801_BUCK2_SHDN_ERR_STAT,
> +
> +	/* Reg 0x57 BUCK3 ERR IRQs */
> +	BD96801_BUCK3_PVIN_ERR_STAT,
> +	BD96801_BUCK3_OVP_ERR_STAT,
> +	BD96801_BUCK3_UVP_ERR_STAT,
> +	BD96801_BUCK3_SHDN_ERR_STAT,
> +
> +	/* Reg 0x58 BUCK4 ERR IRQs */
> +	BD96801_BUCK4_PVIN_ERR_STAT,
> +	BD96801_BUCK4_OVP_ERR_STAT,
> +	BD96801_BUCK4_UVP_ERR_STAT,
> +	BD96801_BUCK4_SHDN_ERR_STAT,
> +
> +	/* Reg 0x59 LDO5 ERR IRQs */
> +	BD96801_LDO5_PVIN_ERR_STAT,
> +	BD96801_LDO5_OVP_ERR_STAT,
> +	BD96801_LDO5_UVP_ERR_STAT,
> +	BD96801_LDO5_SHDN_ERR_STAT,
> +
> +	/* Reg 0x5a LDO6 ERR IRQs */
> +	BD96801_LDO6_PVIN_ERR_STAT,
> +	BD96801_LDO6_OVP_ERR_STAT,
> +	BD96801_LDO6_UVP_ERR_STAT,
> +	BD96801_LDO6_SHDN_ERR_STAT,
> +
> +	/* Reg 0x5b LDO7 ERR IRQs */
> +	BD96801_LDO7_PVIN_ERR_STAT,
> +	BD96801_LDO7_OVP_ERR_STAT,
> +	BD96801_LDO7_UVP_ERR_STAT,
> +	BD96801_LDO7_SHDN_ERR_STAT,
> +};
> +
> +/* INTB IRQs */
> +enum {
> +	/* Reg 0x5c (System INTB) */
> +	BD96801_TW_STAT,
> +	BD96801_WDT_ERR_STAT,
> +	BD96801_I2C_ERR_STAT,
> +	BD96801_CHIP_IF_ERR_STAT,
> +
> +	/* Reg 0x5d (BUCK1 INTB) */
> +	BD96801_BUCK1_OCPH_STAT,
> +	BD96801_BUCK1_OCPL_STAT,
> +	BD96801_BUCK1_OCPN_STAT,
> +	BD96801_BUCK1_OVD_STAT,
> +	BD96801_BUCK1_UVD_STAT,
> +	BD96801_BUCK1_TW_CH_STAT,
> +
> +	/* Reg 0x5e (BUCK2 INTB) */
> +	BD96801_BUCK2_OCPH_STAT,
> +	BD96801_BUCK2_OCPL_STAT,
> +	BD96801_BUCK2_OCPN_STAT,
> +	BD96801_BUCK2_OVD_STAT,
> +	BD96801_BUCK2_UVD_STAT,
> +	BD96801_BUCK2_TW_CH_STAT,
> +
> +	/* Reg 0x5f (BUCK3 INTB)*/
> +	BD96801_BUCK3_OCPH_STAT,
> +	BD96801_BUCK3_OCPL_STAT,
> +	BD96801_BUCK3_OCPN_STAT,
> +	BD96801_BUCK3_OVD_STAT,
> +	BD96801_BUCK3_UVD_STAT,
> +	BD96801_BUCK3_TW_CH_STAT,
> +
> +	/* Reg 0x60 (BUCK4 INTB)*/
> +	BD96801_BUCK4_OCPH_STAT,
> +	BD96801_BUCK4_OCPL_STAT,
> +	BD96801_BUCK4_OCPN_STAT,
> +	BD96801_BUCK4_OVD_STAT,
> +	BD96801_BUCK4_UVD_STAT,
> +	BD96801_BUCK4_TW_CH_STAT,
> +
> +	/* Reg 0x61 (LDO5 INTB) */
> +	BD96801_LDO5_OCPH_STAT, /* bit [0] */
> +	BD96801_LDO5_OVD_STAT,	/* bit [3] */
> +	BD96801_LDO5_UVD_STAT,  /* bit [4] */
> +
> +	/* Reg 0x62 (LDO6 INTB) */
> +	BD96801_LDO6_OCPH_STAT, /* bit [0] */
> +	BD96801_LDO6_OVD_STAT,	/* bit [3] */
> +	BD96801_LDO6_UVD_STAT,  /* bit [4] */
> +
> +	/* Reg 0x63 (LDO7 INTB) */
> +	BD96801_LDO7_OCPH_STAT, /* bit [0] */
> +	BD96801_LDO7_OVD_STAT,	/* bit [3] */
> +	BD96801_LDO7_UVD_STAT,  /* bit [4] */
> +};
> +
> +/* IRQ MASKs */
> +#define BD96801_TW_STAT_MASK		BIT(0)
> +#define BD96801_WDT_ERR_STAT_MASK	BIT(1)
> +#define BD96801_I2C_ERR_STAT_MASK	BIT(2)
> +#define BD96801_CHIP_IF_ERR_STAT_MASK	BIT(3)
> +
> +#define BD96801_BUCK_OCPH_STAT_MASK	BIT(0)
> +#define BD96801_BUCK_OCPL_STAT_MASK	BIT(1)
> +#define BD96801_BUCK_OCPN_STAT_MASK	BIT(2)
> +#define BD96801_BUCK_OVD_STAT_MASK	BIT(3)
> +#define BD96801_BUCK_UVD_STAT_MASK	BIT(4)
> +#define BD96801_BUCK_TW_CH_STAT_MASK	BIT(5)
> +
> +#define BD96801_LDO_OCPH_STAT_MASK	BIT(0)
> +#define BD96801_LDO_OVD_STAT_MASK	BIT(3)
> +#define BD96801_LDO_UVD_STAT_MASK	BIT(4)
> +
> +#endif
> diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
> index 4eeb22876bad..e7d4e6afe388 100644
> --- a/include/linux/mfd/rohm-generic.h
> +++ b/include/linux/mfd/rohm-generic.h
> @@ -16,6 +16,7 @@ enum rohm_chip_type {
>  	ROHM_CHIP_TYPE_BD71828,
>  	ROHM_CHIP_TYPE_BD71837,
>  	ROHM_CHIP_TYPE_BD71847,
> +	ROHM_CHIP_TYPE_BD96801,
>  	ROHM_CHIP_TYPE_AMOUNT
>  };
>  
> -- 
> 2.45.1
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 



-- 
Lee Jones [李琼斯]

