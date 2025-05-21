Return-Path: <linux-watchdog+bounces-3564-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1BABFC33
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 19:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E20D9E3D55
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 17:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997D128313D;
	Wed, 21 May 2025 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMlHp0ni"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E1221732
	for <linux-watchdog@vger.kernel.org>; Wed, 21 May 2025 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848253; cv=none; b=Z9FdMj3XhV+e122qlAR54mSEX0gCfIYrkbcVpYlO0Af0e5Z9xF3N1Bb7KtVyJ1lkq8FYEtz339tSp/mkV5wdhfFUS73w6y+6h4KFWECtWv3XZeaQ7JDZtq2TFK//CXdanwWutFNpbCG0awxnvawjgjzPu9+G8/8Y8jTZl+ol30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848253; c=relaxed/simple;
	bh=zwvgjZULDowZtaE5MY51D3fR8UIu0alJNMSKAZWbt0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWRV7N0K96UOGDleAQSI5A0jhWe21jcTfLHcC8pxRTo9mvpXBxfEiDOro4v2XgPiW3sg1RVdHKM2/D2QdMuDxWmiFhQuP8kMoat7PazoUk5pqO0+1X3mEVyZaLXN4j9ttOP8FDNyDfBeNXDSA2m/0rx0XaqRk4M2e901Jn0RgRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMlHp0ni; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso88109385e9.2
        for <linux-watchdog@vger.kernel.org>; Wed, 21 May 2025 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747848249; x=1748453049; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cA4yq2BpmitIC2K51KVcgxHgEfq2CwmSLO4n7Kylrb4=;
        b=jMlHp0niNigXjpsEH2uSLGYfoJCSIkviV3pfpkM2N75v5xonWlZJ3/UXvZ+V1dkxRh
         WvnmpwTSjPEhSaRRkny4PI8pAj8oxi4TwCsnhgYQZbCsqD+zGqlz8QCy4r/OeciCUOqL
         cPcgP0e/IcutjMhe3Jw0lLHPkag1YqRR5MNtJG+QqW3PqTsk0XE3MwKaqL/Zm9pNuHik
         vkhJHsxCmSpHUJoJCTcJBUSkg+rK5xcJGwrC7pLsmwgLW5qm+J0ZALa3cT4F2mwzb8/a
         Q5XKxXEUGXCqbwQI+1EiwUw7G9hHzapQln77+ZhEWW25kw1Z380j8m2ypTxKr7Nyk4YF
         HxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747848249; x=1748453049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA4yq2BpmitIC2K51KVcgxHgEfq2CwmSLO4n7Kylrb4=;
        b=LyRR1x2Y3XalwE9ZntyqHv/z94LTbdU3UccvmXOIEmYIe4XEiJJmLGYR+J5seaM6DY
         FRVHcA5gsmWpQvoNm/DiFppOIdKJtI8KZJRqq2uY5wkH+4/Vt/HF7PNqLF2/eLRStJg8
         ZnNfw56/Um+IjaCT1mp9FJGtuwkiMIdJJFFrhIdm6Repdv5dos1e7PCiRqYZD/VyJzFM
         XqQn0j8YwkgmraUsXDxmsEa5l8rvQXDSkJ0EQ2SwZ8XmAYac+bFhJ4seXugppHzH5Fzr
         jPG+mraEE++Sc8vfC9ayoz8PjHjqSAuXnf3ROJvAgoTbOL5ebIBpX+vky/0bQFp+dbD/
         hzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDBzlqPd0KjhjUv0qCTiVVA7yJVr/GDXsL4Z2GMlZruDIDXBLDwp5WvEdl2cTKpXS6ymtFrR52fvvEYvXtsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIdmjHk04bJ3GT3AcwC+Y3IJOWGZ1Z14a0U3CTk9QXeBVJxdVj
	Y+3XE89sFaTnlA8DK/oA+eKFK+9ogTVt+IHXkElgbFpy2ko4dG4s85pvxdcdCe7WcxY=
