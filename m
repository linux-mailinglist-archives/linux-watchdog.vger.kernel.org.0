Return-Path: <linux-watchdog+bounces-3945-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A317AB18855
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 22:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ACC51C2800B
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 20:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17D71DE4DC;
	Fri,  1 Aug 2025 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1LybBUB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54B2139CE;
	Fri,  1 Aug 2025 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754081496; cv=none; b=X0PYTuLzDLCJziChBkAYRDNzCOAZ7i65cmjTag6yleL1G97v5WtD4QWxFe+rHmVQpenjUcW6ApCNkrChexlf67uNl5PvwoQrC1DWKpKU1OIJfKoEbNMoLNUDUr0GTcc5E9yyE4tELMGvaQmKVUi8PXVDTTSa2B56L11kG9TzJ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754081496; c=relaxed/simple;
	bh=LywoDqFd67EXhP5iJoNCi5/k+5jfKfBPmp6QbOSYwLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHsNmAekuBmemL2LFPIDjJabA78RQkzNkM6XAlS+zTxe6J4EjbV8l/3VQaALiN5JXlRIAVBcECHicO+LJwCYwn96kOufAG6cGgNWSJ/YJmarIt8W9utyplY+478y0GWErS06CE6/m23edTnP0X/WerAviMIH2fJfEHksTp9ep6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1LybBUB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso2178567f8f.3;
        Fri, 01 Aug 2025 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754081493; x=1754686293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFqBXjHE4e64eq5LEzPI2QMvIEhGcwhdF8IRrL5gzK8=;
        b=k1LybBUBMqYLaI7j4TKRE3kykURZYzg/OGh6YKV2tjKx9cu/dYGe6wpFkSVMTYhALI
         hhMrntBs4/AAVTA+aUvHo9gMLCsjXLlzXL+h7NhzJi6RqvLkmMs9e7BIM/joNiqtRd4r
         LswwUpsYXxQKCqhtqTu44VsIIoZISpb73FbvRzPi07asdSmUMaLe/rLjQy8LpWr8pmJ1
         XcorTzlbGeVaWpe8lTxbXKjw8eLBG/2PLIidVBL8ux0E42mTaKNy04woGJaw6UtFShRx
         P0IPvhJ4qe9cJp+vUH0NghsdenGbf/Vow67FjA1OVSzyyu5HcQNCzVmQZTHQdDde0UQk
         UhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754081493; x=1754686293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFqBXjHE4e64eq5LEzPI2QMvIEhGcwhdF8IRrL5gzK8=;
        b=O4m6aTc8UdhYVQmxMwP7WsDeXxZTyYKKRDDgsHMaBmD2Uy1b0XFEAH2nsjKlqYzYXF
         VhurmzAeqXU3z+p6K1wX/eyoqReu/AudkGrwD5jFJB8rXDf1qGPuhL/xDjnAIyArcngZ
         edrmJkOMOAChO3aJn8GqOunUVaEOw3kji2FRo+DqrxeLjxqh1LVCp8qSqCIryHx06suG
         TyeiOIGhIrSJZ3JDbGwucKW+MwQ6UJi163u6ONxSDfHl0Ya4bUku6LFTaSK0dQ4kWNhi
         C+EtHACINMozZCh57G8QXYjHxilRhbjchfwREHETUWiGjzkZffH6pLlJtmElknjuqXPU
         rZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSJkOWAZABnmSBsaY2GpWyrKyFc9FiwZ0mjMzGGWDoS370XzcJXab0JXsxZgDVVBNgiIebO2WlycET@vger.kernel.org, AJvYcCUsCXd9gv0Lic9n1Ad9DhWSh1MCrMjoc9yq3P1EUBVV38xjjR/VsYVUxXBR1n7HeyOszYfyh1U5PusNGZl5iH8=@vger.kernel.org, AJvYcCX+8amcgAvaiVsIa83f4J4rqKGYwWNjJUNctgJQM2Ua9BS4j1mfqJY9Hi3PxTgQyrwe9I1hASkaX1mg4OHRmcK8rgo=@vger.kernel.org, AJvYcCX+AKxA4FgGzRbXMaXg5fYcdHCeoNUjHhpEoVwsFe9/l6FN2+K/J4FKybit5YE2WA95RsqW3Apxbw6CymF9@vger.kernel.org
X-Gm-Message-State: AOJu0YyvAuDpmxOJPBziaTZ/DmfzE5YeBCYAN/+m/lZ20JU2jeY6GI82
	sErywgpERpvW9xxj2UvgMmpkjRaoVeEHKVtyueFsLxr+BDx8kl7XqqagzJJ5zHdAXCRh1kyY0HM
	WwnSXV9zqAKyKmVPPHkP6aXEPKyI76i8=
X-Gm-Gg: ASbGncvA1w6Qc9eyEzYC/xwpwTT7QxLqdjQ2kJAy4yTqg9TEwZQOwmYZpw+N6MdTMpX
	y69goA3iug741CLSLHrSYVDZnVtDi2r70js+pD8THjOxZ2TfLxKjm+1p7tmE6rWuLk2v7prAIQA
	DgcT4/n0pPunDO9OEqea2E0va6cf6YvOOhH47d8uI2CWh1lxqQ0brCarg0wJZmvFWoT6Ghu1YVk
	f3/33he
