Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8EB152131
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 20:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbgBDTct (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 14:32:49 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34147 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbgBDTcr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 14:32:47 -0500
Received: by mail-pl1-f195.google.com with SMTP id j7so7695191plt.1;
        Tue, 04 Feb 2020 11:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QAbXnRGvDJG7H/08vR2np72AHjfOK0Akk01k65R/HVs=;
        b=e6UMHBAvwqf5UTzC9adQbuiywGxE4xEJmfJ4Ird1yNrT6zEuFcv2raPV+bjz+23hkh
         SCjg9iGT91AO+qYkxEyhP5MiDLiaXP+CaVWpPuw2uDGCJHya5cXdzKdy6IMTKdIkNpvA
         k1xDFj2F2l2HlvLZJQEMlbew8ZlJqARGggyVyDvvZDLNN0XOhjKnluW6pJ9e83jdgz61
         dl8tz5Y2UUu3eXD80XbnFvMfs8+SWaiYKhXyhLTi2OcbhT6UosRc53amdc/k85Dt+DSt
         HD0QJqNVKYLZg55VJhqHkVLTIezeRxt3fjW6V475MsxFr5haghRmZsJ0YbAlOYsD65d7
         7TvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QAbXnRGvDJG7H/08vR2np72AHjfOK0Akk01k65R/HVs=;
        b=hQmuF0A5b7L97INz7ScGPvzAjBDn8st1buHjXQhHz6tJBrlKjGHfTg1zaQEKiz9CCp
         TfLB5tg6Jry9KPR+0waPezC2x4N6qU0nrnTTEkTgOp66hY4nL0aT2ZNE6PyEGV6Vog15
         i++UWA5T8WpjxfHNNHUT2CnDxmYcIL3595BOU62bQR8POh36jMHiqo5YbKaRKVPlAOrl
         wWPFvrZOKitAgWlcN3ZjgAaYVmjHKdM/+6H7dfwRjdy/HTN7d8X+i9X6xJB0pKwDY7RH
         XNO0+44yZHIwtDQDs7NwV/Dp96/oZE1dlKl1EzOSAMnB5zkXDQOTxU3NerbzGJOVO9Mc
         Vc1g==
X-Gm-Message-State: APjAAAX3ceho2HacQojLBwGgcyXuZe0W9TXcQ0BFN/TGidDHyTKAIYlB
        twWpOcOGaPDqe3CvFM9tfko=
X-Google-Smtp-Source: APXvYqz7GEmBBl58uGCrO61LTyVjbdyj3RRMPIirjdchQ8clFET4TYwJV623hGzveAFMpppWiixhBQ==
X-Received: by 2002:a17:902:b116:: with SMTP id q22mr20400383plr.324.1580844766536;
        Tue, 04 Feb 2020 11:32:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3sm25050984pfg.94.2020.02.04.11.32.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 11:32:45 -0800 (PST)
Date:   Tue, 4 Feb 2020 11:32:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: qcom-wdt: disable pretimeout on timer platform
Message-ID: <20200204193244.GA21752@roeck-us.net>
References: <20200204184322.22744-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204184322.22744-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 07:43:22PM +0100, Ansuel Smith wrote:
> Some platform like ipq806x doesn't support pretimeout and define
> some interrupts used by qcom,msm-timer. Change the driver to check
> and use pretimeout only on qcom,kpss-wdt as it's the only platform
> that actually supports it.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/watchdog/qcom-wdt.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index a494543d3ae1..195fe49ca32e 100644
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
> +	if (!data && !data->offset) {

This should be ||. However, the second check is really unnecessary
(it would be a coding error).

Guenter

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
