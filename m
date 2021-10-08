Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB67426B24
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Oct 2021 14:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241522AbhJHMvK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Oct 2021 08:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhJHMvK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Oct 2021 08:51:10 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311E1C061570
        for <linux-watchdog@vger.kernel.org>; Fri,  8 Oct 2021 05:49:15 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id w10-20020a056830280a00b0054e4e6c85a6so2527889otu.5
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Oct 2021 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ghiJKLFqrvKiIKMshQDTxWmnzSrWCJHgIsmxHLsj+80=;
        b=G98IVAGB+O5iDMztEInGZ0UXd5T9sUQ7COFiElmzxBeye49ftkXvuJdeOtIVYkGog/
         ughbNbUt2BzdpenrOPik9/xY9AJTbl00gLFfOcREKr4EQQuDbGOu2IWRLKLsC1T6Rbbd
         Fs2JKyspK3kZtpTIxuUvTud7Cpyngfy4CUG6CndRtJie7dKaJA4PGyiGokRMzU9tOwmX
         lybzG4G4uvMOMh66egEAX+fJ3olWD6VAIayPeNRd4zRrhrs588FohpZiRWNrFjWdI4Ie
         Cly5r0+BtzeUNoJ0GqSkr6ZkvXEVPJmp61T/RAXBEN2lkavLVcEV7nMszo3b43Rr8DYQ
         IkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ghiJKLFqrvKiIKMshQDTxWmnzSrWCJHgIsmxHLsj+80=;
        b=s78EDRD+BQDRDfpTKZPmlj8yeiP9/KTW6Eb9tlwIPITot9Yk4KEx/rgTHDCPUq7T0R
         Xk3yZNHkWm9X/Jg323j1WjwHqJFEgDRFiR3vbAV4Qj/RTHrspJHwlnPfHKM5ROKJiZxO
         j4XWrVqusE0pn3uiVlny7DJTsubs12DD0/wAzGT3UzaZOJPm4LDOl5sw8LZKV9+bw+Cf
         X0OooQ2pNwHGBZiGw911IbnenFW1uOg6z/0/ZgmrIc+uR2hZTGs1KTALRu88XNB1MOOv
         XNE1lWMXOdBDuWTKjNPSqKYvsm/yh26D9HLTcClweZg7CDRu2QiFU0dJX1a91XbUNasf
         +6rw==
X-Gm-Message-State: AOAM530LTlDhetVplOGFSRytGnrKRoeMBKGjlIiZVOp0f47dC2pes/q3
        aHe7T4faLO+KCxy8f0Y0XhKq/JstjT0=
