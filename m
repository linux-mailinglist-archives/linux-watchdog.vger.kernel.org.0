Return-Path: <linux-watchdog+bounces-4355-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCC6BC44E3
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 12:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61D8F3C30AF
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 10:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD662F5A2A;
	Wed,  8 Oct 2025 10:26:01 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B72F5A33
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759919161; cv=none; b=Dj4todOR0OUOxTJI4dbC+u+IvCWBrsrbYZwZItRStG4ws9yRseFiSL2gIi6rImh1A3V1TdxZLSMgP3GHafJ+Jn8t1rEpPg+Eh6IbBb74OWjvSK0BP2eLjoUUYUJkgUY53zTUcDTYPZRbOkwk5zBzCzgIzYsW2CwQQxJInOvy5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759919161; c=relaxed/simple;
	bh=OXSpHYjCFeAW1bnTUQJIYsMTnFikBWZCXE15rVM8+54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzBdJhPE2ZirJsAWlCbidQ15FLKpdgWlOQjeMLCGfZuwjjsFC7ztycGlR/Sdry3G21yCjwkHE4XCiEigcr37B2IQ5Hrtzm0Ww8qYxZeGjZfTstvjcr2nLLVnX1YpUaPT6lXHMnFKEhqr3y8JoK+3LrMY2vbX+cpL2Rb0aVxJads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so2559108e0c.3
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759919159; x=1760523959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P51hehgBHthh05rneSfzMskbp21c3potJuyyZ4GFVHY=;
        b=DRJod0beA/Q/wA3DNubtdu72y0w469OkdhMydZy7sHKsZaTKAIMkJwi0x0oEChVZTa
         /eCJM2QYoEiLUiRgSzFkIMWFRqEwemgvfoIfTSNT8hebpVgTqH+/LzUHfWwMvJ5XIFJO
         u3fEA8hcHTgTBjuW4HqFftf4X7IFTbmwOnDMFVRWSwho82FarbJoDEEpAh4daiUrqPN2
         q1UBT0TuJInql4Md2hL32FHPj8hwVgkDY68jXhXDDTkDcWYoA42zzCn4kl8nM2se/xEK
         PD38VEZAtGHZAuVolzjSiEF8rFaDf8oFXB+xORAeyJZOMDKXA7KiZcjGJoyqe9gIhQsf
         Pcfw==
X-Forwarded-Encrypted: i=1; AJvYcCUWQzhsSfLzv8zrvVBcXlixDHmRQX//32W0MAhbS+YsH33hg7poRhxk50eINnHXZVaGAwf1b5CYpuXrhnOVKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjbt/V8wJpFosVEn1Lo+v66aWShTaIjFJH5Dn7tfSLzZlSU22a
	42CBU+NQAe9MeBxCcrvf0Anqk4WxP5ACgHES8yVgIheDhdPmpm2yAA9NHxicGHS9
X-Gm-Gg: ASbGncvsJEnU09EvWS3kXm63N7GKNqqJDKu0ruend9OZdHWmMgMxB6bjal2vm3bD3e+
	AE1gH/4tcpx47ejRhiFAy+zoWSl8WywLs2k6nPqsVjIJQ7dCIigKsNVlbq2n2543o/zFk/S6ysX
	pkOVHDAkh1981Qm7ZDp6C7Z5O54yUzzHKv/FGIBL8pIsfq1WsO2o0Fy01lXGfYWQPbEWRhp38R5
	FxLYDBA+ajoxCbvp/xwTWGaIaMzLPCg/cLjWBL+OAgdj6F0lNZ8S/Ap1RYbvWhE3kuaOQUnmldB
	gJVWUQbXfUgKtGnZLeUQixhSoDM8EqYUEhrrsdqrFdAvKlNg7bu8Y9YMFgQorMgzW+/ZN0kaGAh
	N0kM/E0//t/pYNqoCVSxf647+d6mCi+ycSCTb+kH4DG1/tB4gWCm3IjSgvxK/ya9uPkYaC/YRt7
	tcJ2e/VpaJFjHkbPSgT98=
X-Google-Smtp-Source: AGHT+IHwCfcuQAVrH45QkcPoTDFaBDB13jQnd3ZoQScXzcZFp7JuU+sR0JrpunXzlrO81/Rg6ooxxA==
X-Received: by 2002:a05:6122:91b:b0:545:ef3e:2f94 with SMTP id 71dfb90a1353d-554b8aa8d4fmr905289e0c.1.1759919158739;
        Wed, 08 Oct 2025 03:25:58 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce694ffsm4345503e0c.10.2025.10.08.03.25.57
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:25:57 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso2079384241.0
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:25:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW//Es1LvwlTtVtBftMi53epArFdPWFkmcmbn/uTf7gsGFIjqE17k2Tlz9De2Hr1dcpo1mbkQd9pzMd26H3qA==@vger.kernel.org
X-Received: by 2002:a05:6102:fa0:b0:5d4:1e69:fda4 with SMTP id
 ada2fe7eead31-5d5e2375b8cmr814639137.21.1759919157025; Wed, 08 Oct 2025
 03:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:25:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP5nLSu4PDVO5LLFodgPvbYBZ9-Oyh6Ap101ukaGp4pg@mail.gmail.com>
X-Gm-Features: AS18NWDJs2ffomK6k-23MtOzRWpeHmLjXjjd7OOOXX1Fs-JbyrmQo7Z86oHzZmc
Message-ID: <CAMuHMdVP5nLSu4PDVO5LLFodgPvbYBZ9-Oyh6Ap101ukaGp4pg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: watchdog: factor out RZ/G2L watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/G2L watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,rzg2l-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> +              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> +              - renesas,r9a07g054-wdt    # RZ/V2L
> +              - renesas,r9a08g045-wdt    # RZ/G3S
> +          - const: renesas,rzg2l-wdt
> +
> +      - items:
> +          - const: renesas,r9a09g011-wdt # RZ/V2M
> +          - const: renesas,rzv2m-wdt     # RZ/V2M
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Timeout
> +      - description: Parity error
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: wdt
> +      - const: perrout
> +
> +  clocks:
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: oscclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rzg2l-wdt
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names: false

I am not a big fan of explicitly forbidding *-names in case
there is just one, if the first name still makes sense.

Regardless:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

