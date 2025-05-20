Return-Path: <linux-watchdog+bounces-3531-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA428ABCBEF
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 02:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D01F7B0025
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 00:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9434D1C8611;
	Tue, 20 May 2025 00:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ArDLwFJk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56241B6CFE
	for <linux-watchdog@vger.kernel.org>; Tue, 20 May 2025 00:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747699957; cv=none; b=DsykP6Z+AtDYDfC/4cXe5DVg8TAfuCGsoeyhit4KKuhLuzIx5LglN7TA+quPd+u0HJZiF51Qr5De9HyjI6r39POFtg71i2bQTCgqeI0zsOmCob6yysjlYLpt3G5ecSRjT40oYwuQEb9kUWgJAhDNgDRKrdZwApKb/9bFzFqjz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747699957; c=relaxed/simple;
	bh=IT9pHtUz+s0Q1gCJStym6qSugp/fBQlHxKJt8Jm1lqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rx6ZFFNSb4Brd2qBRj1qTDb0An7W6yhgrTwn7MEMTVp+mPHvFOstDiEb7NO8U3MiP+3BZBzI2GPrPzWha17zGOTGPiB30aB9o75gNVWUuNki3unfwcbAdhqXEiirUmaTVSg6YvGaHyJZcNOwVrz2ZpRnT1PlHaPtGr2D4XTemeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ArDLwFJk; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-48b7747f881so808311cf.1
        for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747699954; x=1748304754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSOzuf4zM3x/LvxSKSjkkww83y4Ey5iG99RHEpA5ilY=;
        b=ArDLwFJkiaHPZv6ar0tUkpSfpcjTh4ZWx39OrgqYhKaK7LRPeLL21cn2us6xNzt3Bg
         uDzqGaA0dVzuymvoWTbsJPTCQr9rDZCUC9Mj2poxy38XTvlsz1FEekWMntS5n+e/WhR1
         jBKTn2ruvv/x3KA3XWVIgmBxP941wlkzX+r2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747699954; x=1748304754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSOzuf4zM3x/LvxSKSjkkww83y4Ey5iG99RHEpA5ilY=;
        b=qeLn3VLsh4K2jH0eA4ssqBgxkN9cnY1I3DZIGysANWRHIJTlGPRER2fn3Ny8hquVTq
         a16dNjcjRWXTrasFyjWHaFZlvcRJ+xDtKbXlf22o9+8ABlW6cLI4sWMJfCs1Smjfzq0W
         DY3b/rVBzxv9CgfFMOJpG2g3CLYK01f+yR0SuY2cvCkkOmZEStJCNmovJEPhIV+JMYrm
         Fw2f0+N2GLwMdBKYn6QZytHANYC64JQ6zJ6v0H6P9vrjmR94M9ZeCjkY3Rb4xGMmGA5m
         N738RTJjYD1gTR9fJozcfvtXtBfykWjy1hhL574IXlovAfilb8oYARCn8WJ58INZAp8M
         o6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4NAMxBRiGo30kQuqz6l6iAC5rxKYgnRVjFlMtiXxqXwch+mf/Ybyn6j6yu8upSakvQLW7O84tcbxDWFvXbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2+F4JopT63bbv4Vcjo5sOZj/k9xgz6t0nWXw2uWmoHNLeC4vz
	EeixUxJfnmHDOmB+FT964OeyXCHEdiNJ8Y0G7DZYWOY4DNdwefJVxRiTYiOeLdKfBEOBKQrIANQ
	LQm0O0yLI3eP2QjazaKOg5LNi+C70u+zxcM817aub
X-Gm-Gg: ASbGnctQprLMDlov+M8Tz+53ueTTqAGmliZnQ52impbA9Mr4WPuCgfwNCocCXukFmM2
	fiiM9Nvl7Ifz3RH6BWpQCLibhgg7ZdgRn8Qhr63ptclapIX5IdIO6YcvvCY6Jt4kzli5puM6diB
	aWuKRWjvLHv2T//munJOzMrNl7mzEfzBI/RZGSSkzLLI5FSLp7OPM=
