Return-Path: <linux-watchdog+bounces-224-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE180BE4D
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 00:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70F7280B40
	for <lists+linux-watchdog@lfdr.de>; Sun, 10 Dec 2023 23:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA72E1DFC6;
	Sun, 10 Dec 2023 23:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lz2tKLGa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D51F2
	for <linux-watchdog@vger.kernel.org>; Sun, 10 Dec 2023 15:44:20 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28694702c18so3818010a91.3
        for <linux-watchdog@vger.kernel.org>; Sun, 10 Dec 2023 15:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251859; x=1702856659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0mKvI1T5oT5+yvWC5sePTXqeN0uumLxPtnONmcFaVU=;
        b=lz2tKLGaJ9ifVOD3ZZFOJQeh4DIDwA8NLJir7y26xwDSzPNdR66xfjOcuotAm0w4yI
         DucrcnEkFH0M/UwZixSrSFaIa3O5U2NV8pwc2dHS4y9jHa6is+o6eBWzv4fQio2qH/pn
         6tOEBTYKq90WWpgXWsVU/9GyqwEncykHyOZFXUTfC5lOLiC4eh4QtRqEXg5SjXvNMp14
         g0PjYkUjmJosGNVVgsQN/XBqYxvHFJfMql/7Rx+v5urQpk+9AJZICNK46x6zeXgrEaRc
         34ZNB+uxoV5c9/pM/73ZUTiOwmy6iCrck1GU+reqlkFzWkcB8wny5E9zJYiPGj15/95t
         jXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251859; x=1702856659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0mKvI1T5oT5+yvWC5sePTXqeN0uumLxPtnONmcFaVU=;
        b=U8KNAhJ22kCu4QIxE8GAe2tKhxNSdpCGxD3fBLdfKGjP/39cnQHf4K9nMv0/2qWPsc
         V1J+2tgzEly/ANGL7hrpD5d+QhH846UY6SMukMcv5+V2MiPf+GVRmkvQ1nzn+6RmP71B
         6byiPJDXxyJp3z20o07wcDCYOF0AMsb9W6aFzH+rngeR5CdgpNuo9T7rtajv72sKVCx7
         K5IM6jU0M7Nk9NciR9nIeBkC5TxVwOWvJ3ONPzLihITNVy22J3ypVgkj5JVPDdKDwtYw
         IYxElFbYq8qwbhdXyLkSehruaV8DDODAZTCx6bjrPPXpzThIGzyi1uS03uDJnqLHxshp
         q2OQ==
X-Gm-Message-State: AOJu0YwD4StQWTOM+TZRlFJEa3yCQhSkGdc/gXu515VrKKrURYqeN/bx
	mDxTzAheRmuB2XPuyfoqujsS8NPecfIzwYAWZPrcBA==
X-Google-Smtp-Source: AGHT+IEev1+mZ4JvBxNXegHv+LOLqYeURkK9tTgfUxA4P5RPEBjZl6WNk6O2WW1x3DzLpEF1RiXWgArXsFHTlxqSItE=
X-Received: by 2002:a17:90a:77c1:b0:285:8673:450d with SMTP id
 e1-20020a17090a77c100b002858673450dmr2612147pjs.40.1702251859547; Sun, 10 Dec
 2023 15:44:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-14-peter.griffin@linaro.org> <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
In-Reply-To: <46c9c8b4-942d-4f6f-a6cc-00158314d5e5@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:44:08 -0600
Message-ID: <CAPLW+4k3omxnWoDhB9UCgv6botjNxKAn804jNfrHseaZsnMJ3A@mail.gmail.com>
Subject: Re: [PATCH v6 13/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 7:55=E2=80=AFAM Krzysztof Kozlowski
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
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
> > index 6b58ec84e34b..3834bf953178 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -468,6 +468,8 @@ static const struct of_device_id exynos_wkup_irq_id=
s[] =3D {
> >                       .data =3D &exynos7_wkup_irq_chip },
> >       { .compatible =3D "samsung,exynosautov9-wakeup-eint",
> >                       .data =3D &exynos7_wkup_irq_chip },
> > +     { .compatible =3D "google,gs101-wakeup-eint",
> > +                     .data =3D &exynos7_wkup_irq_chip },
>
> You don't need it.
>
> >       { }
> >  };
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 79babbb39ced..b8d549fe38cb 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_=
dt_match[] =3D {
> >               .data =3D &exynosautov9_of_data },
> >       { .compatible =3D "tesla,fsd-pinctrl",
> >               .data =3D &fsd_of_data },
> > +     { .compatible =3D "google,gs101-pinctrl",
> > +             .data =3D &gs101_of_data },
>
> Place it somewhere alphabetically. Probably before tesla.
>

Assuming Krzysztof's comments are fixed, you can also add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>
> Best regards,
> Krzysztof
>

