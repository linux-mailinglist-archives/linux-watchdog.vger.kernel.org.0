Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5B3373E07
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 May 2021 16:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbhEEPAB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 May 2021 11:00:01 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50961 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbhEEO77 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 May 2021 10:59:59 -0400
Received: from [192.168.1.155] ([95.114.117.51]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRn0U-1m6OWX2shu-00TBd0; Wed, 05 May 2021 16:58:35 +0200
Subject: Re: [PATCH v3 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Henning Schild <henning.schild@siemens.com>,
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
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-3-henning.schild@siemens.com>
 <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
 <20210330135808.373c3308@md1za8fc.ad001.siemens.net>
 <CAHp75Vc0f0HfAJx0KPyQMWjekkhB_T-1+vuR566qAcYGA2JLJA@mail.gmail.com>
 <20210330143011.0e8ae4a0@md1za8fc.ad001.siemens.net>
 <CAHp75VceCsuANZpib6HXJvxgMdJhmr8KPTZgThxKvXq6Yotymg@mail.gmail.com>
 <20210330172305.67b6e050@md1za8fc.ad001.siemens.net>
 <CAHp75VcSwW42_oQDpxn34gN7+aJNmB=HdJUbaWsYkBokYAHkSA@mail.gmail.com>
 <20210401124415.3c9321c0@md1za8fc.ad001.siemens.net>
 <CAHp75VcU-7-BVum4xuuQcG7NZZc9xXOoXYpfSBUwwPr6iZLWGg@mail.gmail.com>
 <20210412135641.1173941b@md1za8fc.ad001.siemens.net>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c268618b-27f5-5f1d-a3d2-d94e785df0cb@metux.net>
Date:   Wed, 5 May 2021 16:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210412135641.1173941b@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:m7rpyvRWbx2i21vXIFpgzQpQITT3X3V+SHOF8txJtU59XM3pxpJ
 pAv41dUJE34otqkj+DaIFLTb2IbSSQNRGzHiJv28svPMx0i4FlG46wmv4Zi+NVEg6+ic7j/
 DtW3eiRzTWK+OI3ymOCoePjHoXNKuQeQquGinc6YpMcjlkNfzPWxx+SWY8geUY2A5ce/BXJ
 vqER+xcFxmhXhU0sCwgng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bef024urxdA=:0ttqYRbPJ/NP5Moi2UDHg7
 UTAwfvxOP9iBWS+WfjrBSdpMyic7ujXaPxv46JH++uy3ngRtGI1rm51YwwskWFQfruNXzGkX6
 q4U7CuMiuI9A9WJ0W5Fy+0ZPDrEoSLiNcIqB3gymFdcxmtVa/IXrDw0cFmk4yj/3AFo4WCzA9
 2gOM6kBlMLi0XMYkV3G0+a2v1JczAg0WA4CyIoVAjacojHPk0Xxu/H1q73yYv4JMZncZZ1XOK
 83Rzj0Ef9DtcyvjiDg7Hjx3qRzvTc/UrvgM+cSwCx2o2MeSG0MO7G4nvxWn9xLVcxsH94Ms22
 mULJvV0OCH0ME0ZB5YLZwbP4WFJghVRLPi8g0e1oDFKR9Cg1vrB9YYCuFi0bZDqczy/dbdBFm
 YFBdOdn5boh4x6P6yiYm5AJzEHK5zGbE79BxYIqMifNRbsLtMZCTROZFFdopRKpiOgS4PhpkX
 1lUAoOAVlJ5AOSdNbloyD10r5hE8LY06NMVHZX46i6e93QNwoDji0v/2ZtNSSdnH5ZnQdo53e
 PfGhuJqbQE60I1vfCCQbHA=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12.04.21 13:56, Henning Schild wrote:

> Enrico, does "gpio_amd_fch" show up under /sys/class/gpio as a
> gpiochip? Or how to interact with that driver before basing another one
> on top?

It's not probed on its own, but explicitly by a board specific driver,
as it needs board specific data.

See drivers/platform/x86/pcengines-apuv2.c


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
