Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB92354255
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Apr 2021 15:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235736AbhDENXm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Apr 2021 09:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbhDENXm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Apr 2021 09:23:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33050C061756
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Apr 2021 06:23:36 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1lTPCQ-0008U6-EH; Mon, 05 Apr 2021 15:23:26 +0200
Subject: Re: [PATCH] watchdog: imx_sc_wdt: fix pretimeout
To:     eichest@gmail.com, linux-watchdog@vger.kernel.org
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Fabio Estevam <festevam@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20210405125946.369230-1-eichest@gmail.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <d71134f4-03be-c66f-d620-53147651783d@pengutronix.de>
Date:   Mon, 5 Apr 2021 15:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210405125946.369230-1-eichest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 05.04.21 14:59, eichest@gmail.com wrote:
> From: Stefan Eichenberger <eichest@gmail.com>
> 
> If the WDIOF_PRETIMEOUTE flag is not set when registering the device the
> driver will not show the sysfs entries or register the default governor.
> By moving the registering after the decision whether pretimeout is
> supported this gets fixed.
> 
> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
> ---
>  drivers/watchdog/imx_sc_wdt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index e9ee22a7cb45..eddb1ae630e0 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -183,10 +183,6 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(wdog);
>  	watchdog_stop_on_unregister(wdog);
>  
> -	ret = devm_watchdog_register_device(dev, wdog);
> -	if (ret)
> -		return ret;
> -
>  	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>  				       SC_IRQ_WDOG,
>  				       true);
> @@ -213,6 +209,10 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  	else
>  		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
>  
> +	ret = devm_watchdog_register_device(dev, wdog);
> +	if (ret)
> +		return ret;

This could be rewritten as return devm_watchdog_register_device(dev, wdog);

> +
>  	return 0;
>  }
>  
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
