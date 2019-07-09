Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A184663D18
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 23:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfGIVHQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 17:07:16 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34945 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfGIVHP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 17:07:15 -0400
Received: by mail-pf1-f193.google.com with SMTP id u14so8705572pfn.2
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Jul 2019 14:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oECLyXb9cwHzKCOR02xJuvQa3mAgpByK4x+p21WktpI=;
        b=LkWd4dTqNTrlTsv0v/J42pr17roxKt9IZThcSmBmRmgnGFA2lMjLRUaGmexZytG/z2
         2OERS6ICwnTRfwKRBrn9LYAWnQGrTHPiWdvoNNqu94ODjHIFdgwtXPCjaJE2MfhNGvpb
         PdLsLLE5UmgQxT984qA9EamiQzYSKGMDCppkgBWzQqfZ8Vzg8m9xcuPAJGMU91XkqPvZ
         gt+mU+OHKlfACatAh1aCXEhatH+oOS+4gnf2Wa2iEnX+cf8kZSDMYjk/+F4JNLPIroSv
         7d+de7Xt3kLz2QR65UKhJB/N+LAjSw+M1IRLxMP4EY96tDSzp6TJdD0riTvgDhE20pKl
         +2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=oECLyXb9cwHzKCOR02xJuvQa3mAgpByK4x+p21WktpI=;
        b=dDpcKJhqJgPuQFz1SmxkblnD/FuT7ADbn//o5U3JcYaHVLoq60Gr5Raqw+gDSk1WZ7
         CR95B1L6YSXbAmIh2kYpbopHqp1gGx9WfYMS+q2Cw7UXhUyzN9NvQEFUIpxUAfIJ7E1f
         6TRVZ6kTTnWEVjPhOJ4snoQrBaCRXJqegovu1eAvPCJ/38oaH+1L2oPwZkonTsuCsWKc
         uyTbsuiNQ3ZJsdF3rYgJajX0qEK+ZUGzWXxI+fUKxWMveaS12bwWQGnTteJPAB3DY8i5
         imc4MYRolbzASgV2b/alQLFIk1Wb6hVQpl3R+eC0qbxIk8qGaK+Uo5aZDRcxSz2Xt4BM
         vVCw==
X-Gm-Message-State: APjAAAVLuzyoMeWJb7R73nQioGVP7K2uF1yQrhJzYRz6Y7OtlbQKw6dV
        zLC7O5bRk5yMRqLoePhpSDbv2td1
X-Google-Smtp-Source: APXvYqxpECgK4G17v0n6DrC/Z70WCfM5GWQv6dcBoZP1cLEgn6lYY7kuGqw8X597It/f096BEWYdEA==
X-Received: by 2002:a17:90a:db42:: with SMTP id u2mr2388356pjx.48.1562706434823;
        Tue, 09 Jul 2019 14:07:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s43sm53984pjb.10.2019.07.09.14.07.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 14:07:14 -0700 (PDT)
Date:   Tue, 9 Jul 2019 14:07:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Message-ID: <20190709210713.GB29377@roeck-us.net>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-5-tomas.melin@vaisala.com>
 <20190709202113.GD27937@roeck-us.net>
 <4cc8b578-07f1-f0ec-1150-e0db9e47107c@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc8b578-07f1-f0ec-1150-e0db9e47107c@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 09, 2019 at 08:49:20PM +0000, Melin Tomas wrote:
