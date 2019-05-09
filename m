Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F7618641
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2019 09:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfEIHi3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 May 2019 03:38:29 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:36112 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfEIHi3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 May 2019 03:38:29 -0400
Received: by mail-vk1-f193.google.com with SMTP id d74so359117vka.3;
        Thu, 09 May 2019 00:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RFFtFtnGCiEoABcKzwA6B0N/JB84yDVwmoWMMtkiI/I=;
        b=eaFYPa9Gbu2mKRpyeZyYyUM3/KtOdnoanSl9sjA4ZQkTsCHoXEk5O3k3AranQgrX9U
         sIx/0CnRd+kAG7MMv2vUq8U6Hu83iO1STnGtxyQpSXCXjWTGEaLMcK0cLJl0nxjldRMI
         VuLqjsld2FK4/EiOEfjoiLTD7D/udBt3lBNiiXM06T/PWp3LxwQS6jb8kCMyrYAAbMQ1
         zcMpE073LI8LA0+kUh2IE0w6ocPAB3qkkVDTZ7vL+5qm4HfyHkteBfnsSv6OGfdhzsGb
         cAGAfKW3G+1YS8ipu06Nr/LCsSZL8n/wwdwREUslcBA0rQPlXXAwD3wcnuN8vNRg4JJ/
         zYpg==
X-Gm-Message-State: APjAAAXQId43jJeUaC+vI+6fajANyBpt0JnBZXQeeJqE20ojBqqJ5VV6
        XNPhMCYf9Fpq4vkJyvP4qM8pYxcG5g2dj1EjHW0wOxQh
X-Google-Smtp-Source: APXvYqy8hEQZsTLJzSM1aW7xVNJq5avq36M4SD72JyUpbX85mzGfZfCi74GMMghpGHG2qiotH4HPGiy/i/CZKaE34Ps=
X-Received: by 2002:a1f:b297:: with SMTP id b145mr855213vkf.74.1557387508454;
 Thu, 09 May 2019 00:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190415105201.2078-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190415105201.2078-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 May 2019 09:38:16 +0200
Message-ID: <CAMuHMdUxBaO0xw3EyW4nT=wXsJsJLphFH0FoFYZi2EO2fx=r1w@mail.gmail.com>
Subject: Re: [RFC PATCH] watchdog: renesas_wdt: support handover from bootloader
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wolfram,

On Mon, Apr 15, 2019 at 12:52 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Support an already running watchdog by checking its enable bit and set
> up the status accordingly before registering the device.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This patch was tested using a Renesas Salvator XS board (R-Car M3N). It works.
> However, there is a small window where the watchdog clock is disabled, namely
> after the MSSR clock driver initializes it until RuntimePM of the watchdog
> driver takes over. If the system hangs in this window, bad luck. So, I'd think
> it makes sense to have this clock either always-on or to keep the state which
> came from the firmware. Geert, what do you think?

The MSSR clock driver does not disable the clock. The clock's core
clk_disable_unused() does, which is a late initcall.
So if the handover code calls rwdt_start() before that (i.e. no deferred
probing happens), the clock would never be disabled.

Note that pm_runtime_put() in rwdt_probe() queues a power down request,
but as it is not the _sync variant, it is delayed by some time, so
probably it would never happen if rwdt_start() is called by the handover
code in probe.

Now, if we would mark the clock always-on (CLK_IS_CRITICAL),
we can never disable it, even if the wdt is not used or the driver is
not compiled-in.

I don't think there's a way to mark a clock as "keep the state which
came from the firmware", CLK_IS_CRITICAL enables the clock in
__clk_core_init().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
