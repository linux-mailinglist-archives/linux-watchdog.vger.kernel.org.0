Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A6864DA5
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2019 22:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfGJUjg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Jul 2019 16:39:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43160 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfGJUjg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Jul 2019 16:39:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id f25so1768588pgv.10
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Jul 2019 13:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qmeSmXwTiQZsrwGNXA34RMdlwKok/8NQo6x5QfK/JEU=;
        b=mKqN+PDf2qjmlTd50ov8i35jh7rOQWGB8B9pARDmJB+eraRTXjOuriU+8X6d5q4h+9
         of0PInR/gNmqmUlM6j9unAAw0Sex13MjE1h1seXvBXGsW/XxM+NgkyMlOLmMqRBUDAos
         h+NnZIE8uTXFcbQG/Bkn4cfl4jUFHfpOQDottsjywvscRnv++nhaC4JOtGxCn3g/MDdI
         fiyoPSAEZOIcpy1WMfceJfzrF72+5wO7TDfjdEVL85exQ3jLOIaKnD0vpj6Edm4e2co3
         t2WDEMHs1bwjE3D6n6YqpJlS4Zmc8cUoI+5G0V2Mnt0ZOa8N8CDK8aX6a6ARrLFvWBsX
         2RlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qmeSmXwTiQZsrwGNXA34RMdlwKok/8NQo6x5QfK/JEU=;
        b=rcCb1/N8sMsX2s4wRkyJk/z3uSt7orTdJL1LUzp2m0t64zP1eBhpVKkoPrvJyRU1PJ
         WjeNqa7N+1tL5fzG4eY0rRVv99lq/CF/nWVG4xiXS1hGNWUg/O56ohIsMbG7mdzs4cSy
         pYXKyQce2DTffmyI/cy/NxnWkoKt+fK0X5K00NEVg7F7dTOeb6aB4qejHrodKi08Rj6k
         x3NTaaTZ37TUX4gngMULs8lW3Se2nELTFotbkTN9xgzIK4HElIKwjRjNrc12kixx+/Ae
         y8ppvHtVVF8hhPfWQirzyMdRDo/4pXM0D7GQQ4jMoaVngYdmBNLP6sC6ZQMWQ2g65q2W
         2WKg==
X-Gm-Message-State: APjAAAU1j973wY+gUg4WMrnpIDZDw2R7oUeqU1QffI9NPdYo/Zuv0dAN
        dFGCCBqN9foT+xqf7mm0vmw=
X-Google-Smtp-Source: APXvYqxnlolAEhvlnuQq3gmZi+sWnolNNlxIAYQWrfecvPmXPsPa9N/PDnYOhw1xzgI2I8zzdFzDFg==
X-Received: by 2002:a17:90a:8a15:: with SMTP id w21mr318705pjn.134.1562791175210;
        Wed, 10 Jul 2019 13:39:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x25sm1482332pfa.90.2019.07.10.13.39.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 13:39:34 -0700 (PDT)
Date:   Wed, 10 Jul 2019 13:39:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Message-ID: <20190710203931.GB6330@roeck-us.net>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-5-tomas.melin@vaisala.com>
 <20190709202113.GD27937@roeck-us.net>
 <4cc8b578-07f1-f0ec-1150-e0db9e47107c@vaisala.com>
 <20190709210713.GB29377@roeck-us.net>
 <66ed7888-7ab9-0600-78d5-f9f2ebd4bf01@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66ed7888-7ab9-0600-78d5-f9f2ebd4bf01@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 10, 2019 at 07:20:59PM +0000, Melin Tomas wrote:
> 
> On 7/10/19 12:07 AM, Guenter Roeck wrote:
> > Ah, we are talking about the _smallest_ timeout and about resolution.
> > But that is no reason to declare the clock invalid. Just set the minimum
> > to the actual minimum.  There is no reason to reject slow clocks entirely,
> > even if the granularity is in the multi-second range. The only caveat,
> > if granularity is more than one second, is that the set_timeout function
> > must select and report the actual timeout.
> 
> I did consider supporting slower clocks but thought that the required
> 
> additional logic was perhaps not worth it. So instead just declared
> 
> those clock frequencies invalid.
> 

Hmm ... not sure I understand. What makes it so difficult ?

Guenter

> However, if that logic is required, sure I can try to implement it.
> 
> It might take some weeks before I have time to look at it properly.
> 
> 
> Thanks,
> 
> Tomas
> 
> >
> > Thanks,
> > Guenter
> >
> >> Thanks,
> >>
> >> Tomas
> >>
> >>>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> >>>> ---
> >>>>    drivers/watchdog/cadence_wdt.c | 21 +++++++++++++++------
> >>>>    1 file changed, 15 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> >>>> index 0bdb275d904a..037faf557f9d 100644
> >>>> --- a/drivers/watchdog/cadence_wdt.c
> >>>> +++ b/drivers/watchdog/cadence_wdt.c
> >>>> @@ -33,16 +33,17 @@
> >>>>    #define CDNS_WDT_COUNTER_VALUE_DIVISOR 0x1000
> >>>>    
> >>>>    /* Clock prescaler value and selection */
> >>>> +#define CDNS_WDT_PRESCALE_8	8
> >>>>    #define CDNS_WDT_PRESCALE_64	64
> >>>>    #define CDNS_WDT_PRESCALE_512	512
> >>>>    #define CDNS_WDT_PRESCALE_4096	4096
> >>>> +#define CDNS_WDT_PRESCALE_SELECT_8	0
> >>>>    #define CDNS_WDT_PRESCALE_SELECT_64	1
> >>>>    #define CDNS_WDT_PRESCALE_SELECT_512	2
> >>>>    #define CDNS_WDT_PRESCALE_SELECT_4096	3
> >>>>    
> >>>> -/* Input clock frequency */
> >>>> -#define CDNS_WDT_CLK_10MHZ	10000000
> >>>> -#define CDNS_WDT_CLK_75MHZ	75000000
> >>>> +/* Base input clock frequency */
> >>>> +#define CDNS_WDT_CLK_32KHZ 32768
> >>>                                ^ Please use a tab here
> >>>
> >>>>    
> >>>>    /* Counter maximum value */
> >>>>    #define CDNS_WDT_COUNTER_MAX 0xFFF
> >>>> @@ -318,10 +319,18 @@ static int cdns_wdt_probe(struct platform_device *pdev)
> >>>>    		return ret;
> >>>>    
> >>>>    	clock_f = clk_get_rate(wdt->clk);
> >>>> -	if (clock_f == 0) {
> >>>> -		dev_err(dev, "invalid clock frequency, (f=%lu)\n", clock_f);
> >>>> +	if (clock_f < CDNS_WDT_CLK_32KHZ) {
> >>>> +		dev_err(dev,
> >>>> +			"cannot find suitable clock prescaler, (f=%lu)\n",
> >>>> +			clock_f);
> >>>>    		return -EINVAL;
> >>>> -	} else if (clock_f <= CDNS_WDT_CLK_75MHZ) {
> >>>> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_8) {
> >>>> +		wdt->prescaler = CDNS_WDT_PRESCALE_8;
> >>>> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_8;
> >>>> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_64) {
> >>>> +		wdt->prescaler = CDNS_WDT_PRESCALE_64;
> >>>> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_64;
> >>>> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_512) {
> >>>>    		wdt->prescaler = CDNS_WDT_PRESCALE_512;
> >>>>    		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_512;
> >>>>    	} else {
> >>>> -- 
> >>>> 2.17.2
> >>>>
