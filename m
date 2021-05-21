Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA86838BBFF
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 May 2021 03:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237692AbhEUBxX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 21:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237578AbhEUBxX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 21:53:23 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEE9C061574;
        Thu, 20 May 2021 18:52:01 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id s20so10123296plr.13;
        Thu, 20 May 2021 18:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TeR6dx8Rqr3ByExvzXzaPr3AoEZSg27P4QPA34TUl50=;
        b=MGywRptRl4M03Loj0uWb0Q68foEF2W7FLLb6e2Y3yaSpAS41cQJOIlc+Yodwrt14+B
         o5A8zY9VfTUFffOgbb7ZCroEftruHMd3VvG0Xksws27jXojgM5CKt9ZQ5MknLgvgetlm
         Qozs9MN+rdGEoiOix5e5xIOU3ppyzW4RuIi+A7iMMzjkpBE9NtZLzOaIAVmamQr4RsCW
         ft1FDBQy++SQwvzxEx/ipWcZ+SL7sMpanfO1ViUsK6G98HM469/Z48/lA6lPpBAdNbQw
         bFaHu86UWSMGHMRuqp5UMqyqmk9RU9qLDXzaT4bnkhcZHGFh/CR3h1Z0NlgRXQu4zGzX
         CrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TeR6dx8Rqr3ByExvzXzaPr3AoEZSg27P4QPA34TUl50=;
        b=IUecRMNJnYtLlUTaCneIIz/sTzUtvFoIWR2jeBnotvFHJHDFHULTtTJP6w9mlRnxi5
         gYhJge+6ayR7EQSTSL/eGGf/XL7PUrP8QBQeP/VLab7TPfiCcy/2W8YkNx8umhx+/WTo
         mpNW9Etrf8DNa+kZXaq2uOVxt+jjtpevOhrzgDsZhpTbXXdV1gd0jFn55RweIqhHZX1e
         lZ462EsVpdR60GUYYmj62e9aUjyLO+sdAA5aJMt66G9Ni/lOyvK8Ru0MX6i3Dig4voeq
         9JGojU5dSL3ypwuIcCVkUpTCvhCHcKr8vFxLWdASzPJxxiGC0qpmDSMwY7puZfHDznIo
         7gYA==
X-Gm-Message-State: AOAM530ccbGZ8jV6J+YEDRPZnLGN4dhfVqY7yJ+c0zaAUnaNCDj9c1ZF
        QmRopnCSa6dwTRSbufihr0MCU95VIvaINJ9G
X-Google-Smtp-Source: ABdhPJyIynOYYSDS+EbUq2ewNtwe4ZXjkjDPNl8WBvxs05rpGvv+SWNeotnMz6g0roHINjQ+ss8nrg==
X-Received: by 2002:a17:90a:4404:: with SMTP id s4mr8354235pjg.218.1621561921013;
        Thu, 20 May 2021 18:52:01 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id u6sm2538958pjy.51.2021.05.20.18.51.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 18:52:00 -0700 (PDT)
Date:   Thu, 20 May 2021 18:51:53 -0700
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
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
 <20210417042048.GA109800@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417042048.GA109800@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wim,

Not sure if I looked at the wrong repository/branch, and looks like the
patch is not included. Do you have any further suggestions? Or should I
send out v2 in case it's missed?


Thanks,

Tao

On Fri, Apr 16, 2021 at 09:20:48PM -0700, Guenter Roeck wrote:
> On Fri, Apr 16, 2021 at 08:42:49PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Fix hardware timeout calculation in aspeed_wdt_set_timeout function to
> > ensure the reload value does not exceed the hardware limit.
> > 
> > Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> > Reported-by: Amithash Prasad <amithash@fb.com>
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> > ---
> >  drivers/watchdog/aspeed_wdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> > index 7e00960651fa..507fd815d767 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -147,7 +147,7 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
> >  
> >  	wdd->timeout = timeout;
> >  
> > -	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> > +	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
> >  
> >  	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
> >  	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> > -- 
> > 2.17.1
> > 