> On 7/9/19 11:21 PM, Guenter Roeck wrote:
> 
> > On Tue, Jul 09, 2019 at 08:09:06PM +0000, Melin Tomas wrote:
> >> Cadence watchdog HW supports prescaler values of
> >> 8, 64, 512 and 4096.
> >>
> >> Add support to select prescaler values of 8 and 64 for lower
> >> input clock frequencies.
> >>
> >> Prescaler value is selected to keep timeout resolution of 1 second.
> >> For clock frequencies below 32kHz, 1 second resolution does
> >> no longer hold, thereby returning an error.
> >>
> > I think I am missing something. Why was this valid/supported up to now,
> > and if it was, why is it no longer possible to support it ?
> 
> This driver hasn't really supported smaller input clock frequencies. The 
> watchdog
> 
> can be driven from an internal clock with rather high frequency, which
> 
> I think is the default setting. So typically, one might not even use the 
> smaller prescalers.
> 
> >
> > I am also a bit confused about the logic. With a slower clock, I would
> > expect that the timeouts are getting larger, not smaller. Can you explain ?
> 
> Yes, that is correct. So with a 32kHz clock using smallest available 
> prescaler,
> 
> we get 1 second resolution (and 1 second as smallest timeout).
> 
> With an even slower clock than that, we would end up with granularity
> 
> and smallest value larger than 1 second.
> 

Ah, we are talking about the _smallest_ timeout and about resolution.
But that is no reason to declare the clock invalid. Just set the minimum
to the actual minimum.  There is no reason to reject slow clocks entirely,
even if the granularity is in the multi-second range. The only caveat,
if granularity is more than one second, is that the set_timeout function
must select and report the actual timeout.

Thanks,
Guenter

> 
> Thanks,
> 
> Tomas
> 
> >
> >> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> >> ---
> >>   drivers/watchdog/cadence_wdt.c | 21 +++++++++++++++------
> >>   1 file changed, 15 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> >> index 0bdb275d904a..037faf557f9d 100644
> >> --- a/drivers/watchdog/cadence_wdt.c
> >> +++ b/drivers/watchdog/cadence_wdt.c
> >> @@ -33,16 +33,17 @@
> >>   #define CDNS_WDT_COUNTER_VALUE_DIVISOR 0x1000
> >>   
> >>   /* Clock prescaler value and selection */
> >> +#define CDNS_WDT_PRESCALE_8	8
> >>   #define CDNS_WDT_PRESCALE_64	64
> >>   #define CDNS_WDT_PRESCALE_512	512
> >>   #define CDNS_WDT_PRESCALE_4096	4096
> >> +#define CDNS_WDT_PRESCALE_SELECT_8	0
> >>   #define CDNS_WDT_PRESCALE_SELECT_64	1
> >>   #define CDNS_WDT_PRESCALE_SELECT_512	2
> >>   #define CDNS_WDT_PRESCALE_SELECT_4096	3
> >>   
> >> -/* Input clock frequency */
> >> -#define CDNS_WDT_CLK_10MHZ	10000000
> >> -#define CDNS_WDT_CLK_75MHZ	75000000
> >> +/* Base input clock frequency */
> >> +#define CDNS_WDT_CLK_32KHZ 32768
> >                               ^ Please use a tab here
> >
> >>   
> >>   /* Counter maximum value */
> >>   #define CDNS_WDT_COUNTER_MAX 0xFFF
> >> @@ -318,10 +319,18 @@ static int cdns_wdt_probe(struct platform_device *pdev)
> >>   		return ret;
> >>   
> >>   	clock_f = clk_get_rate(wdt->clk);
> >> -	if (clock_f == 0) {
> >> -		dev_err(dev, "invalid clock frequency, (f=%lu)\n", clock_f);
> >> +	if (clock_f < CDNS_WDT_CLK_32KHZ) {
> >> +		dev_err(dev,
> >> +			"cannot find suitable clock prescaler, (f=%lu)\n",
> >> +			clock_f);
> >>   		return -EINVAL;
> >> -	} else if (clock_f <= CDNS_WDT_CLK_75MHZ) {
> >> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_8) {
> >> +		wdt->prescaler = CDNS_WDT_PRESCALE_8;
> >> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_8;
> >> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_64) {
> >> +		wdt->prescaler = CDNS_WDT_PRESCALE_64;
> >> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_64;
> >> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_512) {
> >>   		wdt->prescaler = CDNS_WDT_PRESCALE_512;
> >>   		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_512;
> >>   	} else {
> >> -- 
> >> 2.17.2
> >>
