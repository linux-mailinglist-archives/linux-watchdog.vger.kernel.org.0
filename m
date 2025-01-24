Return-Path: <linux-watchdog+bounces-2761-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAD0A1B781
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 14:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01AC8167BE7
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jan 2025 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD4A5474C;
	Fri, 24 Jan 2025 13:56:41 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B2F40BE0;
	Fri, 24 Jan 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737727001; cv=none; b=OHiAOH2jIWRkj+ylKDJOACZ5Xmgeyre8LzaF2/xdXi4A8oVRbjL5n6QKPcmU64ECJP/gZghJhlFXzA2ohv3a3P38z1CPlLpzwtk8Y6qyHFKeBq84ieWSe6DO66PnwX/dplEDkBfy1hQT2AA8cibxpkM5D6T74MOHrOGqaXhneIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737727001; c=relaxed/simple;
	bh=5OPDnfpIBeg8UJATz3D7KNycGdL+fjR1vNpIJ19sq+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjyoYYQCBLjRD/l1Bi/VLTBswqmFNLBQa98n1RE/13aGHS9T31qab20W7n3YSBPlq3ZMKW9EzJ7z5uQ+x9p8yL8Rf/zrOv0+FSVqgaZVCsDh8Lp4hh2ljURpBJkizTotx7RKisac9Z4zMSfYv9hEcz06oy/9nbG+pHWp0Y6AJL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5188c6f260cso670739e0c.1;
        Fri, 24 Jan 2025 05:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737726997; x=1738331797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfm1Z97YGukf4rJIKb1ntTPP58xCvmHvOsqQWwH8+Pw=;
        b=m9NtRIZBZLJamh0G80otTx/vQ1z2LfUakL+ZDAIYZ82xUq3x6jjhBESKajlGZM3Iw9
         S1b3WlHdY7+LUL1ac/0zVhpAm88ZZ0JDMEKlLZvpwLI3LG7XO3WWFqFtWXgsxEEN5+dX
         WqDZ0bPyEGoiTsGozMzs5k5tloUlZ+6gBUJYixwHZ+3HDLR/gwTj9DIgTtheFP1gzXfZ
         dO/xtF8OSDcW+Tm7nrxX7pxXj/6KZIz2KNXzBhnkxmiy6VEAPmVA+/klBBJDLKxBF1L2
         38+0JQ5o3fPJ6IHgFVDjj9B4tDH9shuJyFYDhPhgmyoTS/l7I2Vlp190T5jBCD6OmBN9
         snRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZBYjmcw1oHhnFitK6pMqw3qeXHxwCPBAh2iPtSsuiiq/38Y6rOS8CseF/ybBgQVcCDupnoxWw8ArV+MH0OgZuEw==@vger.kernel.org, AJvYcCWvDKGWVaIbd/saoBB1Dr3CFLJAS87wr9PgdtzopdfgHCW1DReVJYedYOpXTPL1CONeX05iCgrZvvmraKYfmLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBGpkVYBMi2sFCCgRQiN9Rem5e9lkbajmZrjwVxMWNyH1jVM8k
	UKlE9xu97g1z41r+ZVriHc71r5780gV7AjedNDWEe0wU7LPeSHaYJZop8c6e
X-Gm-Gg: ASbGnctoS+or1zHuSWmFLXGwMAJc5Y0q3MEDGYFsPZQ3zl75Hcgfl32XnbHJtS/bDjP
	8NlnXbYPn2mBg9G5t75pR6di1s+Wk02p0Ca5qGQ4U3DcC72r4ifzHtndrr7MQviCn8hQ4+yQNr5
	4cn7bqflOhCFHurSylS4W7pW5KIBYCWrMmifQIJ597pmp+V0D/6RAOKYr4L929x0y1djrivB2cG
	zimnLpw7U+KGkRVXOea71Fcvq5k4azT01TdVhLO/kPwNlqMSdpVP2AcgkxYTFE9JLaScx58gfF8
	W8LTlQgswQjcmb3BioO1NltjmUe9ldmFCvoBMKaZAG0=
