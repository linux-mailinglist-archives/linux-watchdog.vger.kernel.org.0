Return-Path: <linux-watchdog+bounces-3291-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92EA86A8A
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Apr 2025 05:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E059D7A86EF
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Apr 2025 03:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE4B149DE8;
	Sat, 12 Apr 2025 03:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILlCNAf/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60666149C6F;
	Sat, 12 Apr 2025 03:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744428163; cv=none; b=iOSmR7HhoF3nbJ5BRwMyhRgA+7mMwMs/Ph0XLK89ZqET9IASRiYKcMoTxbozmf+XG4ESLK7lviX1y9GWTs3ikH6JnpKHxfEJwH/rmH/mYopNM597so9Xvh5uDgffWzM1YiVv132qcJJ+ewUpilUbVDtlrWKCOPu/mlEUf3R0G1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744428163; c=relaxed/simple;
	bh=u4FxSDsPEdDgwKo+L11YsR9SuZsPzK2uMoEFqgRVcyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gY9F2ZL9tSsYlfg4afDHnCbS4uH0XhqvU5qtL9935QgRdmJF0gV3C+dLDO8vAJVU/BZ5LK16ThJ1G2hxd2L3MMv/tCD+QwGbh8hysdL2uXlQf9ZSoCJA+Q4ZInyAYe69NRFsIQfDA07udLVvAH4+s8wFo+mLKHjKlorvkaEug9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILlCNAf/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b03bc416962so1900370a12.0;
        Fri, 11 Apr 2025 20:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744428159; x=1745032959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2jTNgAPbjLZl1VqPV0AG2gLITSuHxzs9clIWpc9VUR0=;
        b=ILlCNAf/ksTRslYTKxef3XkTZXG0R0AI1RdGHT0eebJ6WYw7/hPnq+q6m0Smqt6jbH
         cdwDZg9rgrjLXT77919rqmQCVq9j7f8JaI1UyfiFn9CujcvqjuNkQmiBZgThaufvRuCg
         TML4Bn/OhKAd9kwUu6CuB/BcgAhS5e+E7uOrfbHFGzaidiaKMQYRlwykcX9141mEslay
         bS59kMGLsn4yRtViEyNRz4roiH3JSspFS4ROacTBMoMkC0qIezjRC+1BQ/KwkL5f833U
         uWIBJ+S1PoY4WuBAoiwaMptWNeaiv+JMcNI7cnzEcYWydYwFEvMFNUdPAOG+SPflBkIU
         ADFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744428159; x=1745032959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jTNgAPbjLZl1VqPV0AG2gLITSuHxzs9clIWpc9VUR0=;
        b=TDqdr2bJhye6NOqcmbo/tZdLhJgOvdSVPI5MNvKz+ovlP88d5FF58QtWsbBfO9wlDL
         7VxHAKA/huCc0SwLygbWuQVob0ekmgRgKVBQ+kyl8vaLLALef7JZ9/+3OED1mcuFYElf
         BuabFyGSSdQdUzJKLJC9rlyZSVbkWzRC4xKa08t9AFRMtSpvoMS3uXOkjiO7r3X7po/C
         wx0edqIHABDHHKTJEP0m2uP/+/lWBmZovDiz+QVIQ1hpgSv8UBOQUBEH+NDBrYG0wERk
         /I+TD00jAqepg+a3ES8G9b78qZ5zWBvCobH4ISd1FIR+qEgh8vJSMl6GZ8kDblNf4KW9
         U4xw==
X-Forwarded-Encrypted: i=1; AJvYcCVbATVKen7iPnp1ivZbQpOlEWVi+zsArpN3Y/mOmKGHPHDPezAxVhmC26V1gmyEZiFfgK4KEFzBLE0+@vger.kernel.org, AJvYcCWYhoNiJZ4S+U6gN9880T+ZBJUn/bXDx1XQlbxy9KpHLIehR/14cbfEuOtmoETOQ2tXUkciirOcTFwf/BeP@vger.kernel.org
X-Gm-Message-State: AOJu0YwGaEKnOawNFdLz9WrYyoafzHRz3Q/dhx1szT7QXdaStXYe0pNA
	hhVom9s6zlHFFjLxe2HDf9iuLTLXa2vsYI+yoItPa5qhFEvBuzr1J3qxKA==
