Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4B56362A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 14:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfGIMsl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 08:48:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35792 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfGIMsl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 08:48:41 -0400
Received: by mail-pl1-f196.google.com with SMTP id w24so10039159plp.2;
        Tue, 09 Jul 2019 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5AE4o0U/WCGbvWc0ylfbuwo1RhJ3ZUZDX9TulUF132o=;
        b=HlzabFAZ7RAV6zC/psU8mNfrzsaY0Hgc2bjCY2TQO0PhVLZdpVkJjOD+L3zPuHxa4z
         aoipGLXVHXbgY8kNaTZg7VlRaodW/q/UeCerGapgxq7DFYTwXqHM/nOeHimMkf0v5NUw
         5Gf5I2wuxSADjxzFXzEcM4tE0rTJZE6fsHBbw7yu5/PX39UAerBpE7ckHgYQH0qe0c6w
         9WnCQLyT9569mKuY60+xQkgy4i5+kPqWTPX+qxobiE9NFCE3pME3GUlKU7TvFonIgZK1
         h76C0tBPqQaSHnDajKVjJqEcf8iJVI7rMIWRM4spmUlIGsBFyX7O9bwes5Dctb7/TdU/
         EYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5AE4o0U/WCGbvWc0ylfbuwo1RhJ3ZUZDX9TulUF132o=;
        b=hC1jaKRU5wkLegobk3mEq6PjSyAppFc+46w9ru5V4NYKm7titx6KezeBnPPnkropjg
         z7kg5g7o3vFefvaHVovoxR/UfiOOoU2tV54vnqmY7kprGiwogd2G7/lTUCESiaWXYQ49
         5vPDiWuX1CtobfAgr+13y0S6NYQqW52sd0Kitc7sZ9oap5hiGBQKy8hjIJhcoYHM3uNS
         Lottc1RSjgkcadmDWN/SrWQQzYB9NTPs/iSQH+lMj/sgpldrcEKc7l5zOa5i1g5ADem8
         edE7/U2MZys69sfL/Dp+HuzweuYho8eWTxwTeWtEVIeWyQ84fbcLG2lLO+8XNnSLtIUM
         HYjg==
X-Gm-Message-State: APjAAAX6Jj/VBQY755on5iaI0ElFWAWVjgFLVMDPCgMoOw42ZceIV9jh
        4dU5pk3TOZgPzizTA6uFMhRjjuQE
X-Google-Smtp-Source: APXvYqw+X9GQ5WKiX1/kY2sZRv7+EwXLGKwjSCu7B2+7p4IAAS8HYIwI7HKW4PaKGNYQ5CzGeq/H8Q==
X-Received: by 2002:a17:902:9a85:: with SMTP id w5mr31966607plp.221.1562676520575;
        Tue, 09 Jul 2019 05:48:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t10sm2715448pjr.13.2019.07.09.05.48.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 05:48:39 -0700 (PDT)
Subject: Re: [PATCH RESEND] watchdog: sama5d4: fix WDD value to be always set
 to max
To:     Eugen.Hristev@microchip.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     Nicolas.Ferre@microchip.com
References: <1562656725-21468-1-git-send-email-eugen.hristev@microchip.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f24f8ea9-86ba-adbd-2ba8-9fe9de56593d@roeck-us.net>
Date:   Tue, 9 Jul 2019 05:48:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562656725-21468-1-git-send-email-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/9/19 12:26 AM, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> WDD value must be always set to max (0xFFF) otherwise the hardware
> block will reset the board on the first ping of the watchdog.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

This patch is already in -next as of today.

Guenter

> ---
>   drivers/watchdog/sama5d4_wdt.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index b8da1bf..5afe10c 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -110,9 +110,7 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
>   	u32 value = WDT_SEC2TICKS(timeout);
>   
>   	wdt->mr &= ~AT91_WDT_WDV;
> -	wdt->mr &= ~AT91_WDT_WDD;
>   	wdt->mr |= AT91_WDT_SET_WDV(value);
> -	wdt->mr |= AT91_WDT_SET_WDD(value);
>   
>   	/*
>   	 * WDDIS has to be 0 when updating WDD/WDV. The datasheet states: When
> @@ -248,7 +246,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>   
>   	timeout = WDT_SEC2TICKS(wdd->timeout);
>   
> -	wdt->mr |= AT91_WDT_SET_WDD(timeout);
> +	wdt->mr |= AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
>   	wdt->mr |= AT91_WDT_SET_WDV(timeout);
>   
>   	ret = sama5d4_wdt_init(wdt);
> 

