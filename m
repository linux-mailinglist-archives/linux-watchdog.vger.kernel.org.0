Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E85CBE00F9
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Oct 2019 11:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbfJVJox (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Oct 2019 05:44:53 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37195 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730619AbfJVJox (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Oct 2019 05:44:53 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MvbJw-1i3O5t0uak-00shqz; Tue, 22 Oct 2019 11:44:51 +0200
Received: by mail-qt1-f182.google.com with SMTP id g50so11627486qtb.4;
        Tue, 22 Oct 2019 02:44:50 -0700 (PDT)
X-Gm-Message-State: APjAAAUYazSrb3Gwxzn0uEB3Xz5IMLC0WgvMwk7I4JMHZW04/8eMzKLu
        W4MQVyD5axg4khHD1E6zxkhNUOv0cr+r8Paz+Ac=
X-Google-Smtp-Source: APXvYqxUguCPOp5LGMrfhG+G2UL8MgJST6yvwsbwS5pSbXnjYf7SsBUo3nYRm7EHYr0oSYA+LoNeUI92RIaCIkpSbmY=
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr2367412qtk.304.1571737490006;
 Tue, 22 Oct 2019 02:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de> <20191018154201.1276638-9-arnd@arndb.de>
 <bb4713a0-60bd-8d27-874f-e7e3a5adaec8@roeck-us.net>
In-Reply-To: <bb4713a0-60bd-8d27-874f-e7e3a5adaec8@roeck-us.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 22 Oct 2019 11:44:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0GPVs+PqUwsL2H8VJqLh=MJnMTwPu9nhX+Nq-xiMS1yQ@mail.gmail.com>
Message-ID: <CAK8P3a0GPVs+PqUwsL2H8VJqLh=MJnMTwPu9nhX+Nq-xiMS1yQ@mail.gmail.com>
Subject: Re: [PATCH 09/46] watchdog: sa1100: use platform device registration
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TFMiph9iftlPu/I44aOxHFyNWGsYwv4B00XFAtCQdCQRjaJURuI
 WX3mqNCkEyiZ/JXLGJMfVD2K6/mNI/4Kp3o7KbRltUNfdCUY+x50VGtyfLlj7bqO/v4o93X
 wmjeQNiEUltJb7EnUQ1Xqzjn+IwKH2I+4D9dNGrx7t+wCtU0GbQkwDSn/9f7ysqT1ShUigM
 zk3J1dG3cPxUhD0KspWFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X4jd4H54yL8=:goNIci1sGhaZ5snOezD3LY
 SDY3Vqyab26QqB+uY3lw810jl/gAFyJHlvKxaNWlSA7igpniuHPPD7S/GmE0QHFbHD423zPu8
 gSauNQUlolz55d6vRVdALJc+ox59ZxB3MLAGv8gXwqBn+h/w3AQPDWCrVyLIISFmPNQPnw7j1
 4l9ILrEPg36GR38AS/4DUhpXeFvMDOZEVpYsaxzNUlDRXWhmxRwrUqmW34vt51Iukk9lZhGg4
 9wNyu0SRtSLK0RevCxH4r3T1ndkOvwhJ3xs3P/4vMG7GLn8n5yHbi6/wzXvznl+SrpJxihfns
 90xoTMDm68xxfVZB264HjxWQdHMRSkiNwyoeUGNVWusRlK0kJaZz9ANTiVgWxtGbUkkNZMpFF
 b8zTOFcrgAUcO3KpK32UCBlfYxAYi/WhSX9zOV7dFCVWhYke9XOMvDlkVAKuzttotrChooPRB
 0e8SIJGLyc8KrzLjCkmaXbqZJ2apuNDkqH9ZH6lVFYMOvgNMExLghjb2SyJhZreSzKQ43+943
 vRVErfeXavgvoQDvN9HfFCeID1f5tE1+xa51xnpDhlbZzIQSIwRMfsizRBdPD3T3b2WjbQSvq
 AsKnb5mv6pVNCRyf0hO4NPWoqvepcsNyaoAxKJ34QWpZe25NSrnc6pCUqS7mQ+KxOlxfy1hAB
 8jJxpMaToEIcyOY/ZrkM8upYGjzcPjrfxocpKwiOSE/WVmNJErNZbItO+qlOsWAkv4uqAZgz7
 VSXZGADqkApGbl97oTPPbuHoz/uapRr4aLBfat5jAPE7pP64NXVOhyO0Kk26Sc3WyGNLTI2xF
 Rnk3wC3pHUu56QEyn6mSpt76gtasSA+krT0xQ5czQagDsca+KWZTp8XIQ2kMj42k7eQq2MRrq
 HS8tKj6Njt8EnNW4nMNg==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Oct 19, 2019 at 4:07 PM Guenter Roeck <linux@roeck-us.net> wrote:

> > @@ -319,10 +316,13 @@ static struct platform_device *sa11x0_devices[] __initdata = {
> >
> >   static int __init sa1100_init(void)
> >   {
> > +     struct resource wdt_res = DEFINE_RES_MEM(0x90000000, 0x20);
> >       pm_power_off = sa1100_power_off;
> >
> >       regulator_has_full_constraints();
> >
> > +     platform_device_register_simple("sa1100_wdt", -1, &wdt_res, 1);
> > +
> >       return platform_add_devices(sa11x0_devices, ARRAY_SIZE(sa11x0_devices));
>
> Wouldn't it be better to add the watchdog device to sa11x0_devices ?

Generally speaking, platform_device_register_simple() is better than
platform_add_devices(), it does the same thing with fewer source lines
and smaller object code, and it doesn't have the problem of lifetime rules
for statically allocated reference-counted devices.

One day we may want to replace all static platform_device instances with
platform_device_info instead, but right now there are too many of those.

I can change this one to a platform_device for consistency though if you
think it's worth it.

     Arnd
