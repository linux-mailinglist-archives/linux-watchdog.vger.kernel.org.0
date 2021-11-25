Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B299E45D370
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Nov 2021 04:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344985AbhKYDLj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 22:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245421AbhKYDJh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 22:09:37 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA95C0619E6;
        Wed, 24 Nov 2021 18:33:19 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so7240176otv.9;
        Wed, 24 Nov 2021 18:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FzruCpHTuVDhBSIsG1eTOXd9RDdSQPTEZ/7U28aWtgw=;
        b=gH9gEdqwyXOHMCnta4W3bG65lK1pTrnVSMIIZzyJR1B5/Ew4VqWIJfOqYW0K3SjOLD
         6CEI7m4MqIH7j5jsEBArVNWBwisK6MW6hH9k5b5uGhfTBKoFGJdPZWC9vaotmaqWFlVR
         xR2ApiDfOzJmoTvwtBujKXBR8Sj8JDBAKAGsxp2tRGQiXNBhyChn4VQdn2w0AgGm+pgz
         r8kfxDxwk4gVBIN4aD8qVJpl8X5oSb589NL/5kNtCs/PKj8/rQxYF7A3pVfcW00STQPO
         wqR8nwSDhTvbo6mxLy6lfiUHd1NL9VGhRDIaKlsNn9y+rKhrkAQ49zBQ+oE15TpPttuj
         rMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=FzruCpHTuVDhBSIsG1eTOXd9RDdSQPTEZ/7U28aWtgw=;
        b=oS1MYd9Dg+lfiBcazTK7+wTfo5QH9AZzNQ61KrLlpmz54wEj5dNLYCGvK25rc7Wkql
         JI7bfC6rMUVHUt4Mra51I0FpDuBMAns3WjJ7yhvVRdgbMbxAybCXNtphp8P5ruocAk55
         CZnL3a6YF+qPqNCGwvrgm443+2Oxb1jtUofFn79kAZ0sFJoOZ3ZXsv9MItBhN/h/z/gx
         OCUBOdZEFKyKuOMQWt7WjnxMFTvHEUUTgfrpgMyLBK0HtVAAunZIzBcEsynWeceCwMzf
         uiLvdXRiuuXqYvfEs3hhFQ1fgAGAqYHeZlnxy69u2TVcmWCW4OsaUJh2dO+N/hzYh3WM
         dtpA==
X-Gm-Message-State: AOAM532fmMWwpV5jrj+JKPZw30jFay2eE+ZhhTdRdnmF3sph3yVoHdDy
        X1/k5WGdykI0A6zNqCVqGzMeSmcIJIg=
X-Google-Smtp-Source: ABdhPJzQ/gsw0ESgF4EaGULaMV01pscDEYyj0XKYKKqpHrHESLg1ERw33D6cAIdLj/oIrzaWDnOWrw==
X-Received: by 2002:a05:6830:44c:: with SMTP id d12mr17809980otc.66.1637807598545;
        Wed, 24 Nov 2021 18:33:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n6sm306100otj.78.2021.11.24.18.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 18:33:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 Nov 2021 18:33:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     cgel.zte@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] watchdog: davinci: Use div64_ul instead of do_div
Message-ID: <20211125023316.GH851427@roeck-us.net>
References: <20211125014924.46297-1-deng.changcheng@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125014924.46297-1-deng.changcheng@zte.com.cn>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 25, 2021 at 01:49:24AM +0000, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> do_div() does a 64-by-32 division. Here the divisor is an unsigned long
> which on some platforms is 64 bit wide. So use div64_ul instead of do_div
> to avoid a possible truncation.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/davinci_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
> index e6eaba6bae5b..584a56893b81 100644
> --- a/drivers/watchdog/davinci_wdt.c
> +++ b/drivers/watchdog/davinci_wdt.c
> @@ -134,7 +134,7 @@ static unsigned int davinci_wdt_get_timeleft(struct watchdog_device *wdd)
>  	timer_counter = ioread32(davinci_wdt->base + TIM12);
>  	timer_counter |= ((u64)ioread32(davinci_wdt->base + TIM34) << 32);
>  
> -	do_div(timer_counter, freq);
> +	timer_counter = div64_ul(timer_counter, freq);
>  
>  	return wdd->timeout - timer_counter;
>  }
> -- 
> 2.25.1
> 
