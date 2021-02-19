Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78E531F7C9
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Feb 2021 11:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhBSK6v (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 Feb 2021 05:58:51 -0500
Received: from mga14.intel.com ([192.55.52.115]:27169 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229691AbhBSK4q (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 Feb 2021 05:56:46 -0500
IronPort-SDR: YV3AQiQ/gnk/fNfRwoTCTLUCbHMMj9ajNTjQllYcA5F6ijeCsG5Nb+FlYCOgbmDIVDFiSV6Kam
 byH+Hj1HD8nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="183019374"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="183019374"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 02:54:53 -0800
IronPort-SDR: p7C/p6MzoO4uNm4ocqFIV/LXDOUjmHqH6MR922Yg7RRcUiPYvSzMvCZ0FcEs2O9wtGFFAcLB2P
 D1EPvlFhMhnQ==
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="590601518"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 02:54:50 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 19 Feb 2021 12:54:47 +0200
Date:   Fri, 19 Feb 2021 12:54:47 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: wdat: add param. to start wdog on module
 insertion
Message-ID: <20210219105447.GI2542@lahna.fi.intel.com>
References: <20210218163200.1154812-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218163200.1154812-1-f.suligoi@asem.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Thu, Feb 18, 2021 at 05:32:00PM +0100, Flavio Suligoi wrote:
> Add the parameter "start_enable" to start the watchdog
> directly on module insertion.
> 
> In an embedded system, for some applications, the watchdog
> must be activated as soon as possible.
> 
> In some embedded x86 boards the watchdog can be activated
> directly by the BIOS (with an appropriate setting of the
> BIOS setup). In other cases, when this BIOS feature is not
> present, the possibility to start the watchdog immediately
> after the module loading can be very useful.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  drivers/watchdog/wdat_wdt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index cec7917790e5..b990d0197d2e 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -61,6 +61,12 @@ module_param(timeout, int, 0);
>  MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
>  		 __MODULE_STRING(WDAT_DEFAULT_TIMEOUT) ")");
>  
> +#define START_DEFAULT	0
> +static int start_enabled = START_DEFAULT;
> +module_param(start_enabled, int, 0);
> +MODULE_PARM_DESC(start_enabled, "Watchdog is started on module insertion "
> +		 "(default=" __MODULE_STRING(START_DEFAULT) ")");
> +
>  static int wdat_wdt_read(struct wdat_wdt *wdat,
>  	 const struct wdat_instruction *instr, u32 *value)
>  {
> @@ -437,6 +443,8 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	wdat_wdt_boot_status(wdat);
> +	if (start_enabled)
> +		wdat_wdt_start(&wdat->wdd);

No objections to this if it is really needed. However, I think it is
better start the watchdog after devm_watchdog_register_device() has been
called so we have everything initialized.

>  	wdat_wdt_set_running(wdat);
>  
>  	ret = wdat_wdt_enable_reboot(wdat);
> -- 
> 2.25.1
