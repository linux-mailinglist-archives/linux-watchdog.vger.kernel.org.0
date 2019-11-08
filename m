Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A09F42EF
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2019 10:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbfKHJQW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Nov 2019 04:16:22 -0500
Received: from 11.mo4.mail-out.ovh.net ([46.105.34.195]:43099 "EHLO
        11.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730005AbfKHJQW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Nov 2019 04:16:22 -0500
X-Greylist: delayed 3601 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 04:16:21 EST
Received: from player732.ha.ovh.net (unknown [10.109.143.246])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 6052120AE73
        for <linux-watchdog@vger.kernel.org>; Fri,  8 Nov 2019 08:58:09 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
        (Authenticated sender: clg@kaod.org)
        by player732.ha.ovh.net (Postfix) with ESMTPSA id E30F3BC89B87;
        Fri,  8 Nov 2019 07:57:57 +0000 (UTC)
Subject: Re: [PATCH] watchdog: aspeed: Fix clock behaviour for ast2600
To:     Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20191108032905.22463-1-joel@jms.id.au>
From:   =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b82e1ba9-7ad3-6fbe-710f-51afc573f738@kaod.org>
Date:   Fri, 8 Nov 2019 08:57:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191108032905.22463-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2310628085550451479
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvtddgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08/11/2019 04:29, Joel Stanley wrote:
> The ast2600 no longer uses bit 4 in the control register to indicate a
> 1MHz clock (It now controls weather this watchdog is reset by a SOC
> reset). This means we do not want to set it. It also does not need to be
> set for the ast2500, as it is read-only on that SoC.
> 
> The comment next to the clock rate selection wandered away from where it
> was set, so put it back next to the register setting it's describing.
> 
> Fixes: b3528b487448 ("watchdog: aspeed: Add support for AST2600")
> Signed-off-by: Joel Stanley <joel@jms.id.au>



Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  drivers/watchdog/aspeed_wdt.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 4ec0906bf12c..7e00960651fa 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -258,11 +258,6 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
> -	/*
> -	 * The ast2400 wdt can run at PCLK, or 1MHz. The ast2500 only
> -	 * runs at 1MHz. We chose to always run at 1MHz, as there's no
> -	 * good reason to have a faster watchdog counter.
> -	 */
>  	wdt->wdd.info = &aspeed_wdt_info;
>  	wdt->wdd.ops = &aspeed_wdt_ops;
>  	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
> @@ -278,7 +273,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	config = ofdid->data;
>  
> -	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> +	/*
> +	 * On clock rates:
> +	 *  - ast2400 wdt can run at PCLK, or 1MHz
> +	 *  - ast2500 only runs at 1MHz, hard coding bit 4 to 1
> +	 *  - ast2600 always runs at 1MHz
> +	 *
> +	 * Set the ast2400 to run at 1MHz as it simplifies the driver.
> +	 */
> +	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
> +		wdt->ctrl = WDT_CTRL_1MHZ_CLK;
>  
>  	/*
>  	 * Control reset on a per-device basis to ensure the
> 

