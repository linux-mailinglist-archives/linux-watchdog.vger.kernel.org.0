Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4BB356743
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Apr 2021 10:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349704AbhDGIyy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Apr 2021 04:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349708AbhDGIyp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Apr 2021 04:54:45 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2E1C0613DA;
        Wed,  7 Apr 2021 01:54:08 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id h20so8993845plr.4;
        Wed, 07 Apr 2021 01:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vFuhnvS9PpwlrcTjjiFkrfy0PJPiELTxAIn4Extsom4=;
        b=dGKUVNcNMjCz+YOznFlGYz9lFtEhWUgJDvgtDmm0q7UEuYfgaVwMCdL2BKcZHMgdGq
         2H4zjKd1JwumH8yLpXTouLl8JcQHC7b8LeBnIojY1WkMxUU3bKLnsl90OH2G77QUHuCl
         SpTtjhTruKdkpXm1T2XTea9YwJhTcA9g0RgmjKRIGErcyIrz10J/vNBJYPdR3lWeDJXD
         XUV6/GfN0QtobY+bCzfV9usCAV65AztP4vnpRHTEY7lrp0dnQRnc6mljJTl/96fJP+xT
         q3pEyB88+pHQD+aRAtS8+0eWlRlGiJ9hWDB75pze3mfHPr1VWVn+4Z6pTEs7esNFolgO
         3qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vFuhnvS9PpwlrcTjjiFkrfy0PJPiELTxAIn4Extsom4=;
        b=g4IM5XHIcLxQx3hnECqVMadM5Fb09zBJNi5HSxuc1CD5Nga6uzclSufbanTQHwp8pu
         esWk1OhN038iTJwBavfUEfSbsBUV34oNG8pgxCAz2q4Ws96FcbkYjHVG+EwWLqc7PAkw
         ArppLP+qKRSFDTzPouu6iWFfq5revvjiU3mCWwlscDNIq4EKUSZFkVp/tblVIChNqBo2
         240N11TuRYb+VqHGrdC0QGaxmVL3frUfhprG7JMyve9esCSV1scA60evvG6Lx/JJh+UT
         4yAe3GbF75h3ufAfSyr+WoC/pljSAnOJ/r53Vhg2IFYJAX1GEM+K5YuA75eqaXPMQDXm
         RwbA==
X-Gm-Message-State: AOAM533BIiohn47yztcxWwqVONiLtSHheIgJO2xF0Cxrra8eRRX6b7/b
        CAm/YR8XeDB4HE7hjKPLc/KAqITCWXEhXxB788A=
X-Google-Smtp-Source: ABdhPJwE7ooYDZZVMupsvAqrTL+RvJkEstIbOd4aHNX4CtOLVq027XiD1o7TwCYrvsYP0A1pu0WFlq6GktkauAq0Rs4=
X-Received: by 2002:a17:90a:5407:: with SMTP id z7mr2339028pjh.228.1617785647811;
 Wed, 07 Apr 2021 01:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-4-henning.schild@siemens.com> <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
 <20210406165247.78791bf7@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210406165247.78791bf7@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Apr 2021 11:53:51 +0300
Message-ID: <CAHp75VcOw0WD8s9ZP=-N5Gesmfx0UEkV5s7SSwDwCzYDYoVuPg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Apr 6, 2021 at 5:56 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> Am Thu, 1 Apr 2021 18:15:41 +0200
> schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:
>
> > On 29.03.21 19:49, Henning Schild wrote:
> >
> > Hi,
> >
> > > This driver adds initial support for several devices from Siemens.
> > > It is based on a platform driver introduced in an earlier commit.
> >
> > Where does the wdt actually come from ?
> >
> > Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a pretty
> > usual case.
> >
> > Or some external chip ?
>
> I guess external chip, but again we are talking about multiple
> machines. And the manuals i read so far do not go into that sort of
> detail. In fact on some of the machines you will have two watchdogs,
> one from the SoC and that "special" one.
> That has several reasons, probably not too important here. The HW guys
> are adding another wd not just for fun, and it would be nice to have a
> driver.
>
> > The code smells a bit like two entirely different wdt's that just have
> > some similarities. If that's the case, I'd rather split it into two
> > separate drivers and let the parent driver (board file) instantiate
> > the correct one.
>
> Yes, it is two. Just like for the LEDs. One version PIO-based another
> version gpio/p2sb/mmio based.

I tend to agree with Enrico that this should be two separate drivers.

> In fact the latter should very likely be based on that gpio pinctl,
> whether it really needs to be a separate driver will have to be seen.
> There are probably pros and cons for both options.


-- 
With Best Regards,
Andy Shevchenko
