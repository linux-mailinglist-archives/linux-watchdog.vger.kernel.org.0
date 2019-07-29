Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DDA79148
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 18:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfG2Qnv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 12:43:51 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35112 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbfG2Qnv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 12:43:51 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so28339118pfn.2
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GTxqOtx/tULQyH+zO3Bz0gEKEdO5gP/P6N04rGxbcPI=;
        b=PHC2FXYu2saZhEvftEBHC72CB1sBvN3g2hGFT2XM8a3oViVN66MvcLKC6N9rWOAkJ+
         NRIgvA6YNK8FD/3xcIQx2vHRPbwcoVP4SKP8jGWsHDxpftaDIX3YRiEvqARs8ebbAfZb
         0bfNOsXZJzfkDV4KRrAtBb5S6Tv01axWsa/Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GTxqOtx/tULQyH+zO3Bz0gEKEdO5gP/P6N04rGxbcPI=;
        b=uU0E16VhRVaw6wnV5JePXpsTdNiQHiAaYpgnvgm8aG57q5NGg+8sgJv59PzuCsd5g7
         tgM3YArafPhSAGyAJx6zhB5uC3L0cqTdo47cpWP1Rte8WAZ9ulVVGHxbHoKipKGAGh1F
         w5EVVIF8/ufFAQOAQ9N2JtTr11BCmPaGU81EAQYq4ZfkP8RzND5wYbvBpEv2in7EvWz/
         JzwZv6QJ6vZl+m74LLldENPji2VqcuTaLdNHKRGU5gcR60CZkJXn+BwoYtCoYdg5r3rK
         jBuWpggQZKRzdceVy1iJS9u91mQ2GQh0/diZHYpWeB4LWIRRfifN7HSSIZbCUAYOjCCp
         WmjA==
X-Gm-Message-State: APjAAAU7WCm6c7kN557RRaVdFDFb5qI807gU68a+F8LwbEyNbZwbQdRC
        x6Cg9VrhxUmDTpO/eZ9koGsgZA==
X-Google-Smtp-Source: APXvYqwY+cdKqt/jiGYWCzxUKnexFNPVOjkqUZM2+zcOxvIsY1mNeS37X+qQARmwQd5Rya5w/9CdCA==
X-Received: by 2002:a17:90a:a613:: with SMTP id c19mr115416417pjq.17.1564418630555;
        Mon, 29 Jul 2019 09:43:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h9sm57029156pgh.51.2019.07.29.09.43.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 09:43:49 -0700 (PDT)
Date:   Mon, 29 Jul 2019 09:43:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] watchdog: Mark expected switch fall-throughs
Message-ID: <201907290943.28A73DF@keescook>
References: <20190729151033.GA10143@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729151033.GA10143@embeddedor>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 10:10:33AM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings:
> 
> drivers/watchdog/ar7_wdt.c: warning: this statement may fall
> through [-Wimplicit-fallthrough=]:  => 237:3
> drivers/watchdog/pcwd.c: warning: this statement may fall
> through [-Wimplicit-fallthrough=]:  => 653:3
> drivers/watchdog/sb_wdog.c: warning: this statement may fall
> through [-Wimplicit-fallthrough=]:  => 204:3
> drivers/watchdog/wdt.c: warning: this statement may fall
> through [-Wimplicit-fallthrough=]:  => 391:3
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/watchdog/ar7_wdt.c | 1 +
>  drivers/watchdog/pcwd.c    | 2 +-
>  drivers/watchdog/sb_wdog.c | 1 +
>  drivers/watchdog/wdt.c     | 2 +-
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
> index b9b2d06b3879..668a1c704f28 100644
> --- a/drivers/watchdog/ar7_wdt.c
> +++ b/drivers/watchdog/ar7_wdt.c
> @@ -235,6 +235,7 @@ static long ar7_wdt_ioctl(struct file *file,
>  		ar7_wdt_update_margin(new_margin);
>  		ar7_wdt_kick(1);
>  		spin_unlock(&wdt_lock);
> +		/* Fall through */
>  
>  	case WDIOC_GETTIMEOUT:
>  		if (put_user(margin, (int *)arg))
> diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
> index 1b2cf5b95a89..c3c93e00b320 100644
> --- a/drivers/watchdog/pcwd.c
> +++ b/drivers/watchdog/pcwd.c
> @@ -651,7 +651,7 @@ static long pcwd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  			return -EINVAL;
>  
>  		pcwd_keepalive();
> -		/* Fall */
> +		/* Fall through */
>  
>  	case WDIOC_GETTIMEOUT:
>  		return put_user(heartbeat, argp);
> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
> index 5a6ced7a7e8f..202fc8d8ca5f 100644
> --- a/drivers/watchdog/sb_wdog.c
> +++ b/drivers/watchdog/sb_wdog.c
> @@ -202,6 +202,7 @@ static long sbwdog_ioctl(struct file *file, unsigned int cmd,
>  		timeout = time;
>  		sbwdog_set(user_dog, timeout);
>  		sbwdog_pet(user_dog);
> +		/* Fall through */
>  
>  	case WDIOC_GETTIMEOUT:
>  		/*
> diff --git a/drivers/watchdog/wdt.c b/drivers/watchdog/wdt.c
> index 0650100fad00..7d278b37e083 100644
> --- a/drivers/watchdog/wdt.c
> +++ b/drivers/watchdog/wdt.c
> @@ -389,7 +389,7 @@ static long wdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		if (wdt_set_heartbeat(new_heartbeat))
>  			return -EINVAL;
>  		wdt_ping();
> -		/* Fall */
> +		/* Fall through */
>  	case WDIOC_GETTIMEOUT:
>  		return put_user(heartbeat, p);
>  	default:
> -- 
> 2.22.0
> 

-- 
Kees Cook
