Return-Path: <linux-watchdog+bounces-520-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ACF842816
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jan 2024 16:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A482878F7
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jan 2024 15:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2265C823D5;
	Tue, 30 Jan 2024 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBD5wgfq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AEC81AB9
	for <linux-watchdog@vger.kernel.org>; Tue, 30 Jan 2024 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628711; cv=none; b=AuYXwT3RenzPpCNWCtroT8vUEeFj0bzG1NuVTjwbX1h5FzAoTOhu6HHv60T/xdJn1AKqf9hkhhtt+dytH67S3H670k7nyYyynB0X1o39qTqPDEHg4S3/hNxYtVnPQP/8gtJA6yBwE83BrrEmqwivBhAA6liCzwtGwFtYbc8ylak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628711; c=relaxed/simple;
	bh=BiSnpof6s0wfNf9+A13iFmx1FmKZ23viaAe7Jyf69kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SC00lK67KpwCIpQRO9fBsAH1DkSgpJ79wqnsScmGKpxlaewr8oWmUBIAa1qNgUmpiRKptNzV9+DAWTd6s4DohW5kUOMaZwNbiqphgoQvYKKqDqCj+osCToSDrmWEnbA4p/bpiWBpCDY50ybQiDNLT4ehHZGjLSoIIaYO6Ko8U/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBD5wgfq; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-68c4fb9e7daso10429556d6.3
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jan 2024 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706628707; x=1707233507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyFAq1Eg2RJvLWqRzFuQdXmR0HpMNogzZgkepdLa9/U=;
        b=IBD5wgfqKNqMaAgeh42HPplmoOZhKFJSddBoWdURM8oi6MZwhWi+Tyql1VcnolE4FK
         YUdM4cAitKRBJ533N+6uB+gaf7mql7JihSXliyJ44o6TSiHBi9YEa4CAZWS+uFVk/j3h
         /7dWWMrdUJnkQA0NiKGpzs0jtJq2cbVTTBliyRf/20qwAHDi42bB3tPS74AyO0F+/oAh
         FVNQHouDjxxEkffjf39d/pWeWxwdNzNdRvdnTxGeJrYTw5KRDyIOSVYLE6qWzm1QMt68
         JdEKzU1GYe6ZQoAiRz8aw4ouEzlDskfVdLIj84exdvWSecpWSU7hqhyiJqnfhh7KMX4x
         62fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706628707; x=1707233507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyFAq1Eg2RJvLWqRzFuQdXmR0HpMNogzZgkepdLa9/U=;
        b=fB5MUzTIIFEYJiRib+0dKq+wkag2wKYo1okUTPH3d/czutIXHnIOe91D0D7GMwhAqe
         FfFAGu2Q1ntKBdhHcFH2dEtutsBu2xP3yjbiJPqUnVtLdAOLBJZq+RPuYYAXm7AfAt2t
         cjjrj3jRLH1BB+BhxoOMKrBLGgHsVKbqxE9thFrEJ0hVLON9OCYk7Fg8EfmU5vHYYEvl
         Ak+1XcxJe1ZeXg/dR0bzf/Wthej+fqMhpFmkcSG15+/EdtB1KAoEk0+IJFli+8uZOQwd
         6nO1RuYTFAwJtVN8AST0AbZoy057p/oym+pREg40iI7H7SnxmAe04/P0q/fJyK1pvMlS
         elcQ==
X-Gm-Message-State: AOJu0YyjI6WpS2Ypyj8MwN2y8XnOePHMKE/mE7ugYboQ+zSQsRLRWacD
	YqlNUUCukUwiE/Z4fqo3+NKvBYDO7vUeSx0NOPyCocqIrBw4bpnpqaXeTRXH22BnfGafeovp7G0
	+Twkq91XtaiCioKs9HulZ4Q35W1uMo9dnY9Wl1Q==
X-Google-Smtp-Source: AGHT+IE9wCsA8OMUwsAtj9eouk/XJiMtJxIGPk+xD0QUnQxHNQz4KNhObmSuHuPnZPemueo0vMoDgt9lN4w74OWnQkc=
X-Received: by 2002:a05:6214:248e:b0:68c:499f:f803 with SMTP id
 gi14-20020a056214248e00b0068c499ff803mr7669302qvb.30.1706628707108; Tue, 30
 Jan 2024 07:31:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129211912.3068411-1-peter.griffin@linaro.org>
 <20240129211912.3068411-3-peter.griffin@linaro.org> <CAGETcx8UsseQAHc76QaMxgMUe7cwajZVdYLA2uwpZxF90RLjJQ@mail.gmail.com>
 <CAPLW+4mG2RkUgDbBBzrgCAW3covbr9eCQEFje1pYxj2hzVykug@mail.gmail.com>
