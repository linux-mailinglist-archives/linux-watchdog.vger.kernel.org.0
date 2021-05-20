Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9983538B9DA
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 May 2021 00:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhETXAD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 19:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbhETXAD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 19:00:03 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E1EC061574;
        Thu, 20 May 2021 15:58:40 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id s20-20020a4ae9940000b02902072d5df239so4169783ood.2;
        Thu, 20 May 2021 15:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZfJ8PjGEwmyXZ+gtGmQmPsOr3oK5zA8lOwS8dQZ4s+4=;
        b=InMNdslEBanZLVTwjuSVme/8GSf9HWOfYnWP9xzR86lDZlMSrI31v+Uj3yE5+cOP7F
         dBDpVGKGN5uVg393haBTZyt6EAAoYBAZ0UjTnDbt0ytvpAK2+1eezS/+iM4DdzpSBeUf
         LlgYLiw1FmurJBzM7Lc/9czc+kXxR0ZvgJoQQQka40IlHerfZ4m5j99CV+OP5i27huG1
         T6oDEMI/9qPug7RQxzvDlCPg+7JxfSXTQrp+0DcC4qgn3Z3S9gzI5s/G0J1dNFrjEiU3
         Z8JIyAygB/MUgtVThi+8voMOTcB0j/qaNtqmtSTUZS+xDPZctfqGL+89szHypTrbeTq5
         xVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZfJ8PjGEwmyXZ+gtGmQmPsOr3oK5zA8lOwS8dQZ4s+4=;
        b=CFMgN4rNB+rgYVBn7kLnAYtXEvOW9NRTXOvGOryJ+Et+aXseB6OyUbnZzSkzXhabKu
         MF7nnLpws2JWEaqhOxnFxqBh//wkw3+eb9vf94xTs+0ETQQja8tkSFhM5x7Gu7VggMXG
         d3hwywF4gJBlj7fNCkp9QVyvuE2nsq9I1RkuatMC0h7tFh2TiQWufzf+QXsrAzbtQN8Y
         lxd/QXytH3nEEvebCUN6d2mDgRzqhwJc81XWx0hN4Fz8xz4VD5SwTROf0ApQGyEFWS0f
         Zq+iUcwAAF7tgmSgxxQE3lV5/2DO3Fi5t8bbZzU7ogarnK5sOookvljj3JttBpxMPTlV
         ji5Q==
X-Gm-Message-State: AOAM533QWvUdQhLwg6feADmD2j9lCwRMbkrshwdBP2AhO6jaGH8rXFIr
        BNB34Kj8kv5mM+tWdnp3rc+bEN337jw=
X-Google-Smtp-Source: ABdhPJwCXYwWUGSb43Pz9O2g8L1e0uEldwwEoZ086R6Dx0S1L4d7W8WJrWOxSX4zL1PbLXP4pexHQw==
X-Received: by 2002:a4a:db42:: with SMTP id 2mr5439817oot.47.1621551519819;
        Thu, 20 May 2021 15:58:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b81sm826602oia.19.2021.05.20.15.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:58:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 20 May 2021 15:58:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     joe@perches.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: Re: [PATCH] watchdog: ziirave_wdt: Remove VERSION_FMT defines and
 add sysfs newlines
Message-ID: <20210520225838.GH2968078@roeck-us.net>
References: <20210520072918.76482-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520072918.76482-1-juergh@canonical.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 20, 2021 at 09:29:18AM +0200, Juerg Haefliger wrote:
> Remove the ZIIRAVE_{BL,FW}_VERION_FMT defines since they're only used in
> very few places. While at it, add newlines to sysfs outputs.
> 
> Suggested-By: Joe Perches <joe@perches.com>
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
>  Depends on: https://lore.kernel.org/lkml/20210511061812.480172-1-juergh@canonical.com/
> 
>  drivers/watchdog/ziirave_wdt.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 6c9414d09684..c5a9b820d43a 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -69,9 +69,6 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
>  #define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER_MAGIC	1
>  #define ZIIRAVE_CMD_RESET_PROCESSOR_MAGIC	1
>  
> -#define ZIIRAVE_FW_VERSION_FMT	"02.%02u.%02u"
> -#define ZIIRAVE_BL_VERSION_FMT	"01.%02u.%02u"
> -
>  struct ziirave_wdt_rev {
>  	unsigned char major;
>  	unsigned char minor;
> @@ -445,7 +442,7 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	ret = sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
> +	ret = sysfs_emit(buf, "02.%02u.%02u\n",
>  			 w_priv->firmware_rev.major,
>  			 w_priv->firmware_rev.minor);
>  
> @@ -469,7 +466,7 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	ret = sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
> +	ret = sysfs_emit(buf, "01.%02u.%02u\n",
>  			 w_priv->bootloader_rev.major,
>  			 w_priv->bootloader_rev.minor);
>  
> @@ -493,7 +490,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	ret = sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
> +	ret = sysfs_emit(buf, "%s\n", ziirave_reasons[w_priv->reset_reason]);
>  
>  	mutex_unlock(&w_priv->sysfs_mutex);
>  
> @@ -538,7 +535,7 @@ static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
>  	}
>  
>  	dev_info(&client->dev,
> -		 "Firmware updated to version " ZIIRAVE_FW_VERSION_FMT "\n",
> +		 "Firmware updated to version 02.%02u.%02u\n",
>  		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
>  
>  	/* Restore the watchdog timeout */
> @@ -679,7 +676,7 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  	}
>  
>  	dev_info(&client->dev,
> -		 "Firmware version: " ZIIRAVE_FW_VERSION_FMT "\n",
> +		 "Firmware version: 02.%02u.%02u\n",
>  		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
>  
>  	ret = ziirave_wdt_revision(client, &w_priv->bootloader_rev,
> @@ -690,7 +687,7 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  	}
>  
>  	dev_info(&client->dev,
> -		 "Bootloader version: " ZIIRAVE_BL_VERSION_FMT "\n",
> +		 "Bootloader version: 01.%02u.%02u\n",
>  		 w_priv->bootloader_rev.major, w_priv->bootloader_rev.minor);
>  
>  	w_priv->reset_reason = i2c_smbus_read_byte_data(client,
> -- 
> 2.27.0
> 
