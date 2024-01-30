Return-Path: <linux-watchdog+bounces-514-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D01F841A9D
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jan 2024 04:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789B71F22D45
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jan 2024 03:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE8B376F6;
	Tue, 30 Jan 2024 03:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hg4RGQvh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB9436133
	for <linux-watchdog@vger.kernel.org>; Tue, 30 Jan 2024 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706585900; cv=none; b=CaMyDTazEeMD+Mt0SmMJ6IoV36b5xxRGbHVWhxCtcK042LXbkCzjjF2FOwQLdOT+nM5agX0U1XS4WT+RcwEJa7MQDFhLg+DV3/pPMozvYHRyMw/vx9AXWHC5Gwlc89EAwCjSZHrvSrvDZy3Kl7wTNA2W4aPTXDK2vt3/X6/tfMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706585900; c=relaxed/simple;
	bh=fo5PvMLWrFsWQEOda98OGIIezzX46PnthpzuIZiwQ1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XT7amqwq1AV0KfvYi4ZcWRtZ+mgoq5pZlPgwvv9bKEWji3AMCAEAhWrfWahPWzurHKmgzKIcjadWF3LnJCmgD6ypuqw/phXK6G/MAn2KR7PTJCjGD2VqkcEQHX3KcxgZAFO3hveKUUrgqDUHwHbnBpN1KHPTJdzloqVPL6q+Vek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hg4RGQvh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso662212a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jan 2024 19:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706585896; x=1707190696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY/tF10Vv+/aL8tVviY2SYgV3POcMq50c4gtfxwLluU=;
        b=Hg4RGQvh2XZoBXyGuxf8LpETzO7apgmtzUKev5tyIBv4W6qvya/POp+PzdckckAm9S
         ac16sXCnPKVrmx4Bx/HhQbJ6FVrKC5iidaC8FlNXiXsctRWpDu1+mM1foLZKlZP6gYYH
         QwWlvgLchVt1IzJQUxbGgMcqwZ9agB5yBAbyIh3gp17BebBII1ImsO7LZkJkZc4Q+q4Z
         bGQVgWaGfPwaLmer5CTsREjiJm/+Zquzny0oHmsVcGEbjnDbtDYB1N/1cECG551MenQu
         fjvgJBi+Z4+NVRF3UT4ZNV1Go6B+ajhTXfHb+HYTM8ZDjzWygr+6aBWPcTMerYDsoihR
         8g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706585896; x=1707190696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZY/tF10Vv+/aL8tVviY2SYgV3POcMq50c4gtfxwLluU=;
        b=iKKGCpeJ9Z/J8bcvAzHIrmLPAZ+CeEurYwDUopZUnrsqn0p4HLrmnS0P0DjqzpcHPF
         2fgMd0DNmmn+70/Wv3ptqCS2Lp4PsHLwUdL5bkTRef6JxGw5pDn8XkNwN3LzfJvbZSSg
         urxnSN469/GD5gSZ78xUT2hA3jRroxMRyO0Dc64NEMP7VC9ljiWJX32fYOzcMtQVn9yI
         9XszPMSFCJ7MrbQFTvCtRWFhp+iG2J04B3L/cbFWhKw65NDXX78LJl31E/816mM4R3yF
         xyjmWMhVLO+fXSeTI7E1Ak+5vZ8miZ1rdKHUqAIjDdRR/vYKx4uHbIRKdE5NBP261DRl
         L9cg==
X-Gm-Message-State: AOJu0Yy+l1zdYzDK8FxiZstYUUTR+7sUXoCcPil4TDprHz+SzPvH7Lzt
	jeiAkXWfrBl+uLpiKBqQyfsJNQmLDqAPs0mR8Lk0ISVIUgs5zOEPqhdfeXIV4pdjSB1Y8isR4T8
	RgOfRV0M1/IOUgAHJt0CBYhPMPVepf/jDCOalUA==
