Return-Path: <linux-watchdog+bounces-4388-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D52BDA47D
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 17:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 172D9501295
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678E62F5339;
	Tue, 14 Oct 2025 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCZxAo6G"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFD22BE65B
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454615; cv=none; b=s0yppBOqt9b1SA+iZxCVR0P7s3OdVu8vB+9KVfH/3g9Z3OtjYoHRFk6Gyr1/6hzs2ck/FusKYhd7GKGTqzLGiZ8KMJF4XmK7we8q3oxDXer4x3HOU3ebak4F2z7QAgZxqVDgE1mBvcpQ1Imj0aVawJqHE+wm5iJhGiwb6XmJY4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454615; c=relaxed/simple;
	bh=UJlDeUihlMJvrHmNrfgrqSjaykrXCFiaTQfMEA9Ke74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iATO/85er2i902RI6drSjD+wIc7KFUxP/vgpXg7xY1x68l/bSj7F6QxSeeYTfqTofX3f2i/W86EF//bx1f90PCGtwEKMKCqYDf01OKwI5iaI6hDb146WaTpOxMcRUCd2lacotgOfzYXeR8mf73KMG1kvznEu12eEe281JojnZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCZxAo6G; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso4909333a91.0
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454613; x=1761059413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ8ZPh70/mJpLj0YE5LwnBF9XoWtiAj7tI41cmy0aqA=;
        b=fCZxAo6GUC7C8ZgnOhnR9HiIEPQmGHER0u7/uExz4CXsWa3NN5BWS84aRG6T1fpedj
         ZU2mtDP1vBrs9qfgRT2ktXB3r5MBR8BA6qcljjPtAS5O52ZWXdPQlAbzuQha5YcYOARv
         SuxMzhZNoVHOGlaE2TmfXD9aEprJN8bzARVqk6fbmQ5cFvNlTiB0ARMH0IACt6dAmzb7
         o+4CM1nE53ush+BUCUl49S8c7+8hD0k9Wp4MgpV7c7Outp6tl8bNkT8PmfXNxI3xn4Mr
         MW+wSTiUwBsuKwOnj2jegYoe7qMOoZV3XVSCgvcDkLnhb72ROWIcXye+hf6UfmEhyEjG
         +qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454613; x=1761059413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ8ZPh70/mJpLj0YE5LwnBF9XoWtiAj7tI41cmy0aqA=;
        b=WkqMPE0+uNeDH4PU7IQ49sX9Muk4I4/YvmwhdUtFWyAHu0iwAYgntG8bpkD3h5ZQQE
         4CHwqMklA095FcmRq7ll+reIpGsSuGF1dBX2z+c6wcMKhYUYC/g6oqbU4KXQGaBPOX4J
         jfmoDHL65yw82mSAoFpmz+4VDigqunk1TcpOpVUf7NGce/xgOEbgJl5KZuUJ2I6sLO8i
         I2emuTyIU9Elgy08PkjAfEukOsp9LGb1rKb2Up8fbC9iEcDpB8D95DcCMjNTecI7lIuP
         p7Yi4tn2wXFqxXhVfrZ0QFmTxPu4oQ2wP5L7xpBA/GuNgfIfuXKxLR/vVlDl+Q+ojGYt
         kc4w==
X-Forwarded-Encrypted: i=1; AJvYcCVXuoFrVa00nK8U3nyfjn/HI5pnOm/V8BcI64zjPtyzgr6zlJBvjVuaBTzU0GGO7Fc6r9cH2VJHeQyv9T1X8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWGNJ2XMqR9Njc5EOgPTW+gkGvUJ6r7iemZIuZX3JmEf51NOW
	HBtJS8T7aOpaS+yxJORl2SDsuiqyeBd3BClxOcDSfzXWt3YNGIMNCoVo
