Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE5E10E933
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 11:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfLBK4u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 05:56:50 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34567 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfLBK4t (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 05:56:49 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ibjNn-0002wS-7Y; Mon, 02 Dec 2019 11:56:47 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ibjNm-0005Ri-7a; Mon, 02 Dec 2019 11:56:46 +0100
Date:   Mon, 2 Dec 2019 11:56:46 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] watchdog: da9062: add power management ops
Message-ID: <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:52:06 up 17 days,  2:10, 28 users,  load average: 0.02, 0.20,
 0.23
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Adam,

On 19-12-02 10:04, Adam Thomson wrote:
> On 28 November 2019 17:20, Marco Felsch wrote:
> 
> > Disable the watchdog during suspend if it is enabled and re-enable it on
> > resume. So we can sleep without the interruptions.
> > 
> 
> We actually shouldn't need these additional functions. The PMIC can be told to
> suspend the watchdog timer during the PMIC's powerdown state via the CONTROL_B
> register which I think should do what you want here. That could be a DT option
> instead, and normally this should be configured in OTP anyway I believe.

This isn't always the case. My custom PCB haven't the ability to use the
sequencer powerdown/active mode becuase of a PCB bug. So without this
patch the PMIC resets my system.

Regards,
  Marco 

> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/watchdog/da9062_wdt.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> > index e149e66a6ea9..2a1e7de25b71 100644
> > --- a/drivers/watchdog/da9062_wdt.c
> > +++ b/drivers/watchdog/da9062_wdt.c
> > @@ -212,6 +212,7 @@ static int da9062_wdt_probe(struct platform_device
> > *pdev)
> >  	watchdog_set_restart_priority(&wdt->wdtdev, 128);
> > 
> >  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> > +	dev_set_drvdata(dev, &wdt->wdtdev);
> > 
> >  	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
> >  	if (ret < 0)
> > @@ -220,10 +221,34 @@ static int da9062_wdt_probe(struct platform_device
> > *pdev)
> >  	return da9062_wdt_ping(&wdt->wdtdev);
> >  }
> > 
> > +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> > +{
> > +	struct watchdog_device *wdd = dev_get_drvdata(dev);
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
> > --
> > 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
