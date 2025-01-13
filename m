Return-Path: <linux-watchdog+bounces-2689-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A47C0A0BE2C
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 18:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B534B16771D
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 17:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3935E1BD4F1;
	Mon, 13 Jan 2025 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw9I4Cz2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2C1B0F33;
	Mon, 13 Jan 2025 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787617; cv=none; b=nGzyFSS/p5MbSu3qIWUh4RfmZ1ZesThWLWhaoKdLUQqHoJvIdqTzgoZO4PgL7mKvCPDab+ldMbEJzE9LF4exujSNxS6L4+cV3EGrn5awERFbmQ9J3ii91sVju+2vzHKZKaOsevcStdQLe6aYUnvmLMu1x5XtlITSO5iFYbqgCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787617; c=relaxed/simple;
	bh=WctD/IHr1apeGYGhTas4+WIii1mcYKONA7JThB7vMoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNFZ2pRawn8MypZlZiEc3PYNCso43tp6eMoVEhj3fRoajHjsDtfoaBDMYGrcV+DUatTWr0wMv72uVmiEB8bNZbTy+WDvmlTOiWDAiOW1njN1NDPLFaCIAe2vNhhCzSHEiqRW4efKJqrn5dJaZprD9/qq9kLYvfQRic2HN9/wugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw9I4Cz2; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51619b06a1cso2464460e0c.3;
        Mon, 13 Jan 2025 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736787613; x=1737392413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPSJEkdn1ENQMRqL5qZF0zg/yY89oRBGLxWFupefuto=;
        b=jw9I4Cz21fBYrinvbsujVPAyMfXPfEGjizN4HkE22u9ErhHrkRXjw+l8X6Snp6tUh2
         BhQulWsClF+BiErcTZyT73OfhWYlBODns5dDFN+qqX/M0XA9TDORqlTe3lhGeRBr7G95
         n5eR34CI3UDD4tv+Q9EkcD3KBNtMvGxioyBRjghCiOyXZsiMtjoSd647XoAFouXbCObF
         3DeqG+kRFKMDVRjFyywXWMLf3uTpv0H6gwNgkZN7ABvRA7DU3roFwtUni1mbZ2arwV8p
         0ToLj2lyGUGuFlF3nETTlc0QhJO+21AgZkoCSimzNksc/vaL1axpVP6+MiX+UfMwItqo
         6mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787613; x=1737392413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPSJEkdn1ENQMRqL5qZF0zg/yY89oRBGLxWFupefuto=;
        b=cEDg4nUz+1dquNRNfH+szP/vKNrbuOFVhuPL92Vz0hJsnPSxrLUSC2qWOvaB+NUnJ8
         l4iVPznfLfN03HZVoWlIqSZhg4YjrwHZvOCMJ3UEfzcKK22jsQMe6tYCXF01gZetZ+hb
         wTfN0TvYvkpsKXY0sJaSF877mQJOm/HQyL/zGaYDEFPQZoqQBqM93h6dqNZKjMXR6syY
         /xV8zOusyQo7MIs9gcwa0ajhyuCsawcXZhXvIVNGI8i7SD7OYmiRXK5KfmAnvl+MnCgb
         5RWygY3KXrM3q0L/WTr+fGSA+lbY3rUc48iBREl+Rv67algGI2gkqwZvwmduozC14j8h
         HxmA==
X-Forwarded-Encrypted: i=1; AJvYcCUverY64VN3EWAeMRjZqsUwsYlNYquvECjOHDIZDQhf5/o2DFaFO9KBX9YwZHfeAKF9s91MH5bTG2Sl@vger.kernel.org, AJvYcCVqVDWUlEQGwwyD2S4J4LjslpB/AvspMQ1/LNg+/ghoC8j6W3NHxZhTWQtg+Zql/ZlP0x0KpnfoRInrrXf0YIE=@vger.kernel.org, AJvYcCW7Zbk6CujgL/pJTN8JOAefGXCxWtOSArhcqO8W8r1iG768rGaWApauofQayz6GLikea9rmnFhVe3xO4K+87Zeih/s=@vger.kernel.org, AJvYcCWNaIxsu5Z5Gw+BI/1fUfztwQSs/QLFEQ5oJZCpPDJYz3aI0/NPpUkmBrg9JZH7j7no7GHpOBTcaRB4N3jK@vger.kernel.org, AJvYcCWVCVW4cobovN7EAPcIhLy9znDCewL+2UC9gm4CmzWkAhTp//r6dx4LlZXWJB/X0tsX34xs1tWNEIjt@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDfLJjKn9cRGS3oGZqwYf6ApWespKWakXGa8AWwOoN1j3sJdp
	sz+qmz5a+RXk302LA8JYu7z0hTFKvfdJ4Ye+YIdMMOjSvh7vK1qneAhUbYXT+1/SvUDSh7mkaq9
	ISaPxS4og/AwcWniPUogXprvjU38=
X-Gm-Gg: ASbGnctjaxZjMu6uaLLVJuhpMUMk0SLFtKsG2WaGbMs6fgya4HqWhFMJT9sB9FTMYmx
	7Mf3aJftpNKKXKd7J/SyJQ7VwHOPscsU3NvyjW7c=
