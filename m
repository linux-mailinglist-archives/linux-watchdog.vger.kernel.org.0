Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C7E1F1A31
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jun 2020 15:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgFHNgl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jun 2020 09:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbgFHNgk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jun 2020 09:36:40 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85980C08C5C2;
        Mon,  8 Jun 2020 06:36:40 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id q16so6679798plr.2;
        Mon, 08 Jun 2020 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=okF90dV/PG5tn0kBqLELmDCMFZfbcpJZn2UWuUwKM3w=;
        b=Vjw2UBE59hJ8e4dln1Lc3eMaT77xPtk8z0krB7lytuPlRO1qWGpb7Qp/djFNkOlhLX
         P2WD5C38qEyKYyf1OFvX4TuxUaNPBlsG8Vgwg6JKwm635vIMaZ+Iuq8ZI2OWKf4ZKX8y
         7SCE9OpJ2bdMHGRe324/Q/r2eUdYJTzIpeon1iGdmIhSzQsaK583ms679zXNiMkcMk2o
         jwNuasD4WSTaz/uxpgZYM9WlAs2eYAn+vcL1QfkcblOAe2bFFpVKsp046THExzEIef4r
         fDBDxxO/bwLw9TS3TqjJiLW62b91lFxtpCrEksCkqPCe+NS2zuFk53ApeVKnY13T38KA
         UYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=okF90dV/PG5tn0kBqLELmDCMFZfbcpJZn2UWuUwKM3w=;
        b=R/+el4pEbI9/1IxRUHk5Ly4/2vr07ETzqRkQqk9sxcoYGs7nZgLxHG2+UeZBRLqx9s
         9BivQz7txYGFFrnojXDMcWnbUJx2xMoHoqY5j2+2sss19vog58VCap23SU1bmi6yktkx
         SUDei1lNBvLZMyg1ardW/dNV0pouR/jjcLPydy19YaeR4ymyWWD9qFSLxp8ILBkuo+Yk
         JrweiscMIzriTudzotu4vFH0kLIsc4FZdjb2yQoa6Q0BlnvfggeenBrS0+mXdVcPv/I0
         9lJspXbcpk69NqSLr9KWRLW5kAH8/p2vhoQtpCptWjAXR+OJ/6X8fYCd7EOlJbIAY3j+
         ibgw==
X-Gm-Message-State: AOAM530CJ+bHX7IlRkUFhiC5T/W3c4Z+s4cJYxEDOOvWXvzYIvEkn3jy
        pnND7kkkDd2evE/Ebvj/dzcSiImk
X-Google-Smtp-Source: ABdhPJxgwr21ueZLby4LzKPudmn1Wz4P8vSPPq5GP5wFO9/I/p6Vch3/YwH1qlOhlrpUbRB/Xe5jIQ==
X-Received: by 2002:a17:902:7247:: with SMTP id c7mr3980083pll.103.1591623400004;
        Mon, 08 Jun 2020 06:36:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cm13sm15480086pjb.5.2020.06.08.06.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 06:36:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: intel: Watchdog timer support on Lightning
 Mountain
To:     Dilip Kota <eswara.kota@linux.intel.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com, yixin.zhu@intel.com
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
 <220609c6aec3dbd06585897ddcfdde277c823cac.1591584255.git.eswara.kota@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <61d256e7-88ca-ac89-9c80-132c0d2de4a8@roeck-us.net>
