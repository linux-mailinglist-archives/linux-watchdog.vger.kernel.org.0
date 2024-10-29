Return-Path: <linux-watchdog+bounces-2377-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EFB9B5314
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 21:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7400B21CDF
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 20:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5001940B3;
	Tue, 29 Oct 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOv5ykXX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39302076C4
	for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2024 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730232456; cv=none; b=Cq4afhd5rfj1Td9XHuu8D6cjEOi/Gua3FYtG7MnTb6rNBJbKQ/7h5Ifsy9zrDgzzDPPrEHm6df0icLAXrvHj+MOJ/ee74PAdlTgNv5ds92AXtLmkKX2kKRxlwgxVFVaE+7FPmgUrZZNFJWkRMdzgYNk0rzt4xpU0qPk2o1+/J3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730232456; c=relaxed/simple;
	bh=Lj1XuZ6x9ZfE2p1notsLVNoSBLlatTqF/B6j/Kn7spw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL1MmPxlmIVuqwp1IdACfx2SWQB3vulWEGtMs5MWiRhJDiBL0xinN602RsaawFDzLYabToayyIH43KK2qKk9YhktLG75Fz5hKCdnZBbX87iG4hU2UWa/xNSTHzBLu97QLHOWhFn2XggSkJr/+zNlQqWqJB1hcks6SJdV9cNdlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOv5ykXX; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e3cdbc25a0so65709707b3.2
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2024 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730232454; x=1730837254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02fVgYCHwHYWz9XJLOuShixyFS6jMl+g475mqm/khNw=;
        b=xOv5ykXXazUYxxNGQOHx0raUwqJD2CA+ZWDrpB+CJang3fNIgQZJWi21RLLP4O7CwL
         ooaH8QwLe4/nutWWRvJ0aq5GJRstVUv9H6yUK4OIEDxFvhl/eLlxkaqDNrnrqV5AoIN6
         wlsxcGXLsRfhYmaUU2R85GV1gOutoDFBzdqCJEDTZYZ2OcWFa8IobYPusSUAAujeExvg
         TZDRxnS++PdZ3JRbSIFM+9odxV8NIInVPNDlbLuMn9Wd0fsqkr2PWSCvOugDIrHN6eWm
         rLr3C8b9JskVxJCDxH4mEDIW4KbmxvQp0Qo/nEYCNIlwwuQhk4KMz3W0HRMITdUOUeM9
         apHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730232454; x=1730837254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02fVgYCHwHYWz9XJLOuShixyFS6jMl+g475mqm/khNw=;
        b=fczIcov5XXSOL6j+AQeS5MbuNAUJyl9s/STxnfGOUoJYEOBgAFcXft7bBK4mn/JY4A
         8rhrAKSQoc5enBcWw54qCWVGjNdzwwDL33JAtsTpqe9DYAbROZGYSR0OTdDps/X4Wxzm
         Vi/O/SosBN3fD7P03qFuNeolqunskOJww3EPELP9dOJwA/lySv8gSuWUb7ZN6wyuX4hR
         DBqE95WO1aj4TU5mUou892Bkbc6kvGP5dK/exZWHMcwcqxQxZxC4t0dFyfCm9AvcK6Je
         jZ1kF+D0xOzcYsRK5pe3CIxOjEdff7tQD43IAr3nBU4tDI1Agn4pQAN6bkXAHYWGGEXs
         oIFg==
X-Forwarded-Encrypted: i=1; AJvYcCXvVYhi9LICvMJNHsf3cqOzSHctA3nCJeZRf5mhPb01Mg0fyN9OwDXZ8VPU1jAkhyCAVSTJHYBfWp2/sy39Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrWMzjTOzwkkkgBaYoxMnjZeB4Wfn0DKQd2pyTuPi/1puMQJtN
	eIPheZPkjZtOUmkhN7nd+rDlT2Wbor1Rg5nbt7aEgEa01NQwgXO8t+TRl8tFqnnwr2XPVbpFary
	E9gAZPT+5bju6JrpjG0YkAqjI0LXlaFS/xBVLTQ==
X-Google-Smtp-Source: AGHT+IE6yjevMKWWK5dEWcL+udZz549JMdzzGNgSsO5RyF7/i8ZbdZi84RS0NDlaugK3ZRmt6j5woCgLHpdcq7icNZM=
X-Received: by 2002:a05:6902:161d:b0:e29:c45:9272 with SMTP id
 3f1490d57ef6-e3087a4ca3fmr11835983276.9.1730232453728; Tue, 29 Oct 2024
 13:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029191131.2329414-1-peter.griffin@linaro.org>
In-Reply-To: <20241029191131.2329414-1-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 29 Oct 2024 15:07:23 -0500
Message-ID: <CAPLW+4=jK63MFCRuhDkT2RH-J6dYsd0qHf_f1EeWTdrGqGLn=A@mail.gmail.com>
Subject: Re: [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs"
To: Peter Griffin <peter.griffin@linaro.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, krzk@kernel.org, 
	alim.akhtar@samsung.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 2:11=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.
>
> Now that we can register a SoC specific regmap with syscon using
> of_syscon_register_regmap() api we can switch back to using
> syscon_regmap_lookup_by_phandle() in the client drivers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/Kconfig       | 1 +
>  drivers/watchdog/s3c2410_wdt.c | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 684b9fe84fff..f3cd402e5795 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -549,6 +549,7 @@ config S3C2410_WATCHDOG
>         tristate "S3C6410/S5Pv210/Exynos Watchdog"
>         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE=
_TEST
>         select WATCHDOG_CORE
> +       select MFD_SYSCON if ARCH_EXYNOS
>         help
>           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
>           SoCs. This will reboot the system when the timer expires with
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 686cf544d0ae..349d30462c8c 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -24,9 +24,9 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> -#include <linux/soc/samsung/exynos-pmu.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
>                 return ret;
>
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> -               wdt->pmureg =3D exynos_get_pmu_regmap_by_phandle(dev->of_=
node,
> -                                                "samsung,syscon-phandle"=
);
> +               wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> +                                               "samsung,syscon-phandle")=
;
>                 if (IS_ERR(wdt->pmureg))
>                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> -                                            "PMU regmap lookup failed.\n=
");
> +                                            "syscon regmap lookup failed=
.\n");
>         }
>
>         wdt_irq =3D platform_get_irq(pdev, 0);
> --
> 2.47.0.163.g1226f6d8fa-goog
>
>

