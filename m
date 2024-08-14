Return-Path: <linux-watchdog+bounces-1496-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C949525F8
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2024 00:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627A91F21BE2
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 22:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27861148312;
	Wed, 14 Aug 2024 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzGu+Kz5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C714B06E;
	Wed, 14 Aug 2024 22:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723675825; cv=none; b=bLaXdu/QoFe/a8KrorAXUvsAP9XaR1NSeGWpL30fs9v68+OAfHeR72YFQMB82qGIMuA8STv2RDfNjC4jNwgpZFSGqAqKJqI0hd5JSgrzq0qKuh38ebZ8IHj2aUOjTUSujA9Ktg3WGvAv2TfxYWp9krFc+XLniPgeXrncegG6kpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723675825; c=relaxed/simple;
	bh=zquBvAvsFQsKrozEZcAiyh1KiRzsQP/yYuP3pSAlFkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYinDbV1SQMo1H1wCIKRr96Q6oJSQfaM4uSwRLscc58uviVzBO285z3jB5LYGsgnNfBIZuyhiJkVK96OWxtXmjcfnYWxFo/SrFPt2/6VWudVxeO9K/C/541KqteO+QdVeVaes57VC8MOb8WGH84qVXefpeC/CSO0WttbWNa/nyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzGu+Kz5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-710ffaf921fso234492b3a.1;
        Wed, 14 Aug 2024 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723675821; x=1724280621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iSzmd61qQM4csnE7p3AoX9Ns/I0hmbwyvBQsKp2CJi8=;
        b=MzGu+Kz5j7TcHnT2prcc+Ng1eQsiQMD4RzXtevdgk2ER63sTA781lZ11T6bCNHmsnP
         G0u3Fr3hcnDmdMKgU5m+4qtXirlASpuxh2v9LFQC1Qn3C1ywDs090h55u+EExBGaUqF/
         IrjfSLJWAFe5xc4xilQLifiF9zmctY4XKahMmLh1KEYcKE5PDNC7+os0tFyGMpt1JuXH
         WDFHQ11gt/NJkTxKsDzAitHszHkcV/Pyl01J0aSCn6vlvQwK5c/yqPJ3eUpxMrqRXZ0z
         TKrjfQ1NK6R/x6JrV9E3PLco7kyrYZrWql4S4U/kPVASpFNw8uS7IxsMBLYndb8BscEU
         /PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723675821; x=1724280621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSzmd61qQM4csnE7p3AoX9Ns/I0hmbwyvBQsKp2CJi8=;
        b=HqR1QRigbapJp4zMsYvysK56o+UAZC+5ycA1vghcFTDIDphvSSCU2zr7S2dPGSmw7V
         IOF5TWj2IyYNlGl61WHKuQz2Ryst7Z+u9Io8ke0nMymKfhwrmvD7nWxJLh9N4R1vhRBQ
         PXqy92KTCaw7LXHqI08snxJota1/YoLhldn8tWNwzFuvFdKK8LVREZHa1hlo96rDJquh
         YdHb4EGLSdiqfwXkDlb2y8lZ/rkWINWHZdxbslCRTC4xD4NPkyHyken9JPsUV3Hg+qYu
         +ipyGtMd3qhUTh7WMVbOp5EPcjftQ+/ssjb6ds3u6U0qAL2LDixaJld3Jm54B6p+bKcU
         7MbA==
X-Forwarded-Encrypted: i=1; AJvYcCVPeRV5aj48VkRUTND1DXnjVtO++uWZ9uUc3a8whqAJD9LzLXlQeOYE6KxJsAmL0SEuf8iDj2jBzq07OarEAfoetrt5VjKtmvLEOwmTGonzGQGiM96JIoIiYCdFuS/+R+JjSdd11uATW32m+1BpQv8MJ9X91IvNW0ndrIgvr3F8Pot5u099jRMRIDVVIe2KpQ==
X-Gm-Message-State: AOJu0Yzi9byRXbvUIa2TMaWC5j0OsmttrqvZZhDwzUAiEL+n81MKbe8q
	RPHxwAyHam00pho0rqkiBXteyrWKc3EtRXe1LwV9IzYq3QddUdW/
X-Google-Smtp-Source: AGHT+IER+dqv34po/0AVf/YTdvWtj/itj5iT6jKy8zeI95AmUYvYnz8ub4JNL+NlucZhPZQuJQbL2Q==
X-Received: by 2002:a05:6a00:94a5:b0:70d:2b95:e3c4 with SMTP id d2e1a72fcca58-71276efc96cmr1859847b3a.5.1723675820653;
        Wed, 14 Aug 2024 15:50:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aefa34asm78701b3a.110.2024.08.14.15.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 15:50:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6d76a32d-c483-46e3-923e-34d1cee3ab9a@roeck-us.net>
