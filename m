Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E91520FD96
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbgF3UYB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgF3UYA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:24:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429EBC061755;
        Tue, 30 Jun 2020 13:24:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k71so6464558pje.0;
        Tue, 30 Jun 2020 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bAnFWDXrNwZJcACP9IOdAh/yJEqe7UvCHQljaZTXU6Q=;
        b=KcMy0csfV+LwdO58342SklgsOVTD/dn11b/TFu+QjFjgpTJ/quFUh5M0g65ft4+9Rz
         /n2q6A2VLSDgselfx38JxL8mznDfB79zSfuxmIAAbhw4M+OQyhf+mJ3hQ4kKJE0oaLsH
         Rcj8TxxrkX6l0BzJ34rXA5CekVGHEKjU91pA7JCDSDs4m3JLsF1CIPMoqio9q8Na08yg
         qFonsv3+lMdwDKNsryiShGcx88FObnuOb1qqlkleEWhJhFP6tKqqzq2A9CZ3qkysKuLh
         SO7rGHbJV2Gie6Xj6XvcWAHwMJJLuCuM9dVXenV0PsFjqLR+giDGFfyapC4yb6mMJeGz
         bc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=bAnFWDXrNwZJcACP9IOdAh/yJEqe7UvCHQljaZTXU6Q=;
        b=TSARc3oD/pgs8oX2ndzaFQ2WipnYUTV1sADYn4G+A3uuEaRp62DGzBmk0yTQ6LrPZR
         nIJdSl0n1S9F1HhflhcA5Mve+QnTMs0hAy1g+NMAzdQ6K7t6k1A6zEgFNbyvbdIkXMsn
         Y8fXpr6BYnyzMnOkU0a58JKfBMRZZDhTBTCyQoHB54R1Xw/XPcwC780EMb2fRlRXJGLN
         sGprjCfPQaqzjCcxiE4YozBa3ALF9UmOPTR1VVLgKlLeM2vBpK8EGydXg/WG85FgcvR3
         rL49ZNkvUFoVhaVJS5a3uCIJqwuk4Dwih92A6Pi+8y1zpAV1hNKVDPDb5KZ9VXuK1NWk
         ngjw==
X-Gm-Message-State: AOAM533kpylF6y4d400cVOj7bEcpx1EQhlbLIPiUVg0fDVHV8LhL/Wfz
        ANphT4WxwK1jUm0mdiNaE2s=
X-Google-Smtp-Source: ABdhPJzQ/w+IwOwSx0RgvzmxIlFx1k6w2+8fhfEcPOHn5Gmjp2wfQYj9ujBGFtqtLKcszX2ZYG7w2Q==
X-Received: by 2002:a17:902:6acc:: with SMTP id i12mr17649806plt.75.1593548638953;
        Tue, 30 Jun 2020 13:23:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w9sm3598332pfq.178.2020.06.30.13.23.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 13:23:58 -0700 (PDT)
Date:   Tue, 30 Jun 2020 13:23:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match
 initial allowed window
Message-ID: <20200630202356.GA16412@roeck-us.net>
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-3-t-kristo@ti.com>
 <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
 <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
 <25bf3ed1-5434-9b45-20ae-e1b2cfc5e5c0@roeck-us.net>
 <1d84e633-b808-d6ac-a34c-9cc4709e43f6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d84e633-b808-d6ac-a34c-9cc4709e43f6@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 25, 2020 at 08:04:50PM +0300, Tero Kristo wrote:
> On 25/06/2020 16:35, Guenter Roeck wrote:
> > On 6/25/20 1:32 AM, Tero Kristo wrote:
> > > On 24/06/2020 18:24, Jan Kiszka wrote:
> > > > On 24.06.20 13:45, Tero Kristo wrote:
> > > > > If the RTI watchdog has been started by someone (like bootloader) when
> > > > > the driver probes, we must adjust the initial ping timeout to match the
> > > > > currently running watchdog window to avoid generating watchdog reset.
> > > > > 
> > > > > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > > > > ---
> > > > >    drivers/watchdog/rti_wdt.c | 25 +++++++++++++++++++++++++
> > > > >    1 file changed, 25 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> > > > > index d456dd72d99a..02ea2b2435f5 100644
> > > > > --- a/drivers/watchdog/rti_wdt.c
> > > > > +++ b/drivers/watchdog/rti_wdt.c
> > > > > @@ -55,11 +55,13 @@ static int heartbeat;
> > > > >     * @base - base io address of WD device
> > > > >     * @freq - source clock frequency of WDT
> > > > >     * @wdd  - hold watchdog device as is in WDT core
> > > > > + * @min_hw_heartbeat_save - save of the min hw heartbeat value
> > > > >     */
> > > > >    struct rti_wdt_device {
> > > > >        void __iomem        *base;
> > > > >        unsigned long        freq;
> > > > >        struct watchdog_device    wdd;
> > > > > +    unsigned int        min_hw_heartbeat_save;
> > > > >    };
> > > > >    static int rti_wdt_start(struct watchdog_device *wdd)
> > > > > @@ -107,6 +109,11 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
> > > > >        /* put watchdog in active state */
> > > > >        writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
> > > > > +    if (wdt->min_hw_heartbeat_save) {
> > > > > +        wdd->min_hw_heartbeat_ms = wdt->min_hw_heartbeat_save;
> > > > > +        wdt->min_hw_heartbeat_save = 0;
> > > > > +    }
> > > > > +
> > > > >        return 0;
> > > > >    }
> > > > > @@ -201,6 +208,24 @@ static int rti_wdt_probe(struct platform_device *pdev)
> > > > >            goto err_iomap;
> > > > >        }
> > > > > +    if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
> > > > > +        u32 time_left;
> > > > > +        u32 heartbeat;
> > > > > +
> > > > > +        set_bit(WDOG_HW_RUNNING, &wdd->status);
> > > > > +        time_left = rti_wdt_get_timeleft(wdd);
> > > > > +        heartbeat = readl(wdt->base + RTIDWDPRLD);
> > > > > +        heartbeat <<= WDT_PRELOAD_SHIFT;
> > > > > +        heartbeat /= wdt->freq;
> > > > > +        if (time_left < heartbeat / 2)
> > > > > +            wdd->min_hw_heartbeat_ms = 0;
> > > > > +        else
> > > > > +            wdd->min_hw_heartbeat_ms =
> > > > > +                (time_left - heartbeat / 2 + 1) * 1000;
> > > > > +
> > > > > +        wdt->min_hw_heartbeat_save = 11 * heartbeat * 1000 / 20;
> > > > > +    }
> > > > > +
> > > > >        ret = watchdog_register_device(wdd);
> > > > >        if (ret) {
> > > > >            dev_err(dev, "cannot register watchdog device\n");
> > > > > 
> > > > 
> > > > This assumes that the bootloader also programmed a 50% window, right? The pending U-Boot patch will do that, but what if that may chance or someone uses a different setup?
> > > 
> > > Yes, we assume 50%. I think based on the hw design, 50% is the only sane value to be used, otherwise you just shrink the open window too much and for no apparent reason.
> > > 
> > 
> > Not sure if that is a valid assumption. Someone who designs a watchdog
> > with such a narrow ping window might as well also use it. The question
> > is if you want to rely on that assumption, or check and change it if needed.
> 
> Right, if that is a blocker, I can modify the code. Should be maybe couple
> of lines addition.
> 
> > Also, I wonder if we should add an API function such as
> > "set_last_hw_keepalive()" to avoid all that complexity.
> 
> I can try adding that also if it is desirable.
> 

But wait, the code doesn't really match what the description of this
patch claims, or at least the description is misleading. Per the
description, this is to prevent an early timeout. However, the problem
here is that the watchdog core does not generate a ping, even if
requested, because it believes that it just generated one right before
the watchdog timer was registered, and that it can not generate another
one because min_hw_heartbeat_ms has not elapsed.

With that in mind, the problem is a bit more complex.

First, the driver doesn't really update the current timeout to the
value that is currently configured and enabled. Instead, it just
uses/assumes the default (DEFAULT_HEARTBEAT or whatever the heartbeat
module parameter is set to). This means that it is still possible for
an early timeout to occur if there is a mismatch between the bootloader
timeout and the timeout assumed by the driver. Worse, the timeout
is only updated in the start function - and the start function isn't
called if the watchdog is already running. Actually, the driver does
not support updating the timeout at all. This means that a mismatch
between the bootloader timeout and the timeout assumed by the driver
is not handled well.

To solve this, the driver would have to update the actual timeout to
whatever is programmed into the chip and ignore any module parameter
and default settings if the watchdog is already running. Alternatively,
it would have to support updating the timeout (if the hardware supports
that) after the watchdog was started.

Second, handling min_hw_heartbeat_ms properly should really be implemented
in the watchdog core. Instead of assuming that the most recent keepalive
happened "just before now", as it currently does, it should call the
timeleft function (if available and if the watchdog is running) and
calculate the most recent keepalive (and thus the earliest acceptable
next keepalive) from its return value.

Thanks,
Guenter
