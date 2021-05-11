Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C143C37A7C2
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 15:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhEKNg1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 09:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhEKNgY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 09:36:24 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF30C061574;
        Tue, 11 May 2021 06:35:17 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso17490635otg.9;
        Tue, 11 May 2021 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h6fK7BnZuy9PHn9xxf/wsp5uxAeJb4ALs9dipuADBFY=;
        b=Cz7NhXEz5zhBwoP3xMiPki1O5IHCH/QOv9iq5NkHhSZGwU22h0zkyUoSP32uvRA5q4
         bvtY6jU9MiNAASgEcvFZ3jUs3Cg75n9sTzuQtDLcB6yhcKdGbvCxA5lPdpzoPPDyehyR
         Fy1vQZ1iX5VOMI3J3tvswpgfoIEVQ8l0ktX5r/eXvKuuryOSqPxAJEKtL0TYrs2YsZy7
         DmlNBPp7C8ArOsAmsbdf7TDyYJmpxmW2cR2R6KxbK9njIGXfzh/qqpFjoFmqOA/Vd0bv
         d9KIa/8OMWmlscb9Op/9lyVtIbFQnVBCK7yZvjMQQ50Yglkc4msczITaXoTUSEpa4QbV
         W13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h6fK7BnZuy9PHn9xxf/wsp5uxAeJb4ALs9dipuADBFY=;
        b=BLGX/LK1sYQYh1dftkE4j64f5yfVPdikNdnF0CQ/BNivsz5mXDvUZrjVzy7qkZ5n3g
         X0D8Eob8XSO3EYVC+y3W70WeR4YV4DmSdcSdTeAqoK+ELPJ4mp2AhdpETABqqjKwROgq
         7Kp3IrCWANawuw79XLsIb8gYpVlslOl3AZuFj1EJsqG6YOP0b9hmDBRovcVVBf+6OFZD
         eWZ9WFCSElyRKX8JHOBC2kEljQBqhUGlK66/oVgpQUcxxuPKfXBOUiPBo9YY+X6p7OYT
         EFA0eehYaJ19sWrJidvELgS9w8MQVBjiT4Pxci9Kzyyksaclg+DVkByBlpIEDctxQw6G
         aUbg==
X-Gm-Message-State: AOAM5339GkUG/GPWvxzISq3D/uvJqdC8s8GUxivp6WqCNhAXn9HDS4vW
        EWVKp7qWr4E9u5aqnffdSbINGdk8j8U=
X-Google-Smtp-Source: ABdhPJzZsguJjl3as/RigM4yjHDbwp+sJugUyMWZjcnqsJFWf1mf+ZNxwpRtnIJXLgKLbQR3QrkF/w==
X-Received: by 2002:a05:6830:1605:: with SMTP id g5mr25516254otr.22.1620740116730;
        Tue, 11 May 2021 06:35:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v79sm1567350oia.14.2021.05.11.06.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 06:35:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
To:     Juerg Haefliger <juerg.haefliger@canonical.com>,
        wim@linux-watchdog.org, joel@jms.id.au,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc:     andrew@aj.id.au, linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
