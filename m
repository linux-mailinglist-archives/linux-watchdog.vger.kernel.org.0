Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4578DDF97
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Oct 2019 18:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfJTQ4e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Oct 2019 12:56:34 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36140 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfJTQ4e (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Oct 2019 12:56:34 -0400
Received: by mail-pl1-f196.google.com with SMTP id j11so5356943plk.3;
        Sun, 20 Oct 2019 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rcex/JboAInlscqVZCpIW6IqHsfiGxjimiask7H3qlc=;
        b=GGHLwp7psj07AM6dyMc8By3wlKSsccbFjsjH+YVPyxpVxv6/LLLng9Y/tX9PPR0BwD
         2HSG9OYF0QgVQ2953m7mfwLwKm5fdJnprvwsaqaKf1ydyoB2zsZCF9ajga28Q7eLFaM/
         VRkKrfBpmIr2eWszRHyaRposLw77W6UAl6ppu6+e10uc3vZuLBbOaOXuoBh4MWTMXAoY
         s0+xAmPi/FIT5BMdwTYE64s5WvjjE+8ScDApFKLhAZPNpdZKt4rQxEeZO61Yn8eh+VR/
         wQPOYFwAdrll3dQixMPQx+fF5mzwcBV0waHABn+IC61F7arGioWta5iIlZi9emzG1zMS
         2vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rcex/JboAInlscqVZCpIW6IqHsfiGxjimiask7H3qlc=;
        b=Z2GzLhS1a3X2AYbJ7AI3zBw3TjKwQ+IlQhitkrG6gQVD6pcvYd4TWTD9gOoFDroU0H
         R4gifuk3N31HKXKS5ZF/nknTfItwiK/b/wqqHjCGqHtt6JYWtgadsxrKmrzQ6afXlIHk
         pRqc1jx8FfiTf3oS1MnmGB1mXjKUnU3ND4Q+0NkFl7OR6oFZHrQG5FYNpBbgconQXFI1
         jZ7O5FbvQe/p7CzHfTgHKJxHBmd2TAS21kDtlwZDaI86cLM15t9Np1q4CF+UtnHWS0eH
         A+7CDZAlW3d7KW4BPNubmfn0GzRegfsQnLs9nAXr0zzeCf54sWTwoStX50yOTZmWH6lW
         m4Vg==
X-Gm-Message-State: APjAAAWKsvgc1+ac0efm0RK58NztxfAXH8Lf4Pw+dpCqxQu/TqDc1+3Y
        w37MNqvGod8SZ5rVA7ZdQ8i2UvZM
X-Google-Smtp-Source: APXvYqwm4j5VbVui4amTuHxI5J7SoGnORTayh8+YBRgfmzWrCiUYgEgpboL16LAHH14WkS5wqB9ExA==
X-Received: by 2002:a17:902:8c96:: with SMTP id t22mr19958053plo.290.1571590592734;
        Sun, 20 Oct 2019 09:56:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m22sm13271478pgj.29.2019.10.20.09.56.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 09:56:31 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] watchdog: add meson secure watchdog driver
To:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>, linux-watchdog@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com>
 <1571387622-35132-4-git-send-email-xingyu.chen@amlogic.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7397f6db-1dc8-3abd-41ff-2e47323c7ffa@roeck-us.net>
Date:   Sun, 20 Oct 2019 09:56:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1571387622-35132-4-git-send-email-xingyu.chen@amlogic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/18/19 1:33 AM, Xingyu Chen wrote:
> The watchdog controller on the Meson-A/C series SoCs is moved to secure
> world, watchdog operation needs to be done in secure EL3 mode via ATF,
> Non-secure world can call SMC instruction to trap to AFT for watchdog
> operation.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>   drivers/watchdog/Kconfig         |  17 ++++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/meson_sec_wdt.c | 187 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 205 insertions(+)
>   create mode 100644 drivers/watchdog/meson_sec_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 58e7c10..e84be42 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -826,6 +826,23 @@ config MESON_GXBB_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called meson_gxbb_wdt.
>   
> +config MESON_SEC_WATCHDOG
> +	tristate "Amlogic Meson Secure watchdog support"
> +	depends on MESON_SM
> +	depends on ARCH_MESON || COMPILE_TEST

