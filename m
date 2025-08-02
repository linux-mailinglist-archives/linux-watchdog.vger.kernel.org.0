Return-Path: <linux-watchdog+bounces-3950-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13FB18AB6
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Aug 2025 06:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1E93ACC30
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Aug 2025 04:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A491DE2CF;
	Sat,  2 Aug 2025 04:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1AUHxVk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB67C1D63EE
	for <linux-watchdog@vger.kernel.org>; Sat,  2 Aug 2025 04:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754109571; cv=none; b=kRXdQAE2i/uSToh5diziwEMsxHoQv1ipLo8E+4w4+9X8n7JpZS+mcNG/6JlbmWrOE+cgZo5uvUtktJ4XOCY+mG52rno5gtXGtOAhZoHM7llrL6FO1sx+Q3GHTcX5GR/f8W8ECKFiK+1Mg2o7WkuDBn9XenrfarlLG7D9uc6dvi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754109571; c=relaxed/simple;
	bh=4Dg34mx4qxko4XxpK2YIUD+lvidXnjY1AMEKq1PsdMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llDpSpfGAR0Rbf1eINquv1TQcEKDG7UYKqKEtCiLnPQtbTahyJk23gNkJrorIfpLCr2t/tlpJGqkkT0bYgCmiwjwJ8dKwjXY9Oqk3NPUxlCI0p3BEGYjEInyXDOuu/ryV/+9LkxWlci5fzUM1rG+ylElvvQ7y/lMvbJ58o9GU5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1AUHxVk; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71a27d982f1so24188717b3.2
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Aug 2025 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754109569; x=1754714369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwedNykX1uMkjq1G07l2poxKV3lFWdGMwyK077ctHSU=;
        b=k1AUHxVkTdrRG8QoCLAOwIJmklsUQAh1z+pWCNhEDKxlhf9tl0q9N3CsrTpGaxfePC
         2r/jQQN67B8q90WLY7Dj8jiipJ8fcmVZNZQwAPTmwUEfBDjIgJOU9DO4AdTeeJSduUq6
         68NLDXXwWSnQBiB3ljtzUowzzcUx2510ZZ1cjCHMWBVB9sZC9qFMf0V5nUxVOvnRt2rM
         3ojPvEK7VcPVAagw6J4GgH+23A1sSpqnsl3lOoJbDoYX3huhTS5F6d9fJuN8D9YRM6UX
         htVujS7wLbTQQhsqEDf6DZRBwuCgvm/t7X6CO22/GwdS+ym9v0yLW9+Xdh2sRKpuyO0d
         F+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754109569; x=1754714369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwedNykX1uMkjq1G07l2poxKV3lFWdGMwyK077ctHSU=;
        b=od1g3An+0lMfVCqHJ8lm9IIcGIFcOI8Sc3rKN5otj11ID4XFrhrDeJh9R5i9H+l6eF
         DCvDtwbMD4G8G+D+c2jehesa+IFp2Sufjdqm2VhnGmSlSC3vXZleBTCGbaxrR6iiSMIe
         b0L6wZ6wvIvVhJMe0uSqttAB+E00t9JWdi7h5KlFOvzErCGE/hMS1g3ynNhJYVrRB/M4
         iA5nMnfGKwbKdRpb3IcQBPVmYY1SZjLf6HNz1LaXlPnE8AYXTQw0BChYSHBE4U/E9Iae
         M+uyCQ9L4Zu1zwvhEI7diMkHunIK28V0/pwnxAH5Wqc1o4xmLkZkKmbHcbu38lGHVLGD
         xDVA==
X-Forwarded-Encrypted: i=1; AJvYcCW5HLzd3bRebwK5VC0QlnlzXe0YCKCsK5mAVbcgN8bzr9PnFWLL7v0n+jCtDGXmkcCI+drmj3Cy9IbImuq9Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEnyNMQCxw+PkCDmlp2Bno4i9IZI/KIi4waM9lzmtrUPvw/Mm+
	E9RCoQHCzYny1XLJ92FSYu7t/Juvrbpkd6tj0gwWrA/3QV7AoRNPLbOejplFRTiWS4SPkX/hg6k
	2mYmToMZl1bd1k1PUakwPoFyaiPCFkLyFnclasx8vhg==
X-Gm-Gg: ASbGnctDPuAvYUqq5Np7Y3rO5V/ArFXGK0kFuIjzR4JucY5kMhMOOO7gt+TWQf/Sx9d
	OVWz+7CWUHqNxT7lOAspI+Z/zlKibRI4rFv1tRTbEnyQFX56PiVRIb4mWnTC11uxkIHxOK+OwTg
	lAWQn/iBco5FY77v2MtWgNGWVVwaCX9giyHaTu8Mw0RWNnwOfbhJZnAUIPRs685hLzPaXXKKs5i
	nV3nA9hhVpZ+q93
X-Google-Smtp-Source: AGHT+IEHE4XW/c08xnfJpKw584beuzxAr7sJRcO6jVJsJ6rlMG13mbhm7ts+7ePCLEPAybkCbOBp1u2oY29yCQQpE9E=
X-Received: by 2002:a05:690c:d92:b0:710:f46d:cec3 with SMTP id
 00721157ae682-71b7f5bc0cemr24750957b3.5.1754109568692; Fri, 01 Aug 2025
 21:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250724081337epcas2p430db7d7514b8cc05e41001f17b8b0d45@epcas2p4.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-5-sw617.shin@samsung.com>
In-Reply-To: <20250724080854.3866566-5-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 23:39:16 -0500
X-Gm-Features: Ac12FXzXiIgqxqB3CLv0jhcuQWL0uuYoB3Fa71uV_JWyZNdu94J92BGrpnV5cXk
Message-ID: <CAPLW+4=CZ=VsWerWEXGyXkomsAUJkd8eYycCRktKZjsTi-RVgg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:13=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.c=
om> wrote:
>
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_MAXCNT
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 184b1ad46ca6..16a845f41e74 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -305,7 +305,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl0 =3D {
>         .cnt_en_reg =3D EXYNOS850_CLUSTER0_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 =3D {
> @@ -317,7 +318,8 @@ static const struct s3c2410_wdt_variant drv_data_exyn=
osautov9_cl1 =3D {
>         .cnt_en_reg =3D EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> --
> 2.25.1
>

