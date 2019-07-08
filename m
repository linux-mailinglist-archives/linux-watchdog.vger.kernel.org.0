Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8F662826
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2019 20:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbfGHSOO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jul 2019 14:14:14 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46984 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfGHSOO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jul 2019 14:14:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id c73so3322002pfb.13
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Jul 2019 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uQKJ/dJBknbZJU1s2ptjDp0lXsLRJBsBkCne4RPWTzY=;
        b=sAIbbP4x5SotliOKB0JOXEpAZuVXFPeozPUF64cocOy/PvpyPFK+dWaD8WjhizXthz
         Ef1N/Gnr0Lle75LL8v7Ho+hRFFlNFUswL4qkXG4Gqm3sifO0kD7Wa1GUpop+gbX3RcBx
         T0q++O/M4DhAAsWhNGB9QAXpDLQK5s8si5UaKRjaNR/oD88lotJgd3QiKCrkTz/bw26G
         9LjhD6DXi0ByBHXaHisItdm3+GpSzAikMZr5CVrek8GACUhcYvTRgM60xOuM3i/1IdNo
         Luyo9NDPmwdUe9gX3s9KKMEZHXGs6LUV0qQrpp4FW+ZR3+R7jE07ZZ76zasu58hJoYRy
         wy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=uQKJ/dJBknbZJU1s2ptjDp0lXsLRJBsBkCne4RPWTzY=;
        b=OmRlQZXoZlpxELqk8YjvEqqm+JGAeK7zkr96/A7AIUryDJJYaUh3ycybkckBgSes2P
         Tv2hKj0+/zv3n7BNhvywRtCWZREO4HsLnjV5ie9YRrxko4Zzizxg5FTRAmN1n0HNuwC7
         AtShJ+j6ApFNNR4nQYvDoDsa7gw48xxipxx10AQ9q/bg8bW/TczoGQvcWkYJAMae0ZBr
         cy79lMY8g3nqSFnJgRTvxGWRj89qanyANkr74qhCfYd6mIOVUZKZfr5+Rf798vTcnPet
         cIy2XOSSEoXZ2e65BfiT9FtDYxkGFT1yPF37QTMHBKyPoOO2EbeMAu57MHqZelOkiqoa
         1vVQ==
X-Gm-Message-State: APjAAAUCb7ah+bU6qVG2oFU3hg/F24WSVHZmHe5dMHGbtW9XUIAFQ845
        fBZUnkjnw6v7zdAuJJV2V+s=
X-Google-Smtp-Source: APXvYqw4YJrgoDqjvDajY8pIfEYEr10pNwC43HJscue7wRy+p4ChxVY9zyHJS1Xre9nTt1PYq4wHSQ==
X-Received: by 2002:a65:448a:: with SMTP id l10mr25187974pgq.53.1562609654076;
        Mon, 08 Jul 2019 11:14:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e124sm27337207pfh.181.2019.07.08.11.14.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:14:13 -0700 (PDT)
Date:   Mon, 8 Jul 2019 11:14:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Message-ID: <20190708181412.GA14802@roeck-us.net>
References: <20190705114522.42565-1-tomas.melin@vaisala.com>
 <20190705114522.42565-5-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705114522.42565-5-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 05, 2019 at 11:46:04AM +0000, Melin Tomas wrote:
> Cadence watchdog HW supports prescaler values of
> 8, 64, 512 and 4096.
> 
> Add support to select prescaler values of 8 and 64 for lower
> input clock frequencies.
> 
> Prescaler value is selected to keep timeout resolution of 1 second.
> For clock frequencies below 32kHz, 1 second resolution does
> no longer hold, thereby returning an error.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>  drivers/watchdog/cadence_wdt.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 4657800d9d8e..39109b5721c1 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -33,16 +33,17 @@
>  #define CDNS_WDT_COUNTER_VALUE_DIVISOR 0x1000
>  
>  /* Clock prescaler value and selection */
> +#define CDNS_WDT_PRESCALE_8	8
>  #define CDNS_WDT_PRESCALE_64	64
>  #define CDNS_WDT_PRESCALE_512	512
>  #define CDNS_WDT_PRESCALE_4096	4096
> +#define CDNS_WDT_PRESCALE_SELECT_8	0
>  #define CDNS_WDT_PRESCALE_SELECT_64	1
>  #define CDNS_WDT_PRESCALE_SELECT_512	2
>  #define CDNS_WDT_PRESCALE_SELECT_4096	3
>  
> -/* Input clock frequency */
> -#define CDNS_WDT_CLK_10MHZ	10000000
> -#define CDNS_WDT_CLK_75MHZ	75000000
> +/* Base input clock frequency */
> +#define CDNS_WDT_CLK_32KHZ 32768
>  
>  /* Counter maximum value */
>  #define CDNS_WDT_COUNTER_MAX 0xFFF
> @@ -304,7 +305,16 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	clock_f = clk_get_rate(wdt->clk);
> -	if (clock_f <= CDNS_WDT_CLK_75MHZ) {
> +	if (clock_f < CDNS_WDT_CLK_32KHZ) {
> +		dev_err(&pdev->dev, "cannot find suitable clock prescaler\n");
> +		return -ERANGE;

	/* Math result not representable */

is a bit misleading here. I understand there isn't a good option,
but using math errors isn't it. Just use -EINVAL if you don't have
a better idea. It might also make sense to display the returned
clock frequency.

> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_8) {
> +		wdt->prescaler = CDNS_WDT_PRESCALE_8;
> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_8;
> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_64) {
> +		wdt->prescaler = CDNS_WDT_PRESCALE_64;
> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_64;
> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_512) {
>  		wdt->prescaler = CDNS_WDT_PRESCALE_512;
>  		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_512;
>  	} else {
