Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B63C44AB06
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 10:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243681AbhKIJ7U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 04:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241704AbhKIJ7O (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 04:59:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D35C061764
        for <linux-watchdog@vger.kernel.org>; Tue,  9 Nov 2021 01:56:28 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkNrR-0002z2-9N; Tue, 09 Nov 2021 10:56:13 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mkNrP-000Vmq-9F; Tue, 09 Nov 2021 10:56:11 +0100
Message-ID: <9ac6629d3fb4002b51c7b39eda4648d8845795a3.camel@pengutronix.de>
Subject: Re: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Date:   Tue, 09 Nov 2021 10:56:11 +0100
In-Reply-To: <20211104160858.15550-5-biju.das.jz@bp.renesas.com>
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
         <20211104160858.15550-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 2021-11-04 at 16:08 +0000, Biju Das wrote:
[...]
> +static int rzg2l_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzg2l_wdt_priv *priv;
> +	struct clk *wdt_clk;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	/* Get watchdog main clock */
> +	wdt_clk = devm_clk_get(&pdev->dev, "oscclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no oscclk");
> +
> +	priv->osc_clk_rate = clk_get_rate(wdt_clk);
> +	if (!priv->osc_clk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
> +
> +	/* Get Peripheral clock */
> +	wdt_clk = devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no pclk");
> +
> +	priv->pclk_rate = clk_get_rate(wdt_clk);
> +	if (!priv->pclk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "pclk rate is 0");
> +
> +	priv->delay = F2CYCLE_NSEC(priv->osc_clk_rate) * 6 + F2CYCLE_NSEC(priv->pclk_rate) * 9;
> +
> +	priv->rstc = devm_reset_control_get(&pdev->dev, NULL);

Please use devm_reset_control_get_exclusive().

> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +			"failed to get cpg reset");
> +
> +	reset_control_deassert(priv->rstc);
> +	ret = devm_add_action_or_reset(&pdev->dev,
> +				       rzg2l_wdt_reset_assert_clock_disable,

I suppose rzg2l_wdt_reset_assert_clock_disable should be renamed to
rzg2l_wdt_reset_assert given that it does not disable a clock.

> +				       &priv->wdev);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "failed to get reset");

I think this should just return ret, as the only possible failure from
devm_add_action_or_reset() is -ENOMEM.

> +
> +	pm_runtime_enable(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed");

Consider printing ret with %pe.

> +		goto out_pm_get;
> +	}
> +
> +	priv->wdev.info = &rzg2l_wdt_ident;
> +	priv->wdev.ops = &rzg2l_wdt_ops;
> +	priv->wdev.parent = dev;
> +	priv->wdev.min_timeout = 1;
> +	priv->wdev.max_timeout = WDT_CYCLE_MSEC(priv->osc_clk_rate, 0xfff);
> +	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
> +
> +	platform_set_drvdata(pdev, priv);
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_set_restart_priority(&priv->wdev, 0);
> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout invalid, using default");
> +
> +	ret = devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> +	if (ret < 0)
> +		goto out_pm_disable;
> +
> +	return 0;
> +
> +out_pm_disable:
> +	pm_runtime_put(dev);
> +out_pm_get:
> +	pm_runtime_disable(dev);
> +
> +	return ret;
> +}

regards
Philipp