X-Google-Smtp-Source: AGHT+IEEjfS4uN/yNv2fb+A+JWQZEniOkHkXWzTyKFLZnTv6l7X3+8wej8vTGKOhP+7sxcvTiALFyvvpeJjJbI+DvrQ=
X-Received: by 2002:a05:6122:3d03:b0:510:3a9:bb87 with SMTP id
 71dfb90a1353d-51c6c1ff174mr16696123e0c.1.1736787612435; Mon, 13 Jan 2025
 09:00:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tQ_tyxPn2pO=mSPVW2RffVhFz=CPCxR2pxXP1FLkcQcA@mail.gmail.com>
 <5cb9f4c9-c1b2-477c-9c6a-797a4e60d30e@roeck-us.net> <CA+V-a8sCTNdoxNksd_N-j7i_VJq-qL9_cv22HT7DXE-M39XLmA@mail.gmail.com>
 <TY3PR01MB113464848E24FE536C7088D95861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113464848E24FE536C7088D95861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 13 Jan 2025 16:59:46 +0000
X-Gm-Features: AbW1kvZ_KmbNBYT5ThI0EOuLo29C9WlrVBYK3hok1iKacYs85t-qbKRlRF8I_6s
Message-ID: <CA+V-a8sd7OwnEduc7=apB-EeKdBMGoLLxSu6fY2zW0x5QsPMcw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Jan 13, 2025 at 4:43=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 13 January 2025 16:29
> > Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from=
 watchdog for RZ/V2H(P) SoC
> >
> > Hi Guenter,
> >
> > On Mon, Jan 13, 2025 at 4:0=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> > >
> > > On 1/13/25 04:40, Lad, Prabhakar wrote:
> > > > Hi Biju,
> > > >
> > > > On Mon, Jan 13, 2025 at 11:38=E2=80=AFAM Biju Das <biju.das.jz@bp.r=
enesas.com> wrote:
> > > >>
> > > >> Hi Prabhakar,
> > > >>
> > > >>> -----Original Message-----
> > > >>> From: Prabhakar <prabhakar.csengg@gmail.com>
> > > >>> Sent: 13 January 2025 11:24
> > > >>> Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus
> > > >>> from watchdog for RZ/V2H(P) SoC
> > > >>>
> > > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>>
> > > >>> Hi All,
> > > >>>
> > > >>> This patch series adds SYSCON support to retrieve boot status inf=
ormation for RZ/V2H(P) SoC.
> > > >>> Summary of Changes,
> > > >>>
> > > >>>      Clock:
> > > >>>          Add syscon compatible support to the CPG block in bindin=
gs and
> > > >>>          device trees.
> > > >>>
> > > >>>      Watchdog:
> > > >>>          Document the renesas,r9a09g057-syscon-wdt-errorrst prope=
rty.
> > > >>>          Update the watchdog driver to fetch and report boot stat=
us via
> > > >>>          Error Reset Registers (CPG_ERROR_RSTm).
> > > >>>
> > > >>>      Device Tree:
> > > >>>          Add the syscon property to CPG and WDT nodes in R9A09G05=
7 and
> > > >>>          R9A09G047 SoC DTSI.
> > > >>>
> > > >>> These changes enable the watchdog driver to identify boot sources
> > > >>> like Power-on Reset and Watchdog Reset, improving system diagnost=
ics.
> > > >>
> > > >> This means that, we should assume U-boot/bootloader should not cle=
ar the WDT reset status bit.
> > > >>
> > > >> If they clear it, there should be a way to propagate it from
> > > >> u-boot/bootloader to linux, otherwise, we get wrong bootstatus in =
linux.
> > > >> But the clearing of watchdog status by one of the cases:
> > > >>
> > > >> 1) u-boot identify the boot source and clear the status bit
> > > >>
> > > > I agree, if the tf-a/u-boot clears the register, the bootstatus
> > > > reported by Linux will be in-correct.
> > > >
> > >
> > > I would rephrase that: Today, the boot status is _always_ incorrect i=
f
> > > a reboot was triggered by a watchdog reset. After this patch, it will
> > > be correct unless the boot loader resets the status bit.
> > >
> > Agreed.
> >
> > > > Alternative solution, would be:
> > > >
> > > > Let the TF-A create WDT nodes for us and add a property
> > > > `renesas,r9a09g057-wdt-bootstatus` and propagate the WDT nodes to
> > > > Linux.
> > > >
> > > > renesas,r9a09g057-wdt-bootstatus =3D <0/1>;
> > > >
> > >
> > > That would require both a property change as well as a change in the =
bootloader.
> > > I suspect it would also be inappropriate as standard property and
> > > would have to be passed as 'chosen' property (if that is even
> > > permitted) or as command line argument.
> > >
> > > Either case, if the boot loader has to be changed anyway, why not jus=
t
> > > tell it to leave the boot status alone ?
> > >
> > It can be done, I think Biju is concerned about the user clearing it, m=
aybe using the `mw` command or
> > the Linux CPG driver clearing it during the probe.
>
> If either TF-A or U-boot clears the status we have problem. We need to pr=
ovide input to
> stake holders of u-boot/tf-a to not to clear the wdt boot status, so that=
 linux can report correct
> status.
>
I think this can be done, currently the TF-A nor u-boot clears the
status. Are you OK with this approach?

Cheers,
Prabhakar

