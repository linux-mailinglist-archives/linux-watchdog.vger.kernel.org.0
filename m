Return-Path: <linux-watchdog+bounces-3171-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75658A75027
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 19:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F9B27A55DF
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 18:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF4FDDC5;
	Fri, 28 Mar 2025 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myhliILO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C8C2FA;
	Fri, 28 Mar 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185414; cv=none; b=gAp7jawKeFAfMbZTOkA5IQZaeYHAwvxdEgKSnzSOmpe1392REjeGJNxSZfOC7YZMj/Euiitnx+17UH8VQhACMwuXoAPpphAfLD7/dyDn59T9P8t2VcVvezTt0xEWfISRamgdvmDhtdao36fBTw900xrSeNVojjPn9bWavmioK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185414; c=relaxed/simple;
	bh=HX/JOgTtVPITgqcJ6Bkq1+4VFqvpgM8PRcD455UfBQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hm+3rRZRnwwdMrHdwyyIN819jZvf23u33U5FI64fncw3zWbzHsZOBm7DuRzbE0LJ8eaDcftfZXU3O9+jeAfUkPjAwGtTkyMyGfcT+2q2vfBU7a4RHezlMZJ0nwQuCQFojyqkKujLSyE35BoX8Br53tTrEG0TaJ28MgahM9lROLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myhliILO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2254e0b4b79so67773605ad.2;
        Fri, 28 Mar 2025 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743185410; x=1743790210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5nWj9Hvj90Pp7ag+QMRi/OciShJe2SGQRQpB3NEHbr0=;
        b=myhliILOY1E/Om1k9yjIVaS33vnnpodo1FkOq4T9ugPYwMAv9LdiW2DTe6wsH53y1p
         BgASkfVxAtjaY9yx6PxNPA9tDWMhaf+qm1xazvc9q74KPw01CDE1itbY8K9Lx7q9aER6
         sBSOfyst6BAY7Ca8MXGGI3CTQAjtPZgd+Cn6Kb8mnDJWTdH2KviY4uedrxuU0S+5dEaU
         HiMVZLy+hvhXQACLfkIWqAnmEi3EXusmLlJ109RzCMuWChkUfN1nurkKcNLMWzRJWOO1
         FDL7IrAXlAJDYclCgDJP+302Ds6CGdAVswUrMIORTm5QLVc2n59kVhiN3LzD30XOMAE6
         O1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743185410; x=1743790210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nWj9Hvj90Pp7ag+QMRi/OciShJe2SGQRQpB3NEHbr0=;
        b=h8JP8+RztRVjU0dlT7641bYR/WnGYmrHelitV18UXXIuYAFosEnThxg6ghkhtgQU6l
         NsLKJ8UXrTrkd4HvxP4r7/XcHze+mT9It66MgAGHyamZV4zoL7zWyR4Q75CO8lQJsY+z
         +vjOe+Yk2hfyTc3x0ltz9MEY8s1LZrm2XELkOOPbzjEmmAc4V5Qas82YN4p61ug3ChbQ
         vfSeBZbIiIaKy6+BhHJh/es5ivE0ETf2WUz5Pemb4PUEk6YCAZjhB4OS91f8ye1dKnIl
         1NLmGnFqdbCTZOZLK63lQ6UNxHDwYRG7tEFrac1Mz7m0905ZP1DzFxcqfiZc4pPInSZu
         QtNA==
X-Forwarded-Encrypted: i=1; AJvYcCX/P1YC7qRb/yHfojJiovXU3e9xgXGG8bojHBcjsH+S9ydSLHggPVEPg9kKUaqFlXMmGTFl3PXA/4A42oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPULhbFWKAzyp2d7v+WIYgbcIzPBe2EXAg2th6hQxrIV91yg3y
	VcolD7bzo3CdT+GgJqbuSLneT2W17ineHh0mKfsvwNutgaArIXyPxsVcUg==
