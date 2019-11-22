Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1919D10771B
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 19:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfKVSPQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 13:15:16 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:47016 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfKVSPQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 13:15:16 -0500
Received: by mail-ot1-f68.google.com with SMTP id n23so6922810otr.13;
        Fri, 22 Nov 2019 10:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ETqvKsN8Ki2d6xHH8hTbXwpsKjbO3HfYiexCJg5rHps=;
        b=Vz3gQ6O1BkWhfRXtLHeOZ1T4j0hc4HluEkr2GeygkgSlXNXYYls21eZu5tBmUxU+b0
         vujx+tMFlVWeq6L7c40pdigm6tdfzY+MBy430YjI91yH9k0WvHBwSELP2kByBZVikZIG
         40FJeXLCZrR2RuSbOsQxawVgBZ8YTfm36yX6kbjcsZyB0rtBH5OcPXNQrQ2mVaIxg0jI
         LLGoxqrDBzEvEVJ9Dn0joSrhUGIxdqivs5KIbC2/hIf5aeNpxRmeLJbE1uojbgcMDVn4
         eIDnamhHvrUYwjVCQmhijVLTXA7429vX9v4ZKh7JuBc6nORGyuKZZmZLF8UXPIurGpzX
         vHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ETqvKsN8Ki2d6xHH8hTbXwpsKjbO3HfYiexCJg5rHps=;
        b=UMgc70suQVASnyggBLJPpliMnVrM0mh9MUyISqgcHPt+wbtN/pR9lWy6LFvobjdUHZ
         lMzyGxnBtNuH5BLOTrHVy3f6KB4L6EevVDsMcxoJO6il1x2Nl7x/3K+mGENOBu7PiTkT
         o4u9O5cDba47jrR4pL39ThmKdgAd0LfqXHl7lw3kMxzhnhAYtTc/ACDgg/H3031bLuCD
         zhO5/tAtn1slKPqGMBwjLl2V6KO1U+S7lNy3byuNKwAeTR1+ZlVgG6LLdHkQ0RRaLhpI
         IeorIDec0vN30DshDVJGMSIGgAtW3LLuK9stijX12YpCnyTWVG40etziLpscayEfGNvR
         GILQ==
X-Gm-Message-State: APjAAAXbfHLp9nwwq6Po9wCZDXmOlu4sihI8IxHsfoTH27XeY6uZlK2R
        NEoNUXz+BrmnzOPb+PdFmLI=
X-Google-Smtp-Source: APXvYqwBL0X8maNi1+glH+XvII4//7Sep1yviT3f2IJKTzhTVDnXRxb6iMDaSdRlzAFvgdA3hxqlRg==
X-Received: by 2002:a9d:3b0:: with SMTP id f45mr4071239otf.92.1574446515684;
        Fri, 22 Nov 2019 10:15:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23sm2391977otk.73.2019.11.22.10.15.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 10:15:15 -0800 (PST)
Date:   Fri, 22 Nov 2019 10:15:13 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe Roullier <christophe.roullier@st.com>
Cc:     wim@linux-watchdog.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] drivers: watchdog: stm32_iwdg: set
 WDOG_HW_RUNNING at probe
Message-ID: <20191122181513.GF13514@roeck-us.net>
References: <20191122132246.8473-1-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122132246.8473-1-christophe.roullier@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 22, 2019 at 02:22:46PM +0100, Christophe Roullier wrote:
> If the watchdog hardware is already enabled during the boot process,
> when the Linux watchdog driver loads, it should start/reset the watchdog
> and tell the watchdog framework. As a result, ping can be generated from
> the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
> until the userspace watchdog daemon takes over control
> 
> Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v2:
> According to Guenter
> removed intermediate variable
> 
> I've tested some config and it is working as expected:
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE is not set + daemon watchdog in userland ON ==> No reset IWDG2
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE is not set ==> Reset IWDG2
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE=y ==> No reset IWDG2
> Watchdog enable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON puis OFF ==> Reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE is not set ==> No reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y ==> No reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON ==> No reset IWDG2
> Watchdog disable in Uboot + HANDLE_BOOT_ENABLE=y + daemon watchdog in userland ON puis OFF ==> Reset IWDG2
> 
> Thanks,
> Christophe
> 
>  drivers/watchdog/stm32_iwdg.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a3a329011a06..25188d6bbe15 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -262,6 +262,24 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>  	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
>  	watchdog_init_timeout(wdd, 0, dev);
>  
> +	/*
> +	 * In case of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
> +	 * (Means U-Boot/bootloaders leaves the watchdog running)
> +	 * When we get here we should make a decision to prevent
> +	 * any side effects before user space daemon will take care of it.
> +	 * The best option, taking into consideration that there is no
> +	 * way to read values back from hardware, is to enforce watchdog
> +	 * being run with deterministic values.
> +	 */
> +	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
> +		ret = stm32_iwdg_start(wdd);
> +		if (ret)
> +			return ret;
> +
> +		/* Make sure the watchdog is serviced */
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +	}
> +
>  	ret = devm_watchdog_register_device(dev, wdd);
>  	if (ret)
>  		return ret;
> -- 
> 2.17.1
> 
