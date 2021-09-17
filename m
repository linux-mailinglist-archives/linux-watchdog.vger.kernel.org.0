Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D250340FAD9
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 16:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhIQO4p (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 10:56:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:20411 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229834AbhIQO4p (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 10:56:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="283819148"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="scan'208";a="283819148"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2021 07:55:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="scan'208";a="530744324"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2021 07:55:19 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 17 Sep 2021 17:55:17 +0300
Date:   Fri, 17 Sep 2021 17:55:17 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Malin Jonsson <malin.jonsson@ericsson.com>,
        john.jacques@intel.com, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: iTCO_wdt: Leave running if the watchdog core
 ping thread is enabled
Message-ID: <YUSsVX1O1uzv4VJ2@lahna>
References: <20210917101533.9722-1-mika.westerberg@linux.intel.com>
 <375dbb7a-d89c-def4-0283-606a7a33f6b6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <375dbb7a-d89c-def4-0283-606a7a33f6b6@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 17, 2021 at 07:31:17AM -0700, Guenter Roeck wrote:
> On 9/17/21 3:15 AM, Mika Westerberg wrote:
> > The watchdog core can handle pinging of the watchdog before userspace
> > gets control so we can take advantage of that in iTCO_wdt. This also
> > allows users to disable the watchdog core ping thread by passing
> > watchdog.handle_boot_enabled=0 in the kernel command line if needed.
> > 
> > To avoid any unexpected resets we keep the existing functionality of
> > stopping the watchdog on probe if the watchdog core ping thread is not
> > enabled in the Kconfig (CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=n).
> > 
> 
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is enabled by default, and it should be
> enabled for all normal use cases, so this is a bit misleading.

OK.

> > Cc: Malin Jonsson <malin.jonsson@ericsson.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >   drivers/watchdog/iTCO_wdt.c | 42 ++++++++++++++++++++++++++++++-------
> >   1 file changed, 34 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> > index 643c6c2d0b72..234494c03df3 100644
> > --- a/drivers/watchdog/iTCO_wdt.c
> > +++ b/drivers/watchdog/iTCO_wdt.c
> > @@ -430,6 +430,27 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
> >   	return time_left;
> >   }
> > +static bool iTCO_wdt_set_running(struct iTCO_wdt_private *p)
> > +{
> > +	/*
> > +	 * If the watchdog core is enabled to handle pinging the
> > +	 * watchdog before userspace takes control we can leave the
> > +	 * hardware as is.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
> 
> This is neither necessary nor appropriate. Just set the flag. The core
> won't handle boot enabled if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=n
> even if WDOG_HW_RUNNING is set.
> 
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not a driver configuration option.
> It is a core option, and its description says:
> 
> " ... is to ping watchdog devices that were enabled before the driver has
>  been loaded until control is taken over from userspace using the
>  /dev/watchdog file."
> 
> This is not what is implemented here. Yes, there is a driver using
> the option, but that hardware does not support the ability to detect
> if the watchdog is running. That is not the case here.
> 
> If you want to have the ability to both keep the watchdog running or
> to stop it at boot, you'll need to add a module option.

Okay, I guess if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set by default
there's minimal risk of breaking existing users if we simply set the
flag. I would rather not add new module parameters if possible.

Will do these changes in the next version.
