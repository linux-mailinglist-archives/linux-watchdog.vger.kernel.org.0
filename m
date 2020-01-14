Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE9213B0F1
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 18:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgANRal (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 12:30:41 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36995 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgANRal (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 12:30:41 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1irQ1V-0003a8-1C; Tue, 14 Jan 2020 18:30:37 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1irQ1U-00077d-9M; Tue, 14 Jan 2020 18:30:36 +0100
Date:   Tue, 14 Jan 2020 18:30:36 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     support.opensource@diasemi.com, contact@stefanchrist.eu,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: da9062: make restart handler atomic safe
Message-ID: <20200114173036.ueepbqf54yzh26lm@pengutronix.de>
References: <20200113091521.5754-1-m.felsch@pengutronix.de>
 <20200113202809.GA21484@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113202809.GA21484@roeck-us.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:16:48 up 60 days,  8:35, 57 users,  load average: 0.02, 0.02,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 20-01-13 12:28, Guenter Roeck wrote:
> On Mon, Jan 13, 2020 at 10:15:21AM +0100, Marco Felsch wrote:
> > The restart handler is executed during the shutdown phase which is
> > atomic/irq-less. The i2c framework supports atomic transfers since
> > commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
> > transfers") but unfortunately the regmap framework doesn't support it
> > yet. Hard coding the i2c stuff can be done without worries since the
> > DA9062 is an i2c-only device.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Hi,
> > 
> > This patch is based on Stefan Lengfeld's RFC Patch [1].
> > 
> > [1] https://patchwork.ozlabs.org/patch/1085942/
> > ---
> >  drivers/watchdog/da9062_wdt.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> > index c9b9d6394525..84c5a0a455b2 100644
> > --- a/drivers/watchdog/da9062_wdt.c
> > +++ b/drivers/watchdog/da9062_wdt.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/slab.h>
> > +#include <linux/i2c.h>
> >  #include <linux/delay.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/mfd/da9062/registers.h>
> > @@ -149,12 +150,18 @@ static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
> >  			      void *data)
> >  {
> >  	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> > +	struct i2c_client *client = to_i2c_client(wdt->hw->dev);
> > +	u8 buf[] = {DA9062AA_CONTROL_F, DA9062AA_SHUTDOWN_MASK};
> > +	struct i2c_msg msg = {
> > +		.addr = client->addr,
> > +		.flags = 0,
> > +		.len = sizeof(buf),
> > +		.buf = buf,
> > +	};
> >  	int ret;
> >  
> > -	ret = regmap_write(wdt->hw->regmap,
> > -			   DA9062AA_CONTROL_F,
> > -			   DA9062AA_SHUTDOWN_MASK);
> > -	if (ret)
> > +	ret = i2c_transfer(client->adapter, &msg, 1);
> 
> Why not i2c_smbus_write_byte_data() ? I don't immediately see the difference.

Because I didn't noticed it, sorry. I changed it and notice no
differences. Thanks for the review =)

Regards,
  Marco

> Guenter
> 
> > +	if (ret < 0)
> >  		dev_alert(wdt->hw->dev, "Failed to shutdown (err = %d)\n",
> >  			  ret);
> >  
> > -- 
> > 2.20.1
> > 
