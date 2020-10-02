Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F56A281843
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 18:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388163AbgJBQre (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 12:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388054AbgJBQrZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 12:47:25 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EF9C0613D0;
        Fri,  2 Oct 2020 09:47:25 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id h17so2002155otr.1;
        Fri, 02 Oct 2020 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=svZWdfukZY5l5kSguTW7Kx53ZVHafnJf8XGipodUUvY=;
        b=HGL97Ibx/l8kPs5E9OP114nlVmz0+tZraPXPjBq3kTVmG9KYCOTU+6xks5sGA12gB7
         cSUUXvxqXmXO9tKVF6JfrwrxtOhCWIp9r30qAz3O2YRrvv0CI2jzpmKiQw6wh3Rz1QtA
         tZGCR9UAvk1fQ93O4X/PE/x9BbgCsMKBUTu0b1f5pVZD2UbDSeZOV9Kgmx5cWo6283wP
         sxgFJfaPq6IMfm6mgakf8SNi7P9jEjSzXsi9ZN7Lzy1LJrcH8AiCjBIll6mjbwj27HW+
         K6a3RnkIlUUwcH5PVfPuSUs8rX4Q1nq98EtijKX4TTUlb1PHkhtRkkYtfdW2cs60hsWc
         1ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=svZWdfukZY5l5kSguTW7Kx53ZVHafnJf8XGipodUUvY=;
        b=mlQUpkm1u885ypl8Pb8DtJuPL7pGqdaEwFnMe6HkrZAFIWX5HSHcfKNOZAo7e1qMYh
         UN4YdHNivPPwhOtJVYuqAGfajQJaYd1WW5nsZPfHb4CJ6rvF7WXI9agkDZ8wf0K8UnGQ
         rIkG1NSVw2IpzUwobHihinpWPISiDnOLDZ1fLukqqK3M3phf1jT/uwy782xcCZNlL9bN
         lqJ3O5HC51Z/JTsWzGl8ja8xdQWvH1T044vIg7eJKTsdQRsWHjlhbMeO9rzpuaEAmEJ7
         lvvfQXLhN/GxZttrHrFWx+6b5NHmFihiXLMxVc8oUEtxaBP/ToDi+t6uBzzV9OE2nxcI
         1q3g==
X-Gm-Message-State: AOAM532hUFztVum1v3fZcWTzdc2x9LT4HZGj0WOxLIpvbyeanBYO9deZ
        WOnLbZbHU/fhG5OYwF5JnSXD388hr3g=
X-Google-Smtp-Source: ABdhPJwZ51ZBt0+vm4DSbcAL6PfiSlZXsq0hd5U8tioLWnwIg9jPiA8VUpJBcNUpUz2JWMbOPfe4ig==
X-Received: by 2002:a9d:2962:: with SMTP id d89mr2266176otb.84.1601657244772;
        Fri, 02 Oct 2020 09:47:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d63sm370947oig.53.2020.10.02.09.47.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:47:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Oct 2020 09:47:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] watchdog: renesas_wdt: don't sleep in atomic context
Message-ID: <20201002164722.GA46009@roeck-us.net>
References: <20201002150944.9696-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002150944.9696-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Oct 02, 2020 at 05:09:44PM +0200, Wolfram Sang wrote:
> In the restart handler, we hit the following OOPS because rwdt_start()
> schedules because of usleep_range():
> 
> [   16.071855] BUG: scheduling while atomic: init/1184/0x00000002
> ...
> [   16.159955] [<c05b6b3c>] (schedule) from [<c05b9884>] (schedule_hrtimeout_range_clock+0x108/0x15c)
> [   16.168918]  r5:00000003 r4:bd855014
> [   16.172498] [<c05b977c>] (schedule_hrtimeout_range_clock) from [<c05b9904>] (schedule_hrtimeout_range+0x2c/0x34)
> [   16.182679]  r7:ea0edd48 r6:ea0ec000 r5:0000fa00 r4:00000000
> [   16.188343] [<c05b98d8>] (schedule_hrtimeout_range) from [<c05b92dc>] (usleep_range+0x84/0xb8)
> [   16.196973] [<c05b9258>] (usleep_range) from [<c049d4a8>] (rwdt_start+0x58/0xa8)
> 
> Convert usleep_range() to udelay() to avoid the bug. The downside is
> busy looping when the watchdog is started or stopped (64us or 96us in my
> case). However, this happens rarely enough, so it seems acceptable.
> 
> Fixes: b836005b4f95 ("watchdog: renesas_wdt: Add a few cycles delay")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> We could also add a new flag in the watchdog core "IS_RESTARTING" or
> similar and check that in the driver. Depending on the flag, we use
> udelay() or usleep_range(). Not sure, if this is feasible or
> over-engineered, though. Looking forward for comments.

Seems to be neither to me. I don't know if there are many drivers who sleep
in the stop function, but even if there are none (today) it would be a
generic problem.

On a side note, I am quite sure there is a system wide flag indicating
that the system is rebooting. Maybe we can just use that ?

> 
>  drivers/watchdog/renesas_wdt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 00662a8e039c..2b0da9b76375 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -76,8 +76,7 @@ static void rwdt_wait_cycles(struct rwdt_priv *priv, unsigned int cycles)
>  	unsigned int delay;
>  
>  	delay = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);
> -
> -	usleep_range(delay, 2 * delay);
> +	udelay(delay);

I think there should be a comment such as "we can't sleep here because the
function may be called from the restart handler and thus must not sleep".
Either case, this happens so rarely and the delay is so minor that we
should just apply this patch (with comment added) and bother about the more
generic version if the problem is seen again.

Thanks,
Guenter

>  }
>  
>  static int rwdt_start(struct watchdog_device *wdev)
> -- 
> 2.28.0
> 