This dependency is pointless. MESON_SM already depends on ARCH_MESON,
thus specifying "COMPILE_TEST" here adds no value but only
creates confusion.

> +	select WATCHDOG_CORE
> +	help
> +	  The watchdog controller on the Meson-A/C series SoCs is moved to
> +	  secure world, watchdog operation needs to be done in secure EL3
> +	  mode via ATF, non-secure world can call SMC instruction to trap
> +	  to ATF for the watchdog operation.
> +
> +	  Say Y here if watchdog controller on Meson SoCs is located in
> +	  secure world.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called meson_sec_wdt.
> +
>   config MESON_WATCHDOG
>   	tristate "Amlogic Meson SoCs watchdog support"
>   	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee352b..5e6b73d 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_QCOM_WDT) += qcom-wdt.o
>   obj-$(CONFIG_BCM_KONA_WDT) += bcm_kona_wdt.o
>   obj-$(CONFIG_TEGRA_WATCHDOG) += tegra_wdt.o
>   obj-$(CONFIG_MESON_GXBB_WATCHDOG) += meson_gxbb_wdt.o
> +obj-$(CONFIG_MESON_SEC_WATCHDOG) += meson_sec_wdt.o
>   obj-$(CONFIG_MESON_WATCHDOG) += meson_wdt.o
>   obj-$(CONFIG_MEDIATEK_WATCHDOG) += mtk_wdt.o
>   obj-$(CONFIG_DIGICOLOR_WATCHDOG) += digicolor_wdt.o
> diff --git a/drivers/watchdog/meson_sec_wdt.c b/drivers/watchdog/meson_sec_wdt.c
> new file mode 100644
> index 00000000..86bd87c
> --- /dev/null
> +++ b/drivers/watchdog/meson_sec_wdt.c
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> + *
> + */
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <linux/firmware/meson/meson_sm.h>
> +
> +#define MESON_SIP_WDT_DISABLE		0x1
> +#define MESON_SIP_WDT_ENABLE		0x2
> +#define MESON_SIP_WDT_PING		0x3
> +#define MESON_SIP_WDT_INIT		0x4
> +#define MESON_SIP_WDT_RESETNOW		0x5
> +#define MESON_SIP_WDT_SETTIMEOUT	0x6
> +#define MESON_SIP_WDT_GETTIMELEFT	0x7
> +
> +#define DEFAULT_TIMEOUT			30 /* seconds */
> +
> +/*
> + * Watchdog timer tick is set to 1ms in secfw side, and tick count is
> + * stored in the bit[16-31] of WATCHDOG_CNT register, so the maximum
> + * timeout value is 0xffff ms.
> + */
> +#define MAX_TIMEOUT_MS			0xFFFF
> +
> +struct meson_sec_wdt {
> +	struct watchdog_device wdt_dev;
> +	struct meson_sm_firmware *fw;
> +};
> +
> +static int meson_sec_wdt_start(struct watchdog_device *wdt_dev)
> +{
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	return meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			     MESON_SIP_WDT_ENABLE, 0, 0, 0, 0);
> +}
> +
> +static int meson_sec_wdt_stop(struct watchdog_device *wdt_dev)
> +{
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	return meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			     MESON_SIP_WDT_DISABLE, 0, 0, 0, 0);
> +}
> +
> +static int meson_sec_wdt_ping(struct watchdog_device *wdt_dev)
> +{
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	return meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			     MESON_SIP_WDT_PING, 0, 0, 0, 0);
> +}
> +
> +static int meson_sec_wdt_set_timeout(struct watchdog_device *wdt_dev,
> +				     unsigned int timeout)
> +{
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	wdt_dev->timeout = timeout;
> +
> +	return meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			     MESON_SIP_WDT_SETTIMEOUT,
> +			     wdt_dev->timeout, 0, 0, 0);
> +}
> +
> +static unsigned int meson_sec_wdt_get_timeleft(struct watchdog_device *wdt_dev)
> +{
> +	int ret;
> +	unsigned int timeleft;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, &timeleft,
> +			    MESON_SIP_WDT_GETTIMELEFT, 0, 0, 0, 0);
> +
> +	if (ret)
> +		return ret;

