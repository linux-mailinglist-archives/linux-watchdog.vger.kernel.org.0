Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94E1FD5069
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2019 16:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfJLO3U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 12 Oct 2019 10:29:20 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34841 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfJLO3U (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 12 Oct 2019 10:29:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id p30so7469655pgl.2;
        Sat, 12 Oct 2019 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wFyrE4sJHknnmugam0lljEG4OV3Sn7PQE66jy+Yciqg=;
        b=E9MGv9kYieDKfFWbqE5FwUfJUM5++tBgIQvj3HKqKOgPv43YdfdXMth7sZeg7VBwvC
         yk0jSZIxDigDYE3hrQY8ZPLGpC1C+WiE+7P2g3hRx9lZwBR7W0KrRL+ITA16ubR6adJF
         rQoKDHD6YIbsb3pFG8d+F0B2/PEq37Isz3C6Oglg6hJELf5pTjQskYn9fSGxTbyncnR9
         tM4xavzdY1/iaSDcNb462vgTajdbr6sqhxv8vQbBsRx/8YIBhuoayKl864djph3g2Nv2
         u+Rt62saXcJzH4BwkjkIB63q9VRxUG4NZY1+26BCDb4KMt6eyK/EoI5iBA/mDUeCuTiw
         hKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wFyrE4sJHknnmugam0lljEG4OV3Sn7PQE66jy+Yciqg=;
        b=ub5wqhgMIh7bQDrUV7WlGnQ1qs1Di5ylSR7ilsfTSQ01s67p+Nb9HF+PaaFhxa4Kqh
         ot8EJaVSHJSXpT3SytdUSbxzQJ4xCDk96ORUFx0viC+kza+kCFLYFojpMr1ctJELoDPp
         9dGyXYc1IpUhHWF3rtHq/W9JolUUNCh4d+ui8DELoCxIpXvkRK+s4tIB+GvaeyYcPZe2
         yAwjB2lPvFtEKTlZ3UD3I8c2cUgJQeq8YwAnw6IKGcUnbGcv1fgH/OlEjmiDfY2CTqtX
         mC2Ai0TZognFJevipihagDbB/iu0Cl7LJ8KOGc2DrbHuneeBBeRCMEA8nUa7ABB0RS3+
         s/9g==
X-Gm-Message-State: APjAAAUafV6r8dlpSMu8xX3BvUzxl4ap+2oEUM6VexRKKvAjuhOJpEJg
        Zu4KW6H+L/xIhEwcG4nZJAZil1RH
X-Google-Smtp-Source: APXvYqxPHup9PSwGxijToNsQGC3Z5sdQTsb9RH+Ajc7G6sO7cQwSJey0vCuxBByAKPHw6GFrGaa67Q==
X-Received: by 2002:aa7:9525:: with SMTP id c5mr22152324pfp.22.1570890559108;
        Sat, 12 Oct 2019 07:29:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u3sm12501348pfn.134.2019.10.12.07.29.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Oct 2019 07:29:17 -0700 (PDT)
Subject: Re: [PATCH 3/4] watchdog: add meson secure watchdog driver
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
References: <1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com>
 <1570874721-36077-4-git-send-email-xingyu.chen@amlogic.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <07e8aef0-c991-f212-d500-c5ce77b3dea3@roeck-us.net>
Date:   Sat, 12 Oct 2019 07:29:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570874721-36077-4-git-send-email-xingyu.chen@amlogic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/12/19 3:05 AM, Xingyu Chen wrote:
> The watchdog controller on the Meson-A/C series SoCs is moved to secure
> world, watchdog operation needs to be done in secure EL3 mode via ATF,
> Non-secure world can call SMC instruction to trap to AFT for watchdog
> operation.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>   drivers/watchdog/Kconfig         |  16 +++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/meson_sec_wdt.c | 205 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 222 insertions(+)
>   create mode 100644 drivers/watchdog/meson_sec_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 58e7c10..e6b0707 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -826,6 +826,22 @@ config MESON_GXBB_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called meson_gxbb_wdt.
>   
> +config MESON_SEC_WATCHDOG
> +	tristate "Amlogic Meson Secure watchdog support"
> +	depends on ARCH_MESON || COMPILE_TEST

Did you try COMPILE_TEST (eg allmodconfig) on, say x86_64 ?
AFAICS the meson sm calls are only available if MESON_SM is
enabled, and that depends on both ARCH_MESON and ARM64_4K_PAGES.
This dependency is not expressed here, and neither is enabled
with COMPILE_TEST.

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
> index 00000000..2b5357c
> --- /dev/null
> +++ b/drivers/watchdog/meson_sec_wdt.c
> @@ -0,0 +1,205 @@
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
> +	int ret;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_ENABLE, 0, 0, 0, 0); > +	if (ret)
> +		return ret;
> +
> +	return 0;

This is equivalent to
	return ret;
or even
	return meson_sm_call(...);

> +}
> +
> +static int meson_sec_wdt_stop(struct watchdog_device *wdt_dev)
> +{
> +	int ret;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_DISABLE, 0, 0, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Same as above.

> +}
> +
> +static int meson_sec_wdt_ping(struct watchdog_device *wdt_dev)
> +{
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +		      MESON_SIP_WDT_PING, 0, 0, 0, 0);
> +
> +	return 0;

Why ignore errors ?

> +}
> +
> +static int meson_sec_wdt_set_timeout(struct watchdog_device *wdt_dev,
> +				     unsigned int timeout)
> +{
> +	int ret;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	wdt_dev->timeout = timeout;
> +	meson_sec_wdt_ping(wdt_dev);
> +

Unconditionally ? Also, the core does that after setting the timeout.

> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_SETTIMEOUT,
> +			    wdt_dev->timeout, 0, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

same as above.

> +}
> +
> +static unsigned int meson_sec_wdt_get_timeleft(struct watchdog_device *wdt_dev)
> +{
> +	int ret;
> +	int timeleft;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, &timeleft,
> +			    MESON_SIP_WDT_GETTIMELEFT, 0, 0, 0, 0);
> +
> +	if (ret)
> +		return 0;

Really ? Why ? 0 is most definitely incorrect here.

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
> +		meson_sec_wdt_start(&data->wdt_dev);

No error return ?

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused meson_sec_wdt_suspend(struct device *dev)
> +{
> +	struct meson_sec_wdt *data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&data->wdt_dev))
> +		meson_sec_wdt_stop(&data->wdt_dev);

No error return ?

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
> +		return -ENODEV;

ENODEV is wrong here.

> +	}
> +
> +	data->fw = meson_sm_get(sm_np);
> +	of_node_put(sm_np);
> +	if (!data->fw)
> +		return -EPROBE_DEFER;

How do you know ?

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
No watchdog_init_timeout() ? Any special reason for not supporting
to set the timeout with a devicetree property ?

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
> +MODULE_LICENSE("Dual BSD/GPL");
> 
BSD or MIT ? This should match the license identifier.

