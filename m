Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433B063CAB
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbfGIUVP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:21:15 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37947 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfGIUVP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:21:15 -0400
Received: by mail-pg1-f193.google.com with SMTP id z75so9218pgz.5
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Jul 2019 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RU2m3gdZjiC+rwxYFcfrlXuCSiHOAqLHTQmxdQ6quvM=;
        b=APoJ6iLSb9+I/dFVYqPsmB2MKY8b9MOwQVQPfZ95RwL+DcRc9ZF/tr7/xjRnmlKlQq
         tNczBH3MfkCVOP6gv2fUmWqxsETPGbFBTk6WYxwKSia4ASivhmPeWmt0FNVU6ijG+R0q
         LiHb9J7/QNQkeJht8yH79vLJrPI18mxC10fH8yq71FuY+GQ7B+SuajLrdfSEcO4rdFd+
         1RaZRcQ90wXTSCURHbLT0uk4U/ri22i3kEf69klAn46/gc26CKFsWoegQJmKmBSTeUv3
         AuR70i6IkB+fENHBN1oIVUdHacxE6LP2v4JTspCT6TedbgCobzLCRw/fwjwOM/xNeEO+
         g9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RU2m3gdZjiC+rwxYFcfrlXuCSiHOAqLHTQmxdQ6quvM=;
        b=lSSEF/w8NekevBS1QbNr67fwo5LzN2mbg4KxyUDG516DgmKV5E3S4M1mHo6C6W8NPa
         g/uelJq7qx9ZHkF3lP42qp8LVk/AliFB9fjVN5OJNO0JWgktxxnNlgildraei/8q1wjz
         /fi+jGybgNYqAhhBs5Y8/aGfNnTAMJA/BD+dFk8Q+fzFIw+GHpHANdDN9iorWZMfotBA
         nZTNA29bWcXHISB1ZUj/KFSomdGjumiSDwm8S+rYS+1e9k384mXt1C1jzP/tdgELzUoh
         DfbJw22eDTwNAyrGn1WKoJxfnvStQEFYl9pPAd2HliUEmxR/SKMXcQh5DndpLHC+q2lv
         EQyQ==
X-Gm-Message-State: APjAAAVJrnEsAwYRTRnhQkriWc1r0ld52T5CPCjWPg97SI0IcXxZ8mmz
        qdHrlcYsALIiiAij1oNTXsCkg20z
X-Google-Smtp-Source: APXvYqweCx+mfF993hFR/ndG1uW/vnp2lXbLEgCta67tGh9YVEyNYWTwdmPo8Y8bKmfMni8nb+8Dtg==
X-Received: by 2002:a63:6103:: with SMTP id v3mr33936998pgb.161.1562703674647;
        Tue, 09 Jul 2019 13:21:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k16sm21298657pfa.87.2019.07.09.13.21.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 13:21:14 -0700 (PDT)
Date:   Tue, 9 Jul 2019 13:21:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Message-ID: <20190709202113.GD27937@roeck-us.net>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-5-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709200801.42313-5-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jul 09, 2019 at 08:09:06PM +0000, Melin Tomas wrote:
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

I think I am missing something. Why was this valid/supported up to now,
and if it was, why is it no longer possible to support it ?

I am also a bit confused about the logic. With a slower clock, I would
expect that the timeouts are getting larger, not smaller. Can you explain ?

> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>  drivers/watchdog/cadence_wdt.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 0bdb275d904a..037faf557f9d 100644
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
                             ^ Please use a tab here

>  
>  /* Counter maximum value */
>  #define CDNS_WDT_COUNTER_MAX 0xFFF
> @@ -318,10 +319,18 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	clock_f = clk_get_rate(wdt->clk);
> -	if (clock_f == 0) {
> -		dev_err(dev, "invalid clock frequency, (f=%lu)\n", clock_f);
> +	if (clock_f < CDNS_WDT_CLK_32KHZ) {
> +		dev_err(dev,
> +			"cannot find suitable clock prescaler, (f=%lu)\n",
> +			clock_f);
>  		return -EINVAL;
> -	} else if (clock_f <= CDNS_WDT_CLK_75MHZ) {
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
> -- 
> 2.17.2
> 
