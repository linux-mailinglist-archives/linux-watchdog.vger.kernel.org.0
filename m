Return-Path: <linux-watchdog+bounces-233-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E380C81E
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 12:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 448F3B20EFC
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 11:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F195937168;
	Mon, 11 Dec 2023 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGGJk1c7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66ED0BE
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 03:35:51 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6d9f514f796so2110175a34.3
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 03:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702294550; x=1702899350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3+ol3M0pI923ab1AudTOkH9Yk0elXff3QjFR/FfpQ+Q=;
        b=WGGJk1c7M18qvL4n2xbBWmEYa7iFKyV9K3sIYodQ6a71isMqFLgpYdBFi4x01RZoSu
         2l7lulbF2wqazudhwWOAnV/mf5haM1MRXX3BW3I9sA+71I8d0WPUqfMYFqa5AlIyGCEe
         2Mh1o9Lc/A4i2l77Yj8kC+sPWbOIhH+aK/u/URcGRAlgP6XLD4cemBb6mvJeDmA0CMqO
         bGBOzmBKJLdDQK6Utnm2wFNe+DpQeoPnYubq7g1PgOn860D7wNd1JBsQMUlCjyBG8JNN
         EOqjvimOKNUb2l56uTonbxNDjxn+1dCqyBxbNi57W9i+OgMuRUaBjAUVmBTinb6MjeGp
         pUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702294550; x=1702899350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+ol3M0pI923ab1AudTOkH9Yk0elXff3QjFR/FfpQ+Q=;
        b=qCiBvJQkGYP1WZyGTBZRHEXMNF6CMc9jjLCVbXUj8L1WMRvNA8Kj9RBBOabF+hKHem
         DcKaDlshI8JGcjyY5rMO4PW9vzt9xM/vowlKVO3V1S7fBUz9VMkLbBJQr5ywbGuQFExx
         Yf8V4yJlumlegPc1NuzJ9cgTiAqio9Xhy+kCqEm2zyiQqDt8okDXpqN7amlC6FuJnOJi
         pGFyaUKSIM17kIAJPKVLtq4rml2sy6IEDngtOsfaOFjoTJRT+z2wIVMLXIxjLjYDur2f
         aBJehwtV6WE9w462Mlk5QvE3GM7Ynrqo0NjnGNTw2o5q2Nq2oqsrXx2v/TGC5SscR0BJ
         NSVg==
X-Gm-Message-State: AOJu0YyI3ptZgVOcyVVDZHLFTRMsN1O6l3E1G/Wj5JYQ6oi8Lx2bIQta
	sK8nOulXSz+SJRZvD1segttDwrxPF2e6Y04Ft9gy1Vqf5hoguDYEUd4=
X-Google-Smtp-Source: AGHT+IHTYmAfw9EOKQEvoYukSWVGhGDG8tJXoV6ZROee3fmhULu+p3ewmCTzn6+wQmwMRXs/CvGuxxavXhD0mKv36pQ=
X-Received: by 2002:a05:6830:c7:b0:6d8:74e2:7ccc with SMTP id
 x7-20020a05683000c700b006d874e27cccmr4344434oto.39.1702294550628; Mon, 11 Dec
 2023 03:35:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-14-peter.griffin@linaro.org> <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
In-Reply-To: <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 11:35:39 +0000
Message-ID: <CADrjBPr6k-j=swq8zJfOjaYQW7hvWCTXj2ZZQT6V+QUtjEYOcg@mail.gmail.com>
Subject: Re: [PATCH v6 13/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

On Sun, 10 Dec 2023 at 13:56, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > Add support for the pin-controller found on the gs101 SoC used in
> > Pixel 6 phones.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
>
>
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > index 6b58ec84e34b..3834bf953178 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -468,6 +468,8 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
> >                       .data = &exynos7_wkup_irq_chip },
> >       { .compatible = "samsung,exynosautov9-wakeup-eint",
> >                       .data = &exynos7_wkup_irq_chip },
> > +     { .compatible = "google,gs101-wakeup-eint",
> > +                     .data = &exynos7_wkup_irq_chip },
>
> You don't need it.

OK will drop

>
> >       { }
> >  };
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index 79babbb39ced..b8d549fe38cb 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
> >               .data = &exynosautov9_of_data },
> >       { .compatible = "tesla,fsd-pinctrl",
> >               .data = &fsd_of_data },
> > +     { .compatible = "google,gs101-pinctrl",
> > +             .data = &gs101_of_data },
>
> Place it somewhere alphabetically. Probably before tesla.

Will fix. FYI I was intending to put it at the top ('g' before 's')
that also matches the ordering everywhere else e.g. in the YAML docs
etc.

regards,

Peter

