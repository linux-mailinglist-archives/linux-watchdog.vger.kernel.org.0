Return-Path: <linux-watchdog+bounces-3972-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3BB1BCD8
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 00:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA69C4E2CA2
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 22:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5013929B78C;
	Tue,  5 Aug 2025 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZIXLcPs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8FA291C0C
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Aug 2025 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434407; cv=none; b=IL0LS3Bb/nTLRzvoI4tRcVbY7qonOen9AcBF1o93pkBfx0brypAU0AJCZS9avLMeAbDsixBg1+JUiKIt+tFgW1AZnFbr3kwDBgbhCC+2xmj+spUDn5ut6OpdKsB0ONP6Icy8kwa1yHt8rthdpeiXvZamRZVasgOj6anggpgtMJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434407; c=relaxed/simple;
	bh=hs+keelF6LjAXHQjXmPYefdmvCIfEKA3k7KvHBMdfoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsFk4uxCzhX6tEGvg1hsOF84NQH+v8eSgmfoRTSuBQuXWsro/PLfJzKhQdpTV6NnvuvbbnuVjKnpZNsBo8X2ikdmfDC3XDCD47e0SlMTa/7Kiq1/WxslUbQwS07gviYgDKVPi2P7oBwcadlDn1hBWjfE74wu2SoyxZ5bFtDoAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZIXLcPs; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8fd86363cfso4222881276.3
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Aug 2025 15:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754434403; x=1755039203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFwxA7VPMgX8JFoPPlt7yWjXlEeDLZQuyMF8h0TO11M=;
        b=EZIXLcPsvqmIsHu9GoansST5NTM0/g8+TbsaKQV+1XaDNj4n6ZCknJ0V0lIiIH+AOH
         W4d08pblfWpLGHxRu551fGoCjZSUqBe04tbnZui5V7JJMMkPO4ndxnej6jSXMigbgEZf
         u6JlAYSsDalPhtEzszpo3NFZSFlIMY1XLOANB3KN6OP3zPsfjvgLbbdJwqt5pBi+r1ZX
         Lt1WXeTgBjyEvh2hpQphteBAZ/8Ja2YxV+/VwuoG7raTE+m1FkvF3fmWLXH4qgIq27on
         gBWAUHYHivr6TWd1MYLQQX5rxmnClh6APqa7nPyZckGUS69TjGmOrVtEer5bM0HK+uax
         kg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754434403; x=1755039203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFwxA7VPMgX8JFoPPlt7yWjXlEeDLZQuyMF8h0TO11M=;
        b=bcGAIUipjRSqG7FWIpzmcU2d7BBgvBD3Tu9gm8niiZU5S8SYrSz0iUuEQwzSfnGlrq
         SKFLG4DLnLgUgQSu9vJDN/7ViN10Qa+TZ4BdPU79AlpBdqHvgpcBBEsajCRcvOD6qwri
         SLpq/xSxumx2NxMZcrU1s1q4+iz5eeyxD7mek+RCznjnoEa+iwaKIaknrD+q/fD48j5u
         akwn1Kbz0NxASR3EelkO9bE7Hcmi6lOSuOlJZnghB0qFDO6ds44mb3/dBNU7Hn+b2ME0
         AdT200lMlKRXh087+Fjadbq737rG4+bXjt7nSb61IWQy10r6bEoWFpBpPHEIKtLafAer
         /fvg==
X-Forwarded-Encrypted: i=1; AJvYcCUteC+8Fp1Z026TTpy6IhrAMftq9QPxRzeWFHpKHk7Mj+JBYcV9002IK8Ac9UjhD7IfUmMvHhmIAw+oEvtfag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSY75t9lrbgojB4ZSbCbk8jh2KRr6a4qnewUP+Mk/NcTtxwZ/0
	cmkUwblRVkZn6yptyGrNSqfPwZas/d6HpIYEFRU9FPv2owCxcSRfgVsWwp9oWMI9VFBDkTgIFE+
	w/ur+6xnXHPAJHBn2lw3n1gRb44K+4a0XjhpwpObFcHRL0tQGk+7xd0W2lA==
X-Gm-Gg: ASbGncvESZPwm+H/4k0OfI+XSxB7rpKKpstL2JTHQMuZuaO9+n6YplpLpVtJJ6bziRo
	huBWPuiBu/UFv32ZFdd/kUDu9bIqbfRVq8aPh/SwqgUuQw8Ctn5RYGye35vq5xkGOyNN/q7DetC
	8AxojdstSvv8EI6Cy/veafxw1iQFchPTfNwLKwbIQwfz/WJIJiOmfrakvbZSq1vmbT1vo7UleYb
	JuNKQ==
X-Google-Smtp-Source: AGHT+IFPQD46MAxnRPc4XD80G1FRckOzbsES2lh1jn0CLQnQJq0WjxlFx9sY5Jok9vm71L88exnNcyi2+UjLvaHGm4k=
X-Received: by 2002:a05:690c:3349:b0:71a:2961:e2c8 with SMTP id
 00721157ae682-71bc97b1c7amr12964657b3.10.1754434403162; Tue, 05 Aug 2025
 15:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com> <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com> <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
 <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com> <008501dc05da$36362600$a2a27200$@samsung.com>
In-Reply-To: <008501dc05da$36362600$a2a27200$@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 5 Aug 2025 17:53:12 -0500
X-Gm-Features: Ac12FXygs7x0aZJlJlnwWjTdQedCFmhrYOQr3itTJ2SIN3Q4cTe-cGU5fCA1CyY
Message-ID: <CAPLW+4mNejXUMW0VqZW8hieNUFmDqS_-qqE=p+bV4TnwM_TWgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: sw617.shin@samsung.com
Cc: Guenter Roeck <linux@roeck-us.net>, krzk@kernel.org, alim.akhtar@samsung.com, 
	wim@linux-watchdog.org, khwan.seo@samsung.com, dongil01.park@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 2:26=E2=80=AFAM <sw617.shin@samsung.com> wrote:
>
> On Tuesday, August 5, 2025 at 2:03 PM Sam Protsenko <semen.protsenko@lina=
ro.org> wrote:
>
> >
> > > > +       u64 t_max =3D n_max / freq;
> > > >
> > >
> > > Make sure this compiles on 32-bit builds.
> > >
> >
> > Can you please elaborate what might be the possible problem -- just
> > curious? I admit I never though about 32-bit case when writing that cod=
e,
> > but don't see any immediate issues with that too.
> >
>
> In my opinion, it seems that Gunter Reck's explanation is correct.
> I've found out that the error of "undefined reference to '__aeabi_uldivmo=
d'" may occur when compiling new code on a 32-bit architecture.

Indeed. I was able to reproduce that behavior when building for ARM32 too.

> If you don't mind, I would like to proceed with maintaining the previous =
revision below.
> From my perspective, this approach appears to be the most reasonable solu=
tion for supporting both 32-bit and 64-bit architectures.
>
> @@ -411,8 +411,8 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>
> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX=
 + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +               (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
>  }
>

I don't mind, although it's quite easy to fix the code I suggested by
replacing this line:

    u64 t_max =3D n_max / freq;

with this one:

    u64 t_max =3D div64_ul(n_max, freq);

from <math64.h>, as Guenter suggested. But I'm totally fine with your
implementation as well.

