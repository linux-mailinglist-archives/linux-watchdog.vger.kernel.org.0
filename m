Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C0696510
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 17:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbfHTPsT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 11:48:19 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46338 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHTPsT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 11:48:19 -0400
Received: by mail-pl1-f193.google.com with SMTP id c2so2950930plz.13;
        Tue, 20 Aug 2019 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zM4tkp5HVe5NvMKdx1PxufJlR17iBM8TdN6ox0aCcPk=;
        b=pe43NX5ra6XUeZ/gR3lq4k22EGIYUbVg+TNkByk89byxYUlD6CAbjZrBXx641dMkR4
         GS4L6X7S/tu5SWsNY/yjWY3+aFGrchw0FfqHtdP+q4lyT/fWTwriTZn8eBhHfo7a76C6
         Ko/S3WzR8hYGMkVbZdgCTg23KD/5krksMLfXieSJCQAgzMHoGWp9+U5skGerM4HYmxMR
         lHFivlGtJSSkIrSVf/iCqc3ckSEoNOjsBYxPdh5RakBSqNPBhkns/3+NTGaRfJKbjjUc
         SDnZrsyFUfK99D4mIDq4yRlfsGYPAJ7s4dlZfccchgHdqLuU6nlvMILz1/5mXFc4+BBH
         Z3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zM4tkp5HVe5NvMKdx1PxufJlR17iBM8TdN6ox0aCcPk=;
        b=ZYVolvqXiyyZsE8YH2AohTZY/WLZQhXWpiKedoX41hF8cJvaQBhFTI2O/4mDZcbzm6
         BZnaewGiLa7e6Fj/SIUAejcJWFWqt8L6HR2uwqXBrqyaDwbgjiIxf1VxbkA9d0kCcmRy
         6H2fOy18RhbLdA3zWD6z2I7m+HYNqBnP5hNuziTnsIXOt/JLehSQN0UeNI+tCv2fsdlh
         qXkXZ9HkaKaqugJBmDzs3onysrC1nMcezTj1HufzQZp66EWBIuun7GUGM/eLp8yuidzY
         tx0zP4+pxwMw3v/T4O91ednnycT566PMfhx1zFWMptg2JNs0dZXvWgNYMo7jvQDZLhsR
         pCrw==
X-Gm-Message-State: APjAAAXaZd3HbNs2jitmtSQIYhg+lBVjGHkJCcyLW6TFpdmdfTaQVzq9
        ZT99MbZ12BTQeynn3pMjAjQ=
X-Google-Smtp-Source: APXvYqylKgL/BN33iAN9MePIBPwVHO56HCvmDtfcBGesVftSeHMm5mppBHH5fAVYvV95Nbztea53bg==
X-Received: by 2002:a17:902:8602:: with SMTP id f2mr9635760plo.235.1566316097320;
        Tue, 20 Aug 2019 08:48:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y68sm10495491pfy.25.2019.08.20.08.48.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 08:48:16 -0700 (PDT)
Date:   Tue, 20 Aug 2019 08:48:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson.Huang@nxp.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br,
        leonard.crestez@nxp.com, u.kleine-koenig@pengutronix.de,
        schnitzeltony@gmail.com, jan.tuerk@emtrion.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 2/4] watchdog: Add i.MX7ULP watchdog support
Message-ID: <20190820154815.GA20033@roeck-us.net>
References: <20190812085321.13823-1-Anson.Huang@nxp.com>
 <20190812085321.13823-2-Anson.Huang@nxp.com>
 <20190820153155.GA19394@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820153155.GA19394@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 20, 2019 at 08:31:55AM -0700, Guenter Roeck wrote:
> On Mon, Aug 12, 2019 at 04:53:19PM +0800, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> > 
> > The i.MX7ULP Watchdog Timer (WDOG) module is an independent timer
> > that is available for system use.
> > It provides a safety feature to ensure that software is executing
> > as planned and that the CPU is not stuck in an infinite loop or
> > executing unintended code. If the WDOG module is not serviced
> > (refreshed) within a certain period, it resets the MCU.
> > 
> > Add driver support for i.MX7ULP watchdog.
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 

Wait, I have to withdraw that.

With clk_prepare_enable(), you'll also need to call clk_disable_unprepare()
on remove. An easy way to do this and keep the code simple would be:

static void imx7ulp_wdt_clk_disable_unprepare(void *data)
{
	clk_disable_unprepare(data);
}

