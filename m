Return-Path: <linux-watchdog+bounces-2702-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A00A104CA
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 11:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF96B161CC9
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 10:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721B320F965;
	Tue, 14 Jan 2025 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmQD2IGQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC6120F960;
	Tue, 14 Jan 2025 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852269; cv=none; b=a2ws4kAsA4W2wLE8rhAKhy+bR/1jKW6KQ8Z5aqD69cwk6yQbA7ydBlFClx3iao8Sz5HqJBz9VRJdFa8x9IeEv1DnpPaSpK80E8IJZCNZf3c2O/gxcWm+Y+KLCijdtVBuOyEQHC5NRKHPhy9bDjpTLXMWwPe6wwEU056OHhYwTnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852269; c=relaxed/simple;
	bh=bxAHs9LEAY2usisCAODMbK8ZEBJ9bQYnYbegOqBBi2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPaPnCSme9916KLJCj4bZWhiPWOTF7KBOPIh2pLRKZG+CgP+vX/DtjcxfMMb2omApOjvdlk2hIQcQujSbgn3dTIPJa3507KDIN3fGZhGPkUSaAjQn3FBxmm5sNVWt217B+K+PFNj1R+6E4IzmK/aRMxRIhT/Z65eKcm51KbGbSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmQD2IGQ; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-518a52c8b5aso1701452e0c.2;
        Tue, 14 Jan 2025 02:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736852267; x=1737457067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhLoTeZEg3O6/J3xmcZwI5/1WUYN2UyOx2hfQpSKVo4=;
        b=RmQD2IGQjDNM1p/cIEP0+V4WXl1ojuMIOMJNav/UsZZ0KZ/XQQGSftoEPdLVLM6vFd
         buqTuJlLNMnQyG+SKugUsQcsA8b3fapJHC95WoFPFbBESd+n9Lwxr10HrL7BJSzr4uV6
         sPnoxA/wPSN39lqAtqV5qGZK0abj7oWDwHSXTIdPFoZ8YhKxTil8iW90aPnepr5u+THd
         KQ9w5QPjMeD7OqJNbpFUJ8Vu8WEOxGGw3Rta37yD1zR1zhJlw4JXVY4OoK1S3gqp3BQC
         TpjugDYd4Cq/eQ4z3N8gbmhLHpRm8c5ceoiPWmCtW3x0/avudvR1mmYVxHyNoe2pBc9d
         B9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852267; x=1737457067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhLoTeZEg3O6/J3xmcZwI5/1WUYN2UyOx2hfQpSKVo4=;
        b=vW/TiUwM3gLdEBlkLfWwkoTLuIf4q9Xv+t5aW0+MEjXD7Rg7+ts7QFuVsyh8euxm0v
         yD10ijiIfswj8feXPOkYVbHoMT2aF4q3/REd5dcwgsN6r6N/ieZswL+aDlNkaAPWtFzJ
         slVtiGRCPjv3MsuCpzSJTZQEFUCKZCKtCiyAgFSQsJ4W66IWGEqu1Z9HgXr9Mt2h/zQ2
         hr6OpRCp4fIazRZsFkxTM6tXjyWEhsCCtAcDZGPlHwqvSYSqe93ApuN7ISYe9Mbtkq8W
         WsiZAz/B7llNmGL+VJp3HDu4aH0ywXlaLYvI8wcDzOZNjDIILenZDBXaejMoSAuSGCsa
         xEfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH7o8LKuh6cMOlSCbJCqc7kDxSbEdb2Ob+nmefDIh6jyhyyj4kb+NBiYSJl72f9I4nHYW93gGntkqx@vger.kernel.org, AJvYcCUrzpnZiDMvXU8NEzpovaYid4DWKsjjjiyi4nyza6CCoObpI7oL7dEJRb/pNA4PSniGTbiJBfbosEDSJkfVELo=@vger.kernel.org, AJvYcCV55EDHRlN55Pb4psPDRS7+WltK8ttOZnzzj+MnjWxVx8erukpSD77X7unzqtPaOiVHAk4VawCAMOJ+@vger.kernel.org, AJvYcCVisf7XNCkEG8afliB2veLDe7cQP4TSgwG0mdloft1jemXHWC5hOY6L16H+MbdJHij5OZq/J87XmjqDmV0M@vger.kernel.org, AJvYcCVsotrE++ORxlutnssayQ3K9XVsuRD1tBt28zOeO8cen4gokHDMPuR8xyEjGk7RGFodRkGEQ1tTgV+1Sj2ERFpn05c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtuDNsXpk8l7dInkGwzetqVJjcKhZWpY3CK+aBdB0mqYm4eE2
	M134+FRJSUheLRRWD7/tBk1WBNGRTTGlIxgCgwhU8Tp86kIr14pDe2K94KVBiT/Orw7VKkjCqT5
	19K7LEUsH3nuJacE+zH5PGOrzjRc=
