Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C4F1BCF64
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Apr 2020 00:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgD1WFU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 18:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725934AbgD1WFU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 18:05:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D71C03C1AC;
        Tue, 28 Apr 2020 15:05:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a32so100817pje.5;
        Tue, 28 Apr 2020 15:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z4c4XHLNxK71Q6+EZ8KzDjbiwbFtdyK+ghGeLHVUgoE=;
        b=A9XEUY6bgDwfKo+231A6FmRC4co4JYjiJEwmSpt4sgQx9V09GC6WVqziQ1Bcsa7cfj
         bcyk226E/jwzyL43CCwTJups8gLE6bEicN2wdvEHiSjmeQujudpEpPFZYYXvw8YLR/ly
         I5VqJPrKfdyf3so2yoaKLKzt+cJ1ELi60KaI+numwdQS1A7FUXcmw7/QhEjm9RxMyuoe
         FW7Ddl9iyIafCgRXKBD5H53Xtzsu2koQdkQvCoMPecMKecr2Bcz0YfSNThWofqSwpe6T
         P56xgbqLK3APGG5mTTF8jhGNEkrlgBhMgk6/7VupJSXRDg+Li1S1q0ZmGcCHg7lquD7c
         53oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z4c4XHLNxK71Q6+EZ8KzDjbiwbFtdyK+ghGeLHVUgoE=;
        b=j10t/L2BRwlkA/45EnHuLvlC0Tz/mYKYngNL9nXDqBE3BhPzSE9VaRiu37hBoQIAWl
         L3jThdkRxF4jvzWlbRwgm9lj4SeLMkbYdvlE/DoSczHrOJ8yWrTLUiXK6AvL8jOWPJW9
         OYb1dBAee40p+uxpkaP/iRJsGHdhhQkQiSDD5X+FL9u6WshsLadyUFT+y0AtMW67dwxp
         Wanb2JBsAdR8P727lNSPsMJp4ojE7gvIu6BfBLtekRuel8yEsxzGKvJuKJm0qvDvss6l
         e09uUULYzpWVJixEJolvk5Pp+dJBFCMi/Qr+6uncmKHXy0t+RCucLtzvSSS1Cdr8yGEI
         uDGA==
X-Gm-Message-State: AGi0PuauOEoRKleb7aNuuHSdz8NuzpIysTEjF3Xvj7Aw90LrEbbFtnFI
        gwnZ1rYBC6BXqLoQNu+t5/JUSYm8YibTFj3ouNM=
X-Google-Smtp-Source: APiQypKlEARfbXLp1HXPh5c1a/44apf7u3aabai4GVf4uhBsovU6BaUwf4OGJCS0ALrzwkHlGJj5x9WRDzDfd7E9IF8=
X-Received: by 2002:a17:902:d697:: with SMTP id v23mr28755150ply.262.1588111519805;
 Tue, 28 Apr 2020 15:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200428212959.2993304-1-arnd@arndb.de>
In-Reply-To: <20200428212959.2993304-1-arnd@arndb.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Apr 2020 01:05:08 +0300
Message-ID: <CAHp75Vd0shZi3JA0cK9wVfRm1vZuKye_-eAhXYf-dYqA5QwK2g@mail.gmail.com>
Subject: Re: [PATCH] watchdog: iTCO: fix link error
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 29, 2020 at 12:33 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> When the MFD driver is a loadable module, the watchdog driver fails
> to get linked into the kernel:
>
> drivers/watchdog/iTCO_wdt.o: In function `update_no_reboot_bit_pmc':
> iTCO_wdt.c:(.text+0x54f): undefined reference to `intel_pmc_gcr_update'
>
> The code is written to support operation without the MFD driver, so
> add a Kconfig dependency that allows this, while disallowing the watchdog
> to be built-in when the MFD driver is a module.
>
> Fixes: 25f1ca31e230 ("platform/x86: intel_pmc_ipc: Convert to MFD")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/watchdog/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 66ca69f30f01..67a83578810e 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1217,6 +1217,7 @@ config ITCO_WDT
>         depends on (X86 || IA64) && PCI
>         select WATCHDOG_CORE
>         depends on I2C || I2C=n
> +       depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT

Can we use same format as for I2C?

>         select LPC_ICH if !EXPERT
>         select I2C_I801 if !EXPERT && I2C
>         ---help---
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
