Return-Path: <linux-watchdog+bounces-114-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F728027BF
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 22:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11AB7280D7C
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 21:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B31918C3F;
	Sun,  3 Dec 2023 21:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QxdzWdj2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4C7D7
	for <linux-watchdog@vger.kernel.org>; Sun,  3 Dec 2023 13:21:26 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-58d98188dc0so2414147eaf.3
        for <linux-watchdog@vger.kernel.org>; Sun, 03 Dec 2023 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701638485; x=1702243285; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBALP8YV0QZwaMwdd2KBWcj9Tq1p2Z16LRDLKvabBto=;
        b=QxdzWdj2Adq+1FMGv2/fas25Mr2HqQdqka2/V56PA84tqjM8ns0LpH+We5MkNCIiFD
         GEgtEtz4SdcDeBKq3EmCbft5zlmDS3ofH+iihci1Zzwlh3dCJ7RB4y2Vfk1iM+uiwra9
         M6kIqZDgf3su24XfuYvAnEJ4BbCkWLoar/6US4luXNY+3Ke0vZYB5gqxbzqZi+pWr5L1
         XVRaBYBiSro1MOUN/a04trw5OwjpXmp7GeZAXsXxaw9UqWciP7m9ZTgqb0CUwV29TrTO
         Ni9nxijSfPpwhoC0z2wLerj8X7ZFAptUZNWRAF2gqCerfC/GMb1kn39PVdUDMNH1HR9I
         f6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701638485; x=1702243285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBALP8YV0QZwaMwdd2KBWcj9Tq1p2Z16LRDLKvabBto=;
        b=WXztOE2ibcmHDsxZ9XlzlBVwlF8FqcCoL9kwh7CBxHSpguv7HSjHkf8tGZX7Bu29Jf
         bVw/yCtQunIjZ5it9E+EhLaFv6EweZw5GU3qzt2RKvac+3LU3xRa7As6Mj/ibIWzwkBI
         Kqmc8mmkgm3NMZaXSj1e7k0cjH+bXSETdwvMmAz4v02LjUDaKmc/gFF7zuni4smFjjGm
         t5erCdpXVShC+LVdn5/9QaGdpYigt13nA0K772s10JwoPU0QpVSZLOFkSmDk1kqK4+Y1
         Tk9FXBWlbUQQ4OXHqHcz2S6HCcwBR1Q1jnYIf2A3vo0yAC3l1GgzQ9D6Dq0hZoVkm0o1
         E9aQ==
X-Gm-Message-State: AOJu0YzTMoa0FhfxSiwG0FXhYISJaYAxNbWcMBww+RrfYOgzx+Bm+I8l
	iwAx+JDXdm0Nps2ZpiN/eLGnBWKybT7S95gu83Ziig==
X-Google-Smtp-Source: AGHT+IGtekMHkp852JA6RkiudAH5D96Q93RiRqk9YOj5heuqbhP+mmIk3wEQ0uwM4Ob7BzATccUT7+4SnMfM9Ymm5do=
X-Received: by 2002:a05:6358:1206:b0:170:8f0:c6c2 with SMTP id
 h6-20020a056358120600b0017008f0c6c2mr3905258rwi.21.1701638485268; Sun, 03 Dec
 2023 13:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-8-peter.griffin@linaro.org> <fedd4ec8-b4e6-472a-9bfd-063ea8b9658e@linaro.org>
In-Reply-To: <fedd4ec8-b4e6-472a-9bfd-063ea8b9658e@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:21:14 +0000
Message-ID: <CADrjBPrqWKdhiL8TCcBC3ohLAwrAZiRwtA8Yg0q4gkrf9qrKqw@mail.gmail.com>
Subject: Re: [PATCH v5 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
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

On Sun, 3 Dec 2023 at 15:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/12/2023 17:09, Peter Griffin wrote:
> > gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> > where more than one pin controller can do external wake-up interrupt.
> > So add a dedicated compatible for it.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> > index 2bafa867aea2..de2209f8ba00 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> > @@ -44,6 +44,7 @@ properties:
> >            - const: samsung,exynos7-wakeup-eint
> >        - items:
> >            - enum:
> > +              - google,gs101-wakeup-eint
> >                - samsung,exynosautov9-wakeup-eint
> >                - samsung,exynosautov920-wakeup-eint
> >            - const: samsung,exynos850-wakeup-eint
> > @@ -111,6 +112,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - google,gs101-wakeup-eint
>
> Drop, not needed.

Will fix

Peter.

