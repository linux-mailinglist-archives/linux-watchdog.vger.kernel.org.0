Return-Path: <linux-watchdog+bounces-490-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C183C0C7
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jan 2024 12:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27235B29FF1
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jan 2024 11:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD222C692;
	Thu, 25 Jan 2024 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NoJOyvcf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934A62C68A
	for <linux-watchdog@vger.kernel.org>; Thu, 25 Jan 2024 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706179730; cv=none; b=cOIYlvChKTFUbPhZWBCrLWRrLn2NlQODLaNlhEM5nQjPgeKGcZNnW/3BBhrcT9LLhiqxCmOMYT7L+3bDmfM8hk4YHS0/PYwBG5IeTEd/oKnuAt2eKE44kqhUdVTPBcnpKoHrx5NHZ943n6ZGI4ImOM4fTrI9+sRl0KXa7w2Nej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706179730; c=relaxed/simple;
	bh=dD9ASP7AItpjc32mtRonAKJYsomCbQMJVZmHnMoDXtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH6D29wEnGvO70QECPlWNrip0h3ihvqUZfQ9Mv89rM2hurHJxaF2V3ZF8PqdrgovN4I4VGKWjQ2zB85tuPAENZlZ7M0xyEULS8tke0C2khNWifziad/pEwXOMjyZIMiavPwWPVLA5Pr3AUtmOcGPOYHi3y3nYmaZb0Nwk2C6tA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NoJOyvcf; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-783b7ec94d4so94923485a.1
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Jan 2024 02:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706179727; x=1706784527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=714b/NnDPMdp2ZdQ3AWnpaMxa/q2envc65xjfUr/MfQ=;
        b=NoJOyvcfUdqI4rUMo9zkeOi6DIulYDNOKTBYdf100C8bsB2lj/s/2zK3MhmcQm4XKJ
         g9/6RrftstO2Lpzu6S6nTrn4RUs/5QksvdyU3SIh3LsRQTb+5HHCiT0zpvjW8ydgOSK0
         c9e1HSXAx/yHuaATeynzwaWJfzZGGRHs+gg0BtcO9QhdS4lMtfEmP1mI8Xg0trOMXfwP
         BYxZP8KesdAG5qN/GUGgBlY627SW5j2WUTPPUS4H4nO4piNGeD+1yV1us6fx4dsl8hCF
         Gd2sBitAuO0IjhSO+rVyQBonHS+7ck4ygvr124bTD+3tTiI4zrmJIyWbUqb7zLtp5ZWy
         Kfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706179727; x=1706784527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=714b/NnDPMdp2ZdQ3AWnpaMxa/q2envc65xjfUr/MfQ=;
        b=kCZqYXuAREeVsVLsuquAofQLA6EwEsD4lWGNj44b5uIhrzKOnPsaoZ7YvQR4c8+rQY
         KGLp9SXPBMqusKdT0BsjF3R7W7gtc3EQwxME/rN9YIV+HH7O1Hipwsg4bhYD46YAuJS9
         0hWg853kVYrxLKUa9T+mYc3xOq2h/uaP/MoL0C1EMNDQR7EqZEuEPNVpzHIEdnPNnv4F
         f4z+gIHCfiipbaBpX0vfLYxDBGLcxZweRrLczvLJHWhLI3l6+8rg79rofxHzsgsT8ihy
         /4kx8jx9eoIl63pDZ3TkO8tfN0P/Qdrdtl2e66aVKjYRSJBqQpduFqNQh8b3UBVnEWFN
         VVTg==
X-Gm-Message-State: AOJu0YywRLIc2Dv0lpwUrJY9XbraXeVL/5ItGUQMAFDN2EoMm6VTPM9k
	S2isXswfMFUR3UhDeT+YogyFyfIqRW2/SPYTe1qh/M9tIHNj3Axz2VEqW5nNjaifdjIvUj2peWP
	+uuXv3VhGwkcLV19waUkwwiIZnNVGxLEGI+i2pA==
X-Google-Smtp-Source: AGHT+IHSNRTCqABkpiFJ88rnfpvQxM0isfEvlY334nV9mvLZQSLTOBpoUl+InAp+5NGcIzotfN/h0ZJLO7z8hwoHXkw=
X-Received: by 2002:a05:6214:2a47:b0:680:b72b:7d7f with SMTP id
 jf7-20020a0562142a4700b00680b72b7d7fmr892023qvb.127.1706179727544; Thu, 25
 Jan 2024 02:48:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
 <20240122225710.1952066-3-peter.griffin@linaro.org> <CAPLW+4=G5YiTZaZ5k=H1YciUwOEjKSF0w9Hd8rwymA71UmJnRQ@mail.gmail.com>
 <CADrjBPqbToXYUBx=reE5_W4U4aUUJRFs+FC5AHsrQ6mRYB9iAA@mail.gmail.com> <CAPLW+4=2dx3T=Snn-WstAQXhrDNE3as1Qgjr+LK+xwscHivBBQ@mail.gmail.com>