X-Gm-Gg: ASbGnctUn5HYL5EKjXfCNkeXyV0ebXl2fn0ubUThvz4iFhJriZ67HYaJwve9lh8Dq5C
	BBx9RHayP3IyAU5z/ERgo/AoOQOqlOUHzWJNq/iRX0qsO646hsAlbBuhC7KvjShcHYwYyTk52Fp
	Pi9oruO81bGjdUJT9L7QXyB+Z5w0K1x7YCXgzWWpp3aDgpWlMEM9GtUhXR7ehKby+OCcjj8hfOH
	/ejtUgwUF4W4BqyiUD544hY7vVMEzmVGdgH/jop6oHPeo8e1ciQ5JsCxcRYtHnNGTvu3pL/HZk9
	oh3j1u1EqUomcWvzHGwnBD217ZPQTVgO55i9Es+h7YrzubALvAvkOoDCCcfWkHOtuzMg6qutmFY
	/p77797SkEESC8ICrE78W58nUSRpL6+VAMrWLB0Paj8PJ2pny5PcRGBfEuNMd6ZRb42gJFkWEJ3
	Od60KUGZ8Z6fJY5g==
X-Google-Smtp-Source: AGHT+IFVOt/cHWI56wnImijvXKgvUtR35jCcMT32W1rlMP0piEdWnmn34RqKHc7eQN8Tm1rvjCjmsg==
X-Received: by 2002:a17:90b:4a45:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-33b5111731amr34514049a91.3.1760454609928;
        Tue, 14 Oct 2025 08:10:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aabbe8sm16264509a91.12.2025.10.14.08.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 08:10:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9c1a61f6-f9aa-40b8-9578-adf0e443d790@roeck-us.net>
Date: Tue, 14 Oct 2025 08:10:08 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: renesas_wwdt: add driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org
References: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
 <20251014112953.25712-6-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251014112953.25712-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/25 04:29, Wolfram Sang wrote:
> This driver adds support for the Renesas Window Watchdog Timer (WWDT).
> Because it can only be setup once after boot and we cannot know if this
> already happened in early boot stages, it is mandated that the firmware
> configures the watchdog. Linux then adapts according to the given
> setup. Note that this watchdog only reports an overflow to the Error
> Control Module (ECM) and does not reset the SoC on its own.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> 
> * support not only V4H but all Gen3/4 SoCs having this WWDT
> * update commit message and add introductory comment to explain how
>    this WWDT is handled as a "read-only" device basically
> * dropped pretimeout flag because this feature cannot be configured
>    from userspace
> * added bitfield.h to prevent build failures
> * switched to "GPL" licence string
> * cosmetic updates
> 
>   drivers/watchdog/Kconfig        |   8 ++
>   drivers/watchdog/Makefile       |   1 +
>   drivers/watchdog/renesas_wwdt.c | 163 ++++++++++++++++++++++++++++++++
>   3 files changed, 172 insertions(+)
>   create mode 100644 drivers/watchdog/renesas_wwdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 05008d937e40..792d0d831336 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -969,6 +969,14 @@ config RENESAS_WDT
>   	  This driver adds watchdog support for the integrated watchdogs in the
>   	  Renesas R-Car and other SH-Mobile SoCs (usually named RWDT or SWDT).
>   
> +config RENESAS_WWDT
> +	tristate "Renesas Window WWDT Watchdog"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This driver adds watchdog support for a window timer found in some
> +	  Renesas R-Car Gen3 and later SoCs.
> +
>   config RENESAS_RZAWDT
>   	tristate "Renesas RZ/A WDT Watchdog"
>   	depends on ARCH_RENESAS || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index b680e4d3c1bc..ba52099b1253 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_DIGICOLOR_WATCHDOG) += digicolor_wdt.o
>   obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
>   obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
>   obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
> +obj-$(CONFIG_RENESAS_WWDT) += renesas_wwdt.o
>   obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
>   obj-$(CONFIG_RENESAS_RZN1WDT) += rzn1_wdt.o
>   obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
> diff --git a/drivers/watchdog/renesas_wwdt.c b/drivers/watchdog/renesas_wwdt.c
> new file mode 100644
> index 000000000000..0f56f5c7e407
> --- /dev/null
> +++ b/drivers/watchdog/renesas_wwdt.c
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the Renesas Window Watchdog Timer (WWDT)
> + *
> + * The WWDT can only be setup once after boot. Because we cannot know if this
> + * already happened in early boot stages, it is mandated that the firmware
> + * configures the watchdog. Linux then adapts according to the given setup.

What if it didn't happen ? Is WDTA0OVF set to a reasonable default in that case ?

> + * Note that this watchdog only reports an overflow to the Error Control Module.

