Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF58330FCB
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 14:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCHNor (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 08:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhCHNoS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 08:44:18 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3AEC061760
        for <linux-watchdog@vger.kernel.org>; Mon,  8 Mar 2021 05:44:13 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso3832268wmq.1
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Mar 2021 05:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2G5oIX+EuXwVCA8JhEm6fWauMffhMPiICqtvQc/jkqQ=;
        b=BvM/tf8E1hHQIpvaFC2un9fpXZ40ATrPgy+KKV5czNmUJrDNexTmw2LHl4JYZZiXWN
         WoSHWDQlXNhCjGdNOMhU0lAg/Pl0rLoDMNo0vD20/4AzDCkyrKesSGixJfHyRZwCUqUH
         BamO4g5xRUK9svmmidnTluu05fNBv7pE8xe74YvBY2USq0b/j5w3/Or+tN1Rt7UGBi8m
         x9YqhW4wZ6iRVQMSn/Hbd96Zv3Jb4wTjrUlPh3CC4uqPvg/cz5yUs32hC+G1gNn6BBIz
         tAyLo0BPmxknsP2obv5mnpKhe36cWnPYRNE/zUiBcWZ1FbEpD3lTDbITdJKi/4FdoQFi
         U2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2G5oIX+EuXwVCA8JhEm6fWauMffhMPiICqtvQc/jkqQ=;
        b=mjrLyaee5ONSYJbt6U7Xcf2pyuOhZgmcwUpLCAZUQVo8LtMHYbTxAmLcXmyL6kbSga
         U1zVo01OGio9zGMQa+wGYZaZGm1W3mrWfNqVa2PKt4cPo52ZexkUKtE/G49ZQ/IkdcaA
         iykjkMqZq3QSRhagDvqQNtCpvjKkhKa7RqqacXrPaCnb+v2kAh+H75bXTfceRiWKwnhs
         kbSlkLyzPvvI7DT4QOmVuKffCq5aNTzrTL0vWuID8Cs70nyQ3JIEh3VyC5zTNxTvv5q2
         oi6dG9DYDqW4h5GVuKx+0RcOjCNZAFBBTujIu6Y6MqJjW0LfFlWitDa+2FJ2Jennktii
         09sQ==
X-Gm-Message-State: AOAM5325Vn2VnGACz8R9Aqi62DknPV73u6LVxQccq2X0SbFZsi5ZrEhR
        jwFExllpuIU04QFRmnyYwEAfAErWG1DhwA==
X-Google-Smtp-Source: ABdhPJytrKKqZs6nidf+WvlWewImnf6jOfldvUELnktrxC9ebPyv/nKCWVWf/C/TwbWanWPGf36Zcg==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr22497273wmi.186.1615211052495;
        Mon, 08 Mar 2021 05:44:12 -0800 (PST)
Received: from dell ([91.110.221.130])
        by smtp.gmail.com with ESMTPSA id h2sm20917478wrq.81.2021.03.08.05.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 05:44:11 -0800 (PST)
Date:   Mon, 8 Mar 2021 13:44:09 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 3/6] mfd: bd9576: Add IRQ support
Message-ID: <20210308134409.GE4931@dell>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
 <bfe6542ee9faa38902b6791560e731e29db826aa.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bfe6542ee9faa38902b6791560e731e29db826aa.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 11 Feb 2021, Matti Vaittinen wrote:

