Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2937E179634
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Mar 2020 18:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729750AbgCDRCt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Mar 2020 12:02:49 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37782 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgCDRCt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Mar 2020 12:02:49 -0500
Received: by mail-pl1-f193.google.com with SMTP id b8so1270216plx.4;
        Wed, 04 Mar 2020 09:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N9lOtVrft0/qB707n6HjzkBxcOjRFvTGY92Y8JzpDCQ=;
        b=XabP4KAApP77XUAYcTnaIzXQeuabw9MkJ0yRu6X8zGBT+xeGPMG7bwJf1sX53KoR/p
         L09+g2GDYU1oTPBxZAvl+zxP0lcii67bfIpL6/nQJTIdkXFaWJEdavS1VUGZ/VwKnUOT
         bbLmQoiMta+UPN0T53/2FLS90bd6d9OJtJ6pU/j02DKVv+ZDWKa7AX42mxClYzILIzTD
         4A/3xllTeQN8PUVk3EMmJZdmJ9Mfr9/5alqR6qNLy43X+ZMwsq4J1HsRP1DSrJ44hHHP
         AAtwRewPBGHDO2IJrF0XyerLMkRwCAY++ypMhtVqCpBslhW5+bB6nH+lKA6NbZ6NRkvB
         YEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=N9lOtVrft0/qB707n6HjzkBxcOjRFvTGY92Y8JzpDCQ=;
        b=c7Dj4jvQW2Jz4KztdZNzw8GbcEgU/aRibEjkcx+SVkzfUh7Dpl26X+fQYKmYi0gTY0
         V8XkxTzAP7q0Dbh+/it4Nomv9O+EKzZOEcNDOldy/w1JKjjfNkT+Hqo9n7TncIPwMeUo
         ECffFPDeOpBpPG/Z/KW0RvonuQ4uKwfBzVjVs2XqPdaq6OHDc0/BKrMUNpk3oOCodp2c
         WfvRva0ivwLPKD+o4G+WEznYyTKU0K6cQl545qxLPgXs6UG6pKJdF/eOK5rfdVTbifb5
         s/+KiOZBwCmhsYivcJ+dgTbX6pKotwWBmvl2jupLQHoRcVybbRpwT1WUittYkwB/fzNH
         3vKA==
X-Gm-Message-State: ANhLgQ1X6vD4T79h4o1UYk2WR0rejpuOcr2/KORTb4gFmuABqgQUanN5
        KTwnS//GbmtHq8dhaaLddIg=
X-Google-Smtp-Source: ADFU+vuHh3uIaECJkr38nrkoc1tUd41kATobscfYurPIlrK7EFpgGljUrjyHqxOx5ZtQW8+RyFGOTw==
X-Received: by 2002:a17:902:b085:: with SMTP id p5mr3882183plr.218.1583341367729;
        Wed, 04 Mar 2020 09:02:47 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b184sm15647035pfb.89.2020.03.04.09.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 09:02:46 -0800 (PST)
Date:   Wed, 4 Mar 2020 09:02:45 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 3/3] watchdog: npcm: remove whitespaces
Message-ID: <20200304170245.GA22851@roeck-us.net>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
 <20200303100114.87786-4-tmaimon77@gmail.com>
 <20200303212512.GA20448@roeck-us.net>
 <CAP6Zq1gW53NEH7vD9C9GK2sg1pOxeZinA5uMJQQmbntrf=2ySA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1gW53NEH7vD9C9GK2sg1pOxeZinA5uMJQQmbntrf=2ySA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Mar 04, 2020 at 10:18:12AM +0200, Tomer Maimon wrote:
> Hi Guenter,
> 
> I still see the whitespaces warning in v5.6-rc4
> 
> https://github.com/torvalds/linux/blob/master/drivers/watchdog/npcm_wdt.c#L106
> 
You are corerct, sorry. No idea what I looked at yesterday.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> bash-4.2$ ./scripts/checkpatch.pl --strict --file
> drivers/watchdog/npcm_wdt.c
> CHECK: Please don't use multiple blank lines
> #106: FILE: drivers/watchdog/npcm_wdt.c:106:
> +
> +
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #112: FILE: drivers/watchdog/npcm_wdt.c:112:
> + else if (timeout < 3)
> +      wdd->timeout = 2;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #114: FILE: drivers/watchdog/npcm_wdt.c:114:
> + else if (timeout < 6)
> +      wdd->timeout = 5;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #116: FILE: drivers/watchdog/npcm_wdt.c:116:
> + else if (timeout < 11)
> +      wdd->timeout = 10;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #118: FILE: drivers/watchdog/npcm_wdt.c:118:
> + else if (timeout < 22)
> +      wdd->timeout = 21;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #120: FILE: drivers/watchdog/npcm_wdt.c:120:
> + else if (timeout < 44)
> +      wdd->timeout = 43;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #122: FILE: drivers/watchdog/npcm_wdt.c:122:
> + else if (timeout < 87)
> +      wdd->timeout = 86;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #124: FILE: drivers/watchdog/npcm_wdt.c:124:
> + else if (timeout < 173)
> +      wdd->timeout = 172;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #126: FILE: drivers/watchdog/npcm_wdt.c:126:
> + else if (timeout < 688)
> +      wdd->timeout = 687;
> 
> WARNING: suspect code indent for conditional statements (8, 14)
> #128: FILE: drivers/watchdog/npcm_wdt.c:128:
> + else
> +      wdd->timeout = 2750;
> 
> Thanks,
> 
> Tomer
> 
> On Tue, 3 Mar 2020 at 23:25, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > On Tue, Mar 03, 2020 at 12:01:14PM +0200, Tomer Maimon wrote:
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >
> > Turns out this problem does not actually exist in the upstream driver
> > (as of v5.6-rc4). You might want to align your code with the upstream
> > kernel.
> >
> > Guenter
> >
> > > ---
> > >  drivers/watchdog/npcm_wdt.c | 19 +++++++++----------
> > >  1 file changed, 9 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > > index 84a728af6664..bd38bf1ee6a1 100644
> > > --- a/drivers/watchdog/npcm_wdt.c
> > > +++ b/drivers/watchdog/npcm_wdt.c
> > > @@ -123,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device
> > *wdd)
> > >       return 0;
> > >  }
> > >
> > > -
> > >  static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
> > >                               unsigned int timeout)
> > >  {
> > >       if (timeout < 2)
> > >               wdd->timeout = 1;
> > >       else if (timeout < 3)
> > > -           wdd->timeout = 2;
> > > +             wdd->timeout = 2;
> > >       else if (timeout < 6)
> > > -           wdd->timeout = 5;
> > > +             wdd->timeout = 5;
> > >       else if (timeout < 11)
> > > -           wdd->timeout = 10;
> > > +             wdd->timeout = 10;
> > >       else if (timeout < 22)
> > > -           wdd->timeout = 21;
> > > +             wdd->timeout = 21;
> > >       else if (timeout < 44)
> > > -           wdd->timeout = 43;
> > > +             wdd->timeout = 43;
> > >       else if (timeout < 87)
> > > -           wdd->timeout = 86;
> > > +             wdd->timeout = 86;
> > >       else if (timeout < 173)
> > > -           wdd->timeout = 172;
> > > +             wdd->timeout = 172;
> > >       else if (timeout < 688)
> > > -           wdd->timeout = 687;
> > > +             wdd->timeout = 687;
> > >       else
> > > -           wdd->timeout = 2750;
> > > +             wdd->timeout = 2750;
> > >
> > >       if (watchdog_active(wdd))
> > >               npcm_wdt_start(wdd);
> >
