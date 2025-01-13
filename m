Return-Path: <linux-watchdog+bounces-2687-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933CA0BD83
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 17:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCA0F3ABD0B
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 16:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBB820AF87;
	Mon, 13 Jan 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3TfojcA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2C24025B;
	Mon, 13 Jan 2025 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785782; cv=none; b=tr0LwnHSQgF3qYuPnCrqfXpYs9OVYZSnDFd1GDVYVRphxDffwU6joBQwhSWeSjPM9SPFRiaBXWoGnWqlmhYdjkRSNNHli4N8aoyU3gHCOEo1bLbDNRgH6S0u/BnOw0kFCW1eu6EysohzB6n0sGWVMWU+K+C8LJWkMQBhOJiCURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785782; c=relaxed/simple;
	bh=7eivNL6BZRIkCjdKX8i8VPxt0qG/EB4VGsBPrXMnYew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdhT4jKRcTY0f1eJfVzA2dEkx+3DrQv5s1/IeCJlWxE2buiUK3dp20TVBhyCIhTHV9v5AJizQQU5Iti0tUTPXIhS0tH8RZ0FKcTAARFY2Os4XKjSGCKprWIuIz0vObpVOcXAIRO6XVebp8xhrLlJiuDtJL6V/RTROe0ArJqhFdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3TfojcA; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-518808ef4a1so1645713e0c.3;
        Mon, 13 Jan 2025 08:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736785779; x=1737390579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDKJVcQ4sbkhg/TqFW8ilV2zyusZKnnaI0qzz2qGbCg=;
        b=j3TfojcA16sCq96QmOdVKgBDiG94oe/EKasJNlsAytDUJpUkD9mbCqID9qZME4BOKo
         pPywOqsBgNCXRNwJOwA5Atb9nSjkqnuIk6RkMz9yMKUnZ11PC4Ye7mOaI+Nyk2cLLQIH
         zEAznwvj2YemK2lPnTDtlRjFVnZzRZzt/p+Rdyx9BsBVkypO4xVynE/Jj1q/omzK8eTG
         oMv5i7ItWqj8OhJQBu2NIQO7yilyWAgKVHSO1CRZ9dF1S5dpyrTkoj53PP6VoF3ZehL1
         4G8y0khFwt9mz3xCSE3tP7DbNi9Hdm/AAk3exWzwQGbQtB6p6EJ3oMTG8uqvXi8mdlO8
         v4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785779; x=1737390579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDKJVcQ4sbkhg/TqFW8ilV2zyusZKnnaI0qzz2qGbCg=;
        b=fTEFTwD67UomKTrdQc2eDlU1Ij2OyToBmGvRCxvMyLTgKBfmkQjVZ3RRy8U1cFPF1q
         SkKAREWiJTnp+xfOP9UDHc69MnwtytNMxONPX1j3Fb3OE7OiAffQV2TgNQ4MEDE96z5u
         mmM525jLeSY3nosx9stBCBW7QaAa3N7Bmdt/JsCjd7hiuyjpD6h48WztiALbsR/gNk9G
         rcGLBhK+OElsR57eQd8OjsKyC+K9Lr31RXIMtHOqbNz6UaXzj9mXMU1VHx/vFiNS27NH
         GCsKSp2tojgyUk9eepL36IkMg9WfPi3OBOIOE580pTQB0/AQQTkzEKuqibTMMHFBQLhp
         Bs/w==
X-Forwarded-Encrypted: i=1; AJvYcCV+6OMT+RaHp9NCYolord6df9NiEvVqpbPjDE4zyPM1UwIAA+vrnCDLCz+g6Zl2GHNB4m1Er39A67Cy@vger.kernel.org, AJvYcCVcgfY92Zil+mMtH+iGjglgX+xjEtQ4eqHyaQAeb+hYtYsKjz0Z2iH7DlYrWT6WeiwnGTzcZ7DPRQBETYD+hQ0=@vger.kernel.org, AJvYcCWWWjZRiyDbW8zDkJp3oHkQtmIzQgfNjfhBbtActKwgMgUYc4wbNGITYsVeJTWKNG77vpM+2MwpMfSl1Tos@vger.kernel.org, AJvYcCWsJZPNQgjpFd8gfOaTYUEeMcAY41IrXkSvN4xh3SVJ9qsus10BBwiJ+f0NMkcDYDqqLB5ALBqov2By@vger.kernel.org, AJvYcCX1rZG9N53GVJZVyzSY9lGDmD6QJfzDJL0zTRya0yacGq8ziqYfGBErODVMYwmayHkyr4ZYKdkn0DuJKeM7QjtIa3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjGgPWfAHcakZYQ1g5p2R0iaNr2AKaAKt8uxrjqbIDb3IL0vqe
	E16nmcU+vLca2lqKga7CdsSOtyUd9LeRjK6GgRavPDZXWlDAEjix2aZ57TT0PiV5U2M/THyBale
	tytGY7y4U4EgcaQTNR95JMApgnso=