X-Google-Smtp-Source: AGHT+IEihhk8AfPxFxT8YQVFb/9crEK/g4hwYNCrgkb/E0Uo+rbxon7X9Rct3MIs3gHVHvGBeWqr8rdxgDF7bqfAHNU=
X-Received: by 2002:a05:6a20:c411:b0:19c:7f23:c062 with SMTP id
 en17-20020a056a20c41100b0019c7f23c062mr5875905pzb.14.1706585896555; Mon, 29
 Jan 2024 19:38:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129211912.3068411-1-peter.griffin@linaro.org>
 <20240129211912.3068411-3-peter.griffin@linaro.org> <CAGETcx8UsseQAHc76QaMxgMUe7cwajZVdYLA2uwpZxF90RLjJQ@mail.gmail.com>
In-Reply-To: <CAGETcx8UsseQAHc76QaMxgMUe7cwajZVdYLA2uwpZxF90RLjJQ@mail.gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 29 Jan 2024 21:38:05 -0600
Message-ID: <CAPLW+4mG2RkUgDbBBzrgCAW3covbr9eCQEFje1pYxj2hzVykug@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs
To: Saravana Kannan <saravanak@google.com>, Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 4:25=E2=80=AFPM Saravana Kannan <saravanak@google.c=
om> wrote:
>
> On Mon, Jan 29, 2024 at 1:19=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Obtain the PMU regmap using the new API added to exynos-pmu driver rath=
er
> > than syscon_regmap_lookup_by_phandle(). As this driver no longer depend=
s
> > on mfd syscon remove that header and Kconfig dependency.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/watchdog/Kconfig       | 1 -
> >  drivers/watchdog/s3c2410_wdt.c | 9 +++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 7d22051b15a2..d78fe7137799 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -512,7 +512,6 @@ config S3C2410_WATCHDOG
> >         tristate "S3C6410/S5Pv210/Exynos Watchdog"
> >         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPI=
LE_TEST
> >         select WATCHDOG_CORE
> > -       select MFD_SYSCON if ARCH_EXYNOS

That reminds me: now that exynos-pmu driver uses regmap API, does it
make sense to add something like "select REGMAP" to EXYNOS_PMU option?

> >         help
> >           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exyn=
os
> >           SoCs. This will reboot the system when the timer expires with
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_=
wdt.c
> > index 349d30462c8c..a1e2682c7e57 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -24,9 +24,9 @@
> >  #include <linux/slab.h>
> >  #include <linux/err.h>
> >  #include <linux/of.h>
> > -#include <linux/mfd/syscon.h>
> >  #include <linux/regmap.h>
> >  #include <linux/delay.h>
> > +#include <linux/soc/samsung/exynos-pmu.h>
> >
> >  #define S3C2410_WTCON          0x00
> >  #define S3C2410_WTDAT          0x04
> > @@ -699,11 +699,12 @@ static int s3c2410wdt_probe(struct platform_devic=
e *pdev)
> >                 return ret;
> >
> >         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> > -               wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of=
_node,
> > -                                               "samsung,syscon-phandle=
");
> > +
> > +               wdt->pmureg =3D exynos_get_pmu_regmap_by_phandle(dev->o=
f_node,
> > +                                                "samsung,syscon-phandl=
e");
>

This looks so much better than approach taken in v1, as for my taste.
For this patch:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> IIUC, the exynos PMU driver is registering a regmap interface with
> regmap framework. So, can't we get the remap from the framework
> instead of directly talking to the PMU driver?
>

Peter is basically re-implementing syscon driver with overridden
operations, as a part of exynos-pmu driver, in previous patch. Which
means syscon API can't be used anymore to obtain the regmap. Do you
have particular API in mind that allows getting a random regmap
registered with devm_regmap_init()?

> -Saravana
>
> >                 if (IS_ERR(wdt->pmureg))
> >                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> > -                                            "syscon regmap lookup fail=
ed.\n");
> > +                                            "PMU regmap lookup failed.=
\n");
> >         }
> >
> >         wdt_irq =3D platform_get_irq(pdev, 0);
> > --
> > 2.43.0.429.g432eaa2c6b-goog
> >

