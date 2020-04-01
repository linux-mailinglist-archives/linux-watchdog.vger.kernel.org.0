Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26BB319A735
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Apr 2020 10:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDAIZw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Apr 2020 04:25:52 -0400
Received: from mail.phytec.co.uk ([217.6.246.34]:52878 "EHLO
        lws-riedmueller.phytec.de" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726197AbgDAIZw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Apr 2020 04:25:52 -0400
X-Greylist: delayed 353 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Apr 2020 04:25:52 EDT
Received: by lws-riedmueller.phytec.de (Postfix, from userid 20140)
        id E13891A1626; Wed,  1 Apr 2020 10:19:57 +0200 (CEST)
Date:   Wed, 1 Apr 2020 10:19:57 +0200
From:   Stefan =?iso-8859-1?Q?Riedm=FCller?= <s.riedmueller@phytec.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [PATCH 2/3] watchdog: da9063: Use pre configured timeout when
 watchdog is running
Message-ID: <20200401081953.GA1585@phytec.de>
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
 <20200326150203.371673-2-s.riedmueller@phytec.de>
 <AM6PR10MB2263A1A76AFFBCE7BCC4B93880CB0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <387fadc6-1eab-ada7-86dd-0e47c5e9cb9f@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <387fadc6-1eab-ada7-86dd-0e47c5e9cb9f@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter, Adam,

Guenter Roeck <linux@roeck-us.net> wrote on Tue, 31. Mar 20 09:08:
> On 3/30/20 9:38 AM, Adam Thomson wrote:
> > On 26 March 2020 15:02, Stefan Riedmueller wrote:
> > 
> >> If the watchdog is already running during probe use its pre-configured
> >> timeout instead of a default timeout to make sure the watchdog is pinged
> >> in time until userspace takes over.
> > 
> > At least for this driver I don't think there's an issue here with regards to
> > not pinging in time. Calling 'da9063_wdt_update_timeout()', as it currently
> > does in the probe() when the watchdog is already active, actually disables the
> > watchdog before then setting a new timeout value, so by that method we're
> > avoiding a timeout and starting a new timer period.
> > 
> > To my mind the timeout value should come from DT if possible, which I would
> > assume for the most part would match whatever is defined in the bootloader as
> > well, unless I'm mistaken. If that's not available though then I would maybe
> > agree on falling back to a value that was already programmed in the bootloader
> > rather than the driver default which should be the last resort.
> > 
> Agreed.

Thanks for both your feedback. I'll drop the pre-configured timeout part and
stick with the default timeout and do the same procedure (init_timeout +
update_timeout) for the da9062.

Thanks
Stefan

> 
> Guenter
> 
> >>
> >> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> >> ---
> >>  drivers/watchdog/da9063_wdt.c | 29 ++++++++++++++++++-----------
> >>  1 file changed, 18 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> >> index 3d65e92a4e3f..34d0c4f03814 100644
> >> --- a/drivers/watchdog/da9063_wdt.c
> >> +++ b/drivers/watchdog/da9063_wdt.c
> >> @@ -46,15 +46,16 @@ static unsigned int da9063_wdt_timeout_to_sel(unsigned
> >> int secs)
> >>  }
> >>
> >>  /*
> >> - * Return 0 if watchdog is disabled, else non zero.
> >> + * Read the currently active timeout.
> >> + * Zero means the watchdog is disabled.
> >>   */
> >> -static unsigned int da9063_wdt_is_running(struct da9063 *da9063)
> >> +static unsigned int da9063_wdt_read_timeout(struct da9063 *da9063)
> >>  {
> >>  	unsigned int val;
> >>
> >>  	regmap_read(da9063->regmap, DA9063_REG_CONTROL_D, &val);
> >>
> >> -	return val & DA9063_TWDSCALE_MASK;
> >> +	return wdt_timeout[val & DA9063_TWDSCALE_MASK];
> >>  }
> >>
> >>  static int da9063_wdt_disable_timer(struct da9063 *da9063)
> >> @@ -191,6 +192,7 @@ static int da9063_wdt_probe(struct platform_device
> >> *pdev)
> >>  	struct device *dev = &pdev->dev;
> >>  	struct da9063 *da9063;
> >>  	struct watchdog_device *wdd;
> >> +	int timeout;
> >>
> >>  	if (!dev->parent)
> >>  		return -EINVAL;
> >> @@ -214,15 +216,20 @@ static int da9063_wdt_probe(struct platform_device
> >> *pdev)
> >>  	watchdog_set_restart_priority(wdd, 128);
> >>  	watchdog_set_drvdata(wdd, da9063);
> >>
> >> -	/* Set default timeout, maybe override it with DT value, scale it */
> >> -	wdd->timeout = DA9063_WDG_TIMEOUT;
> >> -	watchdog_init_timeout(wdd, 0, dev);
> >> -	da9063_wdt_set_timeout(wdd, wdd->timeout);
> >> -
> >> -	/* Change the timeout to the default value if the watchdog is running */
> >> -	if (da9063_wdt_is_running(da9063)) {
> >> -		da9063_wdt_update_timeout(da9063, wdd->timeout);
> >> +	/*
> >> +	 * Use pre-configured timeout if watchdog is already running.
> >> +	 * Otherwise set default timeout, maybe override it with DT value,
> >> +	 * scale it
> >> +	 */
> >> +	timeout = da9063_wdt_read_timeout(da9063);
> >> +	if (timeout) {
> >> +		wdd->timeout = timeout;
> >>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
> >> +		dev_info(da9063->dev, "watchdog is running (%u s)", timeout);
> >> +	} else {
> >> +		wdd->timeout = DA9063_WDG_TIMEOUT;
> >> +		watchdog_init_timeout(wdd, 0, dev);
> >> +		da9063_wdt_set_timeout(wdd, wdd->timeout);
> >>  	}
> >>
> >>  	return devm_watchdog_register_device(dev, wdd);
> >> --
> >> 2.23.0
> > 
> 
