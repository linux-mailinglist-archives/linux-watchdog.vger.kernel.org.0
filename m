Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F3587FA9
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 18:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437234AbfHIQUS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 12:20:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35169 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407432AbfHIQUA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 12:20:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id n4so4367066pgv.2;
        Fri, 09 Aug 2019 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VktzH3f+MMc6Y73k6S/0OWPYDEvl/+muipxWljljDC0=;
        b=r6FMJ9ltiscW9LOT1qgM80LC/h2LdpJ/hXLnkKMenMoLXRzT1nBpx3qbZ3GWH0Z3sN
         tXSSiWzOy1xmzTvDU2GLGU04Xh5bN0sJXTKrqJgc2zXLU7YTM2747mri4R7Df97gGxnf
         RR/SZts2V8KdMJIGUsGRlOTzJjQlcLdTMBgyho/Jo6MTb3ACVYHd3m3qltG4kOqtuJzZ
         Fa+1duhqD8wk5H0zsuYMlv4Q4gJWeYbOZyglK2QJYCNwRSpypX+Gv2FgLaSxbtU61ucT
         xLBtnGZ2dJf3SvkiZboDiCY0GMn8exTZ0IQ07apMHVI7VbhKj8fJ3LzNBo7+dBfaRUu3
         tENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VktzH3f+MMc6Y73k6S/0OWPYDEvl/+muipxWljljDC0=;
        b=V3d2/8jUXR0smQ+VOrRh701hbpmpJGMDN/aTWpf7nKIe0J3CZd+LHydHytYpd75hvF
         OFzIGoD22kCdfNAbyzutT1MhLr1+cbkiHhzEENyvYBPcR17ysvgn6OZE2HmEpC9NLFhE
         PufmsGlhgZblcyhIqG/fV+hVZ5PCBw/s+GpzYdiPTy9y2j6Vpbnfpcl4wV9QyKS6ySyg
         do35IsFOY+RGYJhGs+pPkpDTuDrpnlK59sgmAKroqrtITT76Egw+w/4sKyESvLyLU9NN
         k/dtU7YBgUul/QbhlcT5gS4zujI4TFYnf+gss9XH5wLbjYzrgLlx2NzrVSU9KSgcKXEn
         4Nwg==
X-Gm-Message-State: APjAAAUb7+oKcYUe0deUrA9uLdYjcVlLK27SEenXCyVKEJjqbVJu+4X7
        RuOwMRoIBBPM2tKlDE585DE=
X-Google-Smtp-Source: APXvYqyqWAZt/605oQcMnI1gQn/qWKV6SpDUCv9Mb2Jms/xHQbMhaDq9V5iK4MiH7N3VOiHovbVFCA==
X-Received: by 2002:a63:66c5:: with SMTP id a188mr18134283pgc.127.1565367598124;
        Fri, 09 Aug 2019 09:19:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q8sm5445392pjq.20.2019.08.09.09.19.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 09:19:57 -0700 (PDT)
Date:   Fri, 9 Aug 2019 09:19:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br,
        leonard.crestez@nxp.com, schnitzeltony@gmail.com,
        u.kleine-koenig@pengutronix.de, jan.tuerk@emtrion.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 2/4] watchdog: Add i.MX7ULP watchdog support
Message-ID: <20190809161956.GA6248@roeck-us.net>
References: <1565334842-28161-1-git-send-email-Anson.Huang@nxp.com>
 <1565334842-28161-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565334842-28161-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 03:14:00PM +0800, Anson Huang wrote:
