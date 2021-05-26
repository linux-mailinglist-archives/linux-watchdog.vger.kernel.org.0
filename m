Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8354B3920CC
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 May 2021 21:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbhEZT0D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 May 2021 15:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhEZT0C (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 May 2021 15:26:02 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC927C061574;
        Wed, 26 May 2021 12:24:29 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y76so2624667oia.6;
        Wed, 26 May 2021 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mMr84wnW79eJ+bLd6qGzg7fkB7rh5OToBUejvhaMQJI=;
        b=cUPHV+Io0Nsf4MIPPGV6JPdt5NqOOskBJGEx1I/WkMW0nGYdZU48WuSeJm3GamIidT
         Sy/0/U+Xmd5+2Nk8E0uTtFoZaHHiJazee6qRwCXnx9pw9tkruqPEB4jYR6kv21aAg7VA
         4kIGjBO+P3xnLFsH6EU4TCAU3Hu7ZjQ5jiogcx7gd8aAgw4oymBjOlOetNEvgPW+/U4X
         902vgfb8W7OpyXhamNERFfXXbXGehDEUF96W67zxIpCEtRoUf8xW97udmHBQHjv7+VGx
         +d93zivxGBG+zD5nn9HG7eDpXql1MdFhJdp1XR4/bIW+LAlmRiueJhdOoSFhxeFqKUma
         qF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mMr84wnW79eJ+bLd6qGzg7fkB7rh5OToBUejvhaMQJI=;
        b=QbavI4OOdFDZdH+9ZqhgSye2PmmjJvB9J9bdzwVHQl+xmDRjiwYxZAzlSvNcta22kh
         GCZoBtXBZj89nsGt9GjxsmWUTaItArdHiCJ9tVW755uTfI41gz93i+mm0AIDF1owUm7a
         iQ3ClkelRJfvXut855m1j9zd6NkQ3GT+R+8MwEY3llD06fFRtpEnoa2+QtNQVWQx8LVB
         Tqd74v3+erLn7gRyNX+1kksMaXlJb/pwqX2T1WnKZsLXWnEdB9+Awr/5L/Hu7x28pT1u
         PhG+e/dEtIUJNC7QWbkT5w/qD2i0lodpJrdIHwRK5HxVM16lzjSjFr5cgBu/UuhSapgP
         LXWw==
X-Gm-Message-State: AOAM5306GsR3kSahiGw9mG7wLm6o9cL6qob1ljyaJB+tOJpLgAfS2GmO
        GFdy+MwSBQYOshXJ3SxJPN4E+V9pdrpKfq3PSpo=
X-Google-Smtp-Source: ABdhPJxYd77i/ganESJH9u6Q39LnWFqKNrqRv+AIw77ejduNuBhTpthz6X4nRwHGYXpVAnaqohkCrCgb02MSxBnlhOU=
X-Received: by 2002:aca:2b17:: with SMTP id i23mr3063425oik.87.1622057069090;
 Wed, 26 May 2021 12:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210525184449.57703-1-romain.perier@gmail.com>
 <20210525184449.57703-3-romain.perier@gmail.com> <5ce3b5a5-1500-0d95-623e-299e7b1eb43b@roeck-us.net>
In-Reply-To: <5ce3b5a5-1500-0d95-623e-299e7b1eb43b@roeck-us.net>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Wed, 26 May 2021 21:24:16 +0200
Message-ID: <CABgxDo+6fORohKH_VAw4ZuYVUYoGbo=a-Ckmv8Q5QkEtEZWGJQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] watchdog: Add Mstar MSC313e WDT driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,


