Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718A3F18CA
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2019 15:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731665AbfKFOhu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 6 Nov 2019 09:37:50 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44554 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728591AbfKFOhu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 6 Nov 2019 09:37:50 -0500
Received: by mail-pf1-f195.google.com with SMTP id q26so19022749pfn.11;
        Wed, 06 Nov 2019 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4GtbHzfEJQwetljMPKkbij/HDqSxaiux6xu3uNhGPi8=;
        b=GsPOONdh1vcxEZVsEbw2vHXBUjqN9unYkZmOhmQ9oFbA0KWMYqFOjLEAS0SJmkLso8
         YBl+DP2C/XzRnsWHoiQTfnQ8+pXtzFHzVz9nev6gGr3TlpacgGtkNk/JV4vV8/hU9OoR
         MlIyervWhgGVY0w7DVM8WqYEunEBcriH0b4lo/k5KOiVzbzr3ykbsgVfHLzO3YW/2Q7a
         WGsprqjaq1DpAWtrclEV7JB5OmVIU3AxVLNUqLZoaR2avYbtM/1/cbpkrql0u7y+RCwv
         dgd/sEy+XLKZuTOovDIU0wISmwXazwkV1It/76nwMdFLWGCU14FrMw4WTxJAK8EMMnR5
         la0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4GtbHzfEJQwetljMPKkbij/HDqSxaiux6xu3uNhGPi8=;
        b=Kmb5Ncy0Bidr4VPr9wXvGl4DCA2fvYkMpuBQiUt1MbTYmdnO8GSvFoFh5nkjx381vj
         xMI0Jd+vYq7vJa/kuzJVrDAOKttLeb92AypWukmZfdTlSBRZL3jXgoO59ik2cH+TIbLp
         g3biCmFxp9oRzCBnRoIhSLVyThkHiRACt8prclCUV3FlUbn4KfC40SCWNh/qrBgBDRQD
         /YzXG7Gcw4RZXzwcjEuKms/VaiHQcOHD0Lq2PJs1dZZ/YYbBAx5EclrKLgzUIR3HmRN4
         2hJgXWjyYqawniA+Sb4BkJ3yiUgBU2DC43hxxJIvbPPUhuBnXggHYPIJGrNfrwllv2Xd
         bmug==
X-Gm-Message-State: APjAAAXILNwaAYBdK49H/Oksq5qFrJH4O3ZRXSVcXj0RT/VOV+ufRbei
        LYko1XaIZ1Ph0/O3dxas/mHTiLOz
X-Google-Smtp-Source: APXvYqzs3ClIr29484hTYxkqmcDTcYgwRVTqm7DpQZHeTaH3w2TpYXzssgZrYiF2X5shLGlmGjb2xw==
X-Received: by 2002:a63:f955:: with SMTP id q21mr2943707pgk.301.1573051068873;
        Wed, 06 Nov 2019 06:37:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h25sm22256855pfn.47.2019.11.06.06.37.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 06:37:48 -0800 (PST)
Subject: Re: [PATCH v2] watchdog: make nowayout sysfs file writable
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20191105123125.25985-1-linux@rasmusvillemoes.dk>
 <20191105205118.11359-1-linux@rasmusvillemoes.dk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <af10b22d-e609-a216-9cf1-ff564765da58@roeck-us.net>
Date:   Wed, 6 Nov 2019 06:37:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105205118.11359-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/5/19 12:51 PM, Rasmus Villemoes wrote:
> It can be useful to delay setting the nowayout feature for a watchdog
> device. Moreover, not every driver (notably gpio_wdt) implements a
> nowayout module parameter/otherwise respects CONFIG_WATCHDOG_NOWAYOUT,
> and modifying those drivers carries a risk of causing a regression for
> someone who has two watchdog devices, sets CONFIG_WATCHDOG_NOWAYOUT
> and somehow relies on the gpio_wdt driver being ignorant of
> that (i.e., allowing one to gracefully close a gpio_wdt but not the
> other watchdog in the system).
> 
> So instead, simply make the nowayout sysfs file writable. Obviously,
> setting nowayout is a one-way street.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2: drop redundant "current" variable and !!.
> 
>   .../ABI/testing/sysfs-class-watchdog          |  9 ++++++--
>   drivers/watchdog/watchdog_dev.c               | 21 ++++++++++++++++++-
>   2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
> index 675f9b537661..9860a8b2ba75 100644
> --- a/Documentation/ABI/testing/sysfs-class-watchdog
> +++ b/Documentation/ABI/testing/sysfs-class-watchdog
> @@ -17,8 +17,13 @@ What:		/sys/class/watchdog/watchdogn/nowayout
>   Date:		August 2015
>   Contact:	Wim Van Sebroeck <wim@iguana.be>
>   Description:
> -		It is a read only file. While reading, it gives '1' if that
> -		device supports nowayout feature else, it gives '0'.
> +		It is a read/write file. While reading, it gives '1'
> +		if the device has the nowayout feature set, otherwise
> +		it gives '0'. Writing a '1' to the file enables the
> +		nowayout feature. Once set, the nowayout feature
> +		cannot be disabled, so writing a '0' either has no
> +		effect (if the feature was already disabled) or
> +		results in a permission error.
>   
>   What:		/sys/class/watchdog/watchdogn/state
>   Date:		August 2015
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index dbd2ad4c9294..d3bdcb144657 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -452,7 +452,26 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
>   
>   	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
>   }
> -static DEVICE_ATTR_RO(nowayout);
> +
> +static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t len)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = kstrtouint(buf, 0, &value);
> +	if (ret)
> +		return ret;
> +	if (value > 1)
> +		return -EINVAL;
> +	/* nowayout cannot be disabled once set */
> +	if (test_bit(WDOG_NO_WAY_OUT, &wdd->status) && !value)
> +		return -EPERM;
> +	watchdog_set_nowayout(wdd, value);
> +	return len;
> +}
> +static DEVICE_ATTR_RW(nowayout);
>   
>   static ssize_t status_show(struct device *dev, struct device_attribute *attr,
>   				char *buf)
> 

