Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D1524FF21
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Aug 2020 15:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgHXNkt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Aug 2020 09:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgHXNhb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Aug 2020 09:37:31 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F429C061575;
        Mon, 24 Aug 2020 06:37:30 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v16so4250442plo.1;
        Mon, 24 Aug 2020 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KxnJ226rDEIRCYSAfgyQD9VSISjkVVFiQbho/xUa2SA=;
        b=NMmyyMPgB/lrfnnRRTyR4UPqUE/BEx0i2SqGdFdnIR5BqKp+uXn58ArQ9p+GBWGXBG
         ga3kv+F6nJNaZ4aa1iIfYJvoXVylqsq6BXkOflL5RHQpXN8oetMgfb9Pag33aZoZ4Ufc
         bs5aluqrYiYOOA6008C7gl4/JZvEf6w6EMbtQ25UvXVSLL6Q1Fo67IUW00eLkPlf20ca
         Hm9fXSpvbYkqzxnZjw8MeRBSxxAZEI/+V7vp+uGooTrn4JiQpnn0bKGBrAUY0Cy7+iTB
         fz5LxtHabotoJNfBiZukJbuJiKmqfyBrv2j1wToMfeYUBXoJsJFpvHFNn+zoUNmssTEL
         1/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KxnJ226rDEIRCYSAfgyQD9VSISjkVVFiQbho/xUa2SA=;
        b=dNa7c1R1Kz1L6Ganppk9Ty/OutlzWAPmiZoaZpFkMZJsyfQJGQ4LV71L1B7KjIRPRN
         ucmEBkpfd+vHIWaYKDVZ99Z2Dd7Pi2YZ8KID+cOtH2ypWdF5ljKrj0CR/GjpFcKwdYNY
         nZ/mrGS0DIJBlSuKUy4lOSeY+0eVxaov95cj5v731DaewylM0bwBYxwEgv89BORehP1V
         7NHpRM1HBuQSF1D+T2E4TdfAEz1JZfIXfuKHWUmyJG1PDcM3bKt3AlVnzTQzWstFWzxs
         6sNvnYdnhRJx3iRBWpJRYsC5XoUlLQvY7/n66LLfiQgED3TcHnK+sEzfyAqDAPd/5NL5
         2aPg==
X-Gm-Message-State: AOAM530vsJRENw6oTx6WTFGbolltOp9tT0oP2lTDTF4IbOq49D+WRYCi
        BiaO9KdMDf5qU1+woraK/xs=
X-Google-Smtp-Source: ABdhPJyblR17voN8n55AJBmzyqzj7oJ0VpoOBnxQZXjNDrfhr/CoulNXRFksFXDdkDw5JzvcD3o1rg==
X-Received: by 2002:a17:902:d90e:: with SMTP id c14mr3804333plz.76.1598276250112;
        Mon, 24 Aug 2020 06:37:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7sm10518969pjm.3.2020.08.24.06.37.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 06:37:29 -0700 (PDT)
Date:   Mon, 24 Aug 2020 06:37:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Sobota <krzysztof.sobota@nokia.com>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] watchdog: Use put_device on error
Message-ID: <20200824133728.GC192024@roeck-us.net>
References: <20200824031230.31050-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824031230.31050-1-dinghao.liu@zju.edu.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 24, 2020 at 11:12:30AM +0800, Dinghao Liu wrote:
> We should use put_device() instead of freeing device
> directly after device_initialize().
> 
> Fixes: cb36e29bb0e4b ("watchdog: initialize device before misc_register")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changelog:
> 
> v2: - Use put_device() instead of just removing kfree.
>       Move the memleak part to a separate patch.
> ---
>  drivers/watchdog/watchdog_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 6798addabd5a..b0fa7f31b1b6 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1021,7 +1021,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>  				pr_err("%s: a legacy watchdog module is probably present.\n",
>  					wdd->info->identity);
>  			old_wd_data = NULL;
> -			kfree(wd_data);
> +			put_device(&wd_data->dev);
>  			return err;
>  		}
>  	}
> -- 
> 2.17.1
> 
