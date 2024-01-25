Return-Path: <linux-watchdog+bounces-492-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5483C377
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jan 2024 14:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574C11F2341F
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jan 2024 13:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6373F16423;
	Thu, 25 Jan 2024 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="olHRx0yP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A993050A69
	for <linux-watchdog@vger.kernel.org>; Thu, 25 Jan 2024 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706188802; cv=none; b=nUps5hd+fBfZcZnKjRoh95UhAUxytbwzMlDx8ab887EQZAlbh3kDzipQsHnG2636+radKqXeLqaXTFS8udjyrg4Ruh50Ms7ppPw7T7uTKxRqX81yVY5hUQtX3/uQjfSZcwnysKMuyoErcOioOl/uaE1McBToM/uaw6oVC2Q2Tb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706188802; c=relaxed/simple;
	bh=4C8aReWTPAu/XM/cFpPUFHs86ll7swMdml9iRygfv68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qwn1bKFCmaPkDslGaPnmW0zNH+R3eFxcwcAMZggwWVdpDM06dae7VGT5/FPAMnqOCtBiBVil31buXXY8GryRepm37Kw3myeWhoHnj7LD/N88sohnEKga0XeCBIa6US1Ej1w1JqZjOBjAMOIBABRX6zmV9/1hnBzH6BdIs3jGvw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=olHRx0yP; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bd7c5b2439so3837078b6e.1
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Jan 2024 05:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706188800; x=1706793600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=587jgwVYpxZvmZpAiByRkGCro3u2An7GsZ6G/Kd3gVA=;
        b=olHRx0yPk46HcZsmmnwZcPdidwzN+SjcKe5+fZfynoxtKOenlZ9jTQEM2qZyG5k66j
         flLEv7FoYahZBbs+6/CzIYzPrXRE2fxj03Hcm5PhY4MCCvpk8/ICnNBt7ITnZh2zL1ko
         wG7icEmHFggdPOxZSbZdypLDQ4Uq+1UKoePLJ8/QR4QlbCpIl+OcqoX96eSwro2EYlcw
         bPEOyOpv1DhVQDa3LetMV0F3NkpTe2mH/b4hf+6Hy3TM/BJpXZbuWMCTv9lrjAB5T6Tt
         0tdp1eocXZyxKPI4gZ79cmGVWFjeKZcSV2X+25+U353RUp/mWRibNT4eusExUqxoRPsY
         i9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706188800; x=1706793600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=587jgwVYpxZvmZpAiByRkGCro3u2An7GsZ6G/Kd3gVA=;
        b=u0TLqgeRBQ1YBvV3FQX4StNmaendpN0C47D8BTtA6gcitm3fqHQ3TzQQYf06BA7prk
         NQBPuuWHQvIq9MaRnEJtXsLQ1qaJcfO73oUJUJvcJ6fjMoyDRAK4e2f0ZDAEGpsxyEQR
         eWnqtBGYyyjkeSAnUHObjzfkWOVVyatkLby4UTR5Nx0B5/0gF6/g2/f0Pj9oa062jTG0
         rTyCQab76SeKdt9jYEhLaRD03g7hvUiCXcjCEj+Yhu6glKdtCbb5YRjMtwPRuBzrblD8
         xi7+exPw2Wp5RqzoB23c+dMPPXnIRH/4zpCOcrj2TIs/YJ+HzoZOvkH3GCbtINS8SbQc
         e/gA==
X-Gm-Message-State: AOJu0YwbwpkDRXozVeRXnwtBM1BBx68N6+c3aILXhFEsnIZlRscxjBJP
	Goglx6K1ucPdtzcbGgeruLYAAf5R7Vjx68O1IaOBCx6iAeAINwC8ZYj7Iof+JzEfCZVT5tvD1mU
	xCYLm5f2HyUkeXLIzCYMRT8xy23DtrkxhkayZBQ==
X-Google-Smtp-Source: AGHT+IFnCGf7RvqSCBU9Cm4vURnbLZGTb1pJk6gRjtk1EoYoEZbCmKBY/3oGux2uz8Gm5BbjBiqBKbJtDTyI+k4caKA=
X-Received: by 2002:a05:6870:670f:b0:210:b511:a31b with SMTP id
 gb15-20020a056870670f00b00210b511a31bmr898369oab.85.1706188799770; Thu, 25
 Jan 2024 05:19:59 -0800 (PST)
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
 <f4d3aa5a-e01d-4ef3-8004-b6eac4461184@linaro.org> <CAGETcx_HGcuGQTO11tzX0EvnuLEaKYc4vBse1CRP0JwPqMJdQQ@mail.gmail.com>
In-Reply-To: <CAGETcx_HGcuGQTO11tzX0EvnuLEaKYc4vBse1CRP0JwPqMJdQQ@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Jan 2024 13:19:47 +0000
Message-ID: <CADrjBPrgK_bwhvRKHb6o3CC_=CTFJvOo1T7UXFpVZ6maUfHouA@mail.gmail.com>
Subject: Re: [PATCH 3/9] watchdog: s3c2410_wdt: update to use new
 exynos_pmu_*() apis
