Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363B415D4D8
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2020 10:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgBNJgE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Feb 2020 04:36:04 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39704 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbgBNJgE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Feb 2020 04:36:04 -0500
Received: by mail-qk1-f193.google.com with SMTP id w15so8569322qkf.6;
        Fri, 14 Feb 2020 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oa5NDVj7Ww7HISYPz7pS4O1dMmAYIYvs6C5w/rOHWLk=;
        b=qv1aWnVkEHdBsaGWDkL0jhE/FUY/uu6Hf83IozRDZ8/USWVkcM1b3x5WxADaYIJVf0
         eI9hqdqOtWlar6fkWd/zA7alEA1jU4jZi+SzVdBo3OT4sGRJXv1cRNK1ifAY40NYl/q1
         RbMihHzBpuzETJ7pvrdrExhMLmcT88xh3/Ha4EpWvxKbJuCti0nHlQWZ/AqmSbQM11Lq
         TDUw5gnUGz86gAbjIVLZ7SgL9HkNmTUNylRH7O0wUBfXPwWlIb47FPwAnAFm1X525bWY
         QsisSCSp4XReAE/W8fZdAj0ky2+VqE4DqmY6q00pxC5ZKk46S0943nqxxJEtrdiK624c
         5EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oa5NDVj7Ww7HISYPz7pS4O1dMmAYIYvs6C5w/rOHWLk=;
        b=O7B6bLg3mRobwcQv7sZIXur4d0RpA25oKqvXgxisw5MY0k1YNLV1dWu4TWeFQ8M1yb
         FBHybog/cal599LCW0wRO5RcICINPoBKkRyh3wt4m+UGrKKmtrv93hNPD8UdFRIk9Aq8
         wfzt1C4HXC6KtJ4qA7u6qkFD41ACVvjjnW+oB5umVDS8EZzuxLpQ0VfeSXmffJrojzZs
         yfUYgDIkD7mvrYzjWCiaDV4qe9jFH8x1vfGePdSC7G3sD/dvoNd3O3f23XHU3soJ5ZKH
         XsNp9jOzQjPIaVHXrbDv8GUwCyg/W4/Du9dhQjAQMcmhBkPxCl7R4k+BBEVAflvrYziz
         R2mg==
X-Gm-Message-State: APjAAAXII74X0mypSc5q9aRaIxMaCDygxz/UIWsNMFAVZ1MBVU12xf61
        W37ID2WdtWXHZdCG83fSsPG1vekuhrrz0Z0YjGg=
X-Google-Smtp-Source: APXvYqyHsNKe8cE7KTCOSuiuGIQ0n7i20+XRZLzrumHlIYQqnDuttK9oecRRmKAsLDwKlsPchqhCiQuZ5YiTc9gV/50=
X-Received: by 2002:a37:b744:: with SMTP id h65mr1665365qkf.85.1581672961675;
 Fri, 14 Feb 2020 01:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org> <20200214172512.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid>
In-Reply-To: <20200214172512.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Fri, 14 Feb 2020 10:35:49 +0100
Message-ID: <CAFqH_50XNt_J396B6t+a2CqDUt2dNpEmv=VTE-Hj=YdO6C51hQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, jwerner@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anson Huang <Anson.Huang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Evan and Julius,

Many thanks for sending this upstream, I have some trivial comments,
especially the license one, other than that, the driver looks good to
me.

Missatge de Evan Benn <evanbenn@chromium.org> del dia dv., 14 de febr.
2020 a les 7:28:
>
> From: Julius Werner <jwerner@chromium.org>
>
> This patch adds a stub watchdog driver that can be used on ARM systems
> with a Secure Monitor firmware to forward watchdog operations to
> firmware via a Secure Monitor Call. This may be useful for platforms
> using TrustZone that want the Secure Monitor firmware to have the final
> control over the watchdog.
>
> Signed-off-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
>
>  MAINTAINERS                    |   1 +
>  arch/arm64/configs/defconfig   |   1 +
>  drivers/watchdog/Kconfig       |  12 +++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/arm_smc_wdt.c | 191 +++++++++++++++++++++++++++++++++
>  5 files changed, 206 insertions(+)
>  create mode 100644 drivers/watchdog/arm_smc_wdt.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c45536e1177..71df3c110fdb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1426,6 +1426,7 @@ M:        Julius Werner <jwerner@chromium.org>
>  R:     Evan Benn <evanbenn@chromium.org>
>  S:     Maintained
>  F:     devicetree/bindings/watchdog/arm,smc-wdt.yaml
> +F:     drivers/watchdog/arm_smc_wdt.c
>
>  ARM SMMU DRIVERS
>  M:     Will Deacon <will@kernel.org>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b2f667307f82..8527db9e92a6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -451,6 +451,7 @@ CONFIG_QCOM_TSENS=3Dy
>  CONFIG_UNIPHIER_THERMAL=3Dy
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_ARM_SP805_WATCHDOG=3Dy
> +CONFIG_ARM_SMC_WATCHDOG=3Dy
>  CONFIG_S3C2410_WATCHDOG=3Dy
>  CONFIG_DW_WATCHDOG=3Dy
>  CONFIG_SUNXI_WATCHDOG=3Dm
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index cec868f8db3f..0f7f93342051 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -857,6 +857,18 @@ config DIGICOLOR_WATCHDOG
>           To compile this driver as a module, choose M here: the
>           module will be called digicolor_wdt.
>
> +config ARM_SMC_WATCHDOG
> +       tristate "ARM Secure Monitor Call based watchdog support"
> +       depends on ARM || ARM64

