Return-Path: <linux-watchdog+bounces-3954-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E7B1A088
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 13:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A16D918883A5
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Aug 2025 11:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E5A24A07C;
	Mon,  4 Aug 2025 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUN6Og3U"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC11E5213;
	Mon,  4 Aug 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754306674; cv=none; b=MTYdOyGLNo+FVm4yREoMGk9uQIvgDeEdqz83R8SGC+VkjmlZQl1tBkCaahNyprXdmoNKeo1hp9sXLugp3ZlmK2GV8w9ulXCNO+eYnTJ2C/9P0+H1B7KWzd4jU7wxifyU2g41KzDffINNx9ZFtNcJ5+6UkcDPnkpjihdechn5eVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754306674; c=relaxed/simple;
	bh=K3QmAP28TIZiVWo6uxeExrU7f5L8dIyVAI4JjHe6Fng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1t+k4+bRc8BhJIyGx9bbWMOZ8lc+GwR+wMDBSQRpwWsKfHxIQFti/KhWkd8mioYoN1cD1Zbd+UAILdUA6IkjsamASy6W7iofIecpdmCE6K6hegeHXloyiwnYcbC9iUNRfH2DpP6TOSjh0l3Ztz5nuhsJoPrg7nFFNrHZtKYt7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUN6Og3U; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so11800135e9.1;
        Mon, 04 Aug 2025 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754306670; x=1754911470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCjygzKZqoMfaDFf1VqZTbmyGyiejIeO2DsGnWTZzXg=;
        b=lUN6Og3UkUbeXNqUMu7CCDu1DCNv9wKnOAeuhPPbMHsEk67izMK/4bkHp00nHgPCL9
         tiOemgQYlq6+f2Kuko8WPyu28wZ34HztCKUqWk6/p01HUOw+tVRK1tIKhTpwYVsG6dJO
         JC+XTo0L1TrpldiYjoRsOD+3a0imaZByre42b8k/s2XkatGBgE8TajvulqBLfoeAIfWV
         KafGHL94bTFJ8Gjr6BsbtcIMqX+hHvDtzGFiC0NMcnGmYbZ3+HRoXg9juQb03w8ojcRp
         fNAg/aJso0kX/yyR0DnWsPSY/YGmRCUDSAwYySNEJkUPpgzv8I72H1sjkx989d3lku48
         zfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754306670; x=1754911470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCjygzKZqoMfaDFf1VqZTbmyGyiejIeO2DsGnWTZzXg=;
        b=DNCsw0kezwtu3jdZdm9CJP1p6nGxBAQ4QrqEstfnSb89QXtH6vJxBx0ij+I66q2XbY
         iLi6HdKj7+IRPp4GLAHUaUT6uV6HwoXA9HXUYrnnimPduzWo6kW4wMETHwv5MbhnLv9s
         MumPDBe34WwjF93rzBeq4F19oprO3/mqa7vV7mrhO0kt0O7MXI4z3gCOZvQ+YH6fqcpt
         jHONJvta8luWCo0Xx4jBMe+CftyUFNV8u1fC07du/HckbqLUCo5hN96sJ9oF8PgPyMSg
         gGq1YPMWqh495UiVTotdyDrRuLulCUOz4KW4/qEDlPhXIWLL2YK5lbN34Rc9VkYZyaYi
         RF3A==
X-Forwarded-Encrypted: i=1; AJvYcCUGMQbzi5/AjxVDx53+cYg75p2tloK8yz+nC2jZ5AXU77v8eo44pJaEls2inIq7yZEf5VjK0Wjwp5DMhzwmrYk=@vger.kernel.org, AJvYcCVzyNPfVi6iC9K7Wy8p0QQtblBGts4WZ0Wl3ze7bw96BIP1ChI0G4cv4K9D4eFMZmIaipVyo7gcBfZSAZ9r@vger.kernel.org, AJvYcCWpltUSnzHS2d6jb6UxXuajIMUFU6e2eaCGs/7+qxsk8p1xsLIatUP0YC2v5RlmQxxVjN25diVj0/d7x+uHL7twDcM=@vger.kernel.org, AJvYcCWzixGOT4Z4Rj9T1S+jpfRfrW2AX03Tyh0IOgbFcn+k0wT00JRLKW89FCxpVDPDVy6o3MKUdHc9FeD6@vger.kernel.org
X-Gm-Message-State: AOJu0YwSB50MlcW2b+mgTJUUGNfWrgJgE0WDBKIWE9sufqrWFWNfkzP2
	vjaMGImX6Ii2M66Qd/+oEz8J/H7AST/BQ0TLjx/p+rFepMLEnv/HjvXt/BEIrLbQyt0eUZBXmIz
	b7NQX/KqBQ/4VaQapx9X1dCmiH3NEGEdzJg==
