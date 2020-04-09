Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D18DA1A3A0E
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Apr 2020 20:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgDIS4K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 Apr 2020 14:56:10 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38464 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDIS4K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 Apr 2020 14:56:10 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2FE22803078F;
        Thu,  9 Apr 2020 18:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WE03Q2YOjKWv; Thu,  9 Apr 2020 21:56:02 +0300 (MSK)
Date:   Thu, 9 Apr 2020 21:56:30 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/7] watchdog: watchdog_dev: Use generic msec-per-sec
 macro
Message-ID: <20200409185630.fi5h64dqic6hnks2@ubsrv2.baikal.int>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132823.D5C5B803087C@mail.baikalelectronics.ru>
 <20200306152033.4444780307C4@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200306152033.4444780307C4@mail.baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 06, 2020 at 07:20:29AM -0800, Guenter Roeck wrote:
> On 3/6/20 5:27 AM, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > For better readability replace the numeric literals with globally
> > available xSEC_PER_SEC macro.
> > 
> 
> This is really completely unrelated to the rest of the series,
> and I don't really see the point. I am fine with such changes if there
> are some context changes around it, but otherwise they add no value
> other than being a potential source of backport conflicts.

It's up to you, since you are the subsystem maintainer. I'll drop the patch
in v2.

-Sergey

> 
> Guenter
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > ---
> >  drivers/watchdog/watchdog_dev.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> > index 8b5c742f24e8..a1a3bbe21653 100644
> > --- a/drivers/watchdog/watchdog_dev.c
> > +++ b/drivers/watchdog/watchdog_dev.c
> > @@ -99,7 +99,7 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
> >  {
> >  	/* All variables in milli-seconds */
> >  	unsigned int hm = wdd->max_hw_heartbeat_ms;
> > -	unsigned int t = wdd->timeout * 1000;
> > +	unsigned int t = wdd->timeout * MSEC_PER_SEC;
> >  
> >  	/*
> >  	 * A worker to generate heartbeat requests is needed if all of the
> > @@ -121,7 +121,7 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
> >  static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
> >  {
> >  	struct watchdog_core_data *wd_data = wdd->wd_data;
> > -	unsigned int timeout_ms = wdd->timeout * 1000;
> > +	unsigned int timeout_ms = wdd->timeout * MSEC_PER_SEC;
> >  	ktime_t keepalive_interval;
> >  	ktime_t last_heartbeat, latest_heartbeat;
> >  	ktime_t virt_timeout;
> > 
> 
