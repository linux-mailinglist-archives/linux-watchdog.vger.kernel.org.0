Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5968C3DC007
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 22:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhG3UuA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 16:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhG3UuA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 16:50:00 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB106C06175F;
        Fri, 30 Jul 2021 13:49:54 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id y18so14942887oiv.3;
        Fri, 30 Jul 2021 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HIi93naNiyfUpRS4wrUtDUKNxAJrKkvwb1z4MM0cLOo=;
        b=FZBsXQY90co+fKBiKYbWzGf5yOvnmjX+NHsOJh349fckGe7VFk0Dhyc8QxcyrKA8pW
         92Q10NsoNNnKQ0Ubv/j3GxDFArQezHqpw+kHuB+yMJM8ZrMhimNaTfYbImgQj/fGfxd1
         u4cPUlvxWz4q+/DAneCZflSU3o4BHKCkzWdmK3Nm815cujAa0B42ZC9TjPZSDgdJ4xoq
         kFF4MXxuPlDy6toQnvm52A+1aLgcynUGhqYCRMmetGSG5jUaF9M31qbQdfSqnlfB4bUF
         subDZTcosDnWdpfUaA+yVBOZj3OC6+n8XwxjJi80tH9M90TcmehRTRBbKdgIGdj5dkc7
         Nbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HIi93naNiyfUpRS4wrUtDUKNxAJrKkvwb1z4MM0cLOo=;
        b=fYZQteZEBngLa+MnBgH4HdZEbaEr1D3z/0F4RNFEww2fSgqy4Omei0iKZw90dK2u1V
         ZcI9LnXTKpkqr1AO3BHuWwLUEWNOhvK//s4Xudz2G4e3dmXS9UcCmjxhatktQrW86Iuf
         Q1cUb/+R0Cl+mtH6hzWhKmC5/n/8DRznFofnnpY+XFxfH4i3p10GYhf9pj9I0xNL5AD8
         l4fcZ/vXe0+aMCGaLFVco4fiKBa6+HOTiZ32aFSmLz0UkDN5tKlBN1AnwY81bxfzgiFO
         LF2GQY0Poze1wZZP0rAcs0a/yOHazXMtnucbQ/jQn5O3TeUucJKjU0fPeO3hvwoqso71
         S15Q==
X-Gm-Message-State: AOAM530cGcAs1DwP8s1+oFJsrOQd65mtBDuW+s31EMaHeNot0ZsW/Srz
        x+jSoE915tKOjfgRJc2KPwE=
X-Google-Smtp-Source: ABdhPJzS5QZfjydYip9AAMB6tYhxXb7OggPWh2e4+LV5nIFzRtwxWwWjih95jTjjAhSPJJ6oP+TIQA==
X-Received: by 2002:a05:6808:683:: with SMTP id k3mr3222541oig.171.1627678194308;
        Fri, 30 Jul 2021 13:49:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e31sm483829ote.22.2021.07.30.13.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 13:49:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
References: <fe8cf65f-f949-9326-8f32-fda7134c8da6@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: Respect handle_boot_enabled when setting last
 last_hw_keepalive
Message-ID: <211cd54b-29b4-e58a-341b-beffc05cfe85@roeck-us.net>
Date:   Fri, 30 Jul 2021 13:49:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fe8cf65f-f949-9326-8f32-fda7134c8da6@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/30/21 12:39 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> We must not pet a running watchdog when handle_boot_enabled is off
> because this requests to only start doing that via userspace, not during
> probing.
> 

The scope of the changed function is quite limited. See the
definition of watchdog_set_last_hw_keepalive(). On top of that,
__watchdog_ping() does a bit more than just ping the watchdog,
and it only pings the watchdog in limited circumstances. On top of that,
the scope of handle_boot_enabled is different: If enabled, it tells
the watchdog core to keep pinging a watchdog until userspace opens
the device. This is about continuous pings, not about an initial one.
Given that, I'd rather have the watchdog subsystem issue an additional
ping than risking a regression.

The only driver calling watchdog_set_last_hw_keepalive() is rti_wdt.c.
Does this patch solve a specific problem observed with that watchdog ?

Guenter

> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>   drivers/watchdog/watchdog_dev.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 3bab32485273..3c93d00bb284 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1172,7 +1172,10 @@ int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
>   
>   	wd_data->last_hw_keepalive = ktime_sub(now, ms_to_ktime(last_ping_ms));
>   
> -	return __watchdog_ping(wdd);
> +	if (handle_boot_enabled)
> +		return __watchdog_ping(wdd);
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(watchdog_set_last_hw_keepalive);
>   
> 

