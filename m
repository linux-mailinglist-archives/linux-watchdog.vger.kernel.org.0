Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC294322221
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 23:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhBVWZa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 17:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbhBVWZ3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 17:25:29 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6A6C061574;
        Mon, 22 Feb 2021 14:24:49 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id y21so3340128oou.13;
        Mon, 22 Feb 2021 14:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=C/1tnMH43nbGkpsLudAbobVdUGLdNYCWQFFBhhkg/1A=;
        b=qG24Lg4C5G7AzYZ4JTHLf6v+I8VKMh0Ejt3TmfhVmyN6SW+5NU+xdqJzw2j5j4wM+4
         gQbkIVoF1K9rR7A8PN96eaCjU0furVcoftn4HPhY1hXG8umr2gpyDzq7SBqGSX98tRCG
         OCYUXq0TU0rZeE8z1fRXtQG61bSVmMpTjZSaJiBPGkV76e9u5HzZCsXxRebkgJtrXCCb
         g2bpR1sO6bFy4fqrBLay8APZSNQ8gA7fmZFG+2L8hTwB2L/fxPfGv7guWLof5zlgjNoc
         t4kmeSnK4ZgZTSXXWnDvkXpteRkGHDMiYAHjA07c07QRERYdVWxRnvXjTKMTevUTZFi2
         4aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=C/1tnMH43nbGkpsLudAbobVdUGLdNYCWQFFBhhkg/1A=;
        b=W67oJedpXK3J/wdIDOvHnWsFX1v8Gq0YPpBQBmLk9wM1bDoUgxuDbs2LBTkUabl7kK
         UFtBwleWZzz6o+NBL4odJXBqwf1HuJXezIa/Y1OUHOZCP8ZybnJKAlHtSycXX6EIY406
         Kls0aVZ63DK9ZVvy6CyGEFwTSfrJ2zdAvmwyPBEs0p8m4w8J7a54SB09BtQKqxxDCPTT
         3+nMSGCTZH3eRa/MSDSXFJfjrBTM0s+j1D9lg8XGt3ZkHHSbhAtkyQ3+uG8CGAf0LYFc
         4n2Xc6TVifCL5ZCg3Q5qphWWGST07GmyZy7oakBW6BiSDyMZnVeebMTICmEF2Qf8TAaD
         IkqQ==
X-Gm-Message-State: AOAM5312CcPTUa8nCiXkoVtGA4CgizznYrNxd8JyYUSISAkNsF5ig8YO
        ykFtfFNtLXXc8OU/evh0X7s=
X-Google-Smtp-Source: ABdhPJwgvQEcjg0dOJI9Jkm2W9Ici6m6X9Z9H4m3ITOaGg9JdnFQxoXzTcGSfrKLgPOGkaVBzlPVuw==
X-Received: by 2002:a4a:94a7:: with SMTP id k36mr2995819ooi.45.1614032689106;
        Mon, 22 Feb 2021 14:24:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b12sm1600751otp.21.2021.02.22.14.24.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 14:24:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 22 Feb 2021 14:24:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: bcm7038_wdt: add big endian support
Message-ID: <20210222222447.GA177866@roeck-us.net>
References: <9381ef9e-a569-9bcd-5546-a48922e4961d@roeck-us.net>
 <80DB1B7E-D719-4597-A2B7-7CAD592E1B19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80DB1B7E-D719-4597-A2B7-7CAD592E1B19@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Feb 22, 2021 at 10:48:09PM +0100, Álvaro Fernández Rojas wrote:
> Hi Guenter,
> 
> > El 22 feb 2021, a las 22:24, Guenter Roeck <linux@roeck-us.net> escribió:
> > 
> > ﻿On 2/22/21 12:03 PM, Álvaro Fernández Rojas wrote:
> >> bcm7038_wdt can be used on bmips (bcm63xx) devices too.
> >> 
> > It might make sense to actually enable it for BCM63XX.
> 
> bcm63xx SoCs are supported in bcm63xx and bmips.
> bcm63xx doesn’t have device tree support, but bmips does and this watchdog is already enabled for bmips.
> 

Maybe add a note saying that this will only be supported for devicetree
based systems.

