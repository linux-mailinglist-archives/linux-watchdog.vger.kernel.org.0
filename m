Return-Path: <linux-watchdog+bounces-2583-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B09F3153
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2024 14:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37B737A28E9
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2024 13:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE2F204C2B;
	Mon, 16 Dec 2024 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHLtzsjc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895971119A;
	Mon, 16 Dec 2024 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734354890; cv=none; b=ZKmFHUGruF6rZiGtjsLBJDu5x+lmnX3rHZkc08iL9J5h4bP9UBagftc4QOEohkA3qcMikchArucNt2jmT/Ze3fzNEsf2RAfEeJ4LfyzwqZ/No3X+iEVG7O1XtxcsLWAE1s5xgRTJfGkpp+cyJ/9+FvsNqOhrGVz/LQ2D/3nFyFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734354890; c=relaxed/simple;
	bh=6rnP6sxljKeOL3PkJ6leFI7sX5hX/jcT6RIt0e4lQPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIKluxSmEloIRjGsYYbxpY4niFW5HFgXPqj6CnKJSrzPc0bicJWm7FcRN9KRfPtKNt1hnQedk2UXwajRMVn/08vqeRa15WBLTmzr5a7IKW6uW1BbcUC9+qn6q+8zZGTPA4h2ffwguRRJXdfm4LgtO/q9DV4qsXh/sc2Iuau1yvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHLtzsjc; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afe1009960so1004090137.0;
        Mon, 16 Dec 2024 05:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734354887; x=1734959687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rnP6sxljKeOL3PkJ6leFI7sX5hX/jcT6RIt0e4lQPo=;
        b=PHLtzsjcfA+xVzV6DLH/bVuLtRXXsusX/c0UKBMOUHPmzXicZf/+yMA61jT1oJdrTf
         A6omabzoZjgCESXq0J+CCEIPydRLAD9pSf3sm6r1aoDU3pUrntjqyc1MwSykzU1JRvkl
         W1ncMAG1pTHH8Pg5zFkAlneeHmgSplw4XCkPyDg3nLDJ6Zr+nbFImtOkZQx6NPbH6LeX
         Jjy0pkgPSNtYwX3gRFWZ1mWKloRgawrbUR1kd/tftqmKdMvq7fCu4kLFyvuZOsSwzCym
         kFeY+mEFtMEMjx6CePbRtRYMpEoQ58CS691WroUivfkHV8H1IPsVBj5UkbyaNO1eBFYO
         z+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354887; x=1734959687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rnP6sxljKeOL3PkJ6leFI7sX5hX/jcT6RIt0e4lQPo=;
        b=sjIR9oFA8cMHEVf8Aq17/rYl5LTkhbTkWUFbdygYs4mGr+2cdatT8ff+cSDivbrN/r
         n7/1lLNO/t4+zKRZ35ul5rtQmdNlmNhSDl8G5SSwNdOkkA87J4wwfy9aqB3jb76MJxC3
         MD+lRO3IZcIl9P/QdKD7xG3WihAUuMHz7hSMXoNlQvzhpt6fGkjwTXHBiEkQtoTeSUDM
         JR56Cu4FntGj/ZBrN5hjHLYhgI+yKUbQxRgrJrKxEoFYyfIEDGoSgK83HHvAYgipUbJk
         XccjktOc24sa9RVi/4+opLFy8fX9bps+ZxQh7e+jSnhbu+k3jZxdyl/wc2xdAu3GbLsV
         V+Og==
X-Forwarded-Encrypted: i=1; AJvYcCWtla9xVmgvL0sOYHFhfJ/CQDp/xzdF5DUJMSvx9aSDBxx6/wpLttM6t4QlRzoWtQl21bqxBpFSBWx0@vger.kernel.org, AJvYcCX478gqC2IGA9Vpc/6/rQv6pctn3cKqQG3MZEBZlOHOr2y93/LdSg4H4D1yY5tkVFnMjiqpGUIKCnqvl873JjA=@vger.kernel.org, AJvYcCX5yVPRuER1BhFyBUv9wej87eVH5srWmopRngx3ECGKzoh34JuucBnM/oZHcc8u18FGj8LM5sFjib7wR2TJ8nWHne0=@vger.kernel.org, AJvYcCXlW06au+mLHS1I01PihHY0kP/TZVsTSwFRf6QRGDyxk3iX7j/Z9hJQKU4Xv2DYd3NowN8hO6oFzufqrtiI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lEyqNW6UVqfndXCOSKuLur12jdF4VhHqFHIASHXuQ0Kh/VIx
	oPgbSmUAeoP50uyri+TrjGPeEyg7qySEdNc3LVE/vygKIUEQh2p4lwh3QjgwCLwMRPEpTOR6YAf
	2mOYOaA/9hzd+voa/pok2JgnfANI=
