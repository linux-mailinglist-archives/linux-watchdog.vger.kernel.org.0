Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0521E1020E4
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2019 10:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfKSJkX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Nov 2019 04:40:23 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:52469 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbfKSJkX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Nov 2019 04:40:23 -0500
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N1gac-1hr5cz1Eym-01231h; Tue, 19 Nov 2019 10:40:21 +0100
Received: by mail-qk1-f172.google.com with SMTP id d13so17189309qko.3;
        Tue, 19 Nov 2019 01:40:21 -0800 (PST)
X-Gm-Message-State: APjAAAUlIrFuF8q2cjVatN51ImQ6bBfnGRcqYMHIPpmECBAXDLW5g7cM
        GI2lNt5xakJphktqtf7JPHkelkq8i8YrPYAG3f8=
X-Google-Smtp-Source: APXvYqzpXo37eIlD5IP7Hk0pcYvx8hP1F+kNLhyoYoR1Do87qKPCr5W/ZWz5L7OkA4dZDC/iCb3rnrXQgJt5QRJtGjk=
X-Received: by 2002:a37:4f13:: with SMTP id d19mr24499410qkb.138.1574156420062;
 Tue, 19 Nov 2019 01:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20191118220432.1611-1-labbott@redhat.com> <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
In-Reply-To: <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 19 Nov 2019 10:40:04 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
Message-ID: <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: Remove iop_wdt
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Lennert Buytenhek <kernel@wantstofly.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JCq97WPGR6TwJH63qeF1QLhXslOsZv3p4wX9t2Q2rMjpOxv43Pg
 4mXhIh8BM7FSmkl+l/3ssNG62UOz7WekfaNCVYI5xgxH0Uj6/kDfKKlCf6cFweJfKKfxAVW
 3L4VI+HWkjKKgBMtlo+KTT0lWyr/UAUAx8sq70qGr97XQ13k3otOL/6NGBWp/Hb9amVTDKG
 C5GmvFfW+s+hTkdV81Cfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sNJFmyp9qA8=:gEYXJeyNAgl2qJ5FtAlXxS
 AJgfFwJHuNka43LIQt5Vvb+N1VW6r/fsHoPlSHrN7VdH7Ticg7hDn/FLdEvlyf1oaGlBMHzL2
 M6pHswbskI+FdUzxydnSYO6BdSIB7Suduz5M0UlqWh0sLU7gmL1GAX9NUbwwFEff2scKd0zxs
 UFR+J9jmDIMKFB4+GzY3qnzbF+UZLlJiBM4TyErgLmSsxtWMBB3B2qM0TgLpPsm5hdyPo8kJ4
 CIcE0P0lVDdsdey5X7nrDum7gYFhxnOcPL4l7+awSZYZ2L0G7reKw9XtKAgtJUc76e8Wtk+Ez
 CIo6keVl3A28ikL/m5HB1rKOL36r6heOA4b9DhSb0m2q07E5DSnLh0eqENd3Zl6y1Ycpub8ph
 IrDe5PzPPrkHUvjUck0Rj4ZVEvXssbroUIx1XA9T7JSmr95Csn9UKBwqNhZ86npxa6WRlaVfr
 uOCfQ+dgRHSOQmOVErEdB3+gQQi4wF1qeWT0WEleM0q3I2TIUx6+V4KFc4nmZpWoOoj4KdTG9
 8EQbvMlxEEZh9bvNXf7zvNTTjxXFL10mTud/OFCj82tqMfOTX8+37MAzaTUmsJQJQ6+fAEb7Q
 pQCX1+sm/KXqBOmbnve5lQUzMc/oRl/ajge068JN3QFy07MvmdEk8eUsSy/6pS2CuUBRyaMg4
 fvQ7YG3Id7Mj6AJLmcBdrAOfOK3SJ+EaPtoyCdJtHw0wJHdGs6OM+v6MNbKRasjYExjAryYXc
 yE7LYjH6utfgwUdbwlwquK/2dzcmXaEHNXZ5+Fbs5N69ZMnfcjA8H8G5MHbMiyI4Cbi0BZUJ3
 PwuTcdZ4eViOZK8m7lYhr/BQaj82YGrUWnhPVRYUbfKFVxh5GSlJkdah5wHqpveUqWPkrnpc2
 XciPZ9xD2ywCbGLdD7Zg==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Nov 19, 2019 at 3:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/18/19 2:04 PM, Laura Abbott wrote:
> >
> > Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
> > removed support for some old platforms. Given this driver depends on
> > a now removed platform, just remove the driver.
> >
> > Signed-off-by: Laura Abbott <labbott@redhat.com>
> > ---
> > Found this while reviewing config options. Not sure if this was kept
> > around for other reasons or just missed.
> > ---
> >   drivers/watchdog/Kconfig   |  16 ---
> >   drivers/watchdog/Makefile  |   1 -
> >   drivers/watchdog/iop_wdt.c | 249 -------------------------------------
> >   3 files changed, 266 deletions(-)
> >   delete mode 100644 drivers/watchdog/iop_wdt.c
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 58e7c100b6ad..fef9078a44b6 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -554,22 +554,6 @@ config PNX4008_WATCHDOG
> >
> >         Say N if you are unsure.
> >
> > -config IOP_WATCHDOG
> > -     tristate "IOP Watchdog"
> > -     depends on ARCH_IOP13XX
> > -     select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)
>
> This is a bit confusing, but it suggests that the watchdog may also work
> with ARCH_IOP32X, which is still supported. I don't know anything about
> those architectures, but I hesitate to have the driver removed unless
> we have confirmation that it won't work with ARCH_IOP32X.
> Maybe the dependency needs to be updated instead ?

See commit ec2e32ca661e ("watchdog: iop_wdt only builds for
mach-iop13xx") from 2014: the watdog hardware exists on iop32x
but the driver only successfully built on iop13xx, which is now gone.

Adding Russell (who said he still uses iop32x hardware) and Lennert
(who is still listed in the MAINTAINERS file, but previously said he
does not use it any more) to Cc. If neither of them see a reason to
keep the driver, I'd say we can remove it.

It seems unlikely that anyone wants to revive the driver if they have
not done it yet, and if they want to do it later, it is barely harder to revert
the removal than to fix the compile-time problem.

        Arnd
