Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF5B34B5C0
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Mar 2021 10:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhC0JwB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Mar 2021 05:52:01 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:51302 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230415AbhC0Jvl (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Mar 2021 05:51:41 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12R9pEHg007154
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Mar 2021 10:51:14 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.2.82])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12R9kDOA028553;
        Sat, 27 Mar 2021 10:46:13 +0100
Date:   Sat, 27 Mar 2021 10:46:10 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] leds: simatic-ipc-leds: add new driver for
 Siemens Industial PCs
Message-ID: <20210327104610.344afebc@md1za8fc.ad001.siemens.net>
In-Reply-To: <50836593-d5c9-421f-9140-2c65ac6fabe4@metux.net>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-3-henning.schild@siemens.com>
        <CAHp75VcBdR8xqfWqKe+DwGAUYByVL7SBK0p7tHcKPs7m4Ay1iw@mail.gmail.com>
        <20210315111915.GA14857@duo.ucw.cz>
        <50836593-d5c9-421f-9140-2c65ac6fabe4@metux.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Thu, 18 Mar 2021 12:38:53 +0100
schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:

> On 15.03.21 12:19, Pavel Machek wrote:
> 
> > But I still don't like the naming. simantic-ipc: prefix is
> > useless. Having 6 status leds is not good, either.  
> 
> Do we have some standard naming policy those kinds of LEDs ?

There is include/dt-bindings/leds/common.h with LED_FUNCTION_*

> In this case, they seem to be assigned to certain specific functions
> (by physical labels on the box), so IMHO the LED names should reflect
> that in some ways.

The choice for "status" was because of

>> /* Miscelleaus functions. Use functions above if you can. */

And those known names do not really come with an explanation of their
meaning. Names like "bluetooth" seem obvious, but "activity" or
"indicator" leave a lot of room for speculation.

The choice in numbers was inspired by labels on the box, which i wanted
to reflect in some way.

Henning

> There're other cases (eg. apu board familiy) that just have several
> front panel leds w/o any dedication, so we can just count them up.
> 
> 
> --mtx
> 