Looks like this driver is OF only, so add a dependency on CONFIG_OF

> +       select WATCHDOG_CORE
> +       help
> +         Say Y here to include support for a watchdog timer
> +         implemented by the EL3 Secure Monitor on ARM platforms.
> +         Requires firmware support.
> +         To compile this driver as a module, choose M here: the
> +         module will be called arm_smc_wdt.
> +
> +
>  config LPC18XX_WATCHDOG
>         tristate "LPC18xx/43xx Watchdog"
>         depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee352bf3372..a1e6d83a7659 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_STM32_WATCHDOG) +=3D stm32_iwdg.o
>  obj-$(CONFIG_UNIPHIER_WATCHDOG) +=3D uniphier_wdt.o
>  obj-$(CONFIG_RTD119X_WATCHDOG) +=3D rtd119x_wdt.o
>  obj-$(CONFIG_SPRD_WATCHDOG) +=3D sprd_wdt.o
> +obj-$(CONFIG_ARM_SMC_WATCHDOG) +=3D arm_smc_wdt.o
>  obj-$(CONFIG_PM8916_WATCHDOG) +=3D pm8916_wdt.o
>
>  # X86 (i386 + ia64 + x86_64) Architecture
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wd=
t.c
> new file mode 100644
> index 000000000000..58e7294136ef
> --- /dev/null
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ARM Secure Monitor Call watchdog driver
> + *
> + * Copyright 2018 The Chromium OS Authors. All rights reserved.
> + *
> + * Julius Werner <jwerner@chromium.org>
> + *

When adding new files to the kernel, use the regular Google copyright
header to them. The main reason for this is that there=E2=80=98s no concept=
 of
=E2=80=9CThe Chromium OS Authors=E2=80=9D outside of Chromium OS project, s=
ince it
refers to the AUTHORS file that isn=E2=80=99t bundled with the kernel. [1]

In this case, it should be something like this:

/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * ARM Secure Monitor Call watchdog driver
 *
 * Copyright 2020 Google LLC.
 */

See: https://chromium.googlesource.com/chromiumos/docs/+/master/kernel_faq.=
md

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * Based on mtk_wdt.c

Remove the license boilerplate, it is implicit in the SPDX tag. The
reasoning is to avoid mismatches like what happens here. You are
licensing the file as GPL-2.0-only but the boilerplate is
GPL-2.0-or-later.

> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <uapi/linux/psci.h>
> +
> +#define DRV_NAME               "arm_smc_wdt"
> +#define DRV_VERSION            "1.0"
> +
> +#define SMCWD_FUNC_ID          0x82003d06
> +
> +enum smcwd_call {
> +       SMCWD_INFO              =3D 0,
> +       SMCWD_SET_TIMEOUT       =3D 1,
> +       SMCWD_ENABLE            =3D 2,
> +       SMCWD_PET               =3D 3,
> +};
> +
> +static bool nowayout =3D WATCHDOG_NOWAYOUT;
> +static unsigned int timeout;
> +
> +static int smcwd_call(enum smcwd_call call, unsigned long arg,
> +                     struct arm_smccc_res *res)
> +{
> +       struct arm_smccc_res local_res;
> +
> +       if (!res)
> +               res =3D &local_res;
> +
> +       arm_smccc_smc(SMCWD_FUNC_ID, call, arg, 0, 0, 0, 0, 0, res);
> +
> +       if ((int)res->a0 =3D=3D PSCI_RET_NOT_SUPPORTED)

Is this cast really needed?

> +               return -ENOTSUPP;
> +       if ((int)res->a0 =3D=3D PSCI_RET_INVALID_PARAMS)

ditto
> +               return -EINVAL;
> +       if ((int)res->a0 < 0)

ditto
> +               return -EIO;
> +       return res->a0;
> +}
> +
> +static int smcwd_ping(struct watchdog_device *wdd)
> +{
> +       return smcwd_call(SMCWD_PET, 0, NULL);
> +}
> +
> +static int smcwd_set_timeout(struct watchdog_device *wdd,
> +                               unsigned int timeout)