X-Gm-Gg: ASbGnctXq64Ir3K14lvLAFkGZhMtnGuUBzHKMBRB4zvpHGbjJumVzW45EyJ5A5diYcE
	2QKH3U0TSXfGfHrnADCXWkyfpAgQQe5w+n5a92g==
X-Google-Smtp-Source: AGHT+IGHvoEWiHQEktpq8LAmICokSHUhsk33kpCMQhArgLW3vcvRbs3+IKesK9ztiuLOP0diDrNVoqwRp/EZdDgRI1k=
X-Received: by 2002:a05:6122:178f:b0:50a:b604:2bb2 with SMTP id
 71dfb90a1353d-518ca2e301fmr10014053e0c.11.1734354887242; Mon, 16 Dec 2024
 05:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net> <CA+V-a8uasq+E+_7rk+o729hRp6PwYSgTcUQYbTe44CkXfSE71A@mail.gmail.com>
 <TY3PR01MB11346774419BA8D51043C762986392@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8srdDkdAss2okuyfGYBwU5b9cF0aNw+KOSGR1wPquqNdQ@mail.gmail.com> <TY3PR01MB1134664B737514AEAECA960D9863A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134664B737514AEAECA960D9863A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Dec 2024 13:14:21 +0000
Message-ID: <CA+V-a8tWFSwajUSObZstvuBfL__j4EFdtOzSYs4U-aMBacwnLg@mail.gmail.com>
Subject: Re: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh@kernel.org>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Sun, Dec 15, 2024 at 9:15=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 14 December 2024 21:36
> > Subject: Re: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve t=
he bootstatus information
> >
> > Hi Biju,
> >
> > On Sat, Dec 14, 2024 at 11:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> > >
> > > Hi Lad, Prabhakar,
> > >
> > <snip>
> > > > > That is a change in behavior. Up to now the syscon phandle did no=
t
> > > > > have to exist for the driver to work. Is it guaranteed to not
> > > > > result in regressions on systems where it doesn't ? Also, is this
> > > > > documented ? I don't seem to be able to
> > > > find it.
> > > > >
> > > > Agreed. I will add a fallback mechanism to handle cases where the
> > > > syscon property is not present in the WDT node. This will ensure no
> > > > regressions occur, and the bootstatus will simply be set to 0 in
> > > > such scenarios. As mentioned in the patch comments, I have not yet
> > > > submitted the DT binding changes because I wanted feedback on the s=
yscon approach. The new RZ SoCs
> > have registers scattered across various locations, and I was exploring =
if there might be a better way
> > to handle this.
> > >
> > > See, syscon compatible not needed with [1]
> > >
> > > [1]
> > > https://lore.kernel.org/all/20241211-syscon-fixes-v1-3-b5ac8c219e96@k=
e
> > > rnel.org/
> > >
> > As per my understanding, `syscon` compatible is required in this case b=
ecause the CPG driver does not
> > register a regmap. With the patch [1] (linked above), this applies to d=
rivers that register a syscon
> > regmap, where the corresponding DT node does not necessarily need a `sy=
scon` compatible.
>
> I guess you can use "syscon_node_to_regmap" for that as of_syscon_registe=
r_regmap() is for externally
> created regmaps??
>
No, it doesn't work either; the CPG node block needs to have `syscon`
compatible when you are using
syscon_node_to_regmap/syscon_regmap_lookup_by_phandle. See patch [0]
in `device_node_get_regmap()` the `of_syscon_register()` is only
called when it has a `syscon` compatible or else `-EINVAL` is
returned.

[0] https://lore.kernel.org/all/20241211-syscon-fixes-v1-3-b5ac8c219e96@ker=
nel.org/

Cheers,
Prabhakar

