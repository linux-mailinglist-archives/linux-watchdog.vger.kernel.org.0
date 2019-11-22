Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7247107019
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 12:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbfKVKpw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 05:45:52 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:44312 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729552AbfKVKpw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 05:45:52 -0500
Received: by mail-pj1-f66.google.com with SMTP id w8so2881090pjh.11;
        Fri, 22 Nov 2019 02:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2io4k/iq1gwW+3Ml4L4lOh1AzuywwhhqM/bGXIM0Dfg=;
        b=iMZkNX+PGvb23ecBpYgNQRQUaO8mtr3kGqYmRlTO9CWrFfM75lItHURi2rzgm9oq06
         r28HwxF0sYxRLtuBx3lJzz/TC+/bz8eCPuZ/ic524dTjXYTJNjf/L+nTapgjLmDUPrOC
         DZ+zu/haiL/BnkGR6wysoLGx+ryVj+yvLXp9c9D2g0G9Nwb04yo8tz1miD1VSBJumtBT
         vrDTl+2KIi2z3IMnGVfGcRjyYWPSjzLXOZqJ0+oVcxXjQ3wU7PnczHv5xratdBBiKuEN
         1hjBUbZXIBl+zHucz+0MXvvyK4a5w5vEJ1zQE48XNOTY84kQb5L8NgiAuCM47y35qCse
         h/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2io4k/iq1gwW+3Ml4L4lOh1AzuywwhhqM/bGXIM0Dfg=;
        b=ePnGGQIjy7mBioz6iOCRG6PjYtqZOMzroipTHdiHr8F7hCPmL/38KfWqSHAYSCXqUv
         8xn8C7YYDdl5GA2Nmc5q+zxpm7JeqpWGQVWS8WBJbdAuXTU+CCVK+epvt21SB/QLlDTE
         rXe5HptLJKHQ1wKebS9rMbT2AYTKVlM2hxPg4S85tibtfJNO4CveY/f4aWrJnWGpwgYN
         Ccss1PbaTEPuMGRktlJO7PZ0aZVFn1JBHS/qVdqJdeDGlTJ1FQztNezT9o13Aty33Nt4
         2LuTrO8pVYywEmolAqT2M/3JQJr19E0Eb2q8/YNwNqN2lyfhTRyP/8Y5O9kEYXxYc7G9
         CUzQ==
X-Gm-Message-State: APjAAAWe4pshzyO0yPNnHb5uR8dfvhUf5niUaLFRl77lsJiSrILscW6H
        zaOXJtTCkReh7rfU6HiKLn4=
X-Google-Smtp-Source: APXvYqxNbupSKQWXBXy0M3HLAZgGsZHVaATRyTWbQLfH0dXjq7jJ7Ve2vFUF3xJ5pA3CN94az8rCuw==
X-Received: by 2002:a17:902:d211:: with SMTP id t17mr7562415ply.141.1574419551426;
        Fri, 22 Nov 2019 02:45:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v16sm2714213pje.1.2019.11.22.02.45.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 02:45:50 -0800 (PST)
Subject: Re: [PATCH v2 1/1] drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING
 at probe
To:     Christophe Roullier <christophe.roullier@st.com>,
        wim@linux-watchdog.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20191122082442.21695-1-christophe.roullier@st.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ffa20f2f-1ca2-9d8f-6594-33b906cbb74a@roeck-us.net>
Date:   Fri, 22 Nov 2019 02:45:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122082442.21695-1-christophe.roullier@st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/22/19 12:24 AM, Christophe Roullier wrote:
> If the watchdog hardware is already enabled during the boot process,
> when the Linux watchdog driver loads, it should start/reset the watchdog
> and tell the watchdog framework. As a result, ping can be generated from
> the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
> until the userspace watchdog daemon takes over control
> 
> Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
> Changes since v1:
> According to Guenter
> I follow the guidance from intel-mid_wdt.c
> and I added test to check if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set
> because we need to be flexible (depends on customer config, but watchdog
> not always start by bootloader (Uboot, ..))
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
>   drivers/watchdog/stm32_iwdg.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a3a329011a06..7f454a6e17ba 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -50,6 +50,9 @@
>   #define TIMEOUT_US	100000
>   #define SLEEP_US	1000
>   
> +static bool handle_boot_enabled =
> +	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
> +
>   struct stm32_iwdg_data {
>   	bool has_pclk;
>   	u32 max_prescaler;
> @@ -262,6 +265,24 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>   	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
>   	watchdog_init_timeout(wdd, 0, dev);
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
> +	if (handle_boot_enabled) {

You don't need that variable. Just use
	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
directly.

> +		ret = stm32_iwdg_start(wdd);
> +		if (ret)
> +			return ret;
> +
> +		/* Make sure the watchdog is serviced */
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +	}
> +
>   	ret = devm_watchdog_register_device(dev, wdd);
>   	if (ret)
>   		return ret;
> 

