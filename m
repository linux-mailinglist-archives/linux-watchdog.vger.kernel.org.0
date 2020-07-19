Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C23122520B
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jul 2020 15:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgGSNy1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 Jul 2020 09:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSNy0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 Jul 2020 09:54:26 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46E8C0619D2;
        Sun, 19 Jul 2020 06:54:26 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l63so9050007pge.12;
        Sun, 19 Jul 2020 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3CzsjyjZQhFjPGGo53NfDrHBR7v2mLrGKgzuY2qbhO8=;
        b=Jay6ibvzDvHGKrdjfgX0Nzd1sOxpjj0gx3AFftAiltq0RVsID/tUrEfPEfpM2XPG83
         hCGZe8vmACiXXGuYtZzX8X1QQ/Vi7YBcSBHQbjkgRbU13kVv0RXnKaSY9LEnenc3pzAt
         46iCWB6RKm8G0fCqPUnJX5d3KcEpEzMMllFT9povlQc6fHiHIi5Bl+pSlVtXrg9xOvb2
         1be+C9NvCv6GmCuEysKnqBSheZja3VetUEcngcJotOZcLu06BfIAnaePGRUB+81ozepU
         /boCtsfQG5i/WhvpUVeoD/oIv+vTYDzrQkAgBRTV1eod3pdsolH+8/dKQ9Tg7zkum3zp
         Vvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3CzsjyjZQhFjPGGo53NfDrHBR7v2mLrGKgzuY2qbhO8=;
        b=iFajG6CMCROlHPOFMN6hq/aTxDscp8byR3HX/R31IS1XKx7t9Ny2Yualt+g/Oyzw71
         bhe3ISuvR3HNqAEJ6u7ZwNRwRBrlRBqwTdiio8j7eElMWI0WSfrWQIzTUCZ4n2a26tGz
         HntMOnNIV3nYuRgNce02CrWZIGDCNw7Xo3D+HPBN5bYmlwsUDu7aV9Zu/UFoFc2dBdL4
         dDraGHfB0VZiIWiAn8YLRn0sUl5DmRS1l1m/e6ws3q8YyAVbSP91xBOSnCszUjfVFxuA
         AafSVrmMX8cOj0e2hETcwOB0fTYKjS7KZEleTjoYFpWLXA1jaHmK3BpBwqJobAwESXUn
         5wJQ==
X-Gm-Message-State: AOAM5314j/3eQB6FRC229SMghKYpjunB/QQ1iRVj/hkcd3PYRz1ACPyM
        020Ap/YMmV14g2xhRQ0i5Dbj74rK
X-Google-Smtp-Source: ABdhPJxXxzuAFURPjst6ZfNy/BHjNSPduPzgEq2q7ZpUyi4UphFa+JB496X3e1eZbli3PjG/2QXzDA==
X-Received: by 2002:a62:1ccb:: with SMTP id c194mr15999065pfc.277.1595166866060;
        Sun, 19 Jul 2020 06:54:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z5sm13690395pfn.117.2020.07.19.06.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2020 06:54:25 -0700 (PDT)
Subject: Re: [PATCHv4 2/4] watchdog: add support for adjusting last known HW
 keepalive time
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jan.kiszka@siemens.com
References: <20200717132958.14304-1-t-kristo@ti.com>
 <20200717132958.14304-3-t-kristo@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <4dce870f-c125-359d-3101-0e31e7ba0421@roeck-us.net>
Date:   Sun, 19 Jul 2020 06:54:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717132958.14304-3-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/17/20 6:29 AM, Tero Kristo wrote:
> Certain watchdogs require the watchdog only to be pinged within a
> specific time window, pinging too early or too late cause the watchdog
> to fire. In cases where this sort of watchdog has been started before
> kernel comes up, we must adjust the watchdog keepalive window to match
> the actually running timer, so add a new driver API for this purpose.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/watchdog-kernel-api.rst          | 12 ++++++++
>  drivers/watchdog/watchdog_dev.c               | 30 +++++++++++++++++++
>  include/linux/watchdog.h                      |  2 ++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-kernel-api.rst b/Documentation/watchdog/watchdog-kernel-api.rst
> index 068a55ee0d4a..baf44e986b07 100644
> --- a/Documentation/watchdog/watchdog-kernel-api.rst
> +++ b/Documentation/watchdog/watchdog-kernel-api.rst
> @@ -336,3 +336,15 @@ an action is taken by a preconfigured pretimeout governor preassigned to
>  the watchdog device. If watchdog pretimeout governor framework is not
>  enabled, watchdog_notify_pretimeout() prints a notification message to
>  the kernel log buffer.
> +
> +To set the last known HW keepalive time for a watchdog, the following function
> +should be used::
> +
> +  int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
> +                                     unsigned int last_ping_ms)
> +
> +This function must be called immediately after watchdog registration. It
> +sets the last known hardware heartbeat to have happened last_ping_ms before
> +current time. Calling this is only needed if the watchdog is already running
> +when probe is called, and the watchdog can only be pinged after the
> +min_hw_heartbeat_ms time has passed from the last ping.
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index bc1cfa288553..e74a0c6811b5 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1138,6 +1138,36 @@ void watchdog_dev_unregister(struct watchdog_device *wdd)
>  	watchdog_cdev_unregister(wdd);
>  }
>  
> +/*
> + *	watchdog_set_last_hw_keepalive: set last HW keepalive time for watchdog
> + *	@wdd: watchdog device
> + *	@last_ping_ms: time since last HW heartbeat
> + *
> + *	Adjusts the last known HW keepalive time for a watchdog timer.
> + *	This is needed if the watchdog is already running when the probe
> + *	function is called, and it can't be pinged immediately. This
> + *	function must be called immediately after watchdog registration,
> + *	and min_hw_heartbeat_ms must be set for this to be useful.
> + */
> +int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
> +				   unsigned int last_ping_ms)
> +{
> +	struct watchdog_core_data *wd_data;
> +	ktime_t now;
> +
> +	if (!wdd)
> +		return -EINVAL;
> +
> +	wd_data = wdd->wd_data;
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

