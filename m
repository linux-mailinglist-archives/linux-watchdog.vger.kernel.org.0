Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D350F1A4A0A
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Apr 2020 20:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgDJS7H (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Apr 2020 14:59:07 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:41510 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDJS7H (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Apr 2020 14:59:07 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 979BE8030791;
        Fri, 10 Apr 2020 18:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9ygsVCdspucH; Fri, 10 Apr 2020 21:58:59 +0300 (MSK)
Date:   Fri, 10 Apr 2020 21:59:34 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] watchdog: dw_wdt: Support devices with asynch clocks
Message-ID: <20200410185934.o4aucef2xhbradlp@ubsrv2.baikal.int>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132831.89B658030706@mail.baikalelectronics.ru>
 <20200315142207.GA8424@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200315142207.GA8424@roeck-us.net>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Michael, Stephen, could you take a look at the issue we've got here?

Guenter, my comment is below.

On Sun, Mar 15, 2020 at 07:22:07AM -0700, Guenter Roeck wrote:
> On Fri, Mar 06, 2020 at 04:27:45PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > DW Watchdog IP core can be synthesised with asynchronous timer/APB
> > clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
> > separate clock signals are supposed to be used to feed watchdog timer
> > and APB interface of the device. Currently the driver supports
> > the synchronous mode only. Since there is no way to determine which
> > mode was actually activated for device from its registers, we have to
> > rely on the platform device configuration data. If optional "pclk"
> > clock source is supplied, we consider the device working in asynchronous
> > mode, otherwise the driver falls back to the synchronous configuration.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > ---
> >  drivers/watchdog/dw_wdt.c | 48 +++++++++++++++++++++++++++++++++++----
> >  1 file changed, 43 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> > index 4a57b7d777dc..eb909c63a1b5 100644
> > --- a/drivers/watchdog/dw_wdt.c
> > +++ b/drivers/watchdog/dw_wdt.c
> > @@ -61,6 +61,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
> >  struct dw_wdt {
> >  	void __iomem		*regs;
> >  	struct clk		*clk;
> > +	struct clk		*pclk;
> >  	unsigned long		rate;
> >  	unsigned int		max_top;
> >  	unsigned int		timeouts[DW_WDT_NUM_TOPS];
> > @@ -270,6 +271,7 @@ static int dw_wdt_suspend(struct device *dev)
> >  	dw_wdt->control = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> >  	dw_wdt->timeout = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> >  
> > +	clk_disable_unprepare(dw_wdt->pclk);
> >  	clk_disable_unprepare(dw_wdt->clk);
> >  
> >  	return 0;
> > @@ -283,6 +285,12 @@ static int dw_wdt_resume(struct device *dev)
> >  	if (err)
> >  		return err;
> >  
> > +	err = clk_prepare_enable(dw_wdt->pclk);
> > +	if (err) {
> > +		clk_disable_unprepare(dw_wdt->clk);
> > +		return err;
> > +	}
> > +
> >  	writel(dw_wdt->timeout, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> >  	writel(dw_wdt->control, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> >  
> > @@ -344,9 +352,18 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
> >  	if (IS_ERR(dw_wdt->regs))
> >  		return PTR_ERR(dw_wdt->regs);
> >  
> > -	dw_wdt->clk = devm_clk_get(dev, NULL);
> > -	if (IS_ERR(dw_wdt->clk))
> > -		return PTR_ERR(dw_wdt->clk);
> > +	/*
> > +	 * Try to request the watchdog dedicated timer clock source. It must
> > +	 * be supplied if asynchronous mode is enabled. Otherwise fallback
> > +	 * to the common timer/bus clocks configuration, in which the very first
> > +	 * found clocks supply both timer and APB signals.
> > +	 */
> > +	dw_wdt->clk = devm_clk_get(dev, "tclk");
> > +	if (IS_ERR(dw_wdt->clk)) {
> > +		dw_wdt->clk = devm_clk_get(dev, NULL);
> > +		if (IS_ERR(dw_wdt->clk))
> > +			return PTR_ERR(dw_wdt->clk);
> > +	}
> >  
> >  	ret = clk_prepare_enable(dw_wdt->clk);
> >  	if (ret)
> > @@ -358,10 +375,27 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
> >  		goto out_disable_clk;
> >  	}
> >  
> > +	/*
> > +	 * Request APB clocks if device is configured with async clocks mode.
> > +	 * In this case both tclk and pclk clocks are supposed to be specified.
> > +	 * Alas we can't know for sure whether async mode was really activated,
> > +	 * so the pclk reference is left optional. If it it's failed to be
> > +	 * found we consider the device configured in synchronous clocks mode.
> > +	 */
> > +	dw_wdt->pclk = devm_clk_get_optional(dev, "pclk");
> > +	if (IS_ERR(dw_wdt->pclk)) {
> > +		ret = PTR_ERR(dw_wdt->pclk);
> > +		goto out_disable_clk;
> > +	}
> > +
> > +	ret = clk_prepare_enable(dw_wdt->pclk);
> 
> Not every implementation of clk_enable() checks for a NULL parameter.
> Some return an error. This can not be trusted to work on all platforms /
> architectures.

Hm, this was unexpected twist. I've submitted not a single patch with optional
clock API usage. It was first time I've got a comment like this, that the
API isn't cross-platform. As I see it this isn't the patch problem, but the
platforms/common clock bug. The platforms code must have been submitted before
the optional clock API was introduced or the API hasn't been properly
implemented or we don't understand something.

Stephen, Michael could you clarify the situation with the
cross-platformness of the optional clock API.

-Sergey

> 
> > +	if (ret)
> > +		goto out_disable_clk;
> > +
> >  	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> >  	if (IS_ERR(dw_wdt->rst)) {
> >  		ret = PTR_ERR(dw_wdt->rst);
> > -		goto out_disable_clk;
> > +		goto out_disable_pclk;
> >  	}
> >  
> >  	reset_control_deassert(dw_wdt->rst);
> > @@ -399,10 +433,13 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
> >  
> >  	ret = watchdog_register_device(wdd);
> >  	if (ret)
> > -		goto out_disable_clk;
> > +		goto out_disable_pclk;
> >  
> >  	return 0;
> >  
> > +out_disable_pclk:
> > +	clk_disable_unprepare(dw_wdt->pclk);
> > +
> >  out_disable_clk:
> >  	clk_disable_unprepare(dw_wdt->clk);
> >  	return ret;
> > @@ -414,6 +451,7 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
> >  
> >  	watchdog_unregister_device(&dw_wdt->wdd);
> >  	reset_control_assert(dw_wdt->rst);
> > +	clk_disable_unprepare(dw_wdt->pclk);
> >  	clk_disable_unprepare(dw_wdt->clk);
> >  
> >  	return 0;
