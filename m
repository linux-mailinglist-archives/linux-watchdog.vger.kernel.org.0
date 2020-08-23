Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0969C24EF58
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Aug 2020 21:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgHWTGb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Aug 2020 15:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgHWTGa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Aug 2020 15:06:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3B5C061573;
        Sun, 23 Aug 2020 12:06:30 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id nv17so3077252pjb.3;
        Sun, 23 Aug 2020 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cKM1KAukFRpkvdeOEh6YKqfrqEM/c5Xef+RIJUmVenk=;
        b=cjJFOScGvoxowBQKdHXZlpHjFNA8FGDbpCzP6B0/EBaO9EvkuSyna/Jk8HunPpSY6r
         p9dIQ8jfWzldmdF87S0h0C1P30tBhf7uiQbq8yuOs1q134Z9tbfLDTQc2U1hpGo2tShI
         01HJ/j4p5mA+PND96XvQirQrApmORlhTAbbtpupWkou2WEGfn5vjcLkjk3IKESu6ZcY3
         qp91Ms9m/rJNOOTC29kiApihSIKKYfOW7sOH1/e/e7x6vgLSPphyCUkSIOVRNona1aGm
         DIaZxRu/bMBItH3JOSrKiSGNwJZDZRNgX7/xybfM6xkY+lehP5L23r76vsST/+BGpXCF
         mSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cKM1KAukFRpkvdeOEh6YKqfrqEM/c5Xef+RIJUmVenk=;
        b=nYNUqnh5LoSA7jQeeDqiRRUec8VC8ozMg8wivkARekK1PfsV3n//WKlT2+ri1pCd1s
         ZpCkX7yU3ylNGgEOuxhkI5pYDmdJyu3M/J/TF/POFl3z3oG8BjKd9aYBk+QOAaZ+QU3+
         MgqC5yuOk0uE2nPKRfxwI65lhRnw540nj9liB9fzFjHH4L9gNKruiFe4r2AxY1ZWyWyZ
         kBSHnmbZjwnJEmWMg747qU6RdXtaC0kyQ+xqWY46wchHQrk1cirrLvamcjIzzLGBY97B
         IED1YmYzKxgHc/LLkcEjZBHH8v3WOFo2BnCshGJQ4OJ1ycQ5+gNu/MP1DlA0BmP7GEou
         8hHw==
X-Gm-Message-State: AOAM5335QahI50TY32BzeUvVv3ajCwIS8pYlPThL36N6YlCqxuBsdVl3
        fZYQ5tvQniOgSPl22if7kX2rMv1lVrs=
X-Google-Smtp-Source: ABdhPJyL9BidSgMBLwtFbKwbgorap8vpMtGOlUbFOKEzGXBqDoDNWhSC21Mwfk1Hbs8CYZHkFSUuNg==
X-Received: by 2002:a17:90a:b386:: with SMTP id e6mr1836057pjr.57.1598209589351;
        Sun, 23 Aug 2020 12:06:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1sm8118770pgh.47.2020.08.23.12.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2020 12:06:28 -0700 (PDT)
Subject: Re: [PATCH] watchdog: Fix double-free in watchdog_cdev_register
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Krzysztof Sobota <krzysztof.sobota@nokia.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200823071338.15209-1-dinghao.liu@zju.edu.cn>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <03f9c262-3174-21e4-2211-df9fb2097457@roeck-us.net>
Date:   Sun, 23 Aug 2020 12:06:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823071338.15209-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/23/20 12:13 AM, Dinghao Liu wrote:
> When misc_register() fails, wd_data will be released by the
> release callback function watchdog_core_data_release(), so
> we don't need to free it again. But when watchdog_kworker is
> NULL, we should free wd_data to prevent memleak.
> 
> Fixes: cb36e29bb0e4b ("watchdog: initialize device before misc_register")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/watchdog/watchdog_dev.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 6798addabd5a..8ee78e26feb1 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -994,8 +994,10 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>  	wd_data->wdd = wdd;
>  	wdd->wd_data = wd_data;
>  
> -	if (IS_ERR_OR_NULL(watchdog_kworker))
> +	if (IS_ERR_OR_NULL(watchdog_kworker)) {
> +		kfree(wd_data);

This should be a separate patch, with

Fixes: 664a39236e718 ("watchdog: Introduce hardware maximum heartbeat in watchdog core")

>  		return -ENODEV;
> +	}
>  
>  	device_initialize(&wd_data->dev);
>  	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> @@ -1021,7 +1023,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>  				pr_err("%s: a legacy watchdog module is probably present.\n",
>  					wdd->info->identity);
>  			old_wd_data = NULL;
> -			kfree(wd_data);

Are you sure about this ? put_device() isn't called on &wd_data->dev
(unlike the code further below). How do you trigger the double free,
or, in other words, how is watchdog_core_data_release() ever called
in this code path ?

device_initialize() says:
	NOTE: Use put_device() to give up your reference instead of freeing
	@dev directly once you have called this function.
so it looks like put_device() should be called instead of kfree().

Thanks,
Guenter

>  			return err;
>  		}
>  	}
> 