nit: Alignment should match open parenthesis ( if you want to follow
what checkpatch says with the --strict option )

> +{
> +       int res;
> +
> +       res =3D smcwd_call(SMCWD_SET_TIMEOUT, timeout, NULL);
> +       if (!res)
> +               wdd->timeout =3D timeout;
> +       return res;
> +}
> +
> +static int smcwd_stop(struct watchdog_device *wdd)
> +{
> +       return smcwd_call(SMCWD_ENABLE, 0, NULL);
> +}
> +
> +static int smcwd_start(struct watchdog_device *wdd)
> +{
> +       return smcwd_call(SMCWD_ENABLE, 1, NULL);
> +}
> +
> +static const struct watchdog_info smcwd_info =3D {
> +       .identity       =3D DRV_NAME,
> +       .options        =3D WDIOF_SETTIMEOUT |
> +                         WDIOF_KEEPALIVEPING |
> +                         WDIOF_MAGICCLOSE,
> +};
> +
> +static const struct watchdog_ops smcwd_ops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .start          =3D smcwd_start,
> +       .stop           =3D smcwd_stop,
> +       .ping           =3D smcwd_ping,
> +       .set_timeout    =3D smcwd_set_timeout,
> +};
> +
> +static int smcwd_probe(struct platform_device *pdev)
> +{
> +       struct watchdog_device *wdd;
> +       int err;
> +       struct arm_smccc_res res;
> +
> +       err =3D smcwd_call(SMCWD_INFO, 0, &res);
> +       if (err < 0)
> +               return err;
> +
> +       wdd =3D devm_kzalloc(&pdev->dev, sizeof(*wdd), GFP_KERNEL);
> +       if (!wdd)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, wdd);
> +
> +       wdd->info =3D &smcwd_info;
> +       wdd->ops =3D &smcwd_ops;
> +       wdd->timeout =3D res.a2;
> +       wdd->max_timeout =3D res.a2;
> +       wdd->min_timeout =3D res.a1;
> +       wdd->parent =3D &pdev->dev;
> +
> +       watchdog_set_nowayout(wdd, nowayout);
> +       watchdog_init_timeout(wdd, timeout, &pdev->dev);
> +       err =3D smcwd_set_timeout(wdd, wdd->timeout);
> +       if (err)
> +               return err;
> +
> +       err =3D watchdog_register_device(wdd);
> +       if (err)
> +               return err;
> +
> +       dev_info(&pdev->dev, "Watchdog enabled (timeout=3D%d sec, nowayou=
t=3D%d)\n",
> +                       wdd->timeout, nowayout);
> +
> +       return 0;
> +}
> +
> +static void smcwd_shutdown(struct platform_device *pdev)
> +{
> +       struct watchdog_device *wdd =3D platform_get_drvdata(pdev);
> +
> +       if (watchdog_active(wdd))
> +               smcwd_stop(wdd);
> +}
> +
> +static int smcwd_remove(struct platform_device *pdev)
> +{
> +       struct watchdog_device *wdd =3D platform_get_drvdata(pdev);
> +
> +       watchdog_unregister_device(wdd);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id smcwd_dt_ids[] =3D {
> +       { .compatible =3D "arm,smc-wdt" },
> +       { /* sentinel */ }

nit: not sure about this subsystem, but usually the /* sentinel */
word is removed because is really trivial what is { } at the end of
struct.

> +};
> +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
> +
> +static struct platform_driver smcwd_driver =3D {
> +       .probe          =3D smcwd_probe,
> +       .remove         =3D smcwd_remove,
> +       .shutdown       =3D smcwd_shutdown,
> +       .driver         =3D {
> +               .name           =3D DRV_NAME,
> +               .of_match_table =3D smcwd_dt_ids,
> +       },
> +};
> +
> +module_platform_driver(smcwd_driver);
> +
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds");
> +
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (def=
ault=3D"
> +                       __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Julius Werner <jwerner@chromium.org>");
> +MODULE_DESCRIPTION("ARM Secure Monitor Call Watchdog Driver");
> +MODULE_VERSION(DRV_VERSION);
> --
> 2.25.0.265.gbab2e86ba0-goog
>
