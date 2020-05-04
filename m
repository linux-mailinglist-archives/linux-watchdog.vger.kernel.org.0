Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2DF1C3B67
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 May 2020 15:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgEDNjs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 4 May 2020 09:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726913AbgEDNjr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 4 May 2020 09:39:47 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B632FC061A0E;
        Mon,  4 May 2020 06:39:47 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so5515831pfa.9;
        Mon, 04 May 2020 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XRKbCjgZOqFk9x0+yQjHYARwBS2upPLIMZRloE5ULhc=;
        b=eIZlYcsznQmUy+Hxw6LRutToMtwbW9wU6IiVEcZBXgPO4Ic+i1xVyOniiOjTQSMm3a
         pzHsOwMikoe/KczJNqp8vl0XLpidEaViP0+hIyb4bHuc2M7pacIa9vxZIiJlJBAOEM8u
         jrEH+wscyRtus26uYOCyFFJgP+yDGgsR2Naun9hfL5viMknx25LlB1I52HWUZtE9F5La
         kT5dDtFAqVEObnBs6kvUlYJHMllCNcWpgpHSRA3aac9LcisRawoZ1VlJEE/sCXwkWO45
         +QVIo4DM/L+hg64/VWHQi2Or7Msm+JrA2kUoYveO/bdmJwdqUbPbm1PvPEfQgq5ouHoL
         pymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XRKbCjgZOqFk9x0+yQjHYARwBS2upPLIMZRloE5ULhc=;
        b=B90baIn+NBfkL49Quior0ThuRvMRt4D3MLt02XRAWAneYNcJ3mwFQwbTrKa5B3/idP
         hGDiVlhYbd4f/VisG1wXeJlVDwSPz8R3fxD4jN3FtAT6ePz+6NMqdkEr/o9YW/6ZwMoW
         MycKhSMC3aNrKmynb0QTTQEUOL6hM3OXvEDEH6YyzJx/p/AVmeuBafdZYY08EJuJTlpZ
         /7iVqfwALEthg+35M8g7qbr0Gi/T3MjVKwJ0wBnYs4w1b4nS4RlM5555J7UJTj9+z6cs
         osfJB14iI5X4vP9/Xh9rtkN2hF69ku9I8K17xTgtlA4fM8/Cxoy58w1PoTGIZXXW73PQ
         WjSQ==
X-Gm-Message-State: AGi0PuYqExiiOY1pfXwc9SidvRPqLZzxU5YMb8eU8Hpu0A176Qr0gQsP
        pdfxdc6WPv6EGN7/O6n6BT8=
X-Google-Smtp-Source: APiQypKZR5rr6LkHP9yoy3JDqwQuhqEIne3cyhNbW6zHHEr4Z2TEy5xtdslrVMoWXIw5WuYE/I6jBg==
X-Received: by 2002:a63:7c1d:: with SMTP id x29mr8729207pgc.422.1588599586997;
        Mon, 04 May 2020 06:39:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 18sm7191917pjf.30.2020.05.04.06.39.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 06:39:46 -0700 (PDT)
Date:   Mon, 4 May 2020 06:39:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Michael Shych <michaelsh@mellanox.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH v3 0/4] support watchdog with longer timeout period
Message-ID: <20200504133945.GA86470@roeck-us.net>
References: <20200503053424.31943-1-michaelsh@mellanox.com>
 <CAHp75Vff-xe06L1xOc9jMii+kEPJZzmiPBFPVMkeD46v0QW+hw@mail.gmail.com>
 <AM6PR05MB6168FA74FF9554A3E33601D1D9A90@AM6PR05MB6168.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR05MB6168FA74FF9554A3E33601D1D9A90@AM6PR05MB6168.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, May 03, 2020 at 04:13:54PM +0000, Michael Shych wrote:
> 
> 
> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Sunday, May 3, 2020 7:11 PM
> > To: Michael Shych <michaelsh@mellanox.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>; Wim Van Sebroeck <wim@linux-
> > watchdog.org>; Andy Shevchenko <andy@infradead.org>; Darren Hart
> > <dvhart@infradead.org>; linux-watchdog@vger.kernel.org; Platform Driver
> > <platform-driver-x86@vger.kernel.org>; Vadim Pasternak
> > <vadimp@mellanox.com>
> > Subject: Re: [PATCH v3 0/4] support watchdog with longer timeout period
> > 
> > On Sun, May 3, 2020 at 8:34 AM <michaelsh@mellanox.com> wrote:
> > >
> > > From: Michael Shych <michaelsh@mellanox.com>
> > >
> > > This patchset adds support of extended new watchdog type 3 of Mellanox
> > > Ethernet and Infiniband switch systems.
> > > This type of watchdog can have a timeout period longer than 255 or 32 sec.
> > > as it was before.
> > >
> > 
> > If you ignore my tags, why are you bothering about changes at all?
> 
> Sorry that I missed it.
> Should I resend this patchset?
> If yes, as still v3 or new one v4?
> 
If you resend as v3 but make changes, how do you expect the maintainers
to know which v3 is the correct one ?

Guenter

> > 
> > > Michael Shych (4):
> > >   platform_data/mlxreg: support new watchdog type with longer timeout
> > >     period
> > >   platform/x86: mlx-platform: support new watchdog type with longer
> > >     timeout
> > >   watchdog: mlx-wdt: support new watchdog type with longer timeout
> > >     period
> > >   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
> > >
> > >  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
> > >  drivers/platform/x86/mlx-platform.c  | 106
> > ++++++++++++++++++++++++++++++
> > >  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
> > >  include/linux/platform_data/mlxreg.h |   5 +-
> > >  4 files changed, 182 insertions(+), 12 deletions(-)
> > >
> > > --
> > > 2.11.0
> > >
> > 
> > 
> > --
> > With Best Regards,
> > Andy Shevchenko
