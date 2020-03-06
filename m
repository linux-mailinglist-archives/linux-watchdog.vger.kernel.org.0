Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAC817C181
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 16:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgCFPOz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 10:14:55 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34226 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgCFPOz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 10:14:55 -0500
Received: by mail-pg1-f195.google.com with SMTP id t3so1226946pgn.1;
        Fri, 06 Mar 2020 07:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9MQgNBQB0Ba5isV9Xt9s4/AmGLQfQoY4Kt6E/lP/yz0=;
        b=b2JpRXmJdb1P8YQgXHEjXArE0g9Byf37wOLp3NSkSSBg5/JOdPJPK+iAAdGPaAc0ci
         O+3Mp6hUNSvxM3r7Q7ECPrZwY+RLcXSKU2Jdf+ZfnKSMVxS0oVuDJzQnltR9DmLQhr+b
         mh91DqjGQSjKgL86saqTyT5Q2xhW4qWwpZXqJ9amycy2bX4Z1daKdnAuteN9/ur/ypMw
         HR67JCV0IC3qYA6ZSKICSHX+rlhu2aj7CYCkDTs/jT5NGi2RQRz5FAZnI3YZKc6TmKJe
         H+9U/2MA/uaTfN0Ql3Hp+dVCuMrv6uO1b0BeJ6Nx5RWOktkm59UhobNIufcYjXQXcJlH
         /RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9MQgNBQB0Ba5isV9Xt9s4/AmGLQfQoY4Kt6E/lP/yz0=;
        b=iH8sSlidz9kQFN9E/DOSfRabSeyIuG7okmPT9UXh7so5kfkc1pEnkJfSLfdGrbFT8Y
         FDuQ+k5oAjEVJNzIkMSHdizvkfVnKN5JvnmloXFuasZxQWyAuSucbrNZ26wHkG1WF+fm
         Si7WMTUOzp6pmf6YuIV36DLXiYFezr22t6n+JsVf6oHX5A99/2onace5xxYf4+TqFJs8
         NZMgi6xb6/A0BnIW09RCXC8wjaZ2bm+lQi+422O3NGJNGDGVcf6iYS/NoMf7v6WyoCwP
         5JcR4yKTtR4NLt/jHf8ufI64ulyAOua4T2F9ApFU0cGpDV+NHROS4q63qmhUfB2lT691
         CIYw==
X-Gm-Message-State: ANhLgQ3uXVTgKg6omlrycU21RIPapaP7pr0j75vvr1Cz+tRndqQKCohP
        fnsVXZNSrm85AaBveaAprtLlbHlv
X-Google-Smtp-Source: ADFU+vs7RtLyCS36yggXHmF7IGETDJanIpjXXUJKGNjE6Lk6wabu67gU8HI5jEkYQFtGfTXZNtZviA==
X-Received: by 2002:a62:be04:: with SMTP id l4mr1457399pff.234.1583507692075;
        Fri, 06 Mar 2020 07:14:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s125sm35979909pgc.53.2020.03.06.07.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 07:14:51 -0800 (PST)
Subject: Re: [PATCH 6/7] watchdog: dw_wdt: Add pre-timeouts support
To:     Sergey.Semin@baikalelectronics.ru,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132834.490C68030707@mail.baikalelectronics.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <cc4337dd-3d32-93ab-c4c9-62ea4475aae2@roeck-us.net>
Date:   Fri, 6 Mar 2020 07:14:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306132834.490C68030707@mail.baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/6/20 5:27 AM, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> DW Watchdog can rise an interrupt in case if IRQ request mode
> is enabled and timer reaches the zero value. In this case the IRQ
> lane is left pending until either the next watchdog kick event
> (watchdog restart) or until the WDT_EOI register is read or
> the device/system reset. This interface can be used to implement
> the pre-timeout functionality optionally provided by the Linux kernel
> watchdog devices.
> 
> IRQ mode provides a two stages timeout interface. It means the IRQ is
> raised when the counter reaches zero, while the system reset occurs
> only after subsequent timeout if the timer restart is not performed.
> Due to this peculiarity the pre-timeout value is actually set to the
> achieved hardware timeout, while the real watchdog timeout is
> considered to be twice as much of it. This applies a significant
> limitation on the pre-timeout values, so current implementation
> supports either zero value, which disables the pre-timeout events, or
> non-zero values, which imply the pre-timeout to be at least half
> of the current watchdog timeout.
> 
> Note that we ask the interrupt controller to detect the rising-edge
> pre-timeout interrupts to prevent the high-level-IRQs flood, since
> if the pre-timeout happens, the IRQ lane will be left pending until
> it's cleared by the timer restart.
> 
> Seeing all currently supported platforms, which have the DW Watchdog
> installed, provide the interrupt property in the corresponding watchdog
> dts node, we can define the IRQ to be mandatory.

