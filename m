Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F539426B26
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Oct 2021 14:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhJHMwD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Oct 2021 08:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhJHMwD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Oct 2021 08:52:03 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23419C061570
        for <linux-watchdog@vger.kernel.org>; Fri,  8 Oct 2021 05:50:08 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so11609372otj.2
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Oct 2021 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=np9BG2GrUxpbRVjUc2TqGlf5XCEUiPCeTHyJ97juIcQ=;
        b=mg5dsYGFyopCL8na1xGmGhkTAC2Ky/wiDOXnCSTC+mDb6co2vploiz14Uvr3SrBR6j
         bx50IXoP2AicTU8Diva0Kc3gpOHZwSsrtCrDxvlmUFQNf3MzgkhcO+YaZ8sinuolnC3Q
         jhtSI1WpLoNbXsBTQ+0vrDa4MEoKHCdg3rROyZ3Axd8CjpOD4WA+W4d9waBAdv+PgBe+
         Uce8Y/DFK4jJzZ4jQHkQIkClAEBPvlqRq5iISLDYd2+dvcXJVaRDWXgghefOYeJiTN5S
         veiiLJcU0MzMbJm7BTvIFPq6UH6ROPCsxjje/2A68VVEdOw6bfp8kkSAsJYAdKWsPwUc
         2dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=np9BG2GrUxpbRVjUc2TqGlf5XCEUiPCeTHyJ97juIcQ=;
        b=f9UAuYipiRSXkoAtxnrbkaMYFClSXR33MHZRXNyG3/nEHYc+etbyMKYYqsNE3Xj64E
         uxG4ujei6p1nP4L1OBnPlUnlFZYxyvOrjGiNYg4ym8ZIEVJGfyYu/q432OvwSglAjd3h
         whSk4ahwVNYUEyaCGjW6k47mhdsGh/YCD4FhiIb2FUxGaZYXzLkbb6v1D3p1Pp6Fqtco
         xNKpnRGGmsHRpEbl/L482YOeOn0bGiiNkmf+zKo2tlTpz8ytK8n2jqEFxnK/lFM6ruDS
         DQSK+LnJUj9F9nM8kSKOPTMHkdbVS0PovC+SgFtQkmrY18zT26CAuyvqxUhkmLWZY8YX
         JKZQ==
X-Gm-Message-State: AOAM531kpVLvhCzboxkq6Fwo6QvUNWUdfrTWxJshMw6jzHE4yCo4Zp8E
        lJp1VsXOP5UQMlXITbifmaozSBSnAMY=
X-Google-Smtp-Source: ABdhPJy2haHcrDd5JZQARkZXOxi5slkTTZlBkXkTgcDxunkSUupjHhS/GBGWHO+qcz6Hep6OIPHHSw==
X-Received: by 2002:a05:6830:1c2e:: with SMTP id f14mr8226435ote.159.1633697407492;
        Fri, 08 Oct 2021 05:50:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d26sm570349oij.49.2021.10.08.05.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 05:50:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] watchdog: db8500_wdt: Rename symbols
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
 <20210922230947.1864357-3-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9af2daa0-e022-2f9e-e565-33d3fd2f8481@roeck-us.net>
