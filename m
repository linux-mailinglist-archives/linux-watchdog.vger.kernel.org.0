Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABAB2A9344
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 10:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgKFJsI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 04:48:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFJsG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 04:48:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F58C0613CF
        for <linux-watchdog@vger.kernel.org>; Fri,  6 Nov 2020 01:48:06 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kayLi-00080s-1R; Fri, 06 Nov 2020 10:48:02 +0100
Subject: Re: [Linux-stm32] [PATCH 1/1] watchdog: stm32_iwdg: don't print an
 error on probe deferral
To:     Christophe Roullier <christophe.roullier@st.com>,
        wim@linux-watchdog.org, linux@roeck-us.net,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     Etienne Carriere <etienne.carriere@st.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20201106094627.21132-1-christophe.roullier@st.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <ed817cfc-a338-0e41-b4d5-56da42677d26@pengutronix.de>
Date:   Fri, 6 Nov 2020 10:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201106094627.21132-1-christophe.roullier@st.com>
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

Hello Christophe,

On 11/6/20 10:46 AM, Christophe Roullier wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for clock resources.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 25188d6bbe15..1b71c205cee0 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -163,7 +163,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  
>  	wdt->clk_lsi = devm_clk_get(dev, "lsi");
>  	if (IS_ERR(wdt->clk_lsi)) {
> -		dev_err(dev, "Unable to get lsi clock\n");
> +		if (PTR_ERR(wdt->clk_lsi) != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get lsi clock\n");

Can you use dev_err_probe instead?

Cheers,
Ahmad

>  		return PTR_ERR(wdt->clk_lsi);
>  	}
>  
> @@ -171,7 +172,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
>  		if (IS_ERR(wdt->clk_pclk)) {
> -			dev_err(dev, "Unable to get pclk clock\n");
> +			if (PTR_ERR(wdt->clk_pclk) != -EPROBE_DEFER)
> +				dev_err(dev, "Unable to get pclk clock\n");
>  			return PTR_ERR(wdt->clk_pclk);
>  		}
>  
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
