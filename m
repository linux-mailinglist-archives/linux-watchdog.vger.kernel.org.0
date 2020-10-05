Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC82282E70
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Oct 2020 02:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgJEACx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 4 Oct 2020 20:02:53 -0400
Received: from mo-csw1114.securemx.jp ([210.130.202.156]:49320 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgJEACx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 4 Oct 2020 20:02:53 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 09502Ew6032433; Mon, 5 Oct 2020 09:02:14 +0900
X-Iguazu-Qid: 2wHHJOhcBHbVw3jLOM
X-Iguazu-QSIG: v=2; s=0; t=1601856134; q=2wHHJOhcBHbVw3jLOM; m=2MYHx3FG2kWsSHXSr9K6kiI3YK1CB+I6fS69GzXNOkI=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1111) id 09502BIc029270;
        Mon, 5 Oct 2020 09:02:12 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 09502BGK011645;
        Mon, 5 Oct 2020 09:02:11 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 09502Bqv028807;
        Mon, 5 Oct 2020 09:02:11 +0900
Date:   Mon, 5 Oct 2020 09:02:09 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 2/2] watchdog: Add Toshiba Visconti watchdog driver
X-TSB-HOP: ON
Message-ID: <20201005000209.72uxzmkfbpzxdyvk@toshiba.co.jp>
References: <20200921091235.299774-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200921091235.299774-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201001180038.GA102106@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001180038.GA102106@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Thanks for you review.

On Thu, Oct 01, 2020 at 11:00:38AM -0700, Guenter Roeck wrote:
> On Mon, Sep 21, 2020 at 06:12:35PM +0900, Nobuhiro Iwamatsu wrote:
> > Add the watchdog driver for Toshiba Visconti series.
> > 
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> > ---
> >  drivers/watchdog/Kconfig        |   8 ++
> >  drivers/watchdog/Makefile       |   1 +
> >  drivers/watchdog/visconti_wdt.c | 189 ++++++++++++++++++++++++++++++++
> >  3 files changed, 198 insertions(+)
> >  create mode 100644 drivers/watchdog/visconti_wdt.c
> > 
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index ab7aad5a1e69..0cb078ce5e9d 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1004,6 +1004,14 @@ config PM8916_WATCHDOG
> >  	  Say Y here to include support watchdog timer embedded into the
> >  	  pm8916 module.
> >  
> > +config VISCONTI_WATCHDOG
> > +	tristate "Toshiba Visconti series watchdog support"
> > +	depends on ARCH_VISCONTI || COMPILE_TEST
> > +	select WATCHDOG_CORE
> > +	help
> > +	  Say Y here to include support for the watchdog timer in Toshiba
> > +	  Visconti SoCs.
> > +
> >  # X86 (i386 + ia64 + x86_64) Architecture
> >  
> >  config ACQUIRE_WDT
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index 97bed1d3d97c..a7747e76fd29 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -95,6 +95,7 @@ obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
> >  obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
> >  obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
> >  obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
> > +obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
> >  
> >  # X86 (i386 + ia64 + x86_64) Architecture
> >  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> > diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
> > new file mode 100644
> > index 000000000000..9448eaaa51b6
> > --- /dev/null
> > +++ b/drivers/watchdog/visconti_wdt.c
> > @@ -0,0 +1,189 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 TOSHIBA CORPORATION
> > + * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
> > + * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define WDT_CNT			0x00
> > +#define WDT_MIN			0x04
> > +#define WDT_MAX			0x08
> > +#define WDT_CTL			0x0c
> > +#define WDT_CMD			0x10
> > +#define WDT_CMD_CLEAR		0x4352
> > +#define WDT_CMD_START_STOP	0x5354
> > +#define WDT_DIV			0x30
> > +
> > +#define VISCONTI_WDT_FREQ	2000000 /* 2MHz */
> > +#define WDT_DEFAULT_TIMEOUT	10U /* in seconds */
> > +
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(
> > +	nowayout,
> > +	"Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT)")");
> > +
> > +struct visconti_wdt_priv {
> > +	struct watchdog_device wdev;
> > +	void __iomem *base;
> > +	u32 div;
> > +};
> > +
> > +static int visconti_wdt_start(struct watchdog_device *wdev)
> > +{
> > +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > +	u32 timeout = wdev->timeout * VISCONTI_WDT_FREQ;
> > +
> > +	writel(priv->div, priv->base + WDT_DIV);
> > +	writel(0, priv->base + WDT_MIN);
> > +	writel(timeout, priv->base + WDT_MAX);
> > +	writel(0, priv->base + WDT_CTL);
> > +	writel(WDT_CMD_START_STOP, priv->base + WDT_CMD);
> > +
> > +	return 0;
> > +}
> > +
> > +static int visconti_wdt_stop(struct watchdog_device *wdev)
> > +{
> > +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > +
> > +	writel(1, priv->base + WDT_CTL);
> > +	writel(WDT_CMD_START_STOP, priv->base + WDT_CMD);
> > +
> > +	return 0;
> > +}
> > +
> > +static int visconti_wdt_ping(struct watchdog_device *wdd)
> > +{
> > +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdd);
> > +
> > +	writel(WDT_CMD_CLEAR, priv->base + WDT_CMD);
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned int visconti_wdt_get_timeleft(struct watchdog_device *wdev)
> > +{
> > +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > +	u32 timeout = wdev->timeout * VISCONTI_WDT_FREQ;
> > +	u32 cnt = readl(priv->base + WDT_CNT);
> > +
> > +	if (timeout <= cnt)
> > +		return 0;
> > +	timeout -= cnt;
> > +
> > +	return timeout / VISCONTI_WDT_FREQ;
> > +}
> > +
> > +static int visconti_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
> > +{
> > +	u32 val;
> > +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > +
> > +	wdev->timeout = timeout;
> > +	val = wdev->timeout * VISCONTI_WDT_FREQ;
> > +
> > +	/* Clear counter before setting timeout because WDT expires */
> > +	writel(WDT_CMD_CLEAR, priv->base + WDT_CMD);
> > +	writel(val, priv->base + WDT_MAX);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct watchdog_info visconti_wdt_info = {
> > +	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
> > +	.identity = "Visconti Watchdog",
> > +};
> > +
> > +static const struct watchdog_ops visconti_wdt_ops = {
> > +	.owner		= THIS_MODULE,
> > +	.start		= visconti_wdt_start,
> > +	.stop		= visconti_wdt_stop,
> > +	.ping		= visconti_wdt_ping,
> > +	.get_timeleft	= visconti_wdt_get_timeleft,
> > +	.set_timeout	= visconti_wdt_set_timeout,
> > +};
> > +
> > +static int visconti_wdt_probe(struct platform_device *pdev)
> > +{
> > +	struct watchdog_device *wdev;
> > +	struct visconti_wdt_priv *priv;
> > +	struct device *dev = &pdev->dev;
> > +	struct clk *clk;
> > +	int ret;
> > +	unsigned long clk_freq;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(priv->base))
> > +		return PTR_ERR(priv->base);
> > +
> > +	clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(clk))
> > +		return dev_err_probe(dev, PTR_ERR(clk), "Could not get clock\n");
> > +
> > +	ret = clk_prepare_enable(clk);
> > +	if (ret) {
> > +		dev_err(dev, "Could not enable clock\n");
> > +		return ret;
> > +	}
> 
> There is no clk_disable_unprepare() when the driver is removed, or when
> devm_watchdog_register_device() fails. For situations like this I suggest
> to handle cleanup with devm_add_action_or_reset(), which would also
> simplify error handling. There are lots of examples in other watchdog
> drivers.