I don't see this as valid argument. It is only needed if one wants to have
pretimeout support, and if one doesn't it is simply not necessary.
"Everyone uses it" is not an argument - someone else might come tomorrow
and not want to use it.

Guenter

> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  drivers/watchdog/dw_wdt.c | 125 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 117 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index eb909c63a1b5..3000120f7e39 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -21,6 +21,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> +#include <linux/interrupt.h>
>  #include <linux/of.h>
>  #include <linux/pm.h>
>  #include <linux/platform_device.h>
> @@ -35,6 +36,8 @@
>  #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
>  #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
>  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
> +#define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
> +#define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
>  #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
>  #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
>  
> @@ -58,11 +61,17 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
>  		 "(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +enum dw_wdt_rmod {
> +	DW_WDT_RMOD_RESET = 1,
> +	DW_WDT_RMOD_IRQ = 2
> +};
> +
>  struct dw_wdt {
>  	void __iomem		*regs;
>  	struct clk		*clk;
>  	struct clk		*pclk;
>  	unsigned long		rate;
> +	enum dw_wdt_rmod	rmod;
>  	unsigned int		max_top;
>  	unsigned int		timeouts[DW_WDT_NUM_TOPS];
>  	struct watchdog_device	wdd;
> @@ -80,6 +89,20 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
>  		WDOG_CONTROL_REG_WDT_EN_MASK;
>  }
>  
> +static void dw_wdt_update_mode(struct dw_wdt *dw_wdt, enum dw_wdt_rmod rmod)
> +{
> +	u32 val;
> +
> +	val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> +	if (rmod == DW_WDT_RMOD_IRQ)
> +		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	else
> +		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> +
> +	dw_wdt->rmod = rmod;
> +}
> +
>  static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
>  					 unsigned int timeout, u32 *top)
>  {
> @@ -141,7 +164,11 @@ static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
>  {
>  	int top = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET) & 0xF;
>  
> -	return dw_wdt->timeouts[top];
> +	/*
> +	 * In IRQ mode due to the two stages counter, the actual timeout is
> +	 * twice greater than the TOP setting.
> +	 */
> +	return (dw_wdt->timeouts[top] * dw_wdt->rmod);
>  }
>  
>  static int dw_wdt_ping(struct watchdog_device *wdd)
> @@ -160,7 +187,21 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
>  	unsigned int timeout;
>  	u32 top;
>  
> -	timeout = dw_wdt_find_best_top(dw_wdt, req * MSEC_PER_SEC, &top);
> +	/*
> +	 * We try to find a timeout achievable by the device or set the maximum
> +	 * one. Note IRQ mode being enabled means having a non-zero pre-timeout
> +	 * setup. In this case we try to find a TOP as close to the half of the
> +	 * requested timeout as possible since DW Watchdog IRQ mode is designed
> +	 * in two stages way - first timeout rises the pre-timeout interrupt,
> +	 * second timeout performs the system reset.
> +	 */
> +	timeout = dw_wdt_find_best_top(dw_wdt,
> +		req * (MSEC_PER_SEC / dw_wdt->rmod), &top);
> +	timeout = (timeout * dw_wdt->rmod) / MSEC_PER_SEC;
> +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
> +		wdd->pretimeout = timeout / dw_wdt->rmod;
> +	else
> +		wdd->pretimeout = 0;
>  
>  	/*
>  	 * Set the new value in the watchdog.  Some versions of dw_wdt
> @@ -171,6 +212,10 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
>  	writel(top | top << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  
> +	/* Kick new TOP value into the watchdog counter if activated. */
> +	if (watchdog_active(wdd))
> +		dw_wdt_ping(wdd);
> +
>  	/*
>  	 * In case users set bigger timeout value than HW can support,
>  	 * kernel(watchdog_dev.c) helps to feed watchdog before
> @@ -179,7 +224,22 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int req)
>  	if (req * MSEC_PER_SEC > wdd->max_hw_heartbeat_ms)
>  		wdd->timeout = req;
>  	else
> -		wdd->timeout = timeout / MSEC_PER_SEC;
> +		wdd->timeout = timeout;
> +
> +	return 0;
> +}
> +
> +static int dw_wdt_set_pretimeout(struct watchdog_device *wdd, unsigned int req)
> +{
> +	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> +
> +	/*
> +	 * We ignore actual value of the timeout passed from user-space
> +	 * using it as a flag whether the pretimeout functionality is intended
> +	 * to be activated.
> +	 */
> +	dw_wdt_update_mode(dw_wdt, req ? DW_WDT_RMOD_IRQ : DW_WDT_RMOD_RESET);
> +	dw_wdt_set_timeout(wdd, wdd->timeout);
>  
>  	return 0;
>  }
> @@ -188,8 +248,11 @@ static void dw_wdt_arm_system_reset(struct dw_wdt *dw_wdt)
>  {
>  	u32 val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
>  
> -	/* Disable interrupt mode; always perform system reset. */
> -	val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	/* Disable/enable interrupt mode depending on the RMOD flag. */
> +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
> +		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	else
> +		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
>  	/* Enable watchdog. */
>  	val |= WDOG_CONTROL_REG_WDT_EN_MASK;
>  	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> @@ -227,6 +290,7 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
>  
>  	writel(0, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> +	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
>  	if (dw_wdt_is_enabled(dw_wdt))
>  		writel(WDOG_COUNTER_RESTART_KICK_VALUE,
>  		       dw_wdt->regs + WDOG_COUNTER_RESTART_REG_OFFSET);
> @@ -242,14 +306,24 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
>  static unsigned int dw_wdt_get_timeleft(struct watchdog_device *wdd)
>  {
>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> +	unsigned int time;
> +	u32 val;
> +
> +	val = readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET);
> +	time = val / dw_wdt->rate;
> +
> +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ) {
> +		val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
> +		if (!val)
> +			time += wdd->pretimeout;
> +	}
>  
> -	return readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET) /
> -		dw_wdt->rate;
> +	return time;
>  }
>  
>  static const struct watchdog_info dw_wdt_ident = {
>  	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
> -			  WDIOF_MAGICCLOSE,
> +			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
>  	.identity	= "Synopsys DesignWare Watchdog",
>  };
>  
> @@ -259,10 +333,29 @@ static const struct watchdog_ops dw_wdt_ops = {
>  	.stop		= dw_wdt_stop,
>  	.ping		= dw_wdt_ping,
>  	.set_timeout	= dw_wdt_set_timeout,
> +	.set_pretimeout	= dw_wdt_set_pretimeout,
>  	.get_timeleft	= dw_wdt_get_timeleft,
>  	.restart	= dw_wdt_restart,
>  };
>  
> +static irqreturn_t dw_wdt_irq(int irq, void *devid)
> +{
> +	struct dw_wdt *dw_wdt = devid;
> +	u32 val;
> +
> +	/*
> +	 * We don't clear the IRQ status. It's supposed to be done by following
> +	 * ping operations.
> +	 */
> +	val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
> +	if (!val)
> +		return IRQ_NONE;
> +
> +	watchdog_notify_pretimeout(&dw_wdt->wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int dw_wdt_suspend(struct device *dev)
>  {
> @@ -398,10 +491,26 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  		goto out_disable_pclk;
>  	}
>  
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		goto out_disable_pclk;
> +
> +	/*
> +	 * We must request rising-edge IRQ, since the lane is left pending
> +	 * either until the next watchdog kick event or up to the system reset.
> +	 */
> +	ret = devm_request_irq(dev, ret, dw_wdt_irq,
> +			       IRQF_SHARED | IRQF_TRIGGER_RISING,
> +			       pdev->name, dw_wdt);
> +	if (ret)
> +		goto out_disable_pclk;
> +
>  	reset_control_deassert(dw_wdt->rst);
>  
>  	dw_wdt_init_timeouts(dw_wdt, dev);
>  
> +	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
> +
>  	wdd = &dw_wdt->wdd;
>  	wdd->info = &dw_wdt_ident;
>  	wdd->ops = &dw_wdt_ops;
> 

