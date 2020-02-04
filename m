Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE68215219D
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 21:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgBDU4E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 15:56:04 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45542 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgBDU4E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 15:56:04 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so10068666pfg.12;
        Tue, 04 Feb 2020 12:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jaUUzB+UxjCXzrbLEVpX7Zlu1vPsN1wJxV2IaOILUwg=;
        b=WWGXLoFPAv/r+9B6aVx14gDtbdffHMhe/KZzz/WPOVxF60Tz9czgYeH03JhgxENl7g
         Vl4xRHlJyaP/2x2UbN2yhlfIE0mgTXk7D5baimNUVXv7dRCj5UeIuuGntRQiwQ0xFwJM
         6hqN6+Gr9zKqvNTMGztY+ycY3wRfSz65ZjqXgY1lYW43kT4szY+pTLUtoGB70THCtnul
         j50hw0r23kfwsmI1i7NkcZRo9YXmzd0anIzQ3M/JoupmyurW/lv6DujmxdzqHdSMQ3Uo
         1waRzekwZh++PiTo0TIYAS9diRXtssT6tDii77/EkaHY+h4vfhIMIvofDyMCvU9mE8VT
         yzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jaUUzB+UxjCXzrbLEVpX7Zlu1vPsN1wJxV2IaOILUwg=;
        b=tKqrn3B5ob8j+qy7X+5TFkZiPVo2yOhjjrV0LFDAAgncdoILF+ApfgNEOjvKCtGwWw
         W7xiSVTjXGVZs2CB3rmlj4JKLgZf6oZtClA+9BcD5fLra0cDT1vvw9M5roMN3C+0MU0t
         G3Zkg293dxyqfDYAgD9LzBz2tiADL9gPV5nm8hujw93R/8Lz9Zoxr2ruzymdKi9zFT+M
         kpfT3PZwLzWP5B3bN2dlxKxvuic9iuLlQntq0GFspAEU9EI4VlVpVFKZWsn9fZqL/uG8
         g8MtNSKjU99hLQp9YfRwMiMpEAgc0Q0UvbcZVJaphD0IggAEi2ckKo4sTrg6twdpb0UQ
         jXIA==
X-Gm-Message-State: APjAAAUHtNs7NMbWvWrU7KjNcmgFDmQUho8UDIqjDR8Bje/zzMIM5IZ9
        HGClg1oUblEDTPSCmwn/+Kc=
X-Google-Smtp-Source: APXvYqze7R6WVyDrE/sy8mZfQEUfRLUMf1lk4FdTnlbTg6eEj0iWGb2RYODq2ZXmMSu6LO6Qjbesrg==
X-Received: by 2002:a63:cd03:: with SMTP id i3mr12783611pgg.257.1580849761959;
        Tue, 04 Feb 2020 12:56:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z16sm24985860pff.125.2020.02.04.12.56.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 12:56:01 -0800 (PST)
Date:   Tue, 4 Feb 2020 12:55:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: qcom-wdt: disable pretimeout on timer
 platform
Message-ID: <20200204205559.GA28502@roeck-us.net>
References: <20200204195648.23350-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204195648.23350-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 08:56:48PM +0100, Ansuel Smith wrote:
> Some platform like ipq806x doesn't support pretimeout and define
> some interrupts used by qcom,msm-timer. Change the driver to check
> and use pretimeout only on qcom,kpss-wdt as it's the only platform
> that actually supports it.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/qcom-wdt.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index a494543d3ae1..d13c75028985 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -40,6 +40,11 @@ static const u32 reg_offset_data_kpss[] = {
>  	[WDT_BITE_TIME] = 0x14,
>  };
>  
> +struct qcom_wdt_match_data {
> +	const u32 *offset;
> +	bool pretimeout;
> +};
> +
>  struct qcom_wdt {
>  	struct watchdog_device	wdd;
>  	unsigned long		rate;
> @@ -179,19 +184,29 @@ static void qcom_clk_disable_unprepare(void *data)
>  	clk_disable_unprepare(data);
>  }
>  
> +static const struct qcom_wdt_match_data match_data_apcs_tmr = {
> +	.offset = reg_offset_data_apcs_tmr,
> +	.pretimeout = false,
> +};
> +
> +static const struct qcom_wdt_match_data match_data_kpss = {
> +	.offset = reg_offset_data_kpss,
> +	.pretimeout = true,
> +};
> +
>  static int qcom_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct qcom_wdt *wdt;
>  	struct resource *res;
>  	struct device_node *np = dev->of_node;
> -	const u32 *regs;
> +	const struct qcom_wdt_match_data *data;
>  	u32 percpu_offset;
>  	int irq, ret;
>  	struct clk *clk;
>  
> -	regs = of_device_get_match_data(dev);
> -	if (!regs) {
> +	data = of_device_get_match_data(dev);
> +	if (!data) {
>  		dev_err(dev, "Unsupported QCOM WDT module\n");
>  		return -ENODEV;
>  	}
> @@ -247,7 +262,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  
>  	/* check if there is pretimeout support */
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq > 0) {
> +	if (data->pretimeout && irq > 0) {
>  		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
>  				       IRQF_TRIGGER_RISING,
>  				       "wdt_bark", &wdt->wdd);
> @@ -267,7 +282,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.min_timeout = 1;
>  	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
>  	wdt->wdd.parent = dev;
> -	wdt->layout = regs;
> +	wdt->layout = data->offset;
>  
>  	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>  		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> @@ -311,9 +326,9 @@ static int __maybe_unused qcom_wdt_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(qcom_wdt_pm_ops, qcom_wdt_suspend, qcom_wdt_resume);
>  
>  static const struct of_device_id qcom_wdt_of_table[] = {
> -	{ .compatible = "qcom,kpss-timer", .data = reg_offset_data_apcs_tmr },
> -	{ .compatible = "qcom,scss-timer", .data = reg_offset_data_apcs_tmr },
> -	{ .compatible = "qcom,kpss-wdt", .data = reg_offset_data_kpss },
> +	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
> +	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
> +	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, qcom_wdt_of_table);
> -- 
> 2.24.0
> 
