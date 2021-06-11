Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248C63A44B9
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 17:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhFKPPh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 11:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhFKPPf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 11:15:35 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022B7C061574;
        Fri, 11 Jun 2021 08:13:26 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id t40so6122541oiw.8;
        Fri, 11 Jun 2021 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ufKTvffTzI/MVLuQy56QGZZwmhs4YEswKR70qkvnHFs=;
        b=hQWILQJ7QXdimjKvxJOOF81rdLgMrRTbatH4gulceMIocMsv0CatpoLO5Kn830/NEk
         dqR/2s/hKe+kmHjCi3wnpb8m1e3z8UzIEs35/au0oAS0q3vTShJSvMX8OLMm7afAlIk/
         7xQf17fOCccktl+fE86SSu+glpe+Hnf92mquhS4uy1IlqOcfAzdv+4JqAIk7e/bn6Rfg
         t7PoGgJ/3IFm05fey3YXMO2dH+Rjb3EO6PSqyWRyN3Jw6HM8s7/Op4y3zMagcw5Otsqs
         cI6frDabVPwVS21tdGyV/6/TjYIWymgWNc213+lMf31a5n3+jpZGgoHlO9ltD9HlrWJZ
         jOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=ufKTvffTzI/MVLuQy56QGZZwmhs4YEswKR70qkvnHFs=;
        b=R8m8YZ00AvEecYQHmC+weQY/zr5EGwwVi9p4D0dlVZHp6+8AR9XnZ1hf/7goti50mu
         EKyCu42ukxgqIE4ghFuY8XwESTS2I1stUmbeqjDXYW8LDFYa3tltQYeglGAJTcdV8IJI
         Fo5wGRf5pAhI0xcf7pqvLD15ZlZp/Da6HjUA/89CIGyscYL5HpwKYRC4MnuPFefXWSOm
         CurVHLnWM9Mj9aHjhhVISqA96Db39lNq7VT5DsnMJEfU4M74ugAA+ytlCbY2uXEOeJaU
         LI94qteKAla+vPKhpPggno4aBCnQ+ncR9GS03oP1XeSt38p2jJ5QM+2Cu4614MXmnHUb
         uv1w==
X-Gm-Message-State: AOAM533USXQauQWfaqFDMBsuLKHbrQJ0In74kbymi1jIsbmF041RhBgM
        Z1XgV6Yk/0nkSsctNKTR8Ak=
X-Google-Smtp-Source: ABdhPJwvJdQ6IyKYjmBYAE/X/77CzNBC3TdBnsmLSSPWCID1TALnPeHZ2SDHliMCKbeFDiqnmBREug==
X-Received: by 2002:aca:6109:: with SMTP id v9mr13615255oib.65.1623424405445;
        Fri, 11 Jun 2021 08:13:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a78sm1232057oii.42.2021.06.11.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 08:13:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Jun 2021 08:13:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] watchdog: Add Mstar MSC313e WDT driver
Message-ID: <20210611151322.GA4137959@roeck-us.net>
References: <20210605170441.33667-1-romain.perier@gmail.com>
 <20210605170441.33667-3-romain.perier@gmail.com>
 <20210611103426.GA3827319@roeck-us.net>
 <CABgxDoJhCiBoyJW3WOF9Jac9QcAfDxE5wND6gg1tvqd74hd+NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgxDoJhCiBoyJW3WOF9Jac9QcAfDxE5wND6gg1tvqd74hd+NQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 11, 2021 at 04:35:33PM +0200, Romain Perier wrote:
> Le ven. 11 juin 2021 à 12:34, Guenter Roeck <linux@roeck-us.net> a écrit :
> >
> > On Sat, Jun 05, 2021 at 07:04:40PM +0200, Romain Perier wrote:
> > > From: Daniel Palmer <daniel@0x0f.com>
> > >
> > > It adds a driver for the IP block handling the watchdog timer found for
> > > Mstar MSC313e SoCs and newer.
> > >
> > > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> > > Co-developed-by: Romain Perier <romain.perier@gmail.com>
> > > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > >  MAINTAINERS                    |   1 +
> >
> > I tried to apply this patch to my tree, but it doesn't apply because ...
> >
> > >  drivers/watchdog/Kconfig       |  12 +++
> > >  drivers/watchdog/Makefile      |   1 +
> > >  drivers/watchdog/msc313e_wdt.c | 166 +++++++++++++++++++++++++++++++++
> > >  4 files changed, 180 insertions(+)
> > >  create mode 100644 drivers/watchdog/msc313e_wdt.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index a0f37adb9e64..fcc10c57298c 100644
> >
> > a0f37adb9e64 is not an upstream SHA and there is a conflict. Please resend
> > the series based on some upstream tag.
> >
> > Guenter
> 
> Arf, I will rebase and resend then, my bad. It is okay if I rebase the
> series onto https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> , branch watchdog-next ?
> 
Please just base it on the latest upstream release tag (currently v5.13-rc5).
Git can handle it as long as the base tag is stable.

Thanks,
Guenter
