Return-Path: <linux-watchdog+bounces-3980-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754BB1CA89
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 19:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18BC218C4B78
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 17:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0442229CB49;
	Wed,  6 Aug 2025 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="snZU1FjK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200629C32B
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754500681; cv=none; b=CsM9jtg5MNGE33XC2De5m5zp8raf4azjmBjuZhusn4ptJncQGZyk22UEuEY6SfRPvJW78ONIepgrBBh23J9etDXcPffG7slhLZJQD9wE6vtxo9bsRlzfBAK9wQl0bw2MKvMCN3ObrWE3kStsNWKuey2VyYAOM5OKeU19NnQYeNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754500681; c=relaxed/simple;
	bh=Y0fD4MpRo3g7NK5y3s9VeqYtv1/oJ4ikGjJ95epd7uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pkfzn+rFGK2jBJZNKm0n6jCbtycydr267PDKeB8Nr2Cd/8+ux+WNhpl4PTJv1ZXsDs6VJ8SjmNNBiaDH7cd1U35lAJhJd60CfofiiNUIEtuIV2plcYD1xOGcYOxy/iQ3DiuxTAPTDDdFiBkiKBmd17iUfYBNNS6R1fnem8jRD9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snZU1FjK; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71b6ad2d6fcso472847b3.3
        for <linux-watchdog@vger.kernel.org>; Wed, 06 Aug 2025 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754500677; x=1755105477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCJFY1Ry1l45cujmFWN8iUaZroZ2v+N4zhO/u5g0qWo=;
        b=snZU1FjKYXt9Xjr3LWONV8Z5qsaR+qsU3ZZ8DUO2IxnBmbXN+ci4hKywQpjvIOdZgz
         Jx8P9J0wteBg9JhbPUpxI/fh5Q9PVnqh0XtKgr/2S5YZE3jhEHhiIzG++vXXdccWt03e
         OmLMAgxzIeo5p7C3/joiOxauQ0LYPI1YFAcE2jlF0l5F+1diqR6W0LWnIUxG7ArcFp4D
         +upo7BrtWilipH/UOlIrOAwAOcwDDP+oB7CdWWTnZmov+4c5rpGEJnymnE7u71M2aXpY
         2TjKCBySiYDFIg2h3QqqqE5g03nGcVTLuF/7ysX6rUdV13sUGHQV4bfOY9dcE4wLpS4s
         jRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754500677; x=1755105477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCJFY1Ry1l45cujmFWN8iUaZroZ2v+N4zhO/u5g0qWo=;
        b=v2SFpk+AWFSWdBuJ4GYRCM0ySmh+G2gvPxBaHi90YeX2C7QoXOU1gcSBWBUJXwttpg
         qpE8XGl0KSIeANVn7BPZY3CVhlhkC4seOPvD8L7SGj1DgZosQpj1g8dgMFALymbI7Nj+
         Six5IkiluKHrMGwvDhjrQ6m4+YcxLofQrrSZrbUgx3xVCnKKDLVHWM4F6gccPFwsc/2k
         ZRe+ugBz0W2fWLcG9pt1EWZTbpmXaV+B8KK3J+I1rlTtv+/q1meSheqCMeno5qeiLjZ2
         QCa9x5fJ9y8YdaLHejjnRsmCM9Xw7KlMgdoBcGK2W0IQ1K6T7jgAojLI3EZHOdN60GiY
         YAdg==
X-Forwarded-Encrypted: i=1; AJvYcCXZbtejCYzYbPNoyDxZUUXATs6ETko8ABupptY81md6jsbaqh+HEsbJ1HknYgvt/QuOcPx9s4iNu2IJ3HAa6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvTeP7Zi3Vs9PNo+5ZPEmUEqRmPLDYip7xl178ts8tJ58OSmPM
	D1VADrxr2VKjgsjE5W/wy13zGXmnV94jZV+/s9Xi4MKDiytvekrW8wclOdnQJPDuR6txigCIFAq
	1t9W5CzRcpxkXD0tray0OI7r5+Lx8h6gPWMfwXCuo0Q==
X-Gm-Gg: ASbGnctVX7IVE9pKdVMDCLvoHGcdtQPv2Z+ShScSaJA6Ck9OgVm30jAJ+kkwNzrL7z3
	SSm3epY6gYLHpIJ7j1JoM2RYlhpBf566WBxM4xJH47YOH3vHw04Z7xGqpI+EP/WNMnHE7Lgsmws
	lQJGH5MAEcPTetUrfGwJ2irjIqopVGzTnaTnl/UYssNp4tTFvwpku+yzshG0AGYqbI4IJxgSwXU
	9LBSMlZlQILGJzi98eB08F6rZk=
X-Google-Smtp-Source: AGHT+IF/PATUAgO1kyiILLwJ2Hz+mfCVgzAsnenKM/M4eB9tFIphDugm0X2Ki4Larr5HlLbqkJkCKKOb501IL1PCi98=
X-Received: by 2002:a05:690c:f03:b0:71a:3484:abe8 with SMTP id
 00721157ae682-71bc98866fbmr51496647b3.34.1754500677372; Wed, 06 Aug 2025
 10:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1@epcas2p1.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-3-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 12:17:46 -0500
X-Gm-Features: Ac12FXyGsSXeAvPSWY26uUPOsx4RabuRz1OCuoO1ZxYtOJ0aBX2ZDz4rGIPWY70
Message-ID: <CAPLW+4=Lf5rs3p3+D17HDGYd1FHk-PDghOq4fygRzZi7VZXcHQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 2:00=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.co=
m> wrote:
>
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remaind=
er
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> To resolve this issue, the order of calculations in the computation proce=
ss
> has been adjusted.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..0a4c0ab2a3d6 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -27,6 +27,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/math64.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -410,9 +411,13 @@ static inline unsigned long s3c2410wdt_get_freq(stru=
ct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wd=
t)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> +       //(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV =3D 0x8=
000

This single-line comment style (//) is usually not used in the kernel
code. Prefer multi-line comment style instead (/* */). More
importantly, this comment is not needed: using the raw 0x8000 value
below is still hard-coding it, and this comment is not the best way to
fix that. So declare either a proper constant or a define, and use it
further. I'd go with this:

    const u64 cnt_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
                        S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;

and then:

    u64 t_max =3D div64_ul(cnt_max, freq);

Sorry I didn't catch your related comment earlier in v4!

With that addressed, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +       u64 t_max =3D div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       if (t_max > UINT_MAX)
> +               t_max =3D UINT_MAX;
> +
> +       return t_max;
>  }
>
>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>

