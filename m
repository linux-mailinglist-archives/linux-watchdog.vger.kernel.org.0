Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166193DCCFD
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Aug 2021 19:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhHARiF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 1 Aug 2021 13:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhHARiF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 1 Aug 2021 13:38:05 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EADC0613D3;
        Sun,  1 Aug 2021 10:37:56 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 26so3496191oiy.0;
        Sun, 01 Aug 2021 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zXURQHqoXgoKN7vruCdacQrCsvk2B5NybEl08Qm6AcE=;
        b=NaAdBi9n4yHz64NFUEEe1bR983uWbwDjtmfv+vDp5lHCZYpSquDf1oQOfMM2gte0bx
         A+tDJEeUCzBqFXeKzn7TOhWb7+P/9WjWd0Qs5n2Fh2FVehx1/x0INUAYm5+JePjG0kDI
         c6d+JGagkwImEuudnjfZz/QGJmgQeNAsum7mLOyQUdHTif1Os+03gErL3TBrTlSPTMOC
         YohqhN+K8o/BRzGwjl1rsoNEbHLVd/6MwqoYZ7gSHz3Nuz5Eq/xKbAF2hwK1goHXyRXF
         VYXHBR4fylgtOO7ryBtaQo0bmZVUUXn6fe/9ptvuD3nKZYo4JGEUGkCLRkT+XrjFI0CV
         o41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zXURQHqoXgoKN7vruCdacQrCsvk2B5NybEl08Qm6AcE=;
        b=HLximAKNuwQgQKPoVTUapyCHACQtvJGtsJqfsEeTvu2D97fsD5eyWls9/S45GmzV2d
         fmrI+OVXy0KtbnCa4yFBoohOBCRVycHvMznovf5HnL/rkh8jlO8wrLSQ9iivOYXcbR/U
         QqZGz+ImQsCwcq8fkMauhJmQJFiK5OvOrXo8hbFGKyT5itWL6+hVwoiwBuwabE/QT+DX
         EmZIunENUKrAHXIhSh89w6KkHm9TfdE3usJr0393eVP7MT9idOgkD86upzYZgA9n0F+X
         AEKbry6CKak0mBo9KlA4ASen8mOTZDG5QqW18pW6QDbYdiYCHXEK123Crrdicgz8gH6A
         Dc2g==
X-Gm-Message-State: AOAM5307f7TKLwncsm68i812r2tN9muYhlpYL+3/Hkq/egPyNw7VL739
        ZRwLt2Bshky73Ol3iKaejbbioGc+pgY=
X-Google-Smtp-Source: ABdhPJxMEH5FVS/gMAgLLI3ShZA1lQh1DRuuEEyUyAwC0tFGxkU6MOW+UMDZQbRFcmGl6/T91mfUyg==
X-Received: by 2002:aca:6109:: with SMTP id v9mr8182851oib.147.1627839475931;
        Sun, 01 Aug 2021 10:37:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s2sm1302189ooc.15.2021.08.01.10.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 10:37:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: Start watchdog in
 watchdog_set_last_hw_keepalive only if appropriate
To:     Jan Kiszka <jan.kiszka@web.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <93d56386-6e37-060b-55ce-84de8cde535f@web.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7228af51-5390-23e8-1383-b196e44a669a@roeck-us.net>
Date:   Sun, 1 Aug 2021 10:37:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <93d56386-6e37-060b-55ce-84de8cde535f@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/1/21 12:56 AM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> We must not pet a running watchdog when handle_boot_enabled is off
> because this will kick off automatic triggering before userland is
> running, defeating the purpose of the handle_boot_enabled control.
> Furthermore, don't ping in case watchdog_set_last_hw_keepalive was
> called incorrectly when the hardware watchdog is actually not running.
> 
> Fixed: cef9572e9af3 ("watchdog: add support for adjusting last known HW keepalive time")
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes to v1 ("watchdog: Respect handle_boot_enabled when setting last last_hw_keepalive"):
>   - add watchdog_hw_running test
>   - improve commit log
> 
>   drivers/watchdog/watchdog_dev.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 3bab32485273..6c73160386b9 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1172,7 +1172,10 @@ int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
> 
>   	wd_data->last_hw_keepalive = ktime_sub(now, ms_to_ktime(last_ping_ms));
> 
> -	return __watchdog_ping(wdd);
> +	if (watchdog_hw_running(wdd) && handle_boot_enabled)
> +		return __watchdog_ping(wdd);
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(watchdog_set_last_hw_keepalive);
> 
> --
> 2.31.1
> 

