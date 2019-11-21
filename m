Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA442104811
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 02:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKUB3x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 20:29:53 -0500
Received: from cnshjsmin05.app.nokia-sbell.com ([116.246.26.45]:46910 "EHLO
        cnshjsmin05.nokia-sbell.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725819AbfKUB3w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 20:29:52 -0500
X-AuditID: ac18929d-483ff700000014de-de-5dd5e88875a1
Received: from CNSHPPEXCH1606.nsn-intra.net (Unknown_Domain [135.251.51.106])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin05.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id E1.24.05342.888E5DD5; Thu, 21 Nov 2019 09:29:44 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1606.nsn-intra.net (135.251.51.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Nov 2019 09:29:44 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Thu, 21 Nov 2019 09:29:44 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Topic: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWfimD0awmuxWORQi2dTd1MQDV31P//8UQA//7z6PA=
Date:   Thu, 21 Nov 2019 01:29:44 +0000
Message-ID: <9128f42a3e4347f2adfccb8aa2833e2e@nokia-sbell.com>
References: <13477f08400047c1b32030b2680a4241@nokia-sbell.com>
 <20191120171512.GA28255@roeck-us.net>
In-Reply-To: <20191120171512.GA28255@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsXS/ts4S7fjxdVYg6/fdC0u75rDZnFj3T52
        iycLzzBZPH75j9mBxWPlmjWsHju/N7B7fN4kF8AcxWWTkpqTWZZapG+XwJXxr2cCS8Fj8YrF
        y5qZGhiXCncxcnJICJhIPHv7lgXEFhI4xCTxZ5lWFyMXkP2XUWLnldNsEM4mRokrW7+xg1Sx
        CbhLNG1axwZiiwioSTSfagErYhbYzSgxt/EN2ChhgUSJ6y/OM0EUJUncePifBcK2kvj86zpY
        M4uAqsSsW4+BhnJw8ArYSXTdNIC4Ik3i9qteRhCbU8BI4urEnWBjGAVkJaY9ug9mMwuIS9x6
        Mp8J4gMBiSV7zjND2KISLx//YwUZKSGgJNG3AapcR2LB7k9sELa2xLKFr8HKeQUEJU7OfMIy
        gVFsFpKps5C0zELSMgtJywJGllWM0sl5xRlZxbmZeQamenn52ZmJusVJqTk5esn5uZsYgXG2
        RmLS3B2MnZ3xhxgFOBiVeHgzNK7GCrEmlhVX5h5ilOBgVhLh3XP9SqwQb0piZVVqUX58UWlO
        avEhRmkOFiVx3pbJC2OFBNITS1KzU1MLUotgskwcnFINjFaf7lw7uuci1125AOWbU69X1Hvv
        nCOusUi47turuI0OTMUGJcseuSfI7XZQWRfWumhFa5bmTe6KPa7pjj1fr/6xt200X/jtl9Ps
        zTyHSx5//1ffxvBNZ4ZdyI4GhQdNRsIS2U0bDAUm7ViyIbffymvDxZ0t0uvspq/62CeiuTHF
        zlS9rqKOQ4mlOCPRUIu5qDgRAAFHRbOvAgAA
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter, 

Thank you for your time.
- I will remove the unnecessary {}
- wdd->max_hw_heartbeat_ms is the max timeout value which HW can support, this value is limited according to the input clock, say. It only supports 20 seconds, if users requires to set timeout to be say. 60 seconds, the watchdog device driver 'watchdog_dev.c' checks if wdd->timeout is bigger than wdd->max_hw_heartbeat_ms, if yes, watchdog_dev.c feeds the watchdog by a worker queue itself to help to feed the watchdog before 60 seconds elapse. Here the issue of dw_wdt.c is that, the original codes update wdd->timeout to the value which HW can support, which means if users requires 60 seconds to be the timeout, then dw_wdt.c updates the timeout value to 20 seconds, this makes the "feeding helper" mechanism in watchdog_dev.c not take effect. That's why I add this check.

Thanks,
Peng Wang

-----Original Message-----
From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter Roeck
Sent: Thursday, November 21, 2019 1:15 AM
To: Wang, Peng 1. (NSB - CN/Hangzhou) <peng.1.wang@nokia-sbell.com>
Cc: wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger timeout value

On Wed, Nov 20, 2019 at 10:07:57AM +0000, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
> From 1d051b7c081083751dc0bab97d3ab9efbba0f4a7 Mon Sep 17 00:00:00 2001
> From: Peng Wang <peng.1.wang@nokia-sbell.com>
> Date: Wed, 20 Nov 2019 15:12:59 +0800
> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set 
> bigger  timeout value
> 
> watchdog_dev.c provides means to allow users to set bigger timeout 
> value than HW can support, make DesignWare watchdog align with this.
> 
> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>
> ---
>  drivers/watchdog/dw_wdt.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c 
> index fef7c61..8911e5e 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -113,8 +113,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  	 */
>  	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> -
> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +    
> +    /*
> +     * In case users set bigger timeout value than HW can support,
> +     * kernel(watchdog_dev.c) helps to feed watchdog before 
> +     * wdd->timeout
> +     */
> +    if ( wdd->timeout * 1000 <= wdd->max_hw_heartbeat_ms ) {
> +	    wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +    }

{ } is unnecessary here. Also, the above code compares the _old_ timeout againt the maximum supported timeout, which doesn't look correct.

Thanks,
Guenter

>  
>  	return 0;
>  }
> --
> 1.8.3.1
> 