> The i.MX7ULP Watchdog Timer (WDOG) module is an independent timer
> that is available for system use.
> It provides a safety feature to ensure that software is executing
> as planned and that the CPU is not stuck in an infinite loop or
> executing unintended code. If the WDOG module is not serviced
> (refreshed) within a certain period, it resets the MCU.
> 
> Add driver support for i.MX7ULP watchdog.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/watchdog/Kconfig       |  13 +++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/imx7ulp_wdt.c | 221 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 235 insertions(+)
>  create mode 100644 drivers/watchdog/imx7ulp_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 8188963..0884e53 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -740,6 +740,19 @@ config IMX_SC_WDT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx_sc_wdt.
>  
> +config IMX7ULP_WDT
> +	tristate "IMX7ULP Watchdog"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This is the driver for the hardware watchdog on the Freescale
> +	  IMX7ULP and later processors. If you have one of these
> +	  processors and wish to have watchdog support enabled,
> +	  say Y, otherwise say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx7ulp_wdt.
> +
>  config UX500_WATCHDOG
>  	tristate "ST-Ericsson Ux500 watchdog"
>  	depends on MFD_DB8500_PRCMU
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 7caa920..7d32537 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_TS4800_WATCHDOG) += ts4800_wdt.o
>  obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
>  obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
>  obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
> +obj-$(CONFIG_IMX7ULP_WDT) += imx7ulp_wdt.o
>  obj-$(CONFIG_UX500_WATCHDOG) += ux500_wdt.o
>  obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
>  obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> new file mode 100644
> index 0000000..8d56023
> --- /dev/null
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 NXP.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/watchdog.h>
> +
> +#define WDOG_CS			0x0
> +#define WDOG_CS_CMD32EN		(1 << 13)
> +#define WDOG_CS_ULK		(1 << 11)
> +#define WDOG_CS_RCS		(1 << 10)
> +#define WDOG_CS_EN		(1 << 7)
> +#define WDOG_CS_UPDATE		(1 << 5)
> +

Please use BIT() where appropriate.

> +#define WDOG_CNT	0x4
> +#define WDOG_TOVAL	0x8
> +
> +#define REFRESH_SEQ0	0xA602
> +#define REFRESH_SEQ1	0xB480
> +#define REFRESH		((REFRESH_SEQ1 << 16) | (REFRESH_SEQ0))

The inner ( ) are unnecessary. While I would accept it for readability
for the first part, (REFRESH_SEQ0) really doesn't add value.

> +
> +#define UNLOCK_SEQ0	0xC520
> +#define UNLOCK_SEQ1	0xD928
> +#define UNLOCK		((UNLOCK_SEQ1 << 16) | (UNLOCK_SEQ0))

Same as above.

> +
> +#define DEFAULT_TIMEOUT 60
> +#define MAX_TIMEOUT 128

tabs after _TIMEOUT, please

> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0000);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct imx7ulp_wdt_device {
> +	struct notifier_block restart_handler;
> +	struct watchdog_device wdd;
> +	void __iomem *base;
> +	int rate;
> +};
> +
> +static inline void imx7ulp_wdt_enable(void __iomem *base, bool enable)
> +{
> +	u32 val = readl(base + WDOG_CS);
> +
> +	writel(UNLOCK, base + WDOG_CNT);
> +	if (enable)
> +		writel(val | WDOG_CS_EN, base + WDOG_CS);
> +	else
> +		writel(val & ~WDOG_CS_EN, base + WDOG_CS);
> +}
> +
> +static inline bool imx7ulp_wdt_is_enabled(void __iomem *base)
> +{
> +	u32 val = readl(base + WDOG_CS);
> +
> +	return val & WDOG_CS_EN;
> +}
> +
> +static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
> +{
> +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> +
> +	writel(REFRESH, wdt->base + WDOG_CNT);
> +
> +	return 0;
> +}
> +
> +static int imx7ulp_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> +
> +	imx7ulp_wdt_enable(wdt->base, true);
> +
> +	return 0;
> +}
> +
> +static int imx7ulp_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> +
> +	imx7ulp_wdt_enable(wdt->base, false);
> +
> +	return 0;
> +}
> +
> +static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
> +				   unsigned int timeout)
> +{
> +	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> +	u32 val = wdt->rate * timeout;
> +
> +	writel(UNLOCK, wdt->base + WDOG_CNT);
> +	writel(val, wdt->base + WDOG_TOVAL);
> +
> +	wdog->timeout = timeout;
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_ops imx7ulp_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = imx7ulp_wdt_start,
> +	.stop  = imx7ulp_wdt_stop,
> +	.ping  = imx7ulp_wdt_ping,
> +	.set_timeout = imx7ulp_wdt_set_timeout,
> +};
> +
> +static const struct watchdog_info imx7ulp_wdt_info = {
> +	.identity = "i.MX7ULP watchdog timer",
> +	.options  = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> +		    WDIOF_MAGICCLOSE,
> +};
> +
> +static inline void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
> +{
> +	u32 val;
> +
> +	/* unlock the wdog for reconfiguration */
> +	writel_relaxed(UNLOCK_SEQ0, base + WDOG_CNT);
> +	writel_relaxed(UNLOCK_SEQ1, base + WDOG_CNT);
> +
> +	/* set an initial timeout value in TOVAL */
> +	writel(timeout, base + WDOG_TOVAL);
> +	/* enable 32bit command sequence and reconfigure */
> +	val = (1 << 13) | (1 << 8) | (1 << 5);

Please use BIT()

> +	writel(val, base + WDOG_CS);
> +}
> +
> +static int imx7ulp_wdt_probe(struct platform_device *pdev)
> +{
> +	struct imx7ulp_wdt_device *imx7ulp_wdt;
> +	struct device *dev = &pdev->dev;
> +	struct watchdog_device *wdog;
> +	int ret;
> +
> +	imx7ulp_wdt = devm_kzalloc(&pdev->dev,
> +				   sizeof(*imx7ulp_wdt), GFP_KERNEL);
> +	if (!imx7ulp_wdt)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, imx7ulp_wdt);
> +
> +	imx7ulp_wdt->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(imx7ulp_wdt->base))
> +		return PTR_ERR(imx7ulp_wdt->base);
> +
> +	imx7ulp_wdt->rate = 1000;
> +	wdog = &imx7ulp_wdt->wdd;
> +	wdog->info = &imx7ulp_wdt_info;
> +	wdog->ops = &imx7ulp_wdt_ops;
> +	wdog->min_timeout = 1;
> +	wdog->max_timeout = MAX_TIMEOUT;
> +	wdog->parent = dev;
> +	wdog->timeout = DEFAULT_TIMEOUT;
> +
> +	watchdog_init_timeout(wdog, 0, dev);
> +	watchdog_stop_on_reboot(wdog);
> +	watchdog_stop_on_unregister(wdog);
> +	watchdog_set_drvdata(wdog, imx7ulp_wdt);
> +	imx7ulp_wdt_init(imx7ulp_wdt->base, wdog->timeout * imx7ulp_wdt->rate);
> +
> +	ret = devm_watchdog_register_device(dev, wdog);
> +	if (ret)
> +		dev_err(dev, "Failed to register watchdog device\n");

