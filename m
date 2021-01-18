Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1084D2FAA10
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 20:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390491AbhARTZf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 14:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437098AbhARTRY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 14:17:24 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAF4C061573;
        Mon, 18 Jan 2021 11:16:44 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id w124so18759434oia.6;
        Mon, 18 Jan 2021 11:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q9SNaF7F+xlcPLZwAuzOQuyGUftd9lm+qKdV8FHj9rk=;
        b=Txd1F9ARQVCJX7pKJY2YL8jp4yBq4tj28vm9uBOCncuT6KqJJCFOyLowAxzHj+Zi/2
         dRdV3nRPdf9KtbluIWvGHz0bESqu9Gb2O23UVX/HiHs0edSPJu4U/eGfWvVcAUQXNGXU
         2i2Ie7GqmWNMlwKT2qdhB6j3I91cFh7xpGQ5dkq8Sr1Cl2r7VawkBjjtAs5tFWFXV4//
         PdswmNQectjyCOjutoVbBVLp3bDv9AyFdHdZ1mLtTwezFFE75e4H8AwveDxDhp1iGgx0
         ESJTxwyO4+3sOxQnnTGPkMW4F/s3WJDrduvr3uebz089lDM7bP1glW2696xikksHsulL
         3Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=q9SNaF7F+xlcPLZwAuzOQuyGUftd9lm+qKdV8FHj9rk=;
        b=Ck4LQ6HPs+oMIie/hkJA6mGQ5BluPdxZjp8VIKpttMrh7YGZ8lA+HKI0vIumKjjrmb
         ezBF0TjwgwKYB9zODexL6J1iwhxqDJGbbZasHV8PAwS6a5c9umRJEi+I+dxDOmvIaZa6
         26A4/77zna+p7A2BQ45hJwUdU1hpR8iga91xlcYMBkv27RvB24IbrSG7kN3G7DGxviJJ
         WlDhX7X7HXsPXOLLXLihVaEI4wB9TaCbYrqkQbPvihrg74lzoPuqj3vYrTt/SRA7lg2g
         u0y7DGsGkbwuJbm+ExwgEW/fl6SC0LvDSzMEmo2LMgfx93NbpaTFGpFbxekshD9BrlBJ
         xdkQ==
X-Gm-Message-State: AOAM5328E0H8qVlE4GktQ8zgeTG/fiVj/x9q329Xv+LB5oprpc1j/4Jf
        c7LXXStc1QSc8GtYdt1DSHpaCQKzHjI=
X-Google-Smtp-Source: ABdhPJy/8GDqFVqjwWU8iy8s0DeJDh1mtlkfnkIyly3oRcN4/UKUHXt7MitVP5Zx1AecwOxmojlNKw==
X-Received: by 2002:a05:6808:9b2:: with SMTP id e18mr532184oig.100.1610997403883;
        Mon, 18 Jan 2021 11:16:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 69sm3935841otc.76.2021.01.18.11.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 11:16:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: watchdog: watchdog_stop_on_reboot()
To:     Paul Thomas <pthomas8589@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
References: <CAD56B7eAZ0hb0kuRbALONMAgvuhHjqrShVRwf1s93ZSbv8xqww@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ba59fa3f-16e5-81aa-b3cd-86afcad2bf33@roeck-us.net>
Date:   Mon, 18 Jan 2021 11:16:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD56B7eAZ0hb0kuRbALONMAgvuhHjqrShVRwf1s93ZSbv8xqww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/18/21 9:39 AM, Paul Thomas wrote:
> Hello,
> 
> I'm going through our out-of-tree commits, and was wondering if there
> is anything to be done with this one. Basically we remove both
> watchdog_stop_on_reboot() calls (not sure why there are two to begin
> with):

Those were there from the beginning, only hand coded. One was implemented
using a shutdown notifier, one as shutdown callback. Over time both were
converted to use the watchdog API, without me or anyone else noticing
that the second call is redundant.

> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -330,7 +330,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)
> 
>         watchdog_init_timeout(cdns_wdt_device, wdt_timeout, dev);
>         watchdog_set_nowayout(cdns_wdt_device, nowayout);
> -       watchdog_stop_on_reboot(cdns_wdt_device);
>         watchdog_set_drvdata(cdns_wdt_device, wdt);
> 
>         wdt->clk = devm_clk_get(dev, NULL);
> @@ -359,7 +358,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)
> 
>         spin_lock_init(&wdt->io_lock);
> 
> -       watchdog_stop_on_reboot(cdns_wdt_device);
>         watchdog_stop_on_unregister(cdns_wdt_device);
>         ret = devm_watchdog_register_device(dev, cdns_wdt_device);
>         if (ret)
> 
> This seems to save us in certain conditions where the Software System
> Reset fails[1]. I'm not sure if there's other use cases where you
> really do want the watchdog to stop on reboot?
> 

Good question. Unfortunately I don't have an answer. I am fine with removing both.

Guenter

> This is on an arm64 Zyny Ultrascale+ platform.
> 
> -Paul
> 
> [1] The one reproducible example of the Software System Reset failing
> I have for our system is after a kernel oops from removing the
> xilinx_dma module.
> https://lore.kernel.org/lkml/CAD56B7d_9+0XuOBysxW=CADLTG_7RybBTM8hCYKSigB8ie8E_g@mail.gmail.com/
> 