> BD9573 and BD9576 support set of "protection" interrupts for "fatal"
> issues. Those lead to SOC reset as PMIC shuts the power outputs. Thus
> there is no relevant IRQ handling for them.
> 
> Few "detection" interrupts were added to the BD9576 with the idea that
> SOC could take some recovery-action before error gets unrecoverable.
> 
> Unfortunately the BD9576 interrupt logic was not re-evaluated. IRQs
> are not designed to be properly acknowleged - and IRQ line is kept
> active for whole duration of error condition (in comparison to
> informing only about state change).
> 
> For above reason, do not consider missing IRQ as error.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changes since v7:
>  - Do not fail probe is BD9573 IRQ information is populated
>  - Comment clean-up/clarifications as suggested by Lee
> 
>  drivers/mfd/rohm-bd9576.c       | 80 ++++++++++++++++++++++++++++++++-
>  include/linux/mfd/rohm-bd957x.h | 62 +++++++++++++++++++++++++
>  2 files changed, 141 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> index efd439677c9e..6084f9a0aa1c 100644
> --- a/drivers/mfd/rohm-bd9576.c
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -17,12 +17,27 @@
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>  
> +/*
> + * Due to the BD9576MUF nasty IRQ behaiour we don't always populate IRQs.
> + * These will be added to regulator resources only if IRQ information for the
> + * PMIC is populated in device-tree.
> + */
> +static const struct resource bd9576_regulator_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(BD9576_INT_THERM, "bd9576-temp"),
> +	DEFINE_RES_IRQ_NAMED(BD9576_INT_OVD, "bd9576-ovd"),
> +	DEFINE_RES_IRQ_NAMED(BD9576_INT_UVD, "bd9576-uvd"),
> +};
> +
>  static struct mfd_cell bd9573_mfd_cells[] = {
>  	{ .name = "bd9573-regulator", },
>  	{ .name = "bd9576-wdt", },
>  };
>  
>  static struct mfd_cell bd9576_mfd_cells[] = {
> +	/*
> +	 * Please keep regulators as first cell as resources may be overwritten
> +	 * from probe and the code expects regulators to be at index 0.
> +	 */

Thought I'd mentioned this before (must have slipped my mind).

This is not acceptable as it's much too fragile.

Please use defined indexes to look into the array entries instead.

       [BD9576_REGULATOR] = { .name = "bd9576-regulator" }

Etc.

>  	{ .name = "bd9576-regulator", },
>  	{ .name = "bd9576-wdt", },
>  };
> @@ -49,6 +64,29 @@ static struct regmap_config bd957x_regmap = {
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> +static struct regmap_irq bd9576_irqs[] = {
> +	REGMAP_IRQ_REG(BD9576_INT_THERM, 0, BD957X_MASK_INT_MAIN_THERM),
> +	REGMAP_IRQ_REG(BD9576_INT_OVP, 0, BD957X_MASK_INT_MAIN_OVP),
> +	REGMAP_IRQ_REG(BD9576_INT_SCP, 0, BD957X_MASK_INT_MAIN_SCP),
> +	REGMAP_IRQ_REG(BD9576_INT_OCP, 0, BD957X_MASK_INT_MAIN_OCP),
> +	REGMAP_IRQ_REG(BD9576_INT_OVD, 0, BD957X_MASK_INT_MAIN_OVD),
> +	REGMAP_IRQ_REG(BD9576_INT_UVD, 0, BD957X_MASK_INT_MAIN_UVD),
> +	REGMAP_IRQ_REG(BD9576_INT_UVP, 0, BD957X_MASK_INT_MAIN_UVP),
> +	REGMAP_IRQ_REG(BD9576_INT_SYS, 0, BD957X_MASK_INT_MAIN_SYS),
> +};
> +
> +static struct regmap_irq_chip bd9576_irq_chip = {
> +	.name = "bd9576_irq",
> +	.irqs = &bd9576_irqs[0],
> +	.num_irqs = ARRAY_SIZE(bd9576_irqs),
> +	.status_base = BD957X_REG_INT_MAIN_STAT,
> +	.mask_base = BD957X_REG_INT_MAIN_MASK,
> +	.ack_base = BD957X_REG_INT_MAIN_STAT,
> +	.init_ack_masked = true,
> +	.num_regs = 1,
> +	.irq_reg_stride = 1,
> +};
> +
>  static int bd957x_i2c_probe(struct i2c_client *i2c,
>  			     const struct i2c_device_id *id)
>  {
> @@ -57,6 +95,8 @@ static int bd957x_i2c_probe(struct i2c_client *i2c,
>  	struct mfd_cell *cells;
>  	int num_cells;
>  	unsigned long chip_type;
> +	struct irq_domain *domain;
> +	bool usable_irqs;
>  
>  	chip_type = (unsigned long)of_device_get_match_data(&i2c->dev);
>  
> @@ -64,10 +104,16 @@ static int bd957x_i2c_probe(struct i2c_client *i2c,
>  	case ROHM_CHIP_TYPE_BD9576:
>  		cells = bd9576_mfd_cells;
>  		num_cells = ARRAY_SIZE(bd9576_mfd_cells);
> +		usable_irqs = !!i2c->irq;
>  		break;
>  	case ROHM_CHIP_TYPE_BD9573:
>  		cells = bd9573_mfd_cells;
>  		num_cells = ARRAY_SIZE(bd9573_mfd_cells);
> +		/*
> +		 * BD9573 only supports fatal IRQs which we can not handle
> +		 * because SoC is going to lose the power.
> +		 */
> +		usable_irqs = false;
>  		break;
>  	default:
>  		dev_err(&i2c->dev, "Unknown device type");
> @@ -79,9 +125,41 @@ static int bd957x_i2c_probe(struct i2c_client *i2c,
>  		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
>  		return PTR_ERR(regmap);
>  	}

Nit: '\n'

> +	/*
> +	 * BD9576 behaves badly. It kepts IRQ line asserted for the whole
> +	 * duration of detected HW condition (like over temperature). So we
> +	 * don't require IRQ to be populated.
> +	 * If IRQ information is not given, then we mask all IRQs and do not
> +	 * provide IRQ resources to regulator driver - which then just omits
> +	 * the notifiers.
> +	 */
> +	if (usable_irqs) {
> +		struct regmap_irq_chip_data *irq_data;
> +		struct mfd_cell *regulators = &bd9576_mfd_cells[0];
> +
> +		regulators->resources = bd9576_regulator_irqs;
> +		regulators->num_resources = ARRAY_SIZE(bd9576_regulator_irqs);
> +
> +		ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, i2c->irq,
> +					       IRQF_ONESHOT, 0,
> +					       &bd9576_irq_chip, &irq_data);
> +		if (ret) {
> +			dev_err(&i2c->dev, "Failed to add IRQ chip\n");
> +			return ret;
> +		}
> +		domain = regmap_irq_get_domain(irq_data);
> +		dev_dbg(&i2c->dev, "Using IRQs for BD9576MUF\n");

Doesn't seem overly helpful.  Please remove it.

> +	} else {
> +		ret = regmap_update_bits(regmap, BD957X_REG_INT_MAIN_MASK,
> +					 BD957X_MASK_INT_ALL,
> +					 BD957X_MASK_INT_ALL);
> +		if (ret)
> +			return ret;
> +		domain = NULL;
> +	}
>  
>  	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, cells,
> -				   num_cells, NULL, 0, NULL);
> +				   num_cells, NULL, 0, domain);
>  	if (ret)
>  		dev_err(&i2c->dev, "Failed to create subdevices\n");
>  
> diff --git a/include/linux/mfd/rohm-bd957x.h b/include/linux/mfd/rohm-bd957x.h
> index ae59c0f7188d..3f351a1ae4ab 100644
> --- a/include/linux/mfd/rohm-bd957x.h
> +++ b/include/linux/mfd/rohm-bd957x.h
> @@ -13,6 +13,55 @@ enum {
>  	BD957X_VOUTS1,
>  };
>  
> +/*
> + * The BD9576 has own IRQ 'blocks' for:
> + *  - I2C/thermal,
> + *  - Over voltage protection
> + *  - Short-circuit protection
> + *  - Over current protection
> + *  - Over voltage detection
> + *  - Under voltage detection
> + *  - Under voltage protection
> + *  - 'system interrupt'.
> + *
> + * Each of the blocks have a status register giving more accurate IRQ source
> + * information - for example which of the regulators have over-voltage.
> + *
> + * On top of this, there is "main IRQ" status register where each bit indicates
> + * which of sub-blocks have active IRQs. Fine. That would fit regmap-irq main
> + * status handling. Except that:
> + *  - Only some sub-IRQs can be masked.
> + *  - The IRQ informs us about fault-condition, not when fault state changes.
> + *    The IRQ line it is kept asserted until the detected condition is acked
> + *    AND cleared in HW. This is annoying for IRQs like the one informing high
> + *    temperature because if IRQ is not disabled it keeps the CPU in IRQ
> + *    handling loop.
> + *
> + * For now we do just use the main-IRQ register as source for our IRQ
> + * information and bind the regmap-irq to this. We leave fine-grained sub-IRQ
> + * register handling to handlers in sub-devices. The regulator driver shall
> + * read which regulators are source for problem - or if the detected error is
> + * regulator temperature error. The sub-drivers do also handle masking of "sub-
> + * IRQs" if this is supported/needed.
> + *
> + * To overcome the problem with HW keeping IRQ asserted we do call
> + * disable_irq_nosync() from sub-device handler and add a delayed work to
> + * re-enable IRQ roughly 1 second later. This should keep our CPU out of
> + * busy-loop.
> + */
> +#define IRQS_SILENT_MS			1000
> +
> +enum {
> +	BD9576_INT_THERM,
> +	BD9576_INT_OVP,
> +	BD9576_INT_SCP,
> +	BD9576_INT_OCP,
> +	BD9576_INT_OVD,
> +	BD9576_INT_UVD,
> +	BD9576_INT_UVP,
> +	BD9576_INT_SYS,
> +};
> +
>  #define BD957X_REG_SMRB_ASSERT		0x15
>  #define BD957X_REG_PMIC_INTERNAL_STAT	0x20
>  #define BD957X_REG_INT_THERM_STAT	0x23
> @@ -28,6 +77,19 @@ enum {
>  #define BD957X_REG_INT_MAIN_STAT	0x30
>  #define BD957X_REG_INT_MAIN_MASK	0x31
>  
> +#define UVD_IRQ_VALID_MASK		0x6F
> +#define OVD_IRQ_VALID_MASK		0x2F
> +
> +#define BD957X_MASK_INT_MAIN_THERM	BIT(0)
> +#define BD957X_MASK_INT_MAIN_OVP	BIT(1)
> +#define BD957X_MASK_INT_MAIN_SCP	BIT(2)
> +#define BD957X_MASK_INT_MAIN_OCP	BIT(3)
> +#define BD957X_MASK_INT_MAIN_OVD	BIT(4)
> +#define BD957X_MASK_INT_MAIN_UVD	BIT(5)
> +#define BD957X_MASK_INT_MAIN_UVP	BIT(6)
> +#define BD957X_MASK_INT_MAIN_SYS	BIT(7)
> +#define BD957X_MASK_INT_ALL		0xff
> +
>  #define BD957X_REG_WDT_CONF		0x16
>  
>  #define BD957X_REG_POW_TRIGGER1		0x41

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
