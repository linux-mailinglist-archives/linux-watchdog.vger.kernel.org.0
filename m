Return-Path: <linux-watchdog+bounces-484-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FE83A64D
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 11:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8AA1F2278F
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 10:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E89182DB;
	Wed, 24 Jan 2024 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CTZ1JlSz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66E18E00
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Jan 2024 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706090562; cv=none; b=n1vtDjc24BEIIzs8UK21yfXHmGBjiZy7Zf4+5kmWquAxZWF1aG0H14QeW8R+JETyi3uHVAJne28cbqD81tHlNjuqYop+PKEAUemXnpOHQatbM9tHbzLP63WurHBUQps/W+kBB75owcpgvecCRHbDaf2OcHgK+vMCjWhVqsWSHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706090562; c=relaxed/simple;
	bh=eZb8KsVdKCKnn8GCgoqYmSVfuu/Q0go0ckHPs8r4gHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmJtDQ/limyI5H0+j79FC4GbaH2b7oj7+Pea0ZKzksBW1ZZQ2B94hh8xNX+BWuBs9WJ6DuXCoietlchITVrq1r9uG674dVN5ZO9ZHd1KNqEePuPZ9FfMOMcQLG9gScNm7jckSDf2qKKCFdEORYuyk4Pdlel6wmzbsmEE8gjUP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CTZ1JlSz; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e0af93fdaaso4670446a34.3
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jan 2024 02:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706090559; x=1706695359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUpwH1vvlbubZBmKYelxmGkgmJALQKDTM110+USmxN4=;
        b=CTZ1JlSzmYzjW/1gSgdcic0Rofquz1rTBIhY4ClIHvHBhe6TG2uLDpolg2+eNbQTpV
         YZdSjloomPoZccsNH16ltOmkIRusBP/mds7dp6pvlpF6x9newN11amR7eIn+3dC2cLI6
         R7mi73lny74n82ZDmEVoheuOW1kauPqm8+f1755CG65kR3s/RhMPIaW26Ym72OrOHNOU
         Umv3vThfXvBPYVQR4IMuyhTxNPdYuOoggI8FEaertHZTfxjNiBJgcz0VVMdoRQSWL7xu
         YhYxw9eDzGYRvaY79lsCfvqScYAPKQtqs4CorlNR5+StMSyM+YavfKERuo17xo2lJFCB
         sgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706090559; x=1706695359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUpwH1vvlbubZBmKYelxmGkgmJALQKDTM110+USmxN4=;
        b=SUBLCpV8F+xFyZxOt9XVk/J06Sr1iZ+qdnGGI96fGB3LGqx6+mApL1CL8bPj4UHr8L
         s+wS11IHIXWaBR9A94sAY8kAgGVqawR9TRT53YDATAf+dM+f1kY1U8KVo6wKHm+3HCVT
         MDTT0lsZ6O3fzxncARO5YtFNjbJpykyCGNe2NiUP1lJE3lIqKCw/79si9F5jrzfiFQEw
         4byg2pw8B4xk/kHf1aRm/+UtgSYDVTt8TOh9f3oMZipNl0kssa/u3rdsPv+9H8nIg7OQ
         eXebcEOVvpkANML2RPLH7eY2kEVJRpQFIKEqKT7i72mjMpDcXTgbfsKrkEOp97Rv4crL
         evzw==
X-Gm-Message-State: AOJu0YzzdwHGiaA8Y+hDYWXxQN4C6nd1zigNzhNpHGkWST7oeedyORea
	8SA4J+2eerRJKXaHuaYbzdbfTAvgP2Acax6X2GaYIiedLk0PDZr/AcAj4D9B6thJP4j1Z4hnVyU
	6Mt18mpFCHy2UezGt4Qkz5F4DBGiC6IWzrkBDxphkJUUb9WfszxE=
