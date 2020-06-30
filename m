Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB0820FE7B
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 23:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgF3VHw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 17:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbgF3VHw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 17:07:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038EBC061755;
        Tue, 30 Jun 2020 14:07:51 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x72so519590pfc.6;
        Tue, 30 Jun 2020 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GU6vPKQf4uXQIkirjbYE3xtNV9UQ8YIx9I4Z3o6US34=;
        b=LKhpFwpKGk2r98ftbnVNAdzfHUcOB+/gdY2agjd4zGB1qP+EkUM8q0WGmOVglXGU10
         PuCvLSxCjltm3ohKZgn9jTkjp4DcY7eosb1ZTk10BM25+y01VHExjshJKRureC1F+nce
         v0xad9veeijdnaDqA1UgCl0nk76gQra0hPvGncwykvVKjK1gMNa+uyfE+WFQft3csldf
         aaeyfNB3/FRVlNORJ73r+TViuXB2et4HHKMPIvIHJyVLGe7HaDIlVnM+Yu7oMtbmW/Lj
         se/DGk4xFdQ7jpSbNYnafeYtsQQnoc9NpYJpvVuv4GkI5PT8YH738mVFqY8xsbIJvOUS
         rnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=GU6vPKQf4uXQIkirjbYE3xtNV9UQ8YIx9I4Z3o6US34=;
        b=rg7jtwGrR04Mwp5p52pTYjclTFkv1cFj2Vi54xye9M8KMaFctw5BFJjVTE7aPuNQus
         Ks0iKdMylcT6Rp4ntf1WgvxJ0IcOUtFLqGxDzzURVWmUwvLSeq8iwhTIrqL4/kizD+LT
         K2Tout55lU+tidHfZKSdvwDW4ve+SqmvxM/07twQTS4KOfBASDF1/b/Tc9/yf6mqAzfc
         xsK7YLI+osR/lSTszhOGw40S2icBG8uQ3Y/Po2j/GK+bSZ9wwDgeYzwljvfptJFZC9oc
         qrVy7C5l5au5OzPvakvELKW7+KAKGRmBQmgrZZP8E41V67TJiiqqRpAy6nBt1vr9R+rn
         WDqA==
X-Gm-Message-State: AOAM532ArxP39ddUlcRc/BiGIZ6JCm9rpvpl5wZ3VblnE4GPuYZHqZHp
        ppo1cTjZh0kBc/sc5H/LeZI=
X-Google-Smtp-Source: ABdhPJyTuPK8hg3+kUrbWtvwAIvHSm7IDUVa3HMy1BhtYmQLCeYg7eVD4HxiPCBvSbSG9UgK4phH+g==
X-Received: by 2002:a63:7d16:: with SMTP id y22mr15792454pgc.136.1593551271458;
        Tue, 30 Jun 2020 14:07:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b11sm3649839pfr.179.2020.06.30.14.07.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 14:07:50 -0700 (PDT)
Date:   Tue, 30 Jun 2020 14:07:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Giel van Schijndel <me@mortis.eu>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/8] watchdog: f71808e_wdt: remove use of wrong
 watchdog_info option
Message-ID: <20200630210749.GA22948@roeck-us.net>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
 <20200611191750.28096-4-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611191750.28096-4-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 11, 2020 at 09:17:44PM +0200, Ahmad Fatoum wrote:
> The flags that should be or-ed into the watchdog_info.options by drivers
> all start with WDIOF_, e.g. WDIOF_SETTIMEOUT, which indicates that the
> driver's watchdog_ops has a usable set_timeout.
> 
> WDIOC_SETTIMEOUT was used instead, which expands to 0xc0045706, which
> equals:
> 
>    WDIOF_FANFAULT | WDIOF_EXTERN1 | WDIOF_PRETIMEOUT | WDIOF_ALARMONLY |
>    WDIOF_MAGICCLOSE | 0xc0045000
> 
> These were so far indicated to userspace on WDIOC_GETSUPPORT.
> As the driver has not yet been migrated to the new watchdog kernel API,
> the constant can just be dropped without substitute.
> 
> Fixes: 96cb4eb019ce ("watchdog: f71808e_wdt: new watchdog driver for
>        Fintek F71808E and F71882FG")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index c8ce80c13403..8e5584c54423 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -690,8 +690,7 @@ static int __init watchdog_init(int sioaddr)
>  	 * into the module have been registered yet.
>  	 */
>  	watchdog.sioaddr = sioaddr;
> -	watchdog.ident.options = WDIOC_SETTIMEOUT
> -				| WDIOF_MAGICCLOSE
> +	watchdog.ident.options = WDIOF_MAGICCLOSE
>  				| WDIOF_KEEPALIVEPING
>  				| WDIOF_CARDRESET;
>  
