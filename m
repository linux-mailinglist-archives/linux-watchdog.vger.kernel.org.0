Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034EA3DA640
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 16:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237018AbhG2OX4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 10:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234135AbhG2OXz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 10:23:55 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1015C061765;
        Thu, 29 Jul 2021 07:23:51 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 21so8641150oin.8;
        Thu, 29 Jul 2021 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fiD6HbW+e+TGDOFNYS8Y96H7vqs9aDLEoWQKG8o0zGQ=;
        b=MgxKN/d5WX76jENbSN9xRgPKAbzAdtl74HziXPAq8oivgiZCzHmEtvZrPQ1W2yFn1C
         Kr/0b6NTyQHejpNslrDBIMYgdqL0VpgPocswtIxI9t+Mly1GI4u2mpY40nS5/514B5Sh
         4iNOnYZGShmoF4daj3Foaq8BmgimQi+rhC8vrDvu6EdyQga6vI/E6HtrShzXVwo4ba83
         4BZhUHq15lhAPXZOE9lZiX/9W6JCgykTpCAH1Ph//b/ycEDos8Q3LToecwDH6XvZB1qh
         5Gl7ByzgigfoiAMRY33ClmDJWiO5/6SlgLrPHEAYcjwuXCgwloKK0Jl5S/IxAMyREBaZ
         pTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fiD6HbW+e+TGDOFNYS8Y96H7vqs9aDLEoWQKG8o0zGQ=;
        b=pual2hDcxCdnGqUggUA/22RvNxzRUUW6C2ynw23lTYu3ltkroAlNWdu9sI35pvN727
         HctWB5sYyQptHohMeC45jRUdjaqieqwXTiipl7EMQTZ30k5sRW0CNBQSzKTXsvXqUSuF
         rJrec/TZMId+0TtcLyXI2ba29OelgsszwJ5rZLrsiowXN97VpAGBxCa3lVCHa8yc8/dP
         Ew/7tYRlLP4UILZELhzBkRDeOnax5krwiwoAU2b+NShHc5tNGK8DvTISAzbLO7rRBj8n
         w/18mJptMS3HpLBEywZmDaznx2iakMeOhGtPm72rgsU2sNK1khzrriX6Iw/V2V7UwUO1
         rzcw==
X-Gm-Message-State: AOAM530px2iLS9rMYrG8euYPARr0AHo0N6clVd1IjV3J9xG1dHQ31mXQ
        NnfQvdafDBipiR7Jia27qvI=
X-Google-Smtp-Source: ABdhPJxBYqe33kHLvYIGhIXmLU1VTcuoRKIbNBrIBWkB4ze2skumAOv3JCVZcFCVLopzeiS464sIVQ==
X-Received: by 2002:a05:6808:1281:: with SMTP id a1mr1308106oiw.123.1627568631116;
        Thu, 29 Jul 2021 07:23:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i205sm228201oif.14.2021.07.29.07.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 07:23:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210729072308.1908904-1-art@khadas.com>
 <20210729072308.1908904-4-art@khadas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Message-ID: <024cd37a-39a0-d43b-9a2f-cec43eb3b9e8@roeck-us.net>
Date:   Thu, 29 Jul 2021 07:23:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729072308.1908904-4-art@khadas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/21 12:23 AM, Artem Lapkin wrote:
> Remove watchdog_stop_on_reboot()
> 

This warrants a much longer explanation to even be considered.
Your explanation/reasoning needs to be here. Others won't have
the benefit of reading the summary e-mail, even more so since
you declined to number and sequence the series.

Personally' I don't find it acceptable, but I'll be happy to
listen to input from others. Such changes should be based on
real problems, not on personal opinions. If we accept this patch,
someone else might come in later reverting it with the personal
opinion that some reboots take longer than the watchdog timeout.

Guenter

> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 3f3866878..cafc6cdc0 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   
>   	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>   
> -	watchdog_stop_on_reboot(&data->wdt_dev);
>   	return devm_watchdog_register_device(dev, &data->wdt_dev);
>   }
>   
> 

