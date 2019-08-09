Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4CE881D0
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 19:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436930AbfHIR6d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 13:58:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43929 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436696AbfHIR6d (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 13:58:33 -0400
Received: by mail-pg1-f194.google.com with SMTP id r26so10265080pgl.10;
        Fri, 09 Aug 2019 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hoLUDR0ymaadczrYuNOU5hYVUgBKWeBJUx8f/pY6HqQ=;
        b=aVX54dBfnoe/pYbYsQVnIlMiEBqetey0o+KKFPunGxNVY26Dfz4+4cn9aIx72uZfc2
         k0C8TVzYupSr1/bgpsbP3FOiwt4C5TzhRibBTzHGpN2ytsPtOeyCi+I9pCQN+d/VRSuH
         N3yzabg7Ooc3vgzKiDh5uVJUCEMNqgz/L7fIxI7E4tWHrkxye2ElRgV2re1qLjXE9O9F
         o5290U8BiGPdZamdhgTDSjpfoEaHYGUXyg7Qz9lpuZWT1qph+pZn70InxFVN3NjZpd4n
         beqjCmOIBE/si+mu6FdoO62wS3Vp1Kpec3hE93kh4/OTRHKduI/f46yX3oxdEfnBdL/0
         dYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hoLUDR0ymaadczrYuNOU5hYVUgBKWeBJUx8f/pY6HqQ=;
        b=gtkorVrFEeidXLNzgdIOQhi0W9dJ/4dDUskJUfErhpdZ7k5L/sJA6qteutkxCJnd9P
         k+KkrfqneosohQXaaXDRhoubltBYKalOKnOrNvJRs4/UX+9+IyvzN1ZR/XtKSZmeP89O
         FnvA2fqBQya3zSBMXLAdmXUxj5UkykPQVJe4UpcUdoTb3A2H1Yvex0CMaqyktMR4OHWb
         g+mqHoTbIPcZFrjKXK+zlX5hV+fEZGYRz5a+CILRZjgGGcUmTEJaC1+WkC1CWS6+rZt0
         uNLy4BBLZP1F1KTQgSGL+BiBp4VJSynYtsk/HM0yhQ5jm6AingfWI3jBFD9cg/0mgIho
         /eFQ==
X-Gm-Message-State: APjAAAV8ZyasEza8+mKXMVbIEIfccgKJePtl6zm2viP/Ke+1SjugRAWH
        ClEx7xKi/ehMlrIaPSj63rY=
X-Google-Smtp-Source: APXvYqyB/fCxUbpVmhBG+8QZ9sVGD88razGQx0G8jbF/M5fnjwVPCclHn0yY0XGOsPwP9z2R+RWFmg==
X-Received: by 2002:a65:6547:: with SMTP id a7mr18308694pgw.65.1565373512090;
        Fri, 09 Aug 2019 10:58:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s24sm99636536pfh.133.2019.08.09.10.58.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 10:58:31 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:58:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Malaterre <malat@debian.org>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH 2/3] watchdog: jz4740: Use regmap provided by TCU driver
Message-ID: <20190809175830.GB23562@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
 <20190809115930.6050-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809115930.6050-3-paul@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 01:59:29PM +0200, Paul Cercueil wrote:
> Since we broke the ABI by changing the clock, the driver was also
> updated to use the regmap provided by the TCU driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig      |  1 +
>  drivers/watchdog/jz4740_wdt.c | 36 +++++++++++++++++++----------------
>  2 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 820d8a472310..78411609048b 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1647,6 +1647,7 @@ config JZ4740_WDT
>  	depends on MACH_JZ4740 || MACH_JZ4780
>  	depends on COMMON_CLK
>  	select WATCHDOG_CORE
> +	select MFD_SYSCON
>  	help
>  	  Hardware driver for the built-in watchdog timer on Ingenic jz4740 SoCs.
>  
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index 07fbd9d96e84..bdf9564efa29 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/mfd/ingenic-tcu.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/types.h>
> @@ -17,6 +18,7 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> +#include <linux/regmap.h>
>  
>  #define DEFAULT_HEARTBEAT 5
>  #define MAX_HEARTBEAT     2048
> @@ -36,7 +38,7 @@ MODULE_PARM_DESC(heartbeat,
>  
>  struct jz4740_wdt_drvdata {
>  	struct watchdog_device wdt;
> -	void __iomem *base;
> +	struct regmap *map;
>  	struct clk *clk;
>  	unsigned long clk_rate;
>  };
> @@ -45,7 +47,8 @@ static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
> -	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
> +	regmap_write(drvdata->map, TCU_REG_WDT_TCNT, 0);
> +
>  	return 0;
>  }
>  
> @@ -54,16 +57,16 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  	u16 timeout_value = (u16)(drvdata->clk_rate * new_timeout);
> -	u8 tcer;
> +	unsigned int tcer;
>  
> -	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
> -	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
> +	regmap_read(drvdata->map, TCU_REG_WDT_TCER, &tcer);
> +	regmap_write(drvdata->map, TCU_REG_WDT_TCER, 0);
>  
> -	writew((u16)timeout_value, drvdata->base + TCU_REG_WDT_TDR);
> -	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
> +	regmap_write(drvdata->map, TCU_REG_WDT_TDR, timeout_value);
> +	regmap_write(drvdata->map, TCU_REG_WDT_TCNT, 0);
>  
>  	if (tcer & TCU_WDT_TCER_TCEN)
> -		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
> +		regmap_write(drvdata->map, TCU_REG_WDT_TCER, TCU_WDT_TCER_TCEN);
>  
>  	wdt_dev->timeout = new_timeout;
>  	return 0;
> @@ -72,20 +75,20 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
> +	unsigned int tcer;
>  	int ret;
> -	u8 tcer;
>  
>  	ret = clk_prepare_enable(drvdata->clk);
>  	if (ret)
>  		return ret;
>  
> -	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
> +	regmap_read(drvdata->map, TCU_REG_WDT_TCER, &tcer);
>  
>  	jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>  
>  	/* Start watchdog if it wasn't started already */
>  	if (!(tcer & TCU_WDT_TCER_TCEN))
> -		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
> +		regmap_write(drvdata->map, TCU_REG_WDT_TCER, TCU_WDT_TCER_TCEN);
>  
>  	return 0;
>  }
> @@ -94,7 +97,7 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
>  
> -	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
> +	regmap_write(drvdata->map, TCU_REG_WDT_TCER, 0);
>  	clk_disable_unprepare(drvdata->clk);
>  
>  	return 0;
> @@ -136,7 +139,6 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct jz4740_wdt_drvdata *drvdata;
>  	struct watchdog_device *jz4740_wdt;
> -	struct resource	*res;
>  	long rate;
>  	int ret;
>  
> @@ -173,9 +175,11 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_nowayout(jz4740_wdt, nowayout);
>  	watchdog_set_drvdata(jz4740_wdt, drvdata);
>  
> -	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(drvdata->base))
> -		return PTR_ERR(drvdata->base);
> +	drvdata->map = device_node_to_regmap(dev->parent->of_node);
> +	if (!drvdata->map) {
> +		dev_err(dev, "regmap not found\n");
> +		return -EINVAL;
> +	}
>  
>  	return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
