Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1716330ED2
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 14:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCHNCy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 08:02:54 -0500
Received: from gecko.sbs.de ([194.138.37.40]:46573 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229674AbhCHNCo (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 08:02:44 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 128D2HrM007790
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 8 Mar 2021 14:02:17 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.1.188])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 128CvFb0022027;
        Mon, 8 Mar 2021 13:57:15 +0100
Date:   Mon, 8 Mar 2021 13:57:14 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/4] platform/x86: simatic-ipc: add main driver for
 Siemens devices
Message-ID: <20210308135714.3cc48c34@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VdcBxo5emWpNy7jHLfSMfN0zWW_L_BW3Hs3_55zyn6WOA@mail.gmail.com>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <20210302163309.25528-2-henning.schild@siemens.com>
        <CAHp75VfDDGxdhP0-yKOCJyJ_+Y2Zu3TmOdvUJmEZ0AvQnceV6A@mail.gmail.com>
        <2fad304a-9e1e-c83d-7a9e-02b35ed22418@redhat.com>
        <CAHp75VfB8v1n3Hav_oMqG0k4C31NBEUe082i8NrrOGUbSgoESw@mail.gmail.com>
        <20210305174223.11537d42@md1za8fc.ad001.siemens.net>
        <CAHp75VdssrnvGn+Qs6Ua72MSFrTCHOCMBdPEAfmGFp1RrwdJ+g@mail.gmail.com>
        <CAHp75VdcBxo5emWpNy7jHLfSMfN0zWW_L_BW3Hs3_55zyn6WOA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Fri, 5 Mar 2021 19:44:57 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Fri, Mar 5, 2021 at 7:17 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Fri, Mar 5, 2021 at 6:47 PM Henning Schild
> > <henning.schild@siemens.com> wrote:  
> > > Am Fri, 5 Mar 2021 17:42:42 +0200
> > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:  
> > > > On Thu, Mar 4, 2021 at 3:47 PM Hans de Goede
> > > > <hdegoede@redhat.com> wrote:  
> >
> > ...
> >  
> > > > [1]: https://gitlab.com/andy-shev/next/-/tree/p2sb  
> > >
> > > That is a little weird, might be a good idea to RFC reply to the
> > > cover letter of this one. To allow review and discussion in a
> > > central place.  
> >
> > I'm now rebasing it to be more presentable.
> > If you can test this approach and it works for you, I'll send a
> > formal RFC series.  
> 
> Okay, [1] now is in presentable shape, each patch with a proper commit
> message and authorship, also all patches are compiled without issues.

Thank you so much, i will base v2 on that and let you know how that
works.

regards,
Henning
