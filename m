Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C1D17476B
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Feb 2020 15:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgB2OlB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 29 Feb 2020 09:41:01 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34332 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgB2OlA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 29 Feb 2020 09:41:00 -0500
Received: by mail-pf1-f194.google.com with SMTP id i6so3286407pfc.1
        for <linux-watchdog@vger.kernel.org>; Sat, 29 Feb 2020 06:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SuOWt2l1/sAg5SLMDeVpLGMFAQJA49IJUUaehyuEUmE=;
        b=EVzvX4e3o3ymy18+dNaaOC9vHHQt6b4Ppjyj9SXfC9//6WhxjROBG8bqjY3pkb9uwF
         JeurCCSQSHIn8b1BpN5rtinSGZRJrYRquy4xoWhtlmWrRFPIfBovdktZaWb2mLHqvYeu
         pE6MUWeEekbnsvmatOPzRbC2qQdZ1sUU6ravJ+SEPKRN2UqYJoBBo//05yVqJpDUVwZd
         2u0muBRiX8rnRxgNRvk1Vi1r0ilk2e56nLsWymXs0PjVUWSTKPwqUCc7zYDdoC97Fddh
         kT/4IfJcu4jKAZSBgolhy42yhlR9QfZWIk0Ysaid9nvltpl0XnPsYplQ7gcA0hd2j7Br
         DYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SuOWt2l1/sAg5SLMDeVpLGMFAQJA49IJUUaehyuEUmE=;
        b=SKu2/BWrkFgC55Tl7WTFK3pBGynYZZi6oXuu5h3bcwoejotI7NTZLOpL/HzbVZ2mac
         e4lVeIHqPcdofQl29wpvcQzI93tN+/0efumFP+VeZwVhiE0mCuNRqvUQsy94DLKS6Au/
         X321/wkGT1au5KDxe/zCnu3lWNaa/JSkwfENbnCzxn6G8PytmWWWHrEYiPS+UiMidupb
         yeQyYxr6nDs1MTaUiG8cOX+mYDyQs19GgwRQD21s4wN/PI1aRL3YFkDCCexFbbZ2nmDX
         HOL/f4WDYZEVSkYLYd+NVSVFNmcQZB6TFY8uxfhBp8RV85hBgL2bC+KmXbuX1fjy98ps
         o20g==
X-Gm-Message-State: APjAAAU6BRjudmUHsWpuQlQCDRRAmja23Tq15PGxF6IY6MtjHad+bTRs
        kfhBTpFvQ9zoIRLa6GK0SMY=
X-Google-Smtp-Source: APXvYqwFBDjq2yNyurhBOi0o72HxdytqRfOdTINDG3Rr6g2gdCmWbjl61VABqD+a+FqJyRHCu0Nkuw==
X-Received: by 2002:a63:350:: with SMTP id 77mr10202171pgd.215.1582987259606;
        Sat, 29 Feb 2020 06:40:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w11sm14449918pgh.5.2020.02.29.06.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Feb 2020 06:40:58 -0800 (PST)
Subject: Re: [PATCH] watchdog: wm831x_wdt: Remove GPIO handling
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
References: <20200229115046.57781-1-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <0c32eef6-89e9-e826-e68a-7cd00468c4c7@roeck-us.net>
Date:   Sat, 29 Feb 2020 06:40:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200229115046.57781-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/29/20 3:50 AM, Linus Walleij wrote:
> An attempt to convert the driver to using GPIO descriptors
> (see Link tag) was discouraged in favor of deleting the
> handling of the update GPIO altogehter since there are
> no in-tree users.
> 
> This patch deletes the GPIO handling instead.
> 
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/linux-watchdog/20200210102209.289379-1-linus.walleij@linaro.org/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> I am also fine with the elder patch being applied, obviously.
> ---
>  drivers/watchdog/wm831x_wdt.c    | 27 ---------------------------
>  include/linux/mfd/wm831x/pdata.h |  1 -
>  2 files changed, 28 deletions(-)
> 
> diff --git a/drivers/watchdog/wm831x_wdt.c b/drivers/watchdog/wm831x_wdt.c
> index 030ce240620d..d96ad8f38bd2 100644
> --- a/drivers/watchdog/wm831x_wdt.c
> +++ b/drivers/watchdog/wm831x_wdt.c
> @@ -13,7 +13,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/watchdog.h>
>  #include <linux/uaccess.h>
> -#include <linux/gpio.h>
>  
>  #include <linux/mfd/wm831x/core.h>
>  #include <linux/mfd/wm831x/pdata.h>
> @@ -29,7 +28,6 @@ struct wm831x_wdt_drvdata {
>  	struct watchdog_device wdt;
>  	struct wm831x *wm831x;
>  	struct mutex lock;
> -	int update_gpio;
>  	int update_state;
>  };
>  
> @@ -103,14 +101,6 @@ static int wm831x_wdt_ping(struct watchdog_device *wdt_dev)
>  
>  	mutex_lock(&driver_data->lock);
>  
> -	if (driver_data->update_gpio) {
> -		gpio_set_value_cansleep(driver_data->update_gpio,
> -					driver_data->update_state);
> -		driver_data->update_state = !driver_data->update_state;
> -		ret = 0;
> -		goto out;
> -	}
> -
>  	reg = wm831x_reg_read(wm831x, WM831X_WATCHDOG);
>  
>  	if (!(reg & WM831X_WDOG_RST_SRC)) {
> @@ -239,23 +229,6 @@ static int wm831x_wdt_probe(struct platform_device *pdev)
>  		reg |= pdata->secondary << WM831X_WDOG_SECACT_SHIFT;
>  		reg |= pdata->software << WM831X_WDOG_RST_SRC_SHIFT;
>  
> -		if (pdata->update_gpio) {
> -			ret = devm_gpio_request_one(dev, pdata->update_gpio,
> -						    GPIOF_OUT_INIT_LOW,
> -						    "Watchdog update");
> -			if (ret < 0) {
> -				dev_err(wm831x->dev,
> -					"Failed to request update GPIO: %d\n",
> -					ret);
> -				return ret;
> -			}
> -
> -			driver_data->update_gpio = pdata->update_gpio;
> -
> -			/* Make sure the watchdog takes hardware updates */
> -			reg |= WM831X_WDOG_RST_SRC;
> -		}
> -
>  		ret = wm831x_reg_unlock(wm831x);
>  		if (ret == 0) {
>  			ret = wm831x_reg_write(wm831x, WM831X_WATCHDOG, reg);
> diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
> index 986986fe4e4e..75aa94dadf1c 100644
> --- a/include/linux/mfd/wm831x/pdata.h
> +++ b/include/linux/mfd/wm831x/pdata.h
> @@ -89,7 +89,6 @@ enum wm831x_watchdog_action {
>  
>  struct wm831x_watchdog_pdata {
>  	enum wm831x_watchdog_action primary, secondary;
> -	int update_gpio;
>  	unsigned int software:1;
>  };
>  
> 

