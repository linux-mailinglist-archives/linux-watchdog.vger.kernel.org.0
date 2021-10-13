Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B865F42C90F
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Oct 2021 20:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhJMSvK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Oct 2021 14:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhJMSu6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Oct 2021 14:50:58 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60824C061570;
        Wed, 13 Oct 2021 11:48:55 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id e63so5101799oif.8;
        Wed, 13 Oct 2021 11:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kvb9F26/Ag+I2nechH1iPJovKe5woGCF8NlQA+etfZk=;
        b=kcsWXj0064hBYU7WqcEsLPvPSmtd7890lREAkcQmQL4KCJt3vabtJZsZkCIYNo6OEH
         wtqmKsWGoj2g5dPwY1vCHacPHgbESu/6rbZ6mciMqF4SB/a+hN1gQTp1p8nRZ6/51nIh
         slyVsM9HG6OruWCW8PqDPPGfIPUH/nihE38TUaiDChe9VjsN2bRoBtqCRsPlYqhE9iek
         zgZDxS8fgqR1qbVcpbEi/tZdmzvwn65fWz3bqXq3ANWRP6IolgNf5l5qw8G0zD7wyICq
         h/Q+hMm83w7YqgfNqkkAJNt0tMaOWpwsjgr5GDBM9BotPAyeOe7cdd2yB/+o65NH5ybv
         EOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=kvb9F26/Ag+I2nechH1iPJovKe5woGCF8NlQA+etfZk=;
        b=nfNdgqCElK8GekLc0ydC0U/sRnZHRLIxT7KsRaBQWrebwFk6mX0NOBoKji78l2ZMrF
         no3XdLItsIsrX+e/uHBxZ5LcKZJ7eZPZkfzSYyRcIwoMWHwvwmCgTAwAQwWOvMxriPSk
         hkXga4eeW4dKmfzUEyTq5+8WDGSkN+WXcCiEpddhz2rdGIwyZ43cqeA60wuOpsVoZPZq
         NeRQGSlicifhLu+sXd7sN7Z6ZNd9InAqN8A/QVcAyJnjSfWt65dowI5WtztkUzJST54E
         yDnO0jkwK2lbfA9trT5gR3JmTt38M51HP9BeN7/uidVe4yYWzU/umDtxnFmskGgyg8/9
         KEFw==
X-Gm-Message-State: AOAM5334af7XkoKLDR9gIzQOpPphc0fkArYpgEoZKZREiFiI9xiFZmUo
        ardR1qa2fEaOBVbH/k3l6IEa6/DIvug=
X-Google-Smtp-Source: ABdhPJzXKI2okCSDzUvVq6E06yr+L/MzjXG6rHjrjy7ah2HAWF8x8oYbXW64xNDXMgfsT9d/7pB5kw==
X-Received: by 2002:aca:a94c:: with SMTP id s73mr9455075oie.93.1634150934611;
        Wed, 13 Oct 2021 11:48:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y9sm79151ote.39.2021.10.13.11.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:48:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 13 Oct 2021 11:48:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: Add Realtek Otto watchdog timer
Message-ID: <20211013184852.GA955578@roeck-us.net>
References: <cover.1634131707.git.sander@svanheule.net>
 <7eb1e3d8a5bd3b221be0408bd6f0272e6d435ade.1634131707.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eb1e3d8a5bd3b221be0408bd6f0272e6d435ade.1634131707.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 13, 2021 at 03:29:00PM +0200, Sander Vanheule wrote:
