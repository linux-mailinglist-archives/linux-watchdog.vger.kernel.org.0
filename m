Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477A8151DDA
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 17:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgBDQI1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 11:08:27 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44832 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgBDQI1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 11:08:27 -0500
Received: by mail-pf1-f193.google.com with SMTP id y5so9658015pfb.11;
        Tue, 04 Feb 2020 08:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aJyPBejd2KHeFnws6O5Ct6jDTArqwJQptRALIFCVTtc=;
        b=SQGAshzGZuSFK2mUSmXisa3vVER33pORKfjfSofOqjBezn8T9NUsDSI2wW2UZ8sh/s
         CfPk52f4CSQAmSUbacYbR+NsFcKA0wJxlK8giYe9PHM78oHAFPfYD+eUUPzLXV+kcqdl
         BfoJg8pV3/W97QWNrJfuTIUUbj7I9EwIER3gtFYxS32gtdZEt90Grh+MSzOxYFkyc3Xa
         ifioalqDQIOQvOIgnhoXC3cU+r2AQLv2qHRG7r8RyFXtpbxcMHim5s7h0k7JY53C19ul
         G+nqUHnVLymmK6VQEp4KZkQonrBYMx8c005G0c4M9hbGQfKTSnDdgo97P+Nc5JeUFx7L
         BKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=aJyPBejd2KHeFnws6O5Ct6jDTArqwJQptRALIFCVTtc=;
        b=eIvR3N8jqZ9N97Y9QPDZNh4J2cOzXSovHuPkWKESfO/D2biApoBNfS2SOCh+wuLw9D
         qSIE6TsurKv3X8XN8cuDFRYMpyFkRgqTEOPUwq1hqtHgo2ho0r13uGfDvkZlCZjs1klh
         2lo66x998TdJ1Ck84LBca3ZdHXDvfQVrmCUBMuhFSaAT1A1zbk4qbo3Qmi8hdnKn3Ttu
         /zIDKkj3LL13XzifKpGSBG9C1VY4XWFqAgO1TNSuORygoLsSm5pmrwaSc0Y6wqpgaNqs
         4gRQFsvbjHeKQW76mwHfWpqTM2xdQ1cn4FlIkyOb4Ef3xvU9DhgqB8fvr0MNEgVuTavB
         5O6Q==
X-Gm-Message-State: APjAAAWQGFuebJWKNq9fb1g5u5ZgYrOsdMy/DbTnqh9Wf5aaTHrDq0ge
        4CtFVYj5uVtg3X8wkDJAes6X3bCT
X-Google-Smtp-Source: APXvYqxrJwoHQaFiVDu+a5C7dFrCynpXMTGgIPHDF/NSAujTe95ynfq1TaRTRDc9qsR/QvHvzp5XXw==
X-Received: by 2002:a62:f243:: with SMTP id y3mr32329175pfl.146.1580832506445;
        Tue, 04 Feb 2020 08:08:26 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v9sm4163253pja.26.2020.02.04.08.08.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 08:08:25 -0800 (PST)
Date:   Tue, 4 Feb 2020 08:08:24 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: qcom-wdt: add option to skip pretimeout
Message-ID: <20200204160824.GA17320@roeck-us.net>
References: <20200204152104.13278-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204152104.13278-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 04, 2020 at 04:21:01PM +0100, Ansuel Smith wrote:
> Some platform like ipq806x doesn't support pretimeout.
> As the driver check if there are available interrupts and ipq806x
> use msm-timer that require interrupts, the watchdog fail to probe
> as request_irq tries to use a ppi interrupt. Add an option to skip
> pretimeout setup and use the normal watchdog probe.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/watchdog/qcom-wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index a494543d3ae1..e689e97e883e 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -189,6 +189,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	u32 percpu_offset;
>  	int irq, ret;
>  	struct clk *clk;
> +	bool nopretimeout;
>  
>  	regs = of_device_get_match_data(dev);
>  	if (!regs) {
> @@ -204,6 +205,8 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	if (!res)
>  		return -ENOMEM;
>  
> +	nopretimeout = of_property_read_bool(np, "no-pretimeout");
> +
>  	/* We use CPU0's DGT for the watchdog */
>  	if (of_property_read_u32(np, "cpu-offset", &percpu_offset))
>  		percpu_offset = 0;
> @@ -247,7 +250,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  
>  	/* check if there is pretimeout support */
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq > 0) {
> +	if (!nopretimeout && irq > 0) {

That is unnecessary; such platforms should simply not provide an interrupt.
Or, in other words, what is the point of assigning an interrupt to be used
for pretimeout if the platform doesn't support it ? And then to add yet
another attribute to tell the driver not to use it ?

Guenter

>  		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
>  				       IRQF_TRIGGER_RISING,
>  				       "wdt_bark", &wdt->wdd);
> -- 
> 2.24.0
> 
