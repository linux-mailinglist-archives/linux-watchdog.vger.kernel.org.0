Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B333503B3
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Mar 2021 17:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235706AbhCaPlJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Mar 2021 11:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235615AbhCaPkk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Mar 2021 11:40:40 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8BFC061574;
        Wed, 31 Mar 2021 08:40:39 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v23so8103326ple.9;
        Wed, 31 Mar 2021 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R6vLllu9NqucYXJnQP0Sflwu7dB317CsKp7w2fmXXOU=;
        b=iqNHS7tFCrbcBhgDkH9R3OIxnlD/q3+u1fbyGpF47PAhllzkR+CWKoMzHvzJd9AQEc
         NNItEbX4+t2n9J+oh/8FopoPdDgbWkzzZ3L8raSn0291kxGefxSG/RH3tyuerPO+9guV
         j2Dtn9mNYPWDEsPqWzmcwgrVcneKUIen5J7uyRTBGS0g+OTgI5HrDRdl/2rio+K9aZkz
         CeUYppQrihGYM2b19CgdJRQF3MwnBSwa9kyrRABFXdHR38tbWcpwYvi4XckYMiIK2xJF
         jhtXpF+Xd5ciq9x0HPohdqrNbXg9c+vIlR5DpjJRpRA1s9LVEkIMuZUhLp0IMJXsM6w2
         1cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R6vLllu9NqucYXJnQP0Sflwu7dB317CsKp7w2fmXXOU=;
        b=m0YNxpym2FWcjPfbrb2wuyZtEFYXIPXHAwZ9+e/rrq9cVrMnQtbL4aOwim7iPTvgW4
         4WO/QUMw1qBnv9ctqsducjZDHa697qM1NZ2WNfAGQnDs1fyCvaguKqCS7VRfO2kn4LAk
         2max/rTQQ5uoGWzY5B6qhESj0SNYpMQr9yRAtnOL8HIn23CE8qSaOpUnGf6RKFcdH6Iy
         g2PZa1iN3bFC7AIamrlbyDb2TLVP4LDzn1fqb044FI38csMYFibsy5/NJCfkccg4rT7J
         ypPstE8v4pxqG5nt5ZKUs+ZVfmO3aRSI33A0Q+Qchee7vFhIHzzwOwT2+ewSwj2v5iAP
         c/uw==
X-Gm-Message-State: AOAM532V2WGt0P0qW5JxPIDqhzp37ZuHxIJnBTukw2taYF1OCO4JBbo8
        B4aB8pSF76GWsJAf9EETtnEnLkQLaCDR3Ra3hiQ=
X-Google-Smtp-Source: ABdhPJwv2pyxhDNSlO7MQXhBGTADia4NSvtEr8A19JdTQLSff9QIY/yCzRKsle2Yiz/YnL7AN8zfL7P+bP08E/0vXqo=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr3801793plb.21.1617205239423; Wed, 31 Mar
 2021 08:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-3-henning.schild@siemens.com> <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
 <20210330135808.373c3308@md1za8fc.ad001.siemens.net> <CAHp75Vc0f0HfAJx0KPyQMWjekkhB_T-1+vuR566qAcYGA2JLJA@mail.gmail.com>
 <20210330143011.0e8ae4a0@md1za8fc.ad001.siemens.net> <CAHp75VceCsuANZpib6HXJvxgMdJhmr8KPTZgThxKvXq6Yotymg@mail.gmail.com>
 <20210330172305.67b6e050@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210330172305.67b6e050@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 18:40:23 +0300
Message-ID: <CAHp75VcSwW42_oQDpxn34gN7+aJNmB=HdJUbaWsYkBokYAHkSA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 30, 2021 at 6:33 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Tue, 30 Mar 2021 15:41:53 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Tue, Mar 30, 2021 at 3:35 PM Henning Schild
> > <henning.schild@siemens.com> wrote:
> > > Am Tue, 30 Mar 2021 15:15:16 +0300
> > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > On Tue, Mar 30, 2021 at 2:58 PM Henning Schild
> > > > <henning.schild@siemens.com> wrote:
> > > > > Am Tue, 30 Mar 2021 14:04:35 +0300
> > > > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > > > On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
> > > > > > <henning.schild@siemens.com> wrote:
> >
> > > > > > > +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> > > > > > > +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> > > > > > > +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> > > > > > > +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> > > > > > > +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> > > > > > > +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> > > > > > > +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> > > > > > > +       { }
> > > > > > > +};
> > > > > >
> > > > > > It seems to me like poking GPIO controller registers directly.
> > > > > > This is not good. The question still remains: Can we simply
> > > > > > register a GPIO (pin control) driver and use an LED GPIO
> > > > > > driver with an additional board file that instantiates it?
> > > > >
> > > > > I wrote about that in reply to the cover letter. My view is
> > > > > still that it would be an abstraction with only one user, just
> > > > > causing work and likely not ending up as generic as it might
> > > > > eventually have to be.
> > > > >
> > > > > The region is reserved, not sure what the problem with the
> > > > > "poking" is.
> > > >
> > > >
> > > > > Maybe i do not understand all the benefits of such a split at
> > > > > this point in time. At the moment i only see work with hardly
> > > > > any benefit, not just work for me but also for maintainers. I
> > > > > sure do not mean to be ignorant. Maybe you go into details and
> > > > > convince me or we wait for other peoples opinions on how to
> > > > > proceed, maybe there is a second user that i am not aware of?
> > > > > Until i am convinced otherwise i will try to argue that a
> > > > > single-user-abstraction is needless work/code, and should be
> > > > > done only when actually needed.
> > > >
> > > > I have just read your messages (there is a cover letter and
> > > > additional email which was sent lately).
> > > >
> > > > I would like to know what the CPU model number on that board is.
> > > > Than we can continue to see what possibilities we have here.
> > >
> > > I guess we are talking about the one that uses memory mapped, that
> > > is called an "IPC127E" and seems to have either Intel Atom E3940 or
> > > E3930 which seems to be Apollo Lake.
> >
> > Yep. And now the question, in my patch series you should have got the
> > apollolake-pinctrl driver loaded (if not, we have to investigate why
> > it's not being instantiated). This will give you a read GPIO driver.
>
> Ok, so there is the existing driver i asked about several times. Thanks
> for pointing it out.

If you remember, I asked you about the chip twice :-)
I assumed that we were talking about Apollo Lake and that's why I
insisted that the driver is in the kernel source tree.


> > So, you may use regular LED GPIO on top of it
> > (https://elixir.bootlin.com/linux/latest/source/drivers/leds/leds-gpio.c).
> > I would like to understand why it can't be achieved.
>
> Will have a look. Unfortunately this one box is missing in my personal
> collection, but let us assume that one can be converted to that
> existing driver.

OK!

> I guess that will still mean the PIO-based part of the LED driver will
> have to stay as is.

Probably yes. I haven't looked into that part and I have no idea
what's going on on that platform(s).

-- 
With Best Regards,
Andy Shevchenko
