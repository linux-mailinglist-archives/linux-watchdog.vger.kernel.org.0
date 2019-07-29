Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAE179246
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 19:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfG2RmD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 13:42:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43279 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfG2RmC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 13:42:02 -0400
Received: by mail-pg1-f195.google.com with SMTP id r22so1014062pgk.10;
        Mon, 29 Jul 2019 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jmWNPGpEcvuFfjA7r1BLpL3AftzHhOFH91ce922Egwo=;
        b=J/tqT3H5cx9WqZXshDXgmxLfI/J9u8mXHN+RbBi3G/USyhRIrKoP6kA7LqP3TSBmNX
         gT1DNyziLGUyJS6chh9Cr//ADNoLdQYuyRqHnkHz823ph4iHUVCMr7ujqfO3XtPvQdt7
         J5DRkiT3wUMeNDa2UDgt+kqTfA88CPlLLB/p3xMxJOLPgq/Fw12EN/lfZs7Od4L8TId1
         cPq8ZaJI7e3wsQKShJoeZwFxFyUR7HvMyMkIb0u9fNB1furRWoUx5fvtiBVJEuIgZw+a
         nUYgGkLK9UEck8Vx9SnsEYhq2RmT0ABTVMb3auh59wXby9wnB1ShH2rO1dLStW/mphH+
         OYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jmWNPGpEcvuFfjA7r1BLpL3AftzHhOFH91ce922Egwo=;
        b=tjYkQgDFSVcFUNfRvCikIRqGKwQOKLwi5ea18GDYynnKEVGG1Vckf0Yx1+kx7k7KRk
         ONPlmid7fUhn5gyDLRWn7lzzVGCGr/q05qzGIX/vpsniDPi5Q+V08+fpChc2RWGWJl66
         eQsIwfO4+9tDrJb75NEFguLU1tByPVIj/BIeq+jLC4UAGYvNqJ0+VqpzjQwz1cslyZIk
         81ftOMiB9kBPjxg7XhrwMVjxEyMpdQGadYXft0E0Km92VAnsIEzxGBTJEC7cauQJSYWc
         GxZ2dB3egIAB95G0654Bvedna7uJyXKENnYONBX1ieThwZ0DgmYXQqbWr0znDOFGNXEj
         phXQ==
X-Gm-Message-State: APjAAAUngeTgjUOqokXrhfj2Q2EZvkSIWnzq1YGNmouFwdrrjbWFQ5CD
        lhu24cVvx46WJlYzEtM+Z/s=
X-Google-Smtp-Source: APXvYqx7h55NrKFBAwOGgl/iS1bKTiyfGmCSpIw+Llin8keB0UvG/7XqCrgCuvhQeLr217HUIqljNQ==
X-Received: by 2002:a17:90a:5207:: with SMTP id v7mr108694829pjh.127.1564422122230;
        Mon, 29 Jul 2019 10:42:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v63sm64782707pfv.174.2019.07.29.10.42.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 10:42:01 -0700 (PDT)
Date:   Mon, 29 Jul 2019 10:42:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] watchdog: Mark expected switch fall-throughs
Message-ID: <20190729174200.GB32556@roeck-us.net>
References: <20190729151033.GA10143@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729151033.GA10143@embeddedor>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
