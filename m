Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D19B368658
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Apr 2021 20:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236810AbhDVSGR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Apr 2021 14:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhDVSGR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Apr 2021 14:06:17 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C26C06174A;
        Thu, 22 Apr 2021 11:05:41 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id n140so46627394oig.9;
        Thu, 22 Apr 2021 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=17m0G7DImnLvNaA0ALmee3EGwU+5fWnJUzbWancxTSI=;
        b=owTpyRcQwbSTb/u9rOV3Ef/i1PgEh57DdgCyWP088HtpsxxA3m3T3ayh+B8f8FzBDa
         +J1dOck59tmd6m5CV3rpDl7gsoaMpuYHDRNAmYpqG6oe/e/fPq+Pcqe/eCzvd5C5sTRG
         H1NkNEHWr7SqxCJVSL8H5roJwtfqhSalAM/nNUmfwgV5ib7aEcXpRK1iISPaIK1/jGNS
         EVVt/wnvYYrl3hds1I1AZvAMmXDQV2b3s9XVVH4Q57iuk1NofSfYfd/qZaZkrig+hu5/
         olgZljXWWd4VC6TI0YHlMhbxd75knYX8tW0TvYgXUA/EeMcNrakN5O/XErk7wgNWsjTD
         rl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=17m0G7DImnLvNaA0ALmee3EGwU+5fWnJUzbWancxTSI=;
        b=tXXY7eTgVNu/dSEbvhvu4EiAduXZSamH82ydZEE/WUPRS093KmR50zNbYOqq2ZRNF5
         lrMxKVrqt6lElI4ihReAgjDjQn6NAeaXI5GB2IFConERmJxPXHN59QFwI89wdV1DQQAo
         +PYrurYNI3z/gxmDUqvGvNin2W5fgMzZMLccd/6gOH4nZb3BJCP7O26ewBFkUUd5Y5a1
         hzbxWIvrNgV//rs36ufuKj3uTS/Q1yrTZt8yn2LrQJrgOVip+ZJUrKAkFrRw3vivkJ7d
         CU7XH3ZRiIsewGb8hmQrLsp1TFBB4lv0CG/pS13suzDVJybd8Cpb+CZ19D7imVw/NFuA
         LlDA==
X-Gm-Message-State: AOAM532dfvlXbpxrn5Q7FErONySJ/0CvH3P8SmgOba++A1tpVHaliGlp
        /wjuS2+sZxh/EbIXmTVqMxxJWOkP1so=
X-Google-Smtp-Source: ABdhPJw0god0XZwiUQLDg7+c+UlduCOc32cSMSxfM6LoUI9lD3N+e/ZhfW9tOQD81embb2byHZoMvg==
X-Received: by 2002:a05:6808:1302:: with SMTP id y2mr3180685oiv.86.1619114741346;
        Thu, 22 Apr 2021 11:05:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h9sm784695otr.67.2021.04.22.11.05.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 11:05:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 22 Apr 2021 11:05:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Francesco Zanella <francesco.zanella@vimar.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: gpio_wdt: add "start-at-boot" feature
Message-ID: <20210422180539.GB107132@roeck-us.net>
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-3-francesco.zanella@vimar.com>
 <20210421164228.GB110463@roeck-us.net>
 <1b53153c-e890-cf3c-74f7-9106965c23fe@vimar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b53153c-e890-cf3c-74f7-9106965c23fe@vimar.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Apr 22, 2021 at 06:28:40PM +0200, Francesco Zanella wrote:
> 
> 
> On 21/04/21 18:42, Guenter Roeck wrote:
> > On Wed, Apr 21, 2021 at 06:26:21PM +0200, Francesco Zanella wrote:
> >> If "start-at-boot" property is present in the device tree, start pinging
> >> hw watchdog at probe, in order to take advantage of kernel configs:
> >> - WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was
> >>   been enabled before the kernel (by uboot for example) and userspace
> >>   doesn't take control of /dev/watchdog in time;
> >> - WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
> >>   /dev/watchdog within the timeout.
> >>
> >> Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
> >> ---
> >>  drivers/watchdog/gpio_wdt.c | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> >> index 0923201ce874..1e6f0322ab7a 100644
> >> --- a/drivers/watchdog/gpio_wdt.c
> >> +++ b/drivers/watchdog/gpio_wdt.c
> >> @@ -31,6 +31,7 @@ struct gpio_wdt_priv {
> >>  	struct gpio_desc	*gpiod;
> >>  	bool			state;
> >>  	bool			always_running;
> >> +	bool			start_at_boot;
> >>  	unsigned int		hw_algo;
> >>  	struct watchdog_device	wdd;
> >>  };
> >> @@ -147,6 +148,9 @@ static int gpio_wdt_probe(struct platform_device *pdev)
> >>  	priv->always_running = of_property_read_bool(np,
> >>  						     "always-running");
> >>  
> >> +	priv->start_at_boot = of_property_read_bool(np,
> >> +						    "start-at-boot");
> >> +
> >>  	watchdog_set_drvdata(&priv->wdd, priv);
> >>  
> >>  	priv->wdd.info		= &gpio_wdt_ident;
> >> @@ -161,7 +165,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
> >>  
> >>  	watchdog_stop_on_reboot(&priv->wdd);
> >>  
> >> -	if (priv->always_running)
> >> +	if (priv->always_running || priv->start_at_boot)
> >>  		gpio_wdt_start(&priv->wdd);
> > 
> > So the only real difference to always_running is that always_running
> > doesn't stop the watchdog on close but keeps it running.
> > 
> > Does that really warrant another property ? Why not just use
> > always-running ?
> > 
> > The special use case of being able to stop the watchdog doesn't seem
> > to be worth the trouble. Please explain your use case.
> > 
> > Guenter
> > 
> 
> You got the point.
> I would like to be able to stop the watchdog when I want.
> From my point of view always_running is used in the very special
> case when the wdt chip can't be stopped.
> I want a normal wdt that can be stopped (for example during a system
> update), but I want it to start at boot for the 2 reasons that I
> explained before:
> - I need continuity in hw wdt pinging because I start in uboot,
>   so I take advantage of WATCHDOG_HANDLE_BOOT_ENABLED that makes
>   the kernel to do that job; but it is triggered only if it is
>   started at probe, if I'm not wrong.

That depends. If the driver can read the current state (ie if
it can detect if the watchdog is running) it can report it
to the watchdog core accordingly. That would be the preferred
mechanism. Everything else is just a workaround for bad hardware
(bad as in "it doesn't report its state").

Guenter

> - I would like to monitor with the wdt also the kernel at boot,
>   and more importantly handle the case when the userspace app
>   doesn't take control of /dev/watchdog for whatever reason
>   within the timeout set with WATCHDOG_OPEN_TIMEOUT.
> 
> Hope that this explain my target.
> Thanks for your attention,
> 
> Francesco
