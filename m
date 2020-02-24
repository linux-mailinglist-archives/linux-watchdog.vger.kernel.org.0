Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F49816A3CA
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2020 11:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgBXKWX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Feb 2020 05:22:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57471 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgBXKWX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Feb 2020 05:22:23 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j6AsO-0006AU-OD; Mon, 24 Feb 2020 11:22:12 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j6AsN-00010t-EU; Mon, 24 Feb 2020 11:22:11 +0100
Date:   Mon, 24 Feb 2020 11:22:11 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH] watchdog: imx2_wdt: Drop .remove callback
Message-ID: <20200224102211.clzqw4vtzc4nz5df@pengutronix.de>
References: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Feb 24, 2020 at 10:51:27AM +0800, Anson Huang wrote:
> .remove callback implementation doesn' call clk_disable_unprepare() which
> is buggy, actually, we can just use devm_watchdog_register_device() and
> devm_add_action_or_reset() to handle all necessary operations for remove
> action, then .remove callback can be dropped.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/watchdog/imx2_wdt.c | 37 ++++++++++---------------------------
>  1 file changed, 10 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index f8d58bf..1fe472f 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -244,6 +244,11 @@ static const struct regmap_config imx2_wdt_regmap_config = {
>  	.max_register = 0x8,
>  };
>  
> +static void imx2_wdt_action(void *data)
> +{
> +	clk_disable_unprepare(data);

Does this have the effect of stopping the watchdog? Maybe we can have a
more expressive function name here (imx2_wdt_stop_clk or similar)?

Is there some watchdog core policy that tells if the watchdog should be
stopped on unload?

> +}
> +
>  static int __init imx2_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -292,6 +297,10 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = devm_add_action_or_reset(dev, imx2_wdt_action, wdev->clk);
> +	if (ret)
> +		return ret;
> +
>  	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
>  	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ? WDIOF_CARDRESET : 0;
>  
> @@ -315,32 +324,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  	 */
>  	regmap_write(wdev->regmap, IMX2_WDT_WMCR, 0);
>  
> -	ret = watchdog_register_device(wdog);
> -	if (ret)
> -		goto disable_clk;
> -
> -	dev_info(dev, "timeout %d sec (nowayout=%d)\n",
> -		 wdog->timeout, nowayout);

Does the core put this info in the kernel log? If not dropping it isn't
obviously right enough to be done en passant.

> -	return 0;
> -
> -disable_clk:
> -	clk_disable_unprepare(wdev->clk);
> -	return ret;
> -}
> -
> -static int __exit imx2_wdt_remove(struct platform_device *pdev)
> -{
> -	struct watchdog_device *wdog = platform_get_drvdata(pdev);
> -	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
> -
> -	watchdog_unregister_device(wdog);
> -
> -	if (imx2_wdt_is_running(wdev)) {
> -		imx2_wdt_ping(wdog);
> -		dev_crit(&pdev->dev, "Device removed: Expect reboot!\n");
> -	}

I also wonder about this one. This changes the timing behaviour and so
IMHO shouldn't be done as a side effect of a cleanup patch.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
