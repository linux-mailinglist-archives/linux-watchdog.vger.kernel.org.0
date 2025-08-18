Return-Path: <linux-watchdog+bounces-4007-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E4B29EB9
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 12:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9049B1962D2B
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 10:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D44D310786;
	Mon, 18 Aug 2025 10:01:16 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689B310775;
	Mon, 18 Aug 2025 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755511276; cv=none; b=NiSevBLfOt0zy4vIk4LH/ibXUcXm8FGkrnhVf82khFNipxp4Mr2KZPsIDUzTcV+CytXmZo8hrSpJ6BuXApIemfcaH8N0a/uO7cyjbOj4GX6T0VfSZskDjhuhpMO8OIfTfqve2pY/MoEtPeoxD2XMlRCI+H5tqqhKpBaRHiVv6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755511276; c=relaxed/simple;
	bh=fOJf2bOIilayjpDytPMrDIar+EryOHtOhrMI5yLZNW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gy5b2C22K/jTPuBI0lmyMvzs5cKy63fOYJHAQqdqO4mhwtjGwVsGaiTA9e/kaseKeEFsqz12plMUvsJZVe7RFL47KGtcz8COvO07PZNG8KEl9bYjC2Vpmv7gzaXgcIjSAYa6o71LpL+5Yoj+snD5Z8b5lupbkIK1v3WtEf6j4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53b1719b717so3418206e0c.0;
        Mon, 18 Aug 2025 03:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755511271; x=1756116071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvQvdw3uTYy/ciL49LpZilhYd3aWULCwK/kQDMwzYTQ=;
        b=Bc5rNI3wo/34tsN8MC7xidJjqSmrDd8YJ13QBzekeeeW6QsPudN2gCfdu5SMjIn8OZ
         HIujgEfSebLiqcxo6cIcxKsdnlU1oBqfCOmMt91N0JPb9sa2bYB5sDPSHzvSOLrbgwsO
         GCg4HHyu2z2Q3A7a6Yl3YMlnUDC8kS5oSuKlcE2nAFk171hKG7YjcXEwlzjnOTPhMii7
         Upyp6CkOgKn8b36xU9DoS2llyb9tWfgnmVvvcY2gluCjhPstKcDpEmX9txQZDOGa5oV8
         rtd+eMbffcGW4hz7QMs/zXtbxzxXYLmQYO2O5uGP0PJxdjLwPkomEYR9K5bMfk3hP2uW
         SThA==
X-Forwarded-Encrypted: i=1; AJvYcCU2znL0ojDLNKewitN3ImOSJcYEwO1yOmIUJk/w0KSl5WTcolVZm45AEjdZUGR0b+c7UHZbML6XOOjqqbuRxXstUNI=@vger.kernel.org, AJvYcCWwqUP7s6/VJo2VNScpd46CX/lkaFI81Bkg4VkdQdttR9gzpy6ndSgYJHB7cz+Yf9b9KqsPzN2CTo0C@vger.kernel.org, AJvYcCXqsOsxlQKb/Ry8XdP9B8+X+htAG2yXl9athfJtjflk9FkDLwx3UVhXPwdGQjCmT7cEkqm6cau8Lgd2YUIa@vger.kernel.org, AJvYcCXw/kiGOpooLFVU/ffwYN/mApPi3eegOF5gEM3DhNYxCtN/OWUYz0beMhdIEnrZxoxPzQoBfiQFH4CBicmpmXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHAYdcL/L85bZYEoUABP3MB1Hz1Fs3twKIT0j/fJj1sgg+oKUZ
	gDg90eN2dDuACC+ffdmdKEtfK94s19O5nxxskEQp8rUtZwwBV/BvVod5pxg1aeKV
X-Gm-Gg: ASbGnctDanCxA33Qv64lLHVqPxCsD9MKWhZ0plOtD3DY7ba4l9Z7H3Hz04sz8XPRoxq
	Lu++HksyeopwR7Q7f0tGH8qnuNsiOx9cNILnQM0Vd979UKHKHafk4JI0cJ/cwYe1W68nUcrfb0n
	n0peToUcknhQlV/VjDx1qJNs4geFM9ApxJhPahYbGrnZm1TyRCG5fsAkeUBdD5jnfiee2GiL0++
	IwaIwJHS6RqNfl0kUEEFz76iwQKCtwrvDM21uhlDYfmuUtSvFDslkCKIFvE+mNE+pagVhrGYOM+
	jN3HT5rS11wSV8dbOmszqGx2+bcVsBY2af5e9BlKkDXqgSXyr9qXo/EjEorKsAEgLhcgZXyvUpo
	KPV+3Vjpn8e/Q17MnB9DKf9d5NI3s8m/cysiYSz8FlV9j5r3iooleOogLhbELf91k6YSARjI=