X-Gm-Gg: ASbGncvKfp/zj/GELFQ7iJwkZllT9kF3feSOEYpxXVAUukNq65eyy8iDi0U3r3jXJRO
	L080IrbngggW2YxfERNDpDP/fsWTgYCB+8I9NbvFfgJlicJ03dQSucIrbMl8MD5s1T/gjDTNuAX
	CB3BXQEsPMTkrgMun8YBWLsRuZJ/xtek4sOT32ePO7QBwx4kjYkukNOCDrP4P+YU6Uu3s6EUOme
	IuVwfw9lWyN3xCqMEfjlRtF7CfUv34OhRG+Fypj+CzfazqWRDR8qr4EzUb/ecU5WmZzqCXHF2XU
	Sp7bVlo9z/5GJw75+NhHK4p6Aw+E/+F5e++RDussqCwiPz9WLO5SVwecvEil6yuuCwhD4/C8XOY
	t5lMOHL2404Chww==
X-Google-Smtp-Source: AGHT+IG/ZQkbgWpwbpaFLxW3V89+XT/xuoE4KmR4TICfAuMLq8I9lUBGVcOLnJ2gel5DZD6Qg+hzaw==
X-Received: by 2002:a05:6000:1a89:b0:3a3:7dc9:e64b with SMTP id ffacd0b85a97d-3a37dc9e655mr4602008f8f.3.1747848249132;
        Wed, 21 May 2025 10:24:09 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d224sm20989057f8f.12.2025.05.21.10.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 10:24:08 -0700 (PDT)
Date: Wed, 21 May 2025 19:24:06 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
Message-ID: <aC4MNjZxnQu8b0kR@mai.linaro.org>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com>

On Wed, May 21, 2025 at 05:00:12PM +0400, Alexey Charkov wrote:
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
>  MAINTAINERS                   |  1 +
>  drivers/watchdog/Kconfig      | 15 ++++++++
>  drivers/watchdog/Makefile     |  1 +
>  drivers/watchdog/vt8500-wdt.c | 88 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 105 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556260662dab469ed091 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3447,6 +3447,7 @@ F:	drivers/tty/serial/vt8500_serial.c
>  F:	drivers/video/fbdev/vt8500lcdfb.*
>  F:	drivers/video/fbdev/wm8505fb*
>  F:	drivers/video/fbdev/wmt_ge_rops.*
> +F:	drivers/watchdog/vt8500-wdt.c
>  F:	include/linux/vt8500-timer.h
>  
>  ARM/ZYNQ ARCHITECTURE
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..2e59303306feba7e15a015c2fce25b1290dc4cbc 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1115,6 +1115,21 @@ config SUNPLUS_WATCHDOG
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called sunplus_wdt.
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

Module is not supported by the timers. That will change in a very near
future but unloading won't be supported, you should consider tying the
wdt life cycle with the subsystem it is connected to.

>  # X86 (i386 + ia64 + x86_64) Architecture
>  
>  config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>  obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>  obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>  obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
> +obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
>  
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a47ee714e7c0172e89a31b0d6c064fff338bd5b6
> --- /dev/null
> +++ b/drivers/watchdog/vt8500-wdt.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <linux/vt8500-timer.h>
> +
> +static int vt8500_watchdog_start(struct watchdog_device *wdd)
> +{
> +	struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
> +	u32 deadline = min(wdd->timeout * 1000, wdd->max_hw_heartbeat_ms);
> +
> +	/* The deadline is matched against the hardware clocksource counter,
> +	 * which is a u32 value incrementing at VT8500_TIMER_HZ and continuing
> +	 * past wraparound. When the return value of timer_next is greater than
> +	 * U32_MAX then the match should occur after the hardware counter wraps
> +	 * around, thus we take only the lower 32 bits of timer_next return val
> +	 */
> +	deadline = info->timer_next((u64)deadline * (VT8500_TIMER_HZ / 1000));
> +	writel(deadline, info->wdt_match);
> +	writel(1, info->wdt_en);
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
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

