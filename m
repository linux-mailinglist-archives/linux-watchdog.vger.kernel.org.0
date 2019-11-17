Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7271AFFBCE
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Nov 2019 22:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfKQVoy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 17 Nov 2019 16:44:54 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36107 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfKQVoy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 17 Nov 2019 16:44:54 -0500
Received: by mail-pj1-f68.google.com with SMTP id cq11so883869pjb.3
        for <linux-watchdog@vger.kernel.org>; Sun, 17 Nov 2019 13:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ica94OT6+HHIRMA8tHbm8842ZYAakNiPO1qV+NsUvU=;
        b=MhAF61l2kEJtp1kDMQIU6erpDDJprv9rAq7TJaKAMmKxkg9Ops59WoE5Cck2HTZNDY
         4+tBTIuAd6Y5LmpDnuTJpDpofp/Zo9xpFOKD5gQRYYAAzEsvIj0aoAPkEOYz7NUSH04f
         5O0sCIsDz9HlKpa7lzB1l/9l1PjrBeN4S1tZFWYUFUo2l1Aqt52wBz0TMJMyJToEW/Xh
         5ywCGmCt5v2oSk1zaZJ63J078LPRXKGJny6WRLCmQc7IDMn66OakKNKiHXio/1vFYKF5
         UYJ0sRcONyhU0eXr+gchBtxb+7K0+fw8D/Jw8iFJB4A247g/l2Ysjhw9ss5/z6ieo6oy
         fHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ica94OT6+HHIRMA8tHbm8842ZYAakNiPO1qV+NsUvU=;
        b=fPQMwbnAR/QIu7MLbu1RdiYARCchN58bzzkwIPXaRMDwRFYu7bZTZ3rOrA6f5yL8H1
         Gy7EEgqgk3u5hVCEVCsZLPEtj/vrGM6lsPeNdVL/TTL47q9ZwIa4KiRcNSIoqQ1KHd9s
         r5xJ+UNxSdHyXGfXEdLYiRjlhVYq0Gx2/7mB1qYgNPzuVQdiw/tGdl5WIQrAalNlBTqI
         //SVRpmVo8wvgLt/Zp71LYZRED1WnC7eKAN8hrnLfKAnW6P0v7XpGvfHHqZhzqsokCmg
         lo7fbZ8sal/sNywRvNdjfp64l3bS6KSBUqGKzrKUR5INajfgUYYmkcLjI3oRR5J40hdX
         KwRA==
X-Gm-Message-State: APjAAAUz5UiybnJFhUqBxe6NIJFunuXj9HiVTmaXDXYkLCFhTqAOb9OJ
        gQkiKTM4W0V5zX3ujzDagbE=
X-Google-Smtp-Source: APXvYqy1i1W6jcMRPMLKDE7EFw1A9riG1kHNyuJcV8P6epmh/xxUTpGurAwZEY8UZdatZlH69ZB66g==
X-Received: by 2002:a17:90a:22a6:: with SMTP id s35mr34228111pjc.3.1574027093857;
        Sun, 17 Nov 2019 13:44:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 71sm19077133pfx.107.2019.11.17.13.44.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Nov 2019 13:44:52 -0800 (PST)
Subject: Re: [PATCH] watchdog: omap: Fix early_enable to start watchdogd
To:     Brandon Maier <brandon.maier@rockwellcollins.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org
References: <20191117200325.142419-1-brandon.maier@rockwellcollins.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6e9a6f3b-0723-ac59-b859-f8b7b75d39a9@roeck-us.net>
Date:   Sun, 17 Nov 2019 13:44:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191117200325.142419-1-brandon.maier@rockwellcollins.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/17/19 12:03 PM, Brandon Maier wrote:
> When the 'early_enable' module_param is enabled, Linux's watchdogd
> thread does not start, causing the watchdog to eventually fire.
> 

What does early_enable have to do with watchdogd ? Why would
watchdogd not start if this flag is set ?

The purpose of early_enable in this driver, as I understand it,
was to force watchdogd to start within the timeout period. So
it does exactly what it is supposed to be doing.

Guenter

> For the watchdogd to be started, the WDOG_HW_RUNNING flag must be set
> before watchdog_register_device().
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ---
>   drivers/watchdog/omap_wdt.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index 9b91882fe3c4..ecc8592c00a5 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -268,8 +268,13 @@ static int omap_wdt_probe(struct platform_device *pdev)
>   			wdev->wdog.bootstatus = WDIOF_CARDRESET;
>   	}
>   
> -	if (!early_enable)
> +	if (!early_enable) {
>   		omap_wdt_disable(wdev);
> +		clear_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> +	} else {
> +		omap_wdt_start(&wdev->wdog);
> +		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> +	}
>   
>   	ret = watchdog_register_device(&wdev->wdog);
>   	if (ret) {
> @@ -281,9 +286,6 @@ static int omap_wdt_probe(struct platform_device *pdev)
>   		readl_relaxed(wdev->base + OMAP_WATCHDOG_REV) & 0xFF,
>   		wdev->wdog.timeout);
>   
> -	if (early_enable)
> -		omap_wdt_start(&wdev->wdog);
> -
>   	pm_runtime_put(wdev->dev);
>   
>   	return 0;
> 