X-Google-Smtp-Source: AGHT+IG9V9NEAWX/V2VuaMCHR3NOGzzBoOe2JCJWBlv0PcUli/Q8ip7KBYjmEAyR05KqT9NwypcdjA==
X-Received: by 2002:a67:e710:0:b0:4eb:efc6:740 with SMTP id ada2fe7eead31-5126cb4dca2mr4303008137.18.1755511271279;
        Mon, 18 Aug 2025 03:01:11 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f80546fsm2016420137.14.2025.08.18.03.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 03:01:10 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89018e9f902so2674919241.0;
        Mon, 18 Aug 2025 03:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLDKsAklDonwlbQUzlzURT8FjxY9wByDqE3+wfaVsG1oAe9oQF0nyaZwgr/UUGe/E+fxEaYXlO2ZFBkRUwwP4fEoM=@vger.kernel.org, AJvYcCViBlJS83o98d9V2L1mRNaz2AMgUm8p7ur/udmufeEhnKVBmyFoC1oq2NPf6vN5tY9uP10yGqVXBqLr/vs7@vger.kernel.org, AJvYcCVo0WP1yc4Y4gksTO2p5kc9tU3tCGwY169JNUGrxSaeN2KW8ropHCMXs+e8bw+OFqcP+UPCHw0XzZ6B@vger.kernel.org, AJvYcCW+6b0pN3dr20wpUeOad8wTHk5Cl6AZZJ06mF1dRuPDk68JnORCJX14wZk/RDZPoTD8aHOzvc1Fhm3ll0OcVhA=@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:4e9:9281:85ba with SMTP id
 ada2fe7eead31-5126cc42049mr5010118137.13.1755511270019; Mon, 18 Aug 2025
 03:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250804195723.3963524-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250804195723.3963524-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 12:00:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtG6Sb1WCAGBzyzxrS7rNBvyMa1NZdRiJuysUsYJMKfg@mail.gmail.com>
X-Gm-Features: Ac12FXzuBoEIZeUE5wSrCNZjz8blJ3-ac2uBvs_iRsPgErX3dhF1q9q8CePNpJQ
Message-ID: <CAMuHMdUtG6Sb1WCAGBzyzxrS7rNBvyMa1NZdRiJuysUsYJMKfg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: watchdog: renesas,wdt: Add support
 for RZ/T2H and RZ/N2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 4 Aug 2025 at 21:57, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Extend the Renesas WDT device tree bindings to support the watchdog timer
> found on the RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> The RZ/T2H WDT is mostly compatible with the one found on the RZ/V2H(P),
> but includes an additional register and differs in the clock division
> ratio settings for the WDTCR[CKS] field. To reflect these differences,
> introduce a new compatible string, "renesas,r9a09g077-wdt".
>
> The binding schema is updated accordingly. On RZ/T2H, the WDT does not
> require the "resets" property. It also requires two register regions and
> the presence of a "power-domains" property. The "clock-names" property is
> limited to a single entry, "pclk", for this SoC.
>
> The RZ/N2H SoC uses the same WDT IP as the RZ/T2H. It is supported by
> using "renesas,r9a09g087-wdt" as the primary compatible string, with
> "renesas,r9a09g077-wdt" listed as a fallback to describe the shared
> hardware features.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -81,10 +81,17 @@ properties:
>                - renesas,r9a09g056-wdt # RZ/V2N
>            - const: renesas,r9a09g057-wdt # RZ/V2H(P)
>
> -      - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
> +      - enum:
> +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> +          - renesas,r9a09g077-wdt    # RZ/T2H
> +
> +      - items:
> +          - const: renesas,r9a09g087-wdt # RZ/N2H
> +          - const: renesas,r9a09g077-wdt # RZ/T2H
>
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

The second register block is just a single register, right?
Showing an (early) example of the device node would make such
details easier to notice...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

