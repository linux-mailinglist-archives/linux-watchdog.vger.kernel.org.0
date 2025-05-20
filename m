Return-Path: <linux-watchdog+bounces-3554-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E251ABE7ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 01:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825F41894A22
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 23:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3022163BD;
	Tue, 20 May 2025 23:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BArmfC/8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0EE6BFC0;
	Tue, 20 May 2025 23:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747782943; cv=none; b=Wopo0j5C+N4j/q9dMhne3+MIH1DNb/HKpgwLNZpZql+YRlw04X3uYncBA22ZiPUmW+5MsohbZbuSVGutuWbie7AvglbDubDqpcaMc77rR18/8q2Kwx92cnv1bJo71WfRWQA8Q+z3V7ah2kQCssI3bdaKUJwc7PhT9l1ajWJqDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747782943; c=relaxed/simple;
	bh=+JlRij6vueEihPjC8kzDeY8OjjsXsL2ybJiaPffg5IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMYlBXjjSkdjOE+DUVDMPWqJ6jsKoA1o+Xwkk7ebYDcOAH+evdSj9Ln7hHS7rVJf9oEBhCfS44o/ZQsL2z0Y5jjhTZWfuTcv/BGfysUvnxiWXDz2QUk5qn2uj9+54kwjrSc9pE3yUSJd1Bt7rydM0gKVcQrX059oCD9B1Mt88W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BArmfC/8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7054030b3a.2;
        Tue, 20 May 2025 16:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747782939; x=1748387739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eGgbUcozpMnnCGXKgq4MevBgPfTSqhIwy1A/fiUTw0E=;
        b=BArmfC/8i5Wwm5u3zF9R+xOkTvMkwXAfQGcnc3LPzEix23ejtoefDdMPYOElImhFj4
         3swYJqu6DPKu5ISGGn/5fOhcLO9pOPkXV1n4FjbzzUi1MtArWbSat0dk21tcsb0LGcNs
         D9n72megxc+W+CwurftzQx34fmbs+DpINq/nzzo6GLKScJ4mITSWjEjK2zKcAY7eIpdr
         3IAEYdKQn+WhjTd4mAhslAHL74PV3Us/+sTwVQSTEf2BJmq9WWDngsAl2/+X/1mB66S/
         IapqMevGRtB5lvSeEg6Q9e1jf94H44N27dQPSxM7Pzn14v+l12fvJhvTy+RhDMZ65D/R
         4jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747782939; x=1748387739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGgbUcozpMnnCGXKgq4MevBgPfTSqhIwy1A/fiUTw0E=;
        b=lQ8ru/6W1BvDimm+pIB8HCRGtj8gmX9KhTdxJTsL7k3ZJOkisgP64YCJlwFpxCb8MS
         q+6XUAJV9FTtBsBomI/cAuKCYkWRttTheUiq9ZhyXfoWOChe0oUmVsvc8UyMM2cuf6Ej
         Bi3cv+Jm9dpNB/koX0soVm4FDppBlh7eHzV9Dj1xgIhdsGvjgZdUbsUkm7xmx8vhN7k0
         hv8bqS4aXQGhy/8HD/YhRibMqRh57pymu6EDE3VA+BRkVVYLzv9/y05ZSKanRcKU5AsN
         qO+yH4jFKD8l1C0Hxs0t0l1+QfkdCsfMjDhiL2se+P0etMdEcLC3GAdaJgF2vOMZJiHu
         XI9g==
X-Forwarded-Encrypted: i=1; AJvYcCVggcnZM9GHIlc954HCwiK46mGTUNKyB4awOfZ5wmi1ilEhCNy558XNC5KHgnrw5Xl1Rf1SkyjhQjREk4+Y+Qk=@vger.kernel.org, AJvYcCVtckbozk1brhGTN7MR4ByXa0c4mtTiA4pFuYazhogJi0BYFo/8hgZaixDgg5AklSGBJzgngWCtRok9Bdsi@vger.kernel.org, AJvYcCX5+FfnUJ0a49DsN1e+fpUhPy+wjSOsEenfo+jowXZLpJZ+zM1m42IuaBly1jjN8V1EVFeXFuiF9dGl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2yA34cIP/2ijKj8dUuGEyOyW27/iJr1fk/RjtlS05Ue6TMepD
	rOq8G/fpJ+ybhOKJAb82e16dtakQ4fSvBPmts1MewOmi8jraDoyQQ9O1
X-Gm-Gg: ASbGncudF4jxiGrZb319wwG0MB4ecRSh50ZeJua7EBamzXLwlwkGvmubGke4uTJNiUW
	f8I769BTvKXf3J1lquYJAy5BgrFUjPg9Hu7jJn3LT9/qzWtC/nwHkbW2424Vr+wBlozR1/xDOQy
	B5z8OSMYtVjFU9tg36PtO1WRiSrHjYvs1Xnj7jvDesUTFFi8p8y4mSmS+YQhyGvEjyl13mE9MMt
	IhrTIdAsZEPLVp+bgRk7b9Qk2WnnVuDoFQLjJux+FwT+PGxmbDgYIB7JfbDBaLDlzlHztsspKlm
	nWFIhlVrZX0p6G6/59HCpHsWoSSKxfKee7l+TLFYoJkMfcxyh6Eb1QwO6OSVpr4SIFY5R/QEfOZ
	zKaRqMTehHUH91NtHAxD+t0Rx