X-Gm-Gg: ASbGncuT31v7Gw7fA6Uog/2OdbDBU+d+2V3rinxsvOxA7JZnwt5MufPj01M7pR5xZKr
	Jw7zlovEjdHlyiyN1TWAvFCy9miQ3wKNz/8qZ2bU9f2VBJ6eNBJxFBvFv36aINwv+RWjSZ2/KsM
	TwFYi8D9NK4IELJvt8GwZpGXKO46ZI70Ct98Vg9o1PyIa5A3mWt2uwniYAsE/2xJzfe3Ohx8E2t
	J4axsU=
X-Google-Smtp-Source: AGHT+IGEOsOZE7S7k8XmaBq4/opFyCzTHAK0PEsryUnIjdqtz1R0yNFX5+WAnDk7sG2xccjEEF36HnUvUQHqiVkbzxw=
X-Received: by 2002:a05:6000:2dc9:b0:3b7:8d70:dac5 with SMTP id
 ffacd0b85a97d-3b8d9464526mr7069585f8f.2.1754306670116; Mon, 04 Aug 2025
 04:24:30 -0700 (PDT)
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
 <cd0653d0-4a2f-4361-8eb2-c1937d988a8c@roeck-us.net> <CA+V-a8v0KZaeJwJAmEpRRdS3F3vC_CYv7zGN_n9a+M6qhFDMHg@mail.gmail.com>
 <6b9338c0-e333-47dd-a3e0-0446b346f008@roeck-us.net> <CA+V-a8tJMfjVUNfA5wue0Zwpj=dDC9XypQ69L9SeZApRH8i1aA@mail.gmail.com>
 <c5db278f-7fbf-45cf-8b6f-2f5604daf6ee@roeck-us.net>
In-Reply-To: <c5db278f-7fbf-45cf-8b6f-2f5604daf6ee@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Aug 2025 12:24:04 +0100
X-Gm-Features: Ac12FXyhiGAmAilKDCDJZAtkMjeQIKXsi2BoPtE_meMOy3Ny_pbMFbrZnKKZ3tE
Message-ID: <CA+V-a8tOFqt79D9K9vQsKYaou76b-=+73+4Y3RNc86uMXnqU5Q@mail.gmail.com>
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

On Sun, Aug 3, 2025 at 1:16=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/2/25 12:26, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> > On Fri, Aug 1, 2025 at 10:04=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 8/1/25 13:51, Lad, Prabhakar wrote:
> >>> Hi Guenter,
> >>>
> >>> On Fri, Aug 1, 2025 at 7:04=E2=80=AFPM Guenter Roeck <linux@roeck-us.=
net> wrote:
> >>>>
> >>>> On 8/1/25 08:30, Lad, Prabhakar wrote:
> >>>>> Hi Guenter,
> >>>>>
> >>>>> On Fri, Aug 1, 2025 at 2:52=E2=80=AFPM Guenter Roeck <linux@roeck-u=
s.net> wrote:
> >>>>>>
> >>>>>> On 8/1/25 04:05, Lad, Prabhakar wrote:
> >>>>>>> Hi Wolfram,
> >>>>>>>
> >>>>>>> Thank you for the review.
> >>>>>>>
> >>>>>>> On Fri, Aug 1, 2025 at 5:10=E2=80=AFAM Wolfram Sang
> >>>>>>> <wsa+renesas@sang-engineering.com> wrote:
> >>>>>>>>
> >>>>>>>> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
> >>>>>>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>>>>>>
> >>>>>>>>> Update the watchdog minimum timeout value to be derived from
> >>>>>>>>> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid =
and
> >>>>>>>>> consistent minimum timeout in seconds.
> >>>>>>>>
> >>>>>>>> I don't understand this change. Why is the _minimum_ timeout bas=
ed on
> >>>>>>>> the _maximum_ heartbeat?
> >>>>>>>>
> >>>>>>> The reason for deriving min_timeout from max_hw_heartbeat_ms is t=
o
> >>>>>>> ensure the minimum watchdog period (in seconds) is compatible wit=
h the
> >>>>>>> underlying hardware.
> >>>>>>>
> >>>>>>> max_hw_heartbeat_ms is calculated as:
> >>>>>>> max_hw_heartbeat_ms =3D (1000 * 16384 * cks_div) / clk_rate;
> >>>>>>>
> >>>>>>> This value varies by SoC:
> >>>>>>>      RZ/T2H: cks_div =3D 8192, clk =E2=89=88 62.5 MHz -> max_hw_h=
eartbeat_ms ~ 2147ms
> >>>>>>>      RZ/V2H: cks_div =3D 256, clk =E2=89=88 240 MHz -> max_hw_hea=
rtbeat_ms ~ 174ms
> >>>>>>>
> >>>>>>> Since min_timeout is in seconds, setting it to:
> >>>>>>> min_timeout =3D DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);
> >>>>>>>
> >>>>>>> ensures:
> >>>>>>> The minimum timeout period is never less than what the hardware c=
an support.
> >>>>>>> - For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
> >>>>>>> - For V2H, it=E2=80=99s just 1s (174ms -> 1s).
> >>>>>>>
> >>>>>>
> >>>>>> Sorry, I completely fail to understand the logic.
> >>>>>>
> >>>>>> If the maximum timeout is, say, 2 seconds, why would the hardware
> >>>>>> not be able to support a timeout of 1 second ?
> >>>>>>
> >>>>> The watchdog timer on RZ/V2H (and RZ/T2H) is a 14 bit down counter.=
 On
