Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3B52FB2FF
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Jan 2021 08:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbhASH3r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Jan 2021 02:29:47 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48598 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbhASH1W (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Jan 2021 02:27:22 -0500
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1l1lPQ-0005cG-PV
        for linux-watchdog@vger.kernel.org; Tue, 19 Jan 2021 07:26:36 +0000
Received: by mail-wr1-f69.google.com with SMTP id q2so9488663wrp.4
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Jan 2021 23:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hb3QRj7v02lh+SOhMgAFU06td+fQOO3rJOhY1LMGxbw=;
        b=ifd5lTG2aZNGL8vq6s91/hZ4ad32DDkgIp+dl0xPmgGb64MAfasxSbf0QnDb/ufvbQ
         7h+OesQtHQKNt0hKxw/4SCPTNEZeHZm3pXEj0FnB7b+p88OUnkoHZb2K43/h6mq60ZI5
         7x0oOeeLi+Ic3ZcwaynaY7lSr5KDH8HCL61yksMnR3w6jWsemKhJ4OoY+v4khQsDG9Qq
         /MXTkYkbiZZDoMYHwlt3o5GjiwBql2+u2HApUE10279Y3LUHrxPMa6P61cCYfuwXSKJD
         n/gN38ZSDjGxgGYkGNtXcxN4+TpdIBpEa5MOQ+ubZAH7uSutttU/pi6lqejIL5PUcwro
         2ruA==
X-Gm-Message-State: AOAM5306Bghi5r3Aj8jE9QVbQ7VxHgMC3ubKh1QvM1VeNk50z6PTPJKC
        MjB3lYPk76zWHcmV7Jlr190cbZ9QVCOmlmcKr4oK+fHVjgN6CQ/DMiZD84Cnkkie/l55Xh9TjN8
        5+4GXuna8O5WicXSk+DKDJj3VuzK8ndxi2hGfdlHZe79zWmv7YzBOPd3o0CJq
X-Received: by 2002:a1c:620a:: with SMTP id w10mr2564330wmb.167.1611041195914;
        Mon, 18 Jan 2021 23:26:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytW2FA3WVzxuFs9wYhreF3OU2PpMvef2ZldSjIZ14lR5MUc1UgCKQ2Gk9CtsH/ByJGwLS0XfPzLSXSzaEltAA=
X-Received: by 2002:a1c:620a:: with SMTP id w10mr2564304wmb.167.1611041195622;
 Mon, 18 Jan 2021 23:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20210118123749.4769-1-campion.kang@advantech.com.tw> <20210118123749.4769-6-campion.kang@advantech.com.tw>
In-Reply-To: <20210118123749.4769-6-campion.kang@advantech.com.tw>
From:   AceLan Kao <chia-lin.kao@canonical.com>
Date:   Tue, 19 Jan 2021 15:26:24 +0800
Message-ID: <CAFv23Qm-VtzbtSV5t2itOfDh8kTtdGo_qyyAkKSyisjdUcjNCQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] watchdog: ahc1ec0-wdt: Add sub-device watchdog for
 Advantech embedded controller
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Campion Kang <campion.kang@advantech.com.tw> 於 2021年1月18日 週一 下午8:39寫道：
>
> This is one of sub-device driver for Advantech embedded controller
> AHC1EC0. This driver provide watchdog functionality for Advantech
> related applications to restart the system.
>
> Changed since V5:
>         - remove unnecessary header files
>         - bug fixed: reboot halt if watchdog enabled
>         - Kconfig: add "AHC1EC0" string to clearly define the EC name
>
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  drivers/watchdog/Kconfig       |  11 ++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/ahc1ec0-wdt.c | 261 +++++++++++++++++++++++++++++++++
>  3 files changed, 273 insertions(+)
>  create mode 100644 drivers/watchdog/ahc1ec0-wdt.c
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7ff941e71b79..1a27836883ac 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1636,6 +1636,17 @@ config NIC7018_WDT
>           To compile this driver as a module, choose M here: the module will be
>           called nic7018_wdt.
>
> +config AHC1EC0_WDT
> +       tristate "Advantech AHC1EC0 Watchdog Function"
> +       depends on MFD_AHC1EC0
> +       help
> +         This is sub-device for Advantech AHC1EC0 embedded controller.
> +
> +         This driver provide watchdog functionality for Advantech related
> +         applications to restart the system.
> +         To compile thie driver as a module, choose M here: the module will be
> +         called ahc1ec0-wdt.
> +
>  # M68K Architecture
>
>  config M54xx_WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 5c74ee19d441..7190811b1e50 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_INTEL_MID_WATCHDOG) += intel-mid_wdt.o
>  obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
>  obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
>  obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
> +obj-$(CONFIG_AHC1EC0_WDT) += ahc1ec0-wdt.o
>  obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
>
>  # M68K Architecture
> diff --git a/drivers/watchdog/ahc1ec0-wdt.c b/drivers/watchdog/ahc1ec0-wdt.c
> new file mode 100644
> index 000000000000..4497b6106b24
> --- /dev/null
> +++ b/drivers/watchdog/ahc1ec0-wdt.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Watchdog Driver for Advantech Embedded Controller chip AHC1EC0
> + *
> + * Copyright 2020, Advantech IIoT Group
> + *
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/ahc1ec0.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +
> +#define DRV_NAME      "ahc1ec0-wdt"
> +
> +struct ec_wdt_data {
> +       struct watchdog_device wdtdev;
> +       struct adv_ec_platform_data *adv_ec_data;
> +       struct notifier_block reboot_nb;
> +       struct mutex lock_ioctl;
> +       int is_enable;
> +       int current_timeout;
> +};
> +
> +#define EC_WDT_MIN_TIMEOUT 1   /* The watchdog devices minimum timeout value (in seconds). */
> +#define EC_WDT_MAX_TIMEOUT 600  /* The watchdog devices maximum timeout value (in seconds) */
> +#define EC_WDT_DEFAULT_TIMEOUT 45
> +
> +static int set_delay(struct adv_ec_platform_data *adv_ec_data, unsigned short delay_timeout_in_ms)
> +{
> +       if (write_hw_ram(adv_ec_data, EC_RESET_DELAY_TIME_L, delay_timeout_in_ms & 0x00FF)) {
> +               pr_err("Failed to set Watchdog Retset Time Low byte.");
> +               return -EINVAL;
> +       }
> +
> +       if (write_hw_ram(adv_ec_data, EC_RESET_DELAY_TIME_H, (delay_timeout_in_ms & 0xFF00) >> 8)) {
> +               pr_err("Failed to set Watchdog Retset Time Hight byte.");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int advwdt_set_heartbeat(unsigned long t)
> +{
> +       if (t < 1 || t > 6553) {
> +               pr_err("%s: the input timeout is out of range.",  __func__);
> +               pr_err("Please choose valid data between 1 ~ 6553.");
> +               return -EINVAL;
> +       }
> +
> +       return (t * 10);
> +}
> +
> +/* Notifier for system down */
> +static int advwdt_notify_sys(struct notifier_block *nb, unsigned long code, void *data)
> +{
> +       if (code == SYS_DOWN || code == SYS_HALT) {
> +               struct ec_wdt_data *ec_wdt_data;
> +
> +               ec_wdt_data = container_of(nb, struct ec_wdt_data, reboot_nb);
> +               if (!ec_wdt_data)
> +                       return NOTIFY_BAD;
> +
> +               /* Turn the WDT off */
> +               if (write_hwram_command(ec_wdt_data->adv_ec_data, EC_WDT_STOP)) {
> +                       pr_err("Failed to set Watchdog stop.");
> +                       return -EINVAL;
> +               }
> +               ec_wdt_data->is_enable = 0;
> +               pr_info("%s: notify sys shutdown", __func__);
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
> +static int ec_wdt_start(struct watchdog_device *wdd)
> +{
> +       int ret;
> +       int timeout, timeout_in_ms;
> +       struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
> +       struct adv_ec_platform_data *adv_ec_data;
> +
> +       dev_dbg(wdd->parent, "%s\n", __func__);
> +
> +       adv_ec_data = ec_wdt_data->adv_ec_data;
> +       timeout = wdd->timeout; /* The watchdog devices timeout value (in seconds). */
> +
> +       mutex_lock(&ec_wdt_data->lock_ioctl);
> +
> +       timeout_in_ms = advwdt_set_heartbeat(timeout);
> +       if (timeout_in_ms < 0) {
> +               mutex_unlock(&ec_wdt_data->lock_ioctl);
> +               return timeout_in_ms;
> +       }
> +
> +       ret = set_delay(adv_ec_data, (unsigned short)(timeout_in_ms-1));
> +       if (ret) {
> +               dev_err(wdd->parent, "Failed to set Watchdog delay (ret=%x).\n", ret);
> +               mutex_unlock(&ec_wdt_data->lock_ioctl);
> +               return ret;
> +       }
> +       ret = write_hwram_command(adv_ec_data, EC_WDT_STOP);
> +       ret = write_hwram_command(adv_ec_data, EC_WDT_START);
> +       if (ret) {
> +               dev_err(wdd->parent, "Failed to set Watchdog start (ret=%x).\n", ret);
> +               mutex_unlock(&ec_wdt_data->lock_ioctl);
> +               return ret;
> +       }
> +       ec_wdt_data->is_enable = 1;
> +       ec_wdt_data->current_timeout = timeout_in_ms/10;
> +
> +       mutex_unlock(&ec_wdt_data->lock_ioctl);
> +       return 0;
> +}
> +
> +static int ec_wdt_stop(struct watchdog_device *wdd)
> +{
> +       int ret;
> +       struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
> +       struct adv_ec_platform_data *adv_ec_data;
> +
> +       dev_dbg(wdd->parent, "%s\n", __func__);
> +
> +       adv_ec_data = ec_wdt_data->adv_ec_data;
> +
> +       mutex_lock(&ec_wdt_data->lock_ioctl);
> +       ret = write_hwram_command(adv_ec_data, EC_WDT_STOP);
> +       mutex_unlock(&ec_wdt_data->lock_ioctl);
> +       if (ret)
> +               pr_err("Failed to set Watchdog stop.");
> +       else
> +               ec_wdt_data->is_enable = 0;
> +
> +       return ret;
> +}
> +
> +static int ec_wdt_ping(struct watchdog_device *wdd)
> +{
> +       int ret;
> +       struct ec_wdt_data *ec_wdt_data = watchdog_get_drvdata(wdd);
> +       struct adv_ec_platform_data *adv_ec_data;
> +
> +       dev_dbg(wdd->parent, "%s\n", __func__);
> +
> +       adv_ec_data = ec_wdt_data->adv_ec_data;
> +
> +       mutex_lock(&ec_wdt_data->lock_ioctl);
> +       ret = write_hwram_command(adv_ec_data, EC_WDT_RESET);
> +       mutex_unlock(&ec_wdt_data->lock_ioctl);
> +       if (ret) {
> +               pr_err("Failed to set Watchdog reset.");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ec_wdt_set_timeout(struct watchdog_device *wdd,
> +                               unsigned int timeout)
> +{
> +       dev_dbg(wdd->parent, "%s, timeout=%d\n", __func__, timeout);
> +
> +       wdd->timeout = timeout;
> +
> +       if (watchdog_active(wdd))
> +               return ec_wdt_start(wdd);
> +
> +       return 0;
> +}
> +
> +static const struct watchdog_info ec_watchdog_info = {
> +       .options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +       .identity = "AHC1EC0 Watchdog",
> +};
> +
> +static const struct watchdog_ops ec_watchdog_ops = {
> +       .owner = THIS_MODULE,
> +       .start = ec_wdt_start,
> +       .stop = ec_wdt_stop,
> +       .ping = ec_wdt_ping,
> +       .set_timeout = ec_wdt_set_timeout,
> +};
> +
> +static int adv_ec_wdt_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct device *dev = &pdev->dev;
> +       struct adv_ec_platform_data *adv_ec_data;
> +       struct ec_wdt_data *ec_wdt_data;
> +       struct watchdog_device *wdd;
> +
> +       dev_info(dev, "watchdog probe start\n");
> +
> +       adv_ec_data = dev_get_drvdata(dev->parent);
> +       if (!adv_ec_data)
> +               return -EINVAL;
> +
> +       ec_wdt_data = devm_kzalloc(dev, sizeof(struct ec_wdt_data), GFP_KERNEL);
> +       if (!ec_wdt_data)
> +               return -ENOMEM;
> +
> +       mutex_init(&ec_wdt_data->lock_ioctl);
> +
> +       ec_wdt_data->adv_ec_data = adv_ec_data;
> +       wdd = &ec_wdt_data->wdtdev;
> +
> +       watchdog_init_timeout(&ec_wdt_data->wdtdev, 0, dev);
> +
> +       //watchdog_set_nowayout(&ec_wdt_data->wdtdev, WATCHDOG_NOWAYOUT);
> +       watchdog_set_drvdata(&ec_wdt_data->wdtdev, ec_wdt_data);
> +       platform_set_drvdata(pdev, ec_wdt_data);
> +
> +       wdd->info = &ec_watchdog_info;
> +       wdd->ops = &ec_watchdog_ops;
> +       wdd->min_timeout = EC_WDT_MIN_TIMEOUT;
> +       wdd->max_timeout = EC_WDT_MAX_TIMEOUT;
> +       wdd->parent = dev;
> +
> +       ec_wdt_data->wdtdev.timeout = EC_WDT_DEFAULT_TIMEOUT;
> +       ec_wdt_data->is_enable = 0;
> +       ec_wdt_data->current_timeout = EC_WDT_DEFAULT_TIMEOUT;
> +
> +       watchdog_stop_on_unregister(wdd);
> +
> +       ec_wdt_data->reboot_nb.notifier_call = advwdt_notify_sys;
> +       ret = devm_register_reboot_notifier(dev, &ec_wdt_data->reboot_nb);
> +       if (ret) {
> +               dev_err(dev, "watchdog%d: Cannot register reboot notifier (%d)\n",
> +                       wdd->id, ret);
> +               return ret;
> +       }
> +
> +       ret = devm_watchdog_register_device(dev, wdd);
> +       if (ret != 0)
> +               dev_err(dev, "watchdog_register_device() failed: %d\n",
> +                       ret);
> +
> +       dev_info(dev, "watchdog register success\n");
> +
> +       return 0;
> +}
> +
> +static struct platform_driver adv_wdt_drv = {
> +       .driver = {
> +               .name = DRV_NAME,
> +       },
> +       .probe = adv_ec_wdt_probe,
> +};
> +module_platform_driver(adv_wdt_drv);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);
> +MODULE_DESCRIPTION("Advantech Embedded Controller Watchdog Driver.");
> +MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
> +MODULE_VERSION("1.0");
> --
> 2.17.1
>
Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