X-Google-Smtp-Source: AGHT+IF50sKEAxmPJw+zBnt9N8VzaK/xu5Ai1s6z6gez/necqUX8ArDa1mgFO73kx3v57ibewH3yRA3fb8p4P9KwHgY=
X-Received: by 2002:a05:6000:2906:b0:3b7:bedd:d268 with SMTP id
 ffacd0b85a97d-3b8d94ce5b8mr880943f8f.53.1754081492728; Fri, 01 Aug 2025
 13:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aIw-P6zkQSOhvYJW@shikoro> <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
 <c06bcde9-0aa5-46d1-a5bf-bae5a319565c@roeck-us.net> <CA+V-a8sDP7iir-bPetbCw0fakPRxua5F-F1hVvXUD8bGAMdhFA@mail.gmail.com>
 <cd0653d0-4a2f-4361-8eb2-c1937d988a8c@roeck-us.net>
In-Reply-To: <cd0653d0-4a2f-4361-8eb2-c1937d988a8c@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Aug 2025 21:51:06 +0100
X-Gm-Features: Ac12FXxwBzrw_MPAIEZUAbyIOfo-88ItW4QWQ2lgoAO1TKkCYG2E0XjqDRvETgo
Message-ID: <CA+V-a8v0KZaeJwJAmEpRRdS3F3vC_CYv7zGN_n9a+M6qhFDMHg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Fri, Aug 1, 2025 at 7:04=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/1/25 08:30, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> > On Fri, Aug 1, 2025 at 2:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 8/1/25 04:05, Lad, Prabhakar wrote:
> >>> Hi Wolfram,
> >>>
> >>> Thank you for the review.
> >>>
> >>> On Fri, Aug 1, 2025 at 5:10=E2=80=AFAM Wolfram Sang
> >>> <wsa+renesas@sang-engineering.com> wrote:
> >>>>
> >>>> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
> >>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>>
> >>>>> Update the watchdog minimum timeout value to be derived from
> >>>>> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
> >>>>> consistent minimum timeout in seconds.
> >>>>
> >>>> I don't understand this change. Why is the _minimum_ timeout based o=
n
> >>>> the _maximum_ heartbeat?
> >>>>
> >>> The reason for deriving min_timeout from max_hw_heartbeat_ms is to
> >>> ensure the minimum watchdog period (in seconds) is compatible with th=
e
> >>> underlying hardware.
> >>>
> >>> max_hw_heartbeat_ms is calculated as:
> >>> max_hw_heartbeat_ms =3D (1000 * 16384 * cks_div) / clk_rate;
> >>>
> >>> This value varies by SoC:
> >>>    RZ/T2H: cks_div =3D 8192, clk =E2=89=88 62.5 MHz -> max_hw_heartbe=
at_ms ~ 2147ms
> >>>    RZ/V2H: cks_div =3D 256, clk =E2=89=88 240 MHz -> max_hw_heartbeat=
_ms ~ 174ms
> >>>
> >>> Since min_timeout is in seconds, setting it to:
> >>> min_timeout =3D DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);
> >>>
> >>> ensures:
> >>> The minimum timeout period is never less than what the hardware can s=
upport.
> >>> - For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
> >>> - For V2H, it=E2=80=99s just 1s (174ms -> 1s).
> >>>
> >>
> >> Sorry, I completely fail to understand the logic.
> >>
> >> If the maximum timeout is, say, 2 seconds, why would the hardware
> >> not be able to support a timeout of 1 second ?
> >>
> > The watchdog timer on RZ/V2H (and RZ/T2H) is a 14 bit down counter. On
> > initialization the down counters on the SoCs are configured to the max
> > down counter. On RZ/V2H down counter value 4194304 (which evaluates to
> > 174ms) is and on RZ/T2H is 134217728 (which evaluates to 2147ms). The
> > board will be reset when we get an underflow error.
> >
> > So for example on T2H consider this example:
> > - down counter is 134217728
> > - min_timeout is set to 1 in the driver
> > - When set  WDIOC_SETTIMEOUT to 1
> > In this case the board will be reset after 2147ms, i.e. incorrect
> > behaviour as we expect the board to be reset after 1 sec. Hence the
> > min_timeout is set to 3s (2147ms -> 3s).
> >
> > Please let me know if my understanding of min_timeout is incorrect here=
.
> >
>
> The driver is missing a set_timeout function. It should set RZ/T2H
> to 62514079 if a timeout of 1 second is configured.
>
Ok, you mean to handle the 1sec case, introduce the set_timeout for RZ/T2H =
SoC.

Although we cannot achieve the exact 1sec case as we can have only 4
timeout period options (number of cycles):

1] For TIMEOUT_CYCLES =3D 1024
 - (1000=C3=971024=C3=978192)/62500000 =3D 134.22 ms
2] For TIMEOUT_CYCLES =3D 4096
- (1000=C3=974096=C3=978192)/62500000 =3D 536.87 ms
3] For TIMEOUT_CYCLES =3D 8192
- (1000=C3=978192=C3=978192)/62500000 =3D 1,073.74 ms
4] For TIMEOUT_CYCLES =3D 16384
- (1000=C3=9716384=C3=978192)/62500000 =3D 2,147.48 ms

So to handle the 1sec case I'll set the timeout period to 8192 with
which we get a timeout of 1,073.74 ms.

Cheers,
Prabhakar

