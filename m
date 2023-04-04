Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE276D5C6C
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Apr 2023 11:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbjDDJzm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Apr 2023 05:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbjDDJzk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Apr 2023 05:55:40 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743C1213E;
        Tue,  4 Apr 2023 02:55:35 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 5F6B724E2E9;
        Tue,  4 Apr 2023 17:55:33 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Apr
 2023 17:55:33 +0800
Received: from [192.168.125.128] (183.27.97.179) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Apr
 2023 17:55:32 +0800
Message-ID: <bf334d3d-4788-03ab-ac20-a68e542e552b@starfivetech.com>
Date:   Tue, 4 Apr 2023 17:54:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/3] drivers: watchdog: Add StarFive Watchdog driver
To:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Samin Guo <samin.guo@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
References: <20230314132437.121534-1-xingyu.wu@starfivetech.com>
 <20230314132437.121534-3-xingyu.wu@starfivetech.com>
Content-Language: en-US
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230314132437.121534-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-1.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2023/3/14 21:24, Xingyu Wu wrote:
> Add watchdog driver for the StarFive JH7100 and JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  MAINTAINERS                     |   7 +
>  drivers/watchdog/Kconfig        |  11 +
>  drivers/watchdog/Makefile       |   3 +
>  drivers/watchdog/starfive-wdt.c | 606 ++++++++++++++++++++++++++++++++
>  4 files changed, 627 insertions(+)
>  create mode 100644 drivers/watchdog/starfive-wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d5bc223f305..721d0e4e8a0d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19962,6 +19962,13 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/rng/starfive*
>  F:	drivers/char/hw_random/jh7110-trng.c
>  
> +STARFIVE WATCHDOG DRIVER
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
> +M:	Samin Guo <samin.guo@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/watchdog/starfive*
> +F:	drivers/watchdog/starfive-wdt.c
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f0872970daf9..f22138709bf5 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1999,6 +1999,17 @@ config WATCHDOG_RTAS
>  	  To compile this driver as a module, choose M here. The module
>  	  will be called wdrtas.
>  
> +# RISC-V Architecture
> +
> +config STARFIVE_WATCHDOG
> +	tristate "StarFive Watchdog support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	default ARCH_STARFIVE
> +	help
> +	  Say Y here to support the watchdog of StarFive JH7100 and JH7110
> +	  SoC. This driver can also be built as a module if choose M.
> +
>  # S390 Architecture
>  
>  config DIAG288_WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 9cbf6580f16c..b4c4ccf2d703 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -192,6 +192,9 @@ obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
>  obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
>  obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
>  
> +# RISC-V Architecture
> +obj-$(CONFIG_STARFIVE_WATCHDOG) += starfive-wdt.o
> +
>  # S390 Architecture
>  obj-$(CONFIG_DIAG288_WATCHDOG) += diag288_wdt.o
>  
> diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
> new file mode 100644
> index 000000000000..1995cceca51e
> --- /dev/null
> +++ b/drivers/watchdog/starfive-wdt.c
> @@ -0,0 +1,606 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Starfive Watchdog driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/watchdog.h>
> +
> +/* JH7100 Watchdog register define */
> +#define STARFIVE_WDT_JH7100_INTSTAUS	0x000
> +#define STARFIVE_WDT_JH7100_CONTROL	0x104
> +#define STARFIVE_WDT_JH7100_LOAD	0x108
> +#define STARFIVE_WDT_JH7100_EN		0x110
> +#define STARFIVE_WDT_JH7100_RELOAD	0x114	/* Write 0 or 1 to reload preset value */
> +#define STARFIVE_WDT_JH7100_VALUE	0x118
> +#define STARFIVE_WDT_JH7100_INTCLR	0x120	/*
> +						 * [0]: Write 1 to clear interrupt
> +						 * [1]: 1 mean clearing and 0 mean complete
> +						 * [31:2]: reserved.
> +						 */
> +#define STARFIVE_WDT_JH7100_LOCK	0x13c	/* write 0x378f0765 to unlock */
> +
> +/* JH7110 Watchdog register define */
> +#define STARFIVE_WDT_JH7110_LOAD	0x000
> +#define STARFIVE_WDT_JH7110_VALUE	0x004
> +#define STARFIVE_WDT_JH7110_CONTROL	0x008	/*
> +						 * [0]: reset enable;
> +						 * [1]: interrupt enable && watchdog enable
> +						 * [31:2]: reserved.
> +						 */
> +#define STARFIVE_WDT_JH7110_INTCLR	0x00c	/* clear intterupt and reload the counter */
> +#define STARFIVE_WDT_JH7110_IMS		0x014
> +#define STARFIVE_WDT_JH7110_LOCK	0xc00	/* write 0x1ACCE551 to unlock */
> +
> +/* WDOGCONTROL */
> +#define STARFIVE_WDT_ENABLE			0x1
> +#define STARFIVE_WDT_EN_SHIFT			0
> +#define STARFIVE_WDT_RESET_EN			0x1
> +#define STARFIVE_WDT_JH7100_RST_EN_SHIFT	0
> +#define STARFIVE_WDT_JH7110_RST_EN_SHIFT	1
> +
> +/* WDOGLOCK */
> +#define STARFIVE_WDT_JH7100_UNLOCK_KEY		0x378f0765
> +#define STARFIVE_WDT_JH7110_UNLOCK_KEY		0x1acce551
> +
> +/* WDOGINTCLR */
> +#define STARFIVE_WDT_INTCLR			0x1
> +#define STARFIVE_WDT_JH7100_INTCLR_AVA_SHIFT	1	/* Watchdog can clear interrupt when 0 */
> +
> +#define STARFIVE_WDT_MAXCNT			0xffffffff
> +#define STARFIVE_WDT_DEFAULT_TIME		(15)
> +#define STARFIVE_WDT_DELAY_US			0
> +#define STARFIVE_WDT_TIMEOUT_US			10000
> +
> +/* module parameter */
> +#define STARFIVE_WDT_EARLY_ENA			0
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +static int heartbeat;
> +static bool early_enable = STARFIVE_WDT_EARLY_ENA;
> +
> +module_param(heartbeat, int, 0);
> +module_param(early_enable, bool, 0);
> +module_param(nowayout, bool, 0);
> +
> +MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default="
> +		 __MODULE_STRING(STARFIVE_WDT_DEFAULT_TIME) ")");
> +MODULE_PARM_DESC(early_enable,
> +		 "Watchdog is started at boot time if set to 1, default="
> +		 __MODULE_STRING(STARFIVE_WDT_EARLY_ENA));
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct starfive_wdt_variant {
> +	unsigned int control;		/* Watchdog Control Resgister for reset enable */
> +	unsigned int load;		/* Watchdog Load register */
> +	unsigned int reload;		/* Watchdog Reload Control register */
> +	unsigned int enable;		/* Watchdog Enable Register */
> +	unsigned int value;		/* Watchdog Counter Value Register */
> +	unsigned int int_clr;		/* Watchdog Interrupt Clear Register */
> +	unsigned int unlock;		/* Watchdog Lock Register */
> +	unsigned int int_status;	/* Watchdog Interrupt Status Register */
> +
> +	u32 unlock_key;
> +	char enrst_shift;
> +	char en_shift;
> +	bool intclr_check;		/*  whether need to check it before clearing interrupt */
> +	char intclr_ava_shift;
> +	bool double_timeout;		/* The watchdog need twice timeout to reboot */
> +};
> +
> +struct starfive_wdt {
> +	struct watchdog_device wdd;
> +	spinlock_t lock;		/* spinlock for register handling */
> +	void __iomem *base;
> +	struct clk *core_clk;
> +	struct clk *apb_clk;
> +	const struct starfive_wdt_variant *variant;
> +	unsigned long freq;
> +	u32 count;			/* count of timeout */
> +	u32 reload;			/* restore the count */
> +};
> +
> +/* Register layout and configuration for the JH7100 */
> +static const struct starfive_wdt_variant starfive_wdt_jh7100_variant = {
> +	.control = STARFIVE_WDT_JH7100_CONTROL,
> +	.load = STARFIVE_WDT_JH7100_LOAD,
> +	.reload = STARFIVE_WDT_JH7100_RELOAD,
> +	.enable = STARFIVE_WDT_JH7100_EN,
> +	.value = STARFIVE_WDT_JH7100_VALUE,
> +	.int_clr = STARFIVE_WDT_JH7100_INTCLR,
> +	.unlock = STARFIVE_WDT_JH7100_LOCK,
> +	.unlock_key = STARFIVE_WDT_JH7100_UNLOCK_KEY,
> +	.int_status = STARFIVE_WDT_JH7100_INTSTAUS,
> +	.enrst_shift = STARFIVE_WDT_JH7100_RST_EN_SHIFT,
> +	.en_shift = STARFIVE_WDT_EN_SHIFT,
> +	.intclr_check = true,
> +	.intclr_ava_shift = STARFIVE_WDT_JH7100_INTCLR_AVA_SHIFT,
> +	.double_timeout = false,
> +};
> +
> +/* Register layout and configuration for the JH7110 */
> +static const struct starfive_wdt_variant starfive_wdt_jh7110_variant = {
> +	.control = STARFIVE_WDT_JH7110_CONTROL,
> +	.load = STARFIVE_WDT_JH7110_LOAD,
> +	.enable = STARFIVE_WDT_JH7110_CONTROL,
> +	.value = STARFIVE_WDT_JH7110_VALUE,
> +	.int_clr = STARFIVE_WDT_JH7110_INTCLR,
> +	.unlock = STARFIVE_WDT_JH7110_LOCK,
> +	.unlock_key = STARFIVE_WDT_JH7110_UNLOCK_KEY,
> +	.int_status = STARFIVE_WDT_JH7110_IMS,
> +	.enrst_shift = STARFIVE_WDT_JH7110_RST_EN_SHIFT,
> +	.en_shift = STARFIVE_WDT_EN_SHIFT,
> +	.intclr_check = false,
> +	.double_timeout = true,
> +};
> +
> +static int starfive_wdt_enable_clock(struct starfive_wdt *wdt)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(wdt->apb_clk);
> +	if (ret)
> +		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable apb clock\n");
> +
> +	ret = clk_prepare_enable(wdt->core_clk);
> +	if (ret)
> +		return dev_err_probe(wdt->wdd.parent, ret, "failed to enable core clock\n");
> +
> +	return 0;
> +}
> +
> +static void starfive_wdt_disable_clock(struct starfive_wdt *wdt)
> +{
> +	clk_disable_unprepare(wdt->core_clk);
> +	clk_disable_unprepare(wdt->apb_clk);
> +}
> +
> +static inline int starfive_wdt_get_clock(struct starfive_wdt *wdt)
> +{
> +	struct device *dev = wdt->wdd.parent;
> +
> +	wdt->apb_clk = devm_clk_get(dev, "apb");
> +	if (IS_ERR(wdt->apb_clk))
> +		return dev_err_probe(dev, PTR_ERR(wdt->apb_clk), "failed to get apb clock\n");
> +
> +	wdt->core_clk = devm_clk_get(dev, "core");
> +	if (IS_ERR(wdt->core_clk))
> +		return dev_err_probe(dev, PTR_ERR(wdt->core_clk), "failed to get core clock\n");
> +
> +	return 0;
> +}
> +
> +static inline int starfive_wdt_reset_init(struct device *dev)
> +{
> +	struct reset_control *rsts;
> +	int ret;
> +
> +	rsts = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(rsts))
> +		return dev_err_probe(dev, PTR_ERR(rsts), "failed to get resets\n");
> +
> +	ret = reset_control_deassert(rsts);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert resets\n");
> +
> +	return 0;
> +}
> +
> +static u32 starfive_wdt_ticks_to_sec(struct starfive_wdt *wdt, u32 ticks)
> +{
> +	return DIV_ROUND_CLOSEST(ticks, wdt->freq);
> +}
> +
> +/* Write unlock-key to unlock. Write other value to lock. */
> +static void starfive_wdt_unlock(struct starfive_wdt *wdt)
> +{
> +	spin_lock(&wdt->lock);
> +	writel(wdt->variant->unlock_key, wdt->base + wdt->variant->unlock);
> +}
> +
> +static void starfive_wdt_lock(struct starfive_wdt *wdt)
> +{
> +	writel(~wdt->variant->unlock_key, wdt->base + wdt->variant->unlock);
> +	spin_unlock(&wdt->lock);
> +}
> +
> +/* enable watchdog interrupt to reset/reboot */
> +static void starfive_wdt_enable_reset(struct starfive_wdt *wdt)
> +{
> +	u32 val;
> +
> +	val = readl(wdt->base + wdt->variant->control);
> +	val |= STARFIVE_WDT_RESET_EN << wdt->variant->enrst_shift;
> +	writel(val, wdt->base + wdt->variant->control);
> +}
> +
> +/* interrupt status whether has been raised from the counter */
> +static bool starfive_wdt_raise_irq_status(struct starfive_wdt *wdt)
> +{
> +	return !!readl(wdt->base + wdt->variant->int_status);
> +}
> +
> +/* waiting interrupt can be free to clear */
> +static int starfive_wdt_wait_int_free(struct starfive_wdt *wdt)
> +{
> +	u32 value;
> +
> +	return readl_poll_timeout_atomic(wdt->base + wdt->variant->int_clr, value,
> +					 !(value & BIT(wdt->variant->intclr_ava_shift)),
> +					 STARFIVE_WDT_DELAY_US, STARFIVE_WDT_TIMEOUT_US);
> +}
> +
> +/* clear interrupt signal before initialization or reload */
> +static int starfive_wdt_int_clr(struct starfive_wdt *wdt)
> +{
> +	int ret;
> +
> +	if (wdt->variant->intclr_check) {
> +		ret = starfive_wdt_wait_int_free(wdt);
> +		if (ret)
> +			return dev_err_probe(wdt->wdd.parent, ret,
> +					     "watchdog is not ready to clear interrupt.\n");
> +	}
> +	writel(STARFIVE_WDT_INTCLR, wdt->base + wdt->variant->int_clr);
> +
> +	return 0;
> +}
> +
> +static inline void starfive_wdt_set_count(struct starfive_wdt *wdt, u32 val)
> +{
> +	writel(val, wdt->base + wdt->variant->load);
> +}
> +
> +static inline u32 starfive_wdt_get_count(struct starfive_wdt *wdt)
> +{
> +	return readl(wdt->base + wdt->variant->value);
> +}
> +
> +/* enable watchdog */
> +static inline void starfive_wdt_enable(struct starfive_wdt *wdt)
> +{
> +	u32 val;
> +
> +	val = readl(wdt->base + wdt->variant->enable);
> +	val |= STARFIVE_WDT_ENABLE << wdt->variant->en_shift;
> +	writel(val, wdt->base + wdt->variant->enable);
> +}
> +
> +/* disable watchdog */
> +static inline void starfive_wdt_disable(struct starfive_wdt *wdt)
> +{
> +	u32 val;
> +
> +	val = readl(wdt->base + wdt->variant->enable);
> +	val &= ~(STARFIVE_WDT_ENABLE << wdt->variant->en_shift);
> +	writel(val, wdt->base + wdt->variant->enable);
> +}
> +
> +static inline void starfive_wdt_set_reload_count(struct starfive_wdt *wdt, u32 count)
> +{
> +	starfive_wdt_set_count(wdt, count);
> +
> +	/* 7100 need set any value to reload register and could reload value to counter */
> +	if (wdt->variant->reload)
> +		writel(0x1, wdt->base + wdt->variant->reload);
> +}
> +
> +static unsigned int starfive_wdt_max_timeout(struct starfive_wdt *wdt)
> +{
> +	if (wdt->variant->double_timeout)
> +		return DIV_ROUND_UP(STARFIVE_WDT_MAXCNT, (wdt->freq / 2)) - 1;
> +
> +	return DIV_ROUND_UP(STARFIVE_WDT_MAXCNT, wdt->freq) - 1;
> +}
> +
> +static unsigned int starfive_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct starfive_wdt *wdt = watchdog_get_drvdata(wdd);
> +	u32 count;
> +
> +	/*
> +	 * If the watchdog takes twice timeout and set half count value,
> +	 * timeleft value should add the count value before first timeout.
> +	 */
> +	count = starfive_wdt_get_count(wdt);
> +	if (wdt->variant->double_timeout && !starfive_wdt_raise_irq_status(wdt))
> +		count += wdt->count;
> +
> +	return starfive_wdt_ticks_to_sec(wdt, count);
> +}
> +
> +static int starfive_wdt_keepalive(struct watchdog_device *wdd)
> +{
> +	struct starfive_wdt *wdt = watchdog_get_drvdata(wdd);
> +	int ret;
> +
> +	starfive_wdt_unlock(wdt);
> +	ret = starfive_wdt_int_clr(wdt);
> +	if (ret)
> +		goto exit;
> +
> +	starfive_wdt_set_reload_count(wdt, wdt->count);
> +
> +exit:
> +	/* exit with releasing spinlock and locking registers */
> +	starfive_wdt_lock(wdt);
> +	return ret;
> +}
> +
> +static int starfive_wdt_start(struct starfive_wdt *wdt)
> +{
> +	int ret;
> +
> +	starfive_wdt_unlock(wdt);
> +	/* disable watchdog, to be safe */
> +	starfive_wdt_disable(wdt);
> +
> +	starfive_wdt_enable_reset(wdt);
> +	ret = starfive_wdt_int_clr(wdt);
> +	if (ret)
> +		goto exit;
> +
> +	starfive_wdt_set_count(wdt, wdt->count);
> +	starfive_wdt_enable(wdt);
> +
> +exit:
> +	starfive_wdt_lock(wdt);
> +	return ret;
> +}
> +
> +static void starfive_wdt_stop(struct starfive_wdt *wdt)
> +{
> +	starfive_wdt_unlock(wdt);
> +	starfive_wdt_disable(wdt);
> +	starfive_wdt_lock(wdt);
> +}
> +
> +static int starfive_wdt_pm_start(struct watchdog_device *wdd)
> +{
> +	struct starfive_wdt *wdt = watchdog_get_drvdata(wdd);
> +	int ret = pm_runtime_get_sync(wdd->parent);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return starfive_wdt_start(wdt);
> +}
> +
> +static int starfive_wdt_pm_stop(struct watchdog_device *wdd)
> +{
> +	struct starfive_wdt *wdt = watchdog_get_drvdata(wdd);
> +
> +	starfive_wdt_stop(wdt);
> +	return pm_runtime_put_sync(wdd->parent);
> +}
> +
> +static int starfive_wdt_set_timeout(struct watchdog_device *wdd,
> +				    unsigned int timeout)
> +{
> +	struct starfive_wdt *wdt = watchdog_get_drvdata(wdd);
> +	unsigned long count = timeout * wdt->freq;
> +
> +	/* some watchdogs take two timeouts to reset */
> +	if (wdt->variant->double_timeout)
> +		count /= 2;
> +
> +	wdt->count = count;
> +	wdd->timeout = timeout;
> +
> +	starfive_wdt_unlock(wdt);
> +	starfive_wdt_disable(wdt);
> +	starfive_wdt_set_reload_count(wdt, wdt->count);
> +	starfive_wdt_enable(wdt);
> +	starfive_wdt_lock(wdt);
> +
> +	return 0;
> +}
> +
> +#define STARFIVE_WDT_OPTIONS (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE)
> +
> +static const struct watchdog_info starfive_wdt_info = {
> +	.options = STARFIVE_WDT_OPTIONS,
> +	.identity = "StarFive Watchdog",
> +};
> +
> +static const struct watchdog_ops starfive_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = starfive_wdt_pm_start,
> +	.stop = starfive_wdt_pm_stop,
> +	.ping = starfive_wdt_keepalive,
> +	.set_timeout = starfive_wdt_set_timeout,
> +	.get_timeleft = starfive_wdt_get_timeleft,
> +};
> +
> +static int starfive_wdt_probe(struct platform_device *pdev)
> +{
> +	struct starfive_wdt *wdt;
> +	int ret;
> +
> +	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
> +
> +	wdt->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(wdt->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt->base), "error mapping registers\n");
> +
> +	wdt->wdd.parent = &pdev->dev;
> +	ret = starfive_wdt_get_clock(wdt);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, wdt);
> +	pm_runtime_enable(&pdev->dev);
> +	if (pm_runtime_enabled(&pdev->dev)) {
> +		ret = pm_runtime_get_sync(&pdev->dev);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		/* runtime PM is disabled but clocks need to be enabled */
> +		ret = starfive_wdt_enable_clock(wdt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = starfive_wdt_reset_init(&pdev->dev);
> +	if (ret)
> +		goto err_exit;
> +
> +	watchdog_set_drvdata(&wdt->wdd, wdt);
> +	wdt->wdd.info = &starfive_wdt_info;
> +	wdt->wdd.ops = &starfive_wdt_ops;
> +	wdt->variant = of_device_get_match_data(&pdev->dev);
> +	spin_lock_init(&wdt->lock);
> +
> +	wdt->freq = clk_get_rate(wdt->core_clk);
> +	if (!wdt->freq) {
> +		dev_err(&pdev->dev, "get clock rate failed.\n");
> +		ret = -EINVAL;
> +		goto err_exit;
> +	}
> +
> +	wdt->wdd.min_timeout = 1;
> +	wdt->wdd.max_timeout = starfive_wdt_max_timeout(wdt);
> +	wdt->wdd.timeout = STARFIVE_WDT_DEFAULT_TIME;
> +	watchdog_init_timeout(&wdt->wdd, heartbeat, &pdev->dev);
> +	starfive_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
> +
> +	watchdog_set_nowayout(&wdt->wdd, nowayout);
> +	watchdog_stop_on_reboot(&wdt->wdd);
> +	watchdog_stop_on_unregister(&wdt->wdd);
> +
> +	if (early_enable) {
> +		ret = starfive_wdt_start(wdt);
> +		if (ret)
> +			goto err_exit;
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> +	} else {
> +		starfive_wdt_stop(wdt);
> +	}
> +
> +	ret = watchdog_register_device(&wdt->wdd);
> +	if (ret)
> +		goto err_exit;
> +
> +	if (!early_enable)
> +		return pm_runtime_put_sync(&pdev->dev);
> +
> +	return 0;
> +
> +err_exit:
> +	starfive_wdt_disable_clock(wdt);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int starfive_wdt_remove(struct platform_device *pdev)
> +{
> +	struct starfive_wdt *wdt = platform_get_drvdata(pdev);
> +
> +	starfive_wdt_stop(wdt);
> +	watchdog_unregister_device(&wdt->wdd);
> +
> +	if (pm_runtime_enabled(&pdev->dev))
> +		pm_runtime_disable(&pdev->dev);
> +	else
> +		/* disable clock without PM */
> +		starfive_wdt_disable_clock(wdt);
> +
> +	return 0;
> +}
> +
> +static void starfive_wdt_shutdown(struct platform_device *pdev)
> +{
> +	struct starfive_wdt *wdt = platform_get_drvdata(pdev);
> +
> +	starfive_wdt_pm_stop(&wdt->wdd);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int starfive_wdt_suspend(struct device *dev)
> +{
> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
> +
> +	/* Save watchdog state, and turn it off. */
> +	wdt->reload = starfive_wdt_get_count(wdt);
> +
> +	/* Note that WTCNT doesn't need to be saved. */
> +	starfive_wdt_stop(wdt);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int starfive_wdt_resume(struct device *dev)
> +{
> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	starfive_wdt_unlock(wdt);
> +	/* Restore watchdog state. */
> +	starfive_wdt_set_reload_count(wdt, wdt->reload);
> +	starfive_wdt_lock(wdt);
> +
> +	return starfive_wdt_start(wdt);
> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +#ifdef CONFIG_PM
> +static int starfive_wdt_runtime_suspend(struct device *dev)
> +{
> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
> +
> +	starfive_wdt_disable_clock(wdt);
> +
> +	return 0;
> +}
> +
> +static int starfive_wdt_runtime_resume(struct device *dev)
> +{
> +	struct starfive_wdt *wdt = dev_get_drvdata(dev);
> +
> +	return starfive_wdt_enable_clock(wdt);
> +}
> +#endif /* CONFIG_PM */
> +
> +static const struct dev_pm_ops starfive_wdt_pm_ops = {
> +	SET_RUNTIME_PM_OPS(starfive_wdt_runtime_suspend, starfive_wdt_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(starfive_wdt_suspend, starfive_wdt_resume)
> +};
> +
> +static const struct of_device_id starfive_wdt_match[] = {
> +	{ .compatible = "starfive,jh7100-wdt", .data = &starfive_wdt_jh7100_variant },
> +	{ .compatible = "starfive,jh7110-wdt", .data = &starfive_wdt_jh7110_variant },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, starfive_wdt_match);
> +
> +static struct platform_driver starfive_wdt_driver = {
> +	.probe = starfive_wdt_probe,
> +	.remove = starfive_wdt_remove,
> +	.shutdown = starfive_wdt_shutdown,
> +	.driver = {
> +		.name = "starfive-wdt",
> +		.pm = &starfive_wdt_pm_ops,
> +		.of_match_table = of_match_ptr(starfive_wdt_match),
> +	},
> +};
> +module_platform_driver(starfive_wdt_driver);
> +
> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
> +MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive Watchdog Device Driver");
> +MODULE_LICENSE("GPL");

Hi Guenter & Wim,

Could you please help to review and provide comments on these patch series if you have time?
I would like to know what still need to be improved. Thanks.

Best regards,
Xingyu Wu
