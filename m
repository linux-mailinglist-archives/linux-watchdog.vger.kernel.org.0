Return-Path: <linux-watchdog+bounces-4325-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFABBBD857
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 11:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF9134E6BFB
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 09:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B021211706;
	Mon,  6 Oct 2025 09:54:45 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD01F1513
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759744485; cv=none; b=lTLr+i3UiFQbBfemwUp6ZUw3jZqqWvTUR7h2FCyq6WPiH2AtRwtpMZ7DQaDBDvn5vHE5Pcpcx00bI+sepSIzZiAlItdosB6ZaqxsjZ5Xp02MQerl4jnyE5Z3d1bS+OpPlzSSEC/dDR2s9nU++fHPNHESvRGtuv30xTchB05bktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759744485; c=relaxed/simple;
	bh=9a0d7PJR05hcZ7JqZ/w9T5K6n1BhXnk/sufH+H791Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ap6kAAAS/mbmZDjGxY+P2m09MjDiq14u0MyD425KP6x8JEaFy1GD3+dihjW8bQNeTWpKQ3cKsDIjfKIEndZ2nJT2xbcybyCiONrci++kx0tBxRPXYeo7isCXrnPoonp7URvOMT/1o4dsdilpk0dvlxGNfby53T0/qptkV9Eqbp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5b62ab6687dso4974534137.0
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 02:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744482; x=1760349282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02SeAVrxKSeRuZFXg8bu7j1SPQaB8goga81E4fHjiT0=;
        b=J6EtXeRvuhYsQ5UfN6lTErCnBneDf7J3t87544EJz6NQbSC6qjuHsgFO3Rc+T0oqe3
         ABCB9fV/BFsx9NnuXUmraGsExwk4l0k9nnUwhjC9cQQRbZfsREx9IxNzJRp8GsMMXJs7
         uqkLb8sVDg9uCUmm5zTot8e1vJdKeBvV94bNm/Bj83KOPLmK+cIQq9LIaTkgnoixoVO9
         CUz5d3lqz/sk5HdV8pa9Ug/MB4gGK79fH3z4uQICX3yY4n5ExdGcdggbnTQ1QPCFmxyD
         n0OuhuQSteSwIxg9ppxmmS1stbmCQpG9Tdu+fv/FD8NM5UZXmvj0s/Mv+1FWB+SVQ3OD
         Yabg==
X-Forwarded-Encrypted: i=1; AJvYcCWHxTglWBpQPH+YmK2qyTfp0yOYFqH6kPULcn39arUyBTpEAVJ7TnUX94x0ohqyUeYYREAxxvIcPhurgSa2kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQr4MqmYkST3J5nQBUqpemRmc9lJshqCS0c+6eDEscVbsNCehM
	J7qBfckdgEHC7plhmv0/i/aoCqznH1d9Og8LRwkS0wENxH4LVP0ahqQGknpy16Fn
X-Gm-Gg: ASbGncvCpnXLID7RqIvDqMUIZjSipN3rGEF4eZy7T3a8lBYqJir4a1EDfNLeD2uNYhs
	/yEZ9FmRH64F0U3G/iCdH3Da7bXY8kV1JdJQwHJTbDpt+Autel+m5aFpnEw2E9vmwsS4roZokWa
	hFkj3KXgYb4dA6vskK2Mn2l2aA8fa/nZIH1hhVV73HliG0cMK2YNsp+kkEKsZnYloyRxgfG6Hle
	F/JPsHZJhCvTvZXm0A44D6XU5aMpwCfhWngt/l8YqPUU3NwiwthKCjVqd3YIsCFHBId+SSc0FLM
	azUgswvp/i2Au86fcV763zqFgSxdag8fkFuBjAFrEU89SW2eBSy4pqDADLwjztyIpp9Z0G+w2W+
	mwXbnObIFOoTMWMhAvZclDI9EVlwqFxuficrKAFnqEldYpdyCn1l8DDZRzsXrhWelmh383e3zbZ
	KB5z4LSqRP
X-Google-Smtp-Source: AGHT+IGkdX74eOe3+yi/3kPFDfQ81assYknjZCSnXGA5nkExnVkpWwtaggttuiLw7nxuB+JqMFx55g==
X-Received: by 2002:a05:6102:419f:b0:4fb:ebe1:7db1 with SMTP id ada2fe7eead31-5d41d05a867mr4576388137.12.1759744482129;
        Mon, 06 Oct 2025 02:54:42 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d40c6c801csm3207857137.14.2025.10.06.02.54.41
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:54:41 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso5853749137.2
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 02:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXczAyqrafmjdmYIOh+EYEn23c+3diaEdnWfTyGrX3dMhG1C12Up213N6Fo4c/QeI99Mdg482LKY48ARwNU0g==@vger.kernel.org
X-Received: by 2002:a05:6102:390c:b0:524:c767:f541 with SMTP id
 ada2fe7eead31-5d41d17e99amr4486616137.35.1759744481269; Mon, 06 Oct 2025
 02:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com> <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro> <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aONh89-5-llFZWue@shikoro> <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
 <aOOPMG_bW_q8iM7C@shikoro>
In-Reply-To: <aOOPMG_bW_q8iM7C@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 11:54:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9ibqQ-r9HsL6oZ152pan8un2xTYcgeXAzZ-hqQQ7q8w@mail.gmail.com>
X-Gm-Features: AS18NWD4s_p_0gq0J5HyiXTg6GlGkZfHS9UmalB-R7l-fnnGUHsR4vB2071olW8
Message-ID: <CAMuHMdW9ibqQ-r9HsL6oZ152pan8un2xTYcgeXAzZ-hqQQ7q8w@mail.gmail.com>
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

On Mon, 6 Oct 2025 at 11:43, wsa+renesas
<wsa+renesas@sang-engineering.com> wrote:
> > We do have "fallback" comments in other places, and I think they do
> > help in understanding compatible naming schemes.
>
> Still, dunno...
>
> > Would it be possible to handle this in dt-schema?
> > Currently we have to write:
> >
> >       - const: vendor,soc1-ip
> >
> >       - items:
> >           - enum:
> >               - vendor,soc2-ip
> >               - vendor,soc3-ip
> >           - const: vendor,soc1-ip       # fallback
>
> ... I think '- items' makes it clear that later entries are fallback
> entries. I am by no means a YAML master but this knowledge should/could
> be expected? If peolpe don't know that...
>
> What really is confusing, I'd say, is a mixture of entries with
> fallbacks and without. One can overlook this easily. So, they should be
> grouped IMHO. That's my previous suggestion.
>
> > If dt-schema would automatically drop duplicates of the fallback,
> > we could just write:
> >
> >       - items:
> >           - enum:
> >               - vendor,soc1-ip
> >               - vendor,soc2-ip
> >               - vendor,soc3-ip
> >           - const: vendor,soc1-ip       # fallback
> >
> > What do you think?
>
> (soc1 should be omitted from the enum)

If you omit it, how do you know it is valid to only specify the
fallback compatible value in DTS? We do have (non-SoC, but family or
(ugh) generic) fallbacks that must not be used on their own.

> Do you mean "# fallback" indicates that the fallback entry should be
> created? Or just the const item?

The "# fallback" is just a comment.
The new dt-schema magic would be ignoring the first enum, because it
is identical to the fallback after that.

> Well, this is ultimately DT maintainers call, but my gut feeling says it
> is better to be explicit than implicit. I do understand that the more
> compact binding documentation would be a gain, though.

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

