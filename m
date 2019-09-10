Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56014AF0E2
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2019 20:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfIJSG7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Sep 2019 14:06:59 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32990 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfIJSG6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Sep 2019 14:06:58 -0400
Received: by mail-pg1-f195.google.com with SMTP id n190so10154733pgn.0;
        Tue, 10 Sep 2019 11:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dXgeG1Jgy+30eWkSDn68YGMH9mz3gqac+cRsxXc/erE=;
        b=aHqnupbjLJ4uPpjAENLyYZb+tn9PcO8fqQrg0bQCKUA5vb7CGUNxVoJYnbUxaHHi62
         MGIcGN3EDhienq+I2GQJbZLJxMucSZst2wRV7C2Q+NcSsdAg6JkAq7Imb/ouviCXvT9h
         2QYsnvAJ71CtTbadLh9jDKAbLAWf2HzTQiOSR+W3uvZbrlC9tPw9H1c1983M1MO78ldx
         ycurWDZlblKQhlUHPePZY6Nz6q6LVEuhwM3/AhBwKPj8qTwcCJfdOuzvkX0MB8YsLzOH
         QHUD0T+X+13HH81Kf98gf9fLqbx6leUiEM1SgiLRlZjgFbSWYbVx3f3VUF1YX6ULPIG5
         a91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dXgeG1Jgy+30eWkSDn68YGMH9mz3gqac+cRsxXc/erE=;
        b=lEAFPYe6whPmCgPSPwOswJ0HRl917eqamvaIthFDLQxrBeEg7/NieAJkY63W5NSD6N
         WDiOYRGG5AqtCTroxOaejNknEb5y7gVXqLdwq1tVkrLcoU5iTDLzAiRSUGCWgBRby3FD
         e1CG7mD1WF4dLPJCmAdlFBjU4IVYqf/fY1ij15Lru3Zl6tQ8AZYJISWQByy7Sf18YtpR
         AySMFj7cMv4jPcNr+kgYP6duRtBuVdBx6fXxofuQvrnPy5XlIUX2gH991QsPc6y69Dh4
         /1H4+3w3zQmGC7TgVJXjTqRtVQnU3SMI4h+TYpCFzLIbo9ExqOsyMfzXFhjg7UqpPkPr
         uPZw==
X-Gm-Message-State: APjAAAVcC0qfiTd8s9owxYQs+rtlaBvLtveoMEu31msTe68bsNEu8gtt
        HIZd3+s9tNzoK3ObQz/FgsY=
X-Google-Smtp-Source: APXvYqzg2csSWoU3BApVsv2FViM6xt1KW3UFXZvNhKOq2uwu7wqv2cy/14NYN1Oq/oM5Cyt7yHM7JA==
X-Received: by 2002:a17:90a:bf82:: with SMTP id d2mr797633pjs.121.1568138817325;
        Tue, 10 Sep 2019 11:06:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h9sm15859384pgh.51.2019.09.10.11.06.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 11:06:56 -0700 (PDT)
Date:   Tue, 10 Sep 2019 11:06:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, wim@linux-watchdog.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: qcom: support pre-timeout when the bark
 irq is available
Message-ID: <20190910180655.GA25286@roeck-us.net>
References: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
 <20190906205411.31666-2-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906205411.31666-2-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 06, 2019 at 10:54:10PM +0200, Jorge Ramirez-Ortiz wrote:
> Use the bark interrupt as the pre-timeout notifier whenever this
> interrupt is available.
> 
> By default, the pretimeout notification shall occur one second earlier
> than the timeout.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Nitpick below, otherwise:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/qcom-wdt.c | 70 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 65 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 7be7f87be28f..935c78a882a3 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -1,8 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2014, The Linux Foundation. All rights reserved.
>   */
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -19,6 +21,9 @@ enum wdt_reg {
>  	WDT_BITE_TIME,
>  };
>  
> +#define QCOM_WDT_ENABLE		BIT(0)
> +#define QCOM_WDT_ENABLE_IRQ	BIT(1)
> +
>  static const u32 reg_offset_data_apcs_tmr[] = {
>  	[WDT_RST] = 0x38,
>  	[WDT_EN] = 0x40,
> @@ -54,15 +59,35 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
>  	return container_of(wdd, struct qcom_wdt, wdd);
>  }
>  
> +static inline int qcom_get_enable(struct watchdog_device *wdd)
> +{
> +	int enable = QCOM_WDT_ENABLE;
> +
> +	if (wdd->pretimeout)
> +		enable |= QCOM_WDT_ENABLE_IRQ;
> +
> +	return enable;
> +}
> +
> +static irqreturn_t qcom_wdt_isr(int irq, void *arg)
> +{
> +	struct watchdog_device *wdd = arg;
> +
> +	watchdog_notify_pretimeout(wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int qcom_wdt_start(struct watchdog_device *wdd)
>  {
>  	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
> +	unsigned int bark = wdd->timeout - wdd->pretimeout;
>  
>  	writel(0, wdt_addr(wdt, WDT_EN));
>  	writel(1, wdt_addr(wdt, WDT_RST));
> -	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
> +	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>  	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
> -	writel(1, wdt_addr(wdt, WDT_EN));
> +	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
>  	return 0;
>  }
>  
> @@ -89,6 +114,13 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
>  	return qcom_wdt_start(wdd);
>  }
>  
> +static int qcom_wdt_set_pretimeout(struct watchdog_device *wdd,
> +				   unsigned int timeout)
> +{
> +	wdd->pretimeout = timeout;
> +	return qcom_wdt_start(wdd);
> +}
> +
>  static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  			    void *data)
>  {
> @@ -105,7 +137,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  	writel(1, wdt_addr(wdt, WDT_RST));
>  	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
>  	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
> -	writel(1, wdt_addr(wdt, WDT_EN));
> +	writel(QCOM_WDT_ENABLE, wdt_addr(wdt, WDT_EN));
>  
>  	/*
>  	 * Actually make sure the above sequence hits hardware before sleeping.
> @@ -121,6 +153,7 @@ static const struct watchdog_ops qcom_wdt_ops = {
>  	.stop		= qcom_wdt_stop,
>  	.ping		= qcom_wdt_ping,
>  	.set_timeout	= qcom_wdt_set_timeout,
> +	.set_pretimeout	= qcom_wdt_set_pretimeout,
>  	.restart        = qcom_wdt_restart,
>  	.owner		= THIS_MODULE,
>  };
> @@ -133,6 +166,15 @@ static const struct watchdog_info qcom_wdt_info = {
>  	.identity	= KBUILD_MODNAME,
>  };
>  
> +static const struct watchdog_info qcom_wdt_pt_info = {
> +	.options	= WDIOF_KEEPALIVEPING
> +			| WDIOF_MAGICCLOSE
> +			| WDIOF_SETTIMEOUT
> +			| WDIOF_PRETIMEOUT
> +			| WDIOF_CARDRESET,
> +	.identity	= KBUILD_MODNAME,
> +};
> +
>  static void qcom_clk_disable_unprepare(void *data)
>  {
>  	clk_disable_unprepare(data);
> @@ -146,7 +188,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	const u32 *regs;
>  	u32 percpu_offset;
> -	int ret;
> +	int irq, ret;
>  
>  	regs = of_device_get_match_data(dev);
>  	if (!regs) {
> @@ -204,7 +246,25 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	wdt->wdd.info = &qcom_wdt_info;
> +	/* check if there is pretimeout support */
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0) {
> +		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
> +				       IRQF_TRIGGER_RISING,
> +				       "wdt_bark", &wdt->wdd);
> +		if (ret)
> +			return ret;
> +
> +		wdt->wdd.info = &qcom_wdt_pt_info;
> +		wdt->wdd.pretimeout = 1;
> +	} else {
> +		if (irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		wdt->wdd.info = &qcom_wdt_info;
> +		wdt->wdd.pretimeout = 0;

It is not necessary to set pretimeout to 0; the data structure was
allocated with devm_kzalloc(). The compiler won't know that and
generate unnecessary code otherwise.

> +	}
> +
>  	wdt->wdd.ops = &qcom_wdt_ops;
>  	wdt->wdd.min_timeout = 1;
>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
