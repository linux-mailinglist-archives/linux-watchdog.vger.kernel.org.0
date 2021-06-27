Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1A53B5403
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 17:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhF0PfJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 11:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhF0PfI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 11:35:08 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B0EC061574;
        Sun, 27 Jun 2021 08:32:43 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id h9so18582354oih.4;
        Sun, 27 Jun 2021 08:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=59hequDqZ0EZ8M0y3xtHrgqpE3wu/Nxv4aJHXZdBkE0=;
        b=ZmKffNrAS6Am31vp81Nr5z9YoX5qBKEMg0qjI07jV5SmAO8U7KKIJUw55pGIwY4487
         IT5vy3B4xijfN14HGhix6A1Tv/m5hRbnDdRu7INCP4PC9aECh/xqad+ZYow4vrlwQIyR
         C0ZAsqsubBIPWuqsLNkgYQgs0jBDw2oLGs0a97PkOi+zzXf3Nwt0m7UqSDABo+BFUIlY
         6k1xnaE3+Sah7ZVVtPoNfqXcfYwY49U70I31Kcwm2Hv8Clct0iTtMSrB20tS+PbTj9/J
         WOU+hbmceS/gtADYoCfVZ672XDyrBSpJcu4nDfl6yQTZZQZ9Ix/5jHwMNQcYsCSBxNZA
         U/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=59hequDqZ0EZ8M0y3xtHrgqpE3wu/Nxv4aJHXZdBkE0=;
        b=NHWIbbtyvugEBHVSBRDt1c2rZOMnNiXxh9LSJalm3FA2t9CrWMCldIfr9jmw1YsLdt
         ePIpgGy2sHwoimWg54+Dhx5qKaf7XeWyUue52v62Lay95ISrcihkQ+n6HAJ4WQhFHPRJ
         RA7SglyDRdgA62Wny2bd3HvN4Ot5iU42qUBoGOXG243zD677+Bg6aDU8oduHIPHdDfgq
         UfrOuJp/wAMF5snmMC9uksBUt7aHEo8bRI0ItMgZ/oLuVe0aDowo+mA+3t0DrdfdRnFr
         h3W0b4Q72NSZPypylpmJ8T6EsA77o9Ifbm3n1LxQjYIajU/bESNtfZs7hHhIIc+ZK7/S
         UtDg==
X-Gm-Message-State: AOAM532VPSOx6Yawmp91u4vPBibRYe0a7NfgJAcn6mY2VH9etq1Ne63O
        gQWym8j088ybEi0WZRjb0n4=
X-Google-Smtp-Source: ABdhPJz/m9LPxwXU9P6BNkse7ot38gJ9WqZx+oTpUKJzoj/34NxviIaZLf8P2yg/7O06hph6WNM8ug==
X-Received: by 2002:aca:a812:: with SMTP id r18mr7474599oie.35.1624807963007;
        Sun, 27 Jun 2021 08:32:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w132sm2605164oig.38.2021.06.27.08.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 08:32:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/5] watchdog: meson_gxbb_wdt: add timeout module param
To:     Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
References: <20210623024429.1346349-1-art@khadas.com>
 <20210623024429.1346349-3-art@khadas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f4bac702-9121-fc84-e138-27f3f662f443@roeck-us.net>
Date:   Sun, 27 Jun 2021 08:32:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623024429.1346349-3-art@khadas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/22/21 7:44 PM, Artem Lapkin wrote:
> Added timeout module param same as in other modules
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 3f86530c33b0..ecd1fc6f48ba 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -29,6 +29,11 @@
>   #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
>   #define GXBB_WDT_TCNT_CNT_SHIFT			16
>   
> +static unsigned int timeout = DEFAULT_TIMEOUT;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>   struct meson_gxbb_wdt {
>   	void __iomem *reg_base;
>   	struct watchdog_device wdt_dev;
> @@ -174,7 +179,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>   	data->wdt_dev.ops = &meson_gxbb_wdt_ops;
>   	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>   	data->wdt_dev.min_timeout = 1;
> -	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	data->wdt_dev.timeout = timeout;

This is wrong. A timeout module parameter should be set with a call to
watchdog_init_timeout(), the initial value should be 0, and data->wdt_dev.timeout
should be kept as-is. This ensures that the module parameter is validated.

Guenter

>   	watchdog_set_drvdata(&data->wdt_dev, data);
>   
>   	/* Setup with 1ms timebase */
> 

