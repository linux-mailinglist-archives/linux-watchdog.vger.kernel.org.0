Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD7831A4A1B
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Apr 2020 21:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDJTDd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Apr 2020 15:03:33 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:41544 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgDJTDd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Apr 2020 15:03:33 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CC29E8030786;
        Fri, 10 Apr 2020 19:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id K9cWQLxcADxq; Fri, 10 Apr 2020 22:03:29 +0300 (MSK)
Date:   Fri, 10 Apr 2020 22:04:00 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] watchdog: dw_wdt: Add pre-timeouts support
Message-ID: <20200410190400.asprabvo2365uxag@ubsrv2.baikal.int>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132834.490C68030707@mail.baikalelectronics.ru>
 <20200306151455.7470180307C4@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200306151455.7470180307C4@mail.baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 06, 2020 at 07:14:50AM -0800, Guenter Roeck wrote:
> On 3/6/20 5:27 AM, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > DW Watchdog can rise an interrupt in case if IRQ request mode
> > is enabled and timer reaches the zero value. In this case the IRQ
> > lane is left pending until either the next watchdog kick event
> > (watchdog restart) or until the WDT_EOI register is read or
> > the device/system reset. This interface can be used to implement
> > the pre-timeout functionality optionally provided by the Linux kernel
> > watchdog devices.
> > 
> > IRQ mode provides a two stages timeout interface. It means the IRQ is
> > raised when the counter reaches zero, while the system reset occurs
> > only after subsequent timeout if the timer restart is not performed.
> > Due to this peculiarity the pre-timeout value is actually set to the
> > achieved hardware timeout, while the real watchdog timeout is
> > considered to be twice as much of it. This applies a significant
> > limitation on the pre-timeout values, so current implementation
> > supports either zero value, which disables the pre-timeout events, or
> > non-zero values, which imply the pre-timeout to be at least half
> > of the current watchdog timeout.
> > 
> > Note that we ask the interrupt controller to detect the rising-edge
> > pre-timeout interrupts to prevent the high-level-IRQs flood, since
> > if the pre-timeout happens, the IRQ lane will be left pending until
> > it's cleared by the timer restart.
> > 
> > Seeing all currently supported platforms, which have the DW Watchdog
> > installed, provide the interrupt property in the corresponding watchdog
> > dts node, we can define the IRQ to be mandatory.
> 
> I don't see this as valid argument. It is only needed if one wants to have
> pretimeout support, and if one doesn't it is simply not necessary.
> "Everyone uses it" is not an argument - someone else might come tomorrow
> and not want to use it.

Ok. I'll make it optional.

-Sergey