> >>>>> initialization the down counters on the SoCs are configured to the =
max
> >>>>> down counter. On RZ/V2H down counter value 4194304 (which evaluates=
 to
> >>>>> 174ms) is and on RZ/T2H is 134217728 (which evaluates to 2147ms). T=
he
> >>>>> board will be reset when we get an underflow error.
> >>>>>
> >>>>> So for example on T2H consider this example:
> >>>>> - down counter is 134217728
> >>>>> - min_timeout is set to 1 in the driver
> >>>>> - When set  WDIOC_SETTIMEOUT to 1
> >>>>> In this case the board will be reset after 2147ms, i.e. incorrect
> >>>>> behaviour as we expect the board to be reset after 1 sec. Hence the
> >>>>> min_timeout is set to 3s (2147ms -> 3s).
> >>>>>
> >>>>> Please let me know if my understanding of min_timeout is incorrect =
here.
> >>>>>
> >>>>
> >>>> The driver is missing a set_timeout function. It should set RZ/T2H
> >>>> to 62514079 if a timeout of 1 second is configured.
> >>>>
> >>> Ok, you mean to handle the 1sec case, introduce the set_timeout for R=
Z/T2H SoC.
> >>>
> >>> Although we cannot achieve the exact 1sec case as we can have only 4
> >>> timeout period options (number of cycles):
> >>>
> >>> 1] For TIMEOUT_CYCLES =3D 1024
> >>>    - (1000=C3=971024=C3=978192)/62500000 =3D 134.22 ms
> >>> 2] For TIMEOUT_CYCLES =3D 4096
> >>> - (1000=C3=974096=C3=978192)/62500000 =3D 536.87 ms
> >>> 3] For TIMEOUT_CYCLES =3D 8192
> >>> - (1000=C3=978192=C3=978192)/62500000 =3D 1,073.74 ms
> >>> 4] For TIMEOUT_CYCLES =3D 16384
> >>> - (1000=C3=9716384=C3=978192)/62500000 =3D 2,147.48 ms
> >>>
> >>> So to handle the 1sec case I'll set the timeout period to 8192 with
> >>> which we get a timeout of 1,073.74 ms.
> >>>
> >>
> >> Just four possible values to set the hardware timeout ? That is an odd
> >> hardware. In that case, you could also set the period to 1024 or 4096
> >> and set max_hw_heartbeat_ms accordingly. That would avoid the rounding
> >> error.
> >>
> > Yes sadly we have four timeout periods only. To clarify, you mean to
> > set `max_hw_heartbeat_ms` in set_timeout?
> >
>
> No, during initialization, and have no set_timeout function. max_hw_heart=
beat_ms
> is not supposed to change during runtime. If you do change it, the result=
s
> are undefined.
>
Thank you for the clarification. Ive done the changes as suggested. I
will send a v3 soon.

Cheers,
Prabhakar