Date: Wed, 14 Aug 2024 15:50:18 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
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
References: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240806210623.183842-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240806210623.183842-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/24 14:06, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add Watchdog Timer driver for RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v3->v4
> - Turn on the clocks first before reset operation in start & restart callbacks
> - Added checks in restart callback before turning ON clocks/resets
> - Dropped udelay after every ping operation
> - Added comments
> - Simplified calculation of max_hw_heartbeat_ms
> 
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
>   drivers/watchdog/rzv2h_wdt.c | 272 +++++++++++++++++++++++++++++++++++
>   3 files changed, 282 insertions(+)
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
> index 000000000000..2da7a631fb2a
> --- /dev/null
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) WDT Watchdog Driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corporation.
> + */
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
> +#define WDTRR			0x00	/* WDT Refresh Register RW, 8  */
> +#define WDTCR			0x02	/* WDT Control Register RW, 16 */
> +#define WDTSR			0x04	/* WDT Status Register RW, 16 */
> +#define WDTRCR			0x06	/* WDT Reset Control Register RW, 8  */
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
> +#define MAX_TIMEOUT_CYCLES	16384
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
> +};
> +
> +static int rzv2h_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	/*
> +	 * The down-counter is refreshed and starts counting operation on
> +	 * a write of the values 00h and FFh to the WDTRR register.
> +	 */
> +	writeb(0x0, priv->base + WDTRR);
> +	writeb(0xFF, priv->base + WDTRR);
> +
> +	return 0;
> +}
> +
> +static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	/* Configure the timeout, clock division ratio, and window start and end positions. */
> +	writew(wdtcr, priv->base + WDTCR);
> +
> +	/* Enable interrupt output to the ICU. */
> +	writeb(0, priv->base + WDTRCR);
> +
> +	/* Clear underflow flag and refresh error flag. */
> +	writew(0, priv->base + WDTSR);
> +}
> +
> +static int rzv2h_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(wdev->parent);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret) {
> +		pm_runtime_put(wdev->parent);
> +		return ret;
> +	}
> +
> +	/* delay to handle clock halt after de-assert operation */
> +	udelay(3);
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
> +	/*
> +	 * Down counting starts after writing the sequence 00h -> FFh to the
> +	 * WDTRR register. Hence, call the ping operation after loading the counter.
> +	 */
> +	rzv2h_wdt_ping(wdev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct rzv2h_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	int ret;
> +
> +	ret = reset_control_assert(priv->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_put(wdev->parent);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
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
> +	if (!watchdog_active(wdev)) {
> +		ret = clk_enable(priv->pclk);
> +		if (ret)
> +			return ret;
> +
> +		ret = clk_enable(priv->oscclk);
> +		if (ret) {
> +			clk_disable(priv->pclk);
> +			return ret;
> +		}
> +
> +		ret = reset_control_deassert(priv->rstc);
> +		if (ret) {
> +			clk_disable(priv->oscclk);
> +			clk_disable(priv->pclk);
> +			return ret;
> +		}
> +	} else {
> +		/*
> +		 * Writing to the WDT Control Register (WDTCR) or WDT Reset
> +		 * Control Register (WDTRCR) is possible once between the
> +		 * release from the reset state and the first refresh operation.
> +		 * Therefore, issue a reset if the watchdog is active.
> +		 */
> +		ret = reset_control_reset(priv->rstc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* delay to handle clock halt after de-assert operation */
> +	udelay(3);
> +
> +	/*
> +	 * WDTCR
> +	 * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
> +	 * - RPSS[13:12] - Window Start Position Select - 00b: 25%
> +	 * - RPES[9:8] - Window End Position Select - 00b: 75%
> +	 * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
> +	 */
> +	rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
> +			WDTCR_RPES_75 | WDTCR_TOPS_1024);
> +
> +	rzv2h_wdt_ping(wdev);
> +
> +	/* wait for underflow to trigger... */
> +	udelay(5);
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
> +	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +				     "failed to get cpg reset");
> +
> +	priv->wdev.max_hw_heartbeat_ms = (MILLI * MAX_TIMEOUT_CYCLES * CLOCK_DIV_BY_256) /
> +					 clk_get_rate(priv->oscclk);
> +	dev_dbg(dev, "max hw timeout of %dms\n", priv->wdev.max_hw_heartbeat_ms);
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


