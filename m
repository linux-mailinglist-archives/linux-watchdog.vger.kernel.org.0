Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA8D1E8418
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 May 2020 18:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgE2QwV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 May 2020 12:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgE2QwT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 May 2020 12:52:19 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BACBC03E969;
        Fri, 29 May 2020 09:52:19 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 64so10030pfg.8;
        Fri, 29 May 2020 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UieuuHwABRQ8j08vsNUDLwjEDTUH0tzlSLBLMuMByzE=;
        b=c14uI0LX3xPTV5/h1g6EkXRK79EU648w3wZHoWKEtRD0Cu4eT4pVtfebwVhYPDK3Dt
         ombq0TwxazU6kxjuu+LweZ6p8mHDcsmxxwD3EqMYvOOUWt8voejncyYDgCmVDTX7+VfV
         sT54jhX25vsaJWb9TamG3F6T4f7WUdRltk7IT0JOVCPjcMAYpazwcX12xOhoDqXY8f9c
         Y328TatQtqWemHvLJFlvgMQEQ5lEw3VigC1JYRev0r++/jTV5F18xF8+sJdkpMEfTsM3
         kUsNOWPn5n4Aai5msruEgZWor9+6bzyw0tDjv1eAo3xrxbhVxyWHIZ8ffSHJ/Bxy6iWN
         110w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=UieuuHwABRQ8j08vsNUDLwjEDTUH0tzlSLBLMuMByzE=;
        b=MQmVqYWG64DgrtHcr9MLi/0F/LI3nzavaLqZ9KWqN1DZj9cLMPojcD/vUpjuT6LPR7
         u36vstof7eeeysgqaqaqJ8i6tYNy+ViFxWGZbovC2K19KWEm0Ku/lOeBnOBCpU8tRkLi
         PsG0KfJHBHHm/qv9qK2SWGCILWHq9y3EZHWXJ5Gg0QWemE7/EGA82j+6IFvbPIcid+Pj
         zmkL/UOdftO3/WCR95LzqPm3HMJdlJEsN+br6RwM9GFn/B/OLJUICQQR5HlAIvBBbEOR
         VEe+FmNL1HBOgGoZAnd97bJWAE9znXsvQ4SSrzXeRXzprws2n2WoSk64apMNb224edck
         B2DQ==
X-Gm-Message-State: AOAM532V2L9s7Mlz1wCa2LSWSrri0h6q7gJ1JMHbJ6mnR6kT3AHWnEcU
        SeNt6gbFIaXQowlxLYytpZ4=
X-Google-Smtp-Source: ABdhPJweHkcVn9nVTlA7bOOtgiDRGgSHROmAD82PGADwi8kiFHluroxGtaNmls9h/Fs6uYt0x77g/w==
X-Received: by 2002:aa7:959b:: with SMTP id z27mr9120038pfj.96.1590771138884;
        Fri, 29 May 2020 09:52:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u17sm7316518pgo.90.2020.05.29.09.52.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 09:52:18 -0700 (PDT)
Date:   Fri, 29 May 2020 09:52:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bumsik Kim <kbumsik@gmail.com>
Cc:     wim@linux-watchdog.org, corbet@lwn.net,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bumsik Kim <k.bumsik@gmail.com>
Subject: Re: [PATCH] watchdog: test_bit() => watchdog_active()
Message-ID: <20200529165217.GB162777@roeck-us.net>
References: <20200529012428.84684-1-k.bumsik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529012428.84684-1-k.bumsik@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 29, 2020 at 10:24:28AM +0900, Bumsik Kim wrote:
> Use the dedicated function watchdog_active()
> instead of the generic test_bit() function.
> 
> It is done using the following Coccinelle script:
> 
> @@
> identifier wdd;
> @@
> - test_bit(WDOG_ACTIVE, &wdd->status)
> + watchdog_active(wdd)
> 
> Signed-off-by: Bumsik Kim <k.bumsik@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 7e4cd34a8c20..3ae608d78af2 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -916,7 +916,7 @@ static int watchdog_release(struct inode *inode, struct file *file)
>  	 * or if WDIOF_MAGICCLOSE is not set. If nowayout was set then
>  	 * watchdog_stop will fail.
>  	 */
> -	if (!test_bit(WDOG_ACTIVE, &wdd->status))
> +	if (!watchdog_active(wdd))
>  		err = 0;
>  	else if (test_and_clear_bit(_WDOG_ALLOW_RELEASE, &wd_data->status) ||
>  		 !(wdd->info->options & WDIOF_MAGICCLOSE))
> -- 
> 2.26.2
> 
