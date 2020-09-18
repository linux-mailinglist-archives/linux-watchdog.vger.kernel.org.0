Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8529526F67E
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Sep 2020 09:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIRHLH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Sep 2020 03:11:07 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:49908 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgIRHLH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Sep 2020 03:11:07 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 08I7AapY013494; Fri, 18 Sep 2020 16:10:36 +0900
X-Iguazu-Qid: 34ts08I8PnPfx23pWH
X-Iguazu-QSIG: v=2; s=0; t=1600413036; q=34ts08I8PnPfx23pWH; m=DkeX3tA3s3UCiDbAmxO+TYixCsAuMJ4xGg7czA4J/8g=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1513) id 08I7AYxs029089;
        Fri, 18 Sep 2020 16:10:34 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 08I7AYxS001073;
        Fri, 18 Sep 2020 16:10:34 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 08I7AX1s014572;
        Fri, 18 Sep 2020 16:10:33 +0900
Date:   Fri, 18 Sep 2020 16:10:31 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        yuji2.ishikawa@toshiba.co.jp, punit1.agrawal@toshiba.co.jp,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: Add Toshiba Visconti watchdog driver
X-TSB-HOP: ON
Message-ID: <20200918071031.6uj4kgt6mwpkxs2o@toshiba.co.jp>
References: <20200917223924.227997-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200917223924.227997-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <71bd6d23-8995-c006-2a4f-a7cc039924ad@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71bd6d23-8995-c006-2a4f-a7cc039924ad@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Thanks for your review.

On Thu, Sep 17, 2020 at 10:51:14PM -0700, Guenter Roeck wrote:
> On 9/17/20 3:39 PM, Nobuhiro Iwamatsu wrote:
> > Add the watchdog driver for Toshiba Visconti series.
> > 
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  drivers/watchdog/Kconfig        |   8 ++
> >  drivers/watchdog/Makefile       |   1 +
> >  drivers/watchdog/visconti_wdt.c | 192 ++++++++++++++++++++++++++++++++
> >  3 files changed, 201 insertions(+)
> >  create mode 100644 drivers/watchdog/visconti_wdt.c
> > 

<snip>

> > +#include <linux/module.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/clk.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/watchdog.h>
> 
> Alphabetically, please.
> 

OK, I will fix this.

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

<snip>

> > +
> > +static unsigned int visconti_wdt_get_timeleft(struct watchdog_device *wdev)
> > +{
> > +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > +	u32 timeout = wdev->timeout * VISCONTI_WDT_FREQ;
> > +
> > +	timeout -= readl(priv->base + WDT_CNT);
> > +
> 
> What happens if this is negative for whatever reason ?
>

Oh, thanks. I will add a negative check and handling.

> > +	return timeout / VISCONTI_WDT_FREQ;
> > +}
> > +
> > +static int visconti_wdt_set_timeout(struct watchdog_device *wdev,
> > +				    unsigned int timeout)
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

<snip>

> > +	if (IS_ERR(priv->base))
> > +		return PTR_ERR(priv->base);
> > +
> > +	clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(clk)) {
> > +		dev_err(dev, "Could not get clock\n");
> 
> devm_clk_get() can return -EPROBE_DEFER. In that case we don't
> want to see an error message. Consider using dev_err_probe().

OK, I will rewrite using using dev_err_probe().

> 
> > +		return PTR_ERR(clk);
> > +	}
> > +
> > +	ret = clk_prepare_enable(clk);
> > +	if (ret) {
> > +		dev_err(dev, "Could not enable clock\n");
> > +		return ret;
> > +	}

<snip>

Best regards,
  Nobuhiro
