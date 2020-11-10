Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89712ADB11
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Nov 2020 17:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731175AbgKJQBW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Nov 2020 11:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgKJQBV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Nov 2020 11:01:21 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6959C0613CF;
        Tue, 10 Nov 2020 08:01:21 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id j7so14865826oie.12;
        Tue, 10 Nov 2020 08:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kDzPapGdXIwmXcJmTQZGIuILt4q/vwSqlKWbIudkGQY=;
        b=Fg5+setHdx6WcyATDh9i9QQsjuOKojB/1HwsGCqR109+KSbAOS3mznvx0Zmn+VViOH
         j8y3HTl4hsgjbcXiWmz56YdPS+uvtgUeEjzvAGciQd+uEmR/I4C/hfvY4ttxZ7gny16y
         tkM93eZBRudiBqKZ6vQMAUSV84S6DrKKpiz8sHeptHCbjmkc8R34MmuyAZwme6iupq9j
         410RZ+rSPuBFSJLUli3WB4Tlgfu554FOgAg9UjyeMecGI0M2XQLlJEPTQlya9CEhHmwS
         Z3fgkTQXE63ONPBfjW8t0/OTjBiQJb6wk3AyitVH9Aezn6SyRDdrYCOqQAJz+2Rbynrw
         3Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=kDzPapGdXIwmXcJmTQZGIuILt4q/vwSqlKWbIudkGQY=;
        b=ZoPVJd8IbvPF6PkUcu+NNXySi5cByiP3QWNHEmGupEEKGF3T+gkEmj/OWfuxosnYNT
         H3zKOHLn4DgAeKcwpPNdkM0lbnDqD4r/44+jwuGzrUr0a20ExetcMcevX5gbhrSyAK5t
         /eQeUcc5fuxu1gvqUxflZLr9+M14Z3drX9mm1/5H9nYV0uHkZbKx4mUwLAZgTcbFgu/J
         Yxlg5y2ShzZGlSmy96vGJIigW8GA4iEhbUq6D1LakQln1Rgt7MbLAtrym34FwDxXouO/
         hKCJnDOcYCDoIXrIxK/rl2oduOIu3fyaK29rykssHtH0NSJGCM1A6x44JkweCPht6T+j
         DAxA==
X-Gm-Message-State: AOAM533NuL987SriT/3gZQHK2rIZKi4mAFUaZAmri6Vit+JFBWb+J43Y
        VyGE+gVRD2/qp2Iyh3whPKPH4o4pF6k=
X-Google-Smtp-Source: ABdhPJwCXuNKmg2h/odhEd9J6ZKMR6oT6qD8+oU+Elb6I9ADZ62BM2n0Y/GvGA1TUOO+UqOucAuKYw==
X-Received: by 2002:aca:b288:: with SMTP id b130mr3031391oif.152.1605024080787;
        Tue, 10 Nov 2020 08:01:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t6sm3231782ooo.22.2020.11.10.08.01.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 08:01:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 Nov 2020 08:01:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wang Wensheng <wangwensheng4@huawei.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, rui.xiang@huawei.com
Subject: Re: [PATCH -next v4] watchdog: Fix potential dereferencing of null
 pointer
Message-ID: <20201110160118.GA17288@roeck-us.net>
References: <20201109130512.28121-1-wangwensheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109130512.28121-1-wangwensheng4@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 09, 2020 at 01:05:12PM +0000, Wang Wensheng wrote:
> A reboot notifier, which stops the WDT by calling the stop hook without
> any check, would be registered when we set WDOG_STOP_ON_REBOOT flag.
> 
> Howerer we allow the WDT driver to omit the stop hook since commit
> "d0684c8a93549" ("watchdog: Make stop function optional") and provide
> a module parameter for user that controls the WDOG_STOP_ON_REBOOT flag
> in commit 9232c80659e94 ("watchdog: Add stop_on_reboot parameter to
> control reboot policy"). Together that commits make user potential to
> insert a watchdog driver that don't provide a stop hook but with the
> stop_on_reboot parameter set, then dereferencing of null pointer occurs
> on system reboot.
> 
> Check the stop hook before registering the reboot notifier to fix the
> issue.
> 
> Fixes: d0684c8a9354 ("watchdog: Make stop function optional")
> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_core.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 423844757812..0e9a99559609 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -267,15 +267,19 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  	}
>  
>  	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
> -		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> -
> -		ret = register_reboot_notifier(&wdd->reboot_nb);
> -		if (ret) {
> -			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> -			       wdd->id, ret);
> -			watchdog_dev_unregister(wdd);
> -			ida_simple_remove(&watchdog_ida, id);
> -			return ret;
> +		if (!wdd->ops->stop)
> +			pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
> +		else {
> +			wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> +
> +			ret = register_reboot_notifier(&wdd->reboot_nb);
> +			if (ret) {
> +				pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> +					wdd->id, ret);
> +				watchdog_dev_unregister(wdd);
> +				ida_simple_remove(&watchdog_ida, id);
> +				return ret;
> +			}
>  		}
>  	}
>  
> -- 
> 2.25.0
> 
