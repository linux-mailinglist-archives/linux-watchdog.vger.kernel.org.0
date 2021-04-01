Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6CC351C8E
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Apr 2021 20:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237041AbhDASSq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Apr 2021 14:18:46 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:45439 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238618AbhDASJs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Apr 2021 14:09:48 -0400
Received: from [192.168.1.155] ([95.114.120.255]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mxlio-1lpRFh0GyM-00zFhl; Thu, 01 Apr 2021 18:15:43 +0200
Subject: Re: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-4-henning.schild@siemens.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
Date:   Thu, 1 Apr 2021 18:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210329174928.18816-4-henning.schild@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mZl+/Fxt0NAigmLCH+RKccI3nE5xVjZG1xhGoPUgCxNSXAPqiMk
 S9U84N7eW7dsD5O10wzfTPVnBv3R4PqEnqCSUCAC0WPCG0h2NbnNAl+zUpmSy7xb6z34dWa
 W7Sp+3iSb/gJINI7M6KgJlUZoRypT/s5uqJ2mpqPT1/wsHl/phqOpvzs0ebTMg5vgbZL0f2
 jv/KHgLgD3iBP1j67CACw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vWF9FgB7mL8=:UG6L83VGSPgRsVAviCBrxt
 KXA9dc0Vp+RuCgdsB+XC/Qwyr/LgC+xNnFeLHgByex/68aGjqseF8jord8HHgtvn1/sL3Qh9P
 qjATQnm0IBEwteNtgjRUYOGZhJLd8aBFj3GoMBfHhkOld+f4iXwjrJGmcPGojmRSVXkICDFeQ
 JqJEcnXPizz7ntzhqY9PggqHlO6VhLxrWMDIGeaHJgMFUciombnIDONf8iX6K39sVJFAkfccS
 u7CvrQELD2gjN3DvjrqwcR9V5jhBqPa5Zc4UdX2loNXuwEkSGSVGQtn6Xwi0r2cGZ3UN74Usx
 XD3UJKVWJlCQjzbaIiEXIpq9qiqzIEtIF48kH9gzNRmOlrIIqLJ97CLy9LJNV+Peo4fc3B742
 2B1eJcMlor/v7G2WuVCl9kjivhJdRBd9gluP1JlJqACC12epgJX06mKA7y4JRE2J8jaCdgEGC
 3ivlcz7rxOS2m0lC3t5Hb3ism7N0KdglsVHyrG8gm0V1NDKXN2TX
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 29.03.21 19:49, Henning Schild wrote:

Hi,

> This driver adds initial support for several devices from Siemens. It is
> based on a platform driver introduced in an earlier commit.

Where does the wdt actually come from ?

Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a pretty 
usual case.

Or some external chip ?

The code smells a bit like two entirely different wdt's that just have
some similarities. If that's the case, I'd rather split it into two
separate drivers and let the parent driver (board file) instantiate
the correct one.


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
