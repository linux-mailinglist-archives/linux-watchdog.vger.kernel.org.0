Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760632C9093
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Nov 2020 23:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgK3WGX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Nov 2020 17:06:23 -0500
Received: from gproxy1-pub.mail.unifiedlayer.com ([69.89.25.95]:42797 "EHLO
        gproxy1-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730359AbgK3WGW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Nov 2020 17:06:22 -0500
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
        by gproxy1.mail.unifiedlayer.com (Postfix) with ESMTP id 7EA8FBE107AB4
        for <linux-watchdog@vger.kernel.org>; Mon, 30 Nov 2020 15:05:40 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id jrIikWY6aeMJHjrIikdPRe; Mon, 30 Nov 2020 15:05:40 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=ad5PYygt c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=QyXUC8HyAAAA:8
 a=vvbB_Vv7OeDdoZYpeNwA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JV5ixtqas0rkze2zayAqxHWmFcjBhEM3F/GNV/L3a1Q=; b=eje+mNUodM+kgX9vRNkXT/7bN5
        rS5+o2FgIrdK7+3/ZsK979Tul6n5v7+z72cvq9EvgB2lshAlPR6wQAtzuINlkAwI7C9cphRhT5rHw
        1jI31h9us5TQjVwKwF5ixB5Eh6HAoDyxf5htgm5Aspv/AZYKQ6sQHOQ7hKWkiho8SH0sXG9gjBeNS
        8Zp6i8azxrs39jIpA45M0OHsEiXI8Op0gKPizTBh9V/7SJ/MqBZ9cnvcbv5XSFxcf+4fzhBve9hL1
        sOixBzgxBSm5BL9JB3qp2rbqwpGHno1VE3sFA/liSkZMEkqFyAgLF5sA8LLi2tim28gIKN/MNjF7S
        Z9D22GHg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:56760 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kjrIh-001e2T-FL; Mon, 30 Nov 2020 22:05:39 +0000
Date:   Mon, 30 Nov 2020 14:05:38 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     vijayakannan.ayyathurai@intel.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com
Subject: Re: [PATCH v2 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Message-ID: <20201130220538.GA42581@roeck-us.net>
References: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
 <870c2fda29b290ee6b9f88b15bd1f173bfad8723.1605028524.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <870c2fda29b290ee6b9f88b15bd1f173bfad8723.1605028524.git.vijayakannan.ayyathurai@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kjrIh-001e2T-FL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:56760
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 11, 2020 at 01:53:07AM +0800, vijayakannan.ayyathurai@intel.com wrote:
> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> 
> Intel Keembay Soc requires watchdog timer support.
> Add watchdog driver to enable this.
> 
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Acked-by: Mark Gross <mgross@linux.intel.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/watchdog/Kconfig       |  13 ++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/keembay_wdt.c | 288 +++++++++++++++++++++++++++++++++
>  3 files changed, 302 insertions(+)
>  create mode 100644 drivers/watchdog/keembay_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index fd7968635e6d..f412cf2d0f1a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2163,4 +2163,17 @@ config USBPCWATCHDOG
>  
>  	  Most people will say N.
>  
> +config KEEMBAY_WATCHDOG
> +	tristate "Intel Keem Bay SoC non-secure watchdog"
> +	depends on ARCH_KEEMBAY || (ARM64 && COMPILE_TEST)
> +	select WATCHDOG_CORE
> +	help
> +	 This option enable support for an In-secure watchdog timer driver for
> +	 Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
> +	 count unit. An interrupt will be triggered, when the count crosses
> +	 the thershold configured in the register.
> +
> +	 To compile this driver as a module, choose M here: the
> +	 module will be called keembay_wdt.
> +
>  endif # WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 071a2e50be98..f6f9f434f407 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -146,6 +146,7 @@ obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
>  obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
>  obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
>  obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
> +obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
>  
>  # M68K Architecture
>  obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> new file mode 100644
> index 000000000000..1d08c7f0f16c
> --- /dev/null
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Watchdog driver for Intel Keem Bay non-secure watchdog.
> + *
> + * Copyright (C) 2020 Intel Corporation
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/watchdog.h>
> +
> +/* Non-secure watchdog register offsets */
> +#define TIM_WATCHDOG		0x0
> +#define TIM_WATCHDOG_INT_THRES	0x4
> +#define TIM_WDOG_EN		0x8
> +#define TIM_SAFE		0xc
> +
> +#define WDT_ISR_MASK		GENMASK(9, 8)
> +#define WDT_ISR_CLEAR		0x8200ff18
> +#define WDT_UNLOCK		0xf1d0dead
> +#define WDT_LOAD_MAX		U32_MAX
> +#define WDT_LOAD_MIN		1
> +#define WDT_TIMEOUT		5
> +
> +static unsigned int timeout = WDT_TIMEOUT;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout period in seconds (default = "
> +		 __MODULE_STRING(WDT_TIMEOUT) ")");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default = "
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct keembay_wdt {
> +	struct watchdog_device	wdd;
> +	struct clk		*clk;
> +	unsigned int		rate;
> +	int			to_irq;
> +	int			th_irq;
> +	void __iomem		*base;
> +};
> +
> +static inline u32 keembay_wdt_readl(struct keembay_wdt *wdt, u32 offset)
> +{
> +	return readl(wdt->base + offset);
> +}
> +
> +static inline void keembay_wdt_writel(struct keembay_wdt *wdt,
> +				      u32 offset, u32 val)
> +{
> +	writel(WDT_UNLOCK, wdt->base + TIM_SAFE);
> +	writel(val, wdt->base + offset);
> +}
> +
> +static void keembay_wdt_set_timeout_reg(struct watchdog_device *wdog, bool ping)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +	u32 th_val = 0;
> +
> +	if (ping)
> +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt->rate);
> +
> +	if (!ping && wdog->pretimeout) {
> +		th_val = wdog->timeout - wdog->pretimeout;
> +		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val * wdt->rate);
> +	}
> +
> +	if (!ping)
> +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt->rate);

I am a bit at loss here. This seems unnecessarily complex. Why not just the following ?

	if (!ping && wdog->pretimeout) {
		th_val = wdog->timeout - wdog->pretimeout;
		keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val * wdt->rate);
	}
	keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt->rate);

Thanks,
Guenter
