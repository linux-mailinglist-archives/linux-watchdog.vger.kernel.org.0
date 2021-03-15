Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DFE33AFB9
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCOKPK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:15:10 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:34764 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhCOKPJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:15:09 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12FAEaHp016787
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Mar 2021 11:14:36 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.41.172])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 12FAEahv032325;
        Mon, 15 Mar 2021 11:14:36 +0100
Date:   Mon, 15 Mar 2021 11:14:34 +0100
From:   Henning Schild <henning.schild@siemens.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        "Gerd Haeussler" <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Haener <michael.haener@siemens.com>
Subject: Re: [PATCH v2 4/4] platform/x86: pmc_atom: improve critclk_systems
 matching for Siemens PCs
Message-ID: <20210315111434.413137b5@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210315095710.7140-5-henning.schild@siemens.com>
References: <20210315095710.7140-1-henning.schild@siemens.com>
        <20210315095710.7140-5-henning.schild@siemens.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am Mon, 15 Mar 2021 10:57:10 +0100
schrieb Henning Schild <henning.schild@siemens.com>:

> Siemens industrial PCs unfortunately can not always be properly
> identified the way we used to. An earlier commit introduced code that
> allows proper identification without looking at DMI strings that could
> differ based on product branding.
> Switch over to that proper way and revert commits that used to collect
> the machines based on unstable strings.
> 
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL") Fixes: e8796c6c69d1 ("platform/x86: pmc_atom: Add
> Siemens CONNECT ...") Fixes: f110d252ae79 ("platform/x86: pmc_atom:
> Add Siemens SIMATIC ...") Fixes: ad0d315b4d4e ("platform/x86:
> pmc_atom: Add Siemens SIMATIC ...") Tested-by: Michael Haener
> <michael.haener@siemens.com> Signed-off-by: Henning Schild
> <henning.schild@siemens.com> ---
>  drivers/platform/x86/pmc_atom.c | 47
> +++++++++++++++++++-------------- 1 file changed, 27 insertions(+),
> 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c
> b/drivers/platform/x86/pmc_atom.c index ca684ed760d1..38542d547f29
> 100644 --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -13,6 +13,7 @@
>  #include <linux/io.h>
>  #include <linux/platform_data/x86/clk-pmc-atom.h>
>  #include <linux/platform_data/x86/pmc_atom.h>
> +#include <linux/platform_data/x86/simatic-ipc.h>
>  #include <linux/platform_device.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
> @@ -362,6 +363,23 @@ static void pmc_dbgfs_register(struct pmc_dev
> *pmc) }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +static bool pmc_clk_is_critical = true;
> +
> +static int siemens_clk_is_critical(const struct dmi_system_id *d)
> +{
> +	u32 st_id;
> +
> +	if (dmi_walk(simatic_ipc_find_dmi_entry_helper, &st_id))
> +		goto out;
> +
> +	if (st_id == SIMATIC_IPC_IPC227E || st_id ==
> SIMATIC_IPC_IPC277E)
> +		return 1;
> +
> +out:
> +	pmc_clk_is_critical = false;
> +	return 1;
> +}
> +
>  /*
>   * Some systems need one or more of their pmc_plt_clks to be
>   * marked as critical.
> @@ -424,24 +442,10 @@ static const struct dmi_system_id
> critclk_systems[] = { },
>  	},
>  	{
> -		.ident = "SIMATIC IPC227E",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "6ES7647-8B"),
> -		},
> -	},
> -	{
> -		.ident = "SIMATIC IPC277E",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "6AV7882-0"),
> -		},
> -	},
> -	{
> -		.ident = "CONNECT X300",
> +		.callback = siemens_clk_is_critical,
> +		.ident = "SIEMENS AG",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION,
> "A5E45074588"), },
>  	},
>  
> @@ -453,7 +457,7 @@ static int pmc_setup_clks(struct pci_dev *pdev,
> void __iomem *pmc_regmap, {
>  	struct platform_device *clkdev;
>  	struct pmc_clk_data *clk_data;
> -	const struct dmi_system_id *d =
> dmi_first_match(critclk_systems);
> +	const struct dmi_system_id *d;
>  
>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>  	if (!clk_data)
> @@ -461,9 +465,12 @@ static int pmc_setup_clks(struct pci_dev *pdev,
> void __iomem *pmc_regmap, 
>  	clk_data->base = pmc_regmap; /* offset is added by client */
>  	clk_data->clks = pmc_data->clks;
> -	if (d) {
> -		clk_data->critical = true;
> -		pr_info("%s critclks quirk enabled\n", d->ident);
> +	if (dmi_check_system(critclk_systems)) {

Had to switch to check_system to get the callback to work.

> +		clk_data->critical = pmc_clk_is_critical;
> +		if (clk_data->critical) {
> +			d = dmi_first_match(critclk_systems);
> +			pr_info("%s critclks quirk enabled\n",
> d->ident);

Now need a double match here just to print the ident. Not too happy
with that but proposing it like this to keep the ident printing.

I guess it could be improved by not printing the ident or having a
global variable and global callback to remember the ident to print
later. I would propose to not print the ident if the double-match does
not find traction.

Henning

> +		}
>  	}
>  
>  	clkdev = platform_device_register_data(&pdev->dev,
> "clk-pmc-atom",