X-Gm-Gg: ASbGncvatWcrm1h3XHgE480crcKKC7Ic/DfV3VB0o18wJE0Qm70b/kviA7PmPNvgY42
	Sc+aWdMJtlOWAEelLv+zL/JWP3u1JtAFAaia84t/XvyFMu9PAlF+c88i7jCKAAkUT3zn/CkJckO
	3hgdErarq7GdJIaGC6kVxqwLmfsZpB66hqFL1qVjp2uXzKwmflb+yBD9/rGVeJw8vtz5P1X39ZI
	j4UXElfgkFEFSQE9INFZqcN03/jWUE5aODRhIMd7rxhlz24F/FNGPlVy80mvNp0jYtSiAsF6Ugs
	s05ONyhI0QP2VPMs1BJatK1bTeNjxXqrVDt2lDTgRhqFfe7L4Pc+D6V0xa6VG/84xkB8V2JpaI+
	QoZUpp6u/CRMuKfu1hg==
X-Google-Smtp-Source: AGHT+IGpp9hSH7uK82E3o9sptsXX2vIknNtsRlwB6h2SRjX4wTlyMNT4YFlrmW6ohVrvfvYs13q1GA==
X-Received: by 2002:a17:902:f544:b0:21f:6bda:e492 with SMTP id d9443c01a7336-2292f9ee9e8mr1616865ad.35.1743185409817;
        Fri, 28 Mar 2025 11:10:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2243esm2186830b3a.60.2025.03.28.11.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 11:10:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a7c9715f-b912-49dd-a664-7b5e6017d0fa@roeck-us.net>
Date: Fri, 28 Mar 2025 11:10:08 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Add the Software Watchdog Timer for the NXP
 S32 platform
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <20250328151516.2219971-2-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250328151516.2219971-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/25 08:15, Daniel Lezcano wrote:
> The S32 platform has several Software Watchdog Timer available and

Why "Software" ? This is a hardware watchdog, or am I missing something ?

> tied with a CPU. The SWT0 is the only one which directly asserts the
> reset line, other SWT require an external setup to configure the reset
> behavior which is not part of this change.
> 
> The maximum watchdog value depends on the clock feeding the SWT
> counter which is 32bits wide. On the s32g274-rb2, the clock has a rate
> of 51MHz which lead to 83 seconds maximum timeout.
> 
> The timeout can be specified via the device tree with the usual
> existing bindings 'timeout-sec' or via the module param timeout.
> 
> The watchdog can be loaded with the 'nowayout' option, preventing the
> watchdog to be stopped.
> 
> The watchdog can be started at boot time with the 'early-enable'
> option, thus letting the watchdog framework to service the watchdog
> counter.
> 
> the watchdog support the magic character to stop when the userspace
> releases the device.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>   drivers/watchdog/Kconfig    |   9 +
>   drivers/watchdog/Makefile   |   1 +
>   drivers/watchdog/s32g_wdt.c | 362 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 372 insertions(+)
>   create mode 100644 drivers/watchdog/s32g_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f81705f8539a..4ab4275ef49f 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -792,6 +792,15 @@ config IMX7ULP_WDT
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called imx7ulp_wdt.
>   
> +config S32G_WDT
> +	tristate "S32G Watchdog"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This is the driver for the hardware watchdog on the NXP
> +	  S32G platforms. If you wish to have watchdog support
> +	  enabled, say Y, otherwise say N.
> +
>   config DB500_WATCHDOG
>   	tristate "ST-Ericsson DB800 watchdog"
>   	depends on MFD_DB8500_PRCMU
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 8411626fa162..d0f9826e32c3 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
>   obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
>   obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
>   obj-$(CONFIG_IMX7ULP_WDT) += imx7ulp_wdt.o
> +obj-$(CONFIG_S32G_WDT) += s32g_wdt.o
>   obj-$(CONFIG_DB500_WATCHDOG) += db8500_wdt.o
>   obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
>   obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
> diff --git a/drivers/watchdog/s32g_wdt.c b/drivers/watchdog/s32g_wdt.c
> new file mode 100644
> index 000000000000..87207b134c3e
> --- /dev/null
> +++ b/drivers/watchdog/s32g_wdt.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Watchdog driver for S32G SoC
> + *
> + * Copyright (C) 2014 Freescale Semiconductor, Inc.
> + * Copyright 2017-2019, 2021-2025 NXP.

