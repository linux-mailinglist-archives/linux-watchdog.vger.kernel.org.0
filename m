Return-Path: <linux-watchdog+bounces-4528-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812DBC3ED2B
	for <lists+linux-watchdog@lfdr.de>; Fri, 07 Nov 2025 08:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6FBA3ADAD1
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Nov 2025 07:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C43B30DED5;
	Fri,  7 Nov 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+tNtYA5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7663A2D7DD9
	for <linux-watchdog@vger.kernel.org>; Fri,  7 Nov 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502022; cv=none; b=BQFuHOI5qq24y/7agOzVdqM8lD8poVTO5oCVxiHaQgWTkVD54TZw7jCiTqYDGhbH2O4YENnfxnB9WyRBE2UC/RSuG9r2jsbriymqSzxn9WQa1LiiARezlVZ20iaNr0T+QR6MB2U6JncDSvTkbLEra0D1BBtwD5RlQ0mvwAu0W50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502022; c=relaxed/simple;
	bh=cO5NurIQl/eg1guBeVUIGQOMKGzKw8tKWWLvGRxepIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uttCf8e2kYEOvmp5GsGtIdmWk8xp7RqUg09IBbiisXxC6KuxQD6O4OMJzb+vxVxAKguXDDHAJLdGjQxomVfPcvEEr8bc0HKrhPv2ddWuHk8Y0GSQ9tRQvJZYan4xxSrzK3o6DBq2YK8zbVHiGcIkuyfamDL6xRcuSx8GarEre1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+tNtYA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CD5C4CEF8
	for <linux-watchdog@vger.kernel.org>; Fri,  7 Nov 2025 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762502022;
	bh=cO5NurIQl/eg1guBeVUIGQOMKGzKw8tKWWLvGRxepIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s+tNtYA5jpaX/k3+dOqINj6hHQa0kd9DLlsWPH5Pe4IVa8ahVr/KrsMWRFMTDk8Y2
	 rYKHeQ9848OBVVHtl9+f+2wkZTNSc1LAZpjDvUzksWfrqXQd8oxc7frPsjZQPGKn4G
	 s3fexwxpCgtiTKcPauPysoBeXTv6s86xGgamh+/Q8Q/GHCy5/l+0u4xyTWdgPuRFAY
	 2IHf1zNE9sYCFVUYMhRFxS5q9mijcp42MnRt21vH+fFogsIlxup+EI/DLSQF7G3kOa
	 cyoOXaJc9ogGskkf9RDlnukPAe06xJ+lqOiIUXoYbJi3Yc1AqgXF+vqfy45NP3/c8C
	 QJL2BmUn0uZ9A==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so792563a12.0
        for <linux-watchdog@vger.kernel.org>; Thu, 06 Nov 2025 23:53:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXD7mJjgFKHqgnJ7PijOjVCbn42jp5bQdDndRc8rny3VYkiGNNBBL56+W5jUSUq5RTJmnMAyIcsUwIkkrg8Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQeoFn5MO9btoYL5b1VGMYkD+2GTQR0aord2nGq4rL4joaXAd
	ubiv8Sgzj7RulZAIG2yByUsv7R1AFFQaw6jWTAUk3kqIfkJmJSJxi2mNqx/bMke0BNyVkYmRQc9
	nN2xCjfBQ8y6K3kgHLgaQpWUvTlOkzDQ=
X-Google-Smtp-Source: AGHT+IG8+ZR32d5pvl05Gv3SN6BjCgKJ1SPjMwA8rRsKu7izp2GUQCkf8OZT7z+sE2pIiwUpKhvd7JFoU1rk3B6kW4k=
X-Received: by 2002:a17:907:d07:b0:b72:afb1:fc4 with SMTP id
 a640c23a62f3a-b72c0e833a9mr167122166b.50.1762502020450; Thu, 06 Nov 2025
 23:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762482089.git.zhoubinbin@loongson.cn> <d6153aa5457098cea388cff7ee2ceb43b207970b.1762482089.git.zhoubinbin@loongson.cn>
