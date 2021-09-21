Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722F9413360
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Sep 2021 14:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhIUMd1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Sep 2021 08:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbhIUMd1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Sep 2021 08:33:27 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E63C061574
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Sep 2021 05:31:58 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id a3so4577538oid.6
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Sep 2021 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u4dAMULsfk30kFUoyjDxOjXMdM/owuT5XHFEWaEyU24=;
        b=Yd09b2CuoGYinV2iuoU+9p0XEkHyc+T33jV8kl8Miu5Oga0kG3jGLGbYV8ZoGYPXxX
         dcFNyW8bw+/VDAKJKpawaB/CQoVRs4Odqgg9BFRKny/oNJY19f23gPz/gRs6xwQ2MWtz
         HPP63dtjDn4pb2abAj1rcB46Q+1B2rZ728FNeGj8tevVSTykZN55wLC2v8y63LQOA0as
         PNHjFgi7oIeg+AEwiA8Z23dII1BLMzJH+d/DX5ytlgQsdSWWIEsARKZCsd4Frumw8cM6
         PUmRnmCA3zoLPy3AS1VBIRWM/mhEQzq4rkcunG5YpkpXYvZIIfHFLpxjxn6GIMZtGdW5
         cnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=u4dAMULsfk30kFUoyjDxOjXMdM/owuT5XHFEWaEyU24=;
        b=vbUdJhJzv8jvi4LIVqsNb04fOP39O2jXTWXHCgDV6lEIh+MPnwD7JgPlpK3nSX4qM7
         gIJ5QIsyKCouO0+pBW/D8aTtyIEXuEq4ROoVgMCk9ZXf4kFRGLLEZM5Pqck77ugvZgyB
         Ji2r6bZcrD6E5Mk2nA7AlBpDPOux079ADiWdu/iRkFKRrnl4aGB6jvnaJd0fEaHWyN0U
         HEujgX8rtXI9VqPVlUIvgKUu3GEE0OxHak8y2fvHPu3Ed2q4Ba5WZo9Jj6chYkiCjHrN
         rEPDbrlI0a5RRbVvOYkIpYG4cY2SZL7aI34I8Kq0retFlLctxZ9WEBKORDho7KXt4K/t
         sedA==
X-Gm-Message-State: AOAM531gRAi3IX4ktUHVqB2+tF2JBxD3QkUVHJBUuLPbJP7FPu6GUrZn
        IMh3004pTpMIdaJ0UYG67/4=
X-Google-Smtp-Source: ABdhPJzfn2coZFNon6b9j1kIUvun5/O1YwhPgyyjEoPnU+S7pTl6koOcohtdZgUOvVe1E1/k3D3Yrg==
X-Received: by 2002:aca:a989:: with SMTP id s131mr3419148oie.95.1632227518356;
        Tue, 21 Sep 2021 05:31:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a15sm4035365otq.13.2021.09.21.05.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 05:31:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 21 Sep 2021 05:31:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Malin Jonsson <malin.jonsson@ericsson.com>,
        john.jacques@intel.com, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: iTCO_wdt: No need to stop the timer in probe
Message-ID: <20210921123156.GA1864238@roeck-us.net>
References: <20210921102900.61586-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921102900.61586-1-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 21, 2021 at 01:29:00PM +0300, Mika Westerberg wrote:
> The watchdog core can handle pinging of the watchdog before userspace
> opens the device. For this reason instead of stopping the timer, just
> mark it as running and let the watchdog core take care of it.
> 
> Cc: Malin Jonsson <malin.jonsson@ericsson.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes from v1:
> 
>  - Only set the WDOG_HW_RUNNING flag.
> 
>  drivers/watchdog/iTCO_wdt.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 643c6c2d0b72..a0e8ad3901a4 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -430,6 +430,16 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
>  	return time_left;
>  }
>  
> +static void iTCO_wdt_set_running(struct iTCO_wdt_private *p)
> +{
> +	u16 val;
> +
> +	/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
> +	val = inw(TCO1_CNT(p));
> +	if (!(val & BIT(11)))
> +		set_bit(WDOG_HW_RUNNING, &p->wddev.status);
> +}
> +
>  /*
>   *	Kernel Interfaces
>   */
> @@ -572,8 +582,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_drvdata(&p->wddev, p);
>  	platform_set_drvdata(pdev, p);
>  
> -	/* Make sure the watchdog is not running */
> -	iTCO_wdt_stop(&p->wddev);
> +	iTCO_wdt_set_running(p);
>  
>  	/* Check that the heartbeat value is within it's range;
>  	   if not reset to the default */
> -- 
> 2.33.0
> 
