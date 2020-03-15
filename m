Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC71185D87
	for <lists+linux-watchdog@lfdr.de>; Sun, 15 Mar 2020 15:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgCOOWL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 15 Mar 2020 10:22:11 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34090 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbgCOOWL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 15 Mar 2020 10:22:11 -0400
Received: by mail-pl1-f194.google.com with SMTP id a23so6653219plm.1;
        Sun, 15 Mar 2020 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K3xVH1fOFQdZ7b9ZW0dRX75KnfJ/3EtgVaMaenV1b+o=;
        b=RlLtbGnBXAJLm5yy9M/5QTN2gCVhZ6p11r4IQox8itK56GGSQaVnBgV6zJZE8QRFTq
         hcRTxQ+qqsyopR5Q6r0Vfjrjm5pOKIQchgzN3xOAzdPhtjUxQxN95/2uCKHgF5nPafDA
         z98lI50JjKXfReIFFeeVRpFrGHSysXsqC89DIQuueyCyC0YsiB4WBL1H16PrHJ9jqqw0
         JE/fwo3GhoPo7t3D0K2CQFLr6g9OT2CSgkOHwgxwbJpfV0IoWuXFX20glRdyYacyfRPo
         QEytKL9gTWUWBDD4OCut64CXly6O/kx1Z1eX4nSXu6iI+bFCqS4/Ay6bqB8kHaBrG1t9
         q76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=K3xVH1fOFQdZ7b9ZW0dRX75KnfJ/3EtgVaMaenV1b+o=;
        b=iCHu1z79Lf5FeU13dClp7opEgmDGWUdWK7VfApBVfJ89Wh10zSr/OCVqtvd4XWlGCY
         0yPcmnbpy4kDK7zLM+F4804ULblYiYJEqPh2Q9ukW9vYXqeA18HGzwws4GRO5ZiYm8Pk
         cM7yj2pwtTGSD6CZTgdl06AnElqGmdF2Kl6K0SNuKoEjHSswXHxurebHwF8esKTaassD
         xKPbDNflyTcJmS1Zo6f2h33Bn6y7ppGEqtjYirjxemOfN3Zy9wDRwP2dq+RgsBQLhwxe
         yH2WcWUDe+GVFd8cFrmlA4px1xBQar/d5/br2ULXVxcVkgQBBbIYxfQS1ODOHSYM9CRA
         kkYQ==
X-Gm-Message-State: ANhLgQ3QUFqdpK/NULXT9sBPfzEcYO34JWaqdqqt9ugz0niV/A4OPTPp
        Ez8yFIRe/tlPXDwJ2lmS6k9sWmaT
X-Google-Smtp-Source: ADFU+vtP7cjzok/E/CUmkgETn1ddhtiKHHLA4XN5hQXWczwD80wGoRoMPoMddoXoFAYecUqg+/tQkw==
X-Received: by 2002:a17:902:b210:: with SMTP id t16mr21673618plr.65.1584282129632;
        Sun, 15 Mar 2020 07:22:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 134sm11273481pfy.27.2020.03.15.07.22.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 07:22:08 -0700 (PDT)
