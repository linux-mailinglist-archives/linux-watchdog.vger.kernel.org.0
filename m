Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D823D2DC7A7
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Dec 2020 21:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgLPURU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Dec 2020 15:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727435AbgLPURT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Dec 2020 15:17:19 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4966C0617A6;
        Wed, 16 Dec 2020 12:16:38 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id 9so21992657oiq.3;
        Wed, 16 Dec 2020 12:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8hhKgEMfi2vfO+dxs0RWimNTAfYCwpDzMcSrcMDjMJQ=;
        b=vSoWwTahrDjLBCS8tUkmb5burHL4qSghHNtQF1M0iMKTLNkI2sb+TIBJT+eAik+sOz
         gHx8n2hIH/hjwWs1k+IiuEiE8S2USF6+o9VflXevzldR25Xi+W+0r6crVG6TeJhjpdIX
         EZp/pWuu+3Zaj6pMzqL10pE1/DUujYc4EsTWHaaawRyrUZOgD28t2PfGYNCSdA8AN/Oh
         cKZZ5aqt/nMBTi0pzCE2r7uFz9Cw5W9jOJmDmx+lG1RKEgpi3zsVi/BT6feIS36pPHvP
         zkGrlxkLE9vT0SqJgEDr4nTNz+zHhdqrPzAHoDslUHGSt3YT1uN/No584UJfzzZ1RxMX
         DwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=8hhKgEMfi2vfO+dxs0RWimNTAfYCwpDzMcSrcMDjMJQ=;
        b=L8Q4m7zgMCLp/Y+Rl5Xuw0AQuaaS3bTQ4HfgX+UDJdmf+A1Nw7hkaRs6JbGwKUEEJ+
         rtgxIuQBqSlLRG7kjgWtMpKYoMgtkN3q32+RzbmnXtGY9qxTZorJ8glTwYBlgsxRvGxp
         U8nDyShIGQduFxJvNvIpMO0QrQo9NCJ+ztOf1OpbnbBSvCcrFxS/FUXswO7Qmejh3hux
         SDex+EG8DkPtPpWwhFb39Nt34Bbq/rhdP/8FF7V97NgERTytmjSB3VElxnC6DFUf4Wxp
         VmB5QyMPvjLz5p6it3r4iHqkUYGfShIPdBzFV2CR0mAQhpBwTc/NTPhUCHAy8t3tgFVz
         qfJQ==
X-Gm-Message-State: AOAM530ngC7YzUKb0g4QzzGNuQnhsDbM+38Uifbu2wTQldbSTeZ/1W7b
        UFuoi8evhzwQ37sn0LkIivxdWNKNEHs=
X-Google-Smtp-Source: ABdhPJx6z0Cs44O4U5z7AXt0W9f8JDuw5m1gCBUo2jIU0d+Z7EB9GOpD8lm8naczamIQ6CfAoqM6+w==
X-Received: by 2002:a05:6808:3ac:: with SMTP id n12mr2952915oie.142.1608149798188;
        Wed, 16 Dec 2020 12:16:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k63sm634145oia.14.2020.12.16.12.16.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 12:16:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 16 Dec 2020 12:16:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] watchdog: convert comma to semicolon
Message-ID: <20201216201636.GA68047@roeck-us.net>
References: <20201216132733.15635-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216132733.15635-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Dec 16, 2020 at 09:27:33PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/watchdog/mpc8xxx_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_wdt.c
> index 3fc457bc16db..2f7ded32e878 100644
> --- a/drivers/watchdog/mpc8xxx_wdt.c
> +++ b/drivers/watchdog/mpc8xxx_wdt.c
> @@ -175,8 +175,8 @@ static int mpc8xxx_wdt_probe(struct platform_device *ofdev)
>  
>  	spin_lock_init(&ddata->lock);
>  
> -	ddata->wdd.info = &mpc8xxx_wdt_info,
> -	ddata->wdd.ops = &mpc8xxx_wdt_ops,
> +	ddata->wdd.info = &mpc8xxx_wdt_info;
> +	ddata->wdd.ops = &mpc8xxx_wdt_ops;
>  
>  	ddata->wdd.timeout = WATCHDOG_TIMEOUT;
>  	watchdog_init_timeout(&ddata->wdd, timeout, dev);
> -- 
> 2.22.0
> 
