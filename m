Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A963B53E8
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 16:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhF0Oy3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 10:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhF0Oy2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 10:54:28 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986B8C061574;
        Sun, 27 Jun 2021 07:52:03 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so15632197ota.4;
        Sun, 27 Jun 2021 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8JlGNa6xDnpVxYBfS98MOdpdA309kEiRIoLQtbWVtQI=;
        b=jP0xYsQ1qY6nP9ydCeuPdeNaneMkTJSQi+A6Eyp532mMiSWuG6wY2B3BAQrkEfh8uu
         XAC1wqJ+q0EesVeihOPwZOHDeaS2VjH4wsFiDmuQ9C/1Sfolf4et87ciFstrG2lf9Ln+
         n8cB+pGBbwdaBya3tZgGxG8fI6H0fLrqWsXI/MU+ZyAG0ThEz+cKcHwlHRgpqL8+PpXU
         fgDjQ6pplyu5Li31PCEB1fns5xMvx5pp3aqxjTrF4PKS+s1cM+FTLvno4YZEmkUrf41M
         HOjtACbJSFrav6iKz2RvmB6tWWmgFMEmULR3h3u7gm0idlQTGuxKno/iqzprpFBlVmMF
         +TAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8JlGNa6xDnpVxYBfS98MOdpdA309kEiRIoLQtbWVtQI=;
        b=jcpvtss3mhEKfE2ymOoGkEAXgrooYKGp0z7gHnbefSLhuIRp2KmJPAVUgUdtHgoeY2
         UrRy5JQ7+vnJmLrv2vh8nHG4EpDbiMecYAtgyKYjTDqdwl5QSdFoKYXu16iLR2ZdI+yl
         AumLMd6zSsd2Q+ZXgevwuu6nnmfyXA8OSyyiBcqYPVUQVP5H7tqxgu7NFGt1WI1Q4pOj
         e/ZJ/TFo26oPKBWz/aM2YVtC0ZMMxCSh5cI0/P9A9vInsHvx91xyUCOl2arsZP4qiIe4
         OJ98hcQPugT1CEBmSYsG0/5WLujDpjP4GB0wpoZMR04iOmhRUyfyNfL3x5WCtm8k/fkQ
         n0yA==
X-Gm-Message-State: AOAM533CkiqoOgGWzSj/5kHPa5kK38tCC0/ONPdN7MXm3qxd5Zl/Oqzi
        jqhsssThlAtK/BtvCuSdMw3EJv9S9yU=
X-Google-Smtp-Source: ABdhPJyv+eB8H+MxsVYS+g4gfUB0RzK7mwTsZfG6gpditrj6ySTKXB+lfziSwj+hLttg0vMi5xPfXw==
X-Received: by 2002:a9d:7558:: with SMTP id b24mr18133925otl.60.1624805522763;
        Sun, 27 Jun 2021 07:52:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a7sm934167oia.42.2021.06.27.07.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 07:52:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Replace symbolic permissions with octal
 permissions