Date:   Sun, 15 Mar 2020 07:22:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] watchdog: dw_wdt: Support devices with asynch clocks
Message-ID: <20200315142207.GA8424@roeck-us.net>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132831.89B658030706@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306132831.89B658030706@mail.baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 06, 2020 at 04:27:45PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> DW Watchdog IP core can be synthesised with asynchronous timer/APB
> clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
> separate clock signals are supposed to be used to feed watchdog timer
> and APB interface of the device. Currently the driver supports
> the synchronous mode only. Since there is no way to determine which
> mode was actually activated for device from its registers, we have to
> rely on the platform device configuration data. If optional "pclk"
> clock source is supplied, we consider the device working in asynchronous
> mode, otherwise the driver falls back to the synchronous configuration.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  drivers/watchdog/dw_wdt.c | 48 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 4a57b7d777dc..eb909c63a1b5 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -61,6 +61,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
>  struct dw_wdt {
>  	void __iomem		*regs;
>  	struct clk		*clk;
> +	struct clk		*pclk;
>  	unsigned long		rate;
>  	unsigned int		max_top;
>  	unsigned int		timeouts[DW_WDT_NUM_TOPS];
> @@ -270,6 +271,7 @@ static int dw_wdt_suspend(struct device *dev)
>  	dw_wdt->control = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
>  	dw_wdt->timeout = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  
> +	clk_disable_unprepare(dw_wdt->pclk);
>  	clk_disable_unprepare(dw_wdt->clk);
>  
>  	return 0;
> @@ -283,6 +285,12 @@ static int dw_wdt_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	err = clk_prepare_enable(dw_wdt->pclk);
> +	if (err) {
> +		clk_disable_unprepare(dw_wdt->clk);
> +		return err;
> +	}
> +
>  	writel(dw_wdt->timeout, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  	writel(dw_wdt->control, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
>  
> @@ -344,9 +352,18 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(dw_wdt->regs))
>  		return PTR_ERR(dw_wdt->regs);
>  
> -	dw_wdt->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(dw_wdt->clk))
> -		return PTR_ERR(dw_wdt->clk);
> +	/*
> +	 * Try to request the watchdog dedicated timer clock source. It must
> +	 * be supplied if asynchronous mode is enabled. Otherwise fallback
> +	 * to the common timer/bus clocks configuration, in which the very first
> +	 * found clocks supply both timer and APB signals.
> +	 */
> +	dw_wdt->clk = devm_clk_get(dev, "tclk");
> +	if (IS_ERR(dw_wdt->clk)) {
> +		dw_wdt->clk = devm_clk_get(dev, NULL);
> +		if (IS_ERR(dw_wdt->clk))
> +			return PTR_ERR(dw_wdt->clk);
> +	}
>  
>  	ret = clk_prepare_enable(dw_wdt->clk);
>  	if (ret)
> @@ -358,10 +375,27 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  		goto out_disable_clk;
>  	}
>  
> +	/*
> +	 * Request APB clocks if device is configured with async clocks mode.
> +	 * In this case both tclk and pclk clocks are supposed to be specified.
> +	 * Alas we can't know for sure whether async mode was really activated,
> +	 * so the pclk reference is left optional. If it it's failed to be
> +	 * found we consider the device configured in synchronous clocks mode.
> +	 */
> +	dw_wdt->pclk = devm_clk_get_optional(dev, "pclk");
> +	if (IS_ERR(dw_wdt->pclk)) {
> +		ret = PTR_ERR(dw_wdt->pclk);
> +		goto out_disable_clk;
> +	}
> +
> +	ret = clk_prepare_enable(dw_wdt->pclk);

Not every implementation of clk_enable() checks for a NULL parameter.
Some return an error. This can not be trusted to work on all platforms /
architectures.

> +	if (ret)
> +		goto out_disable_clk;
> +
>  	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
>  	if (IS_ERR(dw_wdt->rst)) {
>  		ret = PTR_ERR(dw_wdt->rst);
> -		goto out_disable_clk;
> +		goto out_disable_pclk;
>  	}
>  
>  	reset_control_deassert(dw_wdt->rst);
> @@ -399,10 +433,13 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  
>  	ret = watchdog_register_device(wdd);
>  	if (ret)
> -		goto out_disable_clk;
> +		goto out_disable_pclk;
>  
>  	return 0;
>  
> +out_disable_pclk:
> +	clk_disable_unprepare(dw_wdt->pclk);
> +
>  out_disable_clk:
>  	clk_disable_unprepare(dw_wdt->clk);
>  	return ret;
> @@ -414,6 +451,7 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
>  
>  	watchdog_unregister_device(&dw_wdt->wdd);
>  	reset_control_assert(dw_wdt->rst);
> +	clk_disable_unprepare(dw_wdt->pclk);
>  	clk_disable_unprepare(dw_wdt->clk);
>  
>  	return 0;