> > 
> >> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> >> ---
> >> drivers/watchdog/bcm7038_wdt.c | 30 ++++++++++++++++++++++++------
> >> 1 file changed, 24 insertions(+), 6 deletions(-)
> >> 
> >> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
> >> index 979caa18d3c8..62494da1ac57 100644
> >> --- a/drivers/watchdog/bcm7038_wdt.c
> >> +++ b/drivers/watchdog/bcm7038_wdt.c
> >> @@ -34,6 +34,24 @@ struct bcm7038_watchdog {                                 
> >> 
> >> static bool nowayout = WATCHDOG_NOWAYOUT;
> >> 
> >> +static inline void bcm7038_wdt_write(unsigned long data, void __iomem *reg)
> >> +{
> >> +#ifdef CONFIG_CPU_BIG_ENDIAN
> >> +    __raw_writel(data, reg);
> >> +#else
> >> +    writel(data, reg);
> >> +#endif
> >> +}
> >> +
> >> +static inline unsigned long bcm7038_wdt_read(void __iomem *reg)
> >> +{
> >> +#ifdef CONFIG_CPU_BIG_ENDIAN
> >> +    return __raw_readl(reg);
> >> +#else
> >> +    return readl(reg);
> >> +#endif
> >> +}
> >> +
> > 
> > This needs further explanation. Why not just use __raw_writel() and
> > __raw_readl() unconditionally ? Also, is it known for sure that,
> > say, bmips_be_defconfig otherwise uses the wrong endianness
> > (vs. bmips_stb_defconfig which is a little endian configuration) ?
> 
> Because __raw_writel() doesn’t have memory barriers and writel() does.
> Those configs use the correct endiannes, so I don’t know what you mean...
> 
So are you saying that it already works with bmips_stb_defconfig 
(because it is little endian), that bmips_stb_defconfig needs memory
barriers, and that bmips_be_defconfig doesn't need memory barriers ?
Odd, but I'll take you by your word. And other code does something
similar, so I guess there must be a reason for it.

Anyway, after looking into that other code, please use something like

        if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
                __raw_writel(value, reg);
        else
                writel(value, reg);

Thanks,
Guenter

> > 
> > Thanks,
> > Guenter
> > 
> >> static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
> >> {
> >>    struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
> >> @@ -41,15 +59,15 @@ static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
> >> 
> >>    timeout = wdt->rate * wdog->timeout;
> >> 
> >> -    writel(timeout, wdt->base + WDT_TIMEOUT_REG);
> >> +    bcm7038_wdt_write(timeout, wdt->base + WDT_TIMEOUT_REG);
> >> }
> >> 
> >> static int bcm7038_wdt_ping(struct watchdog_device *wdog)
> >> {
> >>    struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
> >> 
> >> -    writel(WDT_START_1, wdt->base + WDT_CMD_REG);
> >> -    writel(WDT_START_2, wdt->base + WDT_CMD_REG);
> >> +    bcm7038_wdt_write(WDT_START_1, wdt->base + WDT_CMD_REG);
> >> +    bcm7038_wdt_write(WDT_START_2, wdt->base + WDT_CMD_REG);
> >> 
> >>    return 0;
> >> }
> >> @@ -66,8 +84,8 @@ static int bcm7038_wdt_stop(struct watchdog_device *wdog)
> >> {
> >>    struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
> >> 
> >> -    writel(WDT_STOP_1, wdt->base + WDT_CMD_REG);
> >> -    writel(WDT_STOP_2, wdt->base + WDT_CMD_REG);
> >> +    bcm7038_wdt_write(WDT_STOP_1, wdt->base + WDT_CMD_REG);
> >> +    bcm7038_wdt_write(WDT_STOP_2, wdt->base + WDT_CMD_REG);
> >> 
> >>    return 0;
> >> }
> >> @@ -88,7 +106,7 @@ static unsigned int bcm7038_wdt_get_timeleft(struct watchdog_device *wdog)
> >>    struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
> >>    u32 time_left;
> >> 
> >> -    time_left = readl(wdt->base + WDT_CMD_REG);
> >> +    time_left = bcm7038_wdt_read(wdt->base + WDT_CMD_REG);
> >> 
> >>    return time_left / wdt->rate;
> >> }
> >> 
> > 
