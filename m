Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E925105444
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 15:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfKUOV3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 09:21:29 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36400 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKUOV3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 09:21:29 -0500
Received: by mail-pl1-f195.google.com with SMTP id d7so1645273pls.3;
        Thu, 21 Nov 2019 06:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=advO9e9Vq8oX5pUg5eqAZ8hMHDIBv+K1uEoGcfdp6Pg=;
        b=Q/BiBo5hxPoRt7be6VMJbLczAnhSIy2lPWLssuK4UBRdiypufvszol2d35aiqoLm5B
         SnKaYGix1iSdFR4Z0iQBRcoWRRlWgS/LX1T6OfxQc3J0zhILkVpifvNiTb+y+rfbDm0w
         ftICNsoRSXB+p/53aKCBsZkAQSeFLuZGwKG7uzTDMnpCiIguML0XbtgPDbEfn2KTgui9
         mJJTt8oyI2BtuJmRycEYuvd+Hz+5Dxb4VKgYRsIZip1h8tBA1E3la98IQ4r4pfkT961c
         kPFz98ibRpZdmkkrQD717+Xw7H+1b3wOmfc3GyB3eIe907cuW8Umfblwh4MtaukzCmZe
         r4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=advO9e9Vq8oX5pUg5eqAZ8hMHDIBv+K1uEoGcfdp6Pg=;
        b=AtNaeCqTI0eYme7jphPL2LWZkak2y85O2wjRq4dE+u2R1lQsZUE3pcZAPPRAxFJK4m
         pM4XAuv+fmtnRYCODsFc9CEEn2n6hRkseXJGu/oZoCnqy2+TpdikPZ/slGgd6gMwt9x6
         NdtUlQKmUR6ZY0bQZS9vPSxVTusDAZYMMZDYPemh4PfDx93IovfLDt+5WoV99YUtzkhd
         DY2uxVtnGmr5C7LAhB6IPsMKfRe8r6tlYoIbzF+pF99qtUe4mNAdi2EGGB0nJd/ksnbJ
         2DdxnXpXhKVHe0SgLtVsd51prI3rFjnsM/8kYRfsN3NK4gTB5YI7U6m3he/girt7r1KU
         Q86w==
X-Gm-Message-State: APjAAAVeRFOpW8E519MVva1UdagqAUGDN2rbI2XqppZlJvaIAIwK5Ccl
        yaYr8saqSTgkopWjUlBnV1I=
X-Google-Smtp-Source: APXvYqxJTWh2kG8FI80v+Upz1ZQtluio58NfbwFL3EB19Ri9bUOi5lj878945BYaiTM4NAZUFidO8g==
X-Received: by 2002:a17:902:9043:: with SMTP id w3mr9308463plz.30.1574346088100;
        Thu, 21 Nov 2019 06:21:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m34sm3321136pgb.26.2019.11.21.06.21.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 06:21:27 -0800 (PST)
Date:   Thu, 21 Nov 2019 06:21:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe ROULLIER <christophe.roullier@st.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING
 at probe
Message-ID: <20191121142126.GB13249@roeck-us.net>
References: <20191121082813.29267-1-christophe.roullier@st.com>
 <20191121082813.29267-2-christophe.roullier@st.com>
 <ce10681c-8fa3-0fa6-3509-376a2f37aec9@roeck-us.net>
 <550566ff-31bd-1f40-63d1-67b013f8be75@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <550566ff-31bd-1f40-63d1-67b013f8be75@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 21, 2019 at 01:45:21PM +0000, Christophe ROULLIER wrote:
> Hi Guenter,
> 
> On 11/21/19 10:53 AM, Guenter Roeck wrote:
> > On 11/21/19 12:28 AM, Christophe Roullier wrote:
> >> If the watchdog hardware is already enabled during the boot process,
> >> when the Linux watchdog driver loads, it should reset the watchdog and
> >> tell the watchdog framework. As a result, ping can be generated from
> >> the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
> >> until the userspace watchdog daemon takes over control
> >>
> >
> > This is not what the code is doing. It sets the WDOG_HW_RUNNING flag
> > unconditionally, no matter if the watchdog is already running or not.
> > It also changes the semantic of the rest of the code, as well as
> > functionality. The code in start_timeout no longer waits, and the ping
> > code explicitly (re-)enables the watchdog.
> >
> > If you want an option to start the watchdog at probe time 
> > unconditionally,
> > please add a module parameter to do it. Otherwise you'll need to check if
> > it is indeed enabled before setting WDOG_HW_RUNNING, and in that case it
> > should not be necessary to re-enable it. It should also not be necessary
> > to split the start function.
> 
> With our IWDG IP, there is no way to read values from hardware (if it is 
> running or not)
> 
> We are in same case of intel-mid_wdt.c driver, we have Uboot which can
> 
> leaves the watchdog running. So we need to force the kicking of our 
> watchdog.
> 

