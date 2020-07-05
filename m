Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C30214D42
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Jul 2020 16:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgGEO6E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Jul 2020 10:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgGEO6E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Jul 2020 10:58:04 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3387DC061794;
        Sun,  5 Jul 2020 07:58:04 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t15so1516428pjq.5;
        Sun, 05 Jul 2020 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B6/CZwdLxr6H8ujYUWoMtrCMefluk58574rLY2XQtFg=;
        b=f1IsVAhNxGPKw2WDguxnU9dW7OMxPEZgRvmIIZ5Of2KsumEzLqCkmp2132anzSdXSZ
         sevvxfGvISujMAw0W1tQOTieEVcZpVdKFgH8ZGKn/Oye8vkfQq6Qa7eJsF14QS1rPX+0
         Ieqv91T79BzplJHsc8W/bRDNoFObmytKMS78+oHfjWXdRj/WsCG4MIppizH1RSQy4VEb
         tZvC84jFlmUsGDCr/pLlAjzj361TS/kd+4Q6It0clwiPSakOZjT/oMkZF2PKemimFt/P
         XrPj/AHZUAiBTMa+BUZmKXVgQVDNpBhtmhW/y45SGa2XbabKCX0PHbzABoM6onOGZzIl
         spzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B6/CZwdLxr6H8ujYUWoMtrCMefluk58574rLY2XQtFg=;
        b=hHRtIg61cYSZlZYMkWl3pYoPjI5gcyrRXfYIea7L5WCcEzUAzfEDrl62SCLOxVovT0
         pCNfPMv5EGplfxCk0+lYbZJH4hRDGYvKkOnK34ugTEKhqjlAEVQWojng1k+S2vnpLveo
         oNd/eUlNeCeNmcoxArEvUVHyDVMYCfnAuHboRs5w9zwHL6UlN71oT2FW77yqxIaqT20r
         yvna9mWy8WVuNp6GjBR/pnqqEuhLUWNmppqfk9rx7yEc/ZTDnuPTFqGLhAcSCIQcw8Jn
         xcccriwz1pdf+btvOJY+FgyuvbBmbG9vlo+neQFT4tczDst8iPtH7AWVm6kYbu8z82ey
         wpMQ==
X-Gm-Message-State: AOAM532udJuQvj6kE+/MHXiI4khO+CTiD6NiRdGH640ONhEyUZHWcOL+
        4Ui00hVHCavoW5dunIAN41U=
X-Google-Smtp-Source: ABdhPJxawKs3ZVThXGNG3Vb/kc5717gwFAlkRD46on87/rvozPA+l1xoxkmHeZW/sFY8u03ssqmWGQ==
X-Received: by 2002:a17:90a:cf05:: with SMTP id h5mr1170688pju.219.1593961083672;
        Sun, 05 Jul 2020 07:58:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e191sm16421139pfh.42.2020.07.05.07.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 07:58:03 -0700 (PDT)
Subject: Re: [PATCHv2 2/5] watchdog: add support for adjusting last known HW
 keepalive time
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jan.kiszka@siemens.com
References: <20200703120406.7092-1-t-kristo@ti.com>
 <20200703120406.7092-3-t-kristo@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <faeebfbb-cb8c-e31e-50ef-af42e1b11e0e@roeck-us.net>
Date:   Sun, 5 Jul 2020 07:58:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703120406.7092-3-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/3/20 5:04 AM, Tero Kristo wrote:
> Certain watchdogs require the watchdog only to be pinged within a
> specific time window, pinging too early or too late cause the watchdog
> to fire. In cases where this sort of watchdog has been started before
> kernel comes up, we must adjust the watchdog keepalive window to match
> the actually running timer, so add a new driver API for this purpose.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/watchdog/watchdog_dev.c | 23 +++++++++++++++++++++++
>  include/linux/watchdog.h        |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index bc1cfa288553..5848551cf29d 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1138,6 +1138,29 @@ void watchdog_dev_unregister(struct watchdog_device *wdd)
>  	watchdog_cdev_unregister(wdd);
>  }
>  
> +/*
> + *	watchdog_set_last_hw_keepalive: set last HW keepalive time for watchdog
> + *
> + *	Adjusts the last known HW keepalive time for a watchdog timer.
> + *	This is needed in case where watchdog has been started before
> + *	kernel by someone like bootloader, and it can't be pinged

... needed if the watchdog is already running when the probe function
is called, and ...

> + *	immediately. This adjusts the watchdog ping period to match
> + *	the currently running timer.

It doesn't adjust the ping period.

> + */

last_ping_ms needs to be documented (the last heartbeat was last_ping_ms
milliseconds ago ?), both here and in Documentation/watchdog/watchdog-kernel-api.rst.
It needs to be documented that the function must be called immediately
after watchdog registration, and that min_hw_heartbeat_ms must
be set for it to be useful.

> +int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
> +				   unsigned int last_ping_ms)
> +{
> +	struct watchdog_core_data *wd_data = wdd->wd_data;

This needs a NULL check, in case it is called before watchdog driver
registration.

> +	ktime_t now;
> +
> +	now = ktime_get();
> +
> +	wd_data->last_hw_keepalive = ktime_sub(now, ms_to_ktime(last_ping_ms));
> +
> +	return __watchdog_ping(wdd);
> +}
> +EXPORT_SYMBOL_GPL(watchdog_set_last_hw_keepalive);
> +
>  /*
>   *	watchdog_dev_init: init dev part of watchdog core
>   *
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 1464ce6ffa31..9b19e6bb68b5 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -210,6 +210,8 @@ extern int watchdog_init_timeout(struct watchdog_device *wdd,
>  extern int watchdog_register_device(struct watchdog_device *);
>  extern void watchdog_unregister_device(struct watchdog_device *);
>  
> +int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
> +
>  /* devres register variant */
>  int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
>  
> 

