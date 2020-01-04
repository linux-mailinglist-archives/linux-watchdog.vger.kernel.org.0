Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8747013039E
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Jan 2020 17:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgADQef (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Jan 2020 11:34:35 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34515 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgADQef (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Jan 2020 11:34:35 -0500
Received: by mail-pf1-f195.google.com with SMTP id i6so18066342pfc.1;
        Sat, 04 Jan 2020 08:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MbFMvcyfRTSbApxaJ7kNdPBdJTnon+lDkMoB+BvWA4k=;
        b=AfR7J0godkUXY4K+YuYxGPg4m4E+1UOYv5RAYUyN1Q0ySQ2jIu3Fr8eDJY1+GrJ/1q
         YC91es8lWjTQM4zwXqquOY1C1RGLIvk6GZNaaK4K3tvPI5w3pqtcl3J3RKKVZ3qQ0Mqn
         KGYRONVxlkUufEd9daj6CcNP3bbRwqEpNPWVmDSODJa9VkO/0ZXWKM4hCx0Qe7wiJCaU
         MIqpLQY3Sw/KrGj/Z5hcfLiOBMV8RPIKMtoS0EGETsAYrafX9wCFugMAIVSa/Xip82wx
         ox9sEB9c5xVhHyxR9/t1Afuhi3eeE5iumfaHLCm3RJXxSBg7MCdd+bG/rJC0Jhzdtshl
         3xVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MbFMvcyfRTSbApxaJ7kNdPBdJTnon+lDkMoB+BvWA4k=;
        b=sf54mwBQ1kLikJBBjcldoqwIubrWe16e/jMMOnxN4yNlb3PqpBoW0usvox9eLXUJ/1
         POUsYLxE8f7cr2s+XGeFXlqrg8KfcoZbUnLuE+LGPr0mwNiiiDbnnWHA6XLNKoRESQ2e
         H8Ae0c5f/G+/Mq1kxuZF7CrIHZ1QKwJumNcf4k21u62MVuPgQlZJN3MYF9mzpg32T7Om
         t6wtqtsKKvU3852enlzcM5Rsj++NJo38q1fsbyUF31rftZM1eKf/0Oeco8thPuwe3p90
         6DzDgsw2FXymHvXhsGn5wRKhKuNJ+TJNT6Xl+P9ytN7wiel0QJDriHghTe3vak8uPOts
         pyQw==
X-Gm-Message-State: APjAAAWNzwtzAWF4bOr1+7DkKvmCSfwKQJR+SXwSdPux7g0IyaLpFgTo
        EX56u859MZLFfB1wQezxLJZhbmLF
X-Google-Smtp-Source: APXvYqz7yIBoySqYozTfFfz7Xi5SUtsBxPolE4yAqGHAhdPrf5a0qC9AJeLUgj6aXT7H86R55czxZw==
X-Received: by 2002:a63:1344:: with SMTP id 4mr104733097pgt.0.1578155674818;
        Sat, 04 Jan 2020 08:34:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p23sm67604015pgh.83.2020.01.04.08.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2020 08:34:34 -0800 (PST)
Subject: Re: [PATCH] watchdog: cadence: Skip printing pointer value
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>, shubhraj@xilinx.com,
        sgoud@xilinx.com, michal.simek@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@xilinx.com
References: <1576825096-26605-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0d96e336-7280-edbd-7ce4-8307e7e0f1c1@roeck-us.net>
Date:   Sat, 4 Jan 2020 08:34:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1576825096-26605-1-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/19/19 10:58 PM, Srinivas Neeli wrote:
> "%p" is not printing the pointer value.
> In driver, printing pointer value is not useful so avoiding print.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/cadence_wdt.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 06bd4e1a5923..672b184da875 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -369,9 +369,8 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>   		return ret;
>   	platform_set_drvdata(pdev, wdt);
>   
> -	dev_info(dev, "Xilinx Watchdog Timer at %p with timeout %ds%s\n",
> -		 wdt->regs, cdns_wdt_device->timeout,
> -		 nowayout ? ", nowayout" : "");
> +	dev_info(dev, "Xilinx Watchdog Timer with timeout %ds%s\n",
> +		 cdns_wdt_device->timeout, nowayout ? ", nowayout" : "");
>   
>   	return 0;
>   }
> 

