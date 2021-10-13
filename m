Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18F242CA62
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Oct 2021 21:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhJMTsY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Oct 2021 15:48:24 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:45602 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhJMTsX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Oct 2021 15:48:23 -0400
Received: from [IPv6:2a02:a03f:eafe:c901:ca:6d5e:c3e3:69a5] (unknown [IPv6:2a02:a03f:eafe:c901:ca:6d5e:c3e3:69a5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id E44BE260FB3;
        Wed, 13 Oct 2021 21:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1634154379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wA07wl10/Wxx93KniNkYOOpdppCfmNy46cigfrikK0k=;
        b=dptpwuPQhnk1if6Dywk9Kc5UintrlnavCuviOdE78hYfZe8yi+5dKkmrNk2i01Z226KQtb
        6GDxXnkj+JTdWl1esdn3gjSBOPF4FzqEcAuBfQEz3VutnDsqqbaGMaCyJ6ylbIU3AZR1Vg
        /dhVgLYAIfeN30heEQ5amP5cI/or8CzvZaz1+VH55dpDGSpC/q4firCD8UaZeO06wdR4cH
        kauGJelBuZrChBJfmtueA+hTNDgcoHdqCfQt2meDOEGD4XYzQoY3SYdEe0WWU3P05dfalm
        iC4kK3/JoRRibp79BlWmVUhtaVua7Nyd3b8o89OCkwui/zCavhVMdNYn86tUXg==
Message-ID: <4cf85218627371e1d07238257d0a89f824606415.camel@svanheule.net>
Subject: Re: [PATCH 2/2] watchdog: Add Realtek Otto watchdog timer
From:   Sander Vanheule <sander@svanheule.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Date:   Wed, 13 Oct 2021 21:46:16 +0200
In-Reply-To: <20211013184852.GA955578@roeck-us.net>
References: <cover.1634131707.git.sander@svanheule.net>
         <7eb1e3d8a5bd3b221be0408bd6f0272e6d435ade.1634131707.git.sander@svanheule.net>
         <20211013184852.GA955578@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 2021-10-13 at 11:48 -0700, Guenter Roeck wrote:
> On Wed, Oct 13, 2021 at 03:29:00PM +0200, Sander Vanheule wrote:
[...]

> > 
> > diff --git a/drivers/watchdog/realtek_otto_wdt.c b/drivers/watchdog/realtek_otto_wdt.c
> > new file mode 100644
> > index 000000000000..64c9cba6b0b1
> > --- /dev/null
> > +++ b/drivers/watchdog/realtek_otto_wdt.c
> > @@ -0,0 +1,411 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/*
> > + * Realtek Otto MIPS platform watchdog
> > + *
> > + * Watchdog timer that will reset the system after timeout, using the selected
> > + * reset mode.
> > + *
> > + * Counter scaling and timeouts:
> > + * - Base prescale of (2 << 25), providing tick duration T_0: 168ms @ 200MHz
> > + * - PRESCALE: logarithmic prescaler adding a factor of {1, 2, 4, 8}
> > + * - Phase 1: Times out after (PHASE1 + 1) × PRESCALE × T_0
> > + *   Generates an interrupt, WDT cannot be stopped after phase 1
> > + * - Phase 2: starts after phase 1, times out after (PHASE2 + 1) × PRESCALE × T_0
> > + *   Resets the system according to RST_MODE
> 
> Why is there a phase2 interrupt if phase2 resets the chip ?
> 

The SoC's reset controller has an interrupt line for phase2, even though then it then the
WDT also resets the system. I don't have any documentation about this peripheral; just
some vendor code and there the phase2 interrupt isn't enabled. I mainly added it here for
completeness.

One thing to note is that after CPU or software reset (not SoC reset) the phase2 flag in
OTTO_WDT_REG_INTR will be set. That's why I always clear it in otto_wdt_probe(), because
otherwise enabling the interrupt line would trigger otto_wdt_phase2_isr(). On warm
restarts this bit could be used to determine if there was a WDT timeout, but not if the
WDT is configured for cold restarts (i.e. full SoC reset).

> 
[...]
> > +
> > +       raw_spin_lock_irqsave(&ctrl->lock, flags);
> > +       v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
> > +       v |= OTTO_WDT_CTRL_ENABLE;
> > +       iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
> > +       raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> 
> Is it really necessary to disable interrupts for those operations ?

The ISR routines only use REG_INTR, which isn't modified anywhere else (outside of probing
the device). I will replace these with raw_spin_{lock,unlock} throughout.

[...]
> > +/*
> > + * The timer asserts the PHASE1/PHASE2 IRQs when the number of ticks exceeds
> > + * the value stored in those fields. This means the timer will run for at least
> > + * one tick, so small values need to be clamped to correctly reflect the timeout.
> > + */
> > +static inline unsigned int div_round_ticks(unsigned int val, unsigned int
> > tick_duration,
> > +               unsigned int min_ticks)
> > +{
> > +       return max(min_ticks, DIV_ROUND_CLOSEST(val, tick_duration));
> 
> Are you sure that DIV_ROUND_CLOSEST is appropriate in those calculations
> (instead of DIV_ROUND_UP or DIV_ROUND_DOWN) ?
> 
[...]

> > +
> > +       timeout_ms = total_ticks * tick_ms;
> > +       ctrl->wdev.timeout = DIV_ROUND_CLOSEST(timeout_ms, 1000);
> > +
> 
> That means the actual timeout (and pretimeout) can be slightly larger
> than the real timeout. Is this really what you want ?

Is it a problem if the WDT times out later than specified by watchdog_device.(pre)timeout?
I can see that premature timeouts would be an issue, but I don't suppose it's problematic
if the WDT is pinged (slightly) sooner than actually required?

The coarsest ticks are 1342 ms, so it is not always possible to provide the requested
(pre)timeout value, independent of the rounding scheme. Although I think it should be
possible to replace timeout rounding by DIV_ROUND_UP (of total_ticks_ms), and pretimeout
rounding by DIV_ROUND_DOWN (of phase2_ticks_ms), and keep stable timeouts when alternating
between set_timeout/set_pretimeout.

> 
> > +       pretimeout_ms = phase2_ticks * tick_ms;
> > +       ctrl->wdev.pretimeout = DIV_ROUND_CLOSEST(pretimeout_ms, 1000);
> > +
> > +       return 0;
> > +}
> > +
> > +static int otto_wdt_set_timeout(struct watchdog_device *wdev, unsigned int val)
> > +{
> > +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> > +       unsigned long flags;
> > +       unsigned int ret;
> > +
> > +       if (watchdog_timeout_invalid(wdev, val))
> > +               return -EINVAL;
> 
> This is not supposed to happen because the calling code already performs
> range checks.

Right, I will drop the redundant check here and in set_pretimeout.

> 
[...]
> > +static int otto_wdt_restart(struct watchdog_device *wdev, unsigned long reboot_mode,
> > +               void *data)
> > +{
> > +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> > +       u32 reset_mode;
> > +       u32 v;
> > +
> > +       devm_free_irq(ctrl->dev, ctrl->irq_phase1, ctrl);
> > +
> 
> Why is this needed (instead of, say, disabling the interrupt) ?

Disabling the interrupt should actually be enough. I'll replace the devm_free_irq() with
disable_irq(). Somehow I didn't find disable_irq(), even though that was what I was
looking for...

[...]
> > +
> > +       /*
> > +        * Since pretimeout cannot be disabled, min_timeout is twice the
> > +        * subsystem resolution. max_timeout is 44s at a bus clock of 200MHz.
> > +        */
> > +       ctrl->wdev.min_timeout = 2;
> > +       max_tick_ms = otto_wdt_tick_ms(ctrl, OTTO_WDT_PRESCALE_MAX);
> > +       ctrl->wdev.max_timeout =
> > +               DIV_ROUND_CLOSEST(max_tick_ms * OTTO_WDT_TIMEOUT_TICKS_MAX, 1000);
> 
> Any reason for using max_timeout instead of max_hw_heartbeat_ms ?

I must have missed this when I was looking at watchdog_device. Makes sense to use
max_hw_heartbeat_ms since that reflects the actual value more accurately.

> 

Thanks for the feedback!

Best,
Sander

