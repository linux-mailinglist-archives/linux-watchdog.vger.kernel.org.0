Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054FD361738
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Apr 2021 03:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237913AbhDPBsS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Apr 2021 21:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236309AbhDPBsR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Apr 2021 21:48:17 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF023C061574;
        Thu, 15 Apr 2021 18:47:53 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id t140-20020a4a3e920000b02901e5c1add773so4584769oot.1;
        Thu, 15 Apr 2021 18:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t56dQKxoANCG3Oiet8IMk4GlydjPpRzi7nr7AlrlLvk=;
        b=UgBBUVAqc4CENsYCf/ojNPO1ZPTgTsAk4TJbHpjpwOyQbm4CcFUR9iKKjwd7f3trYm
         RUh5XXD4mVL/aMvqLe1V0jnQb71SvkZ2dEQ9y2CSLo+05E1Rw+gYzyhsJNkdcjqGs4r0
         b9zsV1ksmtXp3iMK1dJnfkEvi+xTT9+SsKzNGhxp72doiKRYtmw1wr4Nw3YiUfm3s3eb
         thhJ4kcRh7J/eBakmlhv2iVxYj3PW0T8vzYVhnaFCMaDHGmqOt0YdSsvTBUNcUSTWGEf
         HCkNzWy/Ajhobav9GR62kswu4UNlPLIQ7sJYzp1+LtMcFRDrBmLwUhwzynFzTxsYnJ9c
         nxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=t56dQKxoANCG3Oiet8IMk4GlydjPpRzi7nr7AlrlLvk=;
        b=cgA1WZ1xBgAjPCnKOL1R4W8ojS+qJj8wshsml12n/YvjIVy479xSYx0e/dVuCk043P
         xLxhyrzTq986h7sr7jChvhjt3V7V99A3I0VzDEAOqdQbkLr23RT28Rjs4acqfkK6VlvB
         GwRU99QEk2K/Wzr/mg8CfmOCZi18quiLEU7S8i4suhd+uTxxnAPM71o3enB9t100xgry
         J9gGKvPb+mwhrVu9Fyax1MUde4/NvJcceGADB9t2oeqhemENjLyU/OXhBTSZSuenhKAK
         CqUpCQ1GnxKelRpjnrhpiqkd1QS7hQsx3FjoXh36EV2AhN1FsPf219cTjDAIofuZTH8H
         AGnA==
X-Gm-Message-State: AOAM530FTmtqPved9inKkl5xdJuGfy86wkEvORm8j+v0BRtMQ20D1YvB
        Imr/+i3XJwvz/Exk/Hvyit0A+y6dOUw=
X-Google-Smtp-Source: ABdhPJxVohYKe/p+xqyc6ZQQ7pdzt88IO0cmHzq0/doj37HzgGpfByJRr0/mpXjMFZYKPe+KRgJmWA==
X-Received: by 2002:a4a:4304:: with SMTP id k4mr1585462ooj.42.1618537673101;
        Thu, 15 Apr 2021 18:47:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e44sm1067754ote.21.2021.04.15.18.47.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 18:47:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 15 Apr 2021 18:47:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tao Ren <rentao.bupt@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>,
        Amithash Prasad <amithash@fb.com>
Subject: Re: [PATCH] watchdog: aspeed: fix integer overflow in set_timeout
 handler
Message-ID: <20210416014750.GA53153@roeck-us.net>
References: <20210416001208.16788-1-rentao.bupt@gmail.com>
 <469ac948-d65b-471f-102f-726466c19c5c@roeck-us.net>
 <20210416010444.GA17388@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416010444.GA17388@taoren-ubuntu-R90MNF91>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Apr 15, 2021 at 06:04:45PM -0700, Tao Ren wrote:
> On Thu, Apr 15, 2021 at 05:50:32PM -0700, Guenter Roeck wrote:
> > On 4/15/21 5:12 PM, rentao.bupt@gmail.com wrote:
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > > 
> > > Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
> > > handler to avoid potential integer overflow when the supplied timeout is
> > > greater than aspeed's maximum allowed timeout (4294 seconds).
> > > 
> > > Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> > > Reported-by: Amithash Prasad <amithash@fb.com>
> > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > ---
> > >  drivers/watchdog/aspeed_wdt.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> > > index 7e00960651fa..9f77272dc906 100644
> > > --- a/drivers/watchdog/aspeed_wdt.c
> > > +++ b/drivers/watchdog/aspeed_wdt.c
> > > @@ -145,9 +145,8 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
> > >  	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
> > >  	u32 actual;
> > >  
> > > -	wdd->timeout = timeout;
> > > -
> > > -	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> > > +	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
> > > +	wdd->timeout = actual;
> > >  
> > >  	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
> > >  	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> > > 
> > 
> > If the provided timeout is larger than the supported hardware timeout,
> > the watchdog core will ping the hardware on behalf of userspace.
> > The above code would defeat that mechanism for no good reason.
> > 
> > NACK.
> > 
> > Guenter
> 
> Thanks Guenter for Joel for the quick review!
> 
> The integer overflow happens at (actual * WDT_RATE_1MHZ). For example,
> if a user tries to set timeout to 4295 seconds, then the hardware would
> be programmed to timeout after about 32 milliseconds. I would say this
> behavior is not expected?

The fix would be

-	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
+	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);

without modifying
	wdd->timeout = timeout;

The real problem here is that "wdd->max_hw_heartbeat_ms * 1000"
is simply wrong. The overflow is a side effect of the wrong
calculation, and concentrating on it disguises the real problem.

Guenter
