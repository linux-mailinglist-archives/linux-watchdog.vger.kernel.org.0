Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88B93404CB
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Mar 2021 12:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhCRLjX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Mar 2021 07:39:23 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:48339 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhCRLjT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Mar 2021 07:39:19 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Ma1kC-1lAmAF0KXc-00VxwD; Thu, 18 Mar 2021 12:38:55 +0100
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
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
        Hans de Goede <hdegoede@redhat.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
 <20210315095710.7140-3-henning.schild@siemens.com>
 <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
 <20210315111915.GA14857@duo.ucw.cz>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <50836593-d5c9-421f-9140-2c65ac6fabe4@metux.net>
Date:   Thu, 18 Mar 2021 12:38:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315111915.GA14857@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UQj/uyIdWrV4x4eIh2O10VHQkDz7wEIAijJK6BBUft1z3Ru8/Bm
 OWSLcWcGTE9xURl1iPZy1zqy0w8LFNk2ZdErhzyFAtkqC+T4Evoz8GcpvEjB7VzmkN2iR3L
 f7HgO+4QSACGZ7aYgNYhgDIiULiPLsC4dBoSVWsIBFMXstlhIFCBB/jMIJgm1+V56JY2INn
 ASV1RAsS/iiOEylLW61dA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8DlyhrnsG34=:7dMV13GswgzlA4tuO6+4fd
 sd5jzEwhFH4ng6i5PHCOZhsQwmo3xJpHGMIcEFle4nH9Jo+x80ZKlmUsfg+Lb3VghhYcUhrps
 pFZfVRcW829ZNHP1kS9cGeNu3y29LFUX0DCO4zXfT2ZFO95l9CGMnOHO63j5QV9DaktydYjNz
 eOdZLQHEvUk9tw/6xbq9LKB5RAaYq4Dq7qOJ3FzfkX7Aj+UIbz/KO5gro7/qzLkMRuKicune/
 arTsir1yBAUZr9gMYJ6Tk0sfB28RKCdrIm4hn6J/YYiOFF+kAasuXJQNbFleoeYPs7tlfX5Wf
 ZMZ5r12NAh4sYIb/Mpdz8C9Kl47LRk7bUz1iAoqtkw2+zs92vfdi+tZC78I4zpTzH78BAhFZX
 aXKNvHIHZR3IQ/8VHsF6tJUYmTIBvNFrUMcAUDHSAttLPtxgEOBxkrCLV5r3L
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 15.03.21 12:19, Pavel Machek wrote:

> But I still don't like the naming. simantic-ipc: prefix is
> useless. Having 6 status leds is not good, either.

Do we have some standard naming policy those kinds of LEDs ?

In this case, they seem to be assigned to certain specific functions (by 
physical labels on the box), so IMHO the LED names should reflect that
in some ways.

There're other cases (eg. apu board familiy) that just have several
front panel leds w/o any dedication, so we can just count them up.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
