Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F3940C6EA
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Sep 2021 16:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233689AbhIOOCL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Sep 2021 10:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233582AbhIOOCL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Sep 2021 10:02:11 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBE5C061574;
        Wed, 15 Sep 2021 07:00:52 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id j66so4274704oih.12;
        Wed, 15 Sep 2021 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VeF5ykpJIrYoRBge05GClB9LlpH74aDunVJSP74DOhk=;
        b=lZFBvDZZuR32LEjQEnJe0pl4ZGD7VBW+0rj19QqD6P+QhuqZH7or7Rmrv53qA351Rt
         K4ZLnmBk72cIYR292HUFo8IevZKcwAwztMwUQwXcx+MJ79bX0Sub+9K+wSV+laIjgMug
         K9piXck5eV2nbuerhsHzp+afZKO3WSkxiJ8YgVwKBg+MeiJJzyE2TAlokhimsjKeUncO
         h55pXJ1ML52LauKYzS7/qRWW5LFFdirsadeAgK8fHu15WLBUMt19ClbNmqQeZPh4ft7f
         hNQ9jA64/0t6I784Vni6wxb1nDBjjG88Hq8Knk/nIKh8RV6Il0orOJOK1obI0fMxpnzH
         BXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VeF5ykpJIrYoRBge05GClB9LlpH74aDunVJSP74DOhk=;
        b=UepLR6CC9OXcD3hqvZ+RFVpQgfytyxDEWRBNYsL/SoB1+qwu31bwcGkvCOhrVF6zu7
         5hJ24tTHp3hXqI3xHHejiKHduFjDYRyZ276fciHurev5KX3OFGnJRpdJOHbidnVZYKZN
         AWGXugiGZA40Ogjt3wScCy2QorkezWepLUEeMn37Lqq2vKlQVdf2px+CW6Uzm/leBTch
         Ds4Hs8d3Wr+wWI1cp2tO+raFnCp38FU5wx89crlhQ5krGoY7M7Wfj/uopMpPYdM1ut9S
         PBr5Ru1AYNn54xi7/8yUXbjaXgd2MAqK3QCDhsJfcfJ0QNjdI20KHXL7uJBtL8K2i53W
         AVaw==
X-Gm-Message-State: AOAM531AY2yElT5N9xq1M3gbIj55MLkyC0/dSnr2PYAGUJ68z39oXEqY
        nJjEmTNYg21nNxDgX3/5Smq0opes1iQ=
X-Google-Smtp-Source: ABdhPJwXHo4JiK7F0z843f4hG4tpE5G41jMUz9U12G1D3luFb+Yzo81osZNR1wvckIjv/EiPfQqA4A==
X-Received: by 2002:a05:6808:1310:: with SMTP id y16mr5328227oiv.123.1631714451655;
        Wed, 15 Sep 2021 07:00:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o126sm27533oig.21.2021.09.15.07.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 07:00:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: rza_wdt: Use semicolons instead of commas
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <fa4451efd21e287f8fdf2f7f8495b070544209c0.1631699262.git.geert+renesas@glider.be>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f3423ef8-011c-56c1-60ed-4d8d1c64471c@roeck-us.net>
Date:   Wed, 15 Sep 2021 07:00:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fa4451efd21e287f8fdf2f7f8495b070544209c0.1631699262.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/15/21 2:48 AM, Geert Uytterhoeven wrote:
> This code works, but it is cleaner to use semicolons at the end of
> statements instead of commas.
> 
> Extracted from a big anonymous patch by Julia Lawall
> <julia.lawall@inria.fr>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/rza_wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/rza_wdt.c b/drivers/watchdog/rza_wdt.c
> index 7b6c365f7cd36297..fe6c2ed35e04cc4b 100644
> --- a/drivers/watchdog/rza_wdt.c
> +++ b/drivers/watchdog/rza_wdt.c
> @@ -189,8 +189,8 @@ static int rza_wdt_probe(struct platform_device *pdev)
>   		return -ENOENT;
>   	}
>   
> -	priv->wdev.info = &rza_wdt_ident,
> -	priv->wdev.ops = &rza_wdt_ops,
> +	priv->wdev.info = &rza_wdt_ident;
> +	priv->wdev.ops = &rza_wdt_ops;
>   	priv->wdev.parent = dev;
>   
>   	priv->cks = (u8)(uintptr_t) of_device_get_match_data(dev);
> 