X-Gm-Gg: ASbGncv8RxjzupnUf+iLCjbRzfUTDHn8sbTsTKB1yM+ActMIOPmqMHuiqqXrVs17rTW
	Ou0XeiPYtAmPGxsxdeBa/tczICB/jwFYPjZEC5xw=
X-Google-Smtp-Source: AGHT+IEbPc3lPMcMjZAEH3DA1YlXXwtQLJAZLsiX6fyp+5PlE4CRwwDQOvoBWYK5DOBGgWonP/TxVQMxcdiTZ5omF5A=
X-Received: by 2002:a05:6122:1d14:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-51c6c50fa64mr19314886e0c.9.1736852266690; Tue, 14 Jan 2025
 02:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250113112349.801875-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346890814785C2150BB484D86182@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346890814785C2150BB484D86182@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jan 2025 10:57:20 +0000
X-Gm-Features: AbW1kva_YoFFjsmaXXXJnaiop5H1mz9PaYeI-HrK3aI3xD2vDW5geg1w68hePDc
Message-ID: <CA+V-a8vrhb7Wt4RwQJ1wpDYfiy8-jiT0Dej7UYcRszyS9cKx4g@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
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

On Tue, Jan 14, 2025 at 9:55=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 13 January 2025 11:24
> > Subject: [PATCH v3 5/6] watchdog: rzv2h_wdt: Add support to retrieve th=
e bootstatus information
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the RZ/V2H(P) SoC we can determine if the current boot is due to `Po=
wer-on-Reset` or due to the
> > `Watchdog`. The information used to determine this is present on the CP=
G block.
> >
> > The CPG_ERROR_RSTm(m =3D 2 - 8) registers are set in response to an err=
or interrupt causing an reset.
> > CPG_ERROR_RST2[ERROR_RST0/1/2] is set if there was an underflow/overflo=
w on WDT1 causing an error
> > interrupt.
> >
> > To fetch this information from CPG block `syscon` is used and bootstatu=
s field in the watchdog device
> > is updated based on the CPG_ERROR_RST2[ERROR_RST0/1/2] bit. Upon consum=
ig
> > CPG_ERROR_RST2[ERROR_RST0/1/2] bit we clear it.
>
> As syscon-cpg is available, can we get rid of Linux assuming TF_A/U-boot =
for configuring Error Reset
> Select Registers(0x10420B04)for the watchdog to reset the system?
>
Agreed.

> After this, each watchdog device node will have, selection{offset,bit} st=
atus{ offset,bit}
> renesas,syscon-cpg-error-rst-sel =3D <&cpg 0xb04 1>;
> renesas,syscon-cpg-error-rst =3D <&cpg 0xb40 1>;
>
> Or
>
> renesas,syscon-cpg-error-rst =3D < &cpg 0xb04 1 0xb40 1>;
>
As we already have 0xb40 we can do 0xb40 - 0x3c to get `0xb04` in the
WDT driver and the same bit numbers can be re-used for
CPG_ERRORRST_SEL2,  so by this way we can avoid adding another
property in DT. And I think this works for G3E too?

Cheers,
Prabhakar

