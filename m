Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1A6215A51
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jul 2020 17:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgGFPKJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jul 2020 11:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbgGFPKJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jul 2020 11:10:09 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6011C061755;
        Mon,  6 Jul 2020 08:10:08 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b92so17154866pjc.4;
        Mon, 06 Jul 2020 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eBwRBRvbZOXipdiY/rQrSNtoTZTEajJqSqQHdmUlhbM=;
        b=tV1JMNZzXHdxfvShvh6uNoSuG/8TZP2PahLCFdqv6tZSovyHysS2B/+xdShCD0LNC4
         OkkYRWzKsgb7+u82U811xXdRnHP0bv7TyYLrM1GBIo81uXGh/fVxSej52lzvV4YIXmwX
         9brlx3Zaeu6RftVgBNXY/HoaPx+Isst0Lw23OujPqbgnz6jV0mQNmr/P5KmCmtA0Beqh
         FOHcbJrL8+1hlwFLlwQ2bCAKP+vLolNUyuME4ppAd/DSuUs//QBZ/PocU8Uk5IxiKQBl
         tIDWsjA3o5RY404Pgkght1Bfpy74xLXW6bV0NUA51RUUzrl7RqARQ/+W9wA6r/NpzY8i
         mfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eBwRBRvbZOXipdiY/rQrSNtoTZTEajJqSqQHdmUlhbM=;
        b=YSBnSVWzqItCnKvt2nnsiG9gKT/67YO7mgaxDwhX6o3Tx+II7yL7oidYyRejeF3tjx
         7BGRcpKNALiVD5j9EoeKOWj9/dm0/tfzR1gYsEnLDp78Td3wx98F0t/MlL7CZtzlZ/Qv
         KmRU9G8hZQZfzjjOhR4QDMgb8GakbvZwn4oghTrvRrEnmoY6VTLC0bFvg1SlxK0hCOa0
         m8szrzgoCOMxKcMJp1zHItn5VA/IRGDQBat6io47b0I2In1MiHICwkrghxtTyQHHhzN9
         ZiI50NuYr8s4V29MKaizychmYk9ma/i5L39xWqB48uqVum0hZ7xcYcuAyJl+70qI3kXq
         tA8g==
X-Gm-Message-State: AOAM532B01XLZyFZygZ3YeBVYqASvY8TJkDboAShD/FHS17J23ZqOOzw
        XzrV3oQOkDdQV8h9oBsPGGM=
X-Google-Smtp-Source: ABdhPJyYA10lGpxfw9PSuWB0ZRBpDQ5LBoHQWODc3UVIQKefv7hkzOH3ZbtiljU3ldRUABiWfkU5vQ==
X-Received: by 2002:a17:902:7b89:: with SMTP id w9mr30340110pll.175.1594048208345;
        Mon, 06 Jul 2020 08:10:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e195sm17321997pfh.218.2020.07.06.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 08:10:07 -0700 (PDT)
Subject: Re: [PATCH 1/1] watchdog: Add common nowayout parameter to booke_wdt
 driver
To:     Timothy Myers <timothy.myers@adtran.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Boike <david.boike@adtran.com>
References: <CH2PR19MB3590AFAC86BA1697956EAD1C9D690@CH2PR19MB3590.namprd19.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6b24e27b-c47a-8fd3-179b-761fb53f02b0@roeck-us.net>
Date:   Mon, 6 Jul 2020 08:10:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CH2PR19MB3590AFAC86BA1697956EAD1C9D690@CH2PR19MB3590.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/6/20 7:13 AM, Timothy Myers wrote:
> Add the common "nowayout" parameter to booke_wdt to make this behavior
> selectable at runtime and to make the implementation more consistent with
> many other watchdog drivers.
> 
> Signed-off-by: Timothy Myers <timothy.myers@adtran.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

The added Reviewed-by: makes it v2.

Anyway, your patch is whitespace corrupted.

ERROR: code indent should use tabs where possible
#36: FILE: drivers/watchdog/booke_wdt.c:45:
+               "Watchdog cannot be stopped once started (default="$

WARNING: please, no spaces at the start of a line
#36: FILE: drivers/watchdog/booke_wdt.c:45:
+               "Watchdog cannot be stopped once started (default="$

ERROR: code indent should use tabs where possible
#37: FILE: drivers/watchdog/booke_wdt.c:46:
+                               __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");$

WARNING: please, no spaces at the start of a line
#37: FILE: drivers/watchdog/booke_wdt.c:46:
+                               __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");$

That explains a lot. I guess it is corrupted so badly that patchwork
doesn't recognize it as patch. Sorry, won't be able to apply it.
Please send a non-corrupted version.

Guenter

> ---
>  drivers/watchdog/booke_wdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/booke_wdt.c b/drivers/watchdog/booke_wdt.c
> index 9d09bbfdef20..7817fb976f9c 100644
> --- a/drivers/watchdog/booke_wdt.c
> +++ b/drivers/watchdog/booke_wdt.c
> @@ -39,6 +39,11 @@ static bool booke_wdt_enabled;
>  module_param(booke_wdt_enabled, bool, 0);
>  static int  booke_wdt_period = CONFIG_BOOKE_WDT_DEFAULT_TIMEOUT;
>  module_param(booke_wdt_period, int, 0);
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +               "Watchdog cannot be stopped once started (default="
> +                               __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> 
>  #ifdef CONFIG_PPC_FSL_BOOK3E
> 
> @@ -215,7 +220,6 @@ static void __exit booke_wdt_exit(void)
>  static int __init booke_wdt_init(void)
>  {
>         int ret = 0;
> -       bool nowayout = WATCHDOG_NOWAYOUT;
> 
>         pr_info("powerpc book-e watchdog driver loaded\n");
>         booke_wdt_info.firmware_version = cur_cpu_spec->pvr_value;
> 
> base-commit: dd0d718152e4c65b173070d48ea9dfc06894c3e5
> --
> 2.20.1
> 
> 
> 
> *Timothy Myers*
> Software Design Engineer
> 
> Office: 256.963.8844
> 
> ADTRAN
> 901 Explorer Boulevard 
> Huntsville, AL 35806 - USA

