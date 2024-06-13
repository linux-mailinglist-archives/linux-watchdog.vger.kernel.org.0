Return-Path: <linux-watchdog+bounces-1116-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5C907851
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 18:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39381C22B68
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 16:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8062A1304B0;
	Thu, 13 Jun 2024 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1q2mdt9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5399E2C80;
	Thu, 13 Jun 2024 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296375; cv=none; b=DRGz6BZr/KjKHdCeW2h0XATCRV6WK/1dw+tVINN6+bmoy/vddzIql0+IsBXMdHWK2jGh2LCVnQZa41fH06J4Tqb/bcBkeTshQekV5mmWHvBwPmx56IB3zn5SxX9/lEhIzvJ1QIDf1tI3lOseZve+5d95qRO7iYDmTNf9O4o5Au4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296375; c=relaxed/simple;
	bh=y6bqzCoXFcm6MnEWG/wY9Xc1KuAhyDEFnAu1QFHv5L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALZJesSrKZ3oSuN46UVYXhh5um3W1FECUsKuLEzU8Ni3kAu6bZxz9H1xjoTgPY6ZN74ZE0ZWobXDyb07yATK/Bctbwvus/F656xB1RcVHiAZmRy0caEeeOBiAx1RnqU5NAXBT50qKL2vilLudeoIN/uOPEhcAfkrzMw2sbpSSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1q2mdt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAC6C2BBFC;
	Thu, 13 Jun 2024 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718296374;
	bh=y6bqzCoXFcm6MnEWG/wY9Xc1KuAhyDEFnAu1QFHv5L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1q2mdt9FFVBq7IhuCkodOzBISsBtbW84vTwEtXk3YY6WnBet9jFO+4mSMs86oXGj
	 shqSI9s2gIeMKoQvwB4OQCL77tnRFZvfUrb2hyeWElcsAb69VwiYrqY/YTpL1vtPbu
	 UWBf8qkVvkGdYjIxFn6qkwt17rIjRXGqNkfgJBiwzp1d27LmtK55n/+5pB74wesa8+
	 yqDezh42XDIV4Hz3V7YlBts0CEkpKjDJIQgF6M9m51TOIm0g7FGYEAM0An1G1STpQS
	 QiN7gb/hEb706Y550e8ErwysTGs6qkYxD0e3zS7s0kOh7jT2r7dAjnfmlr4nUQGK9g
	 RjqYKGf4ayMZQ==
Date: Thu, 13 Jun 2024 17:32:49 +0100
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
Subject: Re: [PATCH v3 09/10] mfd: bd96801: Add ERRB IRQ
Message-ID: <20240613163249.GN2561462@google.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <332a2d2429e2ba3c96afd28c1ccc18efc38e1fd3.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <332a2d2429e2ba3c96afd28c1ccc18efc38e1fd3.1717486682.git.mazziesaccount@gmail.com>

On Tue, 04 Jun 2024, Matti Vaittinen wrote:

> The ROHM BD96801 "scalable PMIC" provides two physical IRQs. The ERRB
> handling can in many cases be omitted because it is used to inform fatal
> IRQs, which usually kill the power from the SOC.
> 
> There may however be use-cases where the SOC has a 'back-up' emergency
> power source which allows some very short time of operation to try to
> gracefully shut down sensitive hardware. Furthermore, it is possible the
> processor controlling the PMIC is not powered by the PMIC. In such cases
> handling the ERRB IRQs may be beneficial.
> 
> Add support for ERRB IRQs.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
> Revision history:
> v2 =>:
> 	- No changes
> v1 => v2:
> 	- New patch
> ---
>  drivers/mfd/rohm-bd96801.c | 291 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 253 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
> index 1c2a9591be7b..b7f073318873 100644
> --- a/drivers/mfd/rohm-bd96801.c
> +++ b/drivers/mfd/rohm-bd96801.c
> @@ -5,13 +5,9 @@
>   * ROHM BD96801 PMIC driver
>   *
>   * This version of the "BD86801 scalable PMIC"'s driver supports only very
> - * basic set of the PMIC features. Most notably, there is no support for
> - * the ERRB interrupt and the configurations which should be done when the
> - * PMIC is in STBY mode.
> - *
> - * Supporting the ERRB interrupt would require dropping the regmap-IRQ
> - * usage or working around (or accepting a presense of) a naming conflict
> - * in debugFS IRQs.