In-Reply-To: <CAPLW+4mG2RkUgDbBBzrgCAW3covbr9eCQEFje1pYxj2hzVykug@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jan 2024 15:31:35 +0000
Message-ID: <CADrjBPr0HjympgaC+eiVdTJuFbNes26gPEMJfdiLYFDUAjpU3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, arnd@arndb.de, krzysztof.kozlowski@linaro.org, 
	linux@roeck-us.net, wim@linux-watchdog.org, alim.akhtar@samsung.com, 
	jaewon02.kim@samsung.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam & Saravana,

On Tue, 30 Jan 2024 at 03:38, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Mon, Jan 29, 2024 at 4:25=E2=80=AFPM Saravana Kannan <saravanak@google=
.com> wrote:
> >
> > On Mon, Jan 29, 2024 at 1:19=E2=80=AFPM Peter Griffin <peter.griffin@li=
naro.org> wrote:
> > >
> > > Obtain the PMU regmap using the new API added to exynos-pmu driver ra=
ther
> > > than syscon_regmap_lookup_by_phandle(). As this driver no longer depe=
nds
> > > on mfd syscon remove that header and Kconfig dependency.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/watchdog/Kconfig       | 1 -
> > >  drivers/watchdog/s3c2410_wdt.c | 9 +++++----
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > > index 7d22051b15a2..d78fe7137799 100644
> > > --- a/drivers/watchdog/Kconfig
> > > +++ b/drivers/watchdog/Kconfig
> > > @@ -512,7 +512,6 @@ config S3C2410_WATCHDOG
> > >         tristate "S3C6410/S5Pv210/Exynos Watchdog"
> > >         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COM=
PILE_TEST
> > >         select WATCHDOG_CORE
> > > -       select MFD_SYSCON if ARCH_EXYNOS
>
> That reminds me: now that exynos-pmu driver uses regmap API, does it
> make sense to add something like "select REGMAP" to EXYNOS_PMU option?

Good point, I will add that in v3.

>
> > >         help
> > >           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Ex=
ynos
> > >           SoCs. This will reboot the system when the timer expires wi=
th
> > > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c241=
0_wdt.c
> > > index 349d30462c8c..a1e2682c7e57 100644
> > > --- a/drivers/watchdog/s3c2410_wdt.c
> > > +++ b/drivers/watchdog/s3c2410_wdt.c
> > > @@ -24,9 +24,9 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/err.h>
> > >  #include <linux/of.h>
> > > -#include <linux/mfd/syscon.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/soc/samsung/exynos-pmu.h>
> > >
> > >  #define S3C2410_WTCON          0x00
> > >  #define S3C2410_WTDAT          0x04
> > > @@ -699,11 +699,12 @@ static int s3c2410wdt_probe(struct platform_dev=
ice *pdev)
> > >                 return ret;
> > >
> > >         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> > > -               wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->=
of_node,
> > > -                                               "samsung,syscon-phand=
le");
> > > +
> > > +               wdt->pmureg =3D exynos_get_pmu_regmap_by_phandle(dev-=
>of_node,
> > > +                                                "samsung,syscon-phan=
dle");
> >
>
> This looks so much better than approach taken in v1, as for my taste.
> For this patch:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks!
>
> > IIUC, the exynos PMU driver is registering a regmap interface with
> > regmap framework. So, can't we get the remap from the framework
> > instead of directly talking to the PMU driver?
> >

I'm not aware of any existing regmap API that does that. A quick look
through regmap code I can't see any global state that is stored on a
regmap_init() for example of all the regmaps created in the system.

As Sam mentions below, prior to these patches the syscon device would
be creating the PMU mmio regmap and consumers drivers would be
obtaining the regmap by going through the syscon driver. After this
series we instead talk to the exynos-pmu driver to obtain the pmu
regmap which can either be one with overridden operations for issuing
SMC calls to do the register accesses or still a mmio regmap.

Folks tried in the past to add a SMC backend to regmap similar to
regmap_mmio and add support for it into syscon driver but this was
nacked (see here
https://lore.kernel.org/lkml/20210723163759.GI5221@sirena.org.uk/T/)

>
> Peter is basically re-implementing syscon driver with overridden
> operations, as a part of exynos-pmu driver, in previous patch. Which
> means syscon API can't be used anymore to obtain the regmap. Do you
> have particular API in mind that allows getting a random regmap
> registered with devm_regmap_init()?

Thanks,

Peter