X-Google-Smtp-Source: AGHT+IFFfjMW95S1fQqT1aVdr3O+6ku3KDFh6OD/9Qk0mclsqEMvk+gYedKyn3GL46IouMJTMope9g==
X-Received: by 2002:a05:6a20:12c3:b0:216:1476:f54 with SMTP id adf61e73a8af0-216219ee254mr29948687637.38.1747782939219;
        Tue, 20 May 2025 16:15:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5c6bbsm8559327a12.6.2025.05.20.16.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 16:15:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
Date: Tue, 20 May 2025 16:15:36 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 13:01, Alexey Charkov wrote:
> VIA/WonderMedia SoCs can use their system timer's first channel as a
> watchdog device which will reset the system if the clocksource counter
> matches the value given in its match register 0 and if the watchdog
> function is enabled.
> 
> Since the watchdog function is tightly coupled to the timer itself, it
> is implemented as an auxiliary device of the timer device
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>   MAINTAINERS                   |  1 +
>   drivers/watchdog/Kconfig      | 15 ++++++++
>   drivers/watchdog/Makefile     |  1 +
>   drivers/watchdog/vt8500-wdt.c | 80 +++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 97 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556260662dab469ed091 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3447,6 +3447,7 @@ F:	drivers/tty/serial/vt8500_serial.c
>   F:	drivers/video/fbdev/vt8500lcdfb.*
>   F:	drivers/video/fbdev/wm8505fb*
>   F:	drivers/video/fbdev/wmt_ge_rops.*
> +F:	drivers/watchdog/vt8500-wdt.c
>   F:	include/linux/vt8500-timer.h
>   
>   ARM/ZYNQ ARCHITECTURE
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97f6e3ee868bd3bf1534a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2003,6 +2003,21 @@ config PIC32_DMT
>   	  To compile this driver as a loadable module, choose M here.
>   	  The module will be called pic32-dmt.
>   
> +config VT8500_WATCHDOG
> +	tristate "VIA/WonderMedia VT8500 watchdog support"
> +	depends on ARCH_VT8500 || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	select AUXILIARY_BUS
> +	help
> +	  VIA/WonderMedia SoCs can use their system timer as a hardware
> +	  watchdog, as long as the first timer channel is free from other
> +	  uses and respective function is enabled in its registers. To
> +	  make use of it, say Y here and ensure that the device tree
> +	  lists at least two interrupts for the VT8500 timer device.
> +
> +	  To compile this driver as a module, choose M here.
> +	  The module will be called vt8500-wdt.
> +
>   # PARISC Architecture
>   
>   # POWERPC Architecture
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>   obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>   obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>   obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
> +obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1d28e955f00bef00e9db
> --- /dev/null
> +++ b/drivers/watchdog/vt8500-wdt.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <linux/vt8500-timer.h>
> +
> +static int vt8500_watchdog_start(struct watchdog_device *wdd)
> +{
> +	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
> +	u64 deadline = info->timer_next(wdd->timeout * VT8500_TIMER_HZ);
> +

wdd->timeout is the soft timeout, which may be larger
than the maximum hardware timeout. That means you'll need
to use something like "min(wdd->timeout, U32_MAX / VT8500_TIMER_HZ)
* VT8500_TIMER_HZ" as parameter to the timer_next call.

> +	writel((u32)deadline, info->wdt_match);

Can deadline overflow ?

> +	writel(TIMER_WD_EN, info->wdt_en);
> +	return 0;
> +}
> +
> +static int vt8500_watchdog_stop(struct watchdog_device *wdd)
> +{
> +	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
> +
> +	writel(0, info->wdt_en);
> +	return 0;
> +}
> +
> +static const struct watchdog_ops vt8500_watchdog_ops = {
> +	.start			= vt8500_watchdog_start,
> +	.stop			= vt8500_watchdog_stop,
> +};
> +
> +static const struct watchdog_info vt8500_watchdog_info = {
> +	.identity		= "VIA VT8500 watchdog",
> +	.options		= WDIOF_MAGICCLOSE |
> +				  WDIOF_KEEPALIVEPING |
> +				  WDIOF_SETTIMEOUT,
> +};
> +
> +static int vt8500_wdt_probe(struct auxiliary_device *auxdev,
> +			    const struct auxiliary_device_id *id)
> +{
> +	struct vt8500_wdt_info *info;
> +	struct watchdog_device *wdd;
> +
> +	wdd = devm_kzalloc(&auxdev->dev, sizeof(*wdd), GFP_KERNEL);
> +	if (!wdd)
> +		return -ENOMEM;
> +
> +	wdd->info = &vt8500_watchdog_info;
> +	wdd->ops = &vt8500_watchdog_ops;
> +	wdd->max_hw_heartbeat_ms = U32_MAX / (VT8500_TIMER_HZ / 1000);
> +	wdd->parent = &auxdev->dev;
> +
> +	info = container_of(auxdev, struct vt8500_wdt_info, auxdev);
> +	watchdog_set_drvdata(wdd, info);
> +
> +	return devm_watchdog_register_device(&auxdev->dev, wdd);
> +}
> +
> +static const struct auxiliary_device_id vt8500_wdt_ids[] = {
> +	{ .name = "timer_vt8500.vt8500-wdt" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(auxiliary, my_auxiliary_id_table);
> +
> +static struct auxiliary_driver vt8500_wdt_driver = {
> +	.name =	"vt8500-wdt",
> +	.probe = vt8500_wdt_probe,
> +	.id_table = vt8500_wdt_ids,
> +};
> +module_auxiliary_driver(vt8500_wdt_driver);
> +
> +MODULE_AUTHOR("Alexey Charkov <alchark@gmail.com>");
> +MODULE_DESCRIPTION("Driver for the VIA VT8500 watchdog timer");
> +MODULE_LICENSE("GPL");
> 


