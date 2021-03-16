Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF90033CB72
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Mar 2021 03:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbhCPCbw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 22:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbhCPCb2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 22:31:28 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BFAC06174A;
        Mon, 15 Mar 2021 19:31:27 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id m1so7811722ote.10;
        Mon, 15 Mar 2021 19:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n/Zextne6edFytFaT3gsOOLtDXQZQSvNtRVlVqp7tgg=;
        b=TfQ8umGFC4PowJbcPEXn0/wGVPSSUChPmx2ayfYMRarKkZOXgAXK/TWeosIxseWjsh
         9U/snoODrPCPs/AHSa3sYt4l8l5DuKScA0Bv+WnmivAwfCEeeIWH3oXQE36W5cuIKpzu
         Th0XgiZ/8t4/CmFI8W/W4mslt64GqLUE4KHUevTwGMc02/zhEQmKxhIPOjiylH5eDPBn
         v42ZChFZ1ZnlKnahkQTn4ekgD8J31Z8EHQ9aa17aWuOf1+pYMsca73wVQ73iRmmhNHWG
         Aph0Jukpeb8XEASFG4X9kfDoLMOABEfWZjz57/s6sukRIzF8AqtXdHO6zQVlPnYvJP1H
         rPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=n/Zextne6edFytFaT3gsOOLtDXQZQSvNtRVlVqp7tgg=;
        b=BbmG+lIVw7B0A8K0+bBonPC0NDaL1LUTSy+CV7gyMXw2ZemPibERa2oKc/xL9NALEQ
         5ws9qcbHv4fcb+5xObZgQTiPqQ5b/ajV8K2JghBtVa/ZaiA5Mq9yjK+DaRrXnd8nvaCl
         M2EXbWDMww655rvtO5gt4q+xrHxe4F2H8zXicVJs2qZgmhoCQS+GVkDIkbqaQC5QE83v
         VUCMUJlr16Ig8yOo0p3sFTdwkF93wDeRJ9/PDCuswjW/TPHt7OpNYXDKvwdHe+b9KYTP
         v/f/9wBQRtNdol3UhNRzfVwXFFfQuC0t+XPBH6qpv/dnQgo3D/YE4q8GLuQ/gzah6mWC
         vdLQ==
X-Gm-Message-State: AOAM5324YZAfa3iwXX10TaICoaESECquJ3YnA+uegm0+7rI+ojF5vrXy
        OuCiFoYzx1Bzv1gZpkTp/chqzOmBEg0=
X-Google-Smtp-Source: ABdhPJzOCxhER2uJ3Ac0FZkNT67xzNwgEPJsKHlWmI5gkd5nWInolD7oKpM+ga5m7GXWsJRILFHF8w==
X-Received: by 2002:a05:6830:225b:: with SMTP id t27mr1573770otd.73.1615861887265;
        Mon, 15 Mar 2021 19:31:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 106sm7188136oth.81.2021.03.15.19.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 19:31:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 7/9] watchdog: of_xilinx_wdt: Add Versal Window watchdog
 support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
 <1615805214-24857-8-git-send-email-srinivas.neeli@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ad8435c4-d344-fd0b-2c98-3bdd974f5175@roeck-us.net>
Date:   Mon, 15 Mar 2021 19:31:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615805214-24857-8-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/15/21 3:46 AM, Srinivas Neeli wrote:
> Versal watchdog driver uses Window watchdog mode. Window watchdog
> timer(WWDT) contains closed(first) and open(second) window with
> 32 bit width. WWDT will generate an interrupt after the first window
> timeout and reset signal after the second window timeout. Timeout
> and Pre-timeout configuration, Stop and Refresh trigger only
> in open window.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

I think this should be a separate watchdog driver. There is pretty much no overlap
with the existing driver.

Guenter

