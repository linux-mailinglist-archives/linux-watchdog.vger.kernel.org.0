Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FDF3D6598
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 19:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233759AbhGZQn0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 12:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbhGZQnC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 12:43:02 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D56C0C13ED
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jul 2021 09:55:05 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id i1so12353938plr.9
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jul 2021 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TmG0o2IaLslhP21mS5AtwFYEVDWEL0zBS2Y2v68t7Y0=;
        b=nIIYsMx21wwaGZyr00e0cKr01u8YOfAPU976hr8eVw0buiUbH6Y9C/QZzBCWvjuj7C
         r34aI1qGXC3PWtWCLj04yZv9UZORJQj2H7o7uBEyn0wLRk/tCFpu656EXMXuzTkgTrlz
         8pob1kop4NBZPA/uBMoKCAV/BJIids8ndeXeFpOCsVwpZFMX6vVrrF+vaovWTdOyp8wN
         ramzejDKV1MXUKDLFCt0rfFqqavhFHQp0NHnk8NTo5QmhpXLnELsKfP7mAC3E6EgWnxR
         AohqMK11tGDRNY49PDZ6whlADwyoGXLw1P7+ZeALIBnUUvQVUKvYIx3WZa9H6d2BOmg0
         vrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TmG0o2IaLslhP21mS5AtwFYEVDWEL0zBS2Y2v68t7Y0=;
        b=X6MSmVvqNNeniAIsXLQm4GGZ0qrRSaQz7LMAdvgZI6UKTDdS1dWRyQYP16LzN1Deo5
         QnnaWn2RJ8d2B6jpiL2IaDLHegjbDY1v/ilzM1XmtMp7rl/ljWbE5X3iOMdDSaafAyRg
         ygSIkO408Ttms6+xH22q1oZYCUembIuI2zbAW7O/T3yd2DJ9E5iPMfJ6ao8IeTzaKdX1
         DToRMX2IGQQLI0U/khPmZAqzx7L7EnSdVzioEINzecaLcBgkF2U55MQRuPT+peu0G+Z0
         q0eimbuL+PAhDAA3cfYaQFKCD5PTE/vRGa4bWXIGpfFsmQTUCxfrA5cn8IG/H4s9EcYQ
         bPRg==
X-Gm-Message-State: AOAM532SBPp7Qyad0k04hImPU7KXQ+Wn6bQo+oVCP1X5S0Ob5QWaE6t/
        jvQBHPwhDc2kFkbY3Eutp1Xc0536P95HmAU5LxQ=
X-Google-Smtp-Source: ABdhPJzdSTn7wk1xFN2ECemu9rPH6wMPCttDF08Nj6YFRvoiEYiZwZ/jmGvbXbvgeyisxirpXK32XzGumIvO4rrZ8Z4=
X-Received: by 2002:a63:df14:: with SMTP id u20mr18988694pgg.348.1627318504969;
 Mon, 26 Jul 2021 09:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWNY8XhrutxYzRregOJYQYte87W-wbtf1OoPAfnMVRD1oKzNw@mail.gmail.com>
 <4f72e518-ef01-505d-2523-6d3b151e1719@siemens.com> <1d07f96c-a8c9-06e5-69ec-2c099df7b1f3@siemens.com>
In-Reply-To: <1d07f96c-a8c9-06e5-69ec-2c099df7b1f3@siemens.com>
From:   =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date:   Mon, 26 Jul 2021 19:54:54 +0300
Message-ID: <CAPWNY8VZ4dzub_7PD5qxD0sm1_DmNCznX6af_GKdHu6Y44OBmw@mail.gmail.com>
Subject: Re: iTCO_wdt regression on Dell laptop
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 26, 2021 at 12:45 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 26.07.21 11:40, Jan Kiszka wrote:
> > On 26.07.21 11:19, Mantas Mikul=C4=97nas wrote:
> >> Hello,
> >>
> >> I have a Dell Inspiron 15-5547 laptop, with systemd configured to set
> >> the watchdog to a 2-minute expiry (due to reasons):
> >>
> >> # /etc/systemd/system.conf
> >> [Manager]
> >> RuntimeWatchdogSec=3D2min
> >>
> >> So far this setting has worked without problems (including kernels
> >> 5.12.15 and 5.13.1); however, with kernel 5.13.4 the system inevitably
> >> reboots after a few minutes of uptime.
> >>
> >> I have tracked the issue down to commit 5e65819a006e "watchdog:
> >> iTCO_wdt: Account for rebooting on second timeout" in the 5.13.x
> >> branch (commit cb011044e34c upstream). There are no unexpected reboots
> >> when running 5.13.4 with this commit reverted.
> >>
> >> Indeed with the original 5.13.4 kernel, `wdctl` always reports
> >> "Timeleft:" counting down from 60 seconds (sometimes very nearly
> >> reaching 0), even though "Timeout" is still reported to be 120.
> >>
> >> (systemd pokes the watchdog as part of its main loop, trying to so
> >> approximately "between 1/4 and 1/2" of the configured interval.
> >> According to wdctl these pings usually happen every 35-50 seconds but
> >> sometimes nearly at the 60-second mark, and thanks to the kernel now
> >> also dividing the requested expiry by /2 which systemd is unaware of,
> >> sometimes this ends up being a *very* close race to 0.)
> >>
> >> This is a Haswell-era machine (i7-4510U) and seems to have a "version
> >> 0" watchdog:
> >>
> >> Jul 26 11:34:04 archlinux kernel: Linux version 5.13.4-arch2-1
> >> (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1
> >> SMP PREEMPT Thu, 22 Jul 2021 20:46:28 +0000
> >> Jul 26 11:34:14 frost kernel: iTCO_vendor_support: vendor-support=3D0
> >> Jul 26 11:34:14 frost kernel: iTCO_wdt iTCO_wdt.3.auto: Found a Lynx
> >> Point_LP TCO device (Version=3D2, TCOBASE=3D0x1860)
> >> Jul 26 11:34:14 frost systemd[1]: Using hardware watchdog 'iTCO_wdt',
> >> version 0, device /dev/watchdog
> >> Jul 26 11:34:14 frost systemd[1]: Set hardware watchdog to 2min.
> >> Jul 26 11:34:14 frost kernel: iTCO_wdt iTCO_wdt.3.auto: initialized.
> >> heartbeat=3D30 sec (nowayout=3D0)
> >>
> >
> > Could you printk SMI_EN(p) in iTCO_wdt_set_timeout()
> > (drivers/watchdog/iTCO_wdt.c)? This is where we decide whether SMIs are
> > working, thus the countdown will only run once. Apparently, something i=
s
> > wrong with the detection on this system.
> >
>
> Wait, found it:
>
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index b3f604669e2c..643c6c2d0b72 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_devic=
e *wd_dev, unsigned int t)
>          * Otherwise, the BIOS generally reboots when the SMI triggers.
>          */
>         if (p->smi_res &&
> -           (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) !=3D (TCO_EN | GBL_SMI_EN=
))
> +           (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) !=3D (TCO_EN | GBL_S=
MI_EN))
>                 tmrval /=3D 2;
>
>         /* from the specs: */

Rebuilt with this and it fixes the issue, thanks.

--=20
Mantas Mikul=C4=97nas
