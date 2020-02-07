Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E22B155297
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Feb 2020 07:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgBGGvJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Feb 2020 01:51:09 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34311 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgBGGvJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Feb 2020 01:51:09 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1izxTj-0003LT-Qk; Fri, 07 Feb 2020 07:51:03 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1izxTj-0002T1-Ct; Fri, 07 Feb 2020 07:51:03 +0100
Date:   Fri, 7 Feb 2020 07:51:03 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        lee.jones@linaro.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/3] watchdog: da9062: add power management ops
Message-ID: <20200207065103.o5liyfdrl5fudxvh@pengutronix.de>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-4-m.felsch@pengutronix.de>
 <20200123205132.GA13377@roeck-us.net>
 <20200206090010.ya6p2kvab452kedr@pengutronix.de>
 <a5d61822-c4fa-d5d3-c3ef-174b57a651bc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d61822-c4fa-d5d3-c3ef-174b57a651bc@roeck-us.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:48:05 up 83 days, 22:06, 86 users,  load average: 0.09, 0.12,
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20-02-06 06:45, Guenter Roeck wrote:
> On 2/6/20 1:00 AM, Marco Felsch wrote:
> > Hi Guenter,
> > 
> > On 20-01-23 12:51, Guenter Roeck wrote:
> > > On Wed, Jan 08, 2020 at 10:57:04AM +0100, Marco Felsch wrote:
> > > > Disable the watchdog during suspend if it is enabled and re-enable it on
> > > > resume. So we can sleep without the interruptions.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> > > 
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > I got an kbuild email so I checked the linux-next master tree. On
> > linux-next this patch isn't used instead the old v1 was used...
> > 
> 
> Yes, it appears that I picked the wrong version as well, and Wim picked it
> up from there. But, really, what do you expect if you don't tag your
> submissions with version numbers ?

Pls check the cover-letter I said sorry their. As I said it was a
mistake.

> I would suggest to send a follow-up patch to fix what is in -next.

A 'real' patch or should I send a 'fixup!' patch?

Regards,
  Marco

> Guenter
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