Date:   Mon, 8 Jun 2020 06:36:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <220609c6aec3dbd06585897ddcfdde277c823cac.1591584255.git.eswara.kota@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/7/20 10:49 PM, Dilip Kota wrote:
> On Intel Lightning Mountain SoC, General Purpose Timer Counter(GPTC)
> programmable as clocksource, real time clock or watchdog timer.
> 
> This driver configures GPTC as Watchdog timer and triggers reset signal
> to CPU on timeout.
> 
> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
> ---
>  drivers/watchdog/Kconfig              |  13 ++
>  drivers/watchdog/Makefile             |   1 +
>  drivers/watchdog/intel_lgm_gptc_wdt.c | 420 ++++++++++++++++++++++++++++++++++
>  3 files changed, 434 insertions(+)
>  create mode 100644 drivers/watchdog/intel_lgm_gptc_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0663c604bd642..8009c11e75dda 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1789,6 +1789,19 @@ config IMGPDC_WDT
>  	  To compile this driver as a loadable module, choose M here.
>  	  The module will be called imgpdc_wdt.
>  
> +config INTEL_LGM_GPTC_WDT
> +	tristate "INTEL LGM SoC Watchdog"
> +	depends on X86 || COMPILE_TEST
> +	depends on OF && HAS_IOMEM
> +	select REGMAP
> +	select MFD_SYSCON
> +	select WATCHDOG_CORE
> +	help
> +	  Driver for Watchdog Timer on Intel Lightning Mountain SoC.
> +
> +	  To compile this driver as a loadable module, choose M here.
> +	  The module will be called intel_lgm_gptc_wdt.
> +
>  config LANTIQ_WDT
>  	tristate "Lantiq SoC watchdog"
>  	depends on LANTIQ
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 6de2e4ceef190..92c99e4c46eb7 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -166,6 +166,7 @@ obj-$(CONFIG_TXX9_WDT) += txx9wdt.o
>  obj-$(CONFIG_OCTEON_WDT) += octeon-wdt.o
>  octeon-wdt-y := octeon-wdt-main.o octeon-wdt-nmi.o
>  obj-$(CONFIG_LANTIQ_WDT) += lantiq_wdt.o
> +obj-$(CONFIG_INTEL_LGM_GPTC_WDT) += intel_lgm_gptc_wdt.o
>  obj-$(CONFIG_LOONGSON1_WDT) += loongson1_wdt.o
>  obj-$(CONFIG_RALINK_WDT) += rt2880_wdt.o
>  obj-$(CONFIG_IMGPDC_WDT) += imgpdc_wdt.o
> diff --git a/drivers/watchdog/intel_lgm_gptc_wdt.c b/drivers/watchdog/intel_lgm_gptc_wdt.c
> new file mode 100644
> index 0000000000000..52be7cc194f8f
> --- /dev/null
> +++ b/drivers/watchdog/intel_lgm_gptc_wdt.c
> @@ -0,0 +1,420 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Intel Corporation.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/cpu.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/watchdog.h>
> +
> +#define GPTC_CLC		0x00
> +#define GPTC_CLC_SUSPEND	BIT(4)
> +#define GPTC_CLC_RMC		GENMASK(15, 8)
> +
> +/* divider 10 to produce 200 / 10 = 20 MHz clock */
> +#define CLC_RMC_DIV		10
> +
> +#define GPTC_CON(X)		(0x10 + (X) * 0x20)
> +#define GPTC_CON_CNT_UP		BIT(1)
> +#define GPTC_CON_ONESHOT	BIT(3)
> +#define GPTC_CON_EXT		BIT(4)
> +
> +#define GPTC_RUN(X)		(0x18 + (X) * 0x20)
> +#define GPTC_RUN_EN		BIT(0)
> +#define GPTC_RUN_STOP		BIT(1)
> +#define GPTC_RUN_RELOAD		BIT(2)
> +
> +#define GPTC_RLD(X)		(0x20 + (X) * 0x20)
> +#define GPTC_CNT(X)		(0x28 + (X) * 0x20)
> +
> +#define GPTC_IRNENCLR		0xF0
> +#define GPTC_IRNEN		0xF4
> +#define GPTC_IRNCR		0xFC
> +
> +/* Watchdog Timeout Reset register offset and bitfeilds */
> +#define BIA_WDT_RST_EN		0x1E0
> +#define BIA_WDT			BIT(6)
> +
> +#define MAX_TIMERID		2
> +#define MAX_CPUID		3
> +#define TIMER_MARGIN_SEC	300
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started\n"
> +	" (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct lgm_gptc_timer {
> +	struct lgm_gptc_wdt	*wdt_node;
> +	struct watchdog_device	wdd;
> +	unsigned int		tid;
> +	unsigned int		cpuid;
> +	unsigned int		frequency;
> +	unsigned int		cycles;
> +	bool			enable;
> +};
> +
> +struct lgm_gptc_wdt {
> +	struct device		*dev;
> +	void __iomem		*gptc_base;
> +	struct regmap		*rst_hndl;
> +	struct clk		*freqclk;
> +	struct clk		*gateclk;
> +	unsigned int		fpifreq;
> +	enum cpuhp_state	state;
> +};
> +
> +DEFINE_PER_CPU(struct lgm_gptc_timer, lgm_timer_per_cpu);
> +

This is unusual. You'll have to provide a very detailed explanation
why this is needed.

Guenter

