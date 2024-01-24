Return-Path: <linux-watchdog+bounces-485-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABD83A698
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 11:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655571F228CF
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 10:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7342318E0F;
	Wed, 24 Jan 2024 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCMnp+bB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE74C18E14
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Jan 2024 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091680; cv=none; b=WIZyppwjY7ykE/MJhY/yr9K20fkII9HuoPlwmELLdfcyxGPVRNrhJalcZbMtcV1qtLd7hCqciLerhncYMc+qghUYw81+CZUnuaBEeK5oEhqcw96O8VTSmL7ByecN5O3y/ds8qnhRKN//ZPgXIjh9hNk2xB3ra80ygRQZ3UvifBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091680; c=relaxed/simple;
	bh=ewX7gY72o0cl/yYtspnOPfn5OfSuWve6SbfDlOaK0u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1KrFFnDMsKvrXiPk47ZhTg3o25U1CQ7DmIIic2OtlIL5/fKJ2w70ytuKi7u/06RfqASm3ThfbpuUWqtBQpX78b6I2TFkYi+to+2iBwTQItOGvII1ngDbGhpLJbH5sflxpoMyu3lylicMZFzU1SPMxPEk39pxLCl9lO4jPVlJ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCMnp+bB; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60036bfdbfeso18618207b3.3
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jan 2024 02:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706091678; x=1706696478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oahrr0zPn7dyTHABN+YgjB62XpZ+3yBv/LwJfePBLo0=;
        b=hCMnp+bBiLITDg/sLLkPFHu+Thcyva66Ve2kaglOP9lRu2AoY5ZVF/E1iCtcP4P41k
         nyccSxaoxN3Ym3YL5xPCvicX3b6E2We1BoCRsBxazoTTj0newp95SNpgBZwzkqTq/rK9
         5zzoPlYy7Z5sOkSquetM/YhdREcGum/clcYOWkV8/f1pQ7uszClp+o2yqpnPGqQko5Cp
         2WqjyBoFLAhihKusRdWHe7diY0DIK4W1TFWWQ9GU2h1jqHWW3rwmbi/QrU49UoyZ15xe
         nJ53Q1lClK4Te5HJi8C9BcPwrU8Ao/sbF6GFaVnSIr/OUsfDg6W1IcN1v0BLTb21nhHq
         UNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091678; x=1706696478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oahrr0zPn7dyTHABN+YgjB62XpZ+3yBv/LwJfePBLo0=;
        b=XuyzLAqTtFWryUxMApDFmyc1W1MWMRa5zSE374d6mS3o8186b7AimC7WjitxaCqMI8
         8cWWK3qs6pTjeR60T2fvNVot7OqUmkOfXZUDlByDq5pzhIYeTDtB88Lt0xwzOB5j6kAN
         dWPZdG5G1H2nAdL9oC+BECz9+0Ma/0X2r/mD4Zx0ZZC9nAyhXuspPZStq8ZzzAMFY7Dn
         +La0jMgOsqhijiKzSDrdlohGVBM6Dm9rSI14ecd6MdbXuvnATDwj1zEYizz8jX2cyh1s
         aMED5CuRY2IgrUk1z/rAYqNrvEtbflF1sRF83uvoALUj5bQR3wsfj0cRoGVAbpoEvNLy
         q/UA==
X-Gm-Message-State: AOJu0YzmG1rLzzaEF/fNIqRfHwQTETpKD8hcufG0sWt5OxZkR7Mco64Y
	vY0km0351Xv0gOYBbS1AItjpd9XuNSttlyzlFpe2CyITewxrBxhr9OvfVQLq3Vb1Sq/Q8NpLnTJ
	ryfPsW7gZo09eP9bw02XEH8OkYy/5+qZWe5yMEQ==
X-Google-Smtp-Source: AGHT+IGVtGg/WkPzc49U9WuM15rlSuAsDRUaw6mcw+yY8QDg2i3KDIhJyIoiFrhlnelKM6n+BFEPpnW1/A4dbXsMEAc=
X-Received: by 2002:a25:c402:0:b0:dbf:6240:d8a8 with SMTP id
 u2-20020a25c402000000b00dbf6240d8a8mr457643ybf.17.1706091677756; Wed, 24 Jan
 2024 02:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
 <20240122225710.1952066-3-peter.griffin@linaro.org> <dd8402e7-f8cc-4ddd-a748-e176b6b534a9@app.fastmail.com>
In-Reply-To: <dd8402e7-f8cc-4ddd-a748-e176b6b534a9@app.fastmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 24 Jan 2024 10:21:05 +0000
Message-ID: <CADrjBPpchS0NdqS-mRmmatOksGHc4KdRniJXGDPTS1z73eU9kA@mail.gmail.com>
Subject: Re: [PATCH 2/9] soc: samsung: exynos-pmu: Add exynos_pmu_update/read/write
 APIs and SoC quirks
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, jaewon02.kim@samsung.com, 
	chanho61.park@samsung.com, Sam Protsenko <semen.protsenko@linaro.org>, 
	kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	saravanak@google.com, William McVicker <willmcvicker@google.com>, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Tue, 23 Jan 2024 at 08:11, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 22, 2024, at 23:57, Peter Griffin wrote:
>
> > --- a/include/linux/soc/samsung/exynos-pmu.h
> > +++ b/include/linux/soc/samsung/exynos-pmu.h
> > @@ -21,11 +21,39 @@ enum sys_powerdown {
> >  extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
> >  #ifdef CONFIG_EXYNOS_PMU
> >  extern struct regmap *exynos_get_pmu_regmap(void);
> > +extern int exynos_pmu_update_bits(unsigned int offset, unsigned int
> > mask,
> > +                               unsigned int val);
> > +extern int exynos_pmu_update(unsigned int offset, unsigned int mask,
> > +                          unsigned int val);
> > +extern int exynos_pmu_write(unsigned int offset, unsigned int val);
> > +extern int exynos_pmu_read(unsigned int offset, unsigned int *val);
> >  #else
> >  static inline struct regmap *exynos_get_pmu_regmap(void)
> >  {
> >       return ERR_PTR(-ENODEV);
> >  }
> > +
> > +static inline int exynos_pmu_update_bits(unsigned int offset, unsigned
> > int mask,
> > +                                      unsigned int val);
> > +{
> > +     return ERR_PTR(-ENODEV);
> > +}
> > +
> > +static inline int exynos_pmu_update(unsigned int offset, unsigned int
> > mask,
> > +                                 unsigned int val);
> > +{
> > +     return ERR_PTR(-ENODEV);
> > +}
>
> This won't build since you have the wrong return type.
> I would suggest you just remove the #ifdef check entirely
> and instead require drivers using this to have correct
> dependencies.

Whoops, will fix it in v2. We need those stubs for platforms like
ARCH_S3C64XX that don't have a PMU but use some of the same drivers.

Thanks,

Peter.