X-Gm-Gg: ASbGncv0pelhMn1ASQWb1AzOci9jdQndS7PMw54YVGLbOV+2gSn7Wj1tKMRNx80sAPL
	piNI75JHNQEjHAtZPrSeJLIH2qTAosOWg2oxGxjI=
X-Google-Smtp-Source: AGHT+IGXmGoannHHhfRczDPCYMtMQwKcdxgZZYAI1+6ppe6tAqTLCMKjC8kG5hDVprXJE9pTV4NhpVmumxC6bfss/ic=
X-Received: by 2002:a05:6122:a29:b0:515:ed1b:e6dd with SMTP id
 71dfb90a1353d-51c6c2b5573mr16662942e0c.0.1736785779298; Mon, 13 Jan 2025
 08:29:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tQ_tyxPn2pO=mSPVW2RffVhFz=CPCxR2pxXP1FLkcQcA@mail.gmail.com> <5cb9f4c9-c1b2-477c-9c6a-797a4e60d30e@roeck-us.net>
In-Reply-To: <5cb9f4c9-c1b2-477c-9c6a-797a4e60d30e@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 13 Jan 2025 16:29:13 +0000
X-Gm-Features: AbW1kvYdW-ZJrodReOmu4eSKzIfGpVOi1y5dszsz6VUX4L0s6iiRGLwD8c90zwY
Message-ID: <CA+V-a8sCTNdoxNksd_N-j7i_VJq-qL9_cv22HT7DXE-M39XLmA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
To: Guenter Roeck <linux@roeck-us.net>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, Jan 13, 2025 at 4:08=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/13/25 04:40, Lad, Prabhakar wrote:
> > Hi Biju,
> >
> > On Mon, Jan 13, 2025 at 11:38=E2=80=AFAM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> >>
> >> Hi Prabhakar,
> >>
> >>> -----Original Message-----
> >>> From: Prabhakar <prabhakar.csengg@gmail.com>
> >>> Sent: 13 January 2025 11:24
> >>> Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from w=
atchdog for RZ/V2H(P) SoC
> >>>
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Hi All,
> >>>
> >>> This patch series adds SYSCON support to retrieve boot status informa=
tion for RZ/V2H(P) SoC.
> >>> Summary of Changes,
> >>>
> >>>      Clock:
> >>>          Add syscon compatible support to the CPG block in bindings a=
nd
> >>>          device trees.
> >>>
> >>>      Watchdog:
> >>>          Document the renesas,r9a09g057-syscon-wdt-errorrst property.
> >>>          Update the watchdog driver to fetch and report boot status v=
ia
> >>>          Error Reset Registers (CPG_ERROR_RSTm).
> >>>
> >>>      Device Tree:
> >>>          Add the syscon property to CPG and WDT nodes in R9A09G057 an=
d
> >>>          R9A09G047 SoC DTSI.
> >>>
> >>> These changes enable the watchdog driver to identify boot sources lik=
e Power-on Reset and Watchdog
> >>> Reset, improving system diagnostics.
> >>
> >> This means that, we should assume U-boot/bootloader should not clear t=
he WDT reset status bit.
> >>
> >> If they clear it, there should be a way to propagate it from u-boot/bo=
otloader to linux,
> >> otherwise, we get wrong bootstatus in linux.
> >> But the clearing of watchdog status by one of the cases:
> >>
> >> 1) u-boot identify the boot source and clear the status bit
> >>
> > I agree, if the tf-a/u-boot clears the register, the bootstatus
> > reported by Linux will be in-correct.
> >
>
> I would rephrase that: Today, the boot status is _always_ incorrect if a =
reboot
> was triggered by a watchdog reset. After this patch, it will be correct u=
nless
> the boot loader resets the status bit.
>
Agreed.

> > Alternative solution, would be:
> >
> > Let the TF-A create WDT nodes for us and add a property
> > `renesas,r9a09g057-wdt-bootstatus` and propagate the WDT nodes to
> > Linux.
> >
> > renesas,r9a09g057-wdt-bootstatus =3D <0/1>;
> >
>
> That would require both a property change as well as a change in the boot=
loader.
> I suspect it would also be inappropriate as standard property and would h=
ave
> to be passed as 'chosen' property (if that is even permitted) or as comma=
nd line
> argument.
>
> Either case, if the boot loader has to be changed anyway, why not just te=
ll it
> to leave the boot status alone ?
>
It can be done, I think Biju is concerned about the user clearing it,
maybe using the `mw` command or the Linux CPG driver clearing it
during the probe.

Cheers,
Prabhakar