> ---
>  drivers/watchdog/of_xilinx_wdt.c | 285 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 283 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 3b93b60f1a00..3656e716b4f7 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -2,10 +2,11 @@
>  /*
>   * Watchdog Device Driver for Xilinx axi/xps_timebase_wdt
>   *
> - * (C) Copyright 2013 - 2014 Xilinx, Inc.
> + * (C) Copyright 2013 - 2021 Xilinx, Inc.
>   * (C) Copyright 2011 (Alejandro Cabrera <aldaya@gmail.com>)
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
> @@ -17,6 +18,11 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_address.h>
> +#include <linux/interrupt.h>
> +
> +#define XWT_WWDT_DEFAULT_TIMEOUT	10
> +#define XWT_WWDT_MIN_TIMEOUT		1
> +#define XWT_WWDT_MAX_TIMEOUT		42
>  
>  /* Register offsets for the Wdt device */
>  #define XWT_TWCSR0_OFFSET   0x0 /* Control/Status Register0 */
> @@ -35,15 +41,44 @@
>  #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
>  #define XWT_TIMER_FAILED            0xFFFFFFFF
>  
> +/* Register offsets for the WWdt device */
> +#define XWT_WWDT_MWR_OFFSET	0x00
> +#define XWT_WWDT_ESR_OFFSET	0x04
> +#define XWT_WWDT_FCR_OFFSET	0x08
> +#define XWT_WWDT_FWR_OFFSET	0x0c
> +#define XWT_WWDT_SWR_OFFSET	0x10
> +
> +/* Master Write Control Register Masks */
> +#define XWT_WWDT_MWR_MASK	BIT(0)
> +
> +/* Enable and Status Register Masks */
> +#define XWT_WWDT_ESR_WINT_MASK	BIT(16)
> +#define XWT_WWDT_ESR_WSW_MASK	BIT(8)
> +#define XWT_WWDT_ESR_WEN_MASK	BIT(0)
> +
> +/* Function control Register Masks */
> +#define XWT_WWDT_SBC_MASK	0xFF00
> +#define XWT_WWDT_SBC_SHIFT	16
> +#define XWT_WWDT_BSS_MASK	0xC0
> +
>  #define WATCHDOG_NAME     "Xilinx Watchdog"
>  
> +static int wdt_timeout;
> +
> +module_param(wdt_timeout, int, 0644);
> +MODULE_PARM_DESC(wdt_timeout,
> +		 "Watchdog time in seconds. (default="
> +		 __MODULE_STRING(XWT_WWDT_DEFAULT_TIMEOUT) ")");
> +
>  /**
>   * enum xwdt_ip_type - WDT IP type.
>   *
>   * @XWDT_WDT: Soft wdt ip.
> + * @XWDT_WWDT: Window wdt ip.
>   */
>  enum xwdt_ip_type {
>  	XWDT_WDT = 0,
> +	XWDT_WWDT = 1,
>  };
>  
>  struct xwdt_devtype_data {
> @@ -58,6 +93,7 @@ struct xwdt_device {
>  	spinlock_t spinlock; /* spinlock for register handling */
>  	struct watchdog_device xilinx_wdt_wdd;
>  	struct clk		*clk;
> +	int irq;
>  };
>  
>  static int xilinx_wdt_start(struct watchdog_device *wdd)
> @@ -145,6 +181,220 @@ static const struct watchdog_ops xilinx_wdt_ops = {
>  	.ping = xilinx_wdt_keepalive,
>  };
>  
> +static int is_wwdt_in_closed_window(struct watchdog_device *wdd)
> +{
> +	u32 control_status_reg;
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +
> +	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
> +	if (control_status_reg & XWT_WWDT_ESR_WEN_MASK)
> +		if (!(control_status_reg & XWT_WWDT_ESR_WSW_MASK))
> +			return 0;
> +
> +	return 1;
> +}
> +
> +static int xilinx_wwdt_start(struct watchdog_device *wdd)
> +{
> +	int ret;
> +	u32 control_status_reg, fcr;
> +	u64 time_out, pre_timeout, count;
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
> +
> +	count = clk_get_rate(xdev->clk);
> +	if (!count)
> +		return -EINVAL;
> +
> +	/* Calculate timeout count */
> +	pre_timeout = count * wdd->pretimeout;
> +	time_out = count * wdd->timeout;
> +	if (!watchdog_active(xilinx_wdt_wdd)) {
> +		ret  = clk_enable(xdev->clk);
> +		if (ret) {
> +			dev_err(wdd->parent, "Failed to enable clock\n");
> +			return ret;
> +		}
> +	}
> +
> +	spin_lock(&xdev->spinlock);
> +	iowrite32(XWT_WWDT_MWR_MASK, xdev->base + XWT_WWDT_MWR_OFFSET);
> +	iowrite32(~(u32)XWT_WWDT_ESR_WEN_MASK,
> +		  xdev->base + XWT_WWDT_ESR_OFFSET);
> +
> +	if (pre_timeout) {
> +		iowrite32((u32)(time_out - pre_timeout),
> +			  xdev->base + XWT_WWDT_FWR_OFFSET);
> +		iowrite32((u32)pre_timeout, xdev->base + XWT_WWDT_SWR_OFFSET);
> +		fcr = ioread32(xdev->base + XWT_WWDT_SWR_OFFSET);
> +		fcr = (fcr >> XWT_WWDT_SBC_SHIFT) & XWT_WWDT_SBC_MASK;
> +		fcr = fcr | XWT_WWDT_BSS_MASK;
> +		iowrite32(fcr, xdev->base + XWT_WWDT_FCR_OFFSET);
> +	} else {
> +		iowrite32((u32)pre_timeout,
> +			  xdev->base + XWT_WWDT_FWR_OFFSET);
> +		iowrite32((u32)time_out, xdev->base + XWT_WWDT_SWR_OFFSET);
> +		iowrite32(0x0, xdev->base + XWT_WWDT_FCR_OFFSET);
> +	}
> +
> +	/* Enable the window watchdog timer */
> +	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
> +	control_status_reg |= XWT_WWDT_ESR_WEN_MASK;
> +	iowrite32(control_status_reg, xdev->base + XWT_WWDT_ESR_OFFSET);
> +
> +	spin_unlock(&xdev->spinlock);
> +
> +	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Started!\n");
> +
> +	return 0;
> +}
> +
> +static int xilinx_wwdt_stop(struct watchdog_device *wdd)
> +{
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
> +
> +	if (!is_wwdt_in_closed_window(wdd)) {
> +		dev_warn(xilinx_wdt_wdd->parent, "timer in closed window");
> +		return -EINVAL;
> +	}
> +
> +	spin_lock(&xdev->spinlock);
> +
> +	iowrite32(XWT_WWDT_MWR_MASK, xdev->base + XWT_WWDT_MWR_OFFSET);
> +	/* Disable the Window watchdog timer */
> +	iowrite32(~(u32)XWT_WWDT_ESR_WEN_MASK,
> +		  xdev->base + XWT_WWDT_ESR_OFFSET);
> +
> +	spin_unlock(&xdev->spinlock);
> +
> +	if (watchdog_active(xilinx_wdt_wdd))
> +		clk_disable(xdev->clk);
> +
> +	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Stopped!\n");
> +
> +	return 0;
> +}
> +
> +static int xilinx_wwdt_keepalive(struct watchdog_device *wdd)
> +{
> +	u32 control_status_reg;
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +
> +	/* Refresh in open window is ignored */
> +	if (!is_wwdt_in_closed_window(wdd))
> +		return 0;
> +
> +	spin_lock(&xdev->spinlock);
> +
> +	iowrite32(XWT_WWDT_MWR_MASK, xdev->base + XWT_WWDT_MWR_OFFSET);
> +	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
> +	control_status_reg |= XWT_WWDT_ESR_WINT_MASK;
> +	control_status_reg &= ~XWT_WWDT_ESR_WSW_MASK;
> +	iowrite32(control_status_reg, xdev->base + XWT_WWDT_ESR_OFFSET);
> +	control_status_reg = ioread32(xdev->base + XWT_WWDT_ESR_OFFSET);
> +	control_status_reg |= XWT_WWDT_ESR_WSW_MASK;
> +	iowrite32(control_status_reg, xdev->base + XWT_WWDT_ESR_OFFSET);
> +
> +	spin_unlock(&xdev->spinlock);
> +
> +	return 0;
> +}
> +
> +static int xilinx_wwdt_set_timeout(struct watchdog_device *wdd,
> +				   unsigned int new_time)
> +{
> +	u32 ret = 0;
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
> +
> +	if (!is_wwdt_in_closed_window(wdd)) {
> +		dev_warn(xilinx_wdt_wdd->parent, "timer in closed window");
> +		return -EINVAL;
> +	}
> +
> +	if (new_time < XWT_WWDT_MIN_TIMEOUT ||
> +	    new_time > XWT_WWDT_MAX_TIMEOUT) {
> +		dev_warn(xilinx_wdt_wdd->parent,
> +			 "timeout value must be %d<=x<=%d, using %d\n",
> +				XWT_WWDT_MIN_TIMEOUT,
> +				XWT_WWDT_MAX_TIMEOUT, new_time);
> +		return -EINVAL;
> +	}
> +
> +	wdd->timeout = new_time;
> +	wdd->pretimeout = 0;
> +
> +	if (watchdog_active(xilinx_wdt_wdd)) {
> +		ret = xilinx_wwdt_start(wdd);
> +		if (ret)
> +			dev_dbg(xilinx_wdt_wdd->parent, "timer start failed");
> +	}
> +
> +	return 0;
> +}
> +
> +static int xilinx_wwdt_set_pretimeout(struct watchdog_device *wdd,
> +				      u32 new_pretimeout)
> +{
> +	u32 ret = 0;
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
> +
> +	if (!is_wwdt_in_closed_window(wdd)) {
> +		dev_warn(xilinx_wdt_wdd->parent, "timer in closed window");
> +		return -EINVAL;
> +	}
> +
> +	if (new_pretimeout < wdd->min_timeout ||
> +	    new_pretimeout >= wdd->timeout)
> +		return -EINVAL;
> +
> +	wdd->pretimeout = new_pretimeout;
> +
> +	if (watchdog_active(xilinx_wdt_wdd)) {
> +		ret = xilinx_wwdt_start(wdd);
> +		if (ret)
> +			dev_dbg(xilinx_wdt_wdd->parent, "timer start failed");
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t xilinx_wwdt_isr(int irq, void *wdog_arg)
> +{
> +	struct xwdt_device *xdev = wdog_arg;
> +
> +	watchdog_notify_pretimeout(&xdev->xilinx_wdt_wdd);
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct watchdog_info xilinx_wwdt_ident = {
> +	.options =  WDIOF_MAGICCLOSE |
> +		WDIOF_KEEPALIVEPING |
> +		WDIOF_SETTIMEOUT,
> +	.firmware_version = 1,
> +	.identity = "xlnx_wwdt watchdog",
> +};
> +
> +static const struct watchdog_info xilinx_wwdt_pretimeout_ident = {
> +	.options = WDIOF_MAGICCLOSE |
> +		   WDIOF_KEEPALIVEPING |
> +		   WDIOF_PRETIMEOUT |
> +		   WDIOF_SETTIMEOUT,
> +	.firmware_version = 1,
> +	.identity = "xlnx_wwdt watchdog",
> +};
> +
> +static const struct watchdog_ops xilinx_wwdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = xilinx_wwdt_start,
> +	.stop = xilinx_wwdt_stop,
> +	.ping = xilinx_wwdt_keepalive,
> +	.set_timeout = xilinx_wwdt_set_timeout,
> +	.set_pretimeout = xilinx_wwdt_set_pretimeout,
> +};
> +
>  static u32 xwdt_selftest(struct xwdt_device *xdev)
>  {
>  	int i;
> @@ -181,11 +431,19 @@ static const struct xwdt_devtype_data xwdt_wdt_data = {
>  	.xwdt_ops = &xilinx_wdt_ops,
>  };
>  
> +static const struct xwdt_devtype_data xwdt_wwdt_data = {
> +	.wdttype = XWDT_WWDT,
> +	.xwdt_info = &xilinx_wwdt_ident,
> +	.xwdt_ops = &xilinx_wwdt_ops,
> +};
> +
>  static const struct of_device_id xwdt_of_match[] = {
>  	{ .compatible = "xlnx,xps-timebase-wdt-1.00.a",
>  		.data = &xwdt_wdt_data },
>  	{ .compatible = "xlnx,xps-timebase-wdt-1.01.a",
>  		.data = &xwdt_wdt_data },
> +	{ .compatible = "xlnx,versal-wwdt-1.0",
> +		.data = &xwdt_wwdt_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, xwdt_of_match);
> @@ -194,7 +452,7 @@ static int xwdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	int rc;
> -	u32 pfreq = 0, enable_once = 0;
> +	u32 pfreq = 0, enable_once = 0, pre_timeout = 0;
>  	struct xwdt_device *xdev;
>  	struct watchdog_device *xilinx_wdt_wdd;
>  	const struct of_device_id *of_id;
> @@ -236,6 +494,12 @@ static int xwdt_probe(struct platform_device *pdev)
>  				 "Parameter \"xlnx,wdt-enable-once\" not found\n");
>  
>  		watchdog_set_nowayout(xilinx_wdt_wdd, enable_once);
> +	} else {
> +		rc = of_property_read_u32(dev->of_node, "pretimeout-sec",
> +					  &pre_timeout);
> +		if (rc)
> +			dev_dbg(dev,
> +				"Parameter \"pretimeout-sec\" not found\n");
>  	}
>  
>  	xdev->clk = devm_clk_get(dev, NULL);
> @@ -268,6 +532,23 @@ static int xwdt_probe(struct platform_device *pdev)
>  			xilinx_wdt_wdd->timeout =
>  				2 * ((1 << xdev->wdt_interval) /
>  					pfreq);
> +	} else {
> +		xilinx_wdt_wdd->pretimeout = pre_timeout;
> +		xilinx_wdt_wdd->timeout = XWT_WWDT_DEFAULT_TIMEOUT;
> +		xilinx_wdt_wdd->min_timeout = XWT_WWDT_MIN_TIMEOUT;
> +		xilinx_wdt_wdd->max_timeout = XWT_WWDT_MAX_TIMEOUT;
> +		xdev->irq = platform_get_irq_byname(pdev, "wdt");
> +		if (xdev->irq > 0) {
> +			if (!devm_request_irq(dev, xdev->irq, xilinx_wwdt_isr,
> +					      0, dev_name(dev), xdev)) {
> +				xilinx_wdt_wdd->info =
> +				&xilinx_wwdt_pretimeout_ident;
> +			}
> +		}
> +		rc = watchdog_init_timeout(xilinx_wdt_wdd,
> +					   wdt_timeout, &pdev->dev);
> +		if (rc)
> +			dev_warn(&pdev->dev, "unable to set timeout value\n");
>  	}
>  
>  	spin_lock_init(&xdev->spinlock);
> 

