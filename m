Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0553DB275
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 06:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhG3ErV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 00:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhG3ErV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 00:47:21 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BC5C061765;
        Thu, 29 Jul 2021 21:47:15 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id x15so11475544oic.9;
        Thu, 29 Jul 2021 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y7ZpOvIt7dv/sT3oUB6j+2TGcOL+AesItuKdAylARmM=;
        b=M0GoLMOhouF+COHwbJRh2Pbyyxf8xSDbFIwkS9zgQSCr8itlPtLotYA2hsSkU6YiV0
         4PB7PeJCbO8yZD/yNEvdsxCcz34fb5V0vrx/j9gpsrKPkhZqHpNApEzoZQi2JcIo0sNR
         +Xbc4fepUrXHKHubRvasUQjLVhkQ0NgL22cnk7YT6o9YJbJOOqDOi4eb189Ztu6r3sqb
         SfVVxtO0jOwk2s8A2JOGJYAX1xg+3NQZw4xMWtQtWpjfwkG73OHQzR0rMFG+4PVBviip
         cmebgvRcpcFwxirwES3xCOo8GCbK5TJxKTYkkgB5iwhAK8hQRSp0aUB3YpArDtaepkfe
         0w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Y7ZpOvIt7dv/sT3oUB6j+2TGcOL+AesItuKdAylARmM=;
        b=ite076N7ktgevN4ERfCfiGzXv4dypjz9w2PHH2tnzFyvDmdGdyLd2U3oQPbBnPmnr3
         86H1sknjip7HI7uPzGrf4ybOPULYIvD15IENELat/X3k7cg8j+TndlAvQvSQ6jn2k7n4
         qPB1HA3L92+lTu7sVJyG6xPvk2F9EPdcClPUukG7hxpN0dPJwYT12HpA/dGDhQPo1Fg5
         1yOCmb6eT9LOWzWxRniE3uAyrvLBMl5b/ZnZ9Fgc8HNAWFWfJLRkh9xvuKonvpEBJ12A
         tPM9LHfteN2XM0/Z2dGki7VitkN3rfXYlpWSAn1uCxMMNaVd35ypGQQUEGxup36hqejE
         cyow==
X-Gm-Message-State: AOAM532hVsYDb7wCd8ZOw6tzac/cDujDbt0Xm1iIyvxmBNuyLMcas74z
        AqRIxdQUd/0f+aWCXWDCOjI=
X-Google-Smtp-Source: ABdhPJzg7wjaigC6Amb+qywNvTHMKTpLuOLNO88X0yH4wrxQesdg6+s/BV5vrALnyQChQLO4080RDg==
X-Received: by 2002:a05:6808:198c:: with SMTP id bj12mr516545oib.71.1627620434839;
        Thu, 29 Jul 2021 21:47:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u7sm83374oop.11.2021.07.29.21.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 21:47:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 29 Jul 2021 21:47:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Artem Lapkin <email2tema@gmail.com>
Cc:     narmstrong@baylibre.com, wim@linux-watchdog.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH v4 2/3] watchdog: meson_gxbb_wdt: add timeout parameter
Message-ID: <20210730044713.GB2110311@roeck-us.net>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-3-art@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730041355.2810397-3-art@khadas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 30, 2021 at 12:13:54PM +0800, Artem Lapkin wrote:
> Add timeout module parameter
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---

<Formletter>  
Change log goes here. If it is missing, I won't know what changed.
That means I will have to dig out older patch versions to compare.
That costs time and would hold up both this patch as well as all other
patches which I still have to review.

For this reason, I will not review patches without change log.
</Formletter>

As before, the change log is small and recent enough that I remember,
so you are lucky.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

>  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5aebc3a09652..945f5e65db57 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>  		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +static unsigned int timeout;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>  struct meson_gxbb_wdt {
>  	void __iomem *reg_base;
>  	struct watchdog_device wdt_dev;
> @@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>  	data->wdt_dev.min_timeout = 1;
>  	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_init_timeout(&data->wdt_dev, timeout, dev);
>  	watchdog_set_nowayout(&data->wdt_dev, nowayout);
>  	watchdog_set_drvdata(&data->wdt_dev, data);
>  
> -- 
> 2.25.1
> 