X-Google-Smtp-Source: AGHT+IHX7j1RRcfZ/T/iK1ScJaaCmZJvTtPvEVGNsGB5CwR/vcDPQDB2Cnc6U4mRS4tNaw54rajjNw==
X-Received: by 2002:a05:6122:2211:b0:51c:c23e:8cd4 with SMTP id 71dfb90a1353d-51d592ba2admr26461155e0c.4.1737726997362;
        Fri, 24 Jan 2025 05:56:37 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4eaab49bsm376863e0c.22.2025.01.24.05.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 05:56:36 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4affd0fb6adso632082137.1;
        Fri, 24 Jan 2025 05:56:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVln4O4vt/awuHo/WyTXre6lJJwaxPmQTK5D7VrvhPuiIwVSHdBNZfHKfQzCG+XsJLJpTh3tDTSzOGKAMds0T4K4Q==@vger.kernel.org, AJvYcCXGfJG4Mjxa7lEqJyWXyzQsxPgV5FWd3VTeQTrzf3NpRONkzrbzOqYaI6OkVdzO9JBnBk6iBqAZlABF94Aji/I=@vger.kernel.org
X-Received: by 2002:a05:6102:26d0:b0:4b2:5c2a:cc9d with SMTP id
 ada2fe7eead31-4b690cdd6f9mr25045916137.16.1737726996487; Fri, 24 Jan 2025
 05:56:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com> <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
 <TY3PR01MB11346DC4A22A2EC0CB0DAF61186E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f4cdcb9e-ae30-45ad-87f4-7395db0ab995@kernel.org> <TY3PR01MB11346D1E5B190101E7F474BEB86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <305ba07f-e5f3-4d2e-b017-8a817418f16c@kernel.org> <TY3PR01MB11346BADEA961847B84D911E986E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <8bdb2cdf-92cd-46e8-b795-7d5d412a4e07@kernel.org> <TY3PR01MB1134676CABA2ACBA48395491086E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <80bedf6c-ff2b-45e4-93e1-a05f4d3416ec@kernel.org> <TY3PR01MB113467480CA16AED12555117D86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <18000fea-223b-4e53-8f00-05cad6ceaa75@kernel.org>
In-Reply-To: <18000fea-223b-4e53-8f00-05cad6ceaa75@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 14:56:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvPHcgjkMvcbMFamf7is98dqcMbt1n+RcQHht3kXWe+A@mail.gmail.com>
X-Gm-Features: AWEUYZkTcA4TmU3apsen6fMGmMzSRcImtFnMaFuWppIBYUkGp4FNG5tfEDE0Llg
Message-ID: <CAMuHMdUvPHcgjkMvcbMFamf7is98dqcMbt1n+RcQHht3kXWe+A@mail.gmail.com>
Subject: Re: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on ARCH_R9A09G47
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jan 24, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 24/01/2025 14:24, Biju Das wrote:
> >>>>>  config K3_RTI_WATCHDOG
> >>>>>          tristate "Texas Instruments K3 RTI watchdog"
> >>>>>          depends on ARCH_K3 || COMPILE_TEST
> >>>>
> >>>> Dependency on ARCH.
> >>>>
> >>>> Do you understand the difference between ARCH and SoC (ARCH_R9A09G47
> >>>> is the SoC - individual or family)?
> >>>
> >>> ARCH_R9A09G47 --> Is a SoC (RZ/G3E)
> >>> ARCH_R9A09G57 --> Is a SoC (RZ/V2H)
> >>>
> >>> 90%of IP between these SoCs are same. So can't this belongs to same f=
amily of SoCs(eg:
> >> ARCH_RZ_G3E_V2H family)?
> >>
> >>
> >> We do not discuss what these SoCs belong to. How does it matter if you=
 create
> >> ARCH_RZ_ONE_TWO_THREE_SOCS? Your dependency is ARCH, so unified kernel=
 image will be easier to create.
> >> This is not helping in unified image and Greg was talking about this *=
multiple times*.
> >
> Renesas needs to finally start integrating the drivers and treating your
> SoCs in unified way leading to unified kernel image. You have four

How does this prevent creating a unified kernel image?
None of these ARCH_*-symbols are mutually-exclusive.
(out-of-tree[1]) renesas_defconfig supports all Renesas ARM64 SoCs.
The standard arm64 defconfig should work, too.

> watchdog drivers, which look like could be combined into two drivers (so
> each pair of drivers could be combined). For entire Qualcomm family

All of them can be combined into a unified kernel image.

> supporting more SoCs than Renesas there is only one driver.

Different watchdog hardware, different drivers...

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git=
/log/?h=3Dtopic/renesas-defconfig

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

