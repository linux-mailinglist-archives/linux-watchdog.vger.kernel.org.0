Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515A240290D
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 14:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344181AbhIGMjz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 08:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245607AbhIGMjz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 08:39:55 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5559DC061575;
        Tue,  7 Sep 2021 05:38:49 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id v2so12580270oie.6;
        Tue, 07 Sep 2021 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IO4DPoLtWn2M7NjsFY+uOpOIAUUOqfEf7qzY3pNf7wE=;
        b=emtLAkOoQEJhdar1+Ymd7JtttOJ+JbMQPS5pibqpMlWQuC4MPLBvm5WBwyh9+lfyTb
         tCdeq7LZxqwVboZRkO1ahNC84nrGEAxsWKvQMhutPzzC5VABSZl1EwmB0bbDxB/Kt2Q1
         fX2uG0KJrn4wraXCAJGwR2ZF0KTT+wLNFkmV1A6ebHT4e4kGFvHxsvHWWEpHFWOLaLpO
         Pwc8jv9AmNtHAPWl1ZE2qpkTSnnoQDfhOceLPar02Age1arCJO+pQLjGBz6jLHsrarKr
         TgnKrmkM72kb2By8KGI8jgl36Y50cTdGScbuGHLt8P9KQM5ub6a6mrFwXrox0orcFsSd
         U2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=IO4DPoLtWn2M7NjsFY+uOpOIAUUOqfEf7qzY3pNf7wE=;
        b=rn9/fmDnj8Lp7Npxn0Y+B4SGSRkKj8mubMSbjNl0SfHgn8SM/ZjJL8LVsszmGkeO6L
         oXOT3A5lDW5+CVvTv1CAj+RKLRh/DrKW9CFbMMFQv+VSi8EbsdjkG498hGhSZKRQucQd
         wccxx6ialxt+Jzuje6f3jdrlMBbBGPueJK4CGL9Yo4v4oDINuhKRCg0i7ZHyHMyMLZNf
         PhVMRRbqMUGE3FFA9TmfY1TmRxtTkkWIm0ry3phZlxdfhduQXaM615uqxD1KXFlA0kPp
         f0nXmVLEgAgDyXV1zNNMC3lmUw7Mo0sz4toSN7i7XZeaX/sPUgtzhB9k9nfa9+NMjUPO
         rqyA==
X-Gm-Message-State: AOAM5310YaSceT2bzltkaUvyiS8VeOjCMPWfa5fQ/+u9IQ9GfH91ll2n
        Y4gm7PevZntSUniqdG26aC7YqS05QCg=
X-Google-Smtp-Source: ABdhPJyI8KMl65HXoPcv3xq/e7uAjIEqAJQwT2oVTCkCyhG4T/P7uLzNvlpAwFZGlKCsz07gDKu+lw==
X-Received: by 2002:aca:2419:: with SMTP id n25mr2745768oic.90.1631018328745;
        Tue, 07 Sep 2021 05:38:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s14sm2037256oiw.8.2021.09.07.05.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:38:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Sep 2021 05:38:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: ar7_wdt: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Message-ID: <20210907123847.GA4989@roeck-us.net>
References: <20210907074223.2706-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907074223.2706-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 07, 2021 at 03:42:22PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ar7_wdt.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
> index ff37dc91057d..743e171d97a3 100644
> --- a/drivers/watchdog/ar7_wdt.c
> +++ b/drivers/watchdog/ar7_wdt.c
> @@ -63,8 +63,6 @@ static DEFINE_SPINLOCK(wdt_lock);
>  /* XXX currently fixed, allows max margin ~68.72 secs */
>  #define prescale_value 0xffff
>  
> -/* Resource of the WDT registers */
> -static struct resource *ar7_regs_wdt;
>  /* Pointer to the remapped WDT IO space */
>  static struct ar7_wdt *ar7_wdt;
>  
> @@ -265,9 +263,7 @@ static int ar7_wdt_probe(struct platform_device *pdev)
>  {
>  	int rc;
>  
> -	ar7_regs_wdt =
> -		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> -	ar7_wdt = devm_ioremap_resource(&pdev->dev, ar7_regs_wdt);
> +	ar7_wdt = devm_platform_ioremap_resource_byname(pdev, "regs");
>  	if (IS_ERR(ar7_wdt))
>  		return PTR_ERR(ar7_wdt);
>  
> -- 
> 2.25.1
> 
