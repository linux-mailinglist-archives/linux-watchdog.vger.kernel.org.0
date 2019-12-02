Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4492310EA74
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 14:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfLBNDV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 08:03:21 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58563 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbfLBNDR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 08:03:17 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iblMB-0006SW-5G; Mon, 02 Dec 2019 14:03:15 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iblMA-0001ip-Oz; Mon, 02 Dec 2019 14:03:14 +0100
Date:   Mon, 2 Dec 2019 14:03:14 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] watchdog: da9062: add power management ops
Message-ID: <20191202130314.dzne7eh2b5sb46c2@pengutronix.de>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
 <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:42:28 up 17 days,  4:01, 29 users,  load average: 0.02, 0.06,
 0.02
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

On 19-12-02 11:11, Adam Thomson wrote:
> On 02 December 2019 10:57, Marco Felsch wrote:
> 
> > On 19-12-02 10:04, Adam Thomson wrote:
> > > On 28 November 2019 17:20, Marco Felsch wrote:
> > >
> > > > Disable the watchdog during suspend if it is enabled and re-enable it on
> > > > resume. So we can sleep without the interruptions.
> > > >
> > >
> > > We actually shouldn't need these additional functions. The PMIC can be told to
> > > suspend the watchdog timer during the PMIC's powerdown state via the
> > CONTROL_B
> > > register which I think should do what you want here. That could be a DT option
> > > instead, and normally this should be configured in OTP anyway I believe.
> > 
> > This isn't always the case. My custom PCB haven't the ability to use the
> > sequencer powerdown/active mode becuase of a PCB bug. So without this
> > patch the PMIC resets my system.
> 
> Hmmm. Wouldn't that then be a board specific fix rather than this change?
> Am concerned relying on software to reenable the watchdog on resume could allow
> for a hang scenario potentially if that code never gets to execute. Other
> systems shouldn't need this fix, assuming they don't have issues at the HW
> level, so this this seems like it could be making those systems less robust. If
> we are to do this at the driver level, maybe this should be an option through DT
> to help faulty systems, but I'm thinking this shouldn't be default behaviour.

I don't think that we should rely on the OTP values. Those values are
set by Dialog, the SoM manufacturers or by the customer itself and the
time shows that this is error prone too. At least if the customer or the
SoM manufacturer don't ask the Dialog Support..

You're right with the (re-)enabling but there are other drivers using
such an approach.. IMHO it is safer to go this way rather than trust
the OTP and the PCB layout. I would rather add a dt-compatible to tell
the driver to do nothing during suspend/resume e.g.:

    - dlg,use-hw-pm

or something. Because the user needs to validate the PCB and the OTP
values.

Regards,
  Marco

> > 
> > Regards,
> >   Marco
> > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  drivers/watchdog/da9062_wdt.c | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > >
> > > > diff --git a/drivers/watchdog/da9062_wdt.c
> > b/drivers/watchdog/da9062_wdt.c
> > > > index e149e66a6ea9..2a1e7de25b71 100644
> > > > --- a/drivers/watchdog/da9062_wdt.c
> > > > +++ b/drivers/watchdog/da9062_wdt.c
> > > > @@ -212,6 +212,7 @@ static int da9062_wdt_probe(struct platform_device
> > > > *pdev)
> > > >  	watchdog_set_restart_priority(&wdt->wdtdev, 128);
> > > >
> > > >  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> > > > +	dev_set_drvdata(dev, &wdt->wdtdev);
> > > >
> > > >  	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
> > > >  	if (ret < 0)
> > > > @@ -220,10 +221,34 @@ static int da9062_wdt_probe(struct platform_device
> > > > *pdev)
> > > >  	return da9062_wdt_ping(&wdt->wdtdev);
> > > >  }
> > > >
> > > > +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> > > > +{
> > > > +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> > > > +
> > > > +	if (watchdog_active(wdd))
> > > > +		return da9062_wdt_stop(wdd);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused da9062_wdt_resume(struct device *dev)
> > > > +{
> > > > +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> > > > +
> > > > +	if (watchdog_active(wdd))
> > > > +		return da9062_wdt_start(wdd);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
> > > > +			 da9062_wdt_suspend, da9062_wdt_resume);
> > > > +
> > > >  static struct platform_driver da9062_wdt_driver = {
> > > >  	.probe = da9062_wdt_probe,
> > > >  	.driver = {
> > > >  		.name = "da9062-watchdog",
> > > > +		.pm = &da9062_wdt_pm_ops,
> > > >  		.of_match_table = da9062_compatible_id_table,
> > > >  	},
> > > >  };
> > > > --
> > > > 2.20.1
> > >
> > >
> > 
> > --
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
