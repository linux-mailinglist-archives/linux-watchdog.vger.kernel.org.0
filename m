Return-Path: <linux-watchdog+bounces-4323-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD1BBD6E8
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 11:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A6F1893165
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 09:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C7B264F81;
	Mon,  6 Oct 2025 09:25:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0E260590
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759742726; cv=none; b=GOTE4Z/k6JwYk+MfD/CNTdiEwv3lV8Og+fEtISzlzpAEQl4x9Aq7d4xdqBG7IxW0d+tJPq7/0df23zv2+J2WqynB5wo8fRDhluxbQQ1gv8jI3FKCdi+LtQJgbe/XbEBO7utfcZo8qJFfttRbCeebJdtc+LKRESIBMjG3iSAKke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759742726; c=relaxed/simple;
	bh=sZDSusUePS7KTbHF94xK8rV0QQmbxPNR2RLFiaVDrNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyswNgr299boJNSQWQNpU371UGlgi4zqAk0BhpmTgIwkeXRQPSauGgVU85Rc8uzQP2lSxZjAxFtOfbk5RMgqygDuMUfiHrnYPpt8iHmH3c/IN0ATnPtNyAkpVlwIR51uSSsZXbmiuOhcv70CR1a+Gpoi4dgYbAH4NT1+SN0vZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-551b9d94603so1696585e0c.1
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 02:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759742723; x=1760347523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1f5H254g1HK7lVacJLaFY9n0QZTczpZzL+ddUhW6f4=;
        b=CacyQ0lzBcIBqP6eb4hm7NB1eL7AXNBQCyh3OFWIPTz+pFQwtKjACgFM6CrKb39frQ
         PvhVZn1WK/gBwR0t1drr1MHDiBIZV8Ee0JSrDMK/n4zDx1haZeOiZ6ZyHlsOIuQSZBPW
         WrcPtTG9gWvIGX/pvdAh5BDUS40GtnRmE1glz3SzdGOoNULId8pnCayuRWUuH8YImXOw
         aDMpCpdhFbSyjFmYIKu9YaBPRgjaV/Y5UTXOSDsRshcmu6L7FFQIymEWWrXPFappD8Dd
         G2orIXBlHBOmd3PUIVwuRsa80teEmDY4/mKu6iIzsBJW+EINWfZRdpV9GWdeJC4l/jLO
         6Zxw==
X-Forwarded-Encrypted: i=1; AJvYcCUHV8/NtYpsKTt4T4dQyuaiLRsY/+CLVh9utScpBxS4L82UpeYsXgDfBzpjXF2yPy6U6nKA4RXyumGlOtJs3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOE3T4klCkc/BoJzOJ14FabV7X7kn5PAM6IkojDkU1Bjbtwvt
	HjDjP/ASCFc8T9pFPGCY9vKanmPymaEDYxirHZ4/AeFENWYw2Y/PQRvfzQOPgeiG
X-Gm-Gg: ASbGncv410FMdNiwTVYJ/32LIQQpg3gilao//zFjCVTHCa00rv/bdrsLKmTv0CQH734
	zFshhbSsxiMMtCPaB9tYQbZ2lrLVvhLrqySJowV09s+oZQzCQguUEkK8dHhRMkna1wLbmqDeVbz
	X+8xzzEdGqYX4SXLweHvSxBnqmIO0LEj5AKVom1VOnb4Je0X5GFDLE1gpHJwds7EQaeFRZqFIzq
	HLxo+Orxm9XKwYK+b22EThrE1MqT6III9pjLwuQTSaTpjV843b3lrajCtSpvEQy6m5yLqFDooHi
	9hHYc05EHBihJ+d+g2SReCbhy25baQhixW733YlrxExOSZjdyZtCYa1w8Tv33PNk2ZulP/ZdSeG
	lCOxcqGblmaQtpmBH15iYGzpW4aY66YtmOLGYx2KQlqPuiYgufsd9tfGtFDbyx3iowBa+5hdLo5
	9vf0L8a7b8tB54JSPKSA0=
X-Google-Smtp-Source: AGHT+IERDw7zAIpE8EdeD2XQJe8y9Z6fNTqfz8JHmPFW0Ol5RfVhSwp7G9AdREe/XwDCTjwKXt5Gew==
X-Received: by 2002:a05:6122:201c:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-5524ea80923mr3722328e0c.13.1759742723170;
        Mon, 06 Oct 2025 02:25:23 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce202bbsm2900792e0c.4.2025.10.06.02.25.22
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:25:22 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-890190a3579so860857241.2
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 02:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjJkDJ3L56O6B8MsadHIu7tzn4YYTf0fVXGYysf/hbJf8FfvmHY7vKhzztBsGJjUdkbVeyHqdsuJJrkKgPVw==@vger.kernel.org
X-Received: by 2002:a67:e7ca:0:b0:4e5:980a:d164 with SMTP id
 ada2fe7eead31-5d41cdf4a3bmr3915460137.0.1759742722677; Mon, 06 Oct 2025
 02:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com> <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro> <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aONh89-5-llFZWue@shikoro>
In-Reply-To: <aONh89-5-llFZWue@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
X-Gm-Features: AS18NWDrTsDaUWwW6vNGYUXbBb2hzV0fRFzAQBAzuQ6sMouqWvDz9ki7n_BBmQw
Message-ID: <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: "wsa+renesas" <wsa+renesas@sang-engineering.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 6 Oct 2025 at 08:30, wsa+renesas
<wsa+renesas@sang-engineering.com> wrote:
> > > > > +      - enum:
> > > > > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > > > > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > > > > +
> > > > > +      - items:
> > > > > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > > > > +          - const: renesas,r9a09g077-wdt # RZ/T2H
> >
> > I guess a comment like # fallback RZ/T2H here will avoid confusion.
>
> Hmmm, if we add such a comment for every fallback, this will be quite
> some churn, I would think. My favourite solution would be to swap the
> 'items' entry with the 'enum'. So, everything with a fallback comes
> first, and the 'plain' entries last. But what do others think?

We do have "fallback" comments in other places, and I think they do
help in understanding compatible naming schemes.

Would it be possible to handle this in dt-schema?
Currently we have to write:

      - const: vendor,soc1-ip

      - items:
          - enum:
              - vendor,soc2-ip
              - vendor,soc3-ip
          - const: vendor,soc1-ip       # fallback

If dt-schema would automatically drop duplicates of the fallback,
we could just write:

      - items:
          - enum:
              - vendor,soc1-ip
              - vendor,soc2-ip
              - vendor,soc3-ip
          - const: vendor,soc1-ip       # fallback

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

