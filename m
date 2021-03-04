Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB06A32DA30
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 20:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbhCDTQD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 14:16:03 -0500
Received: from gecko.sbs.de ([194.138.37.40]:46849 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230472AbhCDTP4 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 14:15:56 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 124JEm13026341
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Mar 2021 20:14:48 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.11.66])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 124JElDY004306;
        Thu, 4 Mar 2021 20:14:47 +0100
Date:   Thu, 4 Mar 2021 20:14:46 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH 0/4] add device drivers for Siemens Industrial PCs
Message-ID: <20210304201446.6989f2a4@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VeYN_q0OVoTGQ5fe-08exfGgpM3-ohG8iF4D8B_fKar=g@mail.gmail.com>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <CAHp75VeYN_q0OVoTGQ5fe-08exfGgpM3-ohG8iF4D8B_fKar=g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Thanks Andy,

Am Thu, 4 Mar 2021 12:19:44 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Thu, Mar 4, 2021 at 9:29 AM Henning Schild
> <henning.schild@siemens.com> wrote:
> 
> > This series adds support for watchdogs and leds of several x86
> > devices from Siemens.
> >
> > It is structured with a platform driver that mainly does
> > identification of the machines. It might trigger loading of the
> > actual device drivers by attaching devices to the platform bus.
> >
> > The identification is vendor specific, parsing a special binary DMI
> > entry. The implementation of that platform identification is
> > applied on pmc_atom clock quirks in the final patch.
> >
> > It is all structured in a way that we can easily add more devices
> > and more platform drivers later. Internally we have some more code
> > for hardware monitoring, more leds, watchdogs etc. This will follow
> > some day.
> >
> > But the idea here is to share early, and hopefully not fail early.  
> 
> I have given a few comments here and there, so please check the entire
> series and address them in _all_ similar locations. As I have noticed,
> I have different approach about P2SB code, I have to give the series a
> dust and see if you can utilize it.

You did find some things that others found as well. SPDX vs blabla,
header ordering, some other style.
Some things are already done and will be in v2.

Other findings are new, and we will look into them. The only thing that
did stick out is P2SB, also was a point in internal pre-review.
Let us see what you have, i can include a patch of yours into the q.
But i am kind of afraid once it is there, several existing users should
be touched with it, and this series would come later. Or this series
comes first and you come later and clean up our "mess". Not sure i
would want to take over all P2SB unhiders, but with you on board it
will work.

> I would like to be Cc'ed on the next version.

Sure thing.

regards,
Henning


> 