"can" or "leaves" ? 

Anyway, if that is the case, please follow the guidance from intel-mid_wdt.c,
and explain it accordingly. Alternatively, please explain why something like

	ret = wdt_start(wdt_dev);
        if (ret)
                return ret;

	/* Make sure the watchdog is serviced */
        set_bit(WDOG_HW_RUNNING, &wdt_dev->status);

would not work in your case, and why all that added complexity
is needed.

Thanks,
Guenter

> Thanks
> 
> Christophe
> 
> >
> > Thanks,
> > Guenter
> >
> >> Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
> >> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> >> ---
> >>   drivers/watchdog/stm32_iwdg.c | 57 ++++++++++++++++++++++++-----------
> >>   1 file changed, 40 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/stm32_iwdg.c 
> >> b/drivers/watchdog/stm32_iwdg.c
> >> index a3a329011a06..2b3be3b1c15b 100644
> >> --- a/drivers/watchdog/stm32_iwdg.c
> >> +++ b/drivers/watchdog/stm32_iwdg.c
> >> @@ -87,8 +87,23 @@ static inline void reg_write(void __iomem *base, 
> >> u32 reg, u32 val)
> >>   static int stm32_iwdg_start(struct watchdog_device *wdd)
> >>   {
> >>       struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
> >> -    u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
> >> -    int ret;
> >> +
> >> +    dev_dbg(wdd->parent, "%s\n", __func__);
> >> +
> >> +    /*  Start the watchdog */
> >> +    reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> >> +
> >> +    /* reload watchdog */
> >> +    reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
> >> +
> >> +    set_bit(WDOG_HW_RUNNING, &wdd->status);
> >> +    return 0;
> >> +}
> >> +
> >> +static int stm32_iwdg_setprescaler(struct watchdog_device *wdd)
> >> +{
> >> +    struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
> >> +    u32 tout, presc, iwdg_rlr, iwdg_pr;
> >>         dev_dbg(wdd->parent, "%s\n", __func__);
> >>   @@ -108,19 +123,6 @@ static int stm32_iwdg_start(struct 
> >> watchdog_device *wdd)
> >>       /* set prescaler & reload registers */
> >>       reg_write(wdt->regs, IWDG_PR, iwdg_pr);
> >>       reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
> >> -    reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> >> -
> >> -    /* wait for the registers to be updated (max 100ms) */
> >> -    ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
> >> -                     !(iwdg_sr & (SR_PVU | SR_RVU)),
> >> -                     SLEEP_US, TIMEOUT_US);
> >> -    if (ret) {
> >> -        dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
> >> -        return ret;
> >> -    }
> >> -
> >> -    /* reload watchdog */
> >> -    reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
> >>         return 0;
> >>   }
> >> @@ -131,6 +133,9 @@ static int stm32_iwdg_ping(struct watchdog_device 
> >> *wdd)
> >>         dev_dbg(wdd->parent, "%s\n", __func__);
> >>   +    /*  Start the watchdog */
> >> +    reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> >> +
> >>       /* reload watchdog */
> >>       reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
> >>   @@ -140,12 +145,21 @@ static int stm32_iwdg_ping(struct 
> >> watchdog_device *wdd)
> >>   static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
> >>                     unsigned int timeout)
> >>   {
> >> +    int ret;
> >> +
> >>       dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__, timeout);
> >>         wdd->timeout = timeout;
> >>   -    if (watchdog_active(wdd))
> >> -        return stm32_iwdg_start(wdd);
> >> +    if (watchdog_active(wdd)) {
> >> +        ret = stm32_iwdg_setprescaler(wdd);
> >> +        if (ret) {
> >> +            dev_err(wdd->parent, "failed to set prescaler\n");
> >> +            return ret;
> >> +        } else {
> >> +            return stm32_iwdg_start(wdd);
> >> +        }
> >> +    }
> >>         return 0;
> >>   }
> >> @@ -262,12 +276,21 @@ static int stm32_iwdg_probe(struct 
> >> platform_device *pdev)
> >>       watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
> >>       watchdog_init_timeout(wdd, 0, dev);
> >>   +    /* Make sure the watchdog is serviced */
> >> +    set_bit(WDOG_HW_RUNNING, &wdd->status);
> >> +
> >>       ret = devm_watchdog_register_device(dev, wdd);
> >>       if (ret)
> >>           return ret;
> >>         platform_set_drvdata(pdev, wdt);
> >>   +    ret = stm32_iwdg_setprescaler(wdd);
> >> +    if (ret) {
> >> +        dev_err(dev, "failed to set prescaler\n");
> >> +        return ret;
> >> +    }
> >> +
> >>       return 0;
> >>   }
> >>
> >