> 
> Guenter
> 
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > ---
> >  drivers/watchdog/dw_wdt.c | 125 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 117 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> > index eb909c63a1b5..3000120f7e39 100644
> > --- a/drivers/watchdog/dw_wdt.c
> > +++ b/drivers/watchdog/dw_wdt.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/moduleparam.h>
> > +#include <linux/interrupt.h>
> >  #include <linux/of.h>
> >  #include <linux/pm.h>
> >  #include <linux/platform_device.h>
> > @@ -35,6 +36,8 @@
> >  #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
> >  #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
> >  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
> > +#define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
> > +#define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
> >  #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
> >  #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
> >  
> > @@ -58,11 +61,17 @@ module_param(nowayout, bool, 0);
> >  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
> >  		 "(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> >  
> > +enum dw_wdt_rmod {
> > +	DW_WDT_RMOD_RESET = 1,
> > +	DW_WDT_RMOD_IRQ = 2
> > +};
> > +
> >  struct dw_wdt {
> >  	void __iomem		*regs;
> >  	struct clk		*clk;
> >  	struct clk		*pclk;
> >  	unsigned long		rate;
> > +	enum dw_wdt_rmod	rmod;
> >  	unsigned int		max_top;
> >  	unsigned int		timeouts[DW_WDT_NUM_TOPS];
> >  	struct watchdog_device	wdd;
> > @@ -80,6 +89,20 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
> >  		WDOG_CONTROL_REG_WDT_EN_MASK;
> >  }
> >  
> > +static void dw_wdt_update_mode(struct dw_wdt *dw_wdt, enum dw_wdt_rmod rmod)
> > +{
> > +	u32 val;
> > +
> > +	val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> > +	if (rmod == DW_WDT_RMOD_IRQ)
> > +		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
> > +	else
> > +		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
> > +	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> > +
> > +	dw_wdt->rmod = rmod;
> > +}
> > +
> >  static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
> >  					 unsigned int timeout, u32 *top)
> >  {
> > @@ -141,7 +164,11 @@ static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
> >  {
> >  	int top = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET) & 0xF;
> >  
> > -	return dw_wdt->timeouts[top];
> > +	/*
> > +	 * In IRQ mode due to the two stages counter, the actual timeout is
> > +	 * twice greater than the TOP setting.
> > +	 */
> > +	return (dw_wdt->timeouts[top] * dw_wdt->rmod);
> >  }
> >  
> >  static int dw_wdt_ping(struct watchdog_device *wdd)
> > @@ -160,7 +187,21 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
> >  	unsigned int timeout;
> >  	u32 top;
> >  
> > -	timeout = dw_wdt_find_best_top(dw_wdt, req * MSEC_PER_SEC, &top);
> > +	/*
> > +	 * We try to find a timeout achievable by the device or set the maximum
> > +	 * one. Note IRQ mode being enabled means having a non-zero pre-timeout
> > +	 * setup. In this case we try to find a TOP as close to the half of the
> > +	 * requested timeout as possible since DW Watchdog IRQ mode is designed
> > +	 * in two stages way - first timeout rises the pre-timeout interrupt,
> > +	 * second timeout performs the system reset.
> > +	 */
> > +	timeout = dw_wdt_find_best_top(dw_wdt,
> > +		req * (MSEC_PER_SEC / dw_wdt->rmod), &top);
> > +	timeout = (timeout * dw_wdt->rmod) / MSEC_PER_SEC;
> > +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
> > +		wdd->pretimeout = timeout / dw_wdt->rmod;
> > +	else
> > +		wdd->pretimeout = 0;
> >  
> >  	/*
> >  	 * Set the new value in the watchdog.  Some versions of dw_wdt
> > @@ -171,6 +212,10 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
> >  	writel(top | top << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
> >  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> >  
> > +	/* Kick new TOP value into the watchdog counter if activated. */
> > +	if (watchdog_active(wdd))
> > +		dw_wdt_ping(wdd);
> > +
> >  	/*
> >  	 * In case users set bigger timeout value than HW can support,
> >  	 * kernel(watchdog_dev.c) helps to feed watchdog before
> > @@ -179,7 +224,22 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
> >  	if (req * MSEC_PER_SEC > wdd->max_hw_heartbeat_ms)
> >  		wdd->timeout = req;
> >  	else
> > -		wdd->timeout = timeout / MSEC_PER_SEC;
> > +		wdd->timeout = timeout;
> > +
> > +	return 0;
> > +}
> > +
> > +static int dw_wdt_set_pretimeout(struct watchdog_device *wdd, unsigned int req)
> > +{
> > +	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> > +
> > +	/*
> > +	 * We ignore actual value of the timeout passed from user-space
> > +	 * using it as a flag whether the pretimeout functionality is intended
> > +	 * to be activated.
> > +	 */
> > +	dw_wdt_update_mode(dw_wdt, req ? DW_WDT_RMOD_IRQ : DW_WDT_RMOD_RESET);
> > +	dw_wdt_set_timeout(wdd, wdd->timeout);
> >  
> >  	return 0;
> >  }
> > @@ -188,8 +248,11 @@ static void dw_wdt_arm_system_reset(struct dw_wdt *dw_wdt)
> >  {
> >  	u32 val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> >  
> > -	/* Disable interrupt mode; always perform system reset. */
> > -	val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
> > +	/* Disable/enable interrupt mode depending on the RMOD flag. */
> > +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
> > +		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
> > +	else
> > +		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
> >  	/* Enable watchdog. */
> >  	val |= WDOG_CONTROL_REG_WDT_EN_MASK;
> >  	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> > @@ -227,6 +290,7 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
> >  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> >  
> >  	writel(0, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> > +	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
> >  	if (dw_wdt_is_enabled(dw_wdt))
> >  		writel(WDOG_COUNTER_RESTART_KICK_VALUE,
> >  		       dw_wdt->regs + WDOG_COUNTER_RESTART_REG_OFFSET);
> > @@ -242,14 +306,24 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
> >  static unsigned int dw_wdt_get_timeleft(struct watchdog_device *wdd)
> >  {
> >  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> > +	unsigned int time;
> > +	u32 val;
> > +
> > +	val = readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET);
> > +	time = val / dw_wdt->rate;
> > +
> > +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ) {
> > +		val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
> > +		if (!val)
> > +			time += wdd->pretimeout;
> > +	}
> >  
> > -	return readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET) /
> > -		dw_wdt->rate;
> > +	return time;
> >  }
> >  
> >  static const struct watchdog_info dw_wdt_ident = {
> >  	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
> > -			  WDIOF_MAGICCLOSE,
> > +			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
> >  	.identity	= "Synopsys DesignWare Watchdog",
> >  };
> >  
> > @@ -259,10 +333,29 @@ static const struct watchdog_ops dw_wdt_ops = {
> >  	.stop		= dw_wdt_stop,
> >  	.ping		= dw_wdt_ping,
> >  	.set_timeout	= dw_wdt_set_timeout,
> > +	.set_pretimeout	= dw_wdt_set_pretimeout,
> >  	.get_timeleft	= dw_wdt_get_timeleft,
> >  	.restart	= dw_wdt_restart,
> >  };
> >  
> > +static irqreturn_t dw_wdt_irq(int irq, void *devid)
> > +{
> > +	struct dw_wdt *dw_wdt = devid;
> > +	u32 val;
> > +
> > +	/*
> > +	 * We don't clear the IRQ status. It's supposed to be done by following
> > +	 * ping operations.
> > +	 */
> > +	val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
> > +	if (!val)
> > +		return IRQ_NONE;
> > +
> > +	watchdog_notify_pretimeout(&dw_wdt->wdd);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  #ifdef CONFIG_PM_SLEEP
> >  static int dw_wdt_suspend(struct device *dev)
> >  {
> > @@ -398,10 +491,26 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
> >  		goto out_disable_pclk;
> >  	}
> >  
> > +	ret = platform_get_irq(pdev, 0);
> > +	if (ret < 0)
> > +		goto out_disable_pclk;
> > +
> > +	/*
> > +	 * We must request rising-edge IRQ, since the lane is left pending
> > +	 * either until the next watchdog kick event or up to the system reset.
> > +	 */
> > +	ret = devm_request_irq(dev, ret, dw_wdt_irq,
> > +			       IRQF_SHARED | IRQF_TRIGGER_RISING,
> > +			       pdev->name, dw_wdt);
> > +	if (ret)
> > +		goto out_disable_pclk;
> > +
> >  	reset_control_deassert(dw_wdt->rst);
> >  
> >  	dw_wdt_init_timeouts(dw_wdt, dev);
> >  
> > +	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
> > +
> >  	wdd = &dw_wdt->wdd;
> >  	wdd->info = &dw_wdt_ident;
> >  	wdd->ops = &dw_wdt_ops;
> > 
> 