static int imx7ulp_wdt_probe(...)
{
	...
	ret = clk_prepare_enable(imx7ulp_wdt->clk);
	if (ret)
		return ret;
	ret = devm_add_action_or_reset(dev, imx7ulp_wdt_clk_disable_unprepare);
	if (ret)
		return ret;
	...

Thanks,
Guenter

> > ---
> > Changes since V1:
> > 	- Add clock operation;
> > 	- Remove unneccsary error message when registering watchdog device failed;
> > 	- Use BIT() instead of hard code;
> > ---
> >  drivers/watchdog/Kconfig       |  13 +++
> >  drivers/watchdog/Makefile      |   1 +
> >  drivers/watchdog/imx7ulp_wdt.c | 244 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 258 insertions(+)
> >  create mode 100644 drivers/watchdog/imx7ulp_wdt.c
> > 
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 8188963..0884e53 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -740,6 +740,19 @@ config IMX_SC_WDT
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called imx_sc_wdt.
> >  
> > +config IMX7ULP_WDT
> > +	tristate "IMX7ULP Watchdog"
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	select WATCHDOG_CORE
> > +	help
> > +	  This is the driver for the hardware watchdog on the Freescale
> > +	  IMX7ULP and later processors. If you have one of these
> > +	  processors and wish to have watchdog support enabled,
> > +	  say Y, otherwise say N.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called imx7ulp_wdt.
> > +
> >  config UX500_WATCHDOG
> >  	tristate "ST-Ericsson Ux500 watchdog"
> >  	depends on MFD_DB8500_PRCMU
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index 7caa920..7d32537 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_TS4800_WATCHDOG) += ts4800_wdt.o
> >  obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
> >  obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
> >  obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
> > +obj-$(CONFIG_IMX7ULP_WDT) += imx7ulp_wdt.o
> >  obj-$(CONFIG_UX500_WATCHDOG) += ux500_wdt.o
> >  obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
> >  obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
> > diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> > new file mode 100644
> > index 0000000..c20fba4
> > --- /dev/null
> > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > @@ -0,0 +1,244 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2019 NXP.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reboot.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define WDOG_CS			0x0
> > +#define WDOG_CS_CMD32EN		BIT(13)
> > +#define WDOG_CS_ULK		BIT(11)
> > +#define WDOG_CS_RCS		BIT(10)
> > +#define WDOG_CS_EN		BIT(7)
> > +#define WDOG_CS_UPDATE		BIT(5)
> > +
> > +#define WDOG_CNT	0x4
> > +#define WDOG_TOVAL	0x8
> > +
> > +#define REFRESH_SEQ0	0xA602
> > +#define REFRESH_SEQ1	0xB480
> > +#define REFRESH		((REFRESH_SEQ1 << 16) | REFRESH_SEQ0)
> > +
> > +#define UNLOCK_SEQ0	0xC520
> > +#define UNLOCK_SEQ1	0xD928
> > +#define UNLOCK		((UNLOCK_SEQ1 << 16) | UNLOCK_SEQ0)
> > +
> > +#define DEFAULT_TIMEOUT	60
> > +#define MAX_TIMEOUT	128
> > +
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0000);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> > +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +struct imx7ulp_wdt_device {
> > +	struct notifier_block restart_handler;
> > +	struct watchdog_device wdd;
> > +	void __iomem *base;
> > +	struct clk *clk;
> > +	int rate;
> > +};
> > +
> > +static inline void imx7ulp_wdt_enable(void __iomem *base, bool enable)
> > +{
> > +	u32 val = readl(base + WDOG_CS);
> > +
> > +	writel(UNLOCK, base + WDOG_CNT);
> > +	if (enable)
> > +		writel(val | WDOG_CS_EN, base + WDOG_CS);
> > +	else
> > +		writel(val & ~WDOG_CS_EN, base + WDOG_CS);
> > +}
> > +
> > +static inline bool imx7ulp_wdt_is_enabled(void __iomem *base)
> > +{
> > +	u32 val = readl(base + WDOG_CS);
> > +
> > +	return val & WDOG_CS_EN;
> > +}
> > +
> > +static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
> > +{
> > +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> > +
> > +	writel(REFRESH, wdt->base + WDOG_CNT);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx7ulp_wdt_start(struct watchdog_device *wdog)
> > +{
> > +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> > +
> > +	imx7ulp_wdt_enable(wdt->base, true);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx7ulp_wdt_stop(struct watchdog_device *wdog)
> > +{
> > +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> > +
> > +	imx7ulp_wdt_enable(wdt->base, false);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
> > +				   unsigned int timeout)
> > +{
> > +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> > +	u32 val = wdt->rate * timeout;
> > +
> > +	writel(UNLOCK, wdt->base + WDOG_CNT);
> > +	writel(val, wdt->base + WDOG_TOVAL);
> > +
> > +	wdog->timeout = timeout;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct watchdog_ops imx7ulp_wdt_ops = {
> > +	.owner = THIS_MODULE,
> > +	.start = imx7ulp_wdt_start,
> > +	.stop  = imx7ulp_wdt_stop,
> > +	.ping  = imx7ulp_wdt_ping,
> > +	.set_timeout = imx7ulp_wdt_set_timeout,
> > +};
> > +
> > +static const struct watchdog_info imx7ulp_wdt_info = {
> > +	.identity = "i.MX7ULP watchdog timer",
> > +	.options  = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> > +		    WDIOF_MAGICCLOSE,
> > +};
> > +
> > +static inline void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
> > +{
> > +	u32 val;
> > +
> > +	/* unlock the wdog for reconfiguration */
> > +	writel_relaxed(UNLOCK_SEQ0, base + WDOG_CNT);
> > +	writel_relaxed(UNLOCK_SEQ1, base + WDOG_CNT);
> > +
> > +	/* set an initial timeout value in TOVAL */
> > +	writel(timeout, base + WDOG_TOVAL);
> > +	/* enable 32bit command sequence and reconfigure */
> > +	val = BIT(13) | BIT(8) | BIT(5);
> > +	writel(val, base + WDOG_CS);
> > +}
> > +
> > +static int imx7ulp_wdt_probe(struct platform_device *pdev)
> > +{
> > +	struct imx7ulp_wdt_device *imx7ulp_wdt;
> > +	struct device *dev = &pdev->dev;
> > +	struct watchdog_device *wdog;
> > +	int ret;
> > +
> > +	imx7ulp_wdt = devm_kzalloc(dev, sizeof(*imx7ulp_wdt), GFP_KERNEL);
> > +	if (!imx7ulp_wdt)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, imx7ulp_wdt);
> > +
> > +	imx7ulp_wdt->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(imx7ulp_wdt->base))
> > +		return PTR_ERR(imx7ulp_wdt->base);
> > +
> > +	imx7ulp_wdt->clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(imx7ulp_wdt->clk)) {
> > +		dev_err(dev, "Failed to get watchdog clock\n");
> > +		return PTR_ERR(imx7ulp_wdt->clk);
> > +	}
> > +
> > +	ret = clk_prepare_enable(imx7ulp_wdt->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	imx7ulp_wdt->rate = 1000;
> > +	wdog = &imx7ulp_wdt->wdd;
> > +	wdog->info = &imx7ulp_wdt_info;
> > +	wdog->ops = &imx7ulp_wdt_ops;
> > +	wdog->min_timeout = 1;
> > +	wdog->max_timeout = MAX_TIMEOUT;
> > +	wdog->parent = dev;
> > +	wdog->timeout = DEFAULT_TIMEOUT;
> > +
> > +	watchdog_init_timeout(wdog, 0, dev);
> > +	watchdog_stop_on_reboot(wdog);
> > +	watchdog_stop_on_unregister(wdog);
> > +	watchdog_set_drvdata(wdog, imx7ulp_wdt);
> > +	imx7ulp_wdt_init(imx7ulp_wdt->base, wdog->timeout * imx7ulp_wdt->rate);
> > +
> > +	ret = devm_watchdog_register_device(dev, wdog);
> > +	if (ret)
> > +		goto disable_clk;
> > +
> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(imx7ulp_wdt->clk);
> > +
> > +	return ret;
> > +}
> > +
> > +static int __maybe_unused imx7ulp_wdt_suspend(struct device *dev)
> > +{
> > +	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
> > +
> > +	if (watchdog_active(&imx7ulp_wdt->wdd))
> > +		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
> > +
> > +	clk_disable_unprepare(imx7ulp_wdt->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused imx7ulp_wdt_resume(struct device *dev)
> > +{
> > +	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
> > +	u32 timeout = imx7ulp_wdt->wdd.timeout * imx7ulp_wdt->rate;
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(imx7ulp_wdt->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (imx7ulp_wdt_is_enabled(imx7ulp_wdt->base))
> > +		imx7ulp_wdt_init(imx7ulp_wdt->base, timeout);
> > +
> > +	if (watchdog_active(&imx7ulp_wdt->wdd))
> > +		imx7ulp_wdt_start(&imx7ulp_wdt->wdd);
> > +
> > +	return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(imx7ulp_wdt_pm_ops, imx7ulp_wdt_suspend,
> > +			 imx7ulp_wdt_resume);
> > +
> > +static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> > +	{ .compatible = "fsl,imx7ulp-wdt", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
> > +
> > +static struct platform_driver imx7ulp_wdt_driver = {
> > +	.probe		= imx7ulp_wdt_probe,
> > +	.driver		= {
> > +		.name	= "imx7ulp-wdt",
> > +		.pm	= &imx7ulp_wdt_pm_ops,
> > +		.of_match_table = imx7ulp_wdt_dt_ids,
> > +	},
> > +};
> > +module_platform_driver(imx7ulp_wdt_driver);
> > +
> > +MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
> > +MODULE_DESCRIPTION("Freescale i.MX7ULP watchdog driver");
> > +MODULE_LICENSE("GPL v2");
