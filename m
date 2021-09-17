Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A560140F981
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 15:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240967AbhIQNsh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 09:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234565AbhIQNsg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 09:48:36 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80052C061574
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 06:47:14 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id u22so5781074oie.5
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E1F5JKNsvrVqodK1at2yCdFfdhNFaBmghRkd+1wCR5U=;
        b=nPjMIToGxpYxKiuFuoFji1AH4J0foan4PWpiNO1uBw80LL5D8g1h4vSeBdnwTKlLIN
         jnzzhOUIdA1OIfXpMhMgCgJNlMwlOcrOsooFPeoGO3chzbhPknkedubfxACJqmS4RLYB
         W04gS2aw6PQMD4jOOi8QBCpMf4Nl9pilTigEk+gLuwOUpt4Z/QHOIfq9PtR8yoU5ZYwg
         gVF/4RheuAsBWyBQWNj4/q8Jyz+uoT/mQnrjVRwQwY9az+ggVQxZXBWYq7p6hrJC1plN
         AP3y0THOlbGBGHACT2vZTOyAklNiOtw6KDXTDl7kA7RJtmsL4P5M71adKkRFcMF/1/Sv
         VVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E1F5JKNsvrVqodK1at2yCdFfdhNFaBmghRkd+1wCR5U=;
        b=ulvh69wX3Zd8ytCgirIV4fUnPAf3HKLaxc8uW/T3cewRQOA6YqFsqfVk/LHLRq+Kku
         sVlKRH6XGpyHiS0crrSzHsKbKsnrpmdhFkIeI/EO4v/Vh8myLdmAxl/RoBc1N2uaVlFX
         yvdA0EY1lyf1EU+Jx6DGknon8fX1ilBeJHKU4XIFSbUehYfwxsn8tgjRCXBs3bQmBQfZ
         sXGEWOltFYPkJrNLgP1cKAT0i8GWMMoAVu5ey7/Ngq1o80WSL5qV3QOe/0HadowbiCuW
         /arcTHsLDVsXiNrxMVqNL96W/Kh8xeseJDSrd5XSk09poqM5eYRpx469GexqFEqMn0vb
         M1MQ==
X-Gm-Message-State: AOAM533G3WV1p5P+WdPv12SiqP0XCsf+CgTZ5aVK0Z//WQSn0BGjj+D1
        dsjDTp/EUOHXy39JVk7haiJ+o6iW0v8=
X-Google-Smtp-Source: ABdhPJzs8EtcxQItK1kK4cum2SWzaO/pwDDt7Q0xhv0UXOPHqUtyGhxisBUd6Zf5HsqeBRHBKCl1bg==
X-Received: by 2002:a05:6808:1449:: with SMTP id x9mr13269420oiv.14.1631886432924;
        Fri, 17 Sep 2021 06:47:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u27sm1551836otj.6.2021.09.17.06.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 06:47:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Walter Stoll <Walter.Stoll@duagon.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <cb068bbba92347b2ab3190fda5d85ebf@chdua14.duagon.ads>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [BUG] omap_wdt.c: Watchdog not serviced by kernel
Message-ID: <49fe3ca1-2243-f007-92b2-3c2d3430417f@roeck-us.net>
Date:   Fri, 17 Sep 2021 06:47:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cb068bbba92347b2ab3190fda5d85ebf@chdua14.duagon.ads>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/17/21 1:36 AM, Walter Stoll wrote:
> Effect observed
> ---------------
> 
> We use the watchdog timer on a AM335x controller. When U-Boot runs, we enable
> the watchdog and want the kernel to service the watchdog until userspace takes
> it over.
> 
> We compile the watchdog directly into the kernel and add the parameter
> "omap_wdt.early_enable=1" to the kernel command line. We furthermore set
> "CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y" in the kernel configuration.
> 
> Our expectation is, that the watchdog is serviced by the kernel as long as
> userspace does not touch the device /dev/watchdog. However, this is not the
> case. The watchdog always expires. It is obviously not serviced by the kernel.
> 
> We observed the effect with kernel version v5.4.138-rt62. However, we think
> that the most recent kernel exhibits the same behavior because the structure of
> the sources in question (see below) did not change. This also holds for the non
> realtime kernel.
> 
> 
> Root cause
> ----------
> 
> The CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED configuration option is not implemented
> in omap_wdt.c.
> 
> 
> Fix proposal
> ------------
> 
> Interestingly we found only one single driver that implements this featrue,
> namely the driver from STM, see
> https://elixir.bootlin.com/linux/v5.4.138/source/drivers/watchdog/stm32_iwdg.c#L274
> 
> This makes us wonder if there might be a good reason not to implement it???
> 
It is primarily a watchdog core feature. Handling running watchdogs in the core
used to be enabled by default. Not everyone was happy with that, so
WATCHDOG_HANDLE_BOOT_ENABLED was added to be able to _disable_ that functionality.
It was never intended to be a driver feature. The STM driver (mis)uses it
because it wants to be able to support WDOG_HW_RUNNING, but the HW has no means
to detect if it is running. That doesn't mean that other drivers need to do
the same.

> However we think this feature should be available. Our use case is to make
> software updates more robust. If an updated kernel hangs for whatever reason,
> then U-Boot gets the chance to boot the old one provided there is a reboot.
>   
> Based on the STM implementation, we created a patch (see below) which resolves
> the issue. The watchdog is now correctly handled by the kernel until userspace
> first accesses it.
> 
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index 9b91882fe3c4..94e2e1b494d2 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -271,6 +271,11 @@ static int omap_wdt_probe(struct platform_device *pdev)
>   	if (!early_enable)
>   		omap_wdt_disable(wdev);
>   
> +	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
> +		/* Make sure the watchdog is serviced */
> +		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> +	}
> +

No, this is wrong. The driver should set WDOG_HW_RUNNING if the watchdog is running,
independently of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.

The omap_wdt driver has a boot option "early_enable" which does start the watchdog
during probe, but it doesn't set WDOG_HW_RUNNING (which is the real problem).
Plus, if early_enable is not set, the driver explicitly disables the watchdog
(see code above), and setting WDOG_HW_RUNNING would be wrong in that case.

The fix would be something like
	
         if (early_enable) {
                 omap_wdt_start(&wdev->wdog);
		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
	} else {
		omap_wdt_disable(wdev);
	}

That needs to be ahead of watchdog_register_device(), and is independent
of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.

Guenter

>   	ret = watchdog_register_device(&wdev->wdog);
>   	if (ret) {
>   		pm_runtime_disable(wdev->dev);
> 

