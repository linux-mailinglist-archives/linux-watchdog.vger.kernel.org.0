Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDB1155292
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Feb 2020 07:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgBGGsJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Feb 2020 01:48:09 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40071 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgBGGsJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Feb 2020 01:48:09 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1izxQm-00038y-DR; Fri, 07 Feb 2020 07:48:00 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1izxQl-0002Kw-69; Fri, 07 Feb 2020 07:47:59 +0100
Date:   Fri, 7 Feb 2020 07:47:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        robh+dt@kernel.org, lee.jones@linaro.org,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Explicit disable da9062 watchdog during suspend
Message-ID: <20200207064759.2de2fhhcuuavsqel@pengutronix.de>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108100904.m26jskuhv7ldqaa2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108100904.m26jskuhv7ldqaa2@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:47:32 up 83 days, 22:06, 86 users,  load average: 0.16, 0.14,
 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On 20-01-08 11:09, Marco Felsch wrote:
> Hi,
> 
> On 20-01-08 10:57, Marco Felsch wrote:
> > Hi,
> > 
> > this v2 contains all review comments made on [1]. Furthermore the series
> > includes a fix patch which is need to parse the devicetree.
> 
> I forgot to add the -v2 to my git command anyway this is realy a v2.
> Sorry for the noise.

I said sorry here..

Regards,
  Marco

> Regards,
>   Marco
> 
> > [1] https://www.spinics.net/lists/linux-watchdog/msg17044.html
> > 
> > Regards,
> >   Marco
> > 
> > Marco Felsch (3):
> >   mfd: da9062: fix watchdog compatible string
> >   dt-bindings: watchdog: da9062: add suspend disable option
> >   watchdog: da9062: add power management ops
> > 
> >  .../bindings/watchdog/da9062-wdt.txt          |  5 +++
> >  drivers/mfd/da9062-core.c                     |  2 +-
> >  drivers/watchdog/da9062_wdt.c                 | 37 +++++++++++++++++++
> >  3 files changed, 43 insertions(+), 1 deletion(-)
> > 
> > -- 
> > 2.20.1
> > 
> > 
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
