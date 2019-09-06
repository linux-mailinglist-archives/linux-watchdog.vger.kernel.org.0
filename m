Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC45AB8B3
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 15:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392767AbfIFM7m (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 08:59:42 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39751 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389339AbfIFM7k (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 08:59:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id s12so4427582pfe.6;
        Fri, 06 Sep 2019 05:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A6ci3xjnNB/pGN8cbhPU+nYoJ+P8/SM6iHz9JGmMhLQ=;
        b=V5SzLKgFsltvmd5anLvBtP33fsPzAZ1RnTsXrkQUJ8xgm/gWKYjpkAK7SsKJmHPdVL
         ppmY36+37nzlIaf7Fdgtleu4/fj1inMixYs7ANRRgMFw2oAkWh1nqITEMxkL7Tn6hWys
         rYx79awKu90ZQAsn+q28XQFawjjUO26q6qG7p81ngAxCGs20iq3IMkFnDef3vK84P/Jk
         QKDy0ad0Q/zvlE40w80DSE474ZUWkEFSDknPhaYiusHyLgVNwMAts3ocg/6GT3YEYC5t
         jS9okUbxWL/14+XWgaKHAoNIPBSPcMqGSU/xBi/alSFkIzqFeiw/8Y83U4bzFX/fU58s
         sjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=A6ci3xjnNB/pGN8cbhPU+nYoJ+P8/SM6iHz9JGmMhLQ=;
        b=jbRJ8kFKjNYsH3EHvkX0mumLRrBjbAlk1qmavQOfpl4sEaCl9XEkeTEiIuhJuZ4AiH
         7eElNyx/EsiKIgDwl2RSYZP2+Nv6BmBUmeCOM4vl67NOBj1AO77ZQA0Ubly9sBkhj2N0
         6M08m+AS+0QwewO7Y7AJB2Jc2V8GtBU+wI3P5aAem2hEzat+ZfT37Zn8UdShyx5sqeTe
         1UXQqnXK2kdAKR/fz2lBGkVI/MWGpJ0ju+QKthwYovyRXwrdL4Lm1lVwT+i9UOo062Qf
         TB/JpGwTjQhjiwvf2TPKJFyg3BwLpq8HMA7OWWu0q6QEz75pOECX6D+VEYDU0x0mT38i
         WrTQ==
X-Gm-Message-State: APjAAAXvCcUkhVAgXG+dEYkS/amGfM20qxQWLKzPGqYEN0Luso6laqil
        81UULKTsVCwWrcGSgQ1Ryh4=
X-Google-Smtp-Source: APXvYqx10Xl/kmRsIAR2VNFb7DNI7jSZHSSWym00PkOxVWo5IB35I3FbuHpR1z/s8P0mXMagKg9n0w==
X-Received: by 2002:a65:6401:: with SMTP id a1mr7833679pgv.42.1567774780016;
        Fri, 06 Sep 2019 05:59:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x2sm5724996pfa.89.2019.09.06.05.59.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 05:59:38 -0700 (PDT)
Date:   Fri, 6 Sep 2019 05:59:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, wim@linux-watchdog.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq
 is available
Message-ID: <20190906125937.GA7255@roeck-us.net>
References: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
 <20190905211913.GA31094@roeck-us.net>
 <68ca07e6-efa2-d5bd-111b-faaa86808192@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ca07e6-efa2-d5bd-111b-faaa86808192@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 05, 2019 at 11:34:03PM +0200, Jorge Ramirez wrote:
> On 9/5/19 23:19, Guenter Roeck wrote:
> > On Thu, Sep 05, 2019 at 11:00:35PM +0200, Jorge Ramirez-Ortiz wrote:
> >> Use the bark interrupt as the pre-timeout notifier whenever this
> >> interrupt is available.
> >>
> >> By default, the pretimeout notification shall occur one second earlier
> >> than the timeout.
> >>
> >> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> >> ---
> >>  v4:
> >>      address Guenter Roeck comments as follows:
> >>        remove unnecessary include and private variable
> >>        provide macro for WDT EN register values
> >>        use pretimeout as per its API intent
> >>        handle EPROBE_DEFER on get_irq
> >>      also:
> >>        handle the irq registration as done in pm8916_wdt.c
> >>  v3:
> >>     remove unnecesary variable added to private.
> >>
> >>  v2:
> >>     register the pre-timeout notifier instead.
> >>
> >>  v1:
> >>  drivers/watchdog/qcom-wdt.c | 64 ++++++++++++++++++++++++++++++++++---
> >>  1 file changed, 59 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> >> index 7be7f87be28f..0f1d29eeb81d 100644
> >> --- a/drivers/watchdog/qcom-wdt.c
> >> +++ b/drivers/watchdog/qcom-wdt.c
> >> @@ -10,6 +10,7 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/watchdog.h>
> >>  #include <linux/of_device.h>
> >> +#include <linux/interrupt.h>
> >>  
> >>  enum wdt_reg {
> >>  	WDT_RST,
> >> @@ -19,6 +20,9 @@ enum wdt_reg {
> >>  	WDT_BITE_TIME,
> >>  };
> >>  
> >> +#define QCOM_WDT_ENABLE		BIT(0)
> >> +#define QCOM_WDT_ENABLE_IRQ	BIT(1)
> >> +
> > 
> > Using BIT() requires "#include <linux/bits.h>".
> 
> do you want it explicitly in the file even if it builds?
> 

May I kindly suggest to read Documentation/process/submit-checklist.rst ?

> > 
> >>  static const u32 reg_offset_data_apcs_tmr[] = {
> >>  	[WDT_RST] = 0x38,
> >>  	[WDT_EN] = 0x40,
> >> @@ -54,15 +58,38 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
> >>  	return container_of(wdd, struct qcom_wdt, wdd);
> >>  }
> >>  
> >> +static inline int qcom_get_enable(struct watchdog_device *wdd)
> >> +{
> >> +	int enable = QCOM_WDT_ENABLE;
> >> +
> >> +	if (wdd->info->options & WDIOF_PRETIMEOUT)
> >> +		enable |= QCOM_WDT_ENABLE_IRQ;
> >> +
> > 
> > Again, the condition needs to be that pretimeout != 0,
> > not that it is supported.
> 
> no I dont think so. doing that would propagate a possible error in some
> pretimeout setup code which would end up enabling an interrupt when it
> shouldnt. so I dont think that doing that would be correct.
> 
If the pretimeout setup code is buggy, it needs to be fixed.

> The interrupt should only be enabled if WDIOF_PRETIMEOUT is configured
> (independently of the pretimeout value); as a matter of fact, if
> pretimeout is 0, the interrupt will trigger at the same time than bark
> (which is what the original code used to do).
> 
The original code did not set bit 1 of the WDT_EN register,
and it did not set the bark time.

> so I'd rather keep this condition unless you strongly oppose to it.
> 

Please feel free to petition  to Wim.

> > 
> >> +	return enable;
> >> +}
> >> +
> >> +static irqreturn_t qcom_wdt_isr(int irq, void *arg)
> >> +{
> >> +	struct watchdog_device *wdd = arg;
> >> +
> >> +	watchdog_notify_pretimeout(wdd);
> >> +
> >> +	return IRQ_HANDLED;
> >> +}
> >> +
> >>  static int qcom_wdt_start(struct watchdog_device *wdd)
> >>  {
> >>  	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
> >> +	unsigned int bark = wdd->timeout;
> >> +
> >> +	if (wdd->pretimeout)
> >> +		bark = bark - wdd->pretimeout;
> > 
> > The if() just adds code and doesn't otherwise do any good.
> 
> yeah, was just for clarity and it is surely removed by the compiler. but
> sure will remove
> 
> > 
> >>  
> >>  	writel(0, wdt_addr(wdt, WDT_EN));
> >>  	writel(1, wdt_addr(wdt, WDT_RST));
> >> -	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
> >> +	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
> >>  	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
> >> -	writel(1, wdt_addr(wdt, WDT_EN));
> >> +	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
> >>  	return 0;
> >>  }
> >>  
> >> @@ -89,6 +116,13 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
> >>  	return qcom_wdt_start(wdd);
> >>  }
> >>  
> >> +static int qcom_wdt_set_pretimeout(struct watchdog_device *wdd,
> >> +				   unsigned int timeout)
> >> +{
> >> +	wdd->pretimeout = timeout;
> >> +	return qcom_wdt_start(wdd);
> >> +}
> >> +
> >>  static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
> >>  			    void *data)
> >>  {
> >> @@ -105,7 +139,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
> >>  	writel(1, wdt_addr(wdt, WDT_RST));
> >>  	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
> >>  	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
> >> -	writel(1, wdt_addr(wdt, WDT_EN));
> >> +	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
> >>  
> >>  	/*
> >>  	 * Actually make sure the above sequence hits hardware before sleeping.
> >> @@ -121,6 +155,7 @@ static const struct watchdog_ops qcom_wdt_ops = {
> >>  	.stop		= qcom_wdt_stop,
> >>  	.ping		= qcom_wdt_ping,
> >>  	.set_timeout	= qcom_wdt_set_timeout,
> >> +	.set_pretimeout	= qcom_wdt_set_pretimeout,
> >>  	.restart        = qcom_wdt_restart,
> >>  	.owner		= THIS_MODULE,
> >>  };
> >> @@ -133,6 +168,15 @@ static const struct watchdog_info qcom_wdt_info = {
> >>  	.identity	= KBUILD_MODNAME,
> >>  };
> >>  
> >> +static const struct watchdog_info qcom_wdt_pt_info = {
> >> +	.options	= WDIOF_KEEPALIVEPING
> >> +			| WDIOF_MAGICCLOSE
> >> +			| WDIOF_SETTIMEOUT
> >> +			| WDIOF_PRETIMEOUT
> >> +			| WDIOF_CARDRESET,
> >> +	.identity	= KBUILD_MODNAME,
> >> +};
> >> +
> >>  static void qcom_clk_disable_unprepare(void *data)
> >>  {
> >>  	clk_disable_unprepare(data);
> >> @@ -146,7 +190,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
> >>  	struct device_node *np = dev->of_node;
> >>  	const u32 *regs;
> >>  	u32 percpu_offset;
> >> -	int ret;
> >> +	int irq, ret;
> >>  
> >>  	regs = of_device_get_match_data(dev);
> >>  	if (!regs) {
> >> @@ -204,7 +248,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
> >>  		return -EINVAL;
> >>  	}
> >>  
> >> -	wdt->wdd.info = &qcom_wdt_info;
> >> +	irq = platform_get_irq(pdev, 0);
> >> +	if (irq > 0) {
> >> +		if (devm_request_irq(dev, irq, qcom_wdt_isr,
> >> +				     IRQF_TRIGGER_RISING, "wdt_bark",
> >> +				     &wdt->wdd))
> >> +			irq = 0;
> >> +	} else if (irq == -EPROBE_DEFER)
> >> +		return -EPROBE_DEFER;
> >> +
> >> +	wdt->wdd.info = irq > 0 ? &qcom_wdt_pt_info : &qcom_wdt_info;
> >> +	wdt->wdd.pretimeout = irq > 0 ? 1 : 0;
> > 
> > Why repeat the conditional ? It seems to me that something like
> > 
> > 	wdt->wdd.info = &qcom_wdt_info;
> > 	...
> > 	if (irq > 0) {
> > 		wdt->wdd.info = &qcom_wdt_pt_info;
> > 		wdt->wdd.pretimeout = 1;
> > 		...
> > 	}
> > 
> > would be much easier and avoid the repeated conditionals.
> 
> I agree. will change.
> 
> > 
> >>  	wdt->wdd.ops = &qcom_wdt_ops;
> >>  	wdt->wdd.min_timeout = 1;
> >>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
> >> -- 
> >> 2.23.0
> >>
> > 
> 
