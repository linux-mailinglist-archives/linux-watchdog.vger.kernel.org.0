Return-Path: <linux-watchdog+bounces-1453-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C2948389
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 22:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B9A28456E
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 20:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E8514A4C9;
	Mon,  5 Aug 2024 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmShIGi6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32A13E881;
	Mon,  5 Aug 2024 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722890081; cv=none; b=lgXLH4wt/9kZM71FKwct12YYbGH8eniYzVvwTx/LWCvpAzUcqGaiaENW77TP4DYh6QoL3st2Xu0KxoHMK7xRt6KXBHOrKFkXuWRnhW2dgotCF4OyIiqSkQOCLA5Fz+FtOr0XplfI03zAlK1Ey/uoJw5ebbC/kTC/se+K0lW2x5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722890081; c=relaxed/simple;
	bh=f4L/qXTv097VFZIeOdm0GnvP1MOPgUQGfO6rWUAwjzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8SUm9q/gVd4e4yOr+8kgan8Vn6+PyevFkyq8mYDbt09ID/K1W0lCUZE4gC6ClY+/dMSzejP5b9yDfKNOA29CaCd+7Anm18ZEQAjNToJPyfj7A8Ele88TGS/bsuBQePCaMb/mSPGgHJOgct61WQsKKEfn37vqqADN2gn+mpT4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmShIGi6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7a2123e9ad5so3841858a12.1;
        Mon, 05 Aug 2024 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722890078; x=1723494878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9bnHNu2yeEnfOPvCLrbZpkoQCtroZGGMsTxXGO3ntCw=;
        b=PmShIGi6Y+EFApZLo+HOKTjuIMP+8Qt0a4+bZzlDhvnLqkhE6cCrzDhsZAuZKwgeVS
         uSOy8liCnpGRbOQd7ML98w/nio9vPSe9UOldUwQTyaoy+0LgRGrH5/gCJuzfx5CFdKUZ
         GMIQAxUVRUI03mQ+6kPagc4bllngyI857j/ny2syiKLc4pI8fzQfx59hhvkutg11260I
         uGcnRCWXg5Agsjnzfx6PHUaS9MAe53+unLKruTb92CDeH0GB29SUQduGgapxBd7AD9Al
         Ys0rxTN/g3DRiLrbhBt/sc11Bw1XEbHYswUlXVWbUPNf4N23IP52rLtBA+XUvCMmq6Hk
         yNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722890078; x=1723494878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bnHNu2yeEnfOPvCLrbZpkoQCtroZGGMsTxXGO3ntCw=;
        b=vxUozcrKJEZSuVrD6euR/VDthS+kjyrRbGw4qPK0522YDwUo/pWo06msucdULzCXJT
         ParCNCV4itq/1Ohtczw/yhZ0PgKyKE9HqOuTkkI536fDBMTAyW9H4lb2hHIuVjgcZ8ir
         yPep+3v6TiBbN3agM0+ciImgzDtn6U8ojMK+IXo7MPV+LTwMX+HmZTti9/2M7BqZ4xLF
         3UIA4Uwkj4qFpJ74WL8815GJ9deFnPrCkD+0dTnspf6ZlKRUBi6qS2dLh/M+6uT28RNM
         w2bVeUdTbkeUi56BRPauo3HSv5zqyeMzcnVcDTdGUmd1Kzof1eusGhyAdHXz+6V/dVz2
         yPGA==
X-Forwarded-Encrypted: i=1; AJvYcCW5WSFq4kZQ7Iz36gbwtdz7WoZZLfQaqrs0SHCFUa9fNoUUdkxSSZpbCymwjqOURx8rC9AkGdyrdef9o1PMz66EzIkaxCi7tHava3bAmqg2051Nrek9+bOjVfVQ6beIblvv4MDratRHSWPFVWXX4bwMk5JxXPSlSUUE8+KE57DHIB4YjQHpAe7l2mZl4h9lmQ==
X-Gm-Message-State: AOJu0YylkOJa2u3LUjVOLCwPV/ds1tTdGJQelmf6LK800W3YdrWXVYc3
	GMTGQ3DSNjbr5c9aHmd2j9/+R+KTzJFqJ7LLeo785CF4hTuHygw7
X-Google-Smtp-Source: AGHT+IF2PRidKen7nf/5orRFku7nGT5ovsdoXHqfeI1JrZ3xaZsrKncWB5lBh4IsdeV2vXuZ/Ldwjg==
X-Received: by 2002:a17:90b:1b0a:b0:2c9:7f8b:f7d8 with SMTP id 98e67ed59e1d1-2cffa0dac92mr21431134a91.6.1722890077837;
        Mon, 05 Aug 2024 13:34:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffb091a99sm7703561a91.21.2024.08.05.13.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 13:34:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <81ac76eb-8b43-457b-80be-c588ac4790e1@roeck-us.net>
