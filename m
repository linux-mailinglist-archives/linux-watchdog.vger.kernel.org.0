Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36E8426572
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Oct 2021 09:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhJHHyl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Oct 2021 03:54:41 -0400
Received: from gecko.sbs.de ([194.138.37.40]:38253 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhJHHyg (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Oct 2021 03:54:36 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1987qLus026454
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 8 Oct 2021 09:52:21 +0200
Received: from [167.87.4.198] ([167.87.4.198])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1987qKUg002516;
        Fri, 8 Oct 2021 09:52:20 +0200
Subject: Re: [PATCH] Revert "watchdog: iTCO_wdt: Account for rebooting on
 second timeout"
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>,
        "Javier S . Pedro" <debbugs@javispedro.com>
References: <20211008003302.1461733-1-linux@roeck-us.net>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9b9c797c-04f1-0ccf-b6fe-e9f1e4f5c17d@siemens.com>
Date:   Fri, 8 Oct 2021 09:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008003302.1461733-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08.10.21 02:33, Guenter Roeck wrote:
> This reverts commit cb011044e34c ("watchdog: iTCO_wdt: Account for
> rebooting on second timeout") and commit aec42642d91f ("watchdog: iTCO_wdt:
> Fix detection of SMI-off case") since those patches cause a regression
> on certain boards (https://bugzilla.kernel.org/show_bug.cgi?id=213809).
> 
> While this revert may result in some boards to only reset after twice
> the configured timeout value, that is still better than a watchdog reset
> after half the configured value.
> 
> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
> Fixes: aec42642d91f ("watchdog: iTCO_wdt: Fix detection of SMI-off case")
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Mantas Mikulėnas <grawity@gmail.com>
> Reported-by: Javier S. Pedro <debbugs@javispedro.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/iTCO_wdt.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 643c6c2d0b72..ced2fc0deb8c 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -71,8 +71,6 @@
>  #define TCOBASE(p)	((p)->tco_res->start)
>  /* SMI Control and Enable Register */
>  #define SMI_EN(p)	((p)->smi_res->start)
> -#define TCO_EN		(1 << 13)
> -#define GBL_SMI_EN	(1 << 0)
>  
>  #define TCO_RLD(p)	(TCOBASE(p) + 0x00) /* TCO Timer Reload/Curr. Value */
>  #define TCOv1_TMR(p)	(TCOBASE(p) + 0x01) /* TCOv1 Timer Initial Value*/
> @@ -357,12 +355,8 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>  
>  	tmrval = seconds_to_ticks(p, t);
>  
> -	/*
> -	 * If TCO SMIs are off, the timer counts down twice before rebooting.
> -	 * Otherwise, the BIOS generally reboots when the SMI triggers.
> -	 */
> -	if (p->smi_res &&
> -	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
> +	/* For TCO v1 the timer counts down twice before rebooting */
> +	if (p->iTCO_version == 1)
>  		tmrval /= 2;
>  
>  	/* from the specs: */
> @@ -527,7 +521,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  		 * Disables TCO logic generating an SMI#
>  		 */
>  		val32 = inl(SMI_EN(p));
> -		val32 &= ~TCO_EN;	/* Turn off SMI clearing watchdog */
> +		val32 &= 0xffffdfff;	/* Turn off SMI clearing watchdog */
>  		outl(val32, SMI_EN(p));
>  	}
>  
> 

Sigh, how broken is this architecture of the iTCO? Agreed, this leaves
no option then.

BTW, the fact that we saw an inconsistency in read-back timeout
indicates that there is still an issue for the remaining /= 2 case
(means v1), but I'm loosing interest in fixing those issues, given how
hard it is to test broadly without breaking users first.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
