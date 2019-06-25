Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A15D559DC
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Jun 2019 23:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfFYVX1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 Jun 2019 17:23:27 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35496 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfFYVX1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 Jun 2019 17:23:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id d126so80599pfd.2
        for <linux-watchdog@vger.kernel.org>; Tue, 25 Jun 2019 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lxo6C4LtTDRVBqprv6IDMgKHMWS6I0fQ085QIjL5wcY=;
        b=TSnAVst7s9iRP2uPGuZslc5/yVwOzaaQ7zRt8C30+SeuG36zS8+4/RFAnQVUVFsg5J
         ZLE7Ct4m+A2fiPbQx8ZXEqqkHh3TiRF2KTZmzMAPLKMM72/TBT1l0uxkHeXNM0ZGYicP
         j5s/NF3Y+EE+AT4GvrfQQLKh5Vx1ggAxZiGyc2/WN5noXbGnNLZlmA497pDJc4ocX6dd
         d3pA9DxST2oi1OJ9j5IiFQdci0hUoNCf7AjdagC/gSM2L3MSBgfYlZZpD94nfmI1nrW4
         qHPWrKjB5nJ+YzTDoDpuxxweArvhSqR6fZRr8LyPLSE1S5YK6qoeoZ1ucnwv2ewCX3bk
         JyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lxo6C4LtTDRVBqprv6IDMgKHMWS6I0fQ085QIjL5wcY=;
        b=sOk2/rCxBkomD7mqMsSiWLwhOduviPamHBwanNCwz6XX+FsQElCc3QB/NDPLT/gKcC
         SLgZFyS78yjWF2XR6Z4taPFZKhNVv+GBO/TzR5/yssbXwLD75Uvb71byKpJiJYM66fIu
         P4H9WoynvA/FeLyyWeA/5qukt6dec461sy+Qv+xclC9fgHTgs0Q77qjzGFOPxt+SBw8u
         z+YrwG4QnsqmIgYXBbgLXd4fTimheUCHgeMqUiOpUNAZ57kRgKjAX1HaoRHcu/a72eBO
         FZtVyphMbV1wvVGJ5u4nHTV7h9bWLvDB0XygN49xGt/nVE8tq8aN39pYPbW4kNa0BnEi
         y88Q==
X-Gm-Message-State: APjAAAUer8WPL/BC4APnTHlT/8uysCP5fROmQ5vA4LES8VknV3ap5aHS
        ORT8llsu2P37pP/mrGJO4Z2bbXTA
X-Google-Smtp-Source: APXvYqwdGVszCwCvPK0VIASzqy2PoChyKlxSXGMYgcQSYcGhzpnjX254dybk4ZrfoFIGqRKL6KDZcQ==
X-Received: by 2002:a17:90a:2228:: with SMTP id c37mr1044878pje.9.1561497806716;
        Tue, 25 Jun 2019 14:23:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 64sm7184702pfe.128.2019.06.25.14.23.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 14:23:25 -0700 (PDT)
Date:   Tue, 25 Jun 2019 14:23:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH] watchdog: cadence: Support all available prescaler values
Message-ID: <20190625212324.GA8823@roeck-us.net>
References: <20190625141048.99479-1-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625141048.99479-1-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 25, 2019 at 02:11:11PM +0000, Melin Tomas wrote:
> Cadence watchdog HW supports prescaler values of
> 8, 64, 512 and 4096. For low frequency input clocks, the smaller
> prescaler values are preferrable to improve the granularity and
> extend the timeout range towards the lower end.
> 
> Prescaler logic is extended to support timeout values [1s - 4095s],
> with prescaler selected based on input clock frequency.
> For clock frequencies higher than ~2 MHz, the largest prescaler
> value is used.
> 

I have two problems with this patch:

"improve the granularity and extend the timeout range towards the lower
end" suggests that the timeout is not always selected in multiples of
one second. Since the set-timeout function is supposed to return the
actually selected timeout, this points to a possible bug.

Also, "extended to support timeout values [1s - 4095s]" is at the very
least misleading since timeouts larger than 516 seconds are not selectable
even after this patch has been applied (see CDNS_WDT_MAX_TIMEOUT and its
use).

I am not opposed to making better use of the prescaler, but it needs
to be documented properly, and if the timeout granularity is larger
than 1 second, the actual timeout needs to be calculated and reflected
in wdd->timeout.

Thanks,
Guenter

> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>  drivers/watchdog/cadence_wdt.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index c3924356d173..65191183ecd8 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -32,16 +32,17 @@
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
> +#define CDNS_WDT_CLK_32KHZ	32768
>  
>  /* Counter maximum value */
>  #define CDNS_WDT_COUNTER_MAX 0xFFF
> @@ -348,7 +349,13 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	clock_f = clk_get_rate(wdt->clk);
> -	if (clock_f <= CDNS_WDT_CLK_75MHZ) {
> +	if (clock_f <= CDNS_WDT_CLK_32KHZ) {
> +		wdt->prescaler = CDNS_WDT_PRESCALE_8;
> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_8;
> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_8) {
> +		wdt->prescaler = CDNS_WDT_PRESCALE_64;
> +		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_64;
> +	} else if (clock_f <= CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_64) {
>  		wdt->prescaler = CDNS_WDT_PRESCALE_512;
>  		wdt->ctrl_clksel = CDNS_WDT_PRESCALE_SELECT_512;
>  	} else {
> -- 
> 2.17.2
> 
