Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C97C32DA86
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 20:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236420AbhCDTmn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 14:42:43 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:35469 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234995AbhCDTmj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 14:42:39 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 124JfZAS016197
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Mar 2021 20:41:35 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.11.66])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 124JQYBn014606;
        Thu, 4 Mar 2021 20:26:34 +0100
Date:   Thu, 4 Mar 2021 20:26:33 +0100
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
Message-ID: <20210304202633.49f3244d@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75VfBhMHUxM_CnGRTZuYg19cRpEKuyZ284hMg=MZpinnX_w@mail.gmail.com>
References: <20210302163309.25528-1-henning.schild@siemens.com>
        <CAHp75VeYN_q0OVoTGQ5fe-08exfGgpM3-ohG8iF4D8B_fKar=g@mail.gmail.com>
        <CAHp75VfBhMHUxM_CnGRTZuYg19cRpEKuyZ284hMg=MZpinnX_w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Thu, 4 Mar 2021 12:20:22 +0200
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Thu, Mar 4, 2021 at 12:19 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Mar 4, 2021 at 9:29 AM Henning Schild
> > <henning.schild@siemens.com> wrote:  
> 
> > I have given a few comments here and there, so please check the
> > entire series and address them in _all_ similar locations. As I
> > have noticed, I have different approach about P2SB code, I have to
> > give the series a dust and see if you can utilize it.
> >
> > I would like to be Cc'ed on the next version.  
> 
> One more thing, is it Apollo Lake based?

Not sure i can answer that, or what you even refer to. The whole series
is about a range of devices, some even have sub-models with differing
CPUs and Lakes

regards,
Henning

