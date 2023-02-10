Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772236925AD
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Feb 2023 19:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbjBJSrL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Feb 2023 13:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbjBJSrK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Feb 2023 13:47:10 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B846E2748B;
        Fri, 10 Feb 2023 10:46:53 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id y17-20020a4ade11000000b0051762fdf955so620452oot.3;
        Fri, 10 Feb 2023 10:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwjFHE2WCeedwk4Ul5BLBOk2dOLSdKUShflb4M1ORn0=;
        b=CoZOgjn4tlIm4i3BqhchLol8SxzuduqpcCTDcoSF33+I1d5E9/lOqP0h1IWj0u1PHt
         Xsf00FGwvtoOW5I+nJ9/BxLCrc3GUmiPuoGSyMyNaXtF3LkgbuuHYIODjJHHg4qUXB7H
         5gWBsFRHmN5skXmL8Mw6qF80jytfwttxt3/1WgtSwjgfS6+2LG1J/2+gJ0lr3FUQw0/U
         58NbIHYP5kIIYZxYiqs5NJclqtpvjoP230StwZ/5AfQdPg8TsDQOlmQ3spaqnTiuMgoV
         1GKUPg74qVcRT1spw1aICM6fj363fX9oEO0HDoXDTFBcASQgm0rjCpJ+m//TVVJBCax1
         WONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwjFHE2WCeedwk4Ul5BLBOk2dOLSdKUShflb4M1ORn0=;
        b=MVOsv0vvKxg8mzmpUrpkJZGKOt/6x17IhB2IuU/lPdgdLeKEk7K06yVWW49SNTPV6o
         5DqgoDGAmwhrOnZ6OSNf8iEjYdIwkraTj1foTPGOYFKIiSB53ich2LUZHbUPKMVxuBEg
         LRtCztqoI1Cecstrw8dVu1g0eYmGO9Corz24hWHpXzTeR9mcMrb2LgSthVu8YGkvbm5Y
         tsKGFeFNAycvQGWr0sTizDpSvr1mGX/xPNWQxjpkG7Kk269fLzXm/OI40wFU6Bj/QZOG
         fqdl4JKsn2Up34W9jfv5TL0nnDpZzPUu/sxuglyyK1unUOB6TXwOyHUrx1yVFDqVguQO
         vfGw==
X-Gm-Message-State: AO0yUKUgLJqXPwiX96oLLXMi2FkkkEQc9cnvNEewJlAv+u9KhcX4da6W
        4A85ksl/EzMHkokbBOjmhw8=
X-Google-Smtp-Source: AK7set+dyohZI6NjI2q3dLAsKNT6dM/Gk5XggCjESy3IaxV+9Tig5Io4R/1kP+eVSIPLz6JUw4BMzQ==
X-Received: by 2002:a4a:dece:0:b0:517:a7d1:9762 with SMTP id w14-20020a4adece000000b00517a7d19762mr7898089oou.7.1676054813066;
        Fri, 10 Feb 2023 10:46:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c21-20020a4a4f15000000b0051d1f285509sm1267975oob.6.2023.02.10.10.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:46:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 10 Feb 2023 10:46:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, arinc.unal@arinc9.com,
        tsbogend@alpha.franken.de, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 3/4] watchdog: mt7621-wdt: avoid static global
 declarations
Message-ID: <20230210184651.GD3670524@roeck-us.net>
References: <20230210173841.705783-1-sergio.paracuellos@gmail.com>
 <20230210173841.705783-4-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210173841.705783-4-sergio.paracuellos@gmail.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 10, 2023 at 06:38:40PM +0100, Sergio Paracuellos wrote:
> Instead of using static global definitions in driver code, refactor code
> introducing a new watchdog driver data structure and use it along the
> code.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mt7621_wdt.c | 102 ++++++++++++++++++++++------------
>  1 file changed, 65 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
> index a8aa3522c..40fb2c9ba 100644
> --- a/drivers/watchdog/mt7621_wdt.c
> +++ b/drivers/watchdog/mt7621_wdt.c
> @@ -31,8 +31,11 @@
>  #define TMR1CTL_RESTART			BIT(9)
>  #define TMR1CTL_PRESCALE_SHIFT		16
>  
> -static void __iomem *mt7621_wdt_base;
> -static struct reset_control *mt7621_wdt_reset;
> +struct mt7621_wdt_data {
> +	void __iomem *base;
> +	struct reset_control *rst;
> +	struct watchdog_device wdt;
> +};
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  module_param(nowayout, bool, 0);
> @@ -40,27 +43,31 @@ MODULE_PARM_DESC(nowayout,
>  		 "Watchdog cannot be stopped once started (default="
>  		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> -static inline void rt_wdt_w32(unsigned reg, u32 val)
> +static inline void rt_wdt_w32(void __iomem *base, unsigned reg, u32 val)
>  {
> -	iowrite32(val, mt7621_wdt_base + reg);
> +	iowrite32(val, base + reg);
>  }
>  
> -static inline u32 rt_wdt_r32(unsigned reg)
> +static inline u32 rt_wdt_r32(void __iomem *base, unsigned reg)
>  {
> -	return ioread32(mt7621_wdt_base + reg);
> +	return ioread32(base + reg);
>  }
>  
>  static int mt7621_wdt_ping(struct watchdog_device *w)
>  {
> -	rt_wdt_w32(TIMER_REG_TMRSTAT, TMR1CTL_RESTART);
> +	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> +
> +	rt_wdt_w32(drvdata->base, TIMER_REG_TMRSTAT, TMR1CTL_RESTART);
>  
>  	return 0;
>  }
>  
>  static int mt7621_wdt_set_timeout(struct watchdog_device *w, unsigned int t)
>  {
> +	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> +
>  	w->timeout = t;
> -	rt_wdt_w32(TIMER_REG_TMR1LOAD, t * 1000);
> +	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1LOAD, t * 1000);
>  	mt7621_wdt_ping(w);
>  
>  	return 0;
> @@ -68,29 +75,31 @@ static int mt7621_wdt_set_timeout(struct watchdog_device *w, unsigned int t)
>  
>  static int mt7621_wdt_start(struct watchdog_device *w)
>  {
> +	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
>  	u32 t;
>  
>  	/* set the prescaler to 1ms == 1000us */
> -	rt_wdt_w32(TIMER_REG_TMR1CTL, 1000 << TMR1CTL_PRESCALE_SHIFT);
> +	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, 1000 << TMR1CTL_PRESCALE_SHIFT);
>  
>  	mt7621_wdt_set_timeout(w, w->timeout);
>  
> -	t = rt_wdt_r32(TIMER_REG_TMR1CTL);
> +	t = rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL);
>  	t |= TMR1CTL_ENABLE;
> -	rt_wdt_w32(TIMER_REG_TMR1CTL, t);
> +	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, t);
>  
>  	return 0;
>  }
>  
>  static int mt7621_wdt_stop(struct watchdog_device *w)
>  {
> +	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
>  	u32 t;
>  
>  	mt7621_wdt_ping(w);
>  
> -	t = rt_wdt_r32(TIMER_REG_TMR1CTL);
> +	t = rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL);
>  	t &= ~TMR1CTL_ENABLE;
> -	rt_wdt_w32(TIMER_REG_TMR1CTL, t);
> +	rt_wdt_w32(drvdata->base, TIMER_REG_TMR1CTL, t);
>  
>  	return 0;
>  }
> @@ -105,7 +114,9 @@ static int mt7621_wdt_bootcause(void)
>  
>  static int mt7621_wdt_is_running(struct watchdog_device *w)
>  {
> -	return !!(rt_wdt_r32(TIMER_REG_TMR1CTL) & TMR1CTL_ENABLE);
> +	struct mt7621_wdt_data *drvdata = watchdog_get_drvdata(w);
> +
> +	return !!(rt_wdt_r32(drvdata->base, TIMER_REG_TMR1CTL) & TMR1CTL_ENABLE);
>  }
>  
>  static const struct watchdog_info mt7621_wdt_info = {
> @@ -121,30 +132,39 @@ static const struct watchdog_ops mt7621_wdt_ops = {
>  	.set_timeout = mt7621_wdt_set_timeout,
>  };
>  
> -static struct watchdog_device mt7621_wdt_dev = {
> -	.info = &mt7621_wdt_info,
> -	.ops = &mt7621_wdt_ops,
> -	.min_timeout = 1,
> -	.max_timeout = 0xfffful / 1000,
> -};
> -
>  static int mt7621_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	mt7621_wdt_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mt7621_wdt_base))
> -		return PTR_ERR(mt7621_wdt_base);
> +	struct watchdog_device *mt7621_wdt;
> +	struct mt7621_wdt_data *drvdata;
> +	int err;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
>  
> -	mt7621_wdt_reset = devm_reset_control_get_exclusive(dev, NULL);
> -	if (!IS_ERR(mt7621_wdt_reset))
> -		reset_control_deassert(mt7621_wdt_reset);
> +	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
>  
> -	mt7621_wdt_dev.bootstatus = mt7621_wdt_bootcause();
> +	drvdata->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (!IS_ERR(drvdata->rst))
> +		reset_control_deassert(drvdata->rst);
>  
> -	watchdog_init_timeout(&mt7621_wdt_dev, mt7621_wdt_dev.max_timeout,
> -			      dev);
> -	watchdog_set_nowayout(&mt7621_wdt_dev, nowayout);
> -	if (mt7621_wdt_is_running(&mt7621_wdt_dev)) {
> +	mt7621_wdt = &drvdata->wdt;
> +	mt7621_wdt->info = &mt7621_wdt_info;
> +	mt7621_wdt->ops = &mt7621_wdt_ops;
> +	mt7621_wdt->min_timeout = 1;
> +	mt7621_wdt->max_timeout = 0xfffful / 1000;
> +	mt7621_wdt->parent = dev;
> +
> +	mt7621_wdt->bootstatus = mt7621_wdt_bootcause();
> +
> +	watchdog_init_timeout(mt7621_wdt, mt7621_wdt->max_timeout, dev);
> +	watchdog_set_nowayout(mt7621_wdt, nowayout);
> +	watchdog_set_drvdata(mt7621_wdt, drvdata);
> +
> +	if (mt7621_wdt_is_running(mt7621_wdt)) {
>  		/*
>  		 * Make sure to apply timeout from watchdog core, taking
>  		 * the prescaler of this driver here into account (the
> @@ -154,17 +174,25 @@ static int mt7621_wdt_probe(struct platform_device *pdev)
>  		 * we first disable the watchdog, set the new prescaler
>  		 * and timeout, and then re-enable the watchdog.
>  		 */
> -		mt7621_wdt_stop(&mt7621_wdt_dev);
> -		mt7621_wdt_start(&mt7621_wdt_dev);
> -		set_bit(WDOG_HW_RUNNING, &mt7621_wdt_dev.status);
> +		mt7621_wdt_stop(mt7621_wdt);
> +		mt7621_wdt_start(mt7621_wdt);
> +		set_bit(WDOG_HW_RUNNING, &mt7621_wdt->status);
>  	}
>  
> -	return devm_watchdog_register_device(dev, &mt7621_wdt_dev);
> +	err = devm_watchdog_register_device(dev, &drvdata->wdt);
> +	if (err)
> +		return err;
> +
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	return 0;
>  }
>  
>  static void mt7621_wdt_shutdown(struct platform_device *pdev)
>  {
> -	mt7621_wdt_stop(&mt7621_wdt_dev);
> +	struct mt7621_wdt_data *drvdata = platform_get_drvdata(pdev);
> +
> +	mt7621_wdt_stop(&drvdata->wdt);
>  }
>  
>  static const struct of_device_id mt7621_wdt_match[] = {
> -- 
> 2.25.1
> 