In-Reply-To: <CAPLW+4=2dx3T=Snn-WstAQXhrDNE3as1Qgjr+LK+xwscHivBBQ@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Jan 2024 10:48:35 +0000
Message-ID: <CADrjBPoYpVDYptJSEd+=5x+eRnsuZzm4uOUokNEpEX2dxMGtiQ@mail.gmail.com>
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

Thanks for your review feedback!

On Wed, 24 Jan 2024 at 20:23, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Jan 24, 2024 at 4:02=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Hi Sam,
> >
> > Thanks for the review feedback.
> >
> > On Tue, 23 Jan 2024 at 18:56, Sam Protsenko <semen.protsenko@linaro.org=
> wrote:
> > >
> > > On Mon, Jan 22, 2024 at 4:57=E2=80=AFPM Peter Griffin <peter.griffin@=
linaro.org> wrote:
> > > >
> > > > Newer Exynos SoCs have atomic set/clear bit hardware for PMU regist=
ers as
> > > > these registers can be accessed by multiple masters. Some platforms=
 also
> > > > protect the PMU registers for security hardening reasons so they ca=
n't be
> > > > written by normal world and are only write acessible in el3 via a S=
MC call.
> > > >
> > > > Add support for both of these usecases using SoC specific quirks th=
at are
> > > > determined from the DT compatible string.
> > > >
> > > > Drivers which need to read and write PMU registers should now use t=
hese
> > > > new exynos_pmu_*() APIs instead of obtaining a regmap using
> > > > syscon_regmap_lookup_by_phandle()
> > > >
> > > > Depending on the SoC specific quirks, the exynos_pmu_*() APIs will =
access
> > > > the PMU register in the appropriate way.
> > > >
> > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > ---
> > > >  drivers/soc/samsung/exynos-pmu.c       | 209 +++++++++++++++++++++=
+++-
> > > >  drivers/soc/samsung/exynos-pmu.h       |   4 +
> > > >  include/linux/soc/samsung/exynos-pmu.h |  28 ++++
> > > >  3 files changed, 234 insertions(+), 7 deletions(-)
> > > >
> > >
> > > [snip]
> > >
> > > > +
> > > > +int exynos_pmu_update_bits(unsigned int offset, unsigned int mask,
> > > > +                          unsigned int val)
> > > > +{
> > > > +       if (pmu_context->pmu_data &&
> > > > +           pmu_context->pmu_data->quirks & QUIRK_PMU_ALIVE_WRITE_S=
EC)
> > > > +               return rmw_priv_reg(pmu_context->pmu_base_pa + offs=
et,
> > > > +                                   mask, val);
> > > > +
> > > > +       return regmap_update_bits(pmu_context->pmureg, offset, mask=
, val);
> > > > +}
> > > > +EXPORT_SYMBOL(exynos_pmu_update_bits);
> > > > +
> > >
> > > This seems a bit hacky, from the design perspective. This way the use=
r
> > > will have to worry about things like driver dependencies, making sure
> > > everything is instantiated in a correct order, etc. It also hides the
> > > details otherwise visible through "syscon-phandle" property in the
> > > device tree.
> >
> > In v2 I will keep the phandle to pmu_system_controller in DT, and add
> > some -EPROBE_DEFER logic (See my email with Krzysztof).
> >
> > > Can we instead rework it by overriding regmap
> > > implementation for Exynos specifics, and then continue to use it in
> > > the leaf drivers via "syscon-phandle" property?
> >
> > I did look at that possibility first, as like you say it would avoid
> > updating the leaf drivers to use the new API. Unfortunately a SMC
> > backend to regmap was already tried and nacked upstream pretty hard.
> > See here https://lore.kernel.org/lkml/20210723163759.GI5221@sirena.org.=
uk/T/
> >
>
> Oh, I didn't mean creating a new regmap implementation :) To
> illustrate what I meant, please look at these:
>
>   - drivers/mfd/altera-sysmgr.c
>   - altr_sysmgr_regmap_lookup_by_phandle()
>   - arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>   - drivers/mmc/host/dw_mmc-pltfm.c

Thanks for the pointers :) I hadn't spotted this when looking
previously. I did find the previous threads I linked to and (it
appears wrongly concluded) that such a regmap SMC would not be
acceptable.
>
> They basically implement their own regmap operations (with smcc too)
> in their syscon implementation. So they can actually reference that
> syscon as phandle in device tree and avoid exporting and calling
> read/write operations (which I think looks hacky). Instead they use
> altr_sysmgr_regmap_lookup_by_phandle() to get their regmap (which
> performs smcc), and then they just use regular regmap_read() /
> regmap_write or whatever functions to operate on their regmap object.
> That's what I meant by "overriding" the regmap.
>
> Do you think this approach would be clearer and more "productizable"
> so to speak? Just a thought.

Keeping it as a regmap was certainly always my preference. I'll try
and re-work it in a similar way and see if I hit any blocking issues.

Thanks,

Peter.