An error message is already displayed by the watchdog core.

> +
> +	return ret;
> +}
> +
> +static int __maybe_unused imx7ulp_wdt_suspend(struct device *dev)
> +{
> +	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&imx7ulp_wdt->wdd))
> +		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused imx7ulp_wdt_resume(struct device *dev)
> +{
> +	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
> +	u32 timeout = imx7ulp_wdt->wdd.timeout * imx7ulp_wdt->rate;
> +
> +	if (imx7ulp_wdt_is_enabled(imx7ulp_wdt->base))
> +		imx7ulp_wdt_init(imx7ulp_wdt->base, timeout);
> +
If I understand correctly, imx7ulp_wdt_is_enabled() returns true
if the watchdog is running. Since it was stopped on suspend, that
means that it was started in BIOS/rommon during resume.

With that, the above translates to "If the watchdog was started by
BIOS/rommon, re-initialize it. Otherwise do nothing". This doesn't
really make much sense to me. What if the watchdog was reprogrammed
by the BIOS/rommon, but not started ? In other words, why not call
imx7ulp_wdt_init() unconditionally ?

Also, if it is possible that the watchdog is started by BIOS/rommon,
why not keep it enabled and tell the watchdog core about it in
the probe function ?

> +	if (watchdog_active(&imx7ulp_wdt->wdd))
> +		imx7ulp_wdt_start(&imx7ulp_wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(imx7ulp_wdt_pm_ops, imx7ulp_wdt_suspend,
> +			 imx7ulp_wdt_resume);
> +
> +static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> +	{ .compatible = "fsl,imx7ulp-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
> +
> +static struct platform_driver imx7ulp_wdt_driver = {
> +	.probe		= imx7ulp_wdt_probe,
> +	.driver		= {
> +		.name	= "imx7ulp-wdt",
> +		.pm	= &imx7ulp_wdt_pm_ops,
> +		.of_match_table = imx7ulp_wdt_dt_ids,
> +	},
> +};
> +module_platform_driver(imx7ulp_wdt_driver);
> +
> +MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
> +MODULE_DESCRIPTION("Freescale i.MX7ULP watchdog driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.7.4
> 
