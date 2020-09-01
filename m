Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38A7259FDC
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 22:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgIAUSX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 16:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgIAUST (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 16:18:19 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A99CC061244;
        Tue,  1 Sep 2020 13:18:18 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id c142so1479789pfb.7;
        Tue, 01 Sep 2020 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dk1ktHw0iRf7BKe9nG4rTRagfh8n8fK/Z4fCqrEfxFo=;
        b=Efc7v4gY960IDeqrEgj9Y6eocuEapTW045Kd+nbea0dphZe0a9qwEZQ0A/jAhRdXM4
         mSmWlVk1whf46+ELpxRB03yPnNa+aRPnwR8ah7BOB7ruvEYJKEE7JN8BIaeJihCqk0F4
         nt0MHaLAImZea/PQXXYBwYm+M78f71NuAphNS3YOdO2GytnufCIjTQGdWC4daley65Xv
         Iu6p/aj9rFdNoW62hkNs/b5/H/WhJBVLmxVeg6+jWDh05C7FwOSE634yUurEUUHll/ah
         BQSYkJqZAorhwoI9ouhfZoahIuItO3twBp7ujlDS7e3IUoctTBYsdGhggdRQPQVP/QaA
         PTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dk1ktHw0iRf7BKe9nG4rTRagfh8n8fK/Z4fCqrEfxFo=;
        b=mpoAnLx0jvHep+LN9a3zwadApV7Wc2j3rKd2imisGKtNrbjqrS4CXer52hSzYmEcz7
         Q+dbSDVMbjuuwe2v8JFLtlnaZKkuuIUU7MHVbwvsqILqpKbAk/UBz6kXrgHvlINXhQ27
         Xf4xSLeadK8TYel0MUpDV+YH0YUv9ZZm+W2+IihpNWlaB8rL2X++bQBORlILP0l6poin
         LUAICLDVzhWOfgnhGyUotBpEDG09LtfbQB4SAamdFNqjACyUeu01EWhuujb3uFbJtijd
         EHs1+vVaFqs+EwNUenNxXEhfKg9kTZxCpXVnzJBZpcUqv5tTzIo6EVDFQW+kLsdiNoJl
         xwgg==
X-Gm-Message-State: AOAM531P8IY0oMCw0wXOudDkI8zCvok7NY5jgI/Vf4YxuDZRDIuOs7iQ
        EFeMa1Eyj0BUUREkJk6Y/LFO16ofZAQ=
X-Google-Smtp-Source: ABdhPJx5BstFCr65JVrDcS7CTaeTUbeDlPPFRYnkp8xcOd6dwT/dF1SrSGKHXUSmpSGyXRsTLT0nnw==
X-Received: by 2002:aa7:824a:: with SMTP id e10mr3157439pfn.62.1598991497867;
        Tue, 01 Sep 2020 13:18:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a8sm3024449pga.69.2020.09.01.13.18.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 13:18:16 -0700 (PDT)
Date:   Tue, 1 Sep 2020 13:18:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: cadence: Simplify with dev_err_probe()
Message-ID: <20200901201815.GA143133@roeck-us.net>
References: <20200901153141.18960-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901153141.18960-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 01, 2020 at 05:31:39PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Hmm, I had replied to this but I don't see it on patchwork.
Trying again.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/watchdog/cadence_wdt.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 672b184da875..bc99e9164930 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -334,12 +334,9 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_drvdata(cdns_wdt_device, wdt);
>  
>  	wdt->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(wdt->clk)) {
> -		ret = PTR_ERR(wdt->clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "input clock not found\n");
> -		return ret;
> -	}
> +	if (IS_ERR(wdt->clk))
> +		return dev_err_probe(dev, PTR_ERR(wdt->clk),
> +				     "input clock not found\n");
>  
>  	ret = clk_prepare_enable(wdt->clk);
>  	if (ret) {
> -- 
> 2.17.1
> 
