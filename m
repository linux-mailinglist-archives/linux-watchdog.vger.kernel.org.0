Return-Path: <linux-watchdog+bounces-117-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F880280E
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 22:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3831CB209D2
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 21:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBF718C27;
	Sun,  3 Dec 2023 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klrcDzH1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC59EE3
	for <linux-watchdog@vger.kernel.org>; Sun,  3 Dec 2023 13:47:28 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-42542b1ed5dso17537601cf.1
        for <linux-watchdog@vger.kernel.org>; Sun, 03 Dec 2023 13:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701640047; x=1702244847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ypEtajSEZ/3+dju5T9JaBFEQ3JvraP41o/ylPX1p/IQ=;
        b=klrcDzH1TM+HzbNLMLzDzDQXMq2zCpdLsEyZdIq6a+TUjTn+JQfzr5s1KzecLlr7v5
         uCdPMmzBvWULsI1TD51henPtCmQ7c9M4IieN1rXCZUuQApndVWnD25ZZiyWe9UpXgEyZ
         tbg4YY6+BeRVxN1fY+NIi1rSHoQfQCGsdrMb0Ym/0GoKycr4wUmchBurHNoFX2vr1ndv
         FSjvomzDHJ7IsCVgFq9pzv/SvAqpagAf1CBP7segKEzbbyh5/k/y1dtQFNPPhrbnR+f6
         Hod++Dt1K/Slv/M0iqutH36NJS9PN1MU9FM+LsMniPxgGoX7cp7zXKFiDR/mLiZnOj/9
         wXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701640047; x=1702244847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypEtajSEZ/3+dju5T9JaBFEQ3JvraP41o/ylPX1p/IQ=;
        b=FXOhnZJy5MjkBVqtHeVRsCdgDsywxJi+ObgUbjC9HyiUL2DQ3yHBzPsOSNv6L183Kj
         s6MEtnFZvsKGF22x6kge6zKtES1gnQArIAem2eceTO8RWFPYmLtoRhxSyieB8cleDsoz
         OfnMyKPI9Z+Rx+Xn+VxstXgAE8SxslC+uILjiC6ShEOGRkuD97Sxg2e1lo6Ivd4qhnA7
         mwJtjYBxzB2eR1nWDkk+UymqIYTtR3xPDYMbtr4Xzy1m1AYhkHTUAU4HtdMJWlbYQrPE
         otUvCs/LIz6SHC/CfjVczTAba08icqEN+TUEexH0JYO/oo2PeK+yNtGNjCFH0iSwodqy
         qdjA==
X-Gm-Message-State: AOJu0Yx15N3HN8ie9p+6tEGEmVBGw3JUh4Icm+6Yg9nWaDIQyigXDnza
	9UHkmqq33XqMa7Sf2/v4IlFSlmm9XIdvM2/yhKYyCw==
X-Google-Smtp-Source: AGHT+IHc/rln86HWRtRO8D+k4deS4wGOzHWIyvONBd5JHCCN4rJ37HsOLKPo9YqdJjypf9JsSc1dyZOBRmsFYFPuzZM=
X-Received: by 2002:a05:622a:1752:b0:425:4043:96cc with SMTP id
 l18-20020a05622a175200b00425404396ccmr5772334qtk.89.1701640047675; Sun, 03
 Dec 2023 13:47:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-11-peter.griffin@linaro.org> <2854a9b5-d6c8-454c-bc3b-79744e613686@linaro.org>
In-Reply-To: <2854a9b5-d6c8-454c-bc3b-79744e613686@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:47:16 +0000
Message-ID: <CADrjBPofpjB7iA3u1LGy61F_0dPX40ZrtJsHd6zumTOFu3bEjg@mail.gmail.com>
Subject: Re: [PATCH v5 10/20] dt-bindings: soc: samsung: usi: add
 google,gs101-usi compatible
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

On Sun, 3 Dec 2023 at 15:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/12/2023 17:09, Peter Griffin wrote:
> > From: Tudor Ambarus <tudor.ambarus@linaro.org>
> >
> > Add google,gs101-usi dedicated compatible for representing USI of Google
> > GS101 SoC.
> >
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> > index 61be1f2ddbe7..a10a438d89f0 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> > @@ -28,6 +28,9 @@ properties:
> >                - samsung,exynosautov9-usi
> >                - samsung,exynosautov920-usi
> >            - const: samsung,exynos850-usi
> > +      - items:
> > +          - const: google,gs101-usi
>
> This should be part of previous enum.

will fix,

Thanks,

Peter.

