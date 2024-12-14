Return-Path: <linux-watchdog+bounces-2575-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31D9F20FA
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 22:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6614216686E
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 21:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462231AF0C6;
	Sat, 14 Dec 2024 21:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnXAm/cc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FB51990A2;
	Sat, 14 Dec 2024 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734212200; cv=none; b=O6BBPBSSygMDmOTsQwihihlV1M4lkBqjKar2OYuO3WjlOidDDzOguSZ7Dt1ufRi2kfMeMniGF8mjHCFf0/skugDZCwXlCpz05mJoKJPWfcrk9PaATwjE5gIdEqCQ+eCYn+4ch8Hxs8aNFooGTQpAY9wRtAmrgnnA99oV7aYwNTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734212200; c=relaxed/simple;
	bh=JSmXnQzAC3lbJhuxkEAtytCsvBO1s7INTmO8xFi6WTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jb6nV2SqiV4JcmnDH8dD0h+WtYD5u76IUiqeUQHv2Y8wORIQXSIz/ptlgkCyu5agqFAxCsrcYWLlKeyQGxJGhBVMEbRzXYQ+sLb9TvUkuBqCqnvXCyh5u2oulYwGXY8BVwqYWU2iTe8vci2pBkFCLpfjJi7i904cBIng4Y8012k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnXAm/cc; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-518802a1e7eso1651136e0c.3;
        Sat, 14 Dec 2024 13:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734212197; x=1734816997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSmXnQzAC3lbJhuxkEAtytCsvBO1s7INTmO8xFi6WTs=;
        b=HnXAm/ccfF44rdEk3FFAdckpHzysEIUrS0tvxqJ13+WbNSw78vdXhw/nFuVWf61Rxd
         54xKh0+Y611AEZVuqbmg5+gT18syj7QiEFx21niUmT/+30HkoCxPxe/SR3qdIucvyamn
         6CAu5Q+VkpNuoPjHZsfpF+5Jjg9AXQjQ07Z6J08S0tWBkqS/slrZOtMiStDQJc02pFEL
         sYk58FzCmX8T67Wq2Whse9D0JBNcEmCWoa4v2+m/jXI5EHEO7nZOCyjsUCN0T3FLRnZb
         eVCUt4/gHBt3xyaDAsWZHsKJubG1GlnD3qAM5q31gM8eUZHkxIsZN20iktAsOX/3bhQK
         ZOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734212197; x=1734816997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSmXnQzAC3lbJhuxkEAtytCsvBO1s7INTmO8xFi6WTs=;
        b=Lpt+m1zIyoDgP31VAf60tZiTLPEtQq1Uh2NZZmUYI1c3TX3fIv3Q5Gu6F1fQKMWJuJ
         PIvul8lTDwnBqfhvgVYmvkoYK4Vr6cLwgv+dEEWjbY9WLrU5AkEm2ApwtAQzyvqNSVAx
         OnuUJbgaECwpRZ88SvxsPfz38LaCB5faYfCdejT1pZIPYgwvRBz+9Gr4dfI7qLjFlBpq
         4yE6M/upOO/DZzGlBXpwP5hX4JqVR4a8AuIBSCJlE2LwSt5nBMS3BvE/ZH+Fn0oEaaGq
         Acz6RUJQAWLXEVDTE17iT+2WMyQrxYrwSto53FwYaUitzgsstda9a47I7G3PnpxCrAgn
         4t/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQVsKOqBLmPiekB/vTl/sQvIikNkvIaaNwGo5NXq0w4iAqNAx1kFXQjZyJAAOnP0vqQHOCkWQH48Yw@vger.kernel.org, AJvYcCVrx/7CyU/lf9Dt+XygbsKoY6deCxqVjgKnD4CyH9RJsxStI1SDJTRUVvVoBLaACZIWEcJ9INp7U3AK//c7@vger.kernel.org, AJvYcCWGwt0NmPbh7P6QQKi3SfpdB5R4GDsgbOTbMRA3yXPxs6YL0RZVIJ5UyjKv6T+UJpDeC5OlxYIOLKEEDn2UfsnV50g=@vger.kernel.org, AJvYcCXQKP7d0D5/7S05ljMre8SuRI9KYJmXwRsiNgq8BGh7X5dOMmQzG0kIbjGU0kKeX9h9LedtJuGWhHlCOs1aZm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHPh2b0XSxX4m/DJ529Zx2JHVj6zADTz8aCeGxFuG/shp/cFfb
	Dvt5avTDg1kAOOEuK+HrOSdlKR00b5yF9cbKwTt7YG/QljLEEql7HfsV6l0DVEvscIGKC5GJ78i
	KhqMRUxQuFthn/IvHrtcspK1lrYo=
X-Gm-Gg: ASbGncsDZB7kcb6mQnz2vfMkjT+EJm/Hm7ADnyc0Ps0PWFRirnf44oQTJSJSoDG8sZ2
	2gD6Qio/ZOL5C5GZdnfU4EOn6amHnU5SuxntExIZ+G7Ye2hIWJCEHh0k/vI0oYIltEqil0e0=
X-Google-Smtp-Source: AGHT+IHdDBc/DTuaPG5v2NK8NoaPY3B90zut1+0sQGHapEIdTbD0nlg2qhZ4HFMLfv++ls0XPJ6DuU57a5ogmlSPavw=
X-Received: by 2002:a05:6122:2a0e:b0:515:daa7:ed0b with SMTP id
 71dfb90a1353d-518ca21d0cbmr7570939e0c.0.1734212197304; Sat, 14 Dec 2024
 13:36:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net> <CA+V-a8uasq+E+_7rk+o729hRp6PwYSgTcUQYbTe44CkXfSE71A@mail.gmail.com>
 <TY3PR01MB11346774419BA8D51043C762986392@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346774419BA8D51043C762986392@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 14 Dec 2024 21:36:11 +0000
Message-ID: <CA+V-a8srdDkdAss2okuyfGYBwU5b9cF0aNw+KOSGR1wPquqNdQ@mail.gmail.com>
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

On Sat, Dec 14, 2024 at 11:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Lad, Prabhakar,
>
<snip>
> > > That is a change in behavior. Up to now the syscon phandle did not
> > > have to exist for the driver to work. Is it guaranteed to not result
> > > in regressions on systems where it doesn't ? Also, is this documented=
 ? I don't seem to be able to
> > find it.
> > >
> > Agreed. I will add a fallback mechanism to handle cases where the sysco=
n property is not present in
> > the WDT node. This will ensure no regressions occur, and the bootstatus=
 will simply be set to 0 in
> > such scenarios. As mentioned in the patch comments, I have not yet subm=
itted the DT binding changes
> > because I wanted feedback on the syscon approach. The new RZ SoCs have =
registers scattered across
> > various locations, and I was exploring if there might be a better way t=
o handle this.
>
> See, syscon compatible not needed with [1]
>
> [1]
> https://lore.kernel.org/all/20241211-syscon-fixes-v1-3-b5ac8c219e96@kerne=
l.org/
>
As per my understanding, `syscon` compatible is required in this case
because the CPG driver does not register a regmap. With the patch [1]
(linked above), this applies to drivers that register a syscon regmap,
where the corresponding DT node does not necessarily need a `syscon`
compatible.

Cheers,
Prabhakar