Le mar. 25 mai 2021 =C3=A0 21:52, Guenter Roeck <linux@roeck-us.net> a =C3=
=A9crit :
>
> On 5/25/21 11:44 AM, Romain Perier wrote:
> > From: Daniel Palmer <daniel@0x0f.com>
> >
> > It adds a driver for the IP block handling the watchdog timer found for
> > Mstar MSC313e SoCs and newer.
> >
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> > Co-developed-by: Romain Perier <romain.perier@gmail.com>
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> >   MAINTAINERS                    |   1 +
> >   drivers/watchdog/Kconfig       |  13 +++
> >   drivers/watchdog/Makefile      |   1 +
> >   drivers/watchdog/msc313e_wdt.c | 173 ++++++++++++++++++++++++++++++++=
+
> >   4 files changed, 188 insertions(+)
> >   create mode 100644 drivers/watchdog/msc313e_wdt.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a0f37adb9e64..fcc10c57298c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2177,6 +2177,7 @@ F:      arch/arm/mach-mstar/
> >   F:  drivers/clk/mstar/
> >   F:  drivers/gpio/gpio-msc313.c
> >   F:  drivers/pinctrl/pinctrl-msc313.c
> > +F:   drivers/watchdog/msc313e_wdt.c
> >   F:  include/dt-bindings/clock/mstar-*
> >   F:  include/dt-bindings/gpio/msc313-gpio.h
> >   F:  include/soc/mstar/
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 355100dad60a..f53634ea0de6 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -980,6 +980,19 @@ config VISCONTI_WATCHDOG
> >         Say Y here to include support for the watchdog timer in Toshiba
> >         Visconti SoCs.
> >
> > +config MSC313E_WATCHDOG
> > +     tristate "MStar MSC313e watchdog"
> > +     depends on ARCH_MSTARV7 || COMPILE_TEST
> > +     depends on OF
> > +     select WATCHDOG_CORE
> > +     help
> > +       Say Y here to include support for the Watchdog timer embedded
> > +       into MStar MSC313e chips. This will reboot your system when the
> > +       timeout is reached.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called msc313e_wdt.
> > +
> >   # X86 (i386 + ia64 + x86_64) Architecture
> >
> >   config ACQUIRE_WDT
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index a7eade8b4d45..7fa392ae3000 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -92,6 +92,7 @@ obj-$(CONFIG_SPRD_WATCHDOG) +=3D sprd_wdt.o
> >   obj-$(CONFIG_PM8916_WATCHDOG) +=3D pm8916_wdt.o
> >   obj-$(CONFIG_ARM_SMC_WATCHDOG) +=3D arm_smc_wdt.o
> >   obj-$(CONFIG_VISCONTI_WATCHDOG) +=3D visconti_wdt.o
> > +obj-$(CONFIG_MSC313E_WATCHDOG) +=3D msc313e_wdt.o
> >
> >   # X86 (i386 + ia64 + x86_64) Architecture
> >   obj-$(CONFIG_ACQUIRE_WDT) +=3D acquirewdt.o
> > diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_=
wdt.c
> > new file mode 100644
> > index 000000000000..434259256967
> > --- /dev/null
> > +++ b/drivers/watchdog/msc313e_wdt.c
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * MStar WDT driver
> > + *
> > + * Copyright (C) 2019 - 2021 Daniel Palmer
> > + * Copyright (C) 2021 Romain Perier
> > + *
> > + */
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/module.h>
> > +#include <linux/watchdog.h>
> > +#include <linux/io.h>
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
>
> Alphabetic order, please.

Ack, I will fix it.

> Also, please drop unneeded include files.
> The driver doesn't support interrupts, so any interrupt related
> include file is unnecessary. I also don't see any devicetree specific
> code except for of_device_id, and that is declared in mod_devicetable.h,
> not in an of_xxx.h include file.

Arf, in fact an interrupt was used previously (it triggers when the
wdt reaches a specific value
that is not necessarily the value of the initial timeout), but I have
decided to remove it because
not really useful. And I have kept some headers, sorry for that. I will fix=
 it.

>
> > +
> > +#define REG_WDT_CLR                  0x0
> > +#define REG_WDT_MAX_PRD_L            0x10
> > +#define REG_WDT_MAX_PRD_H            0x14
> > +
> > +#define MSC313E_WDT_DEFAULT_TIMEOUT  30
> > +/* Supports 1 - 350 sec */
>
> Doesn't that depend on the clock freqneucy ?
> More on that see below.
>
> > +#define MSC313E_WDT_MIN_TIMEOUT              1
> > +#define MSC313E_WDT_MAX_TIMEOUT              350
> > +
> > +static unsigned int timeout;
> > +
> > +module_param(timeout, int, 0);
> > +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> > +
> > +struct msc313e_wdt_priv {
> > +     void __iomem *base;
> > +     struct device *dev;
>
> I don't immediately see where 'dev' is used.
>
> > +     struct watchdog_device wdev;
> > +     struct clk *clk;
> > +};
> > +
> > +static int msc313e_wdt_start(struct watchdog_device *wdev)
> > +{
> > +     struct msc313e_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +     u32 timeout;
> > +     int err;
> > +
> > +     err =3D clk_prepare_enable(priv->clk);
> > +     if (err) {
> > +             dev_err(priv->dev, "failed to enable clock\n");
>
> Ah, here. I am not sure if I like that error message - it is going to be
> persistent and may create a lot of noise if it is ever seen, and pretty m=
uch
> useless otherwise. Either case, if you insist on the message, I'd suggest
> to use wdev->parent.

Honestly ? It is mostly to avoid silent errors, but I can also return
an error directly, yep (I mean
just return the error code). The userspace app is supposed to check
the error code returned by ioctl. No objection
for removing the message (and so priv->dev too).

>
> > +             return err;
> > +     }
> > +     timeout =3D wdev->timeout * clk_get_rate(priv->clk);
>
> How is it guaranteed that this won't overflow ? The maximum timeout is no=
t
> tied to the clock frequency. This will overflow if the clock frequency is
> above 0xffffffff / 350 =3D 12271335 Hz and the timeout is sufficiently la=
rge.
>

Ah good catch ! Mhhhhh we could compute max_timeout dynamically
from the probe function. So, we allow  the maximum possible value just
before the overflow. The units are different but there is something
similar in meson_wdt.c  .

Anyway, I will think about it and propose a fix.


Thanks,
Romain
