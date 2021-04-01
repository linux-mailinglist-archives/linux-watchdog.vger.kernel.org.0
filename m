Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9922351C91
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Apr 2021 20:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237075AbhDASSr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Apr 2021 14:18:47 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34391 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237761AbhDASMG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Apr 2021 14:12:06 -0400
Received: from [192.168.1.155] ([95.114.120.255]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MD9Kj-1lItNN1Tyj-0095AP; Thu, 01 Apr 2021 18:20:52 +0200
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
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
 <50836593-d5c9-421f-9140-2c65ac6fabe4@metux.net>
 <20210327104610.344afebc@md1za8fc.ad001.siemens.net>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <647d9b70-4efe-41e6-e592-74331d66b675@metux.net>
Date:   Thu, 1 Apr 2021 18:20:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210327104610.344afebc@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mNglDIX27fLWItHQlziK/n+IY7HGTMabBbBP4e/KFtQ0p40i4z/
 Z3bfdaOjDN0xGaksYuJQC78S/UTb0Tx9jleuOfKumDqN6D48g8BPhbcRE3Nl4msCmUz6wGT
 cxB5vTjwyUmUEbCXM9bHndSkbRk94IZhVWNLBwt5iP3My13QtR4XAjtF/6jqDaIx03Lyl7X
 /L/oV8NRT3tOs2Z1AbG/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zv3heeluCKs=:hpK/+L7wEVi4G//3IOx+9b
 aoRBbL8+G/cOOfzYk9m+TikKMe/bUT+veAFcQdzo2v9AWS3P27rCfDITEf3zQ72Y2y5OAN78C
 1wHqALJRpv8q6S8CZCA2xJrFMoIWMkmTdbyTpRdHls3TBUANoZpDJeIWA1AOSWBpC9f7b8Hbl
 c/sf7cP25OJC9BkmqX4bhQdQXq5Y4Q19aMTkf08m3B61RZEw5iuPXfySmBwBQ/yAoPJ8OPgts
 h6xNFTa546nd48QPN91x/8t8O513HA2FewPGxi6YQBzu0g+5/4eEo1PLbrviFBy9ca+3pgvyj
 qndEMEnvRFGzEG0Z9Tq/n79a2rqSN9CMsCbGrb/715yjPyaGno7jtRq2F5TNIfqxDM4Y/w5SH
 lmM0NMVfBqdAuqwwDD4/jakzk+D69qL1Syt+Fjifog8zQna6BKbhMn4JmniWHE/v8z+uOPzSV
 jYAvyUw0JEvMdt9IjYC7mXs6r12/zAg=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 27.03.21 10:46, Henning Schild wrote:

>> In this case, they seem to be assigned to certain specific functions
>> (by physical labels on the box), so IMHO the LED names should reflect
>> that in some ways.
> 
> The choice for "status" was because of
> 
>>> /* Miscelleaus functions. Use functions above if you can. */
> 
> And those known names do not really come with an explanation of their
> meaning. Names like "bluetooth" seem obvious, but "activity" or
> "indicator" leave a lot of room for speculation.

Maybe we should revise these and add more functions ?

Can you find out some more details, what these LEDs really had been
intented for ?

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
