Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFB840FA33
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 16:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242786AbhIQOcs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 10:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243174AbhIQOcn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 10:32:43 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72783C061764
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 07:31:21 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id p2so14252364oif.1
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m766qPsvjFavz7iVJfkteg7JeDV8Yx0v5jn/PfoicFU=;
        b=h1uUFFyzLzG0rC1zrrfuZqu7DhNOZVv7jY5DTJi4zhI1BhH77RwF1M1JJitDNMbPTS
         ymED412BtiHeZpH3uTI9pgSy/PJOLkUcpXfFudkYUhi0RuPlU8YqKMV+kf74td6aey7D
         ckWfdFtg+n75+ecZt19E5jexTKjzkwTjbep/8qQKtAB9F1QBTy6stXHvjGtROsVUYF8M
         QnUYevOOdLK+DSlkySP1zOvyRklSbmmj5QoYXG8R0tMdKXKsirbWot56Vp8R+YCX1PK6
         Yf8ec1xqqDNNpuzqd3C9b8gkpZk83FqJ0US0QR1jfBIllbXxtymNME0Kt9LBpIRvNB0O
         nwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m766qPsvjFavz7iVJfkteg7JeDV8Yx0v5jn/PfoicFU=;
        b=lrXaAFqEem8UPJrziAHLfnMSA2h/QscSm4y+0j7hNZUNQVe7GIjGQemOFMyDn1VFgK
         0eGY+002cFBduNZAshnPfepI3zl1obc09GYNKwC7dWwxYuFnTdtJD6cZkyOPCXWfcjND
         d4ZCP7O9N8TPZFN9DcrU34PJO6r1wYMUvc8nwmR3v7hF95kVIo6VjJW+dHKVYgDbtR8D
         SWRhSdSt4Amx4KsG2GGd39Chtt4E0puumzw3iCUXLwah4b+PGW9TNy5A0hjXwEcQNGhc
         1fNE9E0s1EaFeonIuDuy6zVFEBZf3xE1RIPhcX6h1oN9Ygof8aU70qBqWFsPNHuBT+Q1
         JY2A==
X-Gm-Message-State: AOAM532/5HvqDIa50nvO2/c8NvY/O4AxL/bN/zIza7FC+O7ts6ZlbGtd
        iUK8pVs9a6vt2SS3LyPTl04S3nX/Qfs=
X-Google-Smtp-Source: ABdhPJwLJwly6pbriS70yX2jxXjspnXeInsWkXJzi1GKSakdEzasbpJUL+Jt0BsEMYt29rNtahq//w==
X-Received: by 2002:a05:6808:f0b:: with SMTP id m11mr13528210oiw.46.1631889080519;
        Fri, 17 Sep 2021 07:31:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p21sm1450599oip.28.2021.09.17.07.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 07:31:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Malin Jonsson <malin.jonsson@ericsson.com>, john.jacques@intel.com,
        linux-watchdog@vger.kernel.org
References: <20210917101533.9722-1-mika.westerberg@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Leave running if the watchdog core
 ping thread is enabled
Message-ID: <375dbb7a-d89c-def4-0283-606a7a33f6b6@roeck-us.net>
Date:   Fri, 17 Sep 2021 07:31:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917101533.9722-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/17/21 3:15 AM, Mika Westerberg wrote:
> The watchdog core can handle pinging of the watchdog before userspace
> gets control so we can take advantage of that in iTCO_wdt. This also
> allows users to disable the watchdog core ping thread by passing
> watchdog.handle_boot_enabled=0 in the kernel command line if needed.
> 
> To avoid any unexpected resets we keep the existing functionality of
> stopping the watchdog on probe if the watchdog core ping thread is not
> enabled in the Kconfig (CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=n).
> 

CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is enabled by default, and it should be
enabled for all normal use cases, so this is a bit misleading.

> Cc: Malin Jonsson <malin.jonsson@ericsson.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>   drivers/watchdog/iTCO_wdt.c | 42 ++++++++++++++++++++++++++++++-------
>   1 file changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 643c6c2d0b72..234494c03df3 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -430,6 +430,27 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
>   	return time_left;
>   }
>   
> +static bool iTCO_wdt_set_running(struct iTCO_wdt_private *p)
> +{
> +	/*
> +	 * If the watchdog core is enabled to handle pinging the
> +	 * watchdog before userspace takes control we can leave the
> +	 * hardware as is.
> +	 */
> +	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {

This is neither necessary nor appropriate. Just set the flag. The core
won't handle boot enabled if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=n
even if WDOG_HW_RUNNING is set.

CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not a driver configuration option.
It is a core option, and its description says:

" ... is to ping watchdog devices that were enabled before the driver has
  been loaded until control is taken over from userspace using the
  /dev/watchdog file."

This is not what is implemented here. Yes, there is a driver using
the option, but that hardware does not support the ability to detect
if the watchdog is running. That is not the case here.

If you want to have the ability to both keep the watchdog running or
to stop it at boot, you'll need to add a module option.

Guenter

> +		u16 val;
> +
> +		/* Bit 11: TCO Timer Halt -> 0 = The TCO timer is * enabled */
> +		val = inw(TCO1_CNT(p));
> +		if (!(val & BIT(11)))
> +			set_bit(WDOG_HW_RUNNING, &p->wddev.status);
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   /*
>    *	Kernel Interfaces
>    */
> @@ -572,15 +593,20 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>   	watchdog_set_drvdata(&p->wddev, p);
>   	platform_set_drvdata(pdev, p);
>   
> -	/* Make sure the watchdog is not running */
> -	iTCO_wdt_stop(&p->wddev);
> +	if (!iTCO_wdt_set_running(p)) {
> +		/* Make sure the watchdog is not running */
> +		iTCO_wdt_stop(&p->wddev);
>   
> -	/* Check that the heartbeat value is within it's range;
> -	   if not reset to the default */
> -	if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
> -		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
> -		dev_info(dev, "timeout value out of range, using %d\n",
> -			WATCHDOG_TIMEOUT);
> +		/*
> +		 * Check that the heartbeat value is within it's range;
> +		 * if not reset to the default.
> +		 */
> +		if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
> +			iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
> +			dev_info(p->wddev.parent,
> +				 "timeout value out of range, using %d\n",
> +				 WATCHDOG_TIMEOUT);
> +		}
>   	}
>   
>   	watchdog_stop_on_reboot(&p->wddev);
> 

