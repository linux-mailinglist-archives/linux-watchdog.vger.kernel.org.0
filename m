Return-Path: <linux-watchdog+bounces-4356-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE6BC4593
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 12:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A0CF4EB9E6
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 10:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF3D3D76;
	Wed,  8 Oct 2025 10:37:09 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E92580F3
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759919829; cv=none; b=iejzoPcQyHRJS2aIiKzB9gu9ql8581OHj8woWU1ROeAW/05hKKnk5GpjVI8RJMS4mIf2KraGceN6E9PR89ae930TAfSqdWYd+U6nKnBzyC+w3KSM6/YQ+T9x90oFArz3wQKJcNJoG4D+UpGZd1mUEx7R+/hjbxWTH9mjVlOgBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759919829; c=relaxed/simple;
	bh=dOAt+nuRo28aNDNvJxcRiwiD39zS4vrxmN4+5vmPi4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrRHFCHMHrmk7Gjp7xDLkclLGhvS75psHu9KNi3VD7vVzUZkqFbulFPCgl/AADZ3n8sUNhYivuB9bvD33+Zrb6fRDiwxsZEy+ecEXAti+IOM/NH5c6PeWu0bSDo6qkwW/hY/karL4OHU/enR/xj/WW7ZIuVVcgZbdsWir47qxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5b658b006e2so3674553137.0
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759919825; x=1760524625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpM5IF7an2KKoogtwZq+ATkkUPR65N1c7rRftHs9zKs=;
        b=w+1weaiYrvq1b8WdCfMebtj3W6yZnQf/ndeUlb7zX2M7HikvaII05upWUunW7xgFrm
         GLfWonzP9mJVnjMBVq0vfOY9J72X9yzj3SVTycv+6oZe28sU7gziVZKicPACE7/IBuik
         O2ETyFB7qqs0Dl+XtcHaGIXVBEWLR6tAPIYNwq7BIz51cfIi9djQylBkED2OHVxdtfig
         OBMKFzXDfp0L/jlN8LAsZ2AbF2pfzVGGKxUMjPGeJeBuw/V5XTWwp5NHzxPKsNzfFPjG
         MkJGskErLAayr3PNttipWqW3UrsPJbfSSP/DEvZ6Hj+IurASDCD8FONVhl7BzTy1gKth
         QxOA==
X-Forwarded-Encrypted: i=1; AJvYcCU1t2HTLPSaTgHuFOBc/lcDzEd/NU0hEp4F1WfFQqhIQSBrUkgscAelDCrbjSt5KA8wqONkFhH/skXjgappyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7q/bgtaySnk2IYR5J8zWroGhvwjGbHIBXP9lxsIiW4CLh3e8J
	/6nl/JiM9khImnUWKLuIWEvcux+axhNbPoTM05GPQTrMlyk2/2J0WmiM5+4/IdqL
X-Gm-Gg: ASbGncvkqN+6b1YGqDF1ffdSZ5WsHdTSPrZxtfL4Q7nGi0Fe6bhTnCbQTaNABL5mYCy
	09AM1yYm77C0ETBq60ZN/Xgq8CAXpD8zh678t1RpwpNwXY0UHeFpvoU7fRTRFFgBWsI2yLX6fyD
	GGvRJ96pPlppTr268876CsMJz9lGihI7Fgox7LcfZuVvIgF1qzFMTUF7QhO0qmE2jYT59ZEkxib
	SBACFyF3gDyUCEgRBRGyar3ijAGJnpuJBpkkxqoJe4B9mlJDsG2K1I9QSgLrIV9lcCYdFlVtVXu
	SuFD1KXc8a/Hh28Lz/NgzFmk0ntC75K06LpQPU8RqxOSHEyOrxhz01yFLmDTqMWUeEzBxKNJyM7
	WZ8SlzuM/cv7Pu8T79wTHu6okrWQ0lZr6rxxoUYzj/80PKvJi2KWPSm7731L7yB4+5L0ZR9HHew
	Z5HYg6hG4T
X-Google-Smtp-Source: AGHT+IFELr0j1LYdo4kg6yIzbmAm2KGEdIzUmfpqw6SfWDs2VacvlGQzYi1mNKHm9hWN6atrUQdFWw==
X-Received: by 2002:a05:6102:2ad3:b0:4e5:980a:d164 with SMTP id ada2fe7eead31-5d5e1ff4588mr1161713137.0.1759919825301;
        Wed, 08 Oct 2025 03:37:05 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d389f9e3sm1426592137.7.2025.10.08.03.37.04
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:37:04 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-89018e97232so1715823241.0
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:37:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVH7AIz10qBkIQR04VHVglBRBC1ccJM+0DuvmislIyxO+UGMQXfUFG5Xjs6P3yx29nKg7BJefXuSHBXRXkoDA==@vger.kernel.org
X-Received: by 2002:a05:6102:2925:b0:520:4054:6b9 with SMTP id
 ada2fe7eead31-5d5e226f3e6mr849411137.9.1759919823850; Wed, 08 Oct 2025
 03:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:36:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX29OUfM+RphgS3jk9Whw7kz+U-ysFYq1FymdU4GZLqFA@mail.gmail.com>
X-Gm-Features: AS18NWDuumoDujetCyC5cvBjrasbgP1Lj0erif8acEm21JO_mY5oVayc_GqwzjY
Message-ID: <CAMuHMdX29OUfM+RphgS3jk9Whw7kz+U-ysFYq1FymdU4GZLqFA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/V2H(P) watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,r9a09g057-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-wdt # RZ/G3E
> +              - renesas,r9a09g056-wdt # RZ/V2N
> +          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> +
> +      - items:
> +          - const: renesas,r9a09g087-wdt # RZ/N2H
> +          - const: renesas,r9a09g077-wdt # RZ/T2H
> +
> +      - enum:
> +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> +          - renesas,r9a09g077-wdt    # RZ/T2H

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-wdt
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-wdt
> +    then:
> +      properties:
> +        resets: false
> +        clock-names:
> +          maxItems: 1
> +        reg:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1

Both if-statements can be merged, as the second test condition boils
down to the inverse of the first.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