In-Reply-To: <d6153aa5457098cea388cff7ee2ceb43b207970b.1762482089.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 7 Nov 2025 15:53:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4HRQGU72_GkGabNDSKes77a+MNFNyZmwNvmb=aipT-9Q@mail.gmail.com>
X-Gm-Features: AWmQ_blhGgHAd63exmNQLO3p8vxZuKSPJ7NjueR30OlqT6i6LS_ztlbCdfMYl5A
Message-ID: <CAAhV-H4HRQGU72_GkGabNDSKes77a+MNFNyZmwNvmb=aipT-9Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] watchdog: loongson1: Add Loongson-2k0300 watchdog support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Xiaochuang Mao <maoxiaochuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Fri, Nov 7, 2025 at 2:02=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> According to the manual, the Loongson-2K0300 watchdog is similar to the
> Loongson-1, except for some register offsets and inconsistent register
> bit definitions. Separate definitions via driver_data suffice.
>
> Co-developed-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
> Signed-off-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/watchdog/Kconfig         |  4 +-
>  drivers/watchdog/loongson1_wdt.c | 73 ++++++++++++++++++++++++++------
>  2 files changed, 62 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0c25b2ed44eb..002eb785ca1f 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1965,10 +1965,10 @@ config LANTIQ_WDT
>
>  config LOONGSON1_WDT
>         tristate "Loongson1 SoC hardware watchdog"
> -       depends on MACH_LOONGSON32 || COMPILE_TEST
> +       depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
>         select WATCHDOG_CORE
>         help
> -         Hardware driver for the Loongson1 SoC Watchdog Timer.
> +         Hardware driver for the Loongson family Watchdog Timer.
>
>  config RALINK_WDT
>         tristate "Ralink SoC watchdog"
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson=
1_wdt.c
> index 255198cbf5bf..2417519717cc 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
> + * Copyright (C) 2025 Binbin Zhou <zhoubinbin@loongson.cn>
>   */
>
>  #include <linux/clk.h>
> @@ -10,10 +11,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/watchdog.h>
>
> -/* Loongson 1 Watchdog Register Definitions */
> +/* Loongson Watchdog Register Definitions */
>  #define WDT_EN                 0x0
> -#define WDT_TIMER              0x4
> -#define WDT_SET                        0x8
>
>  #define DEFAULT_HEARTBEAT      30
>
> @@ -27,18 +26,37 @@ module_param(heartbeat, uint, 0);
>  MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default=3D"
>                  __MODULE_STRING(DEFAULT_HEARTBEAT) ")");
>
> +struct ls1x_wdt_pdata {
> +       u32 timer_offset;
> +       u32 set_offset;
> +       u32 wdt_en_bit;
> +};
> +
> +static const struct ls1x_wdt_pdata ls1b_wdt_pdata =3D {
> +       .timer_offset =3D 0x4,
> +       .set_offset =3D 0x8,
> +       .wdt_en_bit =3D BIT(0),
> +};
> +
> +static const struct ls1x_wdt_pdata ls2k0300_wdt_pdata =3D {
> +       .timer_offset =3D 0x8,
> +       .set_offset =3D 0x4,
> +       .wdt_en_bit =3D BIT(1),
> +};
> +
>  struct ls1x_wdt_drvdata {
>         void __iomem *base;
>         struct clk *clk;
>         unsigned long clk_rate;
>         struct watchdog_device wdt;
> +       const struct ls1x_wdt_pdata *pdata;
>  };
>
>  static int ls1x_wdt_ping(struct watchdog_device *wdt_dev)
>  {
>         struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
>
> -       writel(0x1, drvdata->base + WDT_SET);
> +       writel(0x1, drvdata->base + drvdata->pdata->set_offset);
>
>         return 0;
>  }
> @@ -53,7 +71,7 @@ static int ls1x_wdt_set_timeout(struct watchdog_device =
*wdt_dev,
>         wdt_dev->timeout =3D timeout;
>
>         counts =3D drvdata->clk_rate * min(timeout, max_hw_heartbeat);
> -       writel(counts, drvdata->base + WDT_TIMER);
> +       writel(counts, drvdata->base + drvdata->pdata->timer_offset);
>
>         return 0;
>  }
> @@ -62,7 +80,7 @@ static int ls1x_wdt_start(struct watchdog_device *wdt_d=
ev)
>  {
>         struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
>
> -       writel(0x1, drvdata->base + WDT_EN);
> +       writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
>
>         return 0;
>  }
> @@ -70,8 +88,10 @@ static int ls1x_wdt_start(struct watchdog_device *wdt_=
dev)
>  static int ls1x_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>         struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
> +       u32 val =3D readl(drvdata->base + WDT_EN);
>
> -       writel(0x0, drvdata->base + WDT_EN);
> +       val &=3D ~(drvdata->pdata->wdt_en_bit);
> +       writel(val, drvdata->base + WDT_EN);
>
>         return 0;
>  }
> @@ -81,9 +101,9 @@ static int ls1x_wdt_restart(struct watchdog_device *wd=
t_dev,
>  {
>         struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
>
> -       writel(0x1, drvdata->base + WDT_EN);
> -       writel(0x1, drvdata->base + WDT_TIMER);
> -       writel(0x1, drvdata->base + WDT_SET);
> +       writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
> +       writel(0x1, drvdata->base + drvdata->pdata->timer_offset);
> +       writel(0x1, drvdata->base + drvdata->pdata->set_offset);
>
>         return 0;
>  }
> @@ -114,6 +134,8 @@ static int ls1x_wdt_probe(struct platform_device *pde=
v)
>                 return -ENOMEM;
>         platform_set_drvdata(pdev, drvdata);
>
> +       drvdata->pdata =3D of_device_get_match_data(dev);
> +
>         drvdata->base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(drvdata->base))
>                 return PTR_ERR(drvdata->base);
> @@ -142,9 +164,32 @@ static int ls1x_wdt_probe(struct platform_device *pd=
ev)
>         return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
>
> +static int ls1x_wdt_resume(struct device *dev)
> +{
> +       struct ls1x_wdt_drvdata *data =3D dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&data->wdt))
> +               ls1x_wdt_start(&data->wdt);
> +
> +       return 0;
> +}
> +
> +static int ls1x_wdt_suspend(struct device *dev)
> +{
> +       struct ls1x_wdt_drvdata *data =3D dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&data->wdt))
> +               ls1x_wdt_stop(&data->wdt);
> +
> +       return 0;
> +}
We usually define suspend first and then resume, that looks more
natural. But this is not a big deal.

