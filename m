Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC5523F0E4
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Aug 2020 18:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgHGQVp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 12:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgHGQVo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 12:21:44 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F844C061756;
        Fri,  7 Aug 2020 09:21:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id d4so1135299pjx.5;
        Fri, 07 Aug 2020 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RtvJ13hdgXULntpol9mloh5tvxGSRGDKG13PZYUi3XU=;
        b=H6mz2e+SOP/exVXTPiRz80OCuPuaIvFBqcsYiF+nL/rWpO8UkEOqqqKs9Qf0lT6vtc
         x7OhdyO9yMTBl6Rlof8X9S7Kjm1WSJY8ODEJPcoY7nagpcLQwdx9F+QAbjBkj6/cAZYh
         Pkrh+zKCLdudTC1MRPRuJZWdXBh9zq6iRFQS9o6NGHqU3Bi3gjRfrYmxg+qeARIbUjw0
         vjcB65OafzC7MkmVzrMx2P2bDyoVrpSWpLkvUE0X0b/qNOFww+04ki7pJtC/WPM13dVv
         DU/qOY8AuP6exCLRJFxX00XjR/m/mGTIsVOcxuHEruyEcKvEk+ARufx/2jGURlm6mXkK
         ItEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RtvJ13hdgXULntpol9mloh5tvxGSRGDKG13PZYUi3XU=;
        b=VLaC6WKz60lvsgWQmT474tJV4AFhx7Fs8MBiHJg/9OSpFO3M2yfLCTYoHZktHQcKVF
         bf4ylbkuzXwXgZn/UA1+DajJdtmGM5S3P98CGDKVqt3+lQvbwAufobknracZeAzWazUQ
         KBny0Gxs5uqn0lBqOfpg0H1U57JnIalgmVWFjGLTGO+wDl0lcJ2PcXZG13dl9iqdGyLy
         Az37UHtOPyMvbPcQJTYSfE5w4n2sT1BeoUm//xAWKX6KlNTI9a/9wu3nyex13DjRV/ui
         37j30QjthBmAyToLCrCWBPb8Mi0XqM7bBzlkgKB06FDEY0WcKoYh+6NLQjggcF4BzAuW
         2PUw==
X-Gm-Message-State: AOAM532vI6U9Kz4WwB9xWY59zLfyVcIozbiWldy0ND6ZiRdHT+iNYzWA
        0GCw5U9EsXWloRFO0mJ4Jq4=
X-Google-Smtp-Source: ABdhPJwiD81Z5EZLACnX1D2qaPuUB786F3u3s/Cr6RexLawSv5Y20XjRJJ1zrawKoro9VWPZnJEhkA==
X-Received: by 2002:a17:90b:4b84:: with SMTP id lr4mr13554580pjb.111.1596817304007;
        Fri, 07 Aug 2020 09:21:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f89sm11813143pje.11.2020.08.07.09.21.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 09:21:42 -0700 (PDT)
Date:   Fri, 7 Aug 2020 09:21:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org, f.fainelli@gmail.com
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
Message-ID: <20200807162141.GA41980@roeck-us.net>
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
> after misc_register(), hence if ioctl is called before its
> initialization which can call rdc321x_wdt_start() function,
> it will see an uninitialized value of rdc321x_wdt_device.queue,
> hence initialize it before misc_register().
> Also, rdc321x_wdt_device.default_ticks is accessed in reset()
> function called from write callback, thus initialize it before
> misc_register().
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Having said that ... this is yet another potentially obsolete driver.
You are really wasting your (and, fwiw, my) time.

Florian, any thoughts if support for this chip can/should be deprecated
or even removed ?

Guenter

> ---
>  drivers/watchdog/rdc321x_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
> index 57187efeb86f..f0c94ea51c3e 100644
> --- a/drivers/watchdog/rdc321x_wdt.c
> +++ b/drivers/watchdog/rdc321x_wdt.c
> @@ -231,6 +231,8 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
>  
>  	rdc321x_wdt_device.sb_pdev = pdata->sb_pdev;
>  	rdc321x_wdt_device.base_reg = r->start;
> +	rdc321x_wdt_device.queue = 0;
> +	rdc321x_wdt_device.default_ticks = ticks;
>  
>  	err = misc_register(&rdc321x_wdt_misc);
>  	if (err < 0) {
> @@ -245,14 +247,11 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
>  				rdc321x_wdt_device.base_reg, RDC_WDT_RST);
>  
>  	init_completion(&rdc321x_wdt_device.stop);
> -	rdc321x_wdt_device.queue = 0;
>  
>  	clear_bit(0, &rdc321x_wdt_device.inuse);
>  
>  	timer_setup(&rdc321x_wdt_device.timer, rdc321x_wdt_trigger, 0);
>  
> -	rdc321x_wdt_device.default_ticks = ticks;
> -
>  	dev_info(&pdev->dev, "watchdog init success\n");
>  
>  	return 0;
> -- 
> 2.17.1
> 
