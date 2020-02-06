Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9A8A1540C7
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2020 10:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgBFJAS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Feb 2020 04:00:18 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50555 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgBFJAS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Feb 2020 04:00:18 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1izd19-0002bO-4D; Thu, 06 Feb 2020 10:00:11 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1izd18-0005Aq-3G; Thu, 06 Feb 2020 10:00:10 +0100
Date:   Thu, 6 Feb 2020 10:00:10 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        lee.jones@linaro.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/3] watchdog: da9062: add power management ops
Message-ID: <20200206090010.ya6p2kvab452kedr@pengutronix.de>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-4-m.felsch@pengutronix.de>
 <20200123205132.GA13377@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123205132.GA13377@roeck-us.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:58:04 up 83 days, 16 min, 81 users,  load average: 0.06, 0.11,
 0.06
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

On 20-01-23 12:51, Guenter Roeck wrote:
> On Wed, Jan 08, 2020 at 10:57:04AM +0100, Marco Felsch wrote:
> > Disable the watchdog during suspend if it is enabled and re-enable it on
> > resume. So we can sleep without the interruptions.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I got an kbuild email so I checked the linux-next master tree. On
linux-next this patch isn't used instead the old v1 was used...

Regards,
  Marco

> > ---
> > v2:
> > - add dlg,use-sw-pm check to differentiate between automatic and manual
> >   disabling/enabling.
> > ---
> >  drivers/watchdog/da9062_wdt.c | 37 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> > index e149e66a6ea9..c9b9d6394525 100644
> > --- a/drivers/watchdog/da9062_wdt.c
> > +++ b/drivers/watchdog/da9062_wdt.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/jiffies.h>
> >  #include <linux/mfd/da9062/registers.h>
> >  #include <linux/mfd/da9062/core.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/of.h>
> >  
> > @@ -30,6 +31,7 @@ static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
> >  struct da9062_watchdog {
> >  	struct da9062 *hw;
> >  	struct watchdog_device wdtdev;
> > +	bool use_sw_pm;
> >  };
> >  
> >  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
> > @@ -198,6 +200,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
> >  	if (!wdt)
> >  		return -ENOMEM;
> >  
> > +	wdt->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
> > +
> >  	wdt->hw = chip;
> >  
> >  	wdt->wdtdev.info = &da9062_watchdog_info;
> > @@ -212,6 +216,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
> >  	watchdog_set_restart_priority(&wdt->wdtdev, 128);
> >  
> >  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> > +	dev_set_drvdata(dev, &wdt->wdtdev);
> >  
> >  	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
> >  	if (ret < 0)
> > @@ -220,10 +225,42 @@ static int da9062_wdt_probe(struct platform_device *pdev)
> >  	return da9062_wdt_ping(&wdt->wdtdev);
> >  }
> >  
> > +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> > +{
> > +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> > +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> > +
> > +	if (!wdt->use_sw_pm)
> > +		return 0;
> > +
> > +	if (watchdog_active(wdd))
> > +		return da9062_wdt_stop(wdd);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused da9062_wdt_resume(struct device *dev)
> > +{
> > +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> > +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> > +
> > +	if (!wdt->use_sw_pm)
> > +		return 0;
> > +
> > +	if (watchdog_active(wdd))
> > +		return da9062_wdt_start(wdd);
> > +
> > +	return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
> > +			 da9062_wdt_suspend, da9062_wdt_resume);
> > +
> >  static struct platform_driver da9062_wdt_driver = {
> >  	.probe = da9062_wdt_probe,
> >  	.driver = {
> >  		.name = "da9062-watchdog",
> > +		.pm = &da9062_wdt_pm_ops,
> >  		.of_match_table = da9062_compatible_id_table,
> >  	},
> >  };
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
