Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E453D37BF5E
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 16:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhELOHt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 10:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhELOHs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 10:07:48 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6556EC061574;
        Wed, 12 May 2021 07:06:38 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id u16so22357039oiu.7;
        Wed, 12 May 2021 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oy8eUtalMwAbg8wynclRyiPnado/Uo2NJP490ONiUbo=;
        b=YqY/AB0R84rEUwKjaZ4bw2PWRLi+jjp0/7BAMxwccKlJDOMIAE6YG7sUyJLgd6pFNx
         /ZUhdk9i3iF/VhFOmtibCfS5gaKljbeSE45G4BthNZlqrUYn9fwW6PLz2TtwpFydqzhG
         7JjJve/OyBoAQkKLecl3OAZjPSvMkzAtyUys8WpDy+A1/zGG94Y1rFsTR0FzkrL1SoVz
         +oBoSHlfOUQpACADiPA+xvWRDyUkTTYli4uQ91WHFOkjgmqnA9a/LCOkhNr3mBm8qUuU
         zdC4Rt/lzqJmdDRDeZk+akwbe4A9BSLCTvvWTayCQKk7v3oO2sVqDj4EFTBXulpQvWYl
         2LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=oy8eUtalMwAbg8wynclRyiPnado/Uo2NJP490ONiUbo=;
        b=MKv5z3UueYBeqlL7xqpUbbZys4RfiVXj4IOCVAojg05dRPA7LArS58p6K+tI/J9Zku
         R1En3/QXrSG/3oG9AIWKPykBGWF3K789t0HMsgaaWjwqVq6r2A6ZHhBePfM6v5VaQ0wW
         sg4Yb5vaksE0Yb+qz4yRrNg8wLNyn0hXKF5VfNv8iSXilQ+JaI8DbJhhWCt0PbQSVQoR
         SxqzGCAQhiyS5vyC25i5gbU8VupZBK8xax3jnDoeqz/jegJ7umt6n1czc/dq5a4+1Sr5
         h+9IRhRcu8TVgYhnrlAL3uDFmPey0WSU31hlAhl8Rs1gPn+Ri21E46Rpnd0awON0ZvNA
         bRVA==
X-Gm-Message-State: AOAM533hUN+JWzsNfSEGg03XTs8j8kjyb7xFbGgla4/3F+JTwfJf/Yv4
        lngU5qANg87LGFxwlwYgmnI=
X-Google-Smtp-Source: ABdhPJzIAL+lLHZZUFV+qN0AE++7/Z4iD+3nXYuvOIOHXfH55IZIGN/SI2H/YgV3nGRe8aR1O+XgZA==
X-Received: by 2002:aca:f206:: with SMTP id q6mr7783987oih.80.1620828397887;
        Wed, 12 May 2021 07:06:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r19sm24169ooj.5.2021.05.12.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:06:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 May 2021 07:06:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     wim@linux-watchdog.org, vz@mleia.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] watchdog: Fix possible use-after-free by calling
 del_timer_sync()
Message-ID: <20210512140636.GK1333995@roeck-us.net>
References: <1620802676-19701-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620802676-19701-1-git-send-email-zou_wei@huawei.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 12, 2021 at 02:57:56PM +0800, Zou Wei wrote:
> This driver's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
> 
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

If you have more of those, _please_ submit them together to save review time.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/watchdog/lpc18xx_wdt.c | 2 +-
>  drivers/watchdog/w83877f_wdt.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
> index 78cf11c..60b6d74 100644
> --- a/drivers/watchdog/lpc18xx_wdt.c
> +++ b/drivers/watchdog/lpc18xx_wdt.c
> @@ -292,7 +292,7 @@ static int lpc18xx_wdt_remove(struct platform_device *pdev)
>  	struct lpc18xx_wdt_dev *lpc18xx_wdt = platform_get_drvdata(pdev);
>  
>  	dev_warn(&pdev->dev, "I quit now, hardware will probably reboot!\n");
> -	del_timer(&lpc18xx_wdt->timer);
> +	del_timer_sync(&lpc18xx_wdt->timer);
>  
>  	return 0;
>  }
> diff --git a/drivers/watchdog/w83877f_wdt.c b/drivers/watchdog/w83877f_wdt.c
> index 5772cc5..f265086 100644
> --- a/drivers/watchdog/w83877f_wdt.c
> +++ b/drivers/watchdog/w83877f_wdt.c
> @@ -166,7 +166,7 @@ static void wdt_startup(void)
>  static void wdt_turnoff(void)
>  {
>  	/* Stop the timer */
> -	del_timer(&timer);
> +	del_timer_sync(&timer);
>  
>  	wdt_change(WDT_DISABLE);
>  
> -- 
> 2.6.2
> 
