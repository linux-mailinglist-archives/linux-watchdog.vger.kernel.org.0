Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B27339345C
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 18:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236428AbhE0Q4o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 12:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234487AbhE0Q4m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 12:56:42 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962FEC061574;
        Thu, 27 May 2021 09:55:08 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so850461otg.2;
        Thu, 27 May 2021 09:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d0V6V02YDwePwW8CyIzqlzEZIjOOvufvHwiqqcZr0v4=;
        b=JgHKJpjUAiidW2o343Qw/DhxAeEP8n7+wPR9WfHR0B9EI9SlSt/3kBYTXyKXsiK09I
         tKbr9CSXnHmp4A50Zi3N7P0QK1lMHtFKRU8Rt+5NfKh2+8chau5lpKzbXh8Zk43wXq2H
         RwUzE6Agjkf88BdT+BJbAwrE/CzWdPA9ZGZBqTODIX5akI76bRpA4btFpK1lkGlKMGLP
         70LI0/F0EfBWYKe0M/cmTwCf5IlTX4T6RKVmd4y3pMgPlJzVWSgm0esrkJSVusRvAVdO
         wt0dFGD9babfms6DrG+QybUf0YHEILV7vXM+ihMYtxLq/ZmT0mUXw2JaiCXzpgNZe9R+
         XlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=d0V6V02YDwePwW8CyIzqlzEZIjOOvufvHwiqqcZr0v4=;
        b=O3SCYPJNW9Kw9XXahQ83tRr4Vl78FgayOdiMo/xUmjJPipz/p1bHTGR6UvgvAkrUA7
         ZEOHChaTwX/3idqQEj0TzgPW3Vi5Il+pbuLq5URP0WvsUvnIhiieHwlX//brtCOq6PAF
         5/SmE5C6PyJe0LN9AnKqBVn4DUSk6N+55mHF6W0bAEP7oVARstpUGsOJxGq12cKBi3ui
         fYXrkW7bFh2v2H90eab7/N9ObnPvJlP67zxC6LvQfOZOCsGz0Mq5WnqZG6iwTdRQYDP+
         O/lCFJFih4Y1dPe0hIx2/wtOROHYu0umencOfy+yol3WR7QOCoV7s2sPIcIeLQA8A6+r
         lo5A==
X-Gm-Message-State: AOAM531yJe2LsTTjfItI6sQKsBbjhRtEbZ9x89Q2RueBQo1kKwXsB6rD
        LqJpoxmZSGtEsef6IkWDV+M=
X-Google-Smtp-Source: ABdhPJxmeUo29fYhwesUz/4K0U6W4SL1tqF4cln7bK1kWkGWsiFHuyRMGSk0EiuYy9gv0f4ovNit1g==
X-Received: by 2002:a9d:6e7:: with SMTP id 94mr3620033otx.366.1622134508006;
        Thu, 27 May 2021 09:55:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e6sm581636otr.53.2021.05.27.09.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 09:55:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 27 May 2021 09:55:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        nicolas.ferre@microchip.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: sama5d4_wdt: add support for sama7g5-wdt
Message-ID: <20210527165506.GA1294623@roeck-us.net>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
 <20210527100120.266796-2-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527100120.266796-2-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 27, 2021 at 01:01:19PM +0300, Eugen Hristev wrote:
> Add support for compatible sama7g5-wdt.
> The sama7g5 wdt is the same hardware block as on sam9x60.
> Adapt the driver to use the sam9x60/sama7g5 variant if either
> of the two compatibles are selected (sam9x60-wdt/sama7g5-wdt).
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sama5d4_wdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index e5d11d6a2600..ec20ad4e534f 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -268,8 +268,10 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  	wdd->min_timeout = MIN_WDT_TIMEOUT;
>  	wdd->max_timeout = MAX_WDT_TIMEOUT;
>  	wdt->last_ping = jiffies;
> -	wdt->sam9x60_support = of_device_is_compatible(dev->of_node,
> -						       "microchip,sam9x60-wdt");
> +
> +	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
> +	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
> +		wdt->sam9x60_support = true;
>  
>  	watchdog_set_drvdata(wdd, wdt);
>  
> @@ -329,6 +331,10 @@ static const struct of_device_id sama5d4_wdt_of_match[] = {
>  	{
>  		.compatible = "microchip,sam9x60-wdt",
>  	},
> +	{
> +		.compatible = "microchip,sama7g5-wdt",
> +	},
> +
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
> -- 
> 2.25.1
> 
