Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26AB3AADBC
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 23:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfIEVTR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 17:19:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38771 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfIEVTR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 17:19:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id d10so2163998pgo.5;
        Thu, 05 Sep 2019 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B0B9rVe+oztTYQ7MVJcujht+lAY5H+Eh47sriZyPRxE=;
        b=ntfcUhOyiJzEKyPsPchHEFqgeVIOnX6R1PGPqSa7Z2GGISjzuX0P/6rQA39JntOHfh
         lWk7dMb4RzxZKximmHXFMwH/5jigfYj09faMCBuNpJwckqvxs9bKKXof866pRYRAU3N0
         LXNCCdkqQcJ7zTXPKGnApHZ3bnRZwlRDESWt7R9r/W3lFeQzsbyc5EMs+kLpFYDITBdN
         Aq9rRQdFBw1dGAIllTeXHnvz4qut5n64gQc76XT8zIEUcJWTo1WiXUiSkhlDoMMCX7kY
         5krRY5dTV25WinfctjxqMCZS4VBATpiyAHYULEp8lrFrngdfJjIJNmkz8hxV6CUVTYQE
         C0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=B0B9rVe+oztTYQ7MVJcujht+lAY5H+Eh47sriZyPRxE=;
        b=grFk5WIsQpMIloyp1q4F8mGP+L4sxnsG1gTeZ8j8mIhCaIdR1HD3jEgbNLiaO+MMmK
         RMdrdMmmHwV3TjkUeuw4eFolI6TKQjqZRCOpWTvMKHJIaGULYhDlX1N+C6WsdHadKCVU
         ztBuvey/SybS1qZakv8uu43cWnypU1rlROkfZosTzwBGzUBM6bJYBxuDSmjQ3boInc7Q
         axPM/lfzLsooR0p4CsJtXVBt/zZvrlXHNfY0aL8atsObQlP+2TqvJuHiJA90UojVPYOz
         Hm4T4Y3dgrNTTqy510zIScIQ1x0giTNfZHiwVoSIHX66up5sMw1NV1Kwezgd9dRQiSNi
         PZOw==
X-Gm-Message-State: APjAAAX4exQT5oi6MIu4rFSQohZbvros4eRgVL2g0+E/ASGaZbQ2Yile
        vwW+WZ+eL92sLpbNETwB8eY=
X-Google-Smtp-Source: APXvYqxdP9UfgjNQTqRBysevqD5A1wvksFverLNwhERj8pjIbamJB7FQupBlc+R9IYrTO90bH80kMQ==
X-Received: by 2002:a63:2157:: with SMTP id s23mr5214387pgm.167.1567718356268;
        Thu, 05 Sep 2019 14:19:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q22sm2763965pgh.49.2019.09.05.14.19.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 14:19:15 -0700 (PDT)
Date:   Thu, 5 Sep 2019 14:19:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, wim@linux-watchdog.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq
 is available
Message-ID: <20190905211913.GA31094@roeck-us.net>
References: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 05, 2019 at 11:00:35PM +0200, Jorge Ramirez-Ortiz wrote:
> Use the bark interrupt as the pre-timeout notifier whenever this
> interrupt is available.
> 
> By default, the pretimeout notification shall occur one second earlier
> than the timeout.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  v4:
>      address Guenter Roeck comments as follows:
>        remove unnecessary include and private variable
>        provide macro for WDT EN register values
>        use pretimeout as per its API intent
>        handle EPROBE_DEFER on get_irq
>      also:
>        handle the irq registration as done in pm8916_wdt.c
>  v3:
>     remove unnecesary variable added to private.
> 
>  v2:
>     register the pre-timeout notifier instead.
> 
>  v1:
>  drivers/watchdog/qcom-wdt.c | 64 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 59 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 7be7f87be28f..0f1d29eeb81d 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -10,6 +10,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/watchdog.h>
>  #include <linux/of_device.h>
> +#include <linux/interrupt.h>
>  
>  enum wdt_reg {
>  	WDT_RST,
> @@ -19,6 +20,9 @@ enum wdt_reg {
>  	WDT_BITE_TIME,
>  };
>  
> +#define QCOM_WDT_ENABLE		BIT(0)
> +#define QCOM_WDT_ENABLE_IRQ	BIT(1)
> +

Using BIT() requires "#include <linux/bits.h>".

>  static const u32 reg_offset_data_apcs_tmr[] = {
>  	[WDT_RST] = 0x38,
>  	[WDT_EN] = 0x40,
> @@ -54,15 +58,38 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
>  	return container_of(wdd, struct qcom_wdt, wdd);
>  }
>  
> +static inline int qcom_get_enable(struct watchdog_device *wdd)
> +{
> +	int enable = QCOM_WDT_ENABLE;
> +
> +	if (wdd->info->options & WDIOF_PRETIMEOUT)
> +		enable |= QCOM_WDT_ENABLE_IRQ;
> +

Again, the condition needs to be that pretimeout != 0,
not that it is supported.

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
> +	unsigned int bark = wdd->timeout;
> +
> +	if (wdd->pretimeout)
> +		bark = bark - wdd->pretimeout;

The if() just adds code and doesn't otherwise do any good.

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
> @@ -89,6 +116,13 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
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
> @@ -105,7 +139,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  	writel(1, wdt_addr(wdt, WDT_RST));
>  	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
>  	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
> -	writel(1, wdt_addr(wdt, WDT_EN));
> +	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
>  
>  	/*
>  	 * Actually make sure the above sequence hits hardware before sleeping.
> @@ -121,6 +155,7 @@ static const struct watchdog_ops qcom_wdt_ops = {
>  	.stop		= qcom_wdt_stop,
>  	.ping		= qcom_wdt_ping,
>  	.set_timeout	= qcom_wdt_set_timeout,
> +	.set_pretimeout	= qcom_wdt_set_pretimeout,
>  	.restart        = qcom_wdt_restart,
>  	.owner		= THIS_MODULE,
>  };
> @@ -133,6 +168,15 @@ static const struct watchdog_info qcom_wdt_info = {
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
> @@ -146,7 +190,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	const u32 *regs;
>  	u32 percpu_offset;
> -	int ret;
> +	int irq, ret;
>  
>  	regs = of_device_get_match_data(dev);
>  	if (!regs) {
> @@ -204,7 +248,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	wdt->wdd.info = &qcom_wdt_info;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0) {
> +		if (devm_request_irq(dev, irq, qcom_wdt_isr,
> +				     IRQF_TRIGGER_RISING, "wdt_bark",
> +				     &wdt->wdd))
> +			irq = 0;
> +	} else if (irq == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
> +	wdt->wdd.info = irq > 0 ? &qcom_wdt_pt_info : &qcom_wdt_info;
> +	wdt->wdd.pretimeout = irq > 0 ? 1 : 0;

Why repeat the conditional ? It seems to me that something like

	wdt->wdd.info = &qcom_wdt_info;
	...
	if (irq > 0) {
		wdt->wdd.info = &qcom_wdt_pt_info;
		wdt->wdd.pretimeout = 1;
		...
	}

would be much easier and avoid the repeated conditionals.

>  	wdt->wdd.ops = &qcom_wdt_ops;
>  	wdt->wdd.min_timeout = 1;
>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
> -- 
> 2.23.0
> 