> Realtek MIPS SoCs (platform name Otto) have a watchdog timer with
> pretimeout notifitication support. The WDT can (partially) hard reset,
> or soft reset the SoC.
> 
> This driver implements all features as described in the devicetree
> binding, and also functions as a restart handler. The cpu reset mode is
> considered to be a "warm" restart, since this mode does not reset all
> peripherals. Being an embedded system though, the "cpu" and "software"
> modes will still cause the bootloader to run on restart.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  MAINTAINERS                         |   7 +
>  drivers/watchdog/Kconfig            |  13 +
>  drivers/watchdog/Makefile           |   1 +
>  drivers/watchdog/realtek_otto_wdt.c | 411 ++++++++++++++++++++++++++++
>  4 files changed, 432 insertions(+)
>  create mode 100644 drivers/watchdog/realtek_otto_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 62257ffca56a..e2a036c1a64b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15858,6 +15858,13 @@ S:	Maintained
>  F:	include/sound/rt*.h
>  F:	sound/soc/codecs/rt*
>  
> +REALTEK OTTO WATCHDOG
> +M:	Sander Vanheule <sander@svanheule.net>
> +L:	linux-watchdog@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
> +F:	driver/watchdog/realtek_otto_wdt.c
> +
>  REALTEK RTL83xx SMI DSA ROUTER CHIPS
>  M:	Linus Walleij <linus.walleij@linaro.org>
>  S:	Maintained
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..799dbc14b347 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -954,6 +954,19 @@ config RTD119X_WATCHDOG
>  	  Say Y here to include support for the watchdog timer in
>  	  Realtek RTD1295 SoCs.
>  
> +config REALTEK_OTTO_WDT
> +	tristate "Realtek Otto MIPS watchdog support"
> +	depends on MACH_REALTEK_RTL || COMPILE_TEST
> +	select COMMON_CLK
> +	select WATCHDOG_CORE
> +	default MACH_REALTEK_RTL
> +	help
> +	  Say Y here to include support for the watchdog timer on
> +	  Realtek RTL838x, RTL839x SoCs. On timeout this watchdog
> +	  will restart the system.
> +
> +	  When built as a module this will be called realtek_otto_wdt.
> +
>  config SPRD_WATCHDOG
>  	tristate "Spreadtrum watchdog support"
>  	depends on ARCH_SPRD || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 1bd2d6f37c53..a8dccf819163 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -171,6 +171,7 @@ obj-$(CONFIG_IMGPDC_WDT) += imgpdc_wdt.o
>  obj-$(CONFIG_MT7621_WDT) += mt7621_wdt.o
>  obj-$(CONFIG_PIC32_WDT) += pic32-wdt.o
>  obj-$(CONFIG_PIC32_DMT) += pic32-dmt.o
> +obj-$(CONFIG_REALTEK_OTTO_WDT) += realtek_otto_wdt.o
>  
>  # PARISC Architecture
>  
> diff --git a/drivers/watchdog/realtek_otto_wdt.c b/drivers/watchdog/realtek_otto_wdt.c
> new file mode 100644
> index 000000000000..64c9cba6b0b1
> --- /dev/null
> +++ b/drivers/watchdog/realtek_otto_wdt.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Realtek Otto MIPS platform watchdog
> + *
> + * Watchdog timer that will reset the system after timeout, using the selected
> + * reset mode.
> + *
> + * Counter scaling and timeouts:
> + * - Base prescale of (2 << 25), providing tick duration T_0: 168ms @ 200MHz
> + * - PRESCALE: logarithmic prescaler adding a factor of {1, 2, 4, 8}
> + * - Phase 1: Times out after (PHASE1 + 1) × PRESCALE × T_0
> + *   Generates an interrupt, WDT cannot be stopped after phase 1
> + * - Phase 2: starts after phase 1, times out after (PHASE2 + 1) × PRESCALE × T_0
> + *   Resets the system according to RST_MODE

Why is there a phase2 interrupt if phase2 resets the chip ?

> + */
> +
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reboot.h>
> +#include <linux/watchdog.h>
> +
> +#define OTTO_WDT_REG_CNTR		0x0
> +#define OTTO_WDT_CNTR_PING		BIT(31)
> +
> +#define OTTO_WDT_REG_INTR		0x4
> +#define OTTO_WDT_INTR_PHASE_1		BIT(31)
> +#define OTTO_WDT_INTR_PHASE_2		BIT(30)
> +
> +#define OTTO_WDT_REG_CTRL		0x8
> +#define OTTO_WDT_CTRL_ENABLE		BIT(31)
> +#define OTTO_WDT_CTRL_PRESCALE		GENMASK(30, 29)
> +#define OTTO_WDT_CTRL_PHASE1		GENMASK(26, 22)
> +#define OTTO_WDT_CTRL_PHASE2		GENMASK(19, 15)
> +#define OTTO_WDT_CTRL_RST_MODE		GENMASK(1, 0)
> +#define OTTO_WDT_MODE_SOC		0
> +#define OTTO_WDT_MODE_CPU		1
> +#define OTTO_WDT_MODE_SOFTWARE		2
> +#define OTTO_WDT_CTRL_DEFAULT		OTTO_WDT_MODE_CPU
> +
> +#define OTTO_WDT_PRESCALE_MAX		3
> +
> +/*
> + * One higher than the max values contained in PHASE{1,2}, since a value of 0
> + * corresponds to one tick.
> + */
> +#define OTTO_WDT_PHASE_TICKS_MAX	32
> +
> +/*
> + * The maximum reset delay is actually 2×32 ticks, but that would require large
> + * pretimout values for timeouts longer than 32 ticks. Limit the maximum timeout
> + * to 32 + 1 to ensure small pretimeout values can be configured as expected.
> + */
> +#define OTTO_WDT_TIMEOUT_TICKS_MAX	(OTTO_WDT_PHASE_TICKS_MAX + 1)
> +
> +struct otto_wdt_ctrl {
> +	struct watchdog_device wdev;
> +	struct device *dev;
> +	raw_spinlock_t lock;
> +	void __iomem *base;
> +	struct clk *clk;
> +	int irq_phase1;
> +	int irq_phase2;
> +};
> +
> +static int otto_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> +	unsigned long flags;
> +	u32 v;
> +
> +	raw_spin_lock_irqsave(&ctrl->lock, flags);
> +	v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
> +	v |= OTTO_WDT_CTRL_ENABLE;
> +	iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
> +	raw_spin_unlock_irqrestore(&ctrl->lock, flags);

