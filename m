Return-Path: <linux-watchdog+bounces-226-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6580C44D
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 10:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E29F6B20DDC
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 09:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B74721108;
	Mon, 11 Dec 2023 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GLWdKz+4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2367F2
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 01:18:04 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-67ad531686eso42271686d6.1
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 01:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702286284; x=1702891084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/z0fIrgey0ax47ogB/tuo0R84muzHuQ+ydDig5s54Lc=;
        b=GLWdKz+4fg8mPDx1ELnuojeEe2T/1XyB36ZvIENuMsR3fCl7ln+rr+pUXcPb2VFVbW
         sPIw76ndiczt/NSqQ6/l81FNJwxsmSQbIzbgsnGG8kdAZndJRpYXnKH/S1Ej99Yu6koY
         gPYg/BB8EdJL/2JP1yMVLRaRulrNnBlK95L1XMF8SDIdVaQgYQ4I6TScanJ3XCzTsD6M
         Jgh39J/dsNCzJ7FmG8n7AwVvvQmP1igOzbuEvsKCkXtXO9ydm1bsBxyJ6SaD+Re4u7ac
         wnwNX6eyjiVT55sw6buh6HQWTPf5k1QiXf4vxFLAXcSkDHdpnzyCoNVYfX6xlPptDYMB
         SuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286284; x=1702891084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z0fIrgey0ax47ogB/tuo0R84muzHuQ+ydDig5s54Lc=;
        b=kK9B8aCgeKx33T+bqgOh4lv2sg7pPq7wD6cTWTEeWHRcgbpMZc243+rHnoSRXrTbuL
         bOotgg57Kkd9HVCLW9GdexYK12B1IcuV91JGaEqd0LXwyy0ZZvfMq2YXOUgc+KjkZ9Jy
         SNVq6gak04dYXF+WYfZzV0vI5OVtB9o9NUFjDZD4sbCuDIR2EN265vHXEOdhe2A3n1el
         bJnc2/k6vZE3BU5+LZlyQlNuU8mDsMy03J+4rjumRfMu/DRg4zw1h77iANDPYu81Km+K
         jWgKaWoDa84Igp1NFSuWFTL5P4RnCJDxAYEWGEJ8KcmijJIP1q/ceY6SzaogHmIGKTiN
         jC/A==
X-Gm-Message-State: AOJu0Yxd1scVmX5q1YCab8rM1Ccl0LfmbWWgjUFXaBJBs3WK60GZvUys
	1z0NVyGV+JSFana0Y4kB9dkrrJAOANTp6Si8ipEvFQ==
X-Google-Smtp-Source: AGHT+IF2FD/yZWTaJspuz2ZkGnHtLmu9yc29fMOCKmFWdGSQxO5eLtwgHWeyaAYDFzw+Ks+VHIEsnPYl7wNEw90Fzik=
X-Received: by 2002:ad4:5dec:0:b0:67a:568e:5b10 with SMTP id
 jn12-20020ad45dec000000b0067a568e5b10mr7473425qvb.20.1702286284034; Mon, 11
 Dec 2023 01:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-4-peter.griffin@linaro.org> <c2244932-cb2f-423a-bbe6-9ab2b08b9d63@linaro.org>
In-Reply-To: <c2244932-cb2f-423a-bbe6-9ab2b08b9d63@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 09:17:53 +0000
Message-ID: <CADrjBPpd5mT6SZyPEgxFGy18pr5Gypcwv7aoG4R978d__Pk3LA@mail.gmail.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
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

On Sun, 10 Dec 2023 at 13:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 2de4301a467d..127f4ffde76a 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -22,6 +22,12 @@ properties:
> >                - tesla,fsd-fsys1-sysreg
> >                - tesla,fsd-peric-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-apm-sysreg
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
>
> This should be part of the first enum. No need for new list for every
> new SoC. I'll fix it while applying.

Noted, thanks!

Peter

