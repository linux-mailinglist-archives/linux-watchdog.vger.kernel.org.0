Return-Path: <linux-watchdog+bounces-83-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B39801835
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Dec 2023 00:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF7F22812A5
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 23:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57150584D4;
	Fri,  1 Dec 2023 23:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2yo5UaYI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F521B2
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Dec 2023 15:55:29 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cc79f73e58so26385ad.1
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Dec 2023 15:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474929; x=1702079729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G/AC4ZJJBO/haL1bhyUunNUWmPcdtwRfPvcybIuC9CY=;
        b=2yo5UaYINVJpJHjs4BMS5ipgPK6jYWRy0yj5Jl1Uc9mcQ8IFvlW94jRg5V0H0AhQVu
         ICX8Y4IPgiq6NltjvvwEavU0gIZlcF9UssDSaduwhn9tOGbJLLptsdXyQGZAEPQJPWBg
         D7+Y4USA7s9rghNQa2KSg2I3jdZlqlYX45dCc645mroZu2cNfVolglOxR+Y45zW+wGur
         q+ww7XtLcgI8vXa23FM9lQUzE6Y0VPhXZUvFdhl1fsUNrWorX0KjPkT4n+LxeJr9pn4F
         gjfSwrlZ/bmbahQUZwYQnHp3FpCtBch48mfEyhJQrgR42VEnT3DhmM+C6ajCZYUnU4ty
         8w8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474929; x=1702079729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/AC4ZJJBO/haL1bhyUunNUWmPcdtwRfPvcybIuC9CY=;
        b=r0ftex4CV2bebZ26RBt/zYRWfdyf4eyseUqKmpcRbrc1w98X5e8ST9mvkce98yNpyc
         kVVOXG797igPh591EgKS+6zDy61I2Pp5s/yVgJJYJ3Y7B+nbT6F9m9NkH405ztOx5yux
         vpGVfspfOt/N+RM4+d0vE72YRxtLjtcmL/WFUaoleo61Ke0qO+X/bJ1S2JnepMws1FX0
         dVSCp7nsMSzn2n3P5LxNOg0AuMIkneaWn5/jpFlfP4RJ4Cgt/qAIp9xMf5g3OJ2+IQhC
         H9pJgXXpOV9cNGoP9xt8284VGawge0qEpAZHPF0U1meiMaw1OxerGT+fm38xWF10vn+9
         8p5w==
X-Gm-Message-State: AOJu0Yz1xSSaqC3di3R0dzOx8iAMSF9GF8ASHAdadVp9cvB+dUkBnSKS
	Ox6FUBbLzp9pInCJQHZipRrCVg==
X-Google-Smtp-Source: AGHT+IHq45zrljcs2C49WIwn4V/77/ptsMp+TQaCNlvLWTpf7mO3bnc91ecX/p5bhA9XJJL6LNGQ4A==
X-Received: by 2002:a17:902:e811:b0:1cf:c4af:9d69 with SMTP id u17-20020a170902e81100b001cfc4af9d69mr353839plg.18.1701474928652;
        Fri, 01 Dec 2023 15:55:28 -0800 (PST)
Received: from google.com (148.98.83.34.bc.googleusercontent.com. [34.83.98.148])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001cfce833b6fsm3897903plj.204.2023.12.01.15.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:55:27 -0800 (PST)
Date: Fri, 1 Dec 2023 15:55:24 -0800
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 13/20] pinctrl: samsung: Add filter selection support
 for alive banks
Message-ID: <ZWpybAkHVYGzWKL0@google.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-14-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201160925.3136868-14-peter.griffin@linaro.org>

On 12/01/2023, Peter Griffin wrote:
> Newer Exynos SoCs have a filter selection register on alive bank pins.
> This allows the selection of a digital or delay filter for each pin. If
> the filter selection register is not available then the default filter
> (digital) is applied.
> 
> On suspend we apply the analog filter to all pins in the bank (as the
> digital filter relies on a clock). On resume the digital filter is
> reapplied to all pins in the bank. The digital filter is working via
> clock and has an adjustable filter delay register bitfield, whereas
> the analog filter uses a fixed delay.
> 
> The filter determines to what extent signal fluctuations received through
> the pad are considered glitches.
> 
> The code path can be exercised using
> echo mem > /sys/power/state
> And then wake the device using a eint gpio
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

--

I verified boot and that the pinctrl driver is probing. When I tested

  echo mem > /sys/power/state

I wasn't able to re-wake the device (not sure how to send an eint gpio on
a phone form factor). I tried with no_console_suspend but that hits a SError
Interrupt (likely due to a PMU secure register access). Let me know if there's
anything else I should test out.

Thanks,
Will

> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c  | 89 ++++++++++++++++++++++-
>  drivers/pinctrl/samsung/pinctrl-exynos.h  |  7 ++
>  drivers/pinctrl/samsung/pinctrl-samsung.c |  2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h | 22 ++++++
>  4 files changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index 6b58ec84e34b..56fc11a1fe2f 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -269,6 +269,71 @@ struct exynos_eint_gpio_save {
>  	u32 eint_mask;
>  };
>  
> +/*
> + * Set the desired filter (digital or analog delay) to every pin in
> + * the bank. Note the filter selection bitfield is only found on alive
> + * banks. The filter determines to what extent signal fluctuations
> + * received through the pad are considered glitches.
> + */
> +static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
> +				   struct samsung_pin_bank *bank, int filter)
> +{
> +	unsigned int flt_reg, flt_con = 0;
> +	unsigned int val, shift;
> +	int i;
> +	int loop_cnt;
> +
> +	/*
> +	 * The FLTCON register has the following layout
> +	 *
> +	 * BitfieldName[PinNum][Bit:Bit]
> +	 * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> +	 * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> +	 * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> +	 * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> +	 *
> +	 * FLT_EN	0x0 = Disable, 0x1=Enable
> +	 * FLT_SEL	0x0 = Delay filter, 0x1 Digital filter
> +	 * FLT_WIDTH	Filtering width. Valid when FLT_SEL is 0x1
> +	 */
> +
> +	flt_con |= EXYNOS9_FLTCON_EN;
> +
> +	if (filter)
> +		flt_con |= EXYNOS9_FLTCON_DIGITAL;
> +
> +	flt_reg = EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> +
> +	/*
> +	 * If nr_pins > 4, we should set FLTCON0 register fully.
> +	 * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> +	 */
> +	if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN)
> +		loop_cnt = EXYNOS9_FLTCON_NR_PIN;
> +	else
> +		loop_cnt = bank->nr_pins;
> +
> +	val = readl(d->virt_base + flt_reg);
> +	for (i = 0; i < loop_cnt; i++) {
> +		shift = i * EXYNOS9_FLTCON_LEN;
> +		val &= ~(EXYNOS9_FLTCON_MASK << shift);
> +		val |= (flt_con << shift);
> +	}
> +	writel(val, d->virt_base + flt_reg);
> +
> +	/* Loop for FLTCON1 pin 4 ~ 7 */
> +	if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN) {
> +		loop_cnt = (bank->nr_pins - EXYNOS9_FLTCON_NR_PIN);
> +		val = readl(d->virt_base + flt_reg + 0x4);
> +		for (i = 0; i < loop_cnt; i++) {
> +			shift = i * EXYNOS9_FLTCON_LEN;
> +			val &= ~(EXYNOS9_FLTCON_MASK << shift);
> +			val |= (flt_con << shift);
> +		}
> +		writel(val, d->virt_base + flt_reg + 0x4);
> +	}
> +}
> +
>  /*
>   * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
>   * @d: driver data of samsung pinctrl driver.
> @@ -321,6 +386,10 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
>  			goto err_domains;
>  		}
>  
> +		/* Set Delay Analog Filter */
> +		if (bank->fltcon_type != FLT_DEFAULT)
> +			exynos_eint_flt_config(d, bank,
> +					       EXYNOS9_FLTCON_DELAY);
>  	}
>  
>  	return 0;
> @@ -555,6 +624,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  		if (bank->eint_type != EINT_TYPE_WKUP)
>  			continue;
>  
> +		/* Set Digital Filter */
> +		if (bank->fltcon_type != FLT_DEFAULT)
> +			exynos_eint_flt_config(d, bank,
> +					       EXYNOS9_FLTCON_DIGITAL);
> +
>  		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
>  					      GFP_KERNEL);
>  		if (!bank->irq_chip) {
> @@ -658,6 +732,7 @@ static void exynos_pinctrl_suspend_bank(
>  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
>  {
>  	struct samsung_pin_bank *bank = drvdata->pin_banks;
> +	struct samsung_pinctrl_drv_data *d = bank->drvdata;
>  	struct exynos_irq_chip *irq_chip = NULL;
>  	int i;
>  
> @@ -665,6 +740,10 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
>  		if (bank->eint_type == EINT_TYPE_GPIO)
>  			exynos_pinctrl_suspend_bank(drvdata, bank);
>  		else if (bank->eint_type == EINT_TYPE_WKUP) {
> +			/* Setting Delay (Analog) Filter */
> +			if (bank->fltcon_type != FLT_DEFAULT)
> +				exynos_eint_flt_config(d, bank,
> +						       EXYNOS9_FLTCON_DELAY);
>  			if (!irq_chip) {
>  				irq_chip = bank->irq_chip;
>  				irq_chip->set_eint_wakeup_mask(drvdata,
> @@ -707,11 +786,19 @@ static void exynos_pinctrl_resume_bank(
>  void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
>  {
>  	struct samsung_pin_bank *bank = drvdata->pin_banks;
> +	struct samsung_pinctrl_drv_data *d = bank->drvdata;
>  	int i;
>  
>  	for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
> -		if (bank->eint_type == EINT_TYPE_GPIO)
> +		if (bank->eint_type == EINT_TYPE_GPIO) {
>  			exynos_pinctrl_resume_bank(drvdata, bank);
> +		} else if (bank->eint_type == EINT_TYPE_WKUP ||
> +			   bank->eint_type == EINT_TYPE_WKUP_MUX) {
> +			/* Set Digital Filter */
> +			if (bank->fltcon_type != FLT_DEFAULT)
> +				exynos_eint_flt_config(d, bank,
> +						       EXYNOS9_FLTCON_DIGITAL);
> +		}
>  }
>  
>  static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> index 3ac52c2cf998..e2799ff1b5e9 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -50,6 +50,13 @@
>  
>  #define EXYNOS_EINT_MAX_PER_BANK	8
>  #define EXYNOS_EINT_NR_WKUP_EINT
> +/* EINT filter configuration */
> +#define EXYNOS9_FLTCON_EN		BIT(7)
> +#define EXYNOS9_FLTCON_DIGITAL		BIT(6)
> +#define EXYNOS9_FLTCON_DELAY		(0 << 6)
> +#define EXYNOS9_FLTCON_MASK		0xff
> +#define EXYNOS9_FLTCON_LEN		8
> +#define EXYNOS9_FLTCON_NR_PIN		4
>  
>  #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)		\
>  	{						\
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 79babbb39ced..50c360b4753a 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1105,6 +1105,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
>  		bank->eint_func = bdata->eint_func;
>  		bank->eint_type = bdata->eint_type;
>  		bank->eint_mask = bdata->eint_mask;
> +		bank->fltcon_type = bdata->fltcon_type;
> +		bank->fltcon_offset = bdata->fltcon_offset;
>  		bank->eint_offset = bdata->eint_offset;
>  		bank->name = bdata->name;
>  
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index 9b3db50adef3..5fab3885a7d7 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -82,6 +82,20 @@ enum eint_type {
>  	EINT_TYPE_WKUP_MUX,
>  };
>  
> +/**
> + * enum fltcon_type - filter selection
> + * @FLT_DEFAULT: filter not selectable, default digital filter
> + * @FLT_SELECT: filter selectable (digital or delay)
> + *
> + * Some banks on newer Exynos based SoCs have a selectable filter on alive
> + * banks of 'analog/delay' or 'digital'. If the filter selection register is
> + * not available then the default filter is used (digital).
> + */
> +enum fltcon_type {
> +	FLT_DEFAULT,
> +	FLT_SELECTABLE,
> +};
> +
>  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
>  #define PIN_NAME_LENGTH	10
>  
> @@ -122,6 +136,8 @@ struct samsung_pin_bank_type {
>   * @eint_type: type of the external interrupt supported by the bank.
>   * @eint_mask: bit mask of pins which support EINT function.
>   * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
> + * @fltcon_type: whether the filter (delay/digital) is selectable
> + * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
>   * @name: name to be prefixed for each pin in this pin bank.
>   */
>  struct samsung_pin_bank_data {
> @@ -133,6 +149,8 @@ struct samsung_pin_bank_data {
>  	enum eint_type	eint_type;
>  	u32		eint_mask;
>  	u32		eint_offset;
> +	enum fltcon_type fltcon_type;
> +	u32		fltcon_offset;
>  	const char	*name;
>  };
>  
> @@ -147,6 +165,8 @@ struct samsung_pin_bank_data {
>   * @eint_type: type of the external interrupt supported by the bank.
>   * @eint_mask: bit mask of pins which support EINT function.
>   * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
> + * @fltcon_type: whether the filter (delay/digital) is selectable
> + * @fltcon_offset: SoC-specific EINT filter control register offset of bank.
>   * @name: name to be prefixed for each pin in this pin bank.
>   * @id: id of the bank, propagated to the pin range.
>   * @pin_base: starting pin number of the bank.
> @@ -170,6 +190,8 @@ struct samsung_pin_bank {
>  	enum eint_type	eint_type;
>  	u32		eint_mask;
>  	u32		eint_offset;
> +	enum fltcon_type fltcon_type;
> +	u32		fltcon_offset;
>  	const char	*name;
>  	u32		id;
>  
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 