> +static void lgm_gptc_wdt_cfg_timer(struct lgm_gptc_timer *timer)
> +{
> +	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
> +	void __iomem *base = wdt_node->gptc_base;
> +	u32 val;
> +
> +	val = readl(base + GPTC_CON(timer->tid));
> +	val &= ~GPTC_CON_CNT_UP;
> +	val |= GPTC_CON_EXT;
> +	val &= ~GPTC_CON_ONESHOT;
> +	writel(val, base + GPTC_CON(timer->tid));
> +	writel(U32_MAX, base + GPTC_RLD(timer->tid));
> +	writel(BIT(timer->tid * 2), base + GPTC_IRNEN);
> +}
> +
> +static void lgm_gptc_wdt_init(struct lgm_gptc_wdt *wdt_node)
> +{
> +	void __iomem *base = wdt_node->gptc_base;
> +
> +	writel(GPTC_CLC_SUSPEND | FIELD_PREP(GPTC_CLC_RMC, CLC_RMC_DIV),
> +	       base + GPTC_CLC);
> +	writel(0xFF, base + GPTC_IRNENCLR);
> +	writel(0xFF, base + GPTC_IRNCR);
> +}
> +
> +static void lgm_gptc_wdt_timer_stop(struct lgm_gptc_timer *timer)
> +{
> +	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
> +
> +	writel(GPTC_RUN_STOP, wdt_node->gptc_base + GPTC_RUN(timer->tid));
> +	regmap_write(wdt_node->rst_hndl, BIA_WDT_RST_EN, 0x00);
> +}
> +
> +static void lgm_gptc_wdt_timer_set_timeout(struct lgm_gptc_timer *timer,
> +					   u32 timeout)
> +{
> +	unsigned long cycles;
> +	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
> +
> +	cycles = timeout * timer->frequency / CLC_RMC_DIV;
> +	if (cycles > U32_MAX)
> +		cycles = U32_MAX;
> +
> +	timer->cycles = cycles;
> +	writel(cycles, wdt_node->gptc_base + GPTC_RLD(timer->tid));
> +}
> +
> +static int lgm_gptc_wdt_start(struct watchdog_device *wdt_dev)
> +{
> +	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
> +	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
> +	void __iomem *base = wdt_node->gptc_base;
> +	u32 val;
> +
> +	val = readl(base + GPTC_CON(timer->tid));
> +	val &= ~GPTC_CON_ONESHOT;
> +	writel(val, base + GPTC_CON(timer->tid));
> +
> +	writel(timer->cycles, base + GPTC_RLD(timer->tid));
> +	writel(GPTC_RUN_EN | GPTC_RUN_RELOAD, base + GPTC_RUN(timer->tid));
> +	writel(BIT(timer->tid * 2), base + GPTC_IRNEN);
> +
> +	/* Enable WDT reset */
> +	regmap_read(wdt_node->rst_hndl, BIA_WDT_RST_EN, &val);
> +	val |= BIT(timer->cpuid) | BIA_WDT;
> +	regmap_write(wdt_node->rst_hndl, BIA_WDT_RST_EN, val);
> +
> +	return 0;
> +}
> +
> +static int lgm_gptc_wdt_stop(struct watchdog_device *wdt_dev)
> +{
> +	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
> +
> +	lgm_gptc_wdt_timer_stop(timer);
> +
> +	return 0;
> +}
> +
> +static int lgm_gptc_wdt_set_timeout(struct watchdog_device *wdt_dev,
> +				    unsigned int new_timeout)
> +{
> +	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
> +
> +	wdt_dev->timeout = new_timeout;
> +	lgm_gptc_wdt_timer_set_timeout(timer, new_timeout);
> +
> +	return 0;
> +}
> +
> +static uint32_t lgm_gptc_wdt_get_timeleft(struct watchdog_device *wdt_dev)
> +{
> +	struct lgm_gptc_timer *timer = watchdog_get_drvdata(wdt_dev);
> +	struct lgm_gptc_wdt *wdt_node = timer->wdt_node;
> +	u32 cycles, interval;
> +
> +	cycles = readl(wdt_node->gptc_base + GPTC_CNT(timer->tid));
> +	interval = cycles / timer->frequency / CLC_RMC_DIV;
> +	dev_dbg(wdt_node->dev, "timeleft=%u cycles=%u\n", interval, cycles);
> +
> +	return interval;
> +}
> +
> +static int lgm_gptc_wdt_ping(struct watchdog_device *wdt_dev)
> +{
> +	return lgm_gptc_wdt_start(wdt_dev);
> +}
> +
> +static const struct watchdog_info lgm_gptc_wdt_info = {
> +	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +	.identity	= "Hardware Watchdog for Intel LGM",
> +};
> +
> +static const struct watchdog_ops lgm_gptc_wdt_ops = {
> +	.start		= lgm_gptc_wdt_start,
> +	.stop		= lgm_gptc_wdt_stop,
> +	.ping		= lgm_gptc_wdt_ping,
> +	.set_timeout	= lgm_gptc_wdt_set_timeout,
> +	.get_timeleft	= lgm_gptc_wdt_get_timeleft,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int lgm_gptc_wdt_reg_wdd(struct lgm_gptc_timer *timer)
> +{
> +	struct lgm_gptc_wdt *wdt_node  = timer->wdt_node;
> +	struct watchdog_device *wdd;
> +	int ret;
> +
> +	wdd = &timer->wdd;
> +	wdd->id = timer->cpuid;
> +	wdd->info = &lgm_gptc_wdt_info;
> +	wdd->ops = &lgm_gptc_wdt_ops;
> +	wdd->min_timeout = 1;
> +	wdd->max_timeout = U32_MAX;
> +	wdd->max_hw_heartbeat_ms = wdd->max_timeout * 1000;
> +	wdd->min_hw_heartbeat_ms = wdd->min_timeout * 1000;
> +	wdd->timeout = TIMER_MARGIN_SEC;
> +	watchdog_init_timeout(wdd, 0, wdt_node->dev);
> +	lgm_gptc_wdt_timer_set_timeout(timer, wdd->timeout);
> +	watchdog_set_drvdata(wdd, timer);
> +	watchdog_set_nowayout(wdd, nowayout);
> +	ret = watchdog_register_device(wdd);
> +	if (ret) {
> +		dev_err(wdt_node->dev,
> +			"Watchdog timer register fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lgm_gptc_wdt_reg_cpu(unsigned int cpu)
> +{
> +	struct lgm_gptc_timer *timer = per_cpu_ptr(&lgm_timer_per_cpu, cpu);
> +
> +	if (!timer->enable)
> +		return 0;
> +
> +	lgm_gptc_wdt_cfg_timer(timer);
> +	lgm_gptc_wdt_reg_wdd(timer);
> +
> +	return 0;
> +}
> +
> +static int lgm_gptc_wdt_unreg_cpu(unsigned int cpu)
> +{
> +	struct lgm_gptc_timer *timer = per_cpu_ptr(&lgm_timer_per_cpu, cpu);
> +
> +	if (!timer->enable)
> +		return 0;
> +
> +	lgm_gptc_wdt_timer_stop(timer);
> +	watchdog_unregister_device(&timer->wdd);
> +
> +	return 0;
> +}
> +
> +static int lgm_gptc_wdt_clk_enable(struct lgm_gptc_wdt *wdt_node)
> +{
> +	int ret;
> +
> +	wdt_node->gateclk = devm_clk_get(wdt_node->dev, "gptc");
> +	if (IS_ERR(wdt_node->gateclk)) {
> +		ret = PTR_ERR(wdt_node->gateclk);
> +		if (ret != -EPROBE_DEFER) {
> +			dev_err(wdt_node->dev,
> +				"Failed to get gptc clk: %d\n", ret);
> +		}
> +
> +		return ret;
> +	}
> +
> +	wdt_node->freqclk = devm_clk_get(wdt_node->dev, "freq");
> +	if (IS_ERR(wdt_node->freqclk)) {
> +		ret = PTR_ERR(wdt_node->freqclk);
> +		if (ret != -EPROBE_DEFER) {
> +			dev_err(wdt_node->dev,
> +				"Failed to get freq clk: %d\n", ret);
> +		}
> +
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(wdt_node->gateclk);
> +	if (ret) {
> +		dev_err(wdt_node->dev, "Gate clk enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(wdt_node->freqclk);
> +	if (ret) {
> +		dev_err(wdt_node->dev, "fpi clk enable failed: %d\n", ret);
> +		clk_disable_unprepare(wdt_node->gateclk);
> +		return ret;
> +	}
> +
> +	wdt_node->fpifreq = clk_get_rate(wdt_node->freqclk);
> +
> +	return 0;
> +}
> +
> +static void lgm_gptc_wdt_clk_disable(struct lgm_gptc_wdt *wdt_node)
> +{
> +	clk_disable_unprepare(wdt_node->gateclk);
> +	clk_disable_unprepare(wdt_node->freqclk);
> +}
> +
> +static int lgm_gptc_wdt_of_parse_timer(struct lgm_gptc_wdt *wdt_node)
> +{
> +	struct device_node *np = wdt_node->dev->of_node;
> +	struct lgm_gptc_timer *timer;
> +	u32 i, nr_timers, args[4];
> +	int ret;
> +
> +	ret = of_property_read_variable_u32_array(np, "intel,timer-cfg",
> +						  args, 2, 4);
> +	if (ret < 0) {
> +		dev_err(wdt_node->dev, "Failed to get timer cfg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	nr_timers = ret / 2;
> +	if (!nr_timers) {
> +		dev_err(wdt_node->dev, "No timer defined\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < nr_timers; i++) {
> +		if (args[i * 2] > MAX_TIMERID) {
> +			dev_err(wdt_node->dev,
> +				"Invalid timer id %d\n", args[i * 2]);
> +			return -EINVAL;
> +		}
> +
> +		if (args[i * 2 + 1] > MAX_CPUID) {
> +			dev_err(wdt_node->dev,
> +				"Invalid CPU-id : %d\n", args[i * 2 + 1]);
> +			return -EINVAL;
> +		}
> +
> +		timer = per_cpu_ptr(&lgm_timer_per_cpu, args[i * 2 + 1]);
> +		timer->cpuid = args[i * 2 + 1];
> +		timer->tid = args[i * 2];
> +		timer->enable = true;
> +		timer->wdt_node = wdt_node;
> +		timer->frequency = wdt_node->fpifreq;
> +		timer++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lgm_gptc_wdt_drv_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lgm_gptc_wdt *wdt_node;
> +	int ret;
> +
> +	wdt_node = devm_kzalloc(dev, sizeof(*wdt_node), GFP_KERNEL);
> +	if (!wdt_node)
> +		return -ENOMEM;
> +
> +	wdt_node->dev = dev;
> +	wdt_node->gptc_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(wdt_node->gptc_base))
> +		return PTR_ERR(wdt_node->gptc_base);
> +
> +	wdt_node->rst_hndl = syscon_regmap_lookup_by_phandle(dev->of_node,
> +							     "intel,wdt-rst-hndl");
> +	if (IS_ERR(wdt_node->rst_hndl)) {
> +		dev_err(dev, "No phandle of reset controller\n");
> +		return PTR_ERR(wdt_node->rst_hndl);
> +	}
> +
> +	ret = lgm_gptc_wdt_clk_enable(wdt_node);
> +	if (ret)
> +		return ret;
> +
> +	ret = lgm_gptc_wdt_of_parse_timer(wdt_node);
> +	if (ret)
> +		return ret;
> +
> +	lgm_gptc_wdt_init(wdt_node);
> +	ret  = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "LGM GPTC WDT REG",
> +				 lgm_gptc_wdt_reg_cpu, lgm_gptc_wdt_unreg_cpu);
> +	if (ret < 0) {
> +		dev_err(dev, "CPU hotplug setup failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	wdt_node->state = ret;
> +	platform_set_drvdata(pdev, wdt_node);
> +
> +	return 0;
> +}
> +
> +static int lgm_gptc_wdt_drv_remove(struct platform_device *dev)
> +{
> +	struct lgm_gptc_wdt *wdt_node = platform_get_drvdata(dev);
> +
> +	cpuhp_remove_state(wdt_node->state);
> +	lgm_gptc_wdt_clk_disable(wdt_node);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lgm_gptc_wdt_drv_match[] = {
> +	{ .compatible = "intel,lgm-gptc-wdt" },
> +	{}
> +};
> +
> +static struct platform_driver lgm_gptc_wdt_driver = {
> +	.driver		= {
> +		.name		= "intel,lgm-gptc-wdt",
> +		.of_match_table = lgm_gptc_wdt_drv_match,
> +	},
> +	.probe		= lgm_gptc_wdt_drv_probe,
> +	.remove		= lgm_gptc_wdt_drv_remove,
> +};
> +
> +module_platform_driver(lgm_gptc_wdt_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Driver for Watchdog Timer on Intel Lightning Mountain SoC");
> 

