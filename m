Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1344226F56D
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Sep 2020 07:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgIRFpM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Sep 2020 01:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgIRFpL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Sep 2020 01:45:11 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5066C06174A;
        Thu, 17 Sep 2020 22:45:11 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id s17so1161346ooe.6;
        Thu, 17 Sep 2020 22:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YPjK/x/SddhnfR7LKitgrGhtW1DKJMelig3osvTD0Jw=;
        b=TLYo9gQapiiVSYeXWTcWDxRkg4bzkuXDkdgzw9hFLYkjWeeZyZzl1WbR3nqdqzH6et
         ONL4XvJsdnpRZLLyTEBzf03KxonJ8LA+uki4iPQW+hIcU2M+Ue++opNk+ez52VQGn5w+
         iNWbF11FvRxKrHSSIxIL4ojYwerDYtlIYhIb29gzQ2ZODZ5ZAkvnd5Ouga687uwNxl+G
         8qqSOfUUBJfkvDW9BwWKoCJEv3xauCiZfn0dVj5e8OS5K8Q7s487LzItHikYBtwZlRxO
         v8RqCKKIWrV+Z7WsZNnCq4IhaIm1qfPt7ZzRSA48E+TJsm+ZxbOe3W2DDQxdKRAOOj8y
         16gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YPjK/x/SddhnfR7LKitgrGhtW1DKJMelig3osvTD0Jw=;
        b=koPulDOG8AuyaUkeb/4gR5nQ92VpmiRdB9nD1o6WF4HxV0wpVKX2Y6zbqHHE3cRnfu
         gv1dt74VKEFVy09AAf0bREyRHZnAcDCfFBFuQfIC1I190OXpH+hyY+YEU48qoqqxoMTU
         Hk0/nw1M1pfQ+9Nm96XRSjcnZWhMxCtWLNt4fWNt2kyIqanEKB24KL7kycPFagD4R7gS
         5r+9etoym9eP8i5ljFJdT5gURE7W7NOz4z136Qn+xBhKwNTA4JnsLlT2YyWMDWeq45NH
         xWdYkwYanp5E3aHEPmyps5dVraqMydBXyiazNgu/3o0ckAQLYC3CM/hJwlRCZFissuVb
         82VA==
X-Gm-Message-State: AOAM533fogtdd0r3jCXPi7r2VoVFbiUbHmcTW8lO+RfpI/lLGBb9+sDT
        OqTdlwFqMtP02vUeKhlrZ3cig0udTS0=
X-Google-Smtp-Source: ABdhPJx/cU4dx48gxmF0lFI7e3oEvXIo4G+332d+LV4mTgCNtdM3nz2qGD81wSU3YKsupaWVsNiHHg==
X-Received: by 2002:a4a:d38c:: with SMTP id i12mr23069595oos.81.1600407910614;
        Thu, 17 Sep 2020 22:45:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 34sm1505159otg.23.2020.09.17.22.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 22:45:10 -0700 (PDT)
Subject: Re: [PATCH v1 4/6] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
 <1993b8516fefd3d8ea16e926c4db379b89ae4096.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2683bcbd-7ff2-f451-2e6c-79a2ff9e69ea@roeck-us.net>
