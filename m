Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFA12A0C95
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Oct 2020 18:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgJ3RfY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Oct 2020 13:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgJ3RfY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Oct 2020 13:35:24 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E03C0613CF
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Oct 2020 10:35:24 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id u127so7416762oib.6
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Oct 2020 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F+IauR9qU07iIuHRwGgSsAW838D+4rlP5cqNxXTm0BU=;
        b=DAaNDC3elN0VFyTQpnbtWVmCJEImwSUJRosS19BCA6GEuQYX8O5Ve6ceH699prXFXA
         KVgzDewueVJ+uxR8mhPbN19l39kvNASmm4sUDtRYMvP8rhfOP+Ib4OoanOfWKZK1+n47
         VEPwnk7tEFOPPkH+s5IGUDzFLB0MrK8NcmdB4j4VbOQLoLdDhVszfSD6Fh5v6guz5vq/
         71FBWvESaL/ozL4G5hAoxMNrXfAu4YRfm/k9WX0qFAxnR9vB3+t1z2VXc2UyLaADmppV
         NdgBZkd3w0Hd54raeoOCQGgqEDGJg2XfxLT42KaOU+cX2lpDEp27z/X+NePCLsaEqBfK
         SNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=F+IauR9qU07iIuHRwGgSsAW838D+4rlP5cqNxXTm0BU=;
        b=VKT1dHdlTJO+F5k4QRxUoW+1G5CfMjjKiqr1VZLID1M/ZLm3QBGJXQeMh/tVv0Q9Oe
         11yVLaZDYgONzlSCctaX7PlqByxzmJESfqQvUsQnaoBlKcDogZDxwj9l66f4qmYk1S6q
         OQcDQWFUsovxGVvWL+djjjHHoPOH5UJCRJgBFt1sDwGcO6rVXjM6lo1dY7gmQZCGOaSK
         8vgwhqMAo68qobL9fw9UHNm8jZhfezTLFVSRENuthYx1zNJnO4AJFU2zsOuHyJUjqKJE
         vHOLdX/0WbtFvMYOGIIktpg4Es5yseLaHpi9WeGwiWGFkLJWw8xJ51RxLbdyCbsPL2oA
         djQw==
X-Gm-Message-State: AOAM533Pqj2HtRROKPn+zUphwy0iQj8NrAuQSEhGK1IVMKG2xjx0V1bv
        t1GIOG64Dm3k/JPyY6znRpE=
X-Google-Smtp-Source: ABdhPJwObe5V1PaQXbT+3p1bOVGovEv6il881KG9b3UeqFIS23l0ubmYd/ndTV8309gxtlHT6C9MqQ==
X-Received: by 2002:aca:c410:: with SMTP id u16mr2501725oif.65.1604079323988;
        Fri, 30 Oct 2020 10:35:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z12sm1560056oos.12.2020.10.30.10.35.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 10:35:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 30 Oct 2020 10:35:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: rti-wdt: fix reference leak in rti_wdt_probe
Message-ID: <20201030173522.GA73389@roeck-us.net>
References: <20201030154909.100023-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030154909.100023-1-zhangqilong3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Oct 30, 2020 at 11:49:09PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync() will increment pm usage counter even it
> failed. Forgetting to call pm_runtime_put_noidle will result
> in reference leak in rti_wdt_probe, so we should fix it.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/rti_wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 836319cbaca9..359302f71f7e 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -227,8 +227,10 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_put_noidle(dev);
>  		return dev_err_probe(dev, ret, "runtime pm failed\n");
> +	}
>  
>  	platform_set_drvdata(pdev, wdt);
>  
> -- 
> 2.17.1
> 
