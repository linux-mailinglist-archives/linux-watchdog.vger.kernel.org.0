Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D40E513DE45
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 16:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgAPPHS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 10:07:18 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41656 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgAPPHS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 10:07:18 -0500
Received: by mail-pl1-f196.google.com with SMTP id t14so499864plr.8;
        Thu, 16 Jan 2020 07:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vjxcdMtJ7Oexv+w5Dwu8AKI8PT0pyBlB7MnZKY70u2g=;
        b=l4SxvugDg0fLlOIXOafZ1g4C5s2UV1MESOmBy0guCzBET0HgG/OBkvxLgb66OjpiIa
         SzS3TyXQE3eC2bqIa1MoE+zD7NPSlm6R38D+oSwG6nWSyJ7lzb46WFcCX4hnAwIpjiHp
         6iLQFPvz4qMB8DZjaKjhAV+CHsd4M4RpBmioqgI2ZB7mtWlcxa/JQfLCjtNFbfdxbA8/
         9M/1H/TcyUkH2xObNpLiwbxO3icJIP0XAb6YFCZM8cfzyk7WTGEFd06wsHZsI8TRh9T+
         hXEPfcyMfACwuVFI00wwn38TNAowkb8DcW16gP/VLAUAaRWEYmq61ZVs1yh5r3veuhUJ
         9XRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vjxcdMtJ7Oexv+w5Dwu8AKI8PT0pyBlB7MnZKY70u2g=;
        b=QUF9ZQT5A24OV1V8pG5RElEsHtjJK90irBGvrYhnHddMSMF5D7SQFvyWofguv2kNPv
         vY+o6bMpcRtx+J64zmzrElmt0R0L1fmEFbLr2GofKSARVZ9MbVDPuXwb0/60as2/VcGy
         VOAYSiTFW0g8AoMvGSrP4V3V0uUeusJT7aToDw/qpk1OL4FKKsFgiBBKdM0vsQ5sByIv
         OfTZDjdvoTAOP2H9B8afZYxuy0unTw+tTYDghTZx1E+hTSWBAxFfMgLtLYYFqHW9yKfk
         LCYysdg544pLKbS5kIQsXGG4kb4PPLmpZYa+d4RkKp1BBylzL9ExxdhsCSyJYfvTAWvj
         0UHQ==
X-Gm-Message-State: APjAAAXPXrXQRUImfexgTzKQYqJSVlB/t8e3xlbADU/I4auG0ChPSVxm
        64U32eaN/AQ6aDnb6W8L2eY=
X-Google-Smtp-Source: APXvYqzFr7XTWY65mFhGJamleS49FRXRWBoQFLo5MgZafwRm4viQsiyF+KrXj0p/XcfgFMlPWIjoQQ==
X-Received: by 2002:a17:902:6b4b:: with SMTP id g11mr37834417plt.26.1579187237843;
        Thu, 16 Jan 2020 07:07:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c68sm26272677pfc.156.2020.01.16.07.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2020 07:07:17 -0800 (PST)
Subject: Re: [PATCH 7/9] watchdog: of_xilinx_wdt: Add Versal support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
References: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
 <1579181217-31127-8-git-send-email-srinivas.neeli@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <55d1e8d6-abed-6d6a-614a-435e84e64f05@roeck-us.net>
Date:   Thu, 16 Jan 2020 07:07:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579181217-31127-8-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/16/20 5:26 AM, Srinivas Neeli wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> Versal watchdog driver uses generic watchdog mode.
> Generic watchdog contains closed and open window of equal timeout.
> Generic watchdog will generate reset signal if it is not explicitly
> refreshed in second window.
> 

WHy don't you just implement a separate driver for this watchdog ?
It seems to be completely different. I don't immediately see the
benefit of having a single driver. If there is one, please explain
in detail.

Thanks,
Guenter

> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>   drivers/watchdog/of_xilinx_wdt.c | 150 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 149 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 3b93b60f1a00..d2c389d9eaa7 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -2,7 +2,7 @@
>   /*
>    * Watchdog Device Driver for Xilinx axi/xps_timebase_wdt
>    *
> - * (C) Copyright 2013 - 2014 Xilinx, Inc.
> + * (C) Copyright 2013 - 2020 Xilinx, Inc.
>    * (C) Copyright 2011 (Alejandro Cabrera <aldaya@gmail.com>)
>    */
>   
> @@ -18,10 +18,19 @@
>   #include <linux/of_device.h>
>   #include <linux/of_address.h>
>   
> +#define XWT_WWDT_MIN_TIMEOUT		1
> +#define XWT_WWDT_MAX_TIMEOUT		80
> +
>   /* Register offsets for the Wdt device */
>   #define XWT_TWCSR0_OFFSET   0x0 /* Control/Status Register0 */
>   #define XWT_TWCSR1_OFFSET   0x4 /* Control/Status Register1 */
>   #define XWT_TBR_OFFSET      0x8 /* Timebase Register Offset */
> +#define XWT_WWREF_OFFSET	0x1000 /* Refresh Register */
> +#define XWT_WWCSR_OFFSET	0x2000 /* Control/Status Register */
> +#define XWT_WWOFF_OFFSET	0x2008 /* Offset Register */
> +#define XWT_WWCMP0_OFFSET	0x2010 /* Compare Value Register0 */
> +#define XWT_WWCMP1_OFFSET	0x2014 /* Compare Value Register1 */
> +#define XWT_WWWRST_OFFSET	0x2FD0 /* Warm Reset Register */
>   
>   /* Control/Status Register Masks  */
>   #define XWT_CSR0_WRS_MASK	BIT(3) /* Reset status */
> @@ -31,6 +40,15 @@
>   /* Control/Status Register 0/1 bits  */
>   #define XWT_CSRX_EWDT2_MASK	BIT(0) /* Enable bit 2 */
>   
> +/* Refresh Register Masks */
> +#define XWT_WWREF_GWRR_MASK	BIT(0) /* Refresh and start new period */
> +
> +/* Generic Control/Status Register Masks  */
> +#define XWT_WWCSR_GWEN_MASK	BIT(0) /* Enable Bit */
> +
> +/* Warm Reset Register Masks */
> +#define XWT_WWRST_GWWRR_MASK	BIT(0) /* Warm Reset Register */
> +
>   /* SelfTest constants */
>   #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
>   #define XWT_TIMER_FAILED            0xFFFFFFFF
> @@ -41,9 +59,11 @@
>    * enum xwdt_ip_type - WDT IP type.
>    *
>    * @XWDT_WDT: Soft wdt ip.
> + * @XWDT_WWDT: Window wdt ip.
>    */
>   enum xwdt_ip_type {
>   	XWDT_WDT = 0,
> +	XWDT_WWDT,
>   };
>   
>   struct xwdt_devtype_data {
> @@ -145,6 +165,126 @@ static const struct watchdog_ops xilinx_wdt_ops = {
>   	.ping = xilinx_wdt_keepalive,
>   };
>   
> +static int xilinx_wwdt_start(struct watchdog_device *wdd)
> +{
> +	int ret;
> +	u32 control_status_reg;
> +	u64 count;
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
> +
> +	unsigned long clock_f = clk_get_rate(xdev->clk);
> +
> +	/* Calculate timeout count */
> +	count = wdd->timeout * clock_f;
> +	ret  = clk_enable(xdev->clk);
> +	if (ret) {
> +		dev_err(wdd->parent, "Failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	spin_lock(&xdev->spinlock);
> +
> +	/*
> +	 * Timeout count is half as there are two windows
> +	 * first window overflow is ignored (interrupt),
> +	 * reset is only generated at second window overflow
> +	 */
> +	count = count >> 1;
> +
> +	/* Disable the generic watchdog timer */
> +	control_status_reg = ioread32(xdev->base + XWT_WWCSR_OFFSET);
> +	control_status_reg &= ~(XWT_WWCSR_GWEN_MASK);
> +	iowrite32(control_status_reg, xdev->base + XWT_WWCSR_OFFSET);
> +
> +	/* Set compare and offset registers for generic watchdog timeout */
> +	iowrite32((u32)count, xdev->base + XWT_WWCMP0_OFFSET);
> +	iowrite32((u32)0, xdev->base + XWT_WWCMP1_OFFSET);
> +	iowrite32((u32)count, xdev->base + XWT_WWOFF_OFFSET);
> +
> +	/* Enable the generic watchdog timer */
> +	control_status_reg = ioread32(xdev->base + XWT_WWCSR_OFFSET);
> +	control_status_reg |= (XWT_WWCSR_GWEN_MASK);
> +	iowrite32(control_status_reg, xdev->base + XWT_WWCSR_OFFSET);
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
> +	u32 control_status_reg;
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
> +
> +	spin_lock(&xdev->spinlock);
> +
> +	/* Disable the generic watchdog timer */
> +	control_status_reg = ioread32(xdev->base + XWT_WWCSR_OFFSET);
> +	control_status_reg &= ~(XWT_WWCSR_GWEN_MASK);
> +	iowrite32(control_status_reg, xdev->base + XWT_WWCSR_OFFSET);
> +
> +	spin_unlock(&xdev->spinlock);
> +
> +	clk_disable(xdev->clk);
> +
> +	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Stopped!\n");
> +
> +	return 0;
> +}
> +
> +static int xilinx_wwdt_keepalive(struct watchdog_device *wdd)
> +{
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +
> +	spin_lock(&xdev->spinlock);
> +
> +	iowrite32(XWT_WWREF_GWRR_MASK, xdev->base + XWT_WWREF_OFFSET);
> +
> +	spin_unlock(&xdev->spinlock);
> +
> +	return 0;
> +}
> +
> +static int xilinx_wwdt_set_timeout(struct watchdog_device *wdd,
> +				   unsigned int new_time)
> +{
> +	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
> +	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
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
> +
> +	return xilinx_wwdt_start(wdd);
> +}
> +
> +static const struct watchdog_info xilinx_wwdt_ident = {
> +	.options =  WDIOF_MAGICCLOSE |
> +		WDIOF_KEEPALIVEPING |
> +		WDIOF_SETTIMEOUT,
> +	.firmware_version =	1,
> +	.identity = "xlnx_wwdt watchdog",
> +};
> +
> +static const struct watchdog_ops xilinx_wwdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = xilinx_wwdt_start,
> +	.stop = xilinx_wwdt_stop,
> +	.ping = xilinx_wwdt_keepalive,
> +	.set_timeout = xilinx_wwdt_set_timeout,
> +};
> +
>   static u32 xwdt_selftest(struct xwdt_device *xdev)
>   {
>   	int i;
> @@ -181,11 +321,19 @@ static const struct xwdt_devtype_data xwdt_wdt_data = {
>   	.xwdt_ops = &xilinx_wdt_ops,
>   };
>   
> +static const struct xwdt_devtype_data xwdt_wwdt_data = {
> +	.wdttype = XWDT_WWDT,
> +	.xwdt_info = &xilinx_wwdt_ident,
> +	.xwdt_ops = &xilinx_wwdt_ops,
> +};
> +
>   static const struct of_device_id xwdt_of_match[] = {
>   	{ .compatible = "xlnx,xps-timebase-wdt-1.00.a",
>   		.data = &xwdt_wdt_data },
>   	{ .compatible = "xlnx,xps-timebase-wdt-1.01.a",
>   		.data = &xwdt_wdt_data },
> +	{ .compatible = "xlnx,versal-wwdt-1.0",
> +		.data = &xwdt_wwdt_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, xwdt_of_match);
> 

