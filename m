Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8091A1B10B9
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Apr 2020 17:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgDTPxD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Apr 2020 11:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgDTPxD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Apr 2020 11:53:03 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C74DC061A0C;
        Mon, 20 Apr 2020 08:53:02 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a22so20379pjk.5;
        Mon, 20 Apr 2020 08:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KpOu42kL/pQUGpBchlxGpON9Ofes9T2Kauo44/uMQ/Q=;
        b=CY2i3G+JUCNbfJUUootRFUoK9Eo6VDW8N775KqtVJxSrhmBDxbj9XiNEYT0X5rUyPJ
         Vj1dOsJssQLlQiPZvpV1gczoFQrRLCNyOp1Ou1tg2bqdtH0FvSiZxKNyoZaybbh0BI2x
         fI4P1dV9O7gypHHn9yyiuNhj+wL12kKxEGia3qOARyaID9bvziFMjmZPB+2ha9y8to3p
         Nsy1aa3GJDsdIj06yYlIfQMqOj6+ioQh8OmhFh10ve3a6oB+HUp/zhmpXnEGOmTgIVbd
         jVMwkMv6FeoVV8q5BKlUrNieO7qp2GaMORvOaq2B6XZL19bVv4n8Bc4Fl4+C2Dz8R5g8
         qZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KpOu42kL/pQUGpBchlxGpON9Ofes9T2Kauo44/uMQ/Q=;
        b=CkDO1lWb6tw9Zc7w7X6nOdst9x9uIDtEj83Tz7N25Iuq9etIUjOBmYzqJzsgQZiKqx
         apzR9u8KUAjr3HKxtpDsFs0V3sd7//Ed9CAlZiEU1L+g0rsg620i6wfEiannlY/ZR4f0
         KcoFYhQy/jn/kiBAFYdvnIPcIjHoLz2kb6v+CaIN2dOdS6xKa4uTaKfGWGIsrCMCYbUN
         jtgw6DBpnBYoF6jIltxKqZToyA/8ZLkGehJwCn9rG9EspGyWe577WDcCmVIx6P21i2W3
         W/nbhhFB2Yez+wWPIxwDdRyhINsL4pBxC7IZ2I80eljb45iUXcGkMhTWpuEbOSOamHu1
         ytJw==
X-Gm-Message-State: AGi0PuY/vtzRVTkZIKJURZAWO8FaRFaSDisw5qQVuDWLoorw0dAf2XfC
        BkxBTejyaT2EL+objxvoTy2UbOSnsq/f8iHGxAvnl3LpV78=
X-Google-Smtp-Source: APiQypLIaJG3DtsZI4suVENYT2gkb+3YUhLFwswQ6fVzuIKkjdLgztB4zGiy/NWus0rd2QVE38hOSk/jBs6O1mZayJs=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr8228pjb.143.1587397981656;
 Mon, 20 Apr 2020 08:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200416163514.7334-1-michaelsh@mellanox.com> <CAHp75VfZLR0an_bkD0vK6sTQSTcf_xHbAB0i7Qbod02gpV4tzg@mail.gmail.com>
In-Reply-To: <CAHp75VfZLR0an_bkD0vK6sTQSTcf_xHbAB0i7Qbod02gpV4tzg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Apr 2020 18:52:55 +0300
Message-ID: <CAHp75VeXC=sMW54yGnSY6S-_kECXY+KURRt2LWGfBm5W14ue-w@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] support watchdog with longer timeout period
To:     michaelsh@mellanox.com
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        linux-watchdog@vger.kernel.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 17, 2020 at 4:41 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 16, 2020 at 7:35 PM <michaelsh@mellanox.com> wrote:
> >
> > From: Michael Shych <michaelsh@mellanox.com>
> >
> > This patchset adds support of extended new watchdog type 3 of Mellanox
> > Ethernet and Infiniband switch systems.
> > This type of watchdog can have a timeout period longer than 255 or 32 sec.
> > as it was before.
> >
>
> Pushed to my review and testing queue, thanks!

Withdrawn due to changes requested.
Please, address and resend.

>
>
> > Michael Shych (4):
> >   platform_data/mlxreg: support new watchdog type with longer timeout
> >     period
> >   platform/x86: mlx-platform: support new watchdog type with longer
> >     timeout
> >   watchdog: mlx-wdt: support new watchdog type with longer timeout
> >     period
> >   Documentation/watchdog: Add description of new watchdog type 3
> >
> >  Documentation/watchdog/mlx-wdt.rst   |   9 +++
> >  drivers/platform/x86/mlx-platform.c  | 106 +++++++++++++++++++++++++++++++
> >  drivers/watchdog/mlx_wdt.c           |  75 +++++++++++++++++++++----
> >  include/linux/platform_data/mlxreg.h |   5 +-
> >  4 files changed, 183 insertions(+), 12 deletions(-)
> >
> > --
> > 2.11.0
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
