Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6D163C99
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfGIUOv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:14:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38642 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729710AbfGIUOv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:14:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so9832340pfn.5
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Jul 2019 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q5aFEGjNos0VHtWiM46IKxHdFwDDjLLDVaCIzrtz9zs=;
        b=cVo4KNIyvzCTNovAz2oEYB7vTyWcpOeyAYzUChGW5DjwYT2TJOR05B0NWwBDxuHI14
         4tqQSmap7zM5mtKuqBLMRq+i0icYcfexMjhDfls2ANtj5lT6QVNoSH8R1ctyyLAOuqdt
         zKnEflEtvVOFA6gDtaMVczeyD/8phdXBt6FjXUAl0iBtoysRnEkvo+rIMIWJ/w2J0Wf+
         3vjT9cIrAiTepwUvHk5m0K5Fl1RTa+9zM9RTSw4sWwAd3PJEhGN69amC5PlJDJzmpgKi
         a+3b3ZvYmWp3nlGOhUq5WOVk7YClPbwmNFyJX6a1y4ZMyQX0MbSnDY/yVlMTvRGg9uCU
         OLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=q5aFEGjNos0VHtWiM46IKxHdFwDDjLLDVaCIzrtz9zs=;
        b=o9l01q+oPHGKZuV2n3/5PcwxiUcdjbZ02YCl7xl1QN+h/K4eOfv8vXSJ3B1WXfK4Gm
         hsP/LDDvXqJep9SOxkxNq7CkEDbdYZ0ZgDqITmd2u+rlbgsy25m79RmxY+TsN5LCQVhZ
         zPS522pB3i6c5TdYNyhYc7NUTP7tMySpOVNtoD6ggVix6Jg04kusJwYDGNsEgy9uH16Y
         vTCLlba97KqHScYNwv+iFuDaYflaa3JOkCCAWabzp9J1Staa6SScDB3JFlXO4ZwXk76h
         sngZmhIYwmU6LD7XekiS/WUGExMcEAtepxI+9asWQKQNI2HHbGzff/RL/oDcpaWSBWDI
         STJA==
X-Gm-Message-State: APjAAAXtyvWiNry+3g3vp9BzV84y0sdo7VfyukcxZH4uwzkDIHkBJX3K
        irovWKJKqfHFqcOQOHCqUHEVBgAs
X-Google-Smtp-Source: APXvYqzq3T8sSu99AzXdc4kWBvmJ79pg9qDqaLQ8JPs9sH34wNjovs7eIey/qXEaoNzl4Qy6P3y0uA==
X-Received: by 2002:a17:90a:380d:: with SMTP id w13mr2078026pjb.138.1562703290511;
        Tue, 09 Jul 2019 13:14:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l25sm12237588pff.143.2019.07.09.13.14.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 13:14:49 -0700 (PDT)
Date:   Tue, 9 Jul 2019 13:14:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] watchdog: cadence_wdt: Calculate actual timeout
 limits
Message-ID: <20190709201448.GA27937@roeck-us.net>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-3-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709200801.42313-3-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 09, 2019 at 08:09:05PM +0000, Melin Tomas wrote:
> Maximum and minimum timeout values depend on the actual input clock
> frequency and prescaler selection.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>  drivers/watchdog/cadence_wdt.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index ddbf602bdc40..a0d7666e7d20 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -18,9 +18,6 @@
>  #include <linux/watchdog.h>
>  
>  #define CDNS_WDT_DEFAULT_TIMEOUT	10
> -/* Supports 1 - 516 sec */
> -#define CDNS_WDT_MIN_TIMEOUT	1
> -#define CDNS_WDT_MAX_TIMEOUT	516
>  
>  /* Restart key */
>  #define CDNS_WDT_RESTART_KEY 0x00001999
> @@ -28,6 +25,10 @@
>  /* Counter register access key */
>  #define CDNS_WDT_REGISTER_ACCESS_KEY 0x00920000
>  
> +/* Counter control register, counter restart values */
> +#define CDNS_WDT_CCR_CRV_MIN 0xFFF
> +#define CDNS_WDT_CCR_CRV_MAX 0xFFFFFF
                               ^ Please use tabs here

> +
>  /* Counter value divisor */
>  #define CDNS_WDT_COUNTER_VALUE_DIVISOR 0x1000
>  
> @@ -317,7 +318,10 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	clock_f = clk_get_rate(wdt->clk);
> -	if (clock_f <= CDNS_WDT_CLK_75MHZ) {
> +	if (clock_f == 0) {
> +		dev_err(dev, "invalid clock frequency, (f=%lu)\n", clock_f);

We know that clock_f is 0 here. No need to use %lu.

> +		return -EINVAL;

else after return is unnecessary (and static checkers will rightfully complain).

> +	} else if (clock_f <= CDNS_WDT_CLK_75MHZ) {
>  		wdt->prescaler = CDNS_WDT_PRESCALE_512;
>  		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_512;
>  	} else {
> @@ -329,8 +333,10 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	cdns_wdt_device->info = &cdns_wdt_info;
>  	cdns_wdt_device->ops = &cdns_wdt_ops;
>  	cdns_wdt_device->timeout = CDNS_WDT_DEFAULT_TIMEOUT;
> -	cdns_wdt_device->min_timeout = CDNS_WDT_MIN_TIMEOUT;
> -	cdns_wdt_device->max_timeout = CDNS_WDT_MAX_TIMEOUT;
> +	cdns_wdt_device->min_timeout =
> +		CDNS_WDT_CCR_CRV_MIN * wdt->prescaler / clock_f;
> +	cdns_wdt_device->max_timeout =
> +		CDNS_WDT_CCR_CRV_MAX * wdt->prescaler / clock_f;
>  
>  	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(wdt->regs))
> -- 
> 2.17.2
> 
