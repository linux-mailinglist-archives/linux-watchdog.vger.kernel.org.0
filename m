Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18199362DAA
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 Apr 2021 06:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhDQEVR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 17 Apr 2021 00:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhDQEVR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 17 Apr 2021 00:21:17 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6A0C061574;
        Fri, 16 Apr 2021 21:20:51 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id k25so29986349oic.4;
        Fri, 16 Apr 2021 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yf4cGa1gDUioK7Tp5qZNGmRyNKmLAms5q26b5QKwv4I=;
        b=piQInaLBoIAceOzFkrF0BoCeDSvSZtOAd8AiEd43+fyfVbehfg9SI7YxxzSHizd1xk
         76N94AEBwmsNbyaM0xNh7YAmEMg6EBFyU3J9+3p5gxmSXeo8eiMdOrMj/xb88dPk4Oy4
         fInFcdW9LXm29s0pPouGUFfihn0wmDNyptLw3JMhglRHeukM/2WtNI/yowPcNbkc5coE
         kSOTsXPHDhq9aBPe06d4kiCIyRVkqR/e6aiWCJaLBOQG3rFP7hJVB07fW/tsYdtbOc0J
         mshqqYuvvk5FCkcw8uzD68QKqCRbUvTIgsCDDdzVfyfEjjSF5brz7IqljNzUSYRKiOP9
         jDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yf4cGa1gDUioK7Tp5qZNGmRyNKmLAms5q26b5QKwv4I=;
        b=TYdRjeLiiPPZ+X5seF981TRnj93IIKyfEZQ9gf9gjbRB8Houy1KLo5Ah4CMhCi4I1o
         yG43qwzPcmC/M4R9gNzijqm6qKRY3iESOyiYhx80dqh9acfShVN3vwHJNQu0gxOQiogu
         cu2fzGcnbq3RiMZvxpQnpDJRMyglt1v6V0nBMHwRZa+LEHBM9vtvCCE4/Qzn5CHXqE2a
         qPq4e2b8FLtdpN6Aj9MT5XtySRL0h7l2vu09HJa/LuYACK+tFXwVkL/A9QUtPO/qnMG5
         IatrJI/J9TQpJuoK3m25MGYv35OTacMqWLkIiFqIYWXNjkgE3aRbmeEK6Qi++4LIZkEK
         Ep6A==
X-Gm-Message-State: AOAM532E8CjXNI0I3UMQe1LyDOp2MDaJfYO9/cD2KP9rCIUkGaO/R3aQ
        dbVUrm5R2YFAwNKhmvVkaqriJZ7/ed0=
X-Google-Smtp-Source: ABdhPJxAT7odgGlh+hNxttap8x0zum9s/e3YiZYiZCZNA4kSTGiSQQY4Cn2fQzPSS4tsk9DfBcifFQ==
X-Received: by 2002:aca:a990:: with SMTP id s138mr9144164oie.80.1618633250989;
        Fri, 16 Apr 2021 21:20:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h184sm1866764oia.1.2021.04.16.21.20.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 21:20:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 16 Apr 2021 21:20:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     rentao.bupt@gmail.com
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>,
        Amithash Prasad <amithash@fb.com>
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210417042048.GA109800@roeck-us.net>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417034249.5978-1-rentao.bupt@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 16, 2021 at 08:42:49PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Fix hardware timeout calculation in aspeed_wdt_set_timeout function to
> ensure the reload value does not exceed the hardware limit.
> 
> Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> Reported-by: Amithash Prasad <amithash@fb.com>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 7e00960651fa..507fd815d767 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -147,7 +147,7 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
>  
>  	wdd->timeout = timeout;
>  
> -	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> +	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
>  
>  	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
>  	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> -- 
> 2.17.1
> 