Date:   Thu, 17 Sep 2020 22:45:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1993b8516fefd3d8ea16e926c4db379b89ae4096.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/17/20 1:03 AM, Matti Vaittinen wrote:
> Add Watchdog support for ROHM BD9576MUF and BD9573MUF PMICs which are
> mainly used to power the R-Car series processors. The watchdog is
> pinged using a GPIO and enabled using another GPIO. Additionally
> watchdog time-out can be configured to HW prior starting the watchdog.
> Watchdog timeout can be configured to detect only delayed ping or in
> a window mode where also too fast pings are detected.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/watchdog/Kconfig      |  13 ++
>  drivers/watchdog/Makefile     |   1 +
>  drivers/watchdog/bd9576_wdt.c | 295 ++++++++++++++++++++++++++++++++++
>  3 files changed, 309 insertions(+)
>  create mode 100644 drivers/watchdog/bd9576_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index ab7aad5a1e69..d042a517a946 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -172,6 +172,19 @@ config BD70528_WATCHDOG
>  	  Alternatively say M to compile the driver as a module,
>  	  which will be called bd70528_wdt.
>  
> +config BD957XMUF_WATCHDOG
> +	tristate "ROHM BD9576MUF and BD9573MUF PMIC Watchdog"
> +	depends on MFD_ROHM_BD957XMUF
> +	select WATCHDOG_CORE
> +	help
> +	  Support for the watchdog in the ROHM BD9576 and BD9573 PMICs.
> +	  These PMIC ICs contain watchdog block which can be configured
> +	  to toggle reset line if SoC fails to ping watchdog via GPIO.
> +
> +	  Say Y here to include support for the ROHM BD9576 or BD9573
> +	  watchdog. Alternatively say M to compile the driver as a module,
> +	  which will be called bd9576_wdt.
> +
>  config DA9052_WATCHDOG
>  	tristate "Dialog DA9052 Watchdog"
>  	depends on PMIC_DA9052 || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 97bed1d3d97c..14d75f98e3df 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -208,6 +208,7 @@ obj-$(CONFIG_XEN_WDT) += xen_wdt.o
>  
>  # Architecture Independent
>  obj-$(CONFIG_BD70528_WATCHDOG) += bd70528_wdt.o
> +obj-$(CONFIG_BD957XMUF_WATCHDOG) += bd9576_wdt.o
>  obj-$(CONFIG_DA9052_WATCHDOG) += da9052_wdt.o
>  obj-$(CONFIG_DA9055_WATCHDOG) += da9055_wdt.o
>  obj-$(CONFIG_DA9062_WATCHDOG) += da9062_wdt.o
> diff --git a/drivers/watchdog/bd9576_wdt.c b/drivers/watchdog/bd9576_wdt.c
> new file mode 100644
> index 000000000000..917c8c7ddeb1
> --- /dev/null
> +++ b/drivers/watchdog/bd9576_wdt.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 ROHM Semiconductors
> + *
> + * ROHM BD9576MUF and BD9573MUF Watchdog driver
> + */
> +
> +#include <linux/err.h>
> +#include <linux/delay.h>

Alphabetic include file order please.

