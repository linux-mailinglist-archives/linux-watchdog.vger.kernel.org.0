Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7D0453FF6
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 06:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhKQFYs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 00:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhKQFYr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 00:24:47 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6418C061570;
        Tue, 16 Nov 2021 21:21:49 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id t23so3860545oiw.3;
        Tue, 16 Nov 2021 21:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bqNOr2tcjMGEh27YaG51I8jTVanWEeuncxzB9qiBcBs=;
        b=bl+IKYslLDCVHLv4sY58rETgjZyYSivbPHaVb5YuVLBH3xd/N1qr5SYwLP+v06AE6f
         syIIZwhV4mjmNlK2sApSFLjXs+ctX2T4HY8bkhFdljdQPlnFes1nuis6AQOQwIiBLmJB
         7ux6fi+0FFnGI10X5OAuCl3M6P4Yz289NL1Mge59h9Bad3J+mbJpu+Grl6OT7fX9snFu
         n4t4NFWjrKAcHma8xtmY56nHDn76Kf0sEbHIhUHrDyMwVSHEiKmekKzCMFWsugsSM6LZ
         j6SnvOFD0pQt91yTR0Pao7tbyRwxC5iCpflzP2tNLDUbJIhPnZe16guNUlzke8bIESsh
         MqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bqNOr2tcjMGEh27YaG51I8jTVanWEeuncxzB9qiBcBs=;
        b=x0TZaqr+gTucJaQPAMrnoXt9AzrkdbM7TJcQFu4AYlBMm1R8sKU2L2QCbeoDAZShxy
         aT9Vf8gs4EjlBX+60BbMzQwdV7lfw1QQCUuH6k7x4pOf91SmFoN6j2WAGSJu1Bx/dxWx
         9OUdObatBKJV5MQHDu1KwE+2R76dwxbYb2uSHQkVNMG7+7W5mF+9YrcHoVvjO99b1c5u
         GJgavMkYEyWsdM3166Mm9amq2wJY74Eg8wIxH0AlFOgee9Krch+8LRYdG5i0WJahX4bi
         7UD8Mxc8Zdlk/2ay00Dbog6PmN5qYHouNZP+Paq7ntv+BKYZfIg78GIdrDARDYPOKasp
         C2Jw==
X-Gm-Message-State: AOAM530AdYkmUTkoPYtzqEq8Ynmoevn8RKFqzn/vzj/AGhmbE+py6Ljq
        A/vrDFC56FDaJiXMP72Gvjo=
X-Google-Smtp-Source: ABdhPJyZzZnS6l7no0N3RdxSUIklHfaadp2OLTJVskClufO2YOsIfTJ7lpXEpo1Eer2g/smNFmW81w==
X-Received: by 2002:aca:d07:: with SMTP id 7mr11526403oin.92.1637126509331;
        Tue, 16 Nov 2021 21:21:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z14sm3977894otk.36.2021.11.16.21.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 21:21:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 16 Nov 2021 21:21:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Artem Lapkin <email2tema@gmail.com>
Cc:     narmstrong@baylibre.com, wim@linux-watchdog.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Message-ID: <20211117052147.GC215087@roeck-us.net>
References: <20211110022518.1676834-1-art@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110022518.1676834-1-art@khadas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 10, 2021 at 10:25:18AM +0800, Artem Lapkin wrote:
> Remove watchdog_stop_on_reboot()
> 
> The Meson platform still has some hardware drivers problems for some
> configurations which can freeze devices on shutdown/reboot.
> 
> Remove watchdog_stop_on_reboot() to catch this situation and ensure that
> the reboot happens anyway. Users who still want to stop the watchdog on
> reboot can still do so using the watchdog.stop_on_reboot=1 module
> parameter.
> 
> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5a9ca10fbcfa..3f86530c33b0 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -186,7 +186,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  
>  	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>  
> -	watchdog_stop_on_reboot(&data->wdt_dev);
>  	return devm_watchdog_register_device(dev, &data->wdt_dev);
>  }
>  
> -- 
> 2.25.1
> 