To:     Jinchao Wang <wjc@cdjrlc.com>, tomas.winkler@intel.com,
        wim@linux-watchdog.org
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20210626100922.54218-1-wjc@cdjrlc.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4d344004-b307-9bc9-7989-674e9e9d87a5@roeck-us.net>
Date:   Sun, 27 Jun 2021 07:51:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210626100922.54218-1-wjc@cdjrlc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/26/21 3:09 AM, Jinchao Wang wrote:
> Resolve following checkpatch issue,
> Replace symbolic permissions with octal permissions
> 
> Signed-off-by: Jinchao Wang <wjc@cdjrlc.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mei_wdt.c     | 4 ++--
>   drivers/watchdog/ni903x_wdt.c  | 2 +-
>   drivers/watchdog/sbsa_gwdt.c   | 2 +-
>   drivers/watchdog/sun4v_wdt.c   | 2 +-
>   drivers/watchdog/xen_wdt.c     | 4 ++--
>   drivers/watchdog/ziirave_wdt.c | 8 ++++----
>   6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
> index c7a7235e6224..3ee5b9e83c7e 100644
> --- a/drivers/watchdog/mei_wdt.c
> +++ b/drivers/watchdog/mei_wdt.c
> @@ -545,9 +545,9 @@ static void dbgfs_register(struct mei_wdt *wdt)
>   	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
>   	wdt->dbgfs_dir = dir;
>   
> -	debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
> +	debugfs_create_file("state", 0400, dir, wdt, &dbgfs_fops_state);
>   
> -	debugfs_create_file("activation", S_IRUSR, dir, wdt,
> +	debugfs_create_file("activation", 0400, dir, wdt,
>   			    &dbgfs_fops_activation);
>   }
>   
> diff --git a/drivers/watchdog/ni903x_wdt.c b/drivers/watchdog/ni903x_wdt.c
> index 4cebad324b20..4d85082e0ce9 100644
> --- a/drivers/watchdog/ni903x_wdt.c
> +++ b/drivers/watchdog/ni903x_wdt.c
> @@ -48,7 +48,7 @@ MODULE_PARM_DESC(timeout,
>   		 __MODULE_STRING(NIWD_DEFAULT_TIMEOUT) ")");
>   
>   static int nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, int, S_IRUGO);
> +module_param(nowayout, int, 0444);
>   MODULE_PARM_DESC(nowayout,
>   		 "Watchdog cannot be stopped once started (default="
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index ee9ff38929eb..369d2f922ecc 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -112,7 +112,7 @@ MODULE_PARM_DESC(action, "after watchdog gets WS0 interrupt, do: "
>   		 "0 = skip(*)  1 = panic");
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, S_IRUGO);
> +module_param(nowayout, bool, 0444);
>   MODULE_PARM_DESC(nowayout,
>   		 "Watchdog cannot be stopped once started (default="
>   		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> diff --git a/drivers/watchdog/sun4v_wdt.c b/drivers/watchdog/sun4v_wdt.c
> index 8db86ad5ee3d..22ee4b6093a2 100644
> --- a/drivers/watchdog/sun4v_wdt.c
> +++ b/drivers/watchdog/sun4v_wdt.c
> @@ -30,7 +30,7 @@ MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
>   	__MODULE_STRING(WDT_TIMEOUT) ")");
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, S_IRUGO);
> +module_param(nowayout, bool, 0444);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> diff --git a/drivers/watchdog/xen_wdt.c b/drivers/watchdog/xen_wdt.c
> index b343f421dc72..d9e8408ce60d 100644
> --- a/drivers/watchdog/xen_wdt.c
> +++ b/drivers/watchdog/xen_wdt.c
> @@ -28,12 +28,12 @@ static time64_t wdt_expires;
>   
>   #define WATCHDOG_TIMEOUT 60 /* in seconds */
>   static unsigned int timeout;
> -module_param(timeout, uint, S_IRUGO);
> +module_param(timeout, uint, 0444);
>   MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds "
>   	"(default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, S_IRUGO);
> +module_param(nowayout, bool, 0444);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
>   	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index c5a9b820d43a..aa6dcb604ab0 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -451,7 +451,7 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
>   	return ret;
>   }
>   
> -static DEVICE_ATTR(firmware_version, S_IRUGO, ziirave_wdt_sysfs_show_firm,
> +static DEVICE_ATTR(firmware_version, 0444, ziirave_wdt_sysfs_show_firm,
>   		   NULL);
>   
>   static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
> @@ -475,7 +475,7 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
>   	return ret;
>   }
>   
> -static DEVICE_ATTR(bootloader_version, S_IRUGO, ziirave_wdt_sysfs_show_boot,
> +static DEVICE_ATTR(bootloader_version, 0444, ziirave_wdt_sysfs_show_boot,
>   		   NULL);
>   
>   static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
> @@ -497,7 +497,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct device *dev,
>   	return ret;
>   }
>   
> -static DEVICE_ATTR(reset_reason, S_IRUGO, ziirave_wdt_sysfs_show_reason,
> +static DEVICE_ATTR(reset_reason, 0444, ziirave_wdt_sysfs_show_reason,
>   		   NULL);
>   
>   static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
> @@ -552,7 +552,7 @@ static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
>   	return err ? err : count;
>   }
>   
> -static DEVICE_ATTR(update_firmware, S_IWUSR, NULL,
> +static DEVICE_ATTR(update_firmware, 0200, NULL,
>   		   ziirave_wdt_sysfs_store_firm);
>   
>   static struct attribute *ziirave_wdt_attrs[] = {
> 