Others look good to me.

For the whole series,
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

Huacai

> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(ls1x_wdt_pm_ops, ls1x_wdt_suspend, ls1x_=
wdt_resume);
> +
>  static const struct of_device_id ls1x_wdt_dt_ids[] =3D {
> -       { .compatible =3D "loongson,ls1b-wdt", },
> -       { .compatible =3D "loongson,ls1c-wdt", },
> +       { .compatible =3D "loongson,ls1b-wdt", .data =3D &ls1b_wdt_pdata =
},
> +       { .compatible =3D "loongson,ls1c-wdt", .data =3D &ls1b_wdt_pdata =
},
> +       { .compatible =3D "loongson,ls2k0300-wdt", .data =3D &ls2k0300_wd=
t_pdata },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
> @@ -154,11 +199,13 @@ static struct platform_driver ls1x_wdt_driver =3D {
>         .driver =3D {
>                 .name =3D "ls1x-wdt",
>                 .of_match_table =3D ls1x_wdt_dt_ids,
> +               .pm =3D pm_ptr(&ls1x_wdt_pm_ops),
>         },
>  };
>
>  module_platform_driver(ls1x_wdt_driver);
>
>  MODULE_AUTHOR("Yang Ling <gnaygnil@gmail.com>");
> -MODULE_DESCRIPTION("Loongson1 Watchdog Driver");
> +MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
> +MODULE_DESCRIPTION("Loongson Watchdog Driver");
>  MODULE_LICENSE("GPL");
> --
> 2.47.3
>