I see. I will fix this with your suggestion.

> 
> Guenter
>

Best regards,
  Nobuhiro

> > +
> > +	clk_freq = clk_get_rate(clk);
> > +	if (!clk_freq) {
> > +		clk_disable_unprepare(clk);
> > +		dev_err(dev, "Could not get clock rate\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	priv->div = clk_freq / VISCONTI_WDT_FREQ;
> > +
> > +	/* Initialize struct watchdog_device. */
> > +	wdev = &priv->wdev;
> > +	wdev->info = &visconti_wdt_info;
> > +	wdev->ops = &visconti_wdt_ops;
> > +	wdev->parent = dev;
> > +	wdev->min_timeout = 1;
> > +	wdev->max_timeout = 0xffffffff / VISCONTI_WDT_FREQ;
> > +	wdev->timeout = min(wdev->max_timeout, WDT_DEFAULT_TIMEOUT);
> > +
> > +	watchdog_set_drvdata(wdev, priv);
> > +	watchdog_set_nowayout(wdev, nowayout);
> > +	watchdog_stop_on_unregister(wdev);
> > +
> > +	/* This overrides the default timeout only if DT configuration was found */
> > +	ret = watchdog_init_timeout(wdev, 0, dev);
> > +	if (ret)
> > +		dev_warn(dev, "Specified timeout value invalid, using default\n");
> > +
> > +	return devm_watchdog_register_device(dev, wdev);
> > +}
> > +
> > +static const struct of_device_id visconti_wdt_of_match[] = {
> > +	{ .compatible = "toshiba,visconti-wdt", },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, visconti_wdt_of_match);
> > +
> > +static struct platform_driver visconti_wdt_driver = {
> > +	.driver = {
> > +			.name = "visconti_wdt",
> > +			.of_match_table = visconti_wdt_of_match,
> > +		},
> > +	.probe = visconti_wdt_probe,
> > +};
> > +module_platform_driver(visconti_wdt_driver);
> > +
> > +MODULE_DESCRIPTION("TOSHIBA Visconti Watchdog Driver");
> > +MODULE_AUTHOR("Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp");
> > +MODULE_LICENSE("GPL v2");
> > -- 
> > 2.27.0
> > 
> 