Date: Mon, 5 Aug 2024 13:34:35 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240805200400.54267-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240805200400.54267-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240805200400.54267-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/24 13:04, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add Watchdog Timer driver for RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Fixed dependency, ARCH_R9A09G011->ARCH_R9A09G057
> - Added dependency for PM
> - Added delay after de-assert operation as clks are halted temporarily
>    after de-assert operation
> - clearing WDTSR register
> 
> v1->v2
> - Stopped using PM runtime calls in restart handler
> - Dropped rstc deassert from probe
> ---
>   drivers/watchdog/Kconfig     |   9 ++
>   drivers/watchdog/Makefile    |   1 +
>   drivers/watchdog/rzv2h_wdt.c | 259 +++++++++++++++++++++++++++++++++++
>   3 files changed, 269 insertions(+)
>   create mode 100644 drivers/watchdog/rzv2h_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bae1d97cce89..684b9fe84fff 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -953,6 +953,15 @@ config RENESAS_RZG2LWDT
>   	  This driver adds watchdog support for the integrated watchdogs in the
>   	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
>   
> +config RENESAS_RZV2HWDT
> +	tristate "Renesas RZ/V2H(P) WDT Watchdog"
> +	depends on ARCH_R9A09G057 || COMPILE_TEST
> +	depends on PM || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This driver adds watchdog support for the integrated watchdogs in the
> +	  Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a system.
> +
>   config ASPEED_WATCHDOG
>   	tristate "Aspeed BMC watchdog support"
>   	depends on ARCH_ASPEED || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index b51030f035a6..ab6f2b41e38e 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
>   obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
>   obj-$(CONFIG_RENESAS_RZN1WDT) += rzn1_wdt.o
>   obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
> +obj-$(CONFIG_RENESAS_RZV2HWDT) += rzv2h_wdt.o
>   obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
>   obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
>   obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> new file mode 100644
> index 000000000000..b6183940b221
> --- /dev/null
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) WDT Watchdog Driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corporation.
> + */
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/units.h>
> +#include <linux/watchdog.h>
> +
> +#define WDTRR			0x00	/* RW, 8  */
> +#define WDTCR			0x02	/* RW, 16 */
> +#define WDTSR			0x04	/* RW, 16 */
> +#define WDTRCR			0x06	/* RW, 8  */
> +
> +#define WDTCR_TOPS_1024		0x00
> +#define WDTCR_TOPS_16384	0x03
> +
> +#define WDTCR_CKS_CLK_1		0x00
> +#define WDTCR_CKS_CLK_256	0x50
> +
> +#define WDTCR_RPES_0		0x300
> +#define WDTCR_RPES_75		0x000
> +
> +#define WDTCR_RPSS_25		0x00
> +#define WDTCR_RPSS_100		0x3000
> +
> +#define WDTRCR_RSTIRQS		BIT(7)
> +
> +#define CLOCK_DIV_BY_256	256
> +
> +#define WDT_DEFAULT_TIMEOUT	60U
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct rzv2h_wdt_priv {
> +	void __iomem *base;
> +	struct clk *pclk;
> +	struct clk *oscclk;
> +	struct reset_control *rstc;
> +	struct watchdog_device wdev;
> +	unsigned long oscclk_rate;
> +};
> +
> +static int rzv2h_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	static unsigned long delay;
> +
> +	writeb(0x0, priv->base + WDTRR);
> +	writeb(0xFF, priv->base + WDTRR);
> +
> +	/*
> +	 * Refreshing the down-counter requires up to 4 cycles
> +	 * of the signal for counting
> +	 */

That doesn't explain why the delay (after pinging the watchdog) is necessary.

> +	if (!delay)
> +		delay = 4 * div64_ul(CLOCK_DIV_BY_256 * MICRO, priv->oscclk_rate);

"MICRO" is 1000000UL, and CLOCK_DIV_BY_256 is 256, making this 256000000 which fits
into 32 bit. oscclk_rate is unsigned long. Please explain the need for using div64_ul(),
because I don't see it.

Besides that, please explain the benefit of storing "delay" in a static variable
instead of calculating it with oscclk_rate and storing it in struct rzv2h_wdt_priv.
This should better be a good explanation because it is very unlikely that I'll accept
the code as written.

