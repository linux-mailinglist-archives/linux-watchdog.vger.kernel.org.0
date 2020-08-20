Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CFB24C6A9
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Aug 2020 22:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgHTUOW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Aug 2020 16:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgHTUOU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Aug 2020 16:14:20 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E131C061385;
        Thu, 20 Aug 2020 13:14:18 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bh1so1428743plb.12;
        Thu, 20 Aug 2020 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H5L27zf4P6SheNXckuyDWH+nD0z6n3zy3Qk7L/fAGpU=;
        b=MR8aElz8PdCJ7uST0lKGECpno+C0nfBYRRZwPgd7US8Cj4+5UkAMXi8cr1agnsy4VU
         oa1EbZI+RJVramO8KNyQgstkTvg5sba78HcNAhjWOkeR1P4xMXb/jnKGRz/6SY6KXzUN
         mAHkYgf4S8YNLqppUp64lOFmDjlaITI1Wqp+UzaxVp0F3014FaipAQlEKQKxn09ox+Km
         YeYo453ZK6SEjhyQ9DY85LmXKGDEl5shyMLgXWhOtIuOmFZ0tKe+K7ZbRs9D4dUR5AmN
         TYXvygqr/lxM+3O4nyjJQJhii0OGbG9IC7w8UWmU8mLuQgEHfWkcBgAigD6gEyb0jssm
         xD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=H5L27zf4P6SheNXckuyDWH+nD0z6n3zy3Qk7L/fAGpU=;
        b=uRGh1VP10taGp2RknVTiPpGLJ1NoXkcUmyHlaDndN1Q65Xq96OtQxdAexMzqUnLikP
         E6gnxfm7oUIbmppndDbz0ve4JPWcseWgb4VqKGyxkn3d031//kOlsQtyWgtptCvsfhwk
         9Ky1KhxyH5HVGocyy1YsOv5Zdf7rv3bxKYhrtpTHS5/lg6QAMhnKPPCdL2om2PA/7M/z
         V96Ac6dYlIvPeEO+BTHRt+LIMDuodnU/pUc1B0MmYPKopxXvlgvu3BBaUFRinas7Ef0a
         k5Epjg/A9tj5GeaDTB8qTKuBxDmiM1Wduv5AM1RMr8JeekasVgfX+shMUljhsNPeHv6I
         yyjg==
X-Gm-Message-State: AOAM532Cu84XHEnMPLnOtxi+TH/uVBPRHLx1O2RPkJwxvHp0MilwXuDi
        N1OcBqEBNOnWka61cXkBhx1cajUFfFc=
X-Google-Smtp-Source: ABdhPJwqLGsUlU2TU8VUvuJMCQWQzOiheLv7U6G1Q7/4+bDMXf7HP+Cguin8vpMR8Q7yT1KSs6TbAQ==
X-Received: by 2002:a17:902:b681:: with SMTP id c1mr55585pls.214.1597954458267;
        Thu, 20 Aug 2020 13:14:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z9sm3631585pfn.59.2020.08.20.13.14.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 13:14:17 -0700 (PDT)
Date:   Thu, 20 Aug 2020 13:14:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wang Wensheng <wangwensheng4@huawei.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux-kernel@vger.kernel.org, rui.xiang@huawei.com,
        guohanjun@huawei.com, lizefan@huawei.com
Subject: Re: [PATCH] watchdog: Add interface to config timeout and pretimeout
 in sysfs
Message-ID: <20200820201416.GK84616@roeck-us.net>
References: <20200820023858.10873-1-wangwensheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820023858.10873-1-wangwensheng4@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 20, 2020 at 02:38:58AM +0000, Wang Wensheng wrote:
> Those interfaces exist already in sysfs of watchdog driver core, but
> they are readonly. This patch add write hook so we can config timeout
> and pretimeout by writing those files.
> 
> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>

This is problematic. For example, if a user changes the timeout on
a running watchdog, the application pinging the watchdog would not
know about it. Set the timeout to 1 second using the sysfs attribute,
and the system will trigger the watchdog almost immediately.

The only somewhat "safe" means to use this attribute would be to set
the timeout before a userspace application opens the watchdog device.
But then this application could just as well update the timeout
after opening the device. What is the use case ?

Thanks,
Guenter

> ---
>  drivers/watchdog/watchdog_dev.c | 48 +++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 10b2090f3e5e..bb8ddc71d4ea 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -485,7 +485,29 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>  
>  	return sprintf(buf, "%u\n", wdd->timeout);
>  }
> -static DEVICE_ATTR_RO(timeout);
> +
> +static ssize_t timeout_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	int ret;
> +	unsigned int val;
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +
> +	ret = kstrtouint(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&wd_data->lock);
> +	ret = watchdog_set_timeout(wdd, val);
> +	mutex_unlock(&wd_data->lock);
> +
> +	if (!ret)
> +		ret = count;
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RW(timeout);
>  
>  static ssize_t pretimeout_show(struct device *dev,
>  			       struct device_attribute *attr, char *buf)
> @@ -494,7 +516,29 @@ static ssize_t pretimeout_show(struct device *dev,
>  
>  	return sprintf(buf, "%u\n", wdd->pretimeout);
>  }
> -static DEVICE_ATTR_RO(pretimeout);
> +
> +static ssize_t pretimeout_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	int ret;
> +	unsigned int val;
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +
> +	ret = kstrtouint(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&wd_data->lock);
> +	ret = watchdog_set_pretimeout(wdd, val);
> +	mutex_unlock(&wd_data->lock);
> +
> +	if (!ret)
> +		ret = count;
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RW(pretimeout);
>  
>  static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
>  				char *buf)
> -- 
> 2.25.0
> 
