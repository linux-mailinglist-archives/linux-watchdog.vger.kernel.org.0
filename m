Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D571443FABC
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 12:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbhJ2KeA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 06:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbhJ2Kd7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 06:33:59 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA164C061570
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 03:31:31 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id n63so12716352oif.7
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UE+WMr3PzDveo4BKXcZvE97geWeu78Cf4p0PJL7bGnU=;
        b=Jmx8qMv+NA/NOvMEuVMkq8cBXxeZtfdNv5Zk8BWr0UYUoDLIYklsTiPi2ou2lbiHF2
         PyJ/YdMpFL5kobQHPz1VUSmUwR8kEtTYySph4GscjIT7FpaFJ2hN5t2c6FazNDueCO9r
         Enab5p8CXKctzApOJ5zT8f+SRrAJs8pB885T1lSAd98ccHRtBjbXIRk/l/s3bbSNawOY
         hafsXYyIO7yPPMgEGQpmgDNYXbNRXwHSmEXqJbJn3arTlCJoyrbIT6/+rg0P9CIPkGF+
         VgUUN9so1YyE3V+MEnlHikx7WAoK3WCZwtA+n6WVWvKIH5Bqvgy2I2/MN3dR8UlDBnpJ
         Z5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=UE+WMr3PzDveo4BKXcZvE97geWeu78Cf4p0PJL7bGnU=;
        b=XLmidkcQ8krFEcP0pxqfG6ZuRxl86llEP670OgDpFP6mDsnfJouYxcqXef3tMCuUZn
         4+rTCFleW3b5VHrXfGtpoKGmm13l5cWrDYWR/nSn+tuAnuslnL/e5ABPCrdZulGs7l0X
         ohecnx9s/wcXe3uig5ovgs2VDOuuUKLVqS+NMTtoT1k8UajfaBf8Sy6Z0aBxivFbbq4A
         HbTlIOMK+omZDMBAhwpz1hpkCWcHgIJmD0XnDog9gsoxHTiYCNHu9e9XBAgIr9/yxbZw
         DEpZRV9KSN9jLLF4jSSo+9G5j4DUzUyc11hS5f3EwE6Xc+nVXXAwRuu0uTrp/XvWXtzR
         RBAw==
X-Gm-Message-State: AOAM530ngaJz/k6GykUu+nvCRfDPx0GXPOOg7kM7lLyyL21tLuVZEOBw
        85sZowjw/ZJnCnhkOyvZ4uaJ9IKBpMc=
X-Google-Smtp-Source: ABdhPJwBbhP2m8lq9faUM86/SKqSrUEA8LHg8PdmFhvP51DhFSpJnS3YTbO9dKBjd5PCao0LunJ8Jw==
X-Received: by 2002:aca:b4c4:: with SMTP id d187mr12462377oif.66.1635503491112;
        Fri, 29 Oct 2021 03:31:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2sm1616022ooh.40.2021.10.29.03.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 03:31:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 29 Oct 2021 03:31:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] watchdog: ux500_wdt: Drop platform data
Message-ID: <20211029103128.GA3165629@roeck-us.net>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922230947.1864357-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 23, 2021 at 01:09:45AM +0200, Linus Walleij wrote:
> Drop the platform data passing from the PRCMU driver. This platform
> data was part of the ambition to support more SoCs, which in turn
> were never mass produced.
> 
> Only a name remains of the MFD cell so switch to MFD_CELL_NAME().
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Lee: it'd be prefect if you could ACK this so the watchdog people
> can merge it, it shouldn't collide with any other changes to
> the PRCMU driver.

Still waiting for an Ack from Lee to be able to apply this patch
(and with it the rest of the series) through the watchdog tree.

Guenter

> ---
>  drivers/mfd/db8500-prcmu.c              | 13 +------------
>  drivers/watchdog/ux500_wdt.c            | 13 ++-----------
>  include/linux/platform_data/ux500_wdt.h | 18 ------------------
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 include/linux/platform_data/ux500_wdt.h
> 
> diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
> index c1d3e7c116cf..ccf6be922b39 100644
> --- a/drivers/mfd/db8500-prcmu.c
> +++ b/drivers/mfd/db8500-prcmu.c
> @@ -36,7 +36,6 @@
>  #include <linux/mfd/abx500/ab8500.h>
>  #include <linux/regulator/db8500-prcmu.h>
>  #include <linux/regulator/machine.h>
> -#include <linux/platform_data/ux500_wdt.h>
>  #include "db8500-prcmu-regs.h"
>  
>  /* Index of different voltages to be used when accessing AVSData */
> @@ -2939,18 +2938,8 @@ static struct regulator_init_data db8500_regulators[DB8500_NUM_REGULATORS] = {
>  	},
>  };
>  
> -static struct ux500_wdt_data db8500_wdt_pdata = {
> -	.timeout = 600, /* 10 minutes */
> -	.has_28_bits_resolution = true,
> -};
> -
>  static const struct mfd_cell common_prcmu_devs[] = {
> -	{
> -		.name = "ux500_wdt",
> -		.platform_data = &db8500_wdt_pdata,
> -		.pdata_size = sizeof(db8500_wdt_pdata),
> -		.id = -1,
> -	},
> +	MFD_CELL_NAME("ux500_wdt"),
>  	MFD_CELL_NAME("db8500-cpuidle"),
>  };
>  
> diff --git a/drivers/watchdog/ux500_wdt.c b/drivers/watchdog/ux500_wdt.c
> index 072758106865..40f8cf1cb234 100644
> --- a/drivers/watchdog/ux500_wdt.c
> +++ b/drivers/watchdog/ux500_wdt.c
> @@ -15,7 +15,6 @@
>  #include <linux/uaccess.h>
>  #include <linux/watchdog.h>
>  #include <linux/platform_device.h>
> -#include <linux/platform_data/ux500_wdt.h>
>  
>  #include <linux/mfd/dbx500-prcmu.h>
>  
> @@ -23,7 +22,6 @@
>  
>  #define WATCHDOG_MIN	0
>  #define WATCHDOG_MAX28	268435  /* 28 bit resolution in ms == 268435.455 s */
> -#define WATCHDOG_MAX32	4294967 /* 32 bit resolution in ms == 4294967.295 s */
>  
>  static unsigned int timeout = WATCHDOG_TIMEOUT;
>  module_param(timeout, uint, 0);
> @@ -80,22 +78,15 @@ static struct watchdog_device ux500_wdt = {
>  	.info = &ux500_wdt_info,
>  	.ops = &ux500_wdt_ops,
>  	.min_timeout = WATCHDOG_MIN,
> -	.max_timeout = WATCHDOG_MAX32,
> +	.max_timeout = WATCHDOG_MAX28,
>  };
>  
>  static int ux500_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	int ret;
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
>  	ux500_wdt.parent = dev;
>  	watchdog_set_nowayout(&ux500_wdt, nowayout);
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