Does this originate from out-of-tree code ?
If so, a reference would be helpful.

> + *
> + */
> +#include <linux/debugfs.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/of.h>

Alphabetic include file order, please.

> +
> +#define DRIVER_NAME "s32g-wdt"
> +
> +#define S32G_SWT_CR(__base)	(__base + 0x00)		/* Control Register offset	*/

checkpatch:
	CHECK: Macro argument '__base' may be better as '(__base)' to avoid precedence issues

> +#define S32G_SWT_CR_SM		BIT(9) | BIT(10)	/* -> Service Mode		*/

checkpatch:
	ERROR: Macros with complex values should be enclosed in parentheses

I am not going to comment on the other issues reported by checkpatch,
but I expect them to be fixed in the next version. I would strongly suggest
to run "checkpatch o--strict" on the patch and fix what it reports.


> +#define S32G_SWT_CR_STP		BIT(2)			/* -> Stop Mode Control		*/
> +#define S32G_SWT_CR_FRZ		BIT(1)			/* -> Debug Mode Control	*/
> +#define S32G_SWT_CR_WEN		BIT(0)			/* -> Watchdog Enable		*/
> +
> +#define S32G_SWT_TO(__base)	(__base + 0x08)		/* Timeout Register offset	*/
> +
> +#define S32G_SWT_SR(__base)	(__base + 0x10)		/* Service Register offset	*/
> +#define S32G_WDT_SEQ1		0xA602			/* -> service sequence number 1	*/
> +#define S32G_WDT_SEQ2		0xB480			/* -> service sequence number 2	*/
> +
> +#define S32G_SWT_CO(__base)	(__base + 0x14)		/* Counter output register	*/
> +
> +#define S32G_WDT_DEFAULT_TIMEOUT	30
> +
> +struct s32g_wdt_device {
> +	int rate;
> +	void __iomem *base;
> +	struct watchdog_device wdog;
> +};
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +static unsigned int timeout_param = S32G_WDT_DEFAULT_TIMEOUT;
> +module_param(timeout_param, uint, 0);
> +MODULE_PARM_DESC(timeout_param, "Watchdog timeout in seconds (default="
> +		 __MODULE_STRING(S32G_WDT_DEFAULT_TIMEOUT) ")");
> +
> +static bool early_enable = false;
> +module_param(early_enable, bool, 0);
> +MODULE_PARM_DESC(early_enable,
> +		 "Watchdog is started on module insertion (default=false)");
> +
> +static const struct watchdog_info s32g_wdt_info = {
> +	.identity = "s32g watchdog",
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE |
> +	WDIOC_GETTIMEOUT | WDIOC_GETTIMELEFT,
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +#define S32G_WDT_DEBUG_FS_REGS(__reg)		\
> +{						\
> +	.name = __stringify(__reg),		\
> +	.offset = __reg(0),			\
> +}
> +
> +static const struct debugfs_reg32 wdt_regs[] = {
> +	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_CR),
> +	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_TO),
> +	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_CO),
> +};
> +
> +static void s32g_wdt_debugfs_init(struct device *dev, struct s32g_wdt_device *wdev)
> +{
> +	struct debugfs_regset32 *regset;
> +	static struct dentry *dentry = NULL;
> +
> +	if (!dentry)
> +		dentry = debugfs_create_dir("watchdog", NULL);

That is a terribly generic debugfs directory name. That is unacceptable.
Pick a name that is driver specific.

> +
> +	dentry = debugfs_create_dir(dev_name(dev), dentry);
> +

Where is this removed if the driver is unloaded ?

Also, if the driver is built into the kernel, it seems to me that a second
instance will create a nested directory. That seems odd.

> +	regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
> +	if (!regset)
> +		return;
> +
> +	regset->base = wdev->base;
> +	regset->regs = wdt_regs;
> +	regset->nregs = ARRAY_SIZE(wdt_regs);
> +
> +	debugfs_create_regset32("registers", 0400, dentry, regset);
> +}
> +#else
> +static inline void s32g_wdt_debugfs_init(struct device *dev, struct s32g_wdt_device *wdev)
> +{
> +}
> +#endif
> +
> +static struct s32g_wdt_device *wdd_to_s32g_wdt(struct watchdog_device *wdd)
> +{
> +	return container_of(wdd, struct s32g_wdt_device, wdog);
> +}
> +
> +static unsigned int wdog_sec_to_count(struct s32g_wdt_device *wdev, unsigned int timeout)
> +{
> +	return wdev->rate * timeout;
> +}
> +
> +static int s32g_wdt_ping(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +
> +	__raw_writel(S32G_WDT_SEQ1, S32G_SWT_SR(wdev->base));
> +	__raw_writel(S32G_WDT_SEQ2, S32G_SWT_SR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val;
> +
> +	val = __raw_readl(S32G_SWT_CR(wdev->base));
> +
> +	val |= S32G_SWT_CR_WEN;
> +
> +	__raw_writel(val, S32G_SWT_CR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val;
> +
> +	val = __raw_readl(S32G_SWT_CR(wdev->base));
> +
> +	val &= ~S32G_SWT_CR_WEN;
> +
> +	__raw_writel(val, S32G_SWT_CR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_set_timeout(struct watchdog_device *wdog, unsigned int timeout)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +
> +	__raw_writel(wdog_sec_to_count(wdev, timeout), S32G_SWT_TO(wdev->base));
> +	
> +	/*
> +	 * Conforming to the documentation, the timeout counter is
> +	 * loaded when servicing is operated or when the counter is
> +	 * enabled. In case the watchdog is already started it must be
> +	 * stopped and started again to update the timeout
> +	 * register. Here we choose to service the watchdog for
> +	 * simpler code.
> +	 */
> +	return s32g_wdt_ping(wdog);

Either check if the watchdog is running, or add a note explaining that a ping
on a stopped watchdog does not have adverse effect.

> +}
> +
> +static unsigned int s32g_wdt_get_timeleft(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val, counter;
> +
> +	/*
> +	 * The counter output can be read only if the SWT is
> +	 * disabled. Given the latency between the internal counter
> +	 * and the counter output update, there can be very small
> +	 * difference. However, we can accept this matter of fact
> +	 * given the resolution is a second based unit for the output.
> +	 */
> +	val = __raw_readl(S32G_SWT_CR(wdev->base));
> +
> +	if (test_bit(S32G_SWT_CR_WEN, &val))
> +		s32g_wdt_stop(wdog);

The watchdog core provides wdt_is_running() which would avoid the
extra i/o access.

> +
> +	counter = __raw_readl(S32G_SWT_CO(wdev->base));
> +
> +	if (test_bit(S32G_SWT_CR_WEN, &val))
> +		s32g_wdt_start(wdog);
> +
> +	return counter / wdev->rate;
> +}
> +
> +static const struct watchdog_ops s32g_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= s32g_wdt_start,
> +	.stop		= s32g_wdt_stop,
> +	.ping		= s32g_wdt_ping,
> +	.set_timeout	= s32g_wdt_set_timeout,
> +	.get_timeleft	= s32g_wdt_get_timeleft,
> +};
> +
> +static void s32g_wdt_init(struct s32g_wdt_device *wdev)
> +{
> +	unsigned long val;
> +
> +	/* Set the watchdog's Time-Out value */
> +	val = wdog_sec_to_count(wdev, wdev->wdog.timeout);
> +
> +	__raw_writel(val, S32G_SWT_TO(wdev->base));
> +
> +	/*
> +	 * Get the control register content. We are at init time, the
> +	 * watchdog should not be started.
> +	 */
> +	val = __raw_readl(S32G_SWT_CR(wdev->base));
> +
> +	/*
> +	 * We want to allow the watchdog timer to be stopped when
> +	 * device enters debug mode.
> +	 */
> +	val |= S32G_SWT_CR_FRZ;
> +
> +	/*
> +	 * However, when the CPU is in WFI or suspend mode, the
> +	 * watchdog must continue. The documentation refers it as the
> +	 * stopped mode.
> +	 */
> +	val &= ~S32G_SWT_CR_STP;
> +
> +	/*
> +	 * Use Fixed Service Sequence to ping the watchdog which is
> +	 * 0x00 configuration value for the service mode. It should be
> +	 * already set because it is the default value but we reset it
> +	 * in case.
> +	 */
> +	val &= ~S32G_SWT_CR_SM;
> +
> +	__raw_writel(val, S32G_SWT_CR(wdev->base));
> +
> +	/*
> +	 * The watchdog must be started when the module is loaded,
> +	 * leading to getting ride of the userspace control. The

ride ? And why does it _have_ to be started when the module is loaded ?

> +	 * watchdog framework will handle the pings. It is especially
> +	 * handy for kernel development.
> +	 */
> +	if (early_enable) {
> +		s32g_wdt_start(&wdev->wdog);
> +		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> +	}
> +}
> +
> +static int s32g_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct clk *clk;
> +	struct s32g_wdt_device *wdev;
> +	struct watchdog_device *wdog;
> +	int ret;
> +
> +	wdev = devm_kzalloc(dev, sizeof(struct s32g_wdt_device), GFP_KERNEL);
> +	if (!wdev)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	wdev->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(wdev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdev->base), "Can not get resource\n");
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Can't get Watchdog clock\n");
> +
> +	wdev->rate = clk_get_rate(clk);
> +	if (!wdev->rate) {
> +		dev_err(dev, "Input clock rate is not valid\n");
> +		return -EINVAL;
> +	}
> +
> +	wdog = &wdev->wdog;
> +	wdog->info = &s32g_wdt_info;
> +	wdog->ops = &s32g_wdt_ops;
> +
> +	/*
> +	 * The code converts the timeout into a counter a value, if
> +	 * the value is less than 0x100, then it is clamped by the SWT
> +	 * module, so it is safe to specify a zero value as the
> +	 * minimum timeout.
> +	 */
> +	wdog->min_timeout = 0;
> +
> +	/*
> +	 * The counter register is a 32 bits long, so the maximum
> +	 * counter value is UINT_MAX and the timeout in second is the
> +	 * value divided by the rate.
> +	 *
> +	 * For instance, a rate of 51MHz lead to 84 seconds maximum
> +	 * timeout.
> +	 */
> +	wdog->max_timeout = UINT_MAX / wdev->rate;
> +
> +	/*
> +	 * The module param and the DT 'timeout-sec' property will
> +	 * override the default value if they are specified.
> +	 */
> +	ret = watchdog_init_timeout(wdog, timeout_param, dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * As soon as the watchdog is started, there is no way to stop
> +	 * it if the 'nowayout' option is set at boot time
> +	 */
> +	watchdog_set_nowayout(wdog, nowayout);
> +
> +	/*
> +	 * The devm_ version of the watchdog_register_device()
> +	 * function will call watchdog_unregister_device() when the
> +	 * device is removed.
> +	 */
> +	watchdog_stop_on_unregister(wdog);
> +
> +	s32g_wdt_init(wdev);
> +
> +	/*
> +	 * The debugfs will create a directory with the configured
> +	 * watchdogs on the platform and a register file to give some
> +	 * register content.
> +	 */
> +	s32g_wdt_debugfs_init(dev, wdev);
> +
> +	ret = devm_watchdog_register_device(dev, wdog);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register watchdog device\n");
> +
> +	dev_info(dev, "S32G Watchdog Timer Registered. "
> +		 "timeout=%ds, nowayout=%d, early_enable=%d\n",
> +		 wdog->timeout, nowayout, early_enable);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id s32g_wdt_dt_ids[] = {
> +	{ .compatible = "nxp,s32g-wdt" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver s32g_wdt_driver = {
> +	.probe = s32g_wdt_probe,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.owner = THIS_MODULE,
> +		.of_match_table = s32g_wdt_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(s32g_wdt_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("Watchdog driver for S32G SoC");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRIVER_NAME);


