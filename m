Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19B6402912
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 14:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344372AbhIGMlP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 08:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbhIGMlM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 08:41:12 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8872DC061575;
        Tue,  7 Sep 2021 05:40:06 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso12559607ota.8;
        Tue, 07 Sep 2021 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jSFB76mJtBtJxyYrDIOUp8Yc68sCq7UHLiUOXoJ/fwc=;
        b=Nivp7jrjKYd+ve5Yv7nVQbVIRHB8icoYwiJH6n8mtqhYv49LqgcUHp/yFG18+RY1JQ
         +2aeiubqdC5isbtg2qt6wyTVwDZ6Y3T0vHQlWi84VFIXeJgSqLT6bfX6afCU7EYkjYUh
         qxpmU9hnug+nWyyOh7p9Xzw3DE4MDwjChUKrcFC7UCH1VCSxyW33lwb7YB5l1KvBBy96
         mPtHSo3EOvY17gPuFcm5vG6quXkER6iGzvVIptLURvSv2H3g4OVn/K7JpCa6MqSheel8
         OFRQp9Ia3qWA7b7ZlPaiRnt4VPMgjFacia4Is65eS0+kWmMLbe7C6t557h7G3YCgyMYw
         0oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=jSFB76mJtBtJxyYrDIOUp8Yc68sCq7UHLiUOXoJ/fwc=;
        b=tm/G6Shuevv4cjB4Ma/2MdG2SFwuSF+ikZ0MzwTIKN+oAvLUaI1MxLXMy9lLuU3JIj
         Zv0tsItOC3Dy2GseRIwcuBWh8LQjVPZTna8Wzdg5nxRtKCAPY0pB8us1Q8E/QBYUcNzA
         w1OJfRM0pN1XcGsLU5GT/kXTqPDfwjv9ZBIPbE/AnzWh7SA/tufaLHKCOcfdJMLnH/q5
         oSli3uqiXoPKob5rkgHtct++f8tQ4g9Nqqnw4SIpyGMQNF/hCpfvra9mBk/iczKajCtX
         sJ0YV0yn0CJDk6hHI5eqQoth03V2jmfQZKH6bwAX1fqlKXjE1w2nulcrBg2ToswZ3qqi
         gjIw==
X-Gm-Message-State: AOAM533lvslurSJTbk8NH9zlznR8MpBp3GSIr1MurXQXYeD+8gK5Bdu3
        R6Nl8Y953IMQX0vUK1bcB0IBcEgwXI8=
X-Google-Smtp-Source: ABdhPJwmXoLbt8ISJ5d2/Mh9zVNgqjj4qQ4Qdq70t2xmJ3ZgBBt2DtZEHY8Q6yGagHaYJTCvNk3Dvw==
X-Received: by 2002:a05:6830:2486:: with SMTP id u6mr13450866ots.181.1631018405976;
        Tue, 07 Sep 2021 05:40:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e11sm2056293oiw.18.2021.09.07.05.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:40:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Sep 2021 05:40:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: rti-wdt: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210907124004.GC4989@roeck-us.net>
References: <20210907074237.2808-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907074237.2808-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 07, 2021 at 03:42:36PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/rti_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 359302f71f7e..117bc2a8eb0a 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -194,7 +194,6 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  {
>  	int ret = 0;
>  	struct device *dev = &pdev->dev;
> -	struct resource *wdt_mem;
>  	struct watchdog_device *wdd;
>  	struct rti_wdt_device *wdt;
>  	struct clk *clk;
> @@ -246,8 +245,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	watchdog_set_nowayout(wdd, 1);
>  	watchdog_set_restart_priority(wdd, 128);
>  
> -	wdt_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	wdt->base = devm_ioremap_resource(dev, wdt_mem);
> +	wdt->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(wdt->base)) {
>  		ret = PTR_ERR(wdt->base);
>  		goto err_iomap;
> -- 
> 2.25.1
> 
