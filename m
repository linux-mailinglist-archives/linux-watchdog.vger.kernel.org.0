Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55EFC7D03A
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 23:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbfGaVoJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 17:44:09 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41738 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727865AbfGaVoJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 17:44:09 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so22374844pgg.8;
        Wed, 31 Jul 2019 14:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jn/EGBbztfB2nGvB0KvRf41V3AgA32Rgpcwkg+wJJdw=;
        b=Tpf1ZYN6dxGT7LbxLDYCZq2pQ9Hs8TZqu7+tmNtndlF1+MIpTvyg9fxI1c+guJYnXN
         bvsth9Jhi77KaezQ3fFmI1M/2pYixCG08CFPhvE6zcmOfmspU9QWDOhXOdPqGEvG69P+
         gjkESVFUxvzYkzpwNzN2AFJYx7c4I4EgZN+Ckxd+sHSKYZLoPE4h2GPAyQZ1K4l1L1ut
         LCJc5WYCo7ueqtEg6P8IjicIvJCihpbwV3/TvSLhb1C/XMP5JWpZo7DCQp5wR3mpYiEs
         f3wB0adDQnMIOBmREKZCIu815WClAaFhrqhJOSzd5Z1NTiTpxF5DP20c613U9BsLzH/C
         qJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jn/EGBbztfB2nGvB0KvRf41V3AgA32Rgpcwkg+wJJdw=;
        b=ZgBCecsnMlJyYBf8usnQLEwsYJVKkqTVZNS8ea5g2jR8c2DsuuvB5mibQ5jtE1zgK2
         XCJSO8RzWUr+faecbI2CiejpEuok0AudDCD/VghTl0NcJvjSC+X4urgNuX43zSueV54b
         gg60uBDPjUGuQ15v4UHau1IDDNsw15UqF4cbU6Qha8xRY2TdaaE+z19OUZ63GxVUKk5N
         Z6ibphBUngnd+kD4H7GsJvf/HI1dVHgTG+NdtserKAWm8H0Q4tQ6E0n+gEsTCAIxBGbC
         yRU+4N1vJWW+RTok0WynLoJoZHJBJx8pM44bJHN+lC8s4sw1GZQeZTOirfdcAa3V2MwN
         2ZdA==
X-Gm-Message-State: APjAAAWqTn9hOLEK8ebuiU8r2b6o8ymzexVKL0w6vzdidkLQAraO3fTS
        qzaxix7zkAVekKf447GflKY=
X-Google-Smtp-Source: APXvYqxKze3DlyqHNRFRHMuQIg68+neA9sN4BNlDBGl3ktMWftwQkun4coZLvc6NgHEymbCq7wtbIw==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr115174559pgq.130.1564609448743;
        Wed, 31 Jul 2019 14:44:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l4sm70895918pff.50.2019.07.31.14.44.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 14:44:08 -0700 (PDT)
Date:   Wed, 31 Jul 2019 14:44:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] watchdog: ziirave_wdt: Log bootloader/firmware info
 during probe
Message-ID: <20190731214407.GD17277@roeck-us.net>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
 <20190731174252.18041-6-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731174252.18041-6-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 10:42:52AM -0700, Andrey Smirnov wrote:
> Log bootloader/firmware info during probe. This information is
> available via sysfs already, but it's really helpful to have this in
> kernel log during startup as well.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ziirave_wdt.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 33c8d2eadada..84ba8820ac86 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -68,6 +68,9 @@ static char *ziirave_reasons[] = {"power cycle", "hw watchdog", NULL, NULL,
>  #define ZIIRAVE_CMD_JUMP_TO_BOOTLOADER		0x0c
>  #define ZIIRAVE_CMD_DOWNLOAD_PACKET		0x0e
>  
> +#define ZIIRAVE_FW_VERSION_FMT	"02.%02u.%02u"
> +#define ZIIRAVE_BL_VERSION_FMT	"01.%02u.%02u"
> +
>  struct ziirave_wdt_rev {
>  	unsigned char major;
>  	unsigned char minor;
> @@ -482,7 +485,7 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	ret = sprintf(buf, "02.%02u.%02u", w_priv->firmware_rev.major,
> +	ret = sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.major,
>  		      w_priv->firmware_rev.minor);
>  
>  	mutex_unlock(&w_priv->sysfs_mutex);
> @@ -505,7 +508,7 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	ret = sprintf(buf, "01.%02u.%02u", w_priv->bootloader_rev.major,
> +	ret = sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.major,
>  		      w_priv->bootloader_rev.minor);
>  
>  	mutex_unlock(&w_priv->sysfs_mutex);
> @@ -572,7 +575,8 @@ static ssize_t ziirave_wdt_sysfs_store_firm(struct device *dev,
>  		goto unlock_mutex;
>  	}
>  
> -	dev_info(&client->dev, "Firmware updated to version 02.%02u.%02u\n",
> +	dev_info(&client->dev,
> +		 "Firmware updated to version " ZIIRAVE_FW_VERSION_FMT "\n",
>  		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
>  
>  	/* Restore the watchdog timeout */
> @@ -706,6 +710,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> +	dev_info(&client->dev,
> +		 "Firmware version: " ZIIRAVE_FW_VERSION_FMT "\n",
> +		 w_priv->firmware_rev.major, w_priv->firmware_rev.minor);
> +
>  	ret = ziirave_wdt_revision(client, &w_priv->bootloader_rev,
>  				   ZIIRAVE_WDT_BOOT_VER_MAJOR);
>  	if (ret) {
> @@ -713,6 +721,10 @@ static int ziirave_wdt_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> +	dev_info(&client->dev,
> +		 "Bootloader version: " ZIIRAVE_BL_VERSION_FMT "\n",
> +		 w_priv->bootloader_rev.major, w_priv->bootloader_rev.minor);
> +
>  	w_priv->reset_reason = i2c_smbus_read_byte_data(client,
>  						ZIIRAVE_WDT_RESET_REASON);
>  	if (w_priv->reset_reason < 0) {
> -- 
> 2.21.0
> 