Why bother adding all that blurb in the first place?

> + * basic set of the PMIC features.
> + * Most notably, there is no support for the configurations which should
> + * be done when the PMIC is in STBY mode.
>   *
>   * Being able to reliably do the configurations like changing the
>   * regulator safety limits (like limits for the over/under -voltages, over
> @@ -23,16 +19,14 @@
>   * be the need to configure these safety limits. Hence it's not simple to
>   * come up with a generic solution.
>   *
> - * Users who require the ERRB handling and STBY state configurations can
> - * have a look at the original RFC:
> + * Users who require the STBY state configurations can  have a look at the
> + * original RFC:
>   * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.com/
> - * which implements a workaround to debugFS naming conflict and some of
> - * the safety limit configurations - but leaves the state change handling
> - * and synchronization to be implemented.
> + * which implements some of the safety limit configurations - but leaves the
> + * state change handling and synchronization to be implemented.
>   *
>   * It would be great to hear (and receive a patch!) if you implement the
> - * STBY configuration support or a proper fix to the debugFS naming
> - * conflict in your downstream driver ;)
> + * STBY configuration support or a proper fix in your downstream driver ;)
>   */
>  
>  #include <linux/i2c.h>
> @@ -45,6 +39,65 @@
>  
>  #include <linux/mfd/rohm-bd96801.h>
>  #include <linux/mfd/rohm-generic.h>
> +
> +static const struct resource regulator_errb_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(BD96801_OTP_ERR_STAT, "bd96801-otp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_DBIST_ERR_STAT, "bd96801-dbist-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_EEP_ERR_STAT, "bd96801-eep-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_ABIST_ERR_STAT, "bd96801-abist-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_PRSTB_ERR_STAT, "bd96801-prstb-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_DRMOS1_ERR_STAT, "bd96801-drmoserr1"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_DRMOS2_ERR_STAT, "bd96801-drmoserr2"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_SLAVE_ERR_STAT, "bd96801-slave-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_VREF_ERR_STAT, "bd96801-vref-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_TSD_ERR_STAT, "bd96801-tsd"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_UVLO_ERR_STAT, "bd96801-uvlo-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_OVLO_ERR_STAT, "bd96801-ovlo-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_OSC_ERR_STAT, "bd96801-osc-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_PON_ERR_STAT, "bd96801-pon-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_POFF_ERR_STAT, "bd96801-poff-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_CMD_SHDN_ERR_STAT, "bd96801-cmd-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_INT_PRSTB_WDT_ERR, "bd96801-prstb-wdt-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_INT_CHIP_IF_ERR, "bd96801-chip-if-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_INT_SHDN_ERR_STAT, "bd96801-int-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_PVIN_ERR_STAT, "bd96801-buck1-pvin-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OVP_ERR_STAT, "bd96801-buck1-ovp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_UVP_ERR_STAT, "bd96801-buck1-uvp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_SHDN_ERR_STAT, "bd96801-buck1-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_PVIN_ERR_STAT, "bd96801-buck2-pvin-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OVP_ERR_STAT, "bd96801-buck2-ovp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_UVP_ERR_STAT, "bd96801-buck2-uvp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_SHDN_ERR_STAT, "bd96801-buck2-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_PVIN_ERR_STAT, "bd96801-buck3-pvin-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OVP_ERR_STAT, "bd96801-buck3-ovp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_UVP_ERR_STAT, "bd96801-buck3-uvp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_SHDN_ERR_STAT, "bd96801-buck3-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_PVIN_ERR_STAT, "bd96801-buck4-pvin-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OVP_ERR_STAT, "bd96801-buck4-ovp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_UVP_ERR_STAT, "bd96801-buck4-uvp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_SHDN_ERR_STAT, "bd96801-buck4-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_PVIN_ERR_STAT, "bd96801-ldo5-pvin-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_OVP_ERR_STAT, "bd96801-ldo5-ovp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_UVP_ERR_STAT, "bd96801-ldo5-uvp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_SHDN_ERR_STAT, "bd96801-ldo5-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_PVIN_ERR_STAT, "bd96801-ldo6-pvin-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_OVP_ERR_STAT, "bd96801-ldo6-ovp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_UVP_ERR_STAT, "bd96801-ldo6-uvp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_SHDN_ERR_STAT, "bd96801-ldo6-shdn-err"),
> +
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_PVIN_ERR_STAT, "bd96801-ldo7-pvin-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_OVP_ERR_STAT, "bd96801-ldo7-ovp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_UVP_ERR_STAT, "bd96801-ldo7-uvp-err"),
> +	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_SHDN_ERR_STAT, "bd96801-ldo7-shdn-err"),
> +};
> +
>  static const struct resource regulator_intb_irqs[] = {
>  	DEFINE_RES_IRQ_NAMED(BD96801_TW_STAT, "bd96801-core-thermal"),
>  
> @@ -89,20 +142,14 @@ static const struct resource regulator_intb_irqs[] = {
>  	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_UVD_STAT, "bd96801-ldo7-undervolt"),
>  };
>  
> -static const struct resource wdg_intb_irqs[] = {
> -	DEFINE_RES_IRQ_NAMED(BD96801_WDT_ERR_STAT, "bd96801-wdg"),
> +enum {
> +	WDG_CELL = 0,
> +	REGULATOR_CELL,
>  };
>  
>  static struct mfd_cell bd96801_mfd_cells[] = {
> -	{
> -		.name = "bd96801-wdt",
> -		.resources = wdg_intb_irqs,
> -		.num_resources = ARRAY_SIZE(wdg_intb_irqs),
> -	}, {
> -		.name = "bd96801-pmic",
> -		.resources = regulator_intb_irqs,
> -		.num_resources = ARRAY_SIZE(regulator_intb_irqs),
> -	},
> +	[WDG_CELL] = { .name = "bd96801-wdt", },
> +	[REGULATOR_CELL] = { .name = "bd96801-pmic", },
>  };
>  
>  static const struct regmap_range bd96801_volatile_ranges[] = {
> @@ -127,6 +174,91 @@ static const struct regmap_access_table volatile_regs = {
>  	.n_yes_ranges = ARRAY_SIZE(bd96801_volatile_ranges),
>  };
>  
> +/*
> + * For ERRB we need main register bit mapping as bit(0) indicates active IRQ
> + * in one of the first 3 sub IRQ registers, For INTB we can use default 1 to 1
> + * mapping.
> + */
> +static unsigned int bit0_offsets[] = {0, 1, 2};	/* System stat, 3 registers */
> +static unsigned int bit1_offsets[] = {3};	/* Buck 1 stat */
> +static unsigned int bit2_offsets[] = {4};	/* Buck 2 stat */
> +static unsigned int bit3_offsets[] = {5};	/* Buck 3 stat */
> +static unsigned int bit4_offsets[] = {6};	/* Buck 4 stat */
> +static unsigned int bit5_offsets[] = {7};	/* LDO 5 stat */
> +static unsigned int bit6_offsets[] = {8};	/* LDO 6 stat */
> +static unsigned int bit7_offsets[] = {9};	/* LDO 7 stat */
> +
> +static struct regmap_irq_sub_irq_map errb_sub_irq_offsets[] = {
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit3_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit4_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit5_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit6_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
> +};
> +
> +static const struct regmap_irq bd96801_errb_irqs[] = {
> +	/* Reg 0x52 Fatal ERRB1 */
> +	REGMAP_IRQ_REG(BD96801_OTP_ERR_STAT, 0, BD96801_OTP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_DBIST_ERR_STAT, 0, BD96801_DBIST_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_EEP_ERR_STAT, 0, BD96801_EEP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_ABIST_ERR_STAT, 0, BD96801_ABIST_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_PRSTB_ERR_STAT, 0, BD96801_PRSTB_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_DRMOS1_ERR_STAT, 0, BD96801_DRMOS1_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_DRMOS2_ERR_STAT, 0, BD96801_DRMOS2_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_SLAVE_ERR_STAT, 0, BD96801_SLAVE_ERR_MASK),
> +	/* 0x53 Fatal ERRB2 */
> +	REGMAP_IRQ_REG(BD96801_VREF_ERR_STAT, 1, BD96801_VREF_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_TSD_ERR_STAT, 1, BD96801_TSD_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_UVLO_ERR_STAT, 1, BD96801_UVLO_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_OVLO_ERR_STAT, 1, BD96801_OVLO_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_OSC_ERR_STAT, 1, BD96801_OSC_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_PON_ERR_STAT, 1, BD96801_PON_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_POFF_ERR_STAT, 1, BD96801_POFF_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_CMD_SHDN_ERR_STAT, 1, BD96801_CMD_SHDN_ERR_MASK),
> +	/* 0x54 Fatal INTB shadowed to ERRB */
> +	REGMAP_IRQ_REG(BD96801_INT_PRSTB_WDT_ERR, 2, BD96801_INT_PRSTB_WDT_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_INT_CHIP_IF_ERR, 2, BD96801_INT_CHIP_IF_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_INT_SHDN_ERR_STAT, 2, BD96801_INT_SHDN_ERR_MASK),
> +	/* Reg 0x55 BUCK1 ERR IRQs */
> +	REGMAP_IRQ_REG(BD96801_BUCK1_PVIN_ERR_STAT, 3, BD96801_OUT_PVIN_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_OVP_ERR_STAT, 3, BD96801_OUT_OVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_UVP_ERR_STAT, 3, BD96801_OUT_UVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK1_SHDN_ERR_STAT, 3, BD96801_OUT_SHDN_ERR_MASK),
> +	/* Reg 0x56 BUCK2 ERR IRQs */
> +	REGMAP_IRQ_REG(BD96801_BUCK2_PVIN_ERR_STAT, 4, BD96801_OUT_PVIN_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_OVP_ERR_STAT, 4, BD96801_OUT_OVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_UVP_ERR_STAT, 4, BD96801_OUT_UVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK2_SHDN_ERR_STAT, 4, BD96801_OUT_SHDN_ERR_MASK),
> +	/* Reg 0x57 BUCK3 ERR IRQs */
> +	REGMAP_IRQ_REG(BD96801_BUCK3_PVIN_ERR_STAT, 5, BD96801_OUT_PVIN_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_OVP_ERR_STAT, 5, BD96801_OUT_OVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_UVP_ERR_STAT, 5, BD96801_OUT_UVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK3_SHDN_ERR_STAT, 5, BD96801_OUT_SHDN_ERR_MASK),
> +	/* Reg 0x58 BUCK4 ERR IRQs */
> +	REGMAP_IRQ_REG(BD96801_BUCK4_PVIN_ERR_STAT, 6, BD96801_OUT_PVIN_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_OVP_ERR_STAT, 6, BD96801_OUT_OVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_UVP_ERR_STAT, 6, BD96801_OUT_UVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_BUCK4_SHDN_ERR_STAT, 6, BD96801_OUT_SHDN_ERR_MASK),
> +	/* Reg 0x59 LDO5 ERR IRQs */
> +	REGMAP_IRQ_REG(BD96801_LDO5_PVIN_ERR_STAT, 7, BD96801_OUT_PVIN_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO5_OVP_ERR_STAT, 7, BD96801_OUT_OVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO5_UVP_ERR_STAT, 7, BD96801_OUT_UVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO5_SHDN_ERR_STAT, 7, BD96801_OUT_SHDN_ERR_MASK),
> +	/* Reg 0x5a LDO6 ERR IRQs */
> +	REGMAP_IRQ_REG(BD96801_LDO6_PVIN_ERR_STAT, 8, BD96801_OUT_PVIN_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO6_OVP_ERR_STAT, 8, BD96801_OUT_OVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO6_UVP_ERR_STAT, 8, BD96801_OUT_UVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO6_SHDN_ERR_STAT, 8, BD96801_OUT_SHDN_ERR_MASK),
> +	/* Reg 0x5b LDO7 ERR IRQs */
> +	REGMAP_IRQ_REG(BD96801_LDO7_PVIN_ERR_STAT, 9, BD96801_OUT_PVIN_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO7_OVP_ERR_STAT, 9, BD96801_OUT_OVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO7_UVP_ERR_STAT, 9, BD96801_OUT_UVP_ERR_MASK),
> +	REGMAP_IRQ_REG(BD96801_LDO7_SHDN_ERR_STAT, 9, BD96801_OUT_SHDN_ERR_MASK),
> +};
> +
>  static const struct regmap_irq bd96801_intb_irqs[] = {
>  	/* STATUS SYSTEM INTB */
>  	REGMAP_IRQ_REG(BD96801_TW_STAT, 0, BD96801_TW_STAT_MASK),
> @@ -175,8 +307,25 @@ static const struct regmap_irq bd96801_intb_irqs[] = {
>  	REGMAP_IRQ_REG(BD96801_LDO7_UVD_STAT, 7, BD96801_LDO_UVD_STAT_MASK),
>  };
>  
> +static struct regmap_irq_chip bd96801_irq_chip_errb = {
> +	.name = "bd96801-irq-errb",
> +	.domain_suffix = "errb",
> +	.main_status = BD96801_REG_INT_MAIN,
> +	.num_main_regs = 1,
> +	.irqs = &bd96801_errb_irqs[0],
> +	.num_irqs = ARRAY_SIZE(bd96801_errb_irqs),
> +	.status_base = BD96801_REG_INT_SYS_ERRB1,
> +	.mask_base = BD96801_REG_MASK_SYS_ERRB,
> +	.ack_base = BD96801_REG_INT_SYS_ERRB1,
> +	.init_ack_masked = true,
> +	.num_regs = 10,
> +	.irq_reg_stride = 1,
> +	.sub_reg_offsets = &errb_sub_irq_offsets[0],
> +};
> +
>  static struct regmap_irq_chip bd96801_irq_chip_intb = {
>  	.name = "bd96801-irq-intb",
> +	.domain_suffix = "intb",
>  	.main_status = BD96801_REG_INT_MAIN,
>  	.num_main_regs = 1,
>  	.irqs = &bd96801_intb_irqs[0],
> @@ -198,11 +347,14 @@ static const struct regmap_config bd96801_regmap_config = {
>  
>  static int bd96801_i2c_probe(struct i2c_client *i2c)
>  {
> -	struct regmap_irq_chip_data *intb_irq_data;
> +	int i, ret, intb_irq, errb_irq, num_regu_irqs, num_intb, num_errb = 0;
> +	int wdg_irq_no;
> +	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
> +	struct irq_domain *intb_domain, *errb_domain;
> +	struct resource wdg_irq;
>  	const struct fwnode_handle *fwnode;
> -	struct irq_domain *intb_domain;
> +	struct resource *regulator_res;
>  	struct regmap *regmap;
> -	int ret, intb_irq;
>  
>  	fwnode = dev_fwnode(&i2c->dev);
>  	if (!fwnode)
> @@ -212,10 +364,28 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
>  	if (intb_irq < 0)
>  		return dev_err_probe(&i2c->dev, intb_irq, "INTB IRQ not configured\n");
>  
> +	num_intb =  ARRAY_SIZE(regulator_intb_irqs);
> +
> +	/* ERRB may be omitted if processor is powered by the PMIC */
> +	errb_irq = fwnode_irq_get_byname(fwnode, "errb");
> +	if (errb_irq < 0)
> +		errb_irq = 0;
> +
> +	if (errb_irq)
> +		num_errb = ARRAY_SIZE(regulator_errb_irqs);
> +
> +	num_regu_irqs = num_intb + num_errb;
> +
> +	regulator_res = kcalloc(num_regu_irqs, sizeof(*regulator_res), GFP_KERNEL);

Why not devm_* and omit the kfree()?

> +	if (!regulator_res)
> +		return -ENOMEM;
> +
>  	regmap = devm_regmap_init_i2c(i2c, &bd96801_regmap_config);
> -	if (IS_ERR(regmap))
> -		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
> +	if (IS_ERR(regmap)) {
> +		ret = dev_err_probe(&i2c->dev, PTR_ERR(regmap),
>  				    "Regmap initialization failed\n");
> +		goto free_out;
> +	}
>  
>  	ret = regmap_write(regmap, BD96801_LOCK_REG, BD96801_UNLOCK);
>  	if (ret)
> @@ -224,18 +394,63 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
>  	ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, intb_irq,
>  				       IRQF_ONESHOT, 0, &bd96801_irq_chip_intb,
>  				       &intb_irq_data);
> -	if (ret)
> -		return dev_err_probe(&i2c->dev, ret, "Failed to add INTB IRQ chip\n");
> +	if (ret) {
> +		dev_err_probe(&i2c->dev, ret, "Failed to add INTB irq_chip\n");
> +		goto free_out;
> +	}
>  
>  	intb_domain = regmap_irq_get_domain(intb_irq_data);
>  
> -	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> -				   bd96801_mfd_cells,
> -				   ARRAY_SIZE(bd96801_mfd_cells), NULL, 0,
> -				   intb_domain);
> -
> +	/*
> +	 * MFD core code is built to handle only one IRQ domain. BD96801
> +	 * has two domains so we do IRQ mapping here and provide the
> +	 * already mapped IRQ numbers to sub-devices.
> +	 */
> +	for (i = 0; i < num_intb; i++) {
> +		struct resource *res = &regulator_res[i];
> +
> +		*res = regulator_intb_irqs[i];
> +		res->start = res->end = irq_create_mapping(intb_domain,
> +							    res->start);
> +	}
> +
> +	wdg_irq_no = irq_create_mapping(intb_domain, BD96801_WDT_ERR_STAT);
> +	wdg_irq = DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
> +	bd96801_mfd_cells[WDG_CELL].resources = &wdg_irq;
> +	bd96801_mfd_cells[WDG_CELL].num_resources = 1;
> +
> +	if (num_errb) {

	if (!num_errb)
		goto skip_errb;

> +		ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, errb_irq,
> +					       IRQF_ONESHOT, 0,
> +					       &bd96801_irq_chip_errb,
> +					       &errb_irq_data);
> +		if (ret) {
> +			dev_err_probe(&i2c->dev, ret,
> +				      "Failed to add ERRB (%d) irq_chip\n",
> +				      errb_irq);
> +			goto free_out;
> +		}
> +		errb_domain = regmap_irq_get_domain(errb_irq_data);
> +
> +		for (i = 0; i < num_errb; i++) {
> +			struct resource *res = &regulator_res[num_intb + i];
> +
> +			*res = regulator_errb_irqs[i];
> +			res->start = res->end = irq_create_mapping(errb_domain,
> +								   res->start);
> +		}
> +	}

skip_errb:

> +	bd96801_mfd_cells[REGULATOR_CELL].resources = regulator_res;
> +	bd96801_mfd_cells[REGULATOR_CELL].num_resources = num_regu_irqs;
> +
> +	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, bd96801_mfd_cells,
> +				   ARRAY_SIZE(bd96801_mfd_cells), NULL, 0, NULL);
>  	if (ret)
> -		dev_err(&i2c->dev, "Failed to create subdevices\n");
> +		dev_err_probe(&i2c->dev, ret, "Failed to create subdevices\n");
> +
> +free_out:
> +	kfree(regulator_res);
>  
>  	return ret;
>  }
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