> +#include <linux/mfd/rohm-bd957x.h>
> +#include <linux/module.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/watchdog.h>
> +
> +static bool nowayout;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +		"Watchdog cannot be stopped once started (default=\"false\")");
> +
> +#define HW_MARGIN_MIN 2
> +#define HW_MARGIN_MAX 4416
> +#define BD957X_WDT_DEFAULT_MARGIN 4416
> +
> +struct bd9576_wdt_priv {
> +	struct gpio_desc	*gpiod_ping;
> +	struct gpio_desc	*gpiod_en;
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	bool			always_running;
> +	struct watchdog_device	wdd;
> +};
> +
> +static void bd9576_wdt_disable(struct bd9576_wdt_priv *priv)
> +{
> +	gpiod_set_value_cansleep(priv->gpiod_en, 0);
> +}
> +
> +static int bd9576_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct bd9576_wdt_priv *priv = watchdog_get_drvdata(wdd);
> +
> +	/* Pulse */
> +	gpiod_set_value_cansleep(priv->gpiod_ping, 1);
> +	gpiod_set_value_cansleep(priv->gpiod_ping, 0);
> +
> +	return 0;
> +}
> +
> +static int bd9576_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct bd9576_wdt_priv *priv = watchdog_get_drvdata(wdd);
> +
> +	gpiod_set_value_cansleep(priv->gpiod_en, 1);
> +
> +	return bd9576_wdt_ping(wdd);
> +}
> +
> +static int bd9576_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct bd9576_wdt_priv *priv = watchdog_get_drvdata(wdd);
> +
> +	if (!priv->always_running)
> +		bd9576_wdt_disable(priv);
> +	else
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info bd957x_wdt_ident = {
> +	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
> +			  WDIOF_SETTIMEOUT,
> +	.identity	= "BD957x Watchdog",
> +};
> +
> +static const struct watchdog_ops bd957x_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= bd9576_wdt_start,
> +	.stop		= bd9576_wdt_stop,
> +	.ping		= bd9576_wdt_ping,
> +};
> +
> +/* Unit is hundreds of uS */
> +#define FASTNG_MIN 23
> +
> +static int find_closest_fast(int target, int *sel, int *val)
> +{
> +	int i;
> +	int window = FASTNG_MIN;
> +
> +	for (i = 0; i < 8 && window < target; i++)
> +		window <<= 1;
> +
> +	*val = window;
> +	*sel = i;
> +
> +	if (i == 8)
> +		return -EINVAL;
> +
> +	return 0;
> +
> +}
> +
> +static int find_closest_slow_by_fast(int fast_val, int target, int *slowsel)
> +{
> +	int sel;
> +	static const int multipliers[] = {2, 3, 7, 15};
> +
> +	for (sel = 0; sel < ARRAY_SIZE(multipliers) &&
> +	     multipliers[sel] * fast_val < target; sel++)
> +		;
> +
> +	if (sel == ARRAY_SIZE(multipliers))
> +		return -EINVAL;
> +
> +	*slowsel = sel;
> +
> +	return 0;
> +}
> +
> +static int find_closest_slow(int target, int *slow_sel, int *fast_sel)
> +{
> +	static const int multipliers[] = {2, 3, 7, 15};
> +	int i, j;
> +	int val = 0;
> +	int window = FASTNG_MIN;
> +
> +	for (i = 0; i < 8; i++) {
> +		for (j = 0; j < ARRAY_SIZE(multipliers); j++) {
> +			int slow;
> +
> +			slow = window * multipliers[j];
> +			if (slow >= target && (!val || slow < val)) {
> +				val = slow;
> +				*fast_sel = i;
> +				*slow_sel = j;
> +			}
> +		}
> +		window <<= 1;
> +	}
> +	if (!val)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +#define BD957X_WDG_TYPE_WINDOW BIT(5)
> +#define BD957X_WDG_TYPE_SLOW 0
> +#define BD957X_WDG_TYPE_MASK BIT(5)
> +#define BD957X_WDG_NG_RATIO_MASK 0x18
> +#define BD957X_WDG_FASTNG_MASK 0x7
> +
> +static int bd957x_set_wdt_mode(struct bd9576_wdt_priv *priv, int hw_margin,
> +			       int hw_margin_min)
> +{
> +	int ret, fastng, slowng, type, reg, mask;
> +	struct device *dev = priv->dev;
> +
> +	/* convert to 100uS */
> +	hw_margin *= 10;
> +	hw_margin_min *= 10;
> +	if (hw_margin_min) {
> +		int min;
> +
> +		type = BD957X_WDG_TYPE_WINDOW;
> +		dev_dbg(dev, "Setting type WINDOW 0x%x\n", type);
> +		ret = find_closest_fast(hw_margin_min, &fastng, &min);
> +		if (ret) {
> +			dev_err(dev, "bad WDT window for fast timeout\n");
> +			return ret;
> +		}
> +
> +		ret = find_closest_slow_by_fast(min, hw_margin, &slowng);
> +		if (ret) {
> +			dev_err(dev, "bad WDT window\n");
> +			return ret;
> +		}
> +
> +	} else {
> +		type = BD957X_WDG_TYPE_SLOW;
> +		dev_dbg(dev, "Setting type SLOW 0x%x\n", type);
> +		ret = find_closest_slow(hw_margin, &slowng, &fastng);
> +		if (ret) {
> +			dev_err(dev, "bad WDT window\n");
> +			return ret;
> +		}
> +	}
> +
> +	slowng <<= ffs(BD957X_WDG_NG_RATIO_MASK) - 1;
> +	reg = type | slowng | fastng;
> +	mask = BD957X_WDG_TYPE_MASK | BD957X_WDG_NG_RATIO_MASK |
> +	       BD957X_WDG_FASTNG_MASK;
> +	ret = regmap_update_bits(priv->regmap, BD957X_REG_WDT_CONF,
> +				 mask, reg);
> +
> +	return ret;
> +}
> +
> +static int bd9576_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->parent->of_node;
> +	struct bd9576_wdt_priv *priv;
> +	u32 hw_margin, hw_margin_min;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->dev = dev;
> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!priv->regmap) {
> +		dev_err(dev, "No regmap found\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->gpiod_en = devm_gpiod_get_from_of_node(dev, dev->parent->of_node,
> +						     "rohm,watchdog-enable-gpios",
> +						     0, GPIOD_OUT_LOW,
> +						     "watchdog-enable");
> +	if (IS_ERR(priv->gpiod_en)) {

devm_gpiod_get_from_of_node() can return -EPROBE_DEFER in which case we don't want to see
an error message. I would suggest to use dev_err_probe().

> +		dev_err(dev, "getting watchdog-enable GPIO failed\n");
> +		return PTR_ERR(priv->gpiod_en);
> +	}
> +
> +	priv->gpiod_ping = devm_gpiod_get_from_of_node(dev, dev->parent->of_node,
> +						     "rohm,watchdog-ping-gpios",
> +						     0, GPIOD_OUT_LOW,
> +						     "watchdog-ping");
> +	if (IS_ERR(priv->gpiod_ping)) {
> +		dev_err(dev, "getting watchdog-ping GPIO failed\n");
> +		return PTR_ERR(priv->gpiod_ping);
> +	}

Same as above.

> +
> +	ret = of_property_read_u32(np,
> +				   "hw_margin_ms", &hw_margin);

Line splits are arbitrary. Why is this "hw_margin_ms" and not "rohm,hw_margin_ms" ?

> +	if (ret) {
> +		if (ret != -EINVAL)
> +			return ret;
> +
> +		hw_margin = BD957X_WDT_DEFAULT_MARGIN;
> +	}
> +
> +	ret = of_property_read_u32(np, "rohm,hw-margin-min-ms", &hw_margin_min);
> +	if (ret == -EINVAL)
> +		hw_margin_min = 0;
> +	else if (ret)
> +		return ret;

Please use a single mechanism to handle -EINVAL after of_property_read_u32().

> +
> +	ret = bd957x_set_wdt_mode(priv, hw_margin, hw_margin_min);
> +	if (ret)
> +		return ret;
> +
> +	priv->always_running = of_property_read_bool(np,
> +						     "always-running");

Another arbitrary line split.

> +
> +	watchdog_set_drvdata(&priv->wdd, priv);
> +
> +	priv->wdd.info			= &bd957x_wdt_ident;
> +	priv->wdd.ops			= &bd957x_wdt_ops;
> +	priv->wdd.min_hw_heartbeat_ms	= hw_margin_min;
> +	priv->wdd.max_hw_heartbeat_ms	= hw_margin;
> +	priv->wdd.parent		= dev;
> +	priv->wdd.timeout		= (hw_margin / 2) * 1000;
> +
> +	watchdog_init_timeout(&priv->wdd, 0, dev);
> +	watchdog_set_nowayout(&priv->wdd, nowayout);
> +
> +	watchdog_stop_on_reboot(&priv->wdd);
> +
> +	if (priv->always_running)
> +		bd9576_wdt_start(&priv->wdd);
> +
> +	return devm_watchdog_register_device(dev, &priv->wdd);
> +}
> +
> +static struct platform_driver bd9576_wdt_driver = {
> +	.driver	= {
> +		.name		= "bd9576-wdt",
> +	},
> +	.probe	= bd9576_wdt_probe,
> +};
> +
> +module_platform_driver(bd9576_wdt_driver);
> +
> +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
> +MODULE_DESCRIPTION("ROHM BD9576/BD9573 Watchdog driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:bd9576-wdt");
> 

