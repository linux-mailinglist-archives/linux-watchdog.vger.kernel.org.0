Return-Path: <linux-watchdog+bounces-639-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2784F382
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Feb 2024 11:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8294E2836CA
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Feb 2024 10:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8705D17C65;
	Fri,  9 Feb 2024 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yy4r/7GI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F61D557
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Feb 2024 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707474949; cv=none; b=m5YmRdNNZq8Tc1kjxqvsr1ja2BK4FE49wsnQbADOG1l+wD1ibh8y05QL2pYO5pmwDnD/dAO0kqbKNeKOLFgyDt3H4LVaH/gW3iyLt5u6ajpIUfKmH8Q/ZFb4iuKh+dJAdn1diSwSq9/VBNjPCa/1GeLZiz1eCwxgNm6nS271yiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707474949; c=relaxed/simple;
	bh=Mh1E9PeJjOSqtWbFh8Fz3144DuBxk5lGa2WIC0FhKC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZ3W0dOTzuhWjSGBwiGXFZJsjfbDhwbFR1tqZmwaG7PY3EEBM0vWziShmcEUWEryyu+5D1RiiQ4TaEyMlQtJjCVR73IFguS/fHTm49HTnZEY68klv3gLl0/21RNBr6bhynDTAX8QBbrG5Gexvrz89gf5D2RqncH5VdzNOKVdUFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yy4r/7GI; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d5c2502ea2so329255241.1
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Feb 2024 02:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707474946; x=1708079746; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0AaPX0aZcuXGu3S0z1IdEkLhaMcgiZgBjdGD9S23tA=;
        b=Yy4r/7GIDScXh0YKhQ+K+7/UDlksVqIZSC/3XkNdbh0jR2n0ivk7AHz/vCdahltYA4
         nCl5kpQR628ANHMInbKrsuUNAJ0IeRJhHTWGJ5lRptaPLZBUY3CDpsUQ4IBW13yKlghC
         hNGOXAv11z/5BFoYVWKG3kVtOfzPudNQVxcZWOijsha4n7r8k1HkKZhoFeQvHZ98vKGA
         Ljoue7aHfqoGt+FUtm4ATV3Lwdhp0g6zRni9txWfXP6i/xF+PKdCA7wJthN4FGZmFy+0
         Rap9p7qieMK1M2hts5nf8R2IDie/DRgbKdySYqJRcpLoBPd6RTwaZ4rgDLi45DeqACou
         ZW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707474946; x=1708079746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0AaPX0aZcuXGu3S0z1IdEkLhaMcgiZgBjdGD9S23tA=;
        b=BtdKs3xoZmsNAKpnv6/phddlGqhDR7TdRcXxin/nW/x3/59oKaMl0in89/oWjQHyNW
         SiUA3NV4DMdhplFAZHcvNefGHBH2HIJg1djc4KzPy54455ISoCN8Pa3GNI8kLuAZ6Alw
         0WMWos3IpVURiE9tqlfEJ+At0AAg3ygqxqkB6BRhqPLMKVFsMeYn7RipULp5rynbNMcT
         Ha81uSxdf2u8n80Q6T+XcLhrRY/yG9k+QZ0oUOpEWHDMUkpefIS8RUjNsUV/oUhIiA+m
         lplzY8PUngxzFiPpfEbQB9EJ1AeKcLg68JDifii4ythE6JNRQb1lpFzzFgxl5INm/YqU
         zV9w==
X-Gm-Message-State: AOJu0Yx7LA5gP2j6H7t0gRLbdFY6Mp+CncQiqoY0yJvLH6Z+v81USBdF
	TOn/4BEJSbgBspHDR2JOQvn85MumEfmQjK+Ewv2co63gPdKYNXyJ7JvKmSD4Wma0M02LOnoYacQ
	anBq+nk1Ct4rfEFEXOW+nnbtkZLcyrBVBGPQNSg==
X-Google-Smtp-Source: AGHT+IFp9wZFp7PGu0RcR1uD2IpDXLMQRWQla3gRj8qRezXJyFyxHkmQv5rHnuraGHJB+dMlsRycHuckgzpTuB99yYs=
X-Received: by 2002:a05:6102:ccb:b0:46c:fb37:393b with SMTP id
 g11-20020a0561020ccb00b0046cfb37393bmr1104868vst.11.1707474946599; Fri, 09
 Feb 2024 02:35:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208161700.268570-1-peter.griffin@linaro.org> <20240208161700.268570-3-peter.griffin@linaro.org>
In-Reply-To: <20240208161700.268570-3-peter.griffin@linaro.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 9 Feb 2024 10:35:35 +0000
Message-ID: <CANgGJDoaxDLxPBxc=2kFO+omF8FcTf_3et1=J3h1BF8X27XbaQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	semen.protsenko@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 16:21, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Obtain the PMU regmap using the new API added to exynos-pmu driver rather
> than syscon_regmap_lookup_by_phandle(). As this driver no longer depends
> on mfd syscon remove that header and Kconfig dependency.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

Tested on odroid xu3 (exynos5422). Watchdog works as expected and can
reset the system.

> ---
>  drivers/watchdog/Kconfig       | 1 -
>  drivers/watchdog/s3c2410_wdt.c | 8 ++++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7d22051b15a2..d78fe7137799 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -512,7 +512,6 @@ config S3C2410_WATCHDOG
>         tristate "S3C6410/S5Pv210/Exynos Watchdog"
>         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>         select WATCHDOG_CORE
> -       select MFD_SYSCON if ARCH_EXYNOS
>         help
>           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
>           SoCs. This will reboot the system when the timer expires with
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 349d30462c8c..686cf544d0ae 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -24,9 +24,9 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> -#include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/soc/samsung/exynos-pmu.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>                 return ret;
>
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> -               wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
> -                                               "samsung,syscon-phandle");
> +               wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
> +                                                "samsung,syscon-phandle");
>                 if (IS_ERR(wdt->pmureg))
>                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> -                                            "syscon regmap lookup failed.\n");
> +                                            "PMU regmap lookup failed.\n");
>         }
>
>         wdt_irq = platform_get_irq(pdev, 0);
> --
> 2.43.0.594.gd9cf4e227d-goog
>