Date:   Fri, 8 Oct 2021 05:50:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922230947.1864357-3-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/22/21 4:09 PM, Linus Walleij wrote:
> For conistency and clarity, rename all symbols and strings from
> ux500 to db8500 in the driver.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Lee it would be perfect if you could ACK the oneliner in
> this patch along with the rest.
> ---
>   drivers/mfd/db8500-prcmu.c    |  2 +-
>   drivers/watchdog/db8500_wdt.c | 76 +++++++++++++++++------------------
>   2 files changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
> index ccf6be922b39..56c61c99eb23 100644
> --- a/drivers/mfd/db8500-prcmu.c
> +++ b/drivers/mfd/db8500-prcmu.c
> @@ -2939,7 +2939,7 @@ static struct regulator_init_data db8500_regulators[DB8500_NUM_REGULATORS] = {
>   };
>   
>   static const struct mfd_cell common_prcmu_devs[] = {
> -	MFD_CELL_NAME("ux500_wdt"),
> +	MFD_CELL_NAME("db8500_wdt"),
>   	MFD_CELL_NAME("db8500-cpuidle"),
>   };
>   
> diff --git a/drivers/watchdog/db8500_wdt.c b/drivers/watchdog/db8500_wdt.c
> index 40f8cf1cb234..6ed8b63d310d 100644
> --- a/drivers/watchdog/db8500_wdt.c
> +++ b/drivers/watchdog/db8500_wdt.c
> @@ -35,60 +35,60 @@ MODULE_PARM_DESC(nowayout,
>   	"Watchdog cannot be stopped once started (default="
>   				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   
> -static int ux500_wdt_start(struct watchdog_device *wdd)
> +static int db8500_wdt_start(struct watchdog_device *wdd)
>   {
>   	return prcmu_enable_a9wdog(PRCMU_WDOG_ALL);
>   }
>   
> -static int ux500_wdt_stop(struct watchdog_device *wdd)
> +static int db8500_wdt_stop(struct watchdog_device *wdd)
>   {
>   	return prcmu_disable_a9wdog(PRCMU_WDOG_ALL);
>   }
>   
> -static int ux500_wdt_keepalive(struct watchdog_device *wdd)
> +static int db8500_wdt_keepalive(struct watchdog_device *wdd)
>   {
>   	return prcmu_kick_a9wdog(PRCMU_WDOG_ALL);
>   }
>   
> -static int ux500_wdt_set_timeout(struct watchdog_device *wdd,
> +static int db8500_wdt_set_timeout(struct watchdog_device *wdd,
>   				 unsigned int timeout)
>   {
> -	ux500_wdt_stop(wdd);
> +	db8500_wdt_stop(wdd);
>   	prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
> -	ux500_wdt_start(wdd);
> +	db8500_wdt_start(wdd);
>   
>   	return 0;
>   }
>   
> -static const struct watchdog_info ux500_wdt_info = {
> +static const struct watchdog_info db8500_wdt_info = {
>   	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> -	.identity = "Ux500 WDT",
> +	.identity = "DB8500 WDT",
>   	.firmware_version = 1,
>   };
>   
> -static const struct watchdog_ops ux500_wdt_ops = {
> +static const struct watchdog_ops db8500_wdt_ops = {
>   	.owner = THIS_MODULE,
> -	.start = ux500_wdt_start,
> -	.stop  = ux500_wdt_stop,
> -	.ping  = ux500_wdt_keepalive,
> -	.set_timeout = ux500_wdt_set_timeout,
> +	.start = db8500_wdt_start,
> +	.stop  = db8500_wdt_stop,
> +	.ping  = db8500_wdt_keepalive,
> +	.set_timeout = db8500_wdt_set_timeout,
>   };
>   
> -static struct watchdog_device ux500_wdt = {
> -	.info = &ux500_wdt_info,
> -	.ops = &ux500_wdt_ops,
> +static struct watchdog_device db8500_wdt = {
> +	.info = &db8500_wdt_info,
> +	.ops = &db8500_wdt_ops,
>   	.min_timeout = WATCHDOG_MIN,
>   	.max_timeout = WATCHDOG_MAX28,
>   };
>   
> -static int ux500_wdt_probe(struct platform_device *pdev)
> +static int db8500_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	int ret;
>   
>   	timeout = 600; /* Default to 10 minutes */
> -	ux500_wdt.parent = dev;
> -	watchdog_set_nowayout(&ux500_wdt, nowayout);
> +	db8500_wdt.parent = dev;
> +	watchdog_set_nowayout(&db8500_wdt, nowayout);
>   
>   	/* disable auto off on sleep */
>   	prcmu_config_a9wdog(PRCMU_WDOG_CPU1, false);
> @@ -96,7 +96,7 @@ static int ux500_wdt_probe(struct platform_device *pdev)
>   	/* set HW initial value */
>   	prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
>   
> -	ret = devm_watchdog_register_device(dev, &ux500_wdt);
> +	ret = devm_watchdog_register_device(dev, &db8500_wdt);
>   	if (ret)
>   		return ret;
>   
> @@ -106,47 +106,47 @@ static int ux500_wdt_probe(struct platform_device *pdev)
>   }
>   
>   #ifdef CONFIG_PM
> -static int ux500_wdt_suspend(struct platform_device *pdev,
> +static int db8500_wdt_suspend(struct platform_device *pdev,
>   			     pm_message_t state)
>   {
> -	if (watchdog_active(&ux500_wdt)) {
> -		ux500_wdt_stop(&ux500_wdt);
> +	if (watchdog_active(&db8500_wdt)) {
> +		db8500_wdt_stop(&db8500_wdt);
>   		prcmu_config_a9wdog(PRCMU_WDOG_CPU1, true);
>   
>   		prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
> -		ux500_wdt_start(&ux500_wdt);
> +		db8500_wdt_start(&db8500_wdt);
>   	}
>   	return 0;
>   }
>   
> -static int ux500_wdt_resume(struct platform_device *pdev)
> +static int db8500_wdt_resume(struct platform_device *pdev)
>   {
> -	if (watchdog_active(&ux500_wdt)) {
> -		ux500_wdt_stop(&ux500_wdt);
> +	if (watchdog_active(&db8500_wdt)) {
> +		db8500_wdt_stop(&db8500_wdt);
>   		prcmu_config_a9wdog(PRCMU_WDOG_CPU1, false);
>   
>   		prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
> -		ux500_wdt_start(&ux500_wdt);
> +		db8500_wdt_start(&db8500_wdt);
>   	}
>   	return 0;
>   }
>   #else
> -#define ux500_wdt_suspend NULL
> -#define ux500_wdt_resume NULL
> +#define db8500_wdt_suspend NULL
> +#define db8500_wdt_resume NULL
>   #endif
>   
> -static struct platform_driver ux500_wdt_driver = {
> -	.probe		= ux500_wdt_probe,
> -	.suspend	= ux500_wdt_suspend,
> -	.resume		= ux500_wdt_resume,
> +static struct platform_driver db8500_wdt_driver = {
> +	.probe		= db8500_wdt_probe,
> +	.suspend	= db8500_wdt_suspend,
> +	.resume		= db8500_wdt_resume,
>   	.driver		= {
> -		.name	= "ux500_wdt",
> +		.name	= "db8500_wdt",
>   	},
>   };
>   
> -module_platform_driver(ux500_wdt_driver);
> +module_platform_driver(db8500_wdt_driver);
>   
>   MODULE_AUTHOR("Jonas Aaberg <jonas.aberg@stericsson.com>");
> -MODULE_DESCRIPTION("Ux500 Watchdog Driver");
> +MODULE_DESCRIPTION("DB8500 Watchdog Driver");
>   MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:ux500_wdt");
> +MODULE_ALIAS("platform:db8500_wdt");
> 

