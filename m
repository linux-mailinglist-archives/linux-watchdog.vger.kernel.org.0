Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014CA330FC8
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 14:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhCHNoq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 08:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhCHNoS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 08:44:18 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5B9C061762;
        Mon,  8 Mar 2021 05:44:14 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id c19so7798747ljn.12;
        Mon, 08 Mar 2021 05:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WaQEYnGNWJ/OtyKV8I7R1ooNb9kpyo4mdpeJtr/93Ho=;
        b=DD8/JlFZJ6G68i1cOe9PJRXvajjKX61MGCQGf7M4eDOeh41yUfDdx0qBLjoXidNvA/
         4/Xu1j8hsRkwTCJYWX4UsBU1rff3ERHFxIQ55cAgANxFTshftvXWb4o7/+WQJVLkI3sH
         ZBEm0b1VtpEHPsffNAtdASBiK0gvli/tMhQgwfVR6ieUs1MBAx1BIbngEjzdzzDrRLQa
         3B5RrhZOj/VnksJ2q3pnbKI3jJmrXXO/Dy7CMTt7twZY7sEDkQpXJX5bNorSh4T1tmT2
         czFMnhEnhSaubZprZi+4kR6IGF5ogE2kOA3/mispkJSdo9w1J5UzM9XL4plCoE42iLMK
         MX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WaQEYnGNWJ/OtyKV8I7R1ooNb9kpyo4mdpeJtr/93Ho=;
        b=BhFceszcfFTrOzGwF5dpL1wTVn4fzTD0GhYkqMls0EFBrkHmH+ZOr3Oy7p212JeJf5
         5nGs2IfC9aKQId2fCNi9Ewr7UmqZv2o2c0hvCkxmBt5xEt+LWiJbZCex1Kl16is7iJH+
         CCfe4l29Pp1fz3Fan+geY8Bgn7h4Hprnrrzf++9kR5eQEhILSEkiKi2j0Wh7X5GM7JBG
         /I1aRpLXH+6FK22y1YvlpHxR9lv2K0gwLFhwOPcEIchGP98lzp/gvashEI++jCcZ76EQ
         NyhyblrgtKPugebLC5+rz+6n5/tFkfh/CcRlz0NaeDc7oG0ctMO7MzJxtBsUEFxnbkL8
         rdYw==
X-Gm-Message-State: AOAM530+hnsYmfWvmhntPeeeU83zazVbZSVqy4Hgw/IGHgXBeBVCUgSV
        U2oPOQpBpF+q88KtenHj7Xmyc2OzFZADXo6V8GI=
X-Google-Smtp-Source: ABdhPJwFXWe+FddoQETwle8prutSDIA3QZ3m+wdRbe3N8yyIcvGoPRpCDDpQ6hE2dDakU2Kq0eNoqoJa1NEKRSwXqr0=
X-Received: by 2002:a2e:8196:: with SMTP id e22mr13941260ljg.398.1615211053458;
 Mon, 08 Mar 2021 05:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-2-henning.schild@siemens.com> <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
 <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com> <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
 <20210305174223.11537d42@md1za8fc.ad001.siemens.net> <CAHp75VdssrnvGn+Qs6Ua72MSFrTCHOCMBdPEAfmGFp1RrwdJ+g@mail.gmail.com>
 <CAHp75VdcBxo5emWpNy7jHLfSMfN0zWW_L_BW3Hs3_55zyn6WOA@mail.gmail.com> <20210308135714.3cc48c34@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210308135714.3cc48c34@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Mar 2021 15:43:56 +0200
Message-ID: <CAHp75Vc8eYTDJv+8oEr6we71k9fhXhM9XfCDGsnmTDNJ_+0nGA@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 8, 2021 at 3:02 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Fri, 5 Mar 2021 19:44:57 +0200
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > On Fri, Mar 5, 2021 at 7:17 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Mar 5, 2021 at 6:47 PM Henning Schild
> > > <henning.schild@siemens.com> wrote:
> > > > Am Fri, 5 Mar 2021 17:42:42 +0200
> > > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > > > On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede
> > > > > <hdegoede@redhat.com> wrote:

...

> > > > > [1]: https://gitlab.com/andy-shev/next/-/tree/p2sb
> > > >
> > > > That is a little weird, might be a good idea to RFC reply to the
> > > > cover letter of this one. To allow review and discussion in a
> > > > central place.
> > >
> > > I'm now rebasing it to be more presentable.
> > > If you can test this approach and it works for you, I'll send a
> > > formal RFC series.
> >
> > Okay, [1] now is in presentable shape, each patch with a proper commit
> > message and authorship, also all patches are compiled without issues.
>
> Thank you so much, i will base v2 on that and let you know how that
> works.

I went ahead and submitted the series [2]. Feel free either to use the
last 7 patches from [1], or the series. In either case, if it works
for you I would expect the Tested-by tag given against _series_.
Thanks!
(Or comment there what is not working / needed for your case)

[2]: https://lore.kernel.org/linux-pci/20210308122020.57071-1-andriy.shevchenko@linux.intel.com/T/#t

-- 
With Best Regards,
Andy Shevchenko