Is it really necessary to disable interrupts for those operations ?

> +
> +	return 0;
> +}
> +
> +static int otto_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> +	unsigned long flags;
> +	u32 v;
> +
> +	raw_spin_lock_irqsave(&ctrl->lock, flags);
> +	v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
> +	v &= ~OTTO_WDT_CTRL_ENABLE;
> +	iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
> +	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int otto_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> +
> +	iowrite32(OTTO_WDT_CNTR_PING, ctrl->base + OTTO_WDT_REG_CNTR);
> +
> +	return 0;
> +}
> +
> +static int otto_wdt_tick_ms(struct otto_wdt_ctrl *ctrl, int prescale)
> +{
> +	unsigned int rate_khz = clk_get_rate(ctrl->clk) / 1000;
> +
> +	if (!rate_khz)
> +		return 0;
> +
> +	return DIV_ROUND_CLOSEST(1 << (25 + prescale), rate_khz);
> +}
> +
> +/*
> + * The timer asserts the PHASE1/PHASE2 IRQs when the number of ticks exceeds
> + * the value stored in those fields. This means the timer will run for at least
> + * one tick, so small values need to be clamped to correctly reflect the timeout.
> + */
> +static inline unsigned int div_round_ticks(unsigned int val, unsigned int tick_duration,
> +		unsigned int min_ticks)
> +{
> +	return max(min_ticks, DIV_ROUND_CLOSEST(val, tick_duration));

Are you sure that DIV_ROUND_CLOSEST is appropriate in those calculations
(instead of DIV_ROUND_UP or DIV_ROUND_DOWN) ?

> +}
> +
> +static int otto_wdt_determine_timeouts(struct otto_wdt_ctrl *ctrl, unsigned int timeout,
> +		unsigned int pretimeout)
> +{
> +	unsigned int pretimeout_ms = pretimeout * 1000;
> +	unsigned int timeout_ms = timeout * 1000;
> +	unsigned int prescale_next = 0;
> +	unsigned int phase1_ticks;
> +	unsigned int phase2_ticks;
> +	unsigned int total_ticks;
> +	unsigned int prescale;
> +	unsigned int tick_ms;
> +	u32 v;
> +
> +	do {
> +		prescale = prescale_next;
> +		if (prescale > OTTO_WDT_PRESCALE_MAX)
> +			return -EINVAL;
> +
> +		tick_ms = otto_wdt_tick_ms(ctrl, prescale);
> +		total_ticks = div_round_ticks(timeout_ms, tick_ms, 2);
> +		phase2_ticks = div_round_ticks(pretimeout_ms, tick_ms, 1);
> +		phase1_ticks = total_ticks - phase2_ticks;
> +
> +		prescale_next++;
> +	} while (phase1_ticks > OTTO_WDT_PHASE_TICKS_MAX
> +		|| phase2_ticks > OTTO_WDT_PHASE_TICKS_MAX);
> +
> +	v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
> +
> +	v &= ~(OTTO_WDT_CTRL_PRESCALE | OTTO_WDT_CTRL_PHASE1 | OTTO_WDT_CTRL_PHASE2);
> +	v |= FIELD_PREP(OTTO_WDT_CTRL_PHASE1, phase1_ticks - 1);
> +	v |= FIELD_PREP(OTTO_WDT_CTRL_PHASE2, phase2_ticks - 1);
> +	v |= FIELD_PREP(OTTO_WDT_CTRL_PRESCALE, prescale);
> +
> +	iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
> +
> +	timeout_ms = total_ticks * tick_ms;
> +	ctrl->wdev.timeout = DIV_ROUND_CLOSEST(timeout_ms, 1000);
> +

That means the actual timeout (and pretimeout) can be slightly larger
than the real timeout. Is this really what you want ?

> +	pretimeout_ms = phase2_ticks * tick_ms;
> +	ctrl->wdev.pretimeout = DIV_ROUND_CLOSEST(pretimeout_ms, 1000);
> +
> +	return 0;
> +}
> +
> +static int otto_wdt_set_timeout(struct watchdog_device *wdev, unsigned int val)
> +{
> +	struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> +	unsigned long flags;
> +	unsigned int ret;
> +
> +	if (watchdog_timeout_invalid(wdev, val))
> +		return -EINVAL;

This is not supposed to happen because the calling code already performs
range checks.

> +
> +	raw_spin_lock_irqsave(&ctrl->lock, flags);
> +	ret = otto_wdt_determine_timeouts(ctrl, val, min(wdev->pretimeout, val - 1));
> +	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int otto_wdt_set_pretimeout(struct watchdog_device *wdev, unsigned int val)
> +{
> +	struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> +	unsigned long flags;
> +	unsigned int ret;
> +
> +	if (watchdog_pretimeout_invalid(wdev, val))
> +		return -EINVAL;
> +
> +	raw_spin_lock_irqsave(&ctrl->lock, flags);
> +	ret = otto_wdt_determine_timeouts(ctrl, wdev->timeout, val);
> +	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int otto_wdt_restart(struct watchdog_device *wdev, unsigned long reboot_mode,
> +		void *data)
> +{
> +	struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
> +	u32 reset_mode;
> +	u32 v;
> +
> +	devm_free_irq(ctrl->dev, ctrl->irq_phase1, ctrl);
> +

Why is this needed (instead of, say, disabling the interrupt) ?

> +	switch (reboot_mode) {
> +	case REBOOT_SOFT:
> +		reset_mode = OTTO_WDT_MODE_SOFTWARE;
> +		break;
> +	case REBOOT_WARM:
> +		reset_mode = OTTO_WDT_MODE_CPU;
> +		break;
> +	default:
> +		reset_mode = OTTO_WDT_MODE_SOC;
> +		break;
> +	}
> +
> +	/* Configure for shortest timeout and wait for reset to occur */
> +	v = FIELD_PREP(OTTO_WDT_CTRL_RST_MODE, reset_mode) | OTTO_WDT_CTRL_ENABLE;
> +	iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
> +
> +	mdelay(3 * otto_wdt_tick_ms(ctrl, 0));
> +
> +	return 0;
> +}
> +
> +static irqreturn_t otto_wdt_phase1_isr(int irq, void *dev_id)
> +{
> +	struct otto_wdt_ctrl *ctrl = dev_id;
> +
> +	iowrite32(OTTO_WDT_INTR_PHASE_1, ctrl->base + OTTO_WDT_REG_INTR);
> +	dev_crit(ctrl->dev, "phase 1 timeout\n");
> +	watchdog_notify_pretimeout(&ctrl->wdev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t otto_wdt_phase2_isr(int irq, void *dev_id)
> +{
> +	struct otto_wdt_ctrl *ctrl = dev_id;
> +
> +	iowrite32(OTTO_WDT_INTR_PHASE_2, ctrl->base + OTTO_WDT_REG_INTR);
> +	dev_crit(ctrl->dev, "phase 2 timeout\n");
> +	emergency_restart();
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct watchdog_ops otto_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = otto_wdt_start,
> +	.stop = otto_wdt_stop,
> +	.ping = otto_wdt_ping,
> +	.set_timeout = otto_wdt_set_timeout,
> +	.set_pretimeout = otto_wdt_set_pretimeout,
> +	.restart = otto_wdt_restart,
> +};
> +
> +static const struct watchdog_info otto_wdt_info = {
> +	.identity = "Realtek Otto watchdog timer",
> +	.options = WDIOF_KEEPALIVEPING |
> +		WDIOF_MAGICCLOSE |
> +		WDIOF_SETTIMEOUT |
> +		WDIOF_PRETIMEOUT,
> +};
> +
> +static int otto_wdt_probe_reset_mode(struct otto_wdt_ctrl *ctrl)
> +{
> +	static const char *mode_property = "realtek,reset-mode";
> +	const struct fwnode_handle *node = ctrl->dev->fwnode;
> +	int mode_count;
> +	u32 mode;
> +	u32 v;
> +
> +	if (!node)
> +		return -ENXIO;
> +
> +	mode_count = fwnode_property_string_array_count(node, mode_property);
> +	if (mode_count < 0)
> +		return mode_count;
> +	else if (mode_count == 0)
> +		return 0;
> +	else if (mode_count != 1)
> +		return -EINVAL;
> +
> +	if (fwnode_property_match_string(node, mode_property, "soc") == 0)
> +		mode = OTTO_WDT_MODE_SOC;
> +	else if (fwnode_property_match_string(node, mode_property, "cpu") == 0)
> +		mode = OTTO_WDT_MODE_CPU;
> +	else if (fwnode_property_match_string(node, mode_property, "software") == 0)
> +		mode = OTTO_WDT_MODE_SOFTWARE;
> +	else
> +		return -EINVAL;
> +
> +	v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
> +	v &= ~OTTO_WDT_CTRL_RST_MODE;
> +	v |= FIELD_PREP(OTTO_WDT_CTRL_RST_MODE, mode);
> +	iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
> +
> +	return 0;
> +}
> +
> +static int otto_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct otto_wdt_ctrl *ctrl;
> +	unsigned int max_tick_ms;
> +	int ret;
> +
> +	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	ctrl->dev = dev;
> +	ctrl->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ctrl->base))
> +		return PTR_ERR(ctrl->base);
> +
> +	raw_spin_lock_init(&ctrl->lock);
> +
> +	/* Clear any old interrupts and reset initial state */
> +	iowrite32(OTTO_WDT_INTR_PHASE_1 | OTTO_WDT_INTR_PHASE_2,
> +			ctrl->base + OTTO_WDT_REG_INTR);
> +	iowrite32(OTTO_WDT_CTRL_DEFAULT, ctrl->base + OTTO_WDT_REG_CTRL);
> +
> +	ctrl->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(ctrl->clk))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->clk), "Failed to get clock\n");
> +
> +	ctrl->irq_phase1 = platform_get_irq_byname(pdev, "phase1");
> +	if (ctrl->irq_phase1 < 0)
> +		return dev_err_probe(dev, ctrl->irq_phase1, "phase1 IRQ not found\n");
> +
> +	ret = devm_request_irq(dev, ctrl->irq_phase1, otto_wdt_phase1_isr, 0,
> +			"realtek-otto-wdt", ctrl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get IRQ for phase1\n");
> +
> +	ctrl->irq_phase2 = platform_get_irq_byname(pdev, "phase2");
> +	if (ctrl->irq_phase2 < 0)
> +		return dev_err_probe(dev, ctrl->irq_phase2, "phase2 IRQ not found\n");
> +
> +	ret = devm_request_irq(dev, ctrl->irq_phase2, otto_wdt_phase2_isr, 0,
> +			"realtek-otto-wdt", ctrl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get IRQ for phase2\n");
> +
> +	ret = otto_wdt_probe_reset_mode(ctrl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Invalid reset mode specified\n");
> +
> +	ctrl->wdev.parent = dev;
> +	ctrl->wdev.info = &otto_wdt_info;
> +	ctrl->wdev.ops = &otto_wdt_ops;
> +
> +	/*
> +	 * Since pretimeout cannot be disabled, min_timeout is twice the
> +	 * subsystem resolution. max_timeout is 44s at a bus clock of 200MHz.
> +	 */
> +	ctrl->wdev.min_timeout = 2;
> +	max_tick_ms = otto_wdt_tick_ms(ctrl, OTTO_WDT_PRESCALE_MAX);
> +	ctrl->wdev.max_timeout =
> +		DIV_ROUND_CLOSEST(max_tick_ms * OTTO_WDT_TIMEOUT_TICKS_MAX, 1000);

Any reason for using max_timeout instead of max_hw_heartbeat_ms ?

> +	ctrl->wdev.timeout = min(30U, ctrl->wdev.max_timeout);
> +
> +	watchdog_set_drvdata(&ctrl->wdev, ctrl);
> +	watchdog_init_timeout(&ctrl->wdev, 0, dev);
> +	watchdog_stop_on_reboot(&ctrl->wdev);
> +	watchdog_set_restart_priority(&ctrl->wdev, 128);
> +
> +	ret = otto_wdt_determine_timeouts(ctrl, ctrl->wdev.timeout, 1);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set timeout\n");
> +
> +	return devm_watchdog_register_device(dev, &ctrl->wdev);
> +}
> +
> +static const struct of_device_id otto_wdt_ids[] = {
> +	{ .compatible = "realtek,rtl8380-wdt" },
> +	{ .compatible = "realtek,rtl8390-wdt" },
> +	{ }
> +};
> +
> +static struct platform_driver otto_wdt_driver = {
> +	.probe = otto_wdt_probe,
> +	.driver = {
> +		.name = "realtek-otto-watchdog",
> +		.of_match_table	= otto_wdt_ids,
> +	},
> +};
> +module_platform_driver(otto_wdt_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
> +MODULE_DESCRIPTION("Realtek Otto watchdog timer driver");
> -- 
> 2.31.1
> 
