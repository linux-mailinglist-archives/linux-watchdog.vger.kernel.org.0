Return-Path: <linux-watchdog+bounces-4357-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0DBC46A8
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 12:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A3B189D47C
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 10:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8CD258ECF;
	Wed,  8 Oct 2025 10:45:46 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63481339A4
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920346; cv=none; b=VRNw0xaIlmWJw3c2lD4pyH3Z0KmnP3KeP7QXmsQUI8XEm0m5JYla5ZbtkSJiURb18QJSpG/xtj7styYQ8NhrN7KJ1QGuKja5n8ZRjxA9kzAg9yoSOSmE7j9ayAFH49ioMgj7qlJ2jjqBNC0qtdl3lrVZYytb4OwppeUz2tToyyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920346; c=relaxed/simple;
	bh=f41S8yF7zMqNs+KlJnvdjpanaT/vvl8yVAE2KUrK5+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjPy+lUV+HJKYpK6qge2BXzawVDP6jepgMeD+ENgX1RHl6cbVLKoR8ZCDrzhqSRmLXYWqhRMCDaeFyMPKkaf4eEnnIE33wm3b9klw4vV0cM2GBVmT5tj6A5t9I41zSR288JMOsuLRpNrg5lUiRX9xGcxYPW2jSPI+c/NjZuHFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54a880e2858so4606754e0c.2
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920343; x=1760525143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaqCENqEwBs1LWyCnXwMZfx/+9LYbf6WMr4p/7V1iIw=;
        b=aVstbdbFyz4RH2AQ2PidYuyLUYTI9NCDO3P03/p/49wqMz4ddFH1Jx446vEoGvcW8G
         Gqttns5uMEw/JVqGwXJ0v7HWw2VmVkleWEsZl6bPA9GnDlaTWCLAb449qR65TdhhhFMY
         5zZZrU+nNxu1YS0gMQBowxlM5jPssDowMPFY4+OJ2xVt+saeQZ3h7NoTEc+G4PXtm3AH
         6Lc6wd7l57e42i1jLrJr4CtzdTf14HL4CSQS9tQk2yl9SnEMVcg4xY+3syqmUa4+hrb+
         cbQV6y9kjziaITzisaEBGa3rh7i6+v587wL0OoyAJTh+hZPGIzcev64VwPMizslO89jM
         c+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW2KY5KPiL2ZX/TyYhKx4GnQyJzBhVflnomwmyRu38uM42znmDbMevbdMEw2rSO4hEvqkLDCWGWKRB97dh7hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHxuu3NotDyYPBrU2GGIDVuai49BCe4adD8mEipS7TTfNRTYe
	o7jQp6HJD/Sp8i3E1ngMWm165UJOlf+1QJ6keNyCs8NWfRvikxTy7WYEhWIfeaPz
X-Gm-Gg: ASbGncv3g6QlbjljWpg+FAoharld2Qsrjlk5PpTer5uRQYLFITIcmxHMshZZQZjPmXZ
	fRbliqOg0VZeEChE2nTCetf4Q3ynSEgdWgCItv5FGos/vVxcZDmWNsf5JyJghjL3V6kEC91wVzw
	OCpx/dYxyj9bcgMRNR4sMIJNReM9eHnBj8D5CvZRZAMRrEdIyqvSSXZdXI9LQZyLmgNg3BP18Tq
	W7+EKZrwXlnP1Svu6FI6aDWlIyrH2FEKGHBaEYYfe3cxQUKAKmUTogmxYS5jnRi1IQXkcs6Vo0C
	x2IAuwfDyvWA5hm7yw9WYaAg2vC3ZSxHGm+fQYa96RjnwIYv9ciqD528AYgJLpiAoXnCnocWFBz
	Cc6qOPY9z2xoFQ5obf8/o9fzSkacRqhNiDECPBMjWAji+dew2K7BtRS4FXFxirS8gqJhoyECo0t
	b0BIr+FNDFjjpm6nJld9I=
X-Google-Smtp-Source: AGHT+IGDEJqy4+XVwiseA0P0p5RndOXk4WWNKa8MQ4oSlTMC1w2uKQnU16vgm8NK71d0KABzz6KPBw==
X-Received: by 2002:a05:6122:1e16:b0:542:59a2:731a with SMTP id 71dfb90a1353d-554b8c3112cmr1089933e0c.16.1759920343257;
        Wed, 08 Oct 2025 03:45:43 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-552ea335f07sm3340004e0c.15.2025.10.08.03.45.40
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:45:41 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e30a19da78so4146366241.2
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJlyaVqQya18RuFtGHLo3HKIdA+dqk1YGeUhB/aLOzurN0hZr2q+gSx7WWP7NXCcTaJ1cqp2TJ69pwr7oKNg==@vger.kernel.org
X-Received: by 2002:a67:e706:0:b0:59d:6be4:5b97 with SMTP id
 ada2fe7eead31-5d5e2213da1mr1257706137.5.1759920340484; Wed, 08 Oct 2025
 03:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:45:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf80xCgCZE_NTbBX15tK7f8==ZbP8zvVS21pRyDMEziQ@mail.gmail.com>
X-Gm-Features: AS18NWBQorvHKEIEsh9zX6_qgp1LEf-fkTDr89jGB0dEkJGrHD74K7XFHWjLduA
Message-ID: <CAMuHMdUf80xCgCZE_NTbBX15tK7f8==ZbP8zvVS21pRyDMEziQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT
 exception for V3H
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Normally, RWDT and SWDT can share the same binding. But on R-Car V3H,
> SWDT misses the reset bit. Add this exception.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -39,6 +39,7 @@ properties:
>                - renesas,r8a77965-wdt     # R-Car M3-N
>                - renesas,r8a77970-wdt     # R-Car V3M
>                - renesas,r8a77980-wdt     # R-Car V3H
> +              - renesas,r8a77980-swdt    # R-Car V3H SWDT (no reset)

The SWDT module on R-Car V3H is still identical to the RWDT module,
and the RWDT/SWDT modules on other R-Car Gen3 SoCs.  It is merely
the integration into the SoC that differs.  Hence I don't think a new
compatible value is warranted.

>                - renesas,r8a77990-wdt     # R-Car E3
>                - renesas,r8a77995-wdt     # R-Car D3
>            - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
> @@ -74,11 +75,22 @@ required:
>    - clocks
>    - interrupts
>    - power-domains
> -  - resets
>
>  allOf:
>    - $ref: watchdog.yaml#
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a77980-swdt
> +    then:
> +      properties:
> +        resets: false
> +    else:
> +      required:
> +        - resets
> +

Instead, I would just make the resets property optional (i.e. not
required) for renesas,r8a77980-wdt.

Of course, I wouldn't be surprised if the MSSR does have a reset bit to
control SWDT on R-Car V3H.  But it may be a bit hard to flip the
suspected bit on a system with remote access, as it requires modifying
firmware permissions?

>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

