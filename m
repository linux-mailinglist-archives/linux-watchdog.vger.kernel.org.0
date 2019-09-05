Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 053AFAAB5B
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 20:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390471AbfIESqR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 14:46:17 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45157 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbfIESqR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 14:46:17 -0400
Received: by mail-pl1-f193.google.com with SMTP id x3so1702473plr.12;
        Thu, 05 Sep 2019 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=siHAGnev+oRtiAEuv8gvwTdohhZkRI0o8v2bCUzHI20=;
        b=e2FjTi/fx4FMylM53V9cXNMpMuvTBSe8SxhX7sjPf+qY0sbxiru++/CYSxkfEVJQrq
         ykDkshMXsVlwt3OJ2SOXvLXvR2cf63jAJ6Pa5wSwewBMElrDuxvzrSbV4io/+z5CRLvS
         3v1DF/ml/Ws9pcMgi2RYgUKenqdIKtQO2eClGPYh8fymSFVBcc4aNoAuEm7XAtXB8sk1
         RNSIVitW6LMB9HwjjySxuaBlkLEIOi2ffDK/DVggActLLbDWBVJpnu20qP1GE4Z4rrhT
         Sa3XXrdoAkI4q8oynEesVCfbclvtVBZQskc/kZZS9y7HjpkS1ZvLDEfK7g4gYSdpUdic
         dQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=siHAGnev+oRtiAEuv8gvwTdohhZkRI0o8v2bCUzHI20=;
        b=XXRlDoqPc6S57DI5kGKXvRsJpmudCzKljGBQ+LYH7smVKsx+c79/7JYz8Wj0tGToKg
         a2zz/iT31ZPrijHE0Nr4lnl6lDgbV0WW2yC3jWroCYdJ/vsYqgvxKWxXGxUzKrj+z9gA
         Stupdn57eef48X+t7+pxWxgmD7KbvwxnBXBBDJsyV0NG4DtBoz6XjKw3mNhzzNECOo+w
         g1fPbx271AjlajUc3TWrvFD9BqPC02YQm5C84W+uXL2Esmk/AC1/6vsGlzdlrxhLGsd+
         HpPMYSElZYHP2B432tNbdCFKoIgZQ76/WpHPryHaDk6/STMC5eo0xLoEjF6VzqcLL+2l
         k/8Q==
X-Gm-Message-State: APjAAAU5X5Hb7PB8qOSJ+FFJ/oFb66g2gsoLgS6VqGiVvb2/SipqNPjY
        oc5gI9P+d/PqidjsHOmCTmI=
X-Google-Smtp-Source: APXvYqxlL0sh+nZKHN93mQwfTX1Xt8QyS1b0ABdGenndC+xrS8QZwgHiKT1l+HDUTDom6sM0kLlsfA==
X-Received: by 2002:a17:902:e48d:: with SMTP id cj13mr4989009plb.177.1567709176693;
        Thu, 05 Sep 2019 11:46:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z12sm3420995pfg.21.2019.09.05.11.46.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 11:46:15 -0700 (PDT)
Date:   Thu, 5 Sep 2019 11:46:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, wim@linux-watchdog.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: qcom: support pre-timeout when the bark irq
 is available
Message-ID: <20190905184614.GA28923@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 05, 2019 at 08:12:57PM +0200, Jorge Ramirez-Ortiz wrote:
> Use the bark interrupt as the pre-timeout notifier whenever this
> interrupt is available.
> 
> By default, the pretimeout notification shall occur one second earlier
> than the timeout.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/watchdog/qcom-wdt.c | 63 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 58 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 7be7f87be28f..2dd36914aa82 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -10,6 +10,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/watchdog.h>
>  #include <linux/of_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/watchdog.h>

Why include linux/watchdog.h twice ?