References: <20210511061812.480172-1-juergh@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <dbb5b8ea-a62d-2d69-231f-06cc87551f5a@roeck-us.net>
Date:   Tue, 11 May 2021 06:35:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511061812.480172-1-juergh@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/21 11:18 PM, Juerg Haefliger wrote:
> Convert sprintf() in sysfs "show" functions to sysfs_emit() and
> sysfs_emit_at() in order to check for buffer overruns in sysfs outputs.
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/aspeed_wdt.c          |  4 ++--
>   drivers/watchdog/watchdog_dev.c        | 19 ++++++++++---------
>   drivers/watchdog/watchdog_pretimeout.c |  4 ++--
>   drivers/watchdog/ziirave_wdt.c         | 12 +++++++-----
>   4 files changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 7e00960651fa..933998e5a9de 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -175,8 +175,8 @@ static ssize_t access_cs0_show(struct device *dev,
>   	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
>   	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
>   
> -	return sprintf(buf, "%u\n",
> -		      !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
> +	return sysfs_emit(buf, "%u\n",
> +			  !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
>   }
>   
>   static ssize_t access_cs0_store(struct device *dev,
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a63110..fe68a97973a5 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -451,7 +451,8 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
> +	return sysfs_emit(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT,
> +						  &wdd->status));
>   }
>   
>   static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
> @@ -485,7 +486,7 @@ static ssize_t status_show(struct device *dev, struct device_attribute *attr,
>   	status = watchdog_get_status(wdd);
>   	mutex_unlock(&wd_data->lock);
>   
> -	return sprintf(buf, "0x%x\n", status);
> +	return sysfs_emit(buf, "0x%x\n", status);
>   }
>   static DEVICE_ATTR_RO(status);
>   
> @@ -494,7 +495,7 @@ static ssize_t bootstatus_show(struct device *dev,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%u\n", wdd->bootstatus);
> +	return sysfs_emit(buf, "%u\n", wdd->bootstatus);
>   }
>   static DEVICE_ATTR_RO(bootstatus);
>   
> @@ -510,7 +511,7 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
>   	status = watchdog_get_timeleft(wdd, &val);
>   	mutex_unlock(&wd_data->lock);
>   	if (!status)
> -		status = sprintf(buf, "%u\n", val);
> +		status = sysfs_emit(buf, "%u\n", val);
>   
>   	return status;
>   }
> @@ -521,7 +522,7 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%u\n", wdd->timeout);
> +	return sysfs_emit(buf, "%u\n", wdd->timeout);
>   }
>   static DEVICE_ATTR_RO(timeout);
>   
> @@ -530,7 +531,7 @@ static ssize_t pretimeout_show(struct device *dev,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%u\n", wdd->pretimeout);
> +	return sysfs_emit(buf, "%u\n", wdd->pretimeout);
>   }
>   static DEVICE_ATTR_RO(pretimeout);
>   
> @@ -539,7 +540,7 @@ static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
>   {
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
> -	return sprintf(buf, "%s\n", wdd->info->identity);
> +	return sysfs_emit(buf, "%s\n", wdd->info->identity);
>   }
>   static DEVICE_ATTR_RO(identity);
>   
> @@ -549,9 +550,9 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
>   	struct watchdog_device *wdd = dev_get_drvdata(dev);
>   
>   	if (watchdog_active(wdd))
> -		return sprintf(buf, "active\n");
> +		return sysfs_emit(buf, "active\n");
>   
> -	return sprintf(buf, "inactive\n");
> +	return sysfs_emit(buf, "inactive\n");
>   }
>   static DEVICE_ATTR_RO(state);
>   
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index 01ca84be240f..7f257c3485cd 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -55,7 +55,7 @@ int watchdog_pretimeout_available_governors_get(char *buf)
>   	mutex_lock(&governor_lock);
>   
>   	list_for_each_entry(priv, &governor_list, entry)
> -		count += sprintf(buf + count, "%s\n", priv->gov->name);
> +		count += sysfs_emit_at(buf, count, "%s\n", priv->gov->name);
>   
>   	mutex_unlock(&governor_lock);
>   
> @@ -68,7 +68,7 @@ int watchdog_pretimeout_governor_get(struct watchdog_device *wdd, char *buf)
>   
>   	spin_lock_irq(&pretimeout_lock);
>   	if (wdd->gov)
> -		count = sprintf(buf, "%s\n", wdd->gov->name);
> +		count = sysfs_emit(buf, "%s\n", wdd->gov->name);
>   	spin_unlock_irq(&pretimeout_lock);
>   
>   	return count;
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 4297280807ca..6c9414d09684 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -445,8 +445,9 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
> -		      w_priv->firmware_rev.minor);
> +	ret = sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
> +			 w_priv->firmware_rev.major,
> +			 w_priv->firmware_rev.minor);
>   
>   	mutex_unlock(&w_priv->sysfs_mutex);
>   
> @@ -468,8 +469,9 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
> -		      w_priv->bootloader_rev.minor);
> +	ret = sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
> +			 w_priv->bootloader_rev.major,
> +			 w_priv->bootloader_rev.minor);
>   
>   	mutex_unlock(&w_priv->sysfs_mutex);
>   
> @@ -491,7 +493,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
> +	ret = sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
>   
>   	mutex_unlock(&w_priv->sysfs_mutex);
>   
> 