To: Saravana Kannan <saravanak@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arnd@arndb.de, robh+dt@kernel.org, 
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

Hi Saravana,

Thanks for the feedback!

On Wed, 24 Jan 2024 at 21:27, Saravana Kannan <saravanak@google.com> wrote:
>
> On Tue, Jan 23, 2024 at 10:27=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 24/01/2024 04:37, Saravana Kannan wrote:
> > > On Tue, Jan 23, 2024 at 10:12=E2=80=AFAM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > >>
> > >> On 23/01/2024 18:30, Peter Griffin wrote:
> > >>>>>               dev_warn(wdt->dev, "Couldn't get RST_STAT register\=
n");
> > >>>>>       else if (rst_stat & BIT(wdt->drv_data->rst_stat_bit))
> > >>>>> @@ -698,14 +699,6 @@ static int s3c2410wdt_probe(struct platform_=
device *pdev)
> > >>>>>       if (ret)
> > >>>>>               return ret;
> > >>>>>
> > >>>>> -     if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> > >>>>> -             wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev=
->of_node,
> > >>>>> -                                             "samsung,syscon-pha=
ndle");
> > >>>>> -             if (IS_ERR(wdt->pmureg))
> > >>>>> -                     return dev_err_probe(dev, PTR_ERR(wdt->pmur=
eg),
> > >>>>> -                                          "syscon regmap lookup =
failed.\n");
> > >>>>
> > >>>>
> > >>>> Continuing topic from the binding: I don't see how you handle prob=
e
> > >>>> deferral, suspend ordering.
> > >>>
> > >>> The current implementation is simply relying on exynos-pmu being
> > >>> postcore_initcall level.
> > >>>
> > >>> I was just looking around for any existing Linux APIs that could be=
 a
> > >>> more robust solution. It looks like
> > >>>
> > >>> of_parse_phandle()
> > >>> and
> > >>> of_find_device_by_node();
> > >>>
> > >>> Are often used to solve this type of probe deferral issue between
> > >>> devices. Is that what you would recommend using? Or is there someth=
ing
> > >>> even better?
> > >>
> > >> I think you should keep the phandle and then set device link based o=
n
> > >> of_find_device_by_node(). This would actually improve the code, beca=
use
> > >> syscon_regmap_lookup_by_phandle() does not create device links.
> > >
> > > I kinda agree with this. Just because we no longer use a syscon API t=
o
> > > find the PMU register address doesn't mean the WDT doesn't depend on
> > > the PMU.
> > >
> > > However, I think we should move to a generic "syscon" property. Then =
I
> > > can add support for "syscon" property to fw_devlink and then things
> > > will just work in terms of probe ordering, suspend/resume and also
> > > showing the dependency in DT even if you don't use the syscon APIs.
> > >
> > > Side note 1:
> > >
> > > I think we really should officially document a generic syscon DT
> > > property similar to how we have a generic "clocks" or "dmas" property=
.
> > > Then we can have a syscon_get_regmap() that's like so:
> > >
> > > struct regmap *syscon_get_regmap(struct device *dev)
> > > {
> > >         return syscon_regmap_lookup_by_phandle(dev->of_node, "syscon"=
);
> > > }
> > >
> > > Instead of every device defining its own bespoke DT property to do th=
e
> > > exact same thing. I did a quick "back of the envelope" grep on this
> > > and I get about 143 unique properties just to get the syscon regmap.
> > > $ git grep -A1 syscon_regmap_lookup_by_phandle | grep '"' | sed -e
> > > 's/^[^"]*//' -e 's/"[^"]*$/"/' | sort | uniq | wc -l
> > > 143
> >
> > Sorry, generic "syscon" property won't fly with DT maintainers, because
> > there is no such thing as syscon in any of hardware.
>
> Then why do we allow a "syscon" compatible string and nodes? If the
> "syscon" property isn't clear enough, we can make it something like
> gpios and have it be <whatever>-syscon or have syscon-names property
> if you want to give it a name.
> 143 bespoke properties all to say "here are some registers I need to
> twiddle that's outside my regmap" doesn't seem great.

Some sort of standardization on the naming seems like a good idea to
me. Especially if it then means fw_devlink support can be added.

>
> > >
> > > Side note 2:
> > >
> > > How are we making sure that it's the exynos-pmu driver that ends up
> > > probing the PMU and not the generic syscon driver? Both of these are
> > > platform drivers. And the exynos PMU device lists both the exynos
> > > compatible string and the syscon property. Is it purely a link order
> > > coincidence?
> >
> > initcall ordering
>
> Both these drivers usr postcore_initcall(). So it's purely because
> soc/ is listed earlier in drivers/Makefile than mfd/. And as soon as
> drivers are made into modules this is going to break. This is
> terrible. If you want to have a modular system, this is going to throw
> in a wrench.
>

That does look to be a bug, or fragility at least with the current
upstream exynos-pmu driver. I think upstream Exynos most likely hasn't
encountered these types of issues because ARCH_EXYNOS has these
drivers as built-in, and as you say the alphabetical ordering in the
Makefile.

regards,

Peter.