X-Google-Smtp-Source: ABdhPJw+CsmJtyy+lyOuC7TWaUYh1J8lVVcuKT+e+ZGok9aBo7SfvpwsLHMPLBa2lii6Zj2csK5mtA==
X-Received: by 2002:a05:6830:2409:: with SMTP id j9mr8271499ots.178.1633697354435;
        Fri, 08 Oct 2021 05:49:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o2sm507263otl.34.2021.10.08.05.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 05:49:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] watchdog: ux500_wdt: Drop platform data
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a548fea1-5975-37bb-b006-6d2c96eff9ca@roeck-us.net>
Date:   Fri, 8 Oct 2021 05:49:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922230947.1864357-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/22/21 4:09 PM, Linus Walleij wrote:
> Drop the platform data passing from the PRCMU driver. This platform
> data was part of the ambition to support more SoCs, which in turn
> were never mass produced.
> 
> Only a name remains of the MFD cell so switch to MFD_CELL_NAME().
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Lee: it'd be prefect if you could ACK this so the watchdog people
> can merge it, it shouldn't collide with any other changes to
> the PRCMU driver.
> ---
>   drivers/mfd/db8500-prcmu.c              | 13 +------------
>   drivers/watchdog/ux500_wdt.c            | 13 ++-----------
>   include/linux/platform_data/ux500_wdt.h | 18 ------------------
>   3 files changed, 3 insertions(+), 41 deletions(-)
>   delete mode 100644 include/linux/platform_data/ux500_wdt.h
> 
> diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
> index c1d3e7c116cf..ccf6be922b39 100644
> --- a/drivers/mfd/db8500-prcmu.c
> +++ b/drivers/mfd/db8500-prcmu.c
> @@ -36,7 +36,6 @@
>   #include <linux/mfd/abx500/ab8500.h>
>   #include <linux/regulator/db8500-prcmu.h>
>   #include <linux/regulator/machine.h>
> -#include <linux/platform_data/ux500_wdt.h>
>   #include "db8500-prcmu-regs.h"
>   
>   /* Index of different voltages to be used when accessing AVSData */
> @@ -2939,18 +2938,8 @@ static struct regulator_init_data db8500_regulators[DB8500_NUM_REGULATORS] = {
>   	},
>   };
>   
> -static struct ux500_wdt_data db8500_wdt_pdata = {
> -	.timeout = 600, /* 10 minutes */
> -	.has_28_bits_resolution = true,
> -};
> -
>   static const struct mfd_cell common_prcmu_devs[] = {
> -	{
> -		.name = "ux500_wdt",
> -		.platform_data = &db8500_wdt_pdata,
> -		.pdata_size = sizeof(db8500_wdt_pdata),
> -		.id = -1,
> -	},
> +	MFD_CELL_NAME("ux500_wdt"),
>   	MFD_CELL_NAME("db8500-cpuidle"),
>   };
>   
> diff --git a/drivers/watchdog/ux500_wdt.c b/drivers/watchdog/ux500_wdt.c
> index 072758106865..40f8cf1cb234 100644
> --- a/drivers/watchdog/ux500_wdt.c
> +++ b/drivers/watchdog/ux500_wdt.c
> @@ -15,7 +15,6 @@
>   #include <linux/uaccess.h>
>   #include <linux/watchdog.h>
>   #include <linux/platform_device.h>
> -#include <linux/platform_data/ux500_wdt.h>
>   
>   #include <linux/mfd/dbx500-prcmu.h>
>   
> @@ -23,7 +22,6 @@
>   
>   #define WATCHDOG_MIN	0
>   #define WATCHDOG_MAX28	268435  /* 28 bit resolution in ms == 268435.455 s */
> -#define WATCHDOG_MAX32	4294967 /* 32 bit resolution in ms == 4294967.295 s */
>   
>   static unsigned int timeout = WATCHDOG_TIMEOUT;
>   module_param(timeout, uint, 0);
> @@ -80,22 +78,15 @@ static struct watchdog_device ux500_wdt = {
>   	.info = &ux500_wdt_info,
>   	.ops = &ux500_wdt_ops,
>   	.min_timeout = WATCHDOG_MIN,
> -	.max_timeout = WATCHDOG_MAX32,
> +	.max_timeout = WATCHDOG_MAX28,
>   };
>   
>   static int ux500_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	int ret;
> -	struct ux500_wdt_data *pdata = dev_get_platdata(dev);
> -
> -	if (pdata) {
> -		if (pdata->timeout > 0)
> -			timeout = pdata->timeout;
> -		if (pdata->has_28_bits_resolution)
> -			ux500_wdt.max_timeout = WATCHDOG_MAX28;
> -	}
>   
> +	timeout = 600; /* Default to 10 minutes */
>   	ux500_wdt.parent = dev;
>   	watchdog_set_nowayout(&ux500_wdt, nowayout);
>   
> diff --git a/include/linux/platform_data/ux500_wdt.h b/include/linux/platform_data/ux500_wdt.h
> deleted file mode 100644
> index de6a4ad41e76..000000000000
> --- a/include/linux/platform_data/ux500_wdt.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) ST Ericsson SA 2011
> - *
> - * STE Ux500 Watchdog platform data
> - */
> -#ifndef __UX500_WDT_H
> -#define __UX500_WDT_H
> -
> -/**
> - * struct ux500_wdt_data
> - */
> -struct ux500_wdt_data {
> -	unsigned int timeout;
> -	bool has_28_bits_resolution;
> -};
> -
> -#endif /* __UX500_WDT_H */
> 

