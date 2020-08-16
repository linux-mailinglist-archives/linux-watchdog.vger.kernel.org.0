Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E02245670
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Aug 2020 09:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgHPHYs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 16 Aug 2020 03:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgHPHYr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 16 Aug 2020 03:24:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E20C061786;
        Sun, 16 Aug 2020 00:24:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o5so6550082pgb.2;
        Sun, 16 Aug 2020 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RzIG+1vyXz3X47wXuY6TSglS4qmCJSgzuoZiRxj3Erc=;
        b=LvGMG1n7dRBwxic3RaExkurQFdu2DRCEGL4TTFaSD2AABIqZoQFPO4/ivKbkUzs/jc
         2kvQNC/A5R+VjIXC9c109YcE2ZtCvwzWnXAFUpEG/tgCCzAiP+8C304Il5gVMbMOppcu
         EsMk8196tDigexI0o+jobBdXvKqslAbKLwBPgDkIXiAt8gdLHU4SgFjymi4PA9FWKCPZ
         cP1Xe+ZHAEfSkrD1Qz9xdEmlrgz57vajcqpw3+UF9+uDg/HlV3Jq14+IFOmj/WkZOws0
         p2BcItnqQ2R28CrGE+wfZn294Ua19cZ0mkpLDa+67jV7srq1Io5bmS7ukPbj8Y4r5YPy
         qkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RzIG+1vyXz3X47wXuY6TSglS4qmCJSgzuoZiRxj3Erc=;
        b=Nj/tDRS95xystJdiTjZREhPOqVfTbDutXmPgfUpP3m2ZERGHnQcwWthEr1Hnj41IAS
         PjIBP9QiUWZ6CWW7KLxFobeGNxEE5sZesxckqlFusCj6Sw06E4NWLHPphnWtvbpNcXRC
         nzqiq4LjcZmDkzjrejh0suZaUxfSGAGABvar2c3iFA6a5pa0vpCo1y6PhuORXYex022c
         OgWZv/Fd6vcaNEQd85Ye62KovOVgOocbfx5flAPaFqBZZbOFZvCuIk1YHcjkz8scOiCd
         Xt1jG1BUa1UY2sl1q2T+ZR8ytCr181pjX8kGTwp2mGZPFNmUUHR9Bb4FrNDrrmUPKFWC
         gf8w==
X-Gm-Message-State: AOAM531/6Sr7QDoldzsraTi5SQq6D+4Ea+qB1hyXdCDbDa2Jk0X/H7ZB
        xXLZI++Q7ZYjsoRw5UIFMg==
X-Google-Smtp-Source: ABdhPJwPyekNT3ZygpiIZGrHDjPVpPpnkXtp/Qfz8ZuAPkz6xKxKQeUCttdxcmHOrNiSK+UEt9Mt4g==
X-Received: by 2002:a63:3e0f:: with SMTP id l15mr5508169pga.99.1597562687064;
        Sun, 16 Aug 2020 00:24:47 -0700 (PDT)
Received: from madhuparna-HP-Notebook ([2402:3a80:cea:9294:8100:367f:a3dd:e679])
        by smtp.gmail.com with ESMTPSA id s185sm13154905pgc.18.2020.08.16.00.24.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Aug 2020 00:24:46 -0700 (PDT)
From:   Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date:   Sun, 16 Aug 2020 12:54:41 +0530
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     madhuparnabhowmik10@gmail.com, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        andrianov@ispras.ru, ldv-project@linuxtesting.org
Subject: Re: [PATCH] drivers: watchdog: pc87413_wdt: Fix Race condition bug
Message-ID: <20200816072441.GA13871@madhuparna-HP-Notebook>
References: <20200813125451.19118-1-madhuparnabhowmik10@gmail.com>
 <20200814150740.GA254327@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814150740.GA254327@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 14, 2020 at 08:07:40AM -0700, Guenter Roeck wrote:
> On Thu, Aug 13, 2020 at 06:24:51PM +0530, madhuparnabhowmik10@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > After misc_register the open() callback can be called.
> > However the base address (swc_base_addr) is set after misc_register()
> > in init.
> > As a result, if open callback is called before pc87413_get_swc_base_addr()
> > then in the following call chain: pc87413_open() -> pc87413_refresh() ->
> > pc87413_swc_bank3() : The value of swc_base_addr will be -1.
> > Therefore, do misc_register() after pc87413_get_swc_base_addr().
> > 
> > Found by Linux Driver Verification project (linuxtesting.org).
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> Another candidate for removal. The entire driver is at the very least
> questionable: It hard enables the watchdog after registering it, making it
> mandatory to open it within one minute or the system will reboot. Also,
> the driver doesn't even check if the hardware even exists; it just assumes
> that it does. And then it reconfigures that potentially non-existing
> hardware to use a specific chip pin as wdt output, as if that would be
> useful if that pin is not wired up. Worst case that driver may actually
> break something if it is loaded on an arbitrary system.
> 
> I really don't see the point of trying to patch it up unless there are users
> left who can confirm that it even works on existing hardware, and then I'd
> prefer to have it fixed for good and not just patched up.
>
Sure makes sense. Thank you for reviewing.

Regards,
Madhuparna

> Thanks,
> Guenter
> 
> > ---
> >  drivers/watchdog/pc87413_wdt.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
> > index 73fbfc99083b..ad8b8af2bdc0 100644
> > --- a/drivers/watchdog/pc87413_wdt.c
> > +++ b/drivers/watchdog/pc87413_wdt.c
> > @@ -512,6 +512,10 @@ static int __init pc87413_init(void)
> >  	if (ret != 0)
> >  		pr_err("cannot register reboot notifier (err=%d)\n", ret);
> >  
> > +	pc87413_select_wdt_out();
> > +	pc87413_enable_swc();
> > +	pc87413_get_swc_base_addr();
> > +
> >  	ret = misc_register(&pc87413_miscdev);
> >  	if (ret != 0) {
> >  		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
> > @@ -520,10 +524,6 @@ static int __init pc87413_init(void)
> >  	}
> >  	pr_info("initialized. timeout=%d min\n", timeout);
> >  
> > -	pc87413_select_wdt_out();
> > -	pc87413_enable_swc();
> > -	pc87413_get_swc_base_addr();
> > -
> >  	if (!request_region(swc_base_addr, 0x20, MODNAME)) {
> >  		pr_err("cannot request SWC region at 0x%x\n", swc_base_addr);
> >  		ret = -EBUSY;
