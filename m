Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31643B53F1
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Jun 2021 17:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhF0PDe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Jun 2021 11:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhF0PDd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Jun 2021 11:03:33 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F9AC061574;
        Sun, 27 Jun 2021 08:01:07 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id d21-20020a9d72d50000b02904604cda7e66so13838221otk.7;
        Sun, 27 Jun 2021 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3C9iHuFiHE/hLelyZ5mieqxqEshQNzel5N07H5HI+EY=;
        b=Vsu+YGE1EDBNwI2YGAuJQJ4YiNtONthrIZO/lcqpkmqG578R22eSf0WTEVWfzmej+Q
         EHnJcczE56jLXtnjuSyB69lUeshi5AQ2dmc0kIaZze4IxwcAeGpR2xfer2oL4HjKMTDU
         lHzFjb9JtwwPFfTzTCe17IZkQayF7IkhWBezXWkFwWdK5HK7IcVhCHe99kkts1ddkWgZ
         ZpxH5KAz0b+UJx24qAj4GWFRav7ps+WBrUcv6d5NjH93IM16tBKfwupPCeuGBvwxn2F+
         sJAa2rbwZtvObSlFJylWkEZjc7fAwQhvVsmFfZqe6/LN7c7u3f0soDXSLG1L7IOl1knC
         CQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3C9iHuFiHE/hLelyZ5mieqxqEshQNzel5N07H5HI+EY=;
        b=LZjuT1ay/H5M7MWXKok2aV3UDsy7UCXlNFsmy8+C7T1HHZXxjtf3ntg8WyI09FUbRu
         aVqptMcwli6cyDqIUgbOARgCjdwHuXnbtAqrz4W/TJwT2YcxmeuC6Dj7r7RAukyBIoI8
         p5ZTfq8OgH28d5r5TLX3+m+7KOHC58B8pI4aX8578qdJGEA9vLX/oBuHLnEzvll606zz
         W6neizZXJkooqxfgSkiikzPyB+iPt8AOFGquclYM3HwlW8ZWcalMAzJuloS71OiKn/Rd
         z5TLufWuR30veLtZaSotfUh4776cagYJVpqvClGBC2WqytdTMXyQ+rWFZUAsgtCg63mk
         yh/Q==
X-Gm-Message-State: AOAM530vjNRgeJ21db283ZuWETONlXYWOGAMPvI5BExzdYIjbedFkmdP
        fneRFbhJh3A3G4hhU6VJJsxluYKNv1w=
X-Google-Smtp-Source: ABdhPJynfKOnavEh6dV8drVTFwe67R/bPa26Pm3AZnkB9O5eYnZoB9dMUXBK1Mee6zWQXQ42ia2eaQ==
X-Received: by 2002:a9d:d12:: with SMTP id 18mr13843134oti.309.1624806066893;
        Sun, 27 Jun 2021 08:01:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z5sm2732839oth.6.2021.06.27.08.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 08:01:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Curtis Klein <curtis.klein@hpe.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1624751265-24785-1-git-send-email-curtis.klein@hpe.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: only run driver set_pretimeout op if device
 supports it
Message-ID: <42547712-88c9-b432-f049-f2db8447739d@roeck-us.net>
Date:   Sun, 27 Jun 2021 08:01:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1624751265-24785-1-git-send-email-curtis.klein@hpe.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/26/21 4:47 PM, Curtis Klein wrote:
> Some watchdog devices might conditionally support pretimeouts (e.g. if
> an interrupt is exposed for the device) but some watchdog drivers might
> still define the set_pretimeout operation (e.g. the mtk_wdt driver) and
> indicate support at runtime through the WDIOF_PRETIMEOUT flag. If the
> kernel is compiled with CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT enabled,
> watchdog_set_pretimeout would run the driver specific set_pretimeout
> even if WDIOF_PRETIMEOUT is not set which might have unintended
> consequences.
> 
> So this change checks that the device flags and only runs the driver
> operation if pretimeouts are supported.
> 
> Signed-off-by: Curtis Klein <curtis.klein@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/watchdog_dev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 3bab324..5bf795c 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -401,7 +401,7 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
>   	if (watchdog_pretimeout_invalid(wdd, timeout))
>   		return -EINVAL;
>   
> -	if (wdd->ops->set_pretimeout)
> +	if (wdd->ops->set_pretimeout && (wdd->info->options & WDIOF_PRETIMEOUT))
>   		err = wdd->ops->set_pretimeout(wdd, timeout);
>   	else
>   		wdd->pretimeout = timeout;
> 

