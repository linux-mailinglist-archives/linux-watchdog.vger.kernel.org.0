Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5858641FC58
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Oct 2021 15:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbhJBNo5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 Oct 2021 09:44:57 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:54327 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233303AbhJBNo5 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 Oct 2021 09:44:57 -0400
Date:   Sat, 2 Oct 2021 15:43:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1633182188;
        bh=jW5plCRI73mha4Eov56nnBtenGpxY9DC383L16WZDM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXLxS9hUV0vZkZc9hjGSnPxKZ/fe/tOXaoiB2M+U33pcCh7xl1vY+TzJDLPZS3K8+
         gnOTBGxSDgt6RF5bkt1eHE1vMrRBK36lHKu+5kqnmwCr/27CVV7MacppkpzRu80tNa
         ErVq8CUl6O1xJTIoQmx3DQSkQ0Byq9aKDZ4PHVAI=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: iTCO_wdt: Full reinitialize on resume
Message-ID: <e32b5113-d2e5-4c3a-af7b-daea00e5fbe6@t-8ch.de>
References: <20210928165343.23401-1-linux@weissschuh.net>
 <20211002132303.GB4023280@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211002132303.GB4023280@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2021-10-02T06:23-0700, Guenter Roeck wrote:
> On Tue, Sep 28, 2021 at 06:53:43PM +0200, Thomas Weißschuh wrote:
> > The Thinkpad T460s always needs driver-side suspend-resume handling.
> > If the watchdog is not stopped before suspend then the system will hang
> > on resume.
> > If the interval is not set before starting the watchdog then the machine
> > will instantly be reset after resume.
> > 
> > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=198019
> 
> The Fixes: tag references a SHA, not a bugzilla bug.

Thanks, I'll change that for v2.

> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  drivers/watchdog/iTCO_wdt.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> > index 643c6c2d0b72..2297a0a1e5fc 100644
> > --- a/drivers/watchdog/iTCO_wdt.c
> > +++ b/drivers/watchdog/iTCO_wdt.c
> > @@ -47,6 +47,7 @@
> >  /* Includes */
> >  #include <linux/acpi.h>			/* For ACPI support */
> >  #include <linux/bits.h>			/* For BIT() */
> > +#include <linux/dmi.h>			/* For DMI matching */
> >  #include <linux/module.h>		/* For module specific items */
> >  #include <linux/moduleparam.h>		/* For new moduleparam's */
> >  #include <linux/types.h>		/* For standard types (like size_t) */
> > @@ -605,9 +606,20 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
> >   */
> >  
> >  #ifdef CONFIG_ACPI
> > +static const struct dmi_system_id iTCO_wdt_force_suspend[] = {
> > +	{
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad T460s"),
> > +		},
> > +	},
> > +	{ },
> > +};
> > +
> >  static inline bool need_suspend(void)
> >  {
> > -	return acpi_target_system_state() == ACPI_STATE_S0;
> > +	return acpi_target_system_state() == ACPI_STATE_S0 ||
> > +		dmi_check_system(iTCO_wdt_force_suspend);
> >  }
> >  #else
> >  static inline bool need_suspend(void) { return true; }
> > @@ -631,8 +643,10 @@ static int iTCO_wdt_resume_noirq(struct device *dev)
> >  {
> >  	struct iTCO_wdt_private *p = dev_get_drvdata(dev);
> >  
> > -	if (p->suspended)
> > +	if (p->suspended) {
> > +		iTCO_wdt_set_timeout(&p->wddev, p->wddev.timeout);
> >  		iTCO_wdt_start(&p->wddev);
> > +	}
> >  
> >  	return 0;
> >  }
> > 
> > base-commit: 41e73feb1024929e75eaf2f7cd93f35a3feb331b
> > -- 
> > 2.33.0

Is the current way with the dmi table the correct way to do it?

I'm also CC-ing Mark Person from Lenovo who may be able to take a look and
ask their firmware team to maybe fix this on their side.

Thomas
