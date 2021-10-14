Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6012442E2A2
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Oct 2021 22:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhJNUUh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Oct 2021 16:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhJNUUg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Oct 2021 16:20:36 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBC2C061570
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Oct 2021 13:18:31 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id c29-20020a4ad21d000000b002b6cf3f9aceso2253622oos.13
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Oct 2021 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5txnbpCmnm+IrQwl9PvKSBT2SCPg9T00DsDQfs9eBps=;
        b=k5chQ+4SVhUG8L0W29nXXguLxuLbcDpIZEC8LxleIbFr3W671oDln5JjAZc4mADXbM
         +U8mmmIVas9YCITGovBk7H6K2TMH6q6sxbcvDGVoP6THOkR0Ubdx/M/p1XpyPmony3dV
         7kbILYYAI2rT5c2mvyu15aVB+V1pwp06q1LhyNwHcvRKEdXsTdXH27qOeDoKTfVaAGE7
         g2KBe9WlLSjZqFtRgVXive6AWPiJLJvHFERi+pVbDuslu0pOqf/Ei+Pc3XDGNBNmau+U
         orHm0Oj4GSpnPfDw7IccBkfDCiO2hHy6ziAUXxwIfP8Jo8I24+R83XT9L5o1a9ZeN4cA
         iVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=5txnbpCmnm+IrQwl9PvKSBT2SCPg9T00DsDQfs9eBps=;
        b=GIWm0vAvzRKxajQ1pJBtNlI5kIQMscLYvTjgcP5SkGqPg6MF7lXbOY+dinfCZyIanb
         9+jTLlp2L6ixwHNRqoRhbAi8X85N6egCRot4/SoD/ugnmjWMVxef5OBKl3ebV0Y74E6b
         MsLQ1zo8osodODuX4mF1meaC5HLKr7Kx4gfRuH7gjX6lOKcvBuLRddDnmVY33CsOixW5
         e2tMchfprRktCCEPEFs3LgeukdLhV54ksnLmPNZ/6WxY4Q+d5JazSY2EbGHRM0t1HCJu
         ns0PJ4tsZvcD3gUjRh29tThWglYgqho59puQL9pDGj3vV6mW8VZJ2NcfEIDcTuTdXiN2
         +E1A==
X-Gm-Message-State: AOAM533IuBqenHj2zX1KcfSFQETIAdzz6W7hJAy5TrXwFmwkdA+0eY99
        avLJXhDU+7V38GndZByoBUv43YGlSFQ=
X-Google-Smtp-Source: ABdhPJz9BKdq4mUhBrCdyDlBRICfeDWz+etlTagD/c5YbVk/nPemVwx7Syl+WBUQ6d2Y6QuMPkLkAQ==
X-Received: by 2002:a4a:8f04:: with SMTP id e4mr5868770ool.37.1634242710801;
        Thu, 14 Oct 2021 13:18:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h23sm717719otl.54.2021.10.14.13.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 13:18:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 14 Oct 2021 13:18:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     06eba290-1794-854a-f999-86668211dcaf@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: Fix OMAP watchdog early handling
Message-ID: <20211014201827.GA4061613@roeck-us.net>
References: <88a8fe5229cd68fa0f1fd22f5d66666c1b7057a0.camel@duagon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88a8fe5229cd68fa0f1fd22f5d66666c1b7057a0.camel@duagon.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 14, 2021 at 12:22:29PM +0200, Walter Stoll wrote:
> 
> TI's implementation does not service the watchdog even if the kernel
> command line parameter omap_wdt.early_enable is set to 1. This patch
> fixes the issue.
> 
> Signed-off-by: Walter Stoll <walter.stoll@duagon.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/omap_wdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index 1616f93dfad7..74d785b2b478 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -268,8 +268,12 @@ static int omap_wdt_probe(struct platform_device *pdev)
>  			wdev->wdog.bootstatus = WDIOF_CARDRESET;
>  	}
>  
> -	if (!early_enable)
> +	if (early_enable) {
> +		omap_wdt_start(&wdev->wdog);
> +		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> +	} else {
>  		omap_wdt_disable(wdev);
> +	}
>  
>  	ret = watchdog_register_device(&wdev->wdog);
>  	if (ret) {
> -- 
> 2.33.0
> 
> 
