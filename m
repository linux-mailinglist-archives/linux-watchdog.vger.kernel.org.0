Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB31271C2F
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Sep 2020 09:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIUHla (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Sep 2020 03:41:30 -0400
Received: from mo-csw-fb1514.securemx.jp ([210.130.202.170]:40802 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIUHla (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Sep 2020 03:41:30 -0400
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 03:41:29 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 08L7QRUn000888; Mon, 21 Sep 2020 16:26:28 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 08L7PmIr024820; Mon, 21 Sep 2020 16:25:48 +0900
X-Iguazu-Qid: 34trjq6AI2pZLGPhZ3
X-Iguazu-QSIG: v=2; s=0; t=1600673148; q=34trjq6AI2pZLGPhZ3; m=1mO5cs+UjqU8muweXxb1BwigYWs7EbCvca57LNSC+HM=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1511) id 08L7PkwX014958;
        Mon, 21 Sep 2020 16:25:46 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08L7Pkb0029524;
        Mon, 21 Sep 2020 16:25:46 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08L7Pj6b011488;
        Mon, 21 Sep 2020 16:25:45 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] watchdog: Add Toshiba Visconti watchdog driver
References: <20200920051807.288034-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <20200920051807.288034-3-nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Mon, 21 Sep 2020 16:25:44 +0900
In-Reply-To: <20200920051807.288034-3-nobuhiro1.iwamatsu@toshiba.co.jp>
        (Nobuhiro Iwamatsu's message of "Sun, 20 Sep 2020 14:18:07 +0900")
X-TSB-HOP: ON
Message-ID: <87d02flhfr.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Iwamatsu-san,

Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:

> Add the watchdog driver for Toshiba Visconti series.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  drivers/watchdog/Kconfig        |   8 ++
>  drivers/watchdog/Makefile       |   1 +
>  drivers/watchdog/visconti_wdt.c | 191 ++++++++++++++++++++++++++++++++
>  3 files changed, 200 insertions(+)
>  create mode 100644 drivers/watchdog/visconti_wdt.c
>

[...]

> diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
> new file mode 100644
> index 000000000000..4a67b9fe9220
> --- /dev/null
> +++ b/drivers/watchdog/visconti_wdt.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 TOSHIBA CORPORATION
> + * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
> + * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>

interrupt.h doesn't seem to be used. It can be dropped.

> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define WDT_CNT			0x00
> +#define WDT_MIN			0x04
> +#define WDT_MAX			0x08
> +#define WDT_CTL			0x0c
> +#define WDT_CMD			0x10
> +#define WDT_CMD_CLEAR		0x4352
> +#define WDT_CMD_START_STOP	0x5354
> +#define WDT_DIV			0x30
> +
> +#define VISCONTI_WDT_FREQ	2000000 /* 2MHz */
> +#define WDT_DEFAULT_TIMEOUT	10U /* in seconds */
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(
> +	nowayout,
> +	"Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT)")");
> +
> +struct visconti_wdt_priv {
> +	struct watchdog_device wdev;
> +	void __iomem *base;
> +	u32 div;
> +};
> +
> +static int visconti_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u32 timeout = wdev->timeout * VISCONTI_WDT_FREQ;
> +
> +	writel(priv->div, priv->base + WDT_DIV);
> +	writel(0, priv->base + WDT_MIN);
> +	writel(timeout, priv->base + WDT_MAX);
> +	writel(0, priv->base + WDT_CTL);
> +	writel(WDT_CMD_START_STOP, priv->base + WDT_CMD);
> +
> +	return 0;
> +}
> +
> +static int visconti_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	writel(1, priv->base + WDT_CTL);
> +	writel(WDT_CMD_START_STOP, priv->base + WDT_CMD);
> +
> +	return 0;
> +}
> +
> +static int visconti_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdd);
> +
> +	writel(WDT_CMD_CLEAR, priv->base + WDT_CMD);
> +
> +	return 0;
> +}
> +
> +static unsigned int visconti_wdt_get_timeleft(struct watchdog_device *wdev)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u32 timeout = wdev->timeout * VISCONTI_WDT_FREQ;
> +	u32 cnt = readl(priv->base + WDT_CNT);
> +
> +	if (timeout <= cnt)
> +		return 0;
> +	timeout -= cnt;
> +
> +	return timeout / VISCONTI_WDT_FREQ;
> +}
> +
> +static int visconti_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
> +{
> +	u32 val;
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	wdev->timeout = timeout;
> +	val = wdev->timeout * VISCONTI_WDT_FREQ;
> +
> +	/* Clear counter before setting timeout because WDT expires */
> +	writel(WDT_CMD_CLEAR, priv->base + WDT_CMD);
> +	writel(val, priv->base + WDT_MAX);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info visconti_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
> +	.identity = "Visconti Watchdog",
> +};
> +
> +static const struct watchdog_ops visconti_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= visconti_wdt_start,
> +	.stop		= visconti_wdt_stop,
> +	.ping		= visconti_wdt_ping,
> +	.get_timeleft	= visconti_wdt_get_timeleft,
> +	.set_timeout	= visconti_wdt_set_timeout,
> +};
> +
> +static int visconti_wdt_probe(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdev;
> +	struct visconti_wdt_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	struct clk *clk;
> +	int ret;
> +	unsigned long clk_freq;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Could not get clock\n");
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		dev_err(dev, "Could not enable clock\n");
> +		return ret;
> +	}
> +
> +	clk_freq = clk_get_rate(clk);
> +	if (!clk_freq) {
> +		clk_disable_unprepare(clk);
> +		dev_err(dev, "Could not get clock rate\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->div = clk_freq / VISCONTI_WDT_FREQ;
> +
> +	/* Initialize struct watchdog_device. */
> +	wdev = &priv->wdev;
> +	wdev->info = &visconti_wdt_info;
> +	wdev->ops = &visconti_wdt_ops;
> +	wdev->parent = dev;
> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 0xffffffff / VISCONTI_WDT_FREQ;
> +	wdev->timeout = min(wdev->max_timeout, WDT_DEFAULT_TIMEOUT);
> +
> +	watchdog_set_drvdata(wdev, priv);
> +	watchdog_set_nowayout(wdev, nowayout);
> +	watchdog_stop_on_unregister(wdev);
> +
> +	/* This overrides the default timeout only if DT configuration was found */
> +	ret = watchdog_init_timeout(wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout value invalid, using default\n");
> +
> +	return devm_watchdog_register_device(dev, wdev);
> +}
> +
> +static const struct of_device_id visconti_wdt_of_match[] = {
> +	{ .compatible = "toshiba,visconti-wdt", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, visconti_wdt_of_match);
> +
> +static struct platform_driver visconti_wdt_driver = {
> +	.driver = {
> +			.name = "visconti_wdt",
> +			.of_match_table = visconti_wdt_of_match,
> +		},
> +	.probe = visconti_wdt_probe,
> +};
> +module_platform_driver(visconti_wdt_driver);
> +
> +MODULE_DESCRIPTION("TOSHIBA Visconti Watchdog Driver");
> +MODULE_AUTHOR("TOSHIBA ELECTRONIC DEVICES & STORAGE CORPORATION");

The MODULE_AUTHOR() macro is usually used to represent the driver
authors. Not sure about using it for the organization name which is
already included in the copyright notice. Please drop it or replace it
with the author name / email.

> +MODULE_AUTHOR("Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp");
> +MODULE_LICENSE("GPL v2");

Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Thanks,
Punit