Meh, that doesn't work. I just realized that the return type is unsigned,
so returning a negative error code is pointless. Guess we'll have to
live with returning 0 in this case after all. I wonder if we should
fix the API and return an integer (with negative error code), but that
is a different question.

Sorry for the confusion - I should have noticed that before.

> +
> +	return timeleft;
> +}
> +
> +static const struct watchdog_ops meson_sec_wdt_ops = {
> +	.start = meson_sec_wdt_start,
> +	.stop = meson_sec_wdt_stop,
> +	.ping = meson_sec_wdt_ping,
> +	.set_timeout = meson_sec_wdt_set_timeout,
> +	.get_timeleft = meson_sec_wdt_get_timeleft,
> +};
> +
> +static const struct watchdog_info meson_sec_wdt_info = {
> +	.identity = "Meson Secure Watchdog Timer",
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +};
> +
> +static int __maybe_unused meson_sec_wdt_resume(struct device *dev)
> +{
> +	struct meson_sec_wdt *data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&data->wdt_dev))
> +		return meson_sec_wdt_start(&data->wdt_dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused meson_sec_wdt_suspend(struct device *dev)
> +{
> +	struct meson_sec_wdt *data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&data->wdt_dev))
> +		return meson_sec_wdt_stop(&data->wdt_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops meson_sec_wdt_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(meson_sec_wdt_suspend, meson_sec_wdt_resume)
> +};
> +
> +static const struct of_device_id meson_sec_wdt_dt_ids[] = {
> +	 { .compatible = "amlogic,meson-sec-wdt", },
> +	 { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, meson_sec_wdt_dt_ids);
> +
> +static int meson_sec_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct meson_sec_wdt *data;
> +	struct device_node *sm_np;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
> +	if (!sm_np) {
> +		dev_err(&pdev->dev, "no secure-monitor node\n");
> +		return -EINVAL;
> +	}
> +
> +	data->fw = meson_sm_get(sm_np);
> +	of_node_put(sm_np);
> +	if (!data->fw)
> +		return -EPROBE_DEFER;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->wdt_dev.parent = dev;
> +	data->wdt_dev.info = &meson_sec_wdt_info;
> +	data->wdt_dev.ops = &meson_sec_wdt_ops;
> +	data->wdt_dev.max_hw_heartbeat_ms = MAX_TIMEOUT_MS;
> +	data->wdt_dev.min_timeout = 1;
> +	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_set_drvdata(&data->wdt_dev, data);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_INIT,
> +			    data->wdt_dev.timeout, 0, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	watchdog_stop_on_reboot(&data->wdt_dev);
> +
> +	return devm_watchdog_register_device(dev, &data->wdt_dev);
> +}
> +
> +static struct platform_driver meson_sec_wdt_driver = {
> +	.probe	= meson_sec_wdt_probe,
> +	.driver = {
> +		.name = "meson-sec-wdt",
> +		.pm = &meson_sec_wdt_pm_ops,
> +		.of_match_table	= meson_sec_wdt_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(meson_sec_wdt_driver);
> +
> +MODULE_AUTHOR("Xingyu Chen <xingyu.chen@amlogic.com>");
> +MODULE_DESCRIPTION("Amlogic Secure Watchdog Timer Driver");
> +MODULE_LICENSE("Dual MIT/GPL");
> 