X-Gm-Gg: ASbGnctWUeu5zEh6BzU9SpytTvPVEtZQgRRAGug6qJXuOJ9XNTffZZP03J6631qWPUG
	KqOE3Xh9AuqXYA6Pm2JIWnaTYpF/ZFTJOXaHyXYIGIU1Si2j2YVh3JZHssPup4H0E/xy0T+gBUL
	r1ml1ff/HLd8Szs0ntvAjETJ9dn2rjYzw9oC2L7Le2+u15+C/nVJKxlGNNMqrNH+f/QsVEjC0m3
	NrEYYOOcRGqWcLi1dG7xTWOEtaftYnrdrVwVAOi+k4xmj4hxqaWN939TsPaLUN8lNdcBWNPwgzC
	ggXn3u75pJzic0gNGlbaYKvmNB51znSqHgeCvLljjckxxL8vTYM4KDALQVWQz8LLPXQY5qBjjR6
	wWt2NY1ihDxXCHw==
X-Google-Smtp-Source: AGHT+IH0FcnLjBd9+0ccUxA/T7TrqFNFNVKGZ6V41bbrPqFnwLnD6ZYo+lgcvrVpDsPCEPy235O/Dg==
X-Received: by 2002:a17:903:3c6d:b0:21f:768:cced with SMTP id d9443c01a7336-22bea495845mr64240625ad.8.1744428159248;
        Fri, 11 Apr 2025 20:22:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccab6csm58619685ad.215.2025.04.11.20.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 20:22:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c931118c-c28f-47c1-9547-b26641aa4445@roeck-us.net>
