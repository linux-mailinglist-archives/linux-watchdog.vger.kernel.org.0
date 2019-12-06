Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3AE1151DB
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Dec 2019 15:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfLFOFQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Dec 2019 09:05:16 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35608 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFOFQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Dec 2019 09:05:16 -0500
Received: by mail-pj1-f66.google.com with SMTP id w23so2805697pjd.2;
        Fri, 06 Dec 2019 06:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u0BBBBffFWSAiTSIMpvOYtG57WXglTAMWySrfaeUACk=;
        b=FEjicv0cd/jsGOOu1p8NCgngbt4hyeD9hRJboCPlIAwfo0I5vYydvj5RumPqZTYanD
         jsDSSoyEmt0CAvNMVpbpjuPchrj84YPCE8OZ4WDGwZs96MEl0TqMe0pXHpdPsOczpcIV
         4iG9d89XMTPYrcnqeb/effFrCPSQhFmSsSF1bdcUIQ9uDwPAXCAYxOhoPoqEvs1oOkCN
         bxOqpQnRM9CZKN8yJ5WrnRn7UzxEvghU7r6Bgl4bK78BCEagaqmFcxXNZ2qioFt7vjir
         FwXkHMJ8GMTYhhP9/VmlWRXZE54ejPF1b3ecB9Ibhu5nynCmxt+Gq9H2JUpitTNKfJKR
         4n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u0BBBBffFWSAiTSIMpvOYtG57WXglTAMWySrfaeUACk=;
        b=MiZ2BPjPXkQ11GW26gHGJdRHTOJHPzKAaa4ykNcBqAAOR05zb1ZiPZfileRsnylUkX
         cwGkA9/WA/wAYIopPMUkOcHFuulDEBbJPYfhqEWAblpI27njz3kwYW5Xpe6hZD9TxzQU
         80IWwbfHBYY0LbxHOlFW5EeY4IJICk2s50sCO4zf4SVoievyYaf0pDf1Y9blNfT4SFc0
         +9fQ+RJAL4OyVhVw+MJPixyW/zPmHVA89dNHgjZdo0nUAc13m41zP+VGP+ol3pmU6gXa
         gDhFsYmKQDhusojvc5/TZj8FP8q/7YNX2YYWvjBqfl4VHoH2aA/UMb6+2NeouOUDJrr8
         OBVQ==
X-Gm-Message-State: APjAAAXm+8XhLDq7kWAA4STW0N2OqxyfPSuJhekVIrFRcdvQfB8FE185
        AzpVg9CsFS3zGWUYqtInylKh8XVM
X-Google-Smtp-Source: APXvYqyXKgDbEvQ3tt9b6x1n3t8KK1rtJ4bRNhAsxfSedj629OarimobGgH7gQaxcBm12hRiHJxoKQ==
X-Received: by 2002:a17:90a:2351:: with SMTP id f75mr14355096pje.133.1575641115248;
        Fri, 06 Dec 2019 06:05:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 23sm3490709pjx.29.2019.12.06.06.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 06:05:14 -0800 (PST)
Subject: Re: [PATCH -next] watchdog: tqmx86_wdt: Fix build error
To:     YueHaibing <yuehaibing@huawei.com>, wim@linux-watchdog.org,
        andrew@lunn.ch
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191206124259.25880-1-yuehaibing@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1c31d0e5-37f9-4608-3af3-ba94f3b764e9@roeck-us.net>
Date:   Fri, 6 Dec 2019 06:05:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191206124259.25880-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/6/19 4:42 AM, YueHaibing wrote:
> If TQMX86_WDT is y and WATCHDOG_CORE is m, building fails:
> 
> drivers/watchdog/tqmx86_wdt.o: In function `tqmx86_wdt_probe':
> tqmx86_wdt.c:(.text+0x46e): undefined reference to `watchdog_init_timeout'
> tqmx86_wdt.c:(.text+0x4e0): undefined reference to `devm_watchdog_register_device'
> 
> Select WATCHDOG_CORE to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: e3c21e088f89 ("watchdog: tqmx86: Add watchdog driver for the IO controller")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 1679e0d..20bd967 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1444,6 +1444,7 @@ config SMSC37B787_WDT
>   config TQMX86_WDT
>   	tristate "TQ-Systems TQMX86 Watchdog Timer"
>   	depends on X86
> +	select WATCHDOG_CORE
>   	help
>   	This is the driver for the hardware watchdog timer in the TQMX86 IO
>   	controller found on some of their ComExpress Modules.
> 

