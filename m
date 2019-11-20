Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D68A103745
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2019 11:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbfKTKPU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 05:15:20 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55453 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfKTKPU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 05:15:20 -0500
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MacjC-1i14Ci1YKo-00cDdJ; Wed, 20 Nov 2019 11:15:18 +0100
Received: by mail-qt1-f182.google.com with SMTP id o11so28288916qtr.11;
        Wed, 20 Nov 2019 02:15:18 -0800 (PST)
X-Gm-Message-State: APjAAAVxT1c/O7bKpchVwoNWfSfFn+OMY5MDaE8ghsZKMnXzxK3mrGtb
        PGVMYb1SGsx0xaj54kXvRozQP99wp7A0Vyw1+Yk=
X-Google-Smtp-Source: APXvYqw6C3tBzPE2Z4jsnt8or7u+FAAhXdUtkTFEH8dLlbdNTJXhM8rIPrjIVo0FG7CqLhoPNVfpKipak3Fc02kORhI=
X-Received: by 2002:ac8:2e57:: with SMTP id s23mr1752509qta.204.1574244917255;
 Wed, 20 Nov 2019 02:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20191118220432.1611-1-labbott@redhat.com> <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
 <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
 <4f283ab6-0f3c-60e9-cfd1-29d10d978986@roeck-us.net> <20191120100341.GK25745@shell.armlinux.org.uk>
In-Reply-To: <20191120100341.GK25745@shell.armlinux.org.uk>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 20 Nov 2019 11:15:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2N+aDgFz75dFJy3Me9FPdyDSyPaa29FngLjfXX3MzfvA@mail.gmail.com>
Message-ID: <CAK8P3a2N+aDgFz75dFJy3Me9FPdyDSyPaa29FngLjfXX3MzfvA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: Remove iop_wdt
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Lennert Buytenhek <kernel@wantstofly.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+HYBNu9AXubRAgtHomlzpL/0RxnWuvcsqy7HCCjN6V/hH0PTM+n
 cnpsuE2Xux1EzNdIaq4azcpSEqM/sNbFFkw0q9n+dyvF36tIQhoegEZwCOwgvNFL0gKvt0k
 RXHzFhBRCDUljvRlReHGiCWSqLI64YydquFNhef+8Ord8KDkPb1fEB4ZsOGWypAPkHIPUDT
 Krfhbq2eYdMoPeKYSgMcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AfI0Dkc+1Zs=:3K51mm1Z5xAfQuIKUqI5G+
 mIAbXuwslzs3BYCjXVwzvt/vsFbY3F66Y2wEvnWtPErkIs4rsqpG7g398ozafv/8uzJyu6d6I
 wmAKbK+esvH/oSg+18OqsDt5YI8a7R6Un/0OKcShNF+z5K8S63tk4NrxcS1rziCGyUAdX3OdG
 a9oT4fjpoDLjR/BwQfE0euB6KHj7Pu/gqvMGznNPDTwMVIj5QlKN78aQ+Z5sXz48hc2FJ1qH9
 yR1YG7F3wRIbohH4lvkIoqS/SI8oDmWyjszZGkCjWNNgCynqKA7CJCMA3VDnCVXdUr9FHbDEN
 aF4/3nU6p+Ci42JUIBa0MwSZZgNt8PhlHg6rcbYy2pAUZ8D+/rJvz/Yxv0EiRNCheuXnZozmL
 YzIAofLOMMtzyMbktXF3OxfbkGyYgcVF3AN/N0R8JuSSto9uooyENorAmam60H62lKGVxyF6d
 VesXuTuYiRQsoMT5YIwiNY7qCAirQUT8ss7XMByaWfV8087KP5sqcWow/jY+xmyQdj22wXKCr
 QRJbTU/SIfWN5sQ1+0zZ+uozEUG5mn1aMBvPm9gpvteq3fE3sxxzJbbOsXZLOtDD4wJJIw3g8
 egV0DdiDfaVEDrfnFGzu+S+OHrkKTwPa94UvL7YHZbhQeH6hxxfPHCJL+32nfl7XQMeEGMM7e
 SU1nBQNEO+RRlrlr1/tJZsMTl+IuSGKjMiVa1ui3y1cU1bcPYkfa5ufe/fJ3NniAXfW9YH+de
 1+jiBrkCgXBR8adUAo4/V7NqyM1LYQLDr+lDQtIYnAKjnSqJfJz+S46GqW0cBLdXSgRG2qZKa
 N1u0AxQD0V1SSlpE0AATTs5GwkNToamoz/hD4MBbz5F/xC5z4EwpSO8evzgSeJNRoj/mEsqcS
 cqQulfjB+rHfFYK6IrGw==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 20, 2019 at 11:03 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Tue, Nov 19, 2019 at 06:29:09AM -0800, Guenter Roeck wrote:
> > On 11/19/19 1:40 AM, Arnd Bergmann wrote:
> > > On Tue, Nov 19, 2019 at 3:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > On 11/18/19 2:04 PM, Laura Abbott wrote:
> >
> > Good point, especially since apparently no one cared for five years.
>
> Doesn't mean that there aren't interested parties.  I still have
> IOP32x hardware running here in the form of a N2100 (my firewall)
> and it seems that I never noticed this option disappearing until
> now...

It's not that it was ever there for IOP32x: the driver was introduced in 2007
and was available for IOP32x but failed to compile for it until 2014 when
I sent the patch to disable the driver in all configurations that
failed to build.

       Arnd