> +	udelay(delay);
> +
> +	return 0;
> +}
> +
> +static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	writew(wdtcr, priv->base + WDTCR);
> +
> +	writeb(0, priv->base + WDTRCR);
> +
> +	writew(0, priv->base + WDTSR);
> +}
> +
> +static int rzv2h_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	udelay(5);
> +
> +	ret = pm_runtime_resume_and_get(wdev->parent);
> +	if (ret) {
> +		reset_control_assert(priv->rstc);
> +		return ret;
> +	}
> +
> +	/*
> +	 * WDTCR
> +	 * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
> +	 * - RPSS[13:12] - Window Start Position Select - 11b: 100%
> +	 * - RPES[9:8] - Window End Position Select - 11b: 0%
> +	 * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh)
> +	 */
> +	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
> +			WDTCR_RPES_0 | WDTCR_TOPS_16384);
> +
> +	rzv2h_wdt_ping(wdev);
> +

The need to ping the watchdog immediately after enabling it is unusual.
Please explain.

> +	return 0;
> +}
> +
> +static int rzv2h_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret = pm_runtime_put(wdev->parent);
> +	if (ret < 0)
> +		return ret;

Shouldn't this be called _after_ stopping the watchdog ?

> +
> +	return reset_control_assert(priv->rstc);
> +}
> +
> +static const struct watchdog_info rzv2h_wdt_ident = {
> +	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +	.identity = "Renesas RZ/V2H WDT Watchdog",
> +};
> +
> +static int rzv2h_wdt_restart(struct watchdog_device *wdev,
> +			     unsigned long action, void *data)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	/* delay to handle clock halt after de-assert operation */
> +	udelay(5);
> +
> +	ret = clk_enable(priv->pclk);
> +	if (ret) {
> +		reset_control_assert(priv->rstc);
> +		return ret;
> +	}
> +
> +	ret = clk_enable(priv->oscclk);
> +	if (ret) {
> +		clk_disable(priv->pclk);
> +		reset_control_assert(priv->rstc);
> +		return ret;
> +	}
> +
Please explain the need for enabling the clocks here.

> +	/*
> +	 * WDTCR
> +	 * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
> +	 * - RPSS[13:12] - Window Start Position Select - 00b: 25%
> +	 * - RPES[9:8] - Window End Position Select - 00b: 75%
> +	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
> +	 */
> +	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
> +			WDTCR_RPES_75 | WDTCR_TOPS_1024);
> +	rzv2h_wdt_ping(wdev);
> +
Why is the ping here necessary ?

> +	/* wait for underflow to trigger... */
> +	mdelay(500);

Does that really take 500 ms ?

> +
> +	return 0;


> +}
> +
> +static const struct watchdog_ops rzv2h_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = rzv2h_wdt_start,
> +	.stop = rzv2h_wdt_stop,
> +	.ping = rzv2h_wdt_ping,
> +	.restart = rzv2h_wdt_restart,
> +};
> +
> +static int rzv2h_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzv2h_wdt_priv *priv;
> +	unsigned long rate;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->pclk = devm_clk_get_prepared(&pdev->dev, "pclk");
> +	if (IS_ERR(priv->pclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->pclk), "no pclk");
> +
> +	priv->oscclk = devm_clk_get_prepared(&pdev->dev, "oscclk");
> +	if (IS_ERR(priv->oscclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->oscclk), "no oscclk");
> +
> +	priv->oscclk_rate = clk_get_rate(priv->oscclk);
> +	if (!priv->oscclk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
> +
> +	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, 16383NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +				     "failed to get cpg reset");
> +
> +	rate = priv->oscclk_rate / 256;
> +	priv->wdev.max_hw_heartbeat_ms = (1000 * 16383) / rate;

Not accounting to rounding, this translates to
		= (1000 * 16383) / (clk_rate / 256)
		= (1000 * 16383 * 256) / clk_rate

Why the added complexity ?

Also, what is the value of storing oscclk_rate instead of the calculated delay
in the private data structure ?

> +	dev_dbg(dev, "max hw timeout of %dms\n",
> +		priv->wdev.max_hw_heartbeat_ms);
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	priv->wdev.min_timeout = 1;
> +	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
> +	priv->wdev.info = &rzv2h_wdt_ident;
> +	priv->wdev.ops = &rzv2h_wdt_ops;
> +	priv->wdev.parent = dev;
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout invalid, using default");
> +
> +	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> +}
> +
> +static const struct of_device_id rzv2h_wdt_ids[] = {
> +	{ .compatible = "renesas,r9a09g057-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2h_wdt_ids);
> +
> +static struct platform_driver rzv2h_wdt_driver = {
> +	.driver = {
> +		.name = "rzv2h_wdt",
> +		.of_match_table = rzv2h_wdt_ids,
> +	},
> +	.probe = rzv2h_wdt_probe,
> +};
> +module_platform_driver(rzv2h_wdt_driver);
> +MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/V2H(P) WDT Watchdog Driver");


