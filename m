Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5478A3D5049
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 00:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhGYVXg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Jul 2021 17:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhGYVXg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Jul 2021 17:23:36 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AC3C061757;
        Sun, 25 Jul 2021 15:04:04 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id jz6so4200961qvb.2;
        Sun, 25 Jul 2021 15:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Y/I67KfWwXzbdhnzX4Yv9yDQbLDCzXb4cZ0XOcTriw=;
        b=pUZQBZPpPZgJInXeuWGzccjdCmE9MEHbgK0xefnnOh1PuoGJ5njioWGKN5nH04qq6v
         WrSde6zIhZEu7/0w0wMT47WyQrIiQq9Er8MxVI/jg2TFXeClHEo9k0e5hZJS0rinJQze
         1RS6BibzhHkPK42cZnqrLQkLxSyVEYoIXyEc5RKR/Mix1X5FMA45BMMSNSM4LNiPd9ms
         LZUexsCcboRgWAgCGaRyIReq53ST7PSzMdumdHSWbWaFdtYrlHo5tB2j5oyyLY5x0tFb
         cNtokeJJZgp33fE0irMcBty/naCRCQqlGg1iT5ueYZBCwEtoH8gsXfh3w8Em3N7ExuuF
         wx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=1Y/I67KfWwXzbdhnzX4Yv9yDQbLDCzXb4cZ0XOcTriw=;
        b=ZtAoDiv1jc1VxzsC4zH7m/26DhOehfBG6/h760BGZ5+C+M7PkoCIAG9tZRwlKcyBsm
         Jix4WU79T6sxH08y0miF9+ugh8u/wHb7h/JN56FIVPdBKWOgrb5miXNxBjTL1dUgeYAm
         so3e0C1xY0RaX6A/zjhuYi4iFB7I2PhIYiwW+VBWpM8wnFjq0iIQp7RYbacAcyMI2W+z
         mSvhcm4s279gUAgKq/ALOxHnpTvwscswtzrwAJc2SJUyl4m7y3MWL2M7s6YxJB4R3ov8
         uPxisedkgqiW0y8oQU9qRTKynR5mM/AyQlxg8NlOnNNV+Xz8N/p6fixlf/9+yfv+8rM/
         IHiA==
X-Gm-Message-State: AOAM532r57ecnZW36YiAVr1KvPnKyuk+PQzXxz5+IMN4Yse19DIwVRWY
        9OpEDh5ubnxKWCg0ipGeoGk=
X-Google-Smtp-Source: ABdhPJxMYGbq4+IIKpE7SIw+0MFVjUwLqg7KqgAR8kM3fdLgOi33HV+zIIB/cMN6yb1Xd2PcxwI0Lg==
X-Received: by 2002:ad4:45f1:: with SMTP id q17mr2000101qvu.40.1627250644009;
        Sun, 25 Jul 2021 15:04:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u6sm18509249qkp.49.2021.07.25.15.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 15:04:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Jul 2021 15:04:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] watchdog: f71808e_wdt: dynamically allocate
 watchdog driver data
Message-ID: <20210725220402.GF3578169@roeck-us.net>
References: <cover.c711be1db54f4e07c0153266dd1a831e92e3d49d.1626948810.git-series.a.fatoum@pengutronix.de>
 <a5a468ae0ce738c56a3e4313cc266fe143b4071d.1626948810.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a468ae0ce738c56a3e4313cc266fe143b4071d.1626948810.git-series.a.fatoum@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 22, 2021 at 12:14:44PM +0200, Ahmad Fatoum wrote:
> While the driver will only match against a single device, convention is
> to dynamically allocate the driver data.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 198 +++++++++++++++++++---------------
>  1 file changed, 111 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index d4cae73da002..f495bf6fb0ab 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -143,7 +143,9 @@ struct fintek_wdt {
>  	char		pulse_mode;	/* enable pulse output mode? */
>  };
>  
> -static struct fintek_wdt watchdog;
> +struct fintek_wdt_pdata {
> +	enum chips	type;
> +};
>  
>  /* Super I/O functions */
>  static inline int superio_inb(int base, int reg)
> @@ -209,13 +211,15 @@ static inline void superio_exit(int base)
>  
>  static int fintek_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
>  {
> +	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
> +
>  	if (timeout > 0xff) {
> -		watchdog.timer_val = DIV_ROUND_UP(timeout, 60);
> -		watchdog.minutes_mode = true;
> -		timeout = watchdog.timer_val * 60;
> +		wd->timer_val = DIV_ROUND_UP(timeout, 60);
> +		wd->minutes_mode = true;
> +		timeout = wd->timer_val * 60;
>  	} else {
> -		watchdog.timer_val = timeout;
> -		watchdog.minutes_mode = false;
> +		wd->timer_val = timeout;
> +		wd->minutes_mode = false;
>  	}
>  
>  	wdd->timeout = timeout;
> @@ -223,63 +227,65 @@ static int fintek_wdt_set_timeout(struct watchdog_device *wdd, unsigned int time
>  	return 0;
>  }
>  
> -static int fintek_wdt_set_pulse_width(unsigned int pw)
> +static int fintek_wdt_set_pulse_width(struct fintek_wdt *wd, unsigned int pw)
>  {
>  	unsigned int t1 = 25, t2 = 125, t3 = 5000;
>  
> -	if (watchdog.type == f71868) {
> +	if (wd->type == f71868) {
>  		t1 = 30;
>  		t2 = 150;
>  		t3 = 6000;
>  	}
>  
>  	if        (pw <=  1) {
> -		watchdog.pulse_val = 0;
> +		wd->pulse_val = 0;
>  	} else if (pw <= t1) {
> -		watchdog.pulse_val = 1;
> +		wd->pulse_val = 1;
>  	} else if (pw <= t2) {
> -		watchdog.pulse_val = 2;
> +		wd->pulse_val = 2;
>  	} else if (pw <= t3) {
> -		watchdog.pulse_val = 3;
> +		wd->pulse_val = 3;
>  	} else {
>  		pr_err("pulse width out of range\n");
>  		return -EINVAL;
>  	}
>  
> -	watchdog.pulse_mode = pw;
> +	wd->pulse_mode = pw;
>  
>  	return 0;
>  }
>  
>  static int fintek_wdt_keepalive(struct watchdog_device *wdd)
>  {
> +	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
>  	int err;
>  
> -	err = superio_enter(watchdog.sioaddr);
> +	err = superio_enter(wd->sioaddr);
>  	if (err)
>  		return err;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
> -	if (watchdog.minutes_mode)
> +	if (wd->minutes_mode)
>  		/* select minutes for timer units */
> -		superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +		superio_set_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  				F71808FG_FLAG_WD_UNIT);
>  	else
>  		/* select seconds for timer units */
> -		superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +		superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  				F71808FG_FLAG_WD_UNIT);
>  
>  	/* Set timer value */
> -	superio_outb(watchdog.sioaddr, F71808FG_REG_WD_TIME,
> -			   watchdog.timer_val);
> +	superio_outb(wd->sioaddr, F71808FG_REG_WD_TIME,
> +			   wd->timer_val);
>  
> -	superio_exit(watchdog.sioaddr);
> +	superio_exit(wd->sioaddr);
>  
>  	return 0;
>  }
>  
>  static int fintek_wdt_start(struct watchdog_device *wdd)
>  {
> +	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
>  	int err;
>  	u8 tmp;
>  
> @@ -288,57 +294,57 @@ static int fintek_wdt_start(struct watchdog_device *wdd)
>  	if (err)
>  		return err;
>  
> -	err = superio_enter(watchdog.sioaddr);
> +	err = superio_enter(wd->sioaddr);
>  	if (err)
>  		return err;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
>  	/* Watchdog pin configuration */
> -	switch (watchdog.type) {
> +	switch (wd->type) {
>  	case f71808fg:
>  		/* Set pin 21 to GPIO23/WDTRST#, then to WDTRST# */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT2, 3);
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 3);
> +		superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT2, 3);
> +		superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 3);
>  		break;
>  
>  	case f71862fg:
>  		if (f71862fg_pin == 63) {
>  			/* SPI must be disabled first to use this pin! */
> -			superio_clear_bit(watchdog.sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
> -			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 4);
> +			superio_clear_bit(wd->sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
> +			superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT3, 4);
>  		} else if (f71862fg_pin == 56) {
> -			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
> +			superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
>  		}
>  		break;
>  
>  	case f71868:
>  	case f71869:
>  		/* GPIO14 --> WDTRST# */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 4);
> +		superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT1, 4);
>  		break;
>  
>  	case f71882fg:
>  		/* Set pin 56 to WDTRST# */
> -		superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
> +		superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
>  		break;
>  
>  	case f71889fg:
>  		/* set pin 40 to WDTRST# */
> -		superio_outb(watchdog.sioaddr, SIO_REG_MFUNCT3,
> -			superio_inb(watchdog.sioaddr, SIO_REG_MFUNCT3) & 0xcf);
> +		superio_outb(wd->sioaddr, SIO_REG_MFUNCT3,
> +			superio_inb(wd->sioaddr, SIO_REG_MFUNCT3) & 0xcf);
>  		break;
>  
>  	case f81803:
>  		/* Enable TSI Level register bank */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_CLOCK_SEL, 3);
> +		superio_clear_bit(wd->sioaddr, SIO_REG_CLOCK_SEL, 3);
>  		/* Set pin 27 to WDTRST# */
> -		superio_outb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
> -			superio_inb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL));
> +		superio_outb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
> +			superio_inb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL));
>  		break;
>  
>  	case f81865:
>  		/* Set pin 70 to WDTRST# */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 5);
> +		superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 5);
>  		break;
>  
>  	case f81866:
> @@ -348,12 +354,12 @@ static int fintek_wdt_start(struct watchdog_device *wdd)
>  		 *     BIT5: 0 -> WDTRST#
>  		 *           1 -> GPIO15
>  		 */
> -		tmp = superio_inb(watchdog.sioaddr, SIO_F81866_REG_PORT_SEL);
> +		tmp = superio_inb(wd->sioaddr, SIO_F81866_REG_PORT_SEL);
>  		tmp &= ~(BIT(3) | BIT(0));
>  		tmp |= BIT(2);
> -		superio_outb(watchdog.sioaddr, SIO_F81866_REG_PORT_SEL, tmp);
> +		superio_outb(wd->sioaddr, SIO_F81866_REG_PORT_SEL, tmp);
>  
> -		superio_clear_bit(watchdog.sioaddr, SIO_F81866_REG_GPIO1, 5);
> +		superio_clear_bit(wd->sioaddr, SIO_F81866_REG_GPIO1, 5);
>  		break;
>  
>  	default:
> @@ -365,63 +371,64 @@ static int fintek_wdt_start(struct watchdog_device *wdd)
>  		goto exit_superio;
>  	}
>  
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> -	superio_set_bit(watchdog.sioaddr, SIO_REG_ENABLE, 0);
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
> +	superio_set_bit(wd->sioaddr, SIO_REG_ENABLE, 0);
>  
> -	if (watchdog.type == f81865 || watchdog.type == f81866)
> -		superio_set_bit(watchdog.sioaddr, F81865_REG_WDO_CONF,
> +	if (wd->type == f81865 || wd->type == f81866)
> +		superio_set_bit(wd->sioaddr, F81865_REG_WDO_CONF,
>  				F81865_FLAG_WDOUT_EN);
>  	else
> -		superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDO_CONF,
> +		superio_set_bit(wd->sioaddr, F71808FG_REG_WDO_CONF,
>  				F71808FG_FLAG_WDOUT_EN);
>  
> -	superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +	superio_set_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  			F71808FG_FLAG_WD_EN);
>  
> -	if (watchdog.pulse_mode) {
> +	if (wd->pulse_mode) {
>  		/* Select "pulse" output mode with given duration */
> -		u8 wdt_conf = superio_inb(watchdog.sioaddr,
> +		u8 wdt_conf = superio_inb(wd->sioaddr,
>  				F71808FG_REG_WDT_CONF);
>  
>  		/* Set WD_PSWIDTH bits (1:0) */
> -		wdt_conf = (wdt_conf & 0xfc) | (watchdog.pulse_val & 0x03);
> +		wdt_conf = (wdt_conf & 0xfc) | (wd->pulse_val & 0x03);
>  		/* Set WD_PULSE to "pulse" mode */
>  		wdt_conf |= BIT(F71808FG_FLAG_WD_PULSE);
>  
> -		superio_outb(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +		superio_outb(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  				wdt_conf);
>  	} else {
>  		/* Select "level" output mode */
> -		superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +		superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  				F71808FG_FLAG_WD_PULSE);
>  	}
>  
>  exit_superio:
> -	superio_exit(watchdog.sioaddr);
> +	superio_exit(wd->sioaddr);
>  
>  	return err;
>  }
>  
>  static int fintek_wdt_stop(struct watchdog_device *wdd)
>  {
> +	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
>  	int err;
>  
> -	err = superio_enter(watchdog.sioaddr);
> +	err = superio_enter(wd->sioaddr);
>  	if (err)
>  		return err;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
> -	superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +	superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  			F71808FG_FLAG_WD_EN);
>  
> -	superio_exit(watchdog.sioaddr);
> +	superio_exit(wd->sioaddr);
>  
>  	return 0;
>  }
>  
> -static bool fintek_wdt_is_running(u8 wdt_conf)
> +static bool fintek_wdt_is_running(struct fintek_wdt *wd, u8 wdt_conf)
>  {
> -	return (superio_inb(watchdog.sioaddr, SIO_REG_ENABLE) & BIT(0))
> +	return (superio_inb(wd->sioaddr, SIO_REG_ENABLE) & BIT(0))
>  		&& (wdt_conf & BIT(F71808FG_FLAG_WD_EN));
>  }
>  
> @@ -435,7 +442,9 @@ static const struct watchdog_ops fintek_wdt_ops = {
>  
>  static int fintek_wdt_probe(struct platform_device *pdev)
>  {
> +	struct fintek_wdt_pdata *pdata;
>  	struct watchdog_device *wdd;
> +	struct fintek_wdt *wd;
>  	int wdt_conf, err = 0;
>  	struct resource *res;
>  	int sioaddr;
> @@ -446,20 +455,27 @@ static int fintek_wdt_probe(struct platform_device *pdev)
>  
>  	sioaddr = res->start;
>  
> -	watchdog.sioaddr = sioaddr;
> -	watchdog.ident.options = WDIOF_SETTIMEOUT
> -				| WDIOF_MAGICCLOSE
> -				| WDIOF_KEEPALIVEPING
> -				| WDIOF_CARDRESET;
> +	wd = devm_kzalloc(&pdev->dev, sizeof(*wd), GFP_KERNEL);
> +	if (!wd)
> +		return -ENOMEM;
> +
> +	pdata = pdev->dev.platform_data;
> +
> +	wd->type = pdata->type;
> +	wd->sioaddr = sioaddr;
> +	wd->ident.options = WDIOF_SETTIMEOUT
> +			| WDIOF_MAGICCLOSE
> +			| WDIOF_KEEPALIVEPING
> +			| WDIOF_CARDRESET;
>  
> -	snprintf(watchdog.ident.identity,
> -		sizeof(watchdog.ident.identity), "%s watchdog",
> -		fintek_wdt_names[watchdog.type]);
> +	snprintf(wd->ident.identity,
> +		sizeof(wd->ident.identity), "%s watchdog",
> +		fintek_wdt_names[wd->type]);
>  
>  	err = superio_enter(sioaddr);
>  	if (err)
>  		return err;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
>  	wdt_conf = superio_inb(sioaddr, F71808FG_REG_WDT_CONF);
>  
> @@ -470,19 +486,20 @@ static int fintek_wdt_probe(struct platform_device *pdev)
>  	superio_outb(sioaddr, F71808FG_REG_WDT_CONF,
>  		     wdt_conf | BIT(F71808FG_FLAG_WDTMOUT_STS));
>  
> -	wdd = &watchdog.wdd;
> +	wdd = &wd->wdd;
>  
> -	if (fintek_wdt_is_running(wdt_conf))
> +	if (fintek_wdt_is_running(wd, wdt_conf))
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  
>  	superio_exit(sioaddr);
>  
>  	wdd->parent		= &pdev->dev;
> -	wdd->info               = &watchdog.ident;
> +	wdd->info               = &wd->ident;
>  	wdd->ops                = &fintek_wdt_ops;
>  	wdd->min_timeout        = 1;
>  	wdd->max_timeout        = max_timeout;
>  
> +	watchdog_set_drvdata(wdd, wd);
>  	watchdog_set_nowayout(wdd, nowayout);
>  	watchdog_stop_on_unregister(wdd);
>  	watchdog_stop_on_reboot(wdd);
> @@ -496,13 +513,14 @@ static int fintek_wdt_probe(struct platform_device *pdev)
>  	 * called without a set_timeout before, so it needs to be done here once
>  	 */
>  	fintek_wdt_set_timeout(wdd, timeout);
> -	fintek_wdt_set_pulse_width(pulse_width);
> +	fintek_wdt_set_pulse_width(wd, pulse_width);
>  
>  	return devm_watchdog_register_device(&pdev->dev, wdd);
>  }
>  
>  static int __init fintek_wdt_find(int sioaddr)
>  {
> +	enum chips type;
>  	u16 devid;
>  	int err = superio_enter(sioaddr);
>  	if (err)
> @@ -518,36 +536,36 @@ static int __init fintek_wdt_find(int sioaddr)
>  	devid = force_id ? force_id : superio_inw(sioaddr, SIO_REG_DEVID);
>  	switch (devid) {
>  	case SIO_F71808_ID:
> -		watchdog.type = f71808fg;
> +		type = f71808fg;
>  		break;
>  	case SIO_F71862_ID:
> -		watchdog.type = f71862fg;
> +		type = f71862fg;
>  		break;
>  	case SIO_F71868_ID:
> -		watchdog.type = f71868;
> +		type = f71868;
>  		break;
>  	case SIO_F71869_ID:
>  	case SIO_F71869A_ID:
> -		watchdog.type = f71869;
> +		type = f71869;
>  		break;
>  	case SIO_F71882_ID:
> -		watchdog.type = f71882fg;
> +		type = f71882fg;
>  		break;
>  	case SIO_F71889_ID:
> -		watchdog.type = f71889fg;
> +		type = f71889fg;
>  		break;
>  	case SIO_F71858_ID:
>  		/* Confirmed (by datasheet) not to have a watchdog. */
>  		err = -ENODEV;
>  		goto exit;
>  	case SIO_F81803_ID:
> -		watchdog.type = f81803;
> +		type = f81803;
>  		break;
>  	case SIO_F81865_ID:
> -		watchdog.type = f81865;
> +		type = f81865;
>  		break;
>  	case SIO_F81866_ID:
> -		watchdog.type = f81866;
> +		type = f81866;
>  		break;
>  	default:
>  		pr_info("Unrecognized Fintek device: %04x\n",
> @@ -557,11 +575,12 @@ static int __init fintek_wdt_find(int sioaddr)
>  	}
>  
>  	pr_info("Found %s watchdog chip, revision %d\n",
> -		fintek_wdt_names[watchdog.type],
> +		fintek_wdt_names[type],
>  		(int)superio_inb(sioaddr, SIO_REG_DEVREV));
> +
>  exit:
>  	superio_exit(sioaddr);
> -	return err;
> +	return err ? err : type;
>  }
>  
>  static struct platform_driver fintek_wdt_driver = {
> @@ -576,8 +595,9 @@ static struct platform_device *fintek_wdt_pdev;
>  static int __init fintek_wdt_init(void)
>  {
>  	static const unsigned short addrs[] = { 0x2e, 0x4e };
> +	struct fintek_wdt_pdata pdata;
>  	struct resource wdt_res = {};
> -	int err = -ENODEV;
> +	int ret;
>  	int i;
>  
>  	if (f71862fg_pin != 63 && f71862fg_pin != 56) {
> @@ -586,12 +606,14 @@ static int __init fintek_wdt_init(void)
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
> -		err = fintek_wdt_find(addrs[i]);
> -		if (err == 0)
> +		ret = fintek_wdt_find(addrs[i]);
> +		if (ret >= 0)
>  			break;
>  	}
>  	if (i == ARRAY_SIZE(addrs))
> -		return err;
> +		return ret;
> +
> +	pdata.type = ret;
>  
>  	platform_driver_register(&fintek_wdt_driver);
>  
> @@ -600,7 +622,9 @@ static int __init fintek_wdt_init(void)
>  	wdt_res.start = addrs[i];
>  	wdt_res.end   = addrs[i] + 1;
>  
> -	fintek_wdt_pdev = platform_device_register_simple(DRVNAME, -1, &wdt_res, 1);
> +	fintek_wdt_pdev = platform_device_register_resndata(NULL, DRVNAME, -1,
> +							    &wdt_res, 1,
> +							    &pdata, sizeof(pdata));
>  	if (IS_ERR(fintek_wdt_pdev)) {
>  		platform_driver_unregister(&fintek_wdt_driver);
>  		return PTR_ERR(fintek_wdt_pdev);
> -- 
> git-series 0.9.1
