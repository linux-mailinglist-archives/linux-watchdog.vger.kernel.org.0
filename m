Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82B43404A1
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Mar 2021 12:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhCRLbu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Mar 2021 07:31:50 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34497 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhCRLbY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Mar 2021 07:31:24 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MmlfS-1m5VXZ0bbS-00jmiX; Thu, 18 Mar 2021 12:30:59 +0100
Subject: Re: [PATCH v2 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
To:     Hans de Goede <hdegoede@redhat.com>,
        Henning Schild <henning.schild@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
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
        Pavel Machek <pavel@ucw.cz>
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-2-henning.schild@siemens.com>
 <CAHp75VdXDcTfNL9QRQ5XE-zVLHacfMKHUxhse3=dAfJbOJdObQ@mail.gmail.com>
 <20210317201311.70528fd4@md1za8fc.ad001.siemens.net>
 <92080a68-9029-3103-9240-65c92d17bf16@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <6c7d165d-1332-2039-0af3-9875b482894b@metux.net>
Date:   Thu, 18 Mar 2021 12:30:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <92080a68-9029-3103-9240-65c92d17bf16@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JGLu8sagB7EF08Mi28wDkDZPeRCXlhUQsAuk2VqGw6C2ovFpXYq
 MZX5iPLQkAKUefPkGfyWd+cDvY8eBFavjhmWF0GJO7VKEZzSyAhG8x2mhLYmorQAi9kXXeP
 tRwcI75aoVn+ZB9vTtKHXhaXmtfbNhyoPshTjv/R4L4zo+dAO5TReeK7TMO2jifsDuzfPr6
 iSRutrazEqFpZtj3203Sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XYt+Ro5IIco=:fI9AaqtWnSTxTvtyMhIWW0
 MNzQmrQZ0AMAUGynhzL3oRChqrzcy6DLTOGJnSbteNVq1dzBL6WSiEXfpWu0LqQg+9Og+1XKL
 9nP6GD+5fgrVvS94P8kGB6/lgM3uHdBCk206KEnRh/Nl/z6FiQaVDaJaLsxNdWWW72wm7CyN1
 IKrJLmgw0bik1FpyM04nCgRg/XpAXyYnw1/GZWipeNQRqZ/X3DdCD4Nj5wBcCn/fAYYZpMUGN
 09ufck6mxZd9A0OqACSgvFNUrgfZexOpq8Fbv7ozZtKaKOjtfKy/aVHep79/Hh0xSqjaisypr
 GpvzG4j2MxTwovWNSUOiWwyNHs2xjBYwYUn3JXIfKkBC20FYJm/6jVy4v2LM+/9xfORC3ra0u
 IeqPhm8G+0VrRiANk8NuRvrp2PXYn7XdqA5RJ6bnA9JVoF43CD70+ZxHkfhzW
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 17.03.21 21:03, Hans de Goede wrote:

Hi,

>> It just identifies the box and tells subsequent drivers which one it
>> is, which watchdog and LED path to take. Moving the knowledge of which
>> box has which LED/watchdog into the respective drivers seems to be the
>> better way to go.
>>
>> So we would end up with a LED and a watchdog driver both
>> MODULE_ALIAS("dmi:*:svnSIEMENSAG:*");

Uh, isn't that a bit too broad ? This basically implies that Siemens
will never produce boards with different configurations.

>> and doing the identification with the inline dmi from that header,
>> doing p2sb with the support to come ... possibly a "//TODO\ninline" in
>> the meantime.
>>
>> So no "main platform" driver anymore, but still central platform
>> headers.
>>
>> Not sure how this sounds, but i think making that change should be
>> possible. And that is what i will try and go for in v3.
> 
> Dropping the main drivers/platform/x86 driver sounds good to me,
> I was already wondering a bit about its function since it just
> instantiates devs to which the other ones bind to then instantiate
> more devs (in the LED case).

hmm, IMHO that depends on whether the individual sub-devices can be
more generic than just that specific machine. (@Hanning: could you
tell us more about that ?).

Another question is how they're actually probed .. only dmi or maybe
also pci dev ? (i've seen some refs to pci stuff in the led driver, but
missed the other code thats called here).

IMHO, if the whole thing lives on some PCI device (which can be probed
via pci ID), and that device has the knowledge, where the LED registers
actually are (eg. based on device ID, pci mmio mapping, ...) then there
should be some parent driver that instantiates the led devices (and
possibly other board specific stuff). That would be a clear separation,
modularization. In that case, maybe this LED driver could even be
replaced by some really generic "register-based-LED" driver, which just
needs to be fed with some parameters like register ranges, bitmasks, etc.

OTOH, if everything can be derived entirely from DMI match, w/o things
like pci mappings involved (IOW: behaves like directly wired to the
cpu's mem/io bus, no other "intelligent" bus involved), and it's all
really board specific logic (no generic led or gpio controllers
involved), then it might be better to have entirely separate drivers.


-mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
