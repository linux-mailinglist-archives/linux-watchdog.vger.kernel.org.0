Return-Path: <linux-watchdog+bounces-4011-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3BDB2B418
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Aug 2025 00:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 801333B6559
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 22:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5753827C872;
	Mon, 18 Aug 2025 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xhm86hu2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F0126B75C
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755556047; cv=none; b=WATv34LHKkvIDXy746QdOFfID0z/mEvO2ZyIb+hCJBr0RCcfHFiu2Dz/y3imhPTu/MZ59va7NbteCV0gI0eqbb6foHymvAnxgbetASEd/buWvJ4aC9wIFWTySE67itbDx8HTgohBi1efSzVq2H9cQKrdurRA0n0JBizOLAqIMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755556047; c=relaxed/simple;
	bh=4GnconOYETG187lwN0wKDqqPuWaknNEmUH5TmtWL1cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Udd3thNO0qFhsjf95ZphpyUnv+NB7KAhqsKwgcHurnhZka/SFJFR/kstkU65V1bGHZHsjUt1e4himJR2nE1IXqcTjvft0Qhj8clhSNGXDClbDwuRnGHffHi3d/0P63nlYyyh3R1WFub7wnOcIARfR34FV32gqmYk1zlE8k4W358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xhm86hu2; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e9321ed5e5eso3237395276.3
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 15:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755556044; x=1756160844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6GHquVYXzgy3eg0gKU71NB7gwzG68GwWf56FpOt+cA=;
        b=Xhm86hu2tQSdjW/onnnhODIDx9mo8V4ZDN9E9s7+0236Y3KrPJUSxJDupTYybZy4BW
         vEQJzo7OEBRt6SmUJ+b2t1UYyT4g4Bz/c8BFj//DxQS5qW+JLUporocpywiINASY3Y7q
         4gWPmMKvJ5XsjBs4IsCAr6O2UcW4cx+rh+eQVSsllwbpP7Ax8rKvLs71Pd2W9fSpSVY5
         CpLzHHYJEscP1zFGaL70dpcjn8jfoAg+DJY+Shxc+GrJvWwfGNzi7ZAfMs0BM/7EBi3X
         AoQN12IRz6fwOdpiEAMqeI+U7BHwhLaG+1NckB/F1DfKudwsInjLYUS81yD2eOGP24Jz
         +2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755556044; x=1756160844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6GHquVYXzgy3eg0gKU71NB7gwzG68GwWf56FpOt+cA=;
        b=FJ2uJUMPYMgBlB5RiGD8/E/4Z9LPzO7TpWqC/Kg/0JwF1k9jChXwOlDysTcutbDUTR
         APR3WXbkVa7u/235GzE8FwVcPr5i9/0N7iGfDf13CbE4vxTZmFmzOFoMNxJ143RwbI+g
         vrFgSE99VpM6tKElOYJSDjt9ahah3fIiRR5RW+UNPL/C7dx8PnlopXJ5wUFYUhMN4e+c
         10SO50RXfnj41Nh0HHxc4nP+jdlj0zZ1w1qSO9XbNcVdq/gIoNVADqcM7bAHML/oOYGC
         qEGi9GmoUebcQccE9++E1a7E7iw4pItlGEwxzwMNCdFJMZ8XMeYE6Cltw9hIbmn/mst6
         BOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfn3kWfKEE9+ofSfaWLVPey6DrZlrBZQlLNOWmDW1Fbph+L+DvyEHiWWrzciJh53vPEpranohpMxjpdOft2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH/yHIkQAGdMDn1cIIhRk+QWWEC3b9q8lJFztnQu2Vs1aMqJVU
	AGf3j8yovXWLa8A1zg2ECn0q/yKJ+G2sB4Lctu9K8fKVC0OOJFCkaVSi0RW+5pj6H5M901sGZDL
	TahOxrK80L9sNaxmIeSEilWm8Bvaa6yJJpXF3C4CW4A==
X-Gm-Gg: ASbGncuG+s4ET4f0fAR07iJmFNhzdzTLuKtM0upWAryjiq20drcj3OQEytF9HhHVKwP
	zTXJJKwqQ5whgr9T9FJKp2Zhk2KWPuQ0nwv67pMoOQwn0ff4vRzlH2yjHX8RNzyvDeBejfcBsiA
	gZ5oS0wWAvkfgdhenJsOf/ZUlJMhLb7dTPE2yjhTcH7VsBYnBc3cq1uzwXGhLusc9LU0qAiV0ST
	7cAVQ==
X-Google-Smtp-Source: AGHT+IEZsy19x5o98/r/4pLWO9YODI0vvSUQTbdAUdhq77x6WDR5zVwjMfdFgml+3tCPHJRWGhBSBH2CxRxauE2CLfo=
X-Received: by 2002:a05:6902:f84:b0:e93:3d8b:4e3f with SMTP id
 3f1490d57ef6-e94e61bd04emr669336276.13.1755556044632; Mon, 18 Aug 2025
 15:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>
 <20250818021826.623830-1-sw617.shin@samsung.com> <20250818021826.623830-3-sw617.shin@samsung.com>
In-Reply-To: <20250818021826.623830-3-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 18 Aug 2025 17:27:13 -0500
X-Gm-Features: Ac12FXxZ-jPQHli_YsB9TH41Az0ILCITH7EMyT1TjZMDBHz6hJ2bX99BQB7uVbk
Message-ID: <CAPLW+4m4S=j8Z0ue9LcxH+8HBsPKTfLuG9nV+6v4NLE=Qp+wnQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 9:24=E2=80=AFPM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
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
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 95f7207e390a..1e8cf0299713 100644
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
> @@ -410,9 +411,14 @@ static inline unsigned long s3c2410wdt_get_freq(stru=
ct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wd=
t)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> +       const u64 n_max =3D (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
> +                       S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
> +       u64 t_max =3D div64_ul(n_max, freq);
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

Thanks for working on this, Sangwook! It looks much better now.

>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool ma=
sk)
> --
> 2.25.1
>

