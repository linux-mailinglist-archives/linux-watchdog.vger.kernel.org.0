Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F56361706
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Apr 2021 03:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhDPBFS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Apr 2021 21:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhDPBFS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Apr 2021 21:05:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBB4C061574;
        Thu, 15 Apr 2021 18:04:52 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t22so12755606ply.1;
        Thu, 15 Apr 2021 18:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zW+2RjEmQ33ClxtXsyeF3sXRy7GheA02ksCqVa3Oi5o=;
        b=Vx/hKylt6Xe45ZhvpJZhO7s4wZ6BizS8QMcmoPZgyPUMfejuvrZenHFGHS60Bn8mqL
         bh7NqX1iD9BooWbcvRGv404xaB3c36HSMWkaarH9r+IqZyzJH+0Ukzu2zfwvu9WXOWha
         TxZQUIchEDefcvolaxckuC+fyn0QatNkk1nSu2NJFyt8d1+t2AvmpN3Ymcz1cMVn/sLu
         iT/vZpzUyJYUJ5Q0oAX77irBvR2bpX8SD34G/L2iwmZsm/+U9PS2oIrUoozIThGl5cug
         zZYWdip2Pc6vD42Jbn5tjHKut/J/q1qrUBW4mC8kZ8DQh+pQ8S/hiS9mIO1h3C3Ntuxh
         aIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zW+2RjEmQ33ClxtXsyeF3sXRy7GheA02ksCqVa3Oi5o=;
        b=Brxw3daqSFhiu5AK1RUZNogrDQ1BPLE866EJIg51x2CsepIjLlPp4iNzzpXbyL+nQ0
         3S7DhAnAQmZRLbeSJM0C5QYiJ1PuseCRUs0ERfc0AIEhdggaDYtlQzzCuLdOYmUdF+tY
         a3IV+Xgejz/pJc0Mh7PsexhLceLvjA09XxsYg4Q8IJSBpjYJwZzkqaeokdSaeG9QQRKl
         rBfnYT5XX3mv7mcr8Jp5ZVmFTXfxv6T0aSqVRl2AF4/vFeyfwKufSfPpEzd4R6lacqm4
         dJlkkj4scFXJADtm6LdkpBnAGWWYeJVFO2sN+JilNpJm1rwyPUMMKkYtS5+VqS9pNvJe
         4x6w==
X-Gm-Message-State: AOAM532hEfO6wEjrGNACoIMWEXfUpNVDzzvNpnZOBD0B50rKFlaMpiVD
        6db1dV/Tdx+3Be1VYpyyDLY=
X-Google-Smtp-Source: ABdhPJz+X7KlZMN9/YSJKDyllmXtRhLjlKGfoKGGlLj+rhTaMtcvGTNXrb0BVe2L4xoHvAe9DXhrAg==
X-Received: by 2002:a17:902:c3d4:b029:eb:4d0c:7d1f with SMTP id j20-20020a170902c3d4b02900eb4d0c7d1fmr6952420plj.57.1618535092361;
        Thu, 15 Apr 2021 18:04:52 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id c125sm3023843pfa.74.2021.04.15.18.04.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 18:04:52 -0700 (PDT)
Date:   Thu, 15 Apr 2021 18:04:45 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
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
Message-ID: <20210416010444.GA17388@taoren-ubuntu-R90MNF91>
References: <20210416001208.16788-1-rentao.bupt@gmail.com>
 <469ac948-d65b-471f-102f-726466c19c5c@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <469ac948-d65b-471f-102f-726466c19c5c@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Apr 15, 2021 at 05:50:32PM -0700, Guenter Roeck wrote:
> On 4/15/21 5:12 PM, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
> > handler to avoid potential integer overflow when the supplied timeout is
> > greater than aspeed's maximum allowed timeout (4294 seconds).
> > 
> > Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> > Reported-by: Amithash Prasad <amithash@fb.com>
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  drivers/watchdog/aspeed_wdt.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> > index 7e00960651fa..9f77272dc906 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -145,9 +145,8 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
> >  	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
> >  	u32 actual;
> >  
> > -	wdd->timeout = timeout;
> > -
> > -	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> > +	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
> > +	wdd->timeout = actual;
> >  
> >  	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
> >  	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> > 
> 
> If the provided timeout is larger than the supported hardware timeout,
> the watchdog core will ping the hardware on behalf of userspace.
> The above code would defeat that mechanism for no good reason.
> 
> NACK.
> 
> Guenter

Thanks Guenter for Joel for the quick review!

The integer overflow happens at (actual * WDT_RATE_1MHZ). For example,
if a user tries to set timeout to 4295 seconds, then the hardware would
be programmed to timeout after about 32 milliseconds. I would say this
behavior is not expected?


Cheers,

Tao
