Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E766327127E
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Sep 2020 07:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgITFLd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Sep 2020 01:11:33 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:57690 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgITFLd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Sep 2020 01:11:33 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 08K5AsAK017792; Sun, 20 Sep 2020 14:10:54 +0900
X-Iguazu-Qid: 34ts08I8Pqff8DdFlA
X-Iguazu-QSIG: v=2; s=0; t=1600578653; q=34ts08I8Pqff8DdFlA; m=4VWCEYnzvsm4jTKJ3ZJLj+VKtbJwjIzF6Woj0xZ7/PY=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 08K5Ap2T022031;
        Sun, 20 Sep 2020 14:10:51 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 08K5ApEm010140;
        Sun, 20 Sep 2020 14:10:51 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 08K5AoLN005086;
        Sun, 20 Sep 2020 14:10:51 +0900
Date:   Sun, 20 Sep 2020 14:10:49 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: Add Toshiba Visconti watchdog driver
X-TSB-HOP: ON
Message-ID: <20200920051049.3ymiygclk5yl3kya@toshiba.co.jp>
References: <20200918221337.257157-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200918221337.257157-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <b6638ef6-9cd2-07da-8322-13bf22e2f9f6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6638ef6-9cd2-07da-8322-13bf22e2f9f6@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Thanks for your review.

On Sat, Sep 19, 2020 at 07:28:42AM -0700, Guenter Roeck wrote:
> On 9/18/20 3:13 PM, Nobuhiro Iwamatsu wrote:
> > Add the watchdog driver for Toshiba Visconti series.
> > 
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  drivers/watchdog/Kconfig        |   8 ++
> >  drivers/watchdog/Makefile       |   1 +
> >  drivers/watchdog/visconti_wdt.c | 195 ++++++++++++++++++++++++++++++++
> >  3 files changed, 204 insertions(+)
> >  create mode 100644 drivers/watchdog/visconti_wdt.c
> > 

<snip>

> > diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
> > new file mode 100644
> > index 000000000000..cb8a88e4737e
> > --- /dev/null
> > +++ b/drivers/watchdog/visconti_wdt.c
> > @@ -0,0 +1,195 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 TOSHIBA CORPORATION
> > + * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
> > + * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
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
> > +	"Watchdog cannot be stopped once started (default=" __MODULE_STRING(
> > +		WATCHDOG_NOWAYOUT) ")");
> > +
> Line split is unnecessary (limit is now 100 comlumns)
> 

OK, I will fix this.

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
> > +	if (timeout > cnt)
> > +		timeout -= cnt;
> > +	else
> > +		return 0;
> 
> This is a bit awkward. Please consider
> 
> 	if (timeout <= cnt)
> 		return 0;
> 	timeout -= cnt;
> 

I see. I will apply your suggestion, thanks.

> > +
> > +	return timeout / VISCONTI_WDT_FREQ;
> > +}
> > +
> > +static int visconti_wdt_set_timeout(struct watchdog_device *wdev,
> > +				    unsigned int timeout)
> 
> Another unnecessary line split

OK, I will fix this.

> 
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
> > +		return dev_err_probe(dev, PTR_ERR(clk),
> > +			"Could not get clock\n");
> 
> another one.

OK, I will fix this.

> 
> > +
> > +	ret = clk_prepare_enable(clk);
> > +	if (ret) {
> > +		dev_err(dev, "Could not enable clock\n");
> > +		return ret;
> > +	}

<snip>

Best regards,
  Nobuhiro