Date: Fri, 11 Apr 2025 20:22:36 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] watchdog: Add the Watchdog Timer for the NXP S32
 platform
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, ghennadi.procopciuc@nxp.com, thomas.fossati@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <20250410082616.1855860-3-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250410082616.1855860-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 01:26, Daniel Lezcano wrote:
> The S32 platform has several Watchdog Timer available and tied with a
> CPU. The SWT0 is the only one which directly asserts the reset line,
> other SWT require an external setup to configure the reset behavior
> which is not part of this change.
> 
> As a side note, in the NXP documentation, the s32g2 and s32g3
> reference manuals refer the watchdog as the 'Software Timer Watchdog'
> where the name can be misleading as it is actually a hardware
> watchdog.
> 
> The maximum watchdog timeout value depends on the clock feeding the
> SWT counter which is 32bits wide. On the s32g274-rb2, the clock has a
> rate of 51MHz which result on 83 seconds maximum timeout.
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
> The watchdog support the magic character to stop when the userspace
> releases the device.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig    |   9 ++
>   drivers/watchdog/Makefile   |   1 +
>   drivers/watchdog/s32g_wdt.c | 315 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 325 insertions(+)
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
> index 000000000000..ad55063060af
> --- /dev/null
> +++ b/drivers/watchdog/s32g_wdt.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Watchdog driver for S32G SoC
> + *
> + * Copyright 2017-2019, 2021-2025 NXP.
> + *
> + */
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define DRIVER_NAME "s32g-swt"
> +
> +#define S32G_SWT_CR(__base)	((__base) + 0x00)	/* Control Register offset	*/
> +#define S32G_SWT_CR_SM		(BIT(9) | BIT(10))	/* -> Service Mode		*/
> +#define S32G_SWT_CR_STP		BIT(2)			/* -> Stop Mode Control		*/
> +#define S32G_SWT_CR_FRZ		BIT(1)			/* -> Debug Mode Control	*/
> +#define S32G_SWT_CR_WEN		BIT(0)			/* -> Watchdog Enable		*/
> +
> +#define S32G_SWT_TO(__base)	((__base) + 0x08)	/* Timeout Register offset	*/
> +
> +#define S32G_SWT_SR(__base)	((__base) + 0x10)	/* Service Register offset	*/
> +#define S32G_WDT_SEQ1		0xA602			/* -> service sequence number 1	*/
> +#define S32G_WDT_SEQ2		0xB480			/* -> service sequence number 2	*/
> +
> +#define S32G_SWT_CO(__base)	((__base) + 0x14)	/* Counter output register	*/
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
> +static bool early_enable;
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
> +	writel(S32G_WDT_SEQ1, S32G_SWT_SR(wdev->base));
> +	writel(S32G_WDT_SEQ2, S32G_SWT_SR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val;
> +
> +	val = readl(S32G_SWT_CR(wdev->base));
> +
> +	val |= S32G_SWT_CR_WEN;
> +
> +	writel(val, S32G_SWT_CR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val;
> +
> +	val = readl(S32G_SWT_CR(wdev->base));
> +
> +	val &= ~S32G_SWT_CR_WEN;
> +
> +	writel(val, S32G_SWT_CR(wdev->base));
> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_set_timeout(struct watchdog_device *wdog, unsigned int timeout)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +
> +	writel(wdog_sec_to_count(wdev, timeout), S32G_SWT_TO(wdev->base));
> +
> +	wdog->timeout = timeout;
> +
> +	/*
> +	 * Conforming to the documentation, the timeout counter is
> +	 * loaded when servicing is operated (aka ping) or when the
> +	 * counter is enabled. In case the watchdog is already started
> +	 * it must be stopped and started again to update the timeout
> +	 * register or a ping can be sent to refresh the counter. Here
> +	 * we choose to send a ping to the watchdog which is harmless
> +	 * if the watchdog is stopped.
> +	 */
> +	return s32g_wdt_ping(wdog);
> +}
> +
> +static unsigned int s32g_wdt_get_timeleft(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long counter;
> +	bool is_running;
> +
> +	/*
> +	 * The counter output can be read only if the SWT is
> +	 * disabled. Given the latency between the internal counter
> +	 * and the counter output update, there can be very small
> +	 * difference. However, we can accept this matter of fact
> +	 * given the resolution is a second based unit for the output.
> +	 */
> +	is_running = watchdog_hw_running(wdog);
> +
> +	if (is_running)
> +		s32g_wdt_stop(wdog);
> +
> +	counter = readl(S32G_SWT_CO(wdev->base));
> +
> +	if (is_running)
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
> +	writel(val, S32G_SWT_TO(wdev->base));
> +
> +	/*
> +	 * Get the control register content. We are at init time, the
> +	 * watchdog should not be started.
> +	 */
> +	val = readl(S32G_SWT_CR(wdev->base));
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
> +	writel(val, S32G_SWT_CR(wdev->base));
> +
> +	/*
> +	 * When the 'early_enable' option is set, we start the
> +	 * watchdog from the kernel.
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
> +	wdev = devm_kzalloc(dev, sizeof(*wdev), GFP_KERNEL);
> +	if (!wdev)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	wdev->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(wdev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdev->base), "Can not get resource\n");
> +
> +	clk = devm_clk_get_enabled(dev, "counter");
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
> +	ret = devm_watchdog_register_device(dev, wdog);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register watchdog device\n");
> +
> +	dev_info(dev, "S32G Watchdog Timer Registered, timeout=%ds, nowayout=%d, early_enable=%d\n",
> +		 wdog->timeout, nowayout, early_enable);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id s32g_wdt_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-swt" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s32g_wdt_dt_ids);
> +
> +static struct platform_driver s32g_wdt_driver = {
> +	.probe = s32g_wdt_probe,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.of_match_table = s32g_wdt_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(s32g_wdt_driver);
> +
> +MODULE_AUTHOR("Daniel Lezcano <daniel.lezcano@linaro.org>");
> +MODULE_DESCRIPTION("Watchdog driver for S32G SoC");
> +MODULE_LICENSE("GPL");