X-Google-Smtp-Source: AGHT+IE79HSwfv0oyaKG/O5pd/o2yGI9NCIYgU09VQo436h6rDnZM1AO/HGfrAmwLFfRmFGKRkbG+6cW5fHWetbuYc8=
X-Received: by 2002:a9d:6305:0:b0:6dd:eb93:5b20 with SMTP id
 q5-20020a9d6305000000b006ddeb935b20mr1341915otk.21.1706090559206; Wed, 24 Jan
 2024 02:02:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
 <20240122225710.1952066-3-peter.griffin@linaro.org> <CAPLW+4=G5YiTZaZ5k=H1YciUwOEjKSF0w9Hd8rwymA71UmJnRQ@mail.gmail.com>
In-Reply-To: <CAPLW+4=G5YiTZaZ5k=H1YciUwOEjKSF0w9Hd8rwymA71UmJnRQ@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 24 Jan 2024 10:02:27 +0000
Message-ID: <CADrjBPqbToXYUBx=reE5_W4U4aUUJRFs+FC5AHsrQ6mRYB9iAA@mail.gmail.com>
Subject: Re: [PATCH 2/9] soc: samsung: exynos-pmu: Add exynos_pmu_update/read/write
 APIs and SoC quirks
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, jaewon02.kim@samsung.com, chanho61.park@samsung.com, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Thanks for the review feedback.

On Tue, 23 Jan 2024 at 18:56, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Mon, Jan 22, 2024 at 4:57=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Newer Exynos SoCs have atomic set/clear bit hardware for PMU registers =
as
> > these registers can be accessed by multiple masters. Some platforms als=
o
> > protect the PMU registers for security hardening reasons so they can't =
be
> > written by normal world and are only write acessible in el3 via a SMC c=
all.
> >
> > Add support for both of these usecases using SoC specific quirks that a=
re
> > determined from the DT compatible string.
> >
> > Drivers which need to read and write PMU registers should now use these
> > new exynos_pmu_*() APIs instead of obtaining a regmap using
> > syscon_regmap_lookup_by_phandle()
> >
> > Depending on the SoC specific quirks, the exynos_pmu_*() APIs will acce=
ss
> > the PMU register in the appropriate way.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/soc/samsung/exynos-pmu.c       | 209 ++++++++++++++++++++++++-
> >  drivers/soc/samsung/exynos-pmu.h       |   4 +
> >  include/linux/soc/samsung/exynos-pmu.h |  28 ++++
> >  3 files changed, 234 insertions(+), 7 deletions(-)
> >
>
> [snip]
>
> > +
> > +int exynos_pmu_update_bits(unsigned int offset, unsigned int mask,
> > +                          unsigned int val)
> > +{
> > +       if (pmu_context->pmu_data &&
> > +           pmu_context->pmu_data->quirks & QUIRK_PMU_ALIVE_WRITE_SEC)
> > +               return rmw_priv_reg(pmu_context->pmu_base_pa + offset,
> > +                                   mask, val);
> > +
> > +       return regmap_update_bits(pmu_context->pmureg, offset, mask, va=
l);
> > +}
> > +EXPORT_SYMBOL(exynos_pmu_update_bits);
> > +
>
> This seems a bit hacky, from the design perspective. This way the user
> will have to worry about things like driver dependencies, making sure
> everything is instantiated in a correct order, etc. It also hides the
> details otherwise visible through "syscon-phandle" property in the
> device tree.

In v2 I will keep the phandle to pmu_system_controller in DT, and add
some -EPROBE_DEFER logic (See my email with Krzysztof).

> Can we instead rework it by overriding regmap
> implementation for Exynos specifics, and then continue to use it in
> the leaf drivers via "syscon-phandle" property?

I did look at that possibility first, as like you say it would avoid
updating the leaf drivers to use the new API. Unfortunately a SMC
backend to regmap was already tried and nacked upstream pretty hard.
See here https://lore.kernel.org/lkml/20210723163759.GI5221@sirena.org.uk/T=
/

regards,

Peter.

