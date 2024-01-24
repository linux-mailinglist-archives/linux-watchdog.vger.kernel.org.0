Return-Path: <linux-watchdog+bounces-488-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DF83B3E7
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 22:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF3131C2276B
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 21:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F84B1353ED;
	Wed, 24 Jan 2024 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U76+FhmA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7FC1350FE
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Jan 2024 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706131660; cv=none; b=kocVn3/72owKB4L9hcA8f5ZIkyqt/Q5bjOgIrdMwoXVSg/iyzLjhGvRWDiNeahgaHdxbcH7q25nJ/2lS/EOJPdlb0u6UwP5bSaLOgLBNK72Ph53fEglsZ9Me2+D2OJ+FW3BXjc5rysWh46JI688jkuZlbcmUrjFNkSVpNYa5M58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706131660; c=relaxed/simple;
	bh=LWNwA7ukVrj+d7v6MIv5EzJo8y49TqMJStEePkkmQ/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoGqXnrSI7ys1qypQeJl3cpzLwJjgP4k8hMa77fjLQcZ3C7zvTStXG8t3vL7qlxUllMevKjPTGl6csHR1GgyB20bgLh5QukPTsHPstR2tQqK5XT2/Vd2bpuOtegzn/59hnkxKdzsYEUhWxRHa4mWGXQ5cYRjq8F4VLde1VSkcYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U76+FhmA; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-428405a0205so10051cf.1
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jan 2024 13:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706131658; x=1706736458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5SzYBWThLP29YqBiKV1/oGuFwlfjpxBatfd0d5rA2w=;
        b=U76+FhmAASPMcI/XGIlJnnHiDExFE9LQD9Jv5/uUE9L0CSvuU3S9+jhWgTPvfnD9wu
         xCDOplcZxQ6KhXbQexJ3JvTpZBugujfaflg/K6aga2gEFG8oLoInRcCG5sz/C2c7NsdW
         x4k9k2Ajfi3GCWUMVsylWyc2ooUySsCciXJmku2fms5AVl52NKotRQAAtc1JXspfJVCC
         Wkjt5siDjbagraCGAEBNMuvWEbnqoLGTQ3SLGUCGeI72fydKQeXuf7MTL+Xi2LVtLjSp
         AMKIWJGxNgzjykv1M38pKeclZv7NnSvn6Pm2tsSKwbARnFppAy2hbHDtUArYkS0VYfHg
         IwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706131658; x=1706736458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5SzYBWThLP29YqBiKV1/oGuFwlfjpxBatfd0d5rA2w=;
        b=vFuWbktXzGGi7TSh+bMFNOKb0NJp8KUwLuM7POmClklL0Ibg3q0cfSUEFFgkUeVHKc
         JKEzEi2yimtp8Bk5xP8uK3RD0h5XWbZEIsznyUlgJl9FIUaPTsBoEjObusUMr5EtG4h3
         wjsvNGaxjn3hGmbB7vsodbiBU8R8lcGSTsvhXKm2U89/xINjvAOSyIN9SEVKp3yUc6yJ
         kDeavATCFVFXNepuRmyAW4Q8w7/y9qtD35IR7iHsAxmDwCzgWI+OpYy28p5sXNntQQuq
         KdnE3+EFCqQJ9Cm4z87msqIywEBQASwsUy36bsXjs4+cAqFibe2UPFUFEr5Gct6sHQAD
         esVw==
X-Gm-Message-State: AOJu0YztpNDFtLDeStH/xF4etpjJGifgM9YyxR9QiULnCrYkQbfZ7XhY
	JQOoHHTQkHW6YiaK1me/RWdaMJeKPG0eWC3iHw+9Qrs/9vDOHzG6uHcGxSLmjfCxOCKKSwis2tn
	2ur4GeQet8D32Nk+TempSDU9t8JgE0UzApddE
X-Google-Smtp-Source: AGHT+IHLUxnD+S8k/LidOhPXZetpLg/bV14wMev6SS1Cx+xwnEmGuy2SmETlMwfJ9REVi3suaTskX1DPqrs38ZFhjKw=
X-Received: by 2002:a05:622a:229e:b0:42a:5fe1:e8d1 with SMTP id
 ay30-20020a05622a229e00b0042a5fe1e8d1mr67647qtb.4.1706131657624; Wed, 24 Jan
 2024 13:27:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
 <20240122225710.1952066-4-peter.griffin@linaro.org> <da30a68a-e29f-45c8-aa73-02955255a457@linaro.org>
 <CADrjBPor5tMY4r0jOy7GH36auCU7dWn6Qn4ct89bsSMW4vAQOA@mail.gmail.com>
 <6c72a521-1048-42eb-ac74-d8f718a90723@linaro.org> <CAGETcx-CCpaV7R0O0HpDpoX6KxQBuJiMmKdWA8nDE-5Qj2Sa7g@mail.gmail.com>
 <f4d3aa5a-e01d-4ef3-8004-b6eac4461184@linaro.org>
