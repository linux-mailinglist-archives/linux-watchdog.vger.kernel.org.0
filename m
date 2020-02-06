Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7223A1546E5
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2020 15:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgBFO4G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Feb 2020 09:56:06 -0500
Received: from mga11.intel.com ([192.55.52.93]:15887 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgBFO4G (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Feb 2020 09:56:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Feb 2020 06:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; 
   d="scan'208";a="344908104"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 06 Feb 2020 06:56:03 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 06 Feb 2020 16:56:02 +0200
Date:   Thu, 6 Feb 2020 16:56:02 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Tom Abraham <tabraham@suse.com>
Subject: Re: Forcing non-ACPI watchdog driver
Message-ID: <20200206145602.GQ2667@lahna.fi.intel.com>
References: <1580915129.23547.3.camel@suse.de>
 <20200205152435.GE2667@lahna.fi.intel.com>
 <20200205163048.GD25403@roeck-us.net>
 <20200205163831.GG2667@lahna.fi.intel.com>
 <20200206154532.359086d6@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206154532.359086d6@endymion>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 06, 2020 at 03:45:32PM +0100, Jean Delvare wrote:
> Hi Mika,
> 
> On Wed, 5 Feb 2020 18:38:31 +0200, Mika Westerberg wrote:
> > On Wed, Feb 05, 2020 at 08:30:48AM -0800, Guenter Roeck wrote:
> > > On Wed, Feb 05, 2020 at 05:24:35PM +0200, Mika Westerberg wrote:  
> > > > You should be able to revert to iTCO_wdt by simply disabling
> > > > CONFIG_WDAT_WDT from .config. Then acpi_has_watchdog() returns false
> > > > which means that iTCO_wdt is used instead.  
> > > 
> > > That may not be possible in a generic distribution.  
> > 
> > Right, they would need to build their own kernel. Currently there is no
> > way to do that without changing .config.
> 
> OK, that's pretty much what I was compl^Wworried about ;-) Would you
> consider applying something like the following patch?

Yes, I think the patch makes sense.

Rafael, I guess you will take this since it is touching ACPI?

> From: Jean Delvare <jdelvare@suse.de>
> Subject: ACPI / watchdog: Allow disabling WDAT at boot
> 
> In case the WDAT interface is broken, give the user the option to
> ignore it to let a native driver bind to the watchdog device instead.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |    4 ++++
>  drivers/acpi/acpi_watchdog.c                    |   12 +++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> --- linux-5.4.orig/drivers/acpi/acpi_watchdog.c	2020-02-06 15:20:27.187333079 +0100
> +++ linux-5.4/drivers/acpi/acpi_watchdog.c	2020-02-06 15:30:08.707408406 +0100
> @@ -55,12 +55,14 @@ static bool acpi_watchdog_uses_rtc(const
>  }
>  #endif
>  
> +static bool acpi_no_watchdog;
> +
>  static const struct acpi_table_wdat *acpi_watchdog_get_wdat(void)
>  {
>  	const struct acpi_table_wdat *wdat = NULL;
>  	acpi_status status;
>  
> -	if (acpi_disabled)
> +	if (acpi_disabled || acpi_no_watchdog)
>  		return NULL;
>  
>  	status = acpi_get_table(ACPI_SIG_WDAT, 0,
> @@ -88,6 +90,14 @@ bool acpi_has_watchdog(void)
>  }
>  EXPORT_SYMBOL_GPL(acpi_has_watchdog);
>  
> +/* ACPI watchdog can be disabled on boot command line */
> +static int __init disable_acpi_watchdog(char *str)
> +{
> +	acpi_no_watchdog = true;
> +	return 1;
> +}
> +__setup("acpi_no_watchdog", disable_acpi_watchdog);
> +
>  void __init acpi_watchdog_init(void)
>  {
>  	const struct acpi_wdat_entry *entries;
> --- linux-5.4.orig/Documentation/admin-guide/kernel-parameters.txt	2020-02-06 15:20:27.187333079 +0100
> +++ linux-5.4/Documentation/admin-guide/kernel-parameters.txt	2020-02-06 15:31:16.614155680 +0100
> @@ -136,6 +136,10 @@
>  			dynamic table installation which will install SSDT
>  			tables to /sys/firmware/acpi/tables/dynamic.
>  
> +	acpi_no_watchdog	[HW,ACPI,WDT]
> +			Ignore the ACPI-based watchdog interface (WDAT) and let
> +			a native driver control the watchdog device instead.
> +
>  	acpi_rsdp=	[ACPI,EFI,KEXEC]
>  			Pass the RSDP address to the kernel, mostly used
>  			on machines running EFI runtime service to boot the
> 
> Thanks,
> -- 
> Jean Delvare
> SUSE L3 Support
