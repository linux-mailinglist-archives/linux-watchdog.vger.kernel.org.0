Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BB213AF37
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 17:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgANQYQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 11:24:16 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33759 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgANQYQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 11:24:16 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1irOz2-0004VT-7w; Tue, 14 Jan 2020 17:24:00 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1irOz1-0004qL-Lg; Tue, 14 Jan 2020 17:23:59 +0100
Date:   Tue, 14 Jan 2020 17:23:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] mfd: da9062: fix watchdog compatible string
Message-ID: <20200114162359.weoirknje6yhcmds@pengutronix.de>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-2-m.felsch@pengutronix.de>
 <AM6PR10MB2263E53D89F7EC66C5E3779D80340@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR10MB2263E53D89F7EC66C5E3779D80340@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:20:29 up 60 days,  7:39, 57 users,  load average: 0.47, 0.25,
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

On 20-01-14 16:19, Adam Thomson wrote:
> On 08 January 2020 09:57, Marco Felsch wrote:
> 
> > The watchdog driver compatible is "dlg,da9062-watchdog" and not
> > "dlg,da9062-wdt". Therefore the mfd-core can't populate the of_node and
> > fwnode. As result the watchdog driver can't parse the devicetree.
> > 
> 
> I do agree there's a mismatch between the documentation and the MFD code.
> So in your DT are you specifying 'dlg,da9062-watchdog' and not 'dlg,da9062-wdt'
> hence the issue? Are there any existing users who are using 'dlg,da9062-wdt' in
> their DT instead?

Yes the upstream available DT I'm currently using is:
arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi.

I grep the code and found no _upstream_ user of 'dlg,da9062-wdt' also
using this compatible would be a missmatch with the binding
documentation. So those DT's assuming a wrong binding. Therefore I fixed
it here and not within the watchdog driver.

Regards,
  Marco

> > Fixes: 9b40b030c4ad ("mfd: da9062: Supply core driver")
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/mfd/da9062-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> > index e69626867c26..9143de7b77b8 100644
> > --- a/drivers/mfd/da9062-core.c
> > +++ b/drivers/mfd/da9062-core.c
> > @@ -248,7 +248,7 @@ static const struct mfd_cell da9062_devs[] = {
> >  		.name		= "da9062-watchdog",
> >  		.num_resources	= ARRAY_SIZE(da9062_wdt_resources),
> >  		.resources	= da9062_wdt_resources,
> > -		.of_compatible  = "dlg,da9062-wdt",
> > +		.of_compatible  = "dlg,da9062-watchdog",
> >  	},
> >  	{
> >  		.name		= "da9062-thermal",
> > --
> > 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