In-Reply-To: <f4d3aa5a-e01d-4ef3-8004-b6eac4461184@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 24 Jan 2024 13:27:01 -0800
Message-ID: <CAGETcx_HGcuGQTO11tzX0EvnuLEaKYc4vBse1CRP0JwPqMJdQQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] watchdog: s3c2410_wdt: update to use new
 exynos_pmu_*() apis
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, arnd@arndb.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net, wim@linux-watchdog.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	chanho61.park@samsung.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 10:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/01/2024 04:37, Saravana Kannan wrote:
> > On Tue, Jan 23, 2024 at 10:12=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 23/01/2024 18:30, Peter Griffin wrote:
> >>>>>               dev_warn(wdt->dev, "Couldn't get RST_STAT register\n"=
);
> >>>>>       else if (rst_stat & BIT(wdt->drv_data->rst_stat_bit))
> >>>>> @@ -698,14 +699,6 @@ static int s3c2410wdt_probe(struct platform_de=
vice *pdev)
> >>>>>       if (ret)
> >>>>>               return ret;
> >>>>>
> >>>>> -     if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> >>>>> -             wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->=
of_node,
> >>>>> -                                             "samsung,syscon-phand=
le");
> >>>>> -             if (IS_ERR(wdt->pmureg))
> >>>>> -                     return dev_err_probe(dev, PTR_ERR(wdt->pmureg=
),
> >>>>> -                                          "syscon regmap lookup fa=
iled.\n");
> >>>>
> >>>>
> >>>> Continuing topic from the binding: I don't see how you handle probe
> >>>> deferral, suspend ordering.
> >>>
> >>> The current implementation is simply relying on exynos-pmu being
> >>> postcore_initcall level.
> >>>
> >>> I was just looking around for any existing Linux APIs that could be a
> >>> more robust solution. It looks like
> >>>
> >>> of_parse_phandle()
> >>> and
> >>> of_find_device_by_node();
> >>>
> >>> Are often used to solve this type of probe deferral issue between
> >>> devices. Is that what you would recommend using? Or is there somethin=
g
> >>> even better?
> >>
> >> I think you should keep the phandle and then set device link based on
> >> of_find_device_by_node(). This would actually improve the code, becaus=
e
> >> syscon_regmap_lookup_by_phandle() does not create device links.
> >
> > I kinda agree with this. Just because we no longer use a syscon API to
> > find the PMU register address doesn't mean the WDT doesn't depend on
> > the PMU.
> >
> > However, I think we should move to a generic "syscon" property. Then I
> > can add support for "syscon" property to fw_devlink and then things
> > will just work in terms of probe ordering, suspend/resume and also
> > showing the dependency in DT even if you don't use the syscon APIs.
> >
> > Side note 1:
> >
> > I think we really should officially document a generic syscon DT
> > property similar to how we have a generic "clocks" or "dmas" property.
> > Then we can have a syscon_get_regmap() that's like so:
> >
> > struct regmap *syscon_get_regmap(struct device *dev)
> > {
> >         return syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> > }
> >
> > Instead of every device defining its own bespoke DT property to do the
> > exact same thing. I did a quick "back of the envelope" grep on this
> > and I get about 143 unique properties just to get the syscon regmap.
> > $ git grep -A1 syscon_regmap_lookup_by_phandle | grep '"' | sed -e
> > 's/^[^"]*//' -e 's/"[^"]*$/"/' | sort | uniq | wc -l
> > 143
>
> Sorry, generic "syscon" property won't fly with DT maintainers, because
> there is no such thing as syscon in any of hardware.

Then why do we allow a "syscon" compatible string and nodes? If the
"syscon" property isn't clear enough, we can make it something like
gpios and have it be <whatever>-syscon or have syscon-names property
if you want to give it a name.
143 bespoke properties all to say "here are some registers I need to
twiddle that's outside my regmap" doesn't seem great.

> >
> > Side note 2:
> >
> > How are we making sure that it's the exynos-pmu driver that ends up
> > probing the PMU and not the generic syscon driver? Both of these are
> > platform drivers. And the exynos PMU device lists both the exynos
> > compatible string and the syscon property. Is it purely a link order
> > coincidence?
>
> initcall ordering

Both these drivers usr postcore_initcall(). So it's purely because
soc/ is listed earlier in drivers/Makefile than mfd/. And as soon as
drivers are made into modules this is going to break. This is
terrible. If you want to have a modular system, this is going to throw
in a wrench.

-Saravana