>  
>  enum wdt_reg {
>  	WDT_RST,
> @@ -41,6 +43,7 @@ struct qcom_wdt {
>  	unsigned long		rate;
>  	void __iomem		*base;
>  	const u32		*layout;
> +	const struct device	*dev;

I fail to see what this is used for.

>  };
>  
>  static void __iomem *wdt_addr(struct qcom_wdt *wdt, enum wdt_reg reg)
> @@ -54,15 +57,37 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
>  	return container_of(wdd, struct qcom_wdt, wdd);
>  }
>  
> +static inline int qcom_wdt_enable(struct qcom_wdt *wdt)
> +{
> +	/* enable the bark interrupt */
> +	if (wdt->wdd.info->options & WDIOF_PRETIMEOUT)

This needs to check if pretimeout has been enabled
(wdt.pretimeout != 0), not if pretimeout functionality is
supported.

> +		return 3;

I would suggest to use defines for the bits.

> +
> +	return 1;
> +}
> +
> +static irqreturn_t qcom_wdt_irq(int irq, void *cookie)
> +{
> +	struct watchdog_device *wdd = (struct watchdog_device *) cookie;

Extra space before 'cookie'.

> +
> +	watchdog_notify_pretimeout(wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int qcom_wdt_start(struct watchdog_device *wdd)
>  {
>  	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
> +	unsigned int bark = wdd->pretimeout;
> +
> +	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
> +		bark = wdd->timeout;

This is not the deciding factor. The deciding factor
is wdd->pretimeout == 0. Also, per API, pretimeout is
the time difference to 'timeout', not an absolute time.

>  
>  	writel(0, wdt_addr(wdt, WDT_EN));
>  	writel(1, wdt_addr(wdt, WDT_RST));
> -	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
> +	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
>  	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
> -	writel(1, wdt_addr(wdt, WDT_EN));
> +	writel(qcom_wdt_enable(wdt), wdt_addr(wdt, WDT_EN));
>  	return 0;
>  }
>  
> @@ -86,9 +111,18 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
>  				unsigned int timeout)
>  {
>  	wdd->timeout = timeout;
> +
>  	return qcom_wdt_start(wdd);

Side note: This is wrong. Setting the timeout should not unconditionally
start the watchdog. This should be something like

	if (watchdog_active(wdd))
		qcom_wdt_start(wdd);
	return 0;

>  }
>  
> +static int qcom_wdt_set_pretimeout(struct watchdog_device *wdd,
> +				   unsigned int timeout)
> +{
> +	wdd->pretimeout = timeout;
> +
> +	return 0;
> +}
> +

Per API:

"A value of 0 disables pretimeout notification."

Also, qcom_wdt_start() has to be called if the watchdog is running.

>  static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  			    void *data)
>  {
> @@ -105,7 +139,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  	writel(1, wdt_addr(wdt, WDT_RST));
>  	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
>  	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
> -	writel(1, wdt_addr(wdt, WDT_EN));
> +	writel(qcom_wdt_enable(wdt), wdt_addr(wdt, WDT_EN));
>  
>  	/*
>  	 * Actually make sure the above sequence hits hardware before sleeping.
> @@ -121,11 +155,12 @@ static const struct watchdog_ops qcom_wdt_ops = {
>  	.stop		= qcom_wdt_stop,
>  	.ping		= qcom_wdt_ping,
>  	.set_timeout	= qcom_wdt_set_timeout,
> +	.set_pretimeout	= qcom_wdt_set_pretimeout,
>  	.restart        = qcom_wdt_restart,
>  	.owner		= THIS_MODULE,
>  };
>  
> -static const struct watchdog_info qcom_wdt_info = {
> +static struct watchdog_info qcom_wdt_info = {
>  	.options	= WDIOF_KEEPALIVEPING
>  			| WDIOF_MAGICCLOSE
>  			| WDIOF_SETTIMEOUT
> @@ -146,7 +181,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	const u32 *regs;
>  	u32 percpu_offset;
> -	int ret;
> +	int irq, ret;
>  
>  	regs = of_device_get_match_data(dev);
>  	if (!regs) {
> @@ -210,6 +245,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
>  	wdt->wdd.parent = dev;
>  	wdt->layout = regs;
> +	wdt->dev = &pdev->dev;
>  
>  	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>  		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> @@ -222,6 +258,23 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
>  	watchdog_init_timeout(&wdt->wdd, 0, dev);
>  
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq >= 0) {
> +		/* enable the pre-timeout notification */
> +		qcom_wdt_info.options |= WDIOF_PRETIMEOUT;
> +
> +		ret = devm_request_irq(&pdev->dev, irq, qcom_wdt_irq,

Any reason for using &pdev->dev instead of dev ?

> +				       IRQF_TRIGGER_RISING, "wdog_bark",
> +				       &wdt->wdd);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to request irq\n");

Same here. Also, at least nominally, platform_get_irq() 
can return -EPROBE_DEFER. The error message seems undesirable
in that situation.

> +			return ret;
> +		}
> +	}
> +
> +	if (qcom_wdt_info.options & WDIOF_PRETIMEOUT)
> +		wdt->wdd.pretimeout = wdt->wdd.timeout - 1;

Per API:

"The timeout value is not an absolute time, but the number of
  seconds before the actual timeout would happen"

Also, why set this here with an extra if and not above where
WDIOF_PRETIMEOUT is set ?

> +
>  	ret = devm_watchdog_register_device(dev, &wdt->wdd);
>  	if (ret)
>  		return ret;
> -- 
> 2.23.0
> 