Kind of unusual. Why not panic in that case, and why have the watchdog in the first
place ?

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define WDTA0WDTE	0x00
> +#define WDTA0RUN	BIT(7)
> +#define WDTA0_KEY	0x2c
> +
> +#define WDTA0MD		0x0c
> +#define WDTA0OVF(x)	FIELD_GET(GENMASK(6, 4), x)
> +#define WDTA0WIE	BIT(3)
> +#define WDTA0ERM	BIT(2)
> +#define WDTA0WS(x)	FIELD_GET(GENMASK(1, 0), x)
> +
> +struct wwdt_priv {
> +	void __iomem *base;
> +	struct watchdog_device wdev;
> +};
> +
> +static int wwdt_start(struct watchdog_device *wdev)
> +{
> +	struct wwdt_priv *priv = watchdog_get_drvdata(wdev);
> +
Maybe use container_of() ?

> +	writeb(WDTA0RUN | WDTA0_KEY, priv->base + WDTA0WDTE);
> +	return 0;
> +}
> +
> +static const struct watchdog_info wwdt_ident = {
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_ALARMONLY,
> +	.identity = "Renesas Window Watchdog",
> +};
> +
> +static const struct watchdog_ops wwdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = wwdt_start,
> +};
> +
> +static irqreturn_t wwdt_error_irq(int irq, void *dev_id)
> +{
> +	struct device *dev = dev_id;
> +
> +	dev_warn(dev, "Watchdog timed out\n");

So the pretimeout may trigger a reboot (panic) if the pretimeout
governor is set to it, but the real watchdog just says Hi.
Does that really make sense ?

> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t wwdt_pretimeout_irq(int irq, void *dev_id)
> +{
> +	struct watchdog_device *wdev = dev_id;
> +
> +	watchdog_notify_pretimeout(wdev);
> +	return IRQ_HANDLED;
> +}
> +
> +static int wwdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct wwdt_priv *priv;
> +	struct watchdog_device *wdev;
> +	struct clk *clk;
> +	unsigned long rate;
> +	unsigned int interval, window_size;
> +	int ret;
> +	u8 val;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	clk = devm_clk_get(dev, "cnt");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	rate = clk_get_rate(clk);
> +	if (!rate)
> +		return -EINVAL;
> +
> +	wdev = &priv->wdev;
> +
> +	val = readb(priv->base + WDTA0WDTE);
> +	if (val & WDTA0RUN)
> +		set_bit(WDOG_HW_RUNNING, &wdev->status);
> +
> +	val = readb(priv->base + WDTA0MD);
> +	interval = 1 << (9 + WDTA0OVF(val));
> +	/* size of the closed(!) window per mille */
> +	window_size = 250 * (3 - WDTA0WS(val));
> +
> +	wdev->info = &wwdt_ident;
> +	wdev->ops = &wwdt_ops;
> +	wdev->parent = dev;
> +	wdev->min_hw_heartbeat_ms = window_size * interval / rate;
> +	wdev->max_hw_heartbeat_ms = 1000 * interval / rate;
> +	wdev->timeout = DIV_ROUND_UP(wdev->max_hw_heartbeat_ms, 1000);
> +
> +	watchdog_set_drvdata(wdev, priv);
> +	watchdog_set_nowayout(wdev, true);
> +
> +	if (!(val & WDTA0ERM)) {
> +		ret = platform_get_irq_byname(pdev, "error");
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_error_irq,
> +						IRQF_ONESHOT, NULL, dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (val & WDTA0WIE) {
> +		ret = platform_get_irq_byname(pdev, "pretimeout");
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_pretimeout_irq,
> +						IRQF_ONESHOT, NULL, wdev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	devm_watchdog_register_device(dev, wdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id renesas_wwdt_ids[] = {
> +	{ .compatible = "renesas,rcar-gen3-wwdt", },
> +	{ .compatible = "renesas,rcar-gen4-wwdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, renesas_wwdt_ids);
> +
> +static struct platform_driver renesas_wwdt_driver = {
> +	.driver = {
> +		.name = "renesas_wwdt",
> +		.of_match_table = renesas_wwdt_ids,
> +	},
> +	.probe = wwdt_probe,
> +};
> +module_platform_driver(renesas_wwdt_driver);
> +
> +MODULE_DESCRIPTION("Renesas Window Watchdog (WWDT) Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Wolfram Sang <wsa+renesas@sang-engineering.com>");