X-Google-Smtp-Source: AGHT+IGeiEqytsKfbvcOJoATsM9r1IDoSbSawj6sJz4yq7+zFCOByAUS9aOucjOKsanjqRavnKGD/ACfZHzBtCS7E5k=
X-Received: by 2002:a05:622a:4a:b0:478:f8ac:8adf with SMTP id
 d75a77b69052e-49601270e9bmr8144761cf.19.1747699953197; Mon, 19 May 2025
 17:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519170055.205544-1-antonio.borneo@foss.st.com> <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
In-Reply-To: <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 19 May 2025 17:12:20 -0700
X-Gm-Features: AX0GCFuJfn0H6VbpxEdzZcu5Pm6YQSV9kAZ5ya8oZZA3CzSoInnwOJUz-Vgz-14
Message-ID: <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
Subject: Re: [PATCH] watchdog: arm_smc_wdt: get wdt status through SMCWD_GET_TIMELEFT
To: Guenter Roeck <linux@roeck-us.net>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't really know about the issue Guenter mentioned, but otherwise,
from the driver's side this looks good to me.

Reviewed-by: Julius Werner <jwerner@chromium.org>

On Mon, May 19, 2025 at 10:58=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 5/19/25 10:00, Antonio Borneo wrote:
> > The optional SMCWD_GET_TIMELEFT command can be used to detect if
> > the watchdog has already been started.
> > See the implementation in OP-TEE secure OS [1].
> >
> > If CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set, at probe time check
> > if the watchdog is already started and then set WDOG_HW_RUNNING in
> > the watchdog status. This will cause the watchdog framework to
> > ping the watchdog until a userspace watchdog daemon takes over the
> > control.
> >
> > Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]
> >
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > ---
> >   drivers/watchdog/arm_smc_wdt.c | 18 +++++++++++++++---
> >   1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_=
wdt.c
> > index 8f3d0c3a005fb..f1268f43327ea 100644
> > --- a/drivers/watchdog/arm_smc_wdt.c
> > +++ b/drivers/watchdog/arm_smc_wdt.c
> > @@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, en=
um smcwd_call call,
> >               return -ENODEV;
> >       if (res->a0 =3D=3D PSCI_RET_INVALID_PARAMS)
> >               return -EINVAL;
> > +     if (res->a0 =3D=3D PSCI_RET_DISABLED)
> > +             return -ENODATA;
> >       if (res->a0 !=3D PSCI_RET_SUCCESS)
> >               return -EIO;
> >       return 0;
> > @@ -131,10 +133,20 @@ static int smcwd_probe(struct platform_device *pd=
ev)
> >
> >       wdd->info =3D &smcwd_info;
> >       /* get_timeleft is optional */
> > -     if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
> > -             wdd->ops =3D &smcwd_ops;
> > -     else
> > +     err =3D smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
> > +     switch (err) {
> > +     case 0:
> > +             if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED))
> > +                     set_bit(WDOG_HW_RUNNING, &wdd->status);
>
> This is the wrong use of this configuration option. It is only needed
> in a driver if the watchdog status can not be read from hardware.
> That is not the case here. Worse, using it in a driver like this
> overrides the watchdog core module parameter "handle_boot_enabled".
>
> Guenter
>
> > +             fallthrough;
> > +     case -ENODATA:
> >               wdd->ops =3D &smcwd_timeleft_ops;
> > +             break;
> > +     default:
> > +             wdd->ops =3D &smcwd_ops;
> > +             break;
> > +     }
> > +
> >       wdd->timeout =3D res.a2;
> >       wdd->max_timeout =3D res.a2;
> >       wdd->min_timeout =3D res.a1;
> >
> > base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
>

