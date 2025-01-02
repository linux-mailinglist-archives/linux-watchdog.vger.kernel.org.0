Return-Path: <linux-watchdog+bounces-2653-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F023EA0010B
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 23:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92FE162DD9
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 22:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E378A1B87E7;
	Thu,  2 Jan 2025 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yij+67Hj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F9F1AD3F6;
	Thu,  2 Jan 2025 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735855633; cv=none; b=gQQ8mA7z41tO+aZ0BsD6EJu2ibA8aLfabAyGfckqt4VjraBWg2RGqCCQWoq5Fq9WK6PIvrKvp7lHxUcJpoPPLxhpkfslF85vS5GbLeTbNBK07y4arEx9SxgjhtEjzdJVlBI0x3fYFtiuAT4sXdUdN+VzTAxafZB7YJQ8OiiI6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735855633; c=relaxed/simple;
	bh=vR7iO8j+sakcg1XwY6nnyEy8WDfgUEprxmWOktDwld4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeKdS54aK7YwvK7qPRuNQluu4Sfwg3pGq2v/kuCD7Z+Ymvk47OzfGuDud/lMwDpY8l/PiA069Z/4u/vfEO/XAOBHu7A/Ws+RqfR4wFxcmi4089wKK/7leL6rEIiI2N59jQkbTbVL8w74I474Q06IUVChN4Lofe1cKZBOdWtFDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yij+67Hj; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso2009271241.0;
        Thu, 02 Jan 2025 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735855630; x=1736460430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQKr+57/EXDEkED/9ax46FJJGLL0jFomBZ6YGyVct+U=;
        b=Yij+67HjDr0oVmgNpQWQZhs2aXRjic+WXVeEw/NWSfv10i9T1pF+T+gRJEnxdgcUsA
         0fqs6Rd50do2vq8MncwRSExX9r4m5o2IEdOzo9nCZ0vuO8ioVXLoR7+l6KfMYHNpxbbj
         wlBambva+rVb9vQWriNz25eSzUSyvx1uNomPfyZtdx+cq8/1xRhPJ3JqbufAVYbvUMuB
         5O+mD4u4HdHsq7p7Za/qvQ2+vvhSAXdejMYRKZ8WZ3oLQzTuFCjpGNE4HCH4BDbuMU6V
         ybrMTe3L/ui519KwfYpl7QmE5dgYeXXqTlCDs9HmuMtjPripXI1dEsEnPQdtonk3MdOS
         t2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735855630; x=1736460430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQKr+57/EXDEkED/9ax46FJJGLL0jFomBZ6YGyVct+U=;
        b=PCmbZ5EFxQqdoxaeLT8dpfeFOlGtkCIH6+XxnVOI+ZXD2rJfmBdRO/ZsLUNdqunMt0
         Zz+0xGAogEVTg/lmgrrn0aOaipFOAQ0u87hHqWxLB5ZdPB0Uj3ISdl8kvHz77qLMLe8Y
         Mcy8LIXxS1ep06jhpuu2YawB7Y5Mm4Eqh7GUTIhtzro+azWjkBKvG+QyspKGWEm/IjdE
         jV/DTFF9H/yZgE1BTryvtcAICw/68Y3UIBJB+fP2jfn+0835Nu9ld09D/QeZFYA7G12X
         ZzoTSULSyQVszoRqdw8Bko08SPLUtWQHyyx7Rg3NgLGvKyk/zz5he9YrEiGxCbwUTYn5
         MoJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUds5qNAYWgkBanhvHuWNbIQWbsWzdAinb3oY2I8olCCnJChjq16wO8LQ+1Ge2mdMWpRLjd72kj5By0IvDRR4M=@vger.kernel.org, AJvYcCV3s1c3s79i59vv9pl7+2UbVHmkfQz/1pODlhgohacdyPZ5yt0kIQhKvccly0Eg2GPFztRjlZjBCfLd@vger.kernel.org, AJvYcCWDJ9I3SGzJ/suM2/IlEjeP2zqOQ7D3YMZ91oUU++HcNJds7+WJwZQCXA5vYlX8+t/DDuCRv8bYWvcB@vger.kernel.org, AJvYcCWbH4Yq/jxjt/bfDGBf48drKCqkkFUbBEv0R1odmcMfL65zzEzEuPF6E57QXzyhshqpzcEDGWT0VV51xSQz@vger.kernel.org, AJvYcCWkXk8hQ4KNghtVKJkGyO0GnOH0paHi0cngR7GY0k7/clZU+SV3qc0nSHuOuczZMEU8geg+95HsnIVcsZzctpnt2aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymAbi6xNNSkMJ1aWX7ZmKiqEqSuKwGoxiUXUDMyz3qxy3yPX2V
	7sy/dRsBEvQrek3MW30EjkMSWJ+ZRJpZMjLIcEiVcsMcYtWFMCqltjTt2hoRF0brLGSjSBFXF+f
	+AKSVDP0zgIbpktScVQoc32zndIk=
X-Gm-Gg: ASbGnctej2TQBG+EmYTecsEU4Kqvy2MXg5NpB5l1/mCn2XkMzvwJKsjVcAg7otPzuzR
	xe8en9RA/6k9nItSAiZw3RGWAZocpX9kr0k01kMh6D0/TKr/hDKmBrwO0bwMvuZEtVQFYFNo=
X-Google-Smtp-Source: AGHT+IEo2ZPDD9910sqJ0mRac28/pBfINwS+8DceO8xHG/en79UnnbroDH7fZri31d+Llru8oyqJVvaP0PIKvdITLiE=
X-Received: by 2002:a05:6122:8c5:b0:515:4b68:c37f with SMTP id
 71dfb90a1353d-51b75c73d5fmr33419281e0c.6.1735855630463; Thu, 02 Jan 2025
 14:07:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227190210.69025-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250102214622.GB614405-robh@kernel.org>
In-Reply-To: <20250102214622.GB614405-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jan 2025 22:06:44 +0000
Message-ID: <CA+V-a8vKa1huuYFhQ0dVpdpTsrh3dZVaaBxfNUF7JCUuZY4DWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: watchdog: renesas: Document
 `renesas,syscon-cpg-error-rst` property
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Thu, Jan 2, 2025 at 9:46=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Dec 27, 2024 at 07:02:08PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/V2H(P) CPG block includes Error Reset Registers (CPG_ERROR_RSTm)=
.
> > A system reset is triggered in response to error interrupt factors, and
> > the corresponding bit is set in the CPG_ERROR_RSTm register. These
> > registers can be utilized by various IP blocks as needed.
> >
> > In the event of a watchdog overflow or underflow, a system reset is iss=
ued,
> > and the CPG_ERROR_RST2[0/1/2/3] bits are set depending on the watchdog =
in
> > use: CM33 =3D 0, CA55 =3D 1, CR8_0 =3D 2, CR8_1 =3D 3. For the watchdog=
 driver to
> > determine and report the current boot status, it needs to read the
> > CPG_ERROR_RST2[0/1/2/3]bits and provide this information to the user up=
on
> > request.
> >
> > To facilitate this operation, add `renesas,syscon-cpg-error-rst`
> > property to the WDT node, which maps to the `syscon` CPG node, enabling
> > retrieval of the necessary information.
> >
> > Additionally, the property is marked as required for the RZ/V2H(P) SoC =
to
> > ensure future compatibility (e.g., where the same IP block is present o=
n
> > the RZ/G3E SoC) and explicitly disallowed for other SoCs.
>
> This is the other half of the ABI change.
>
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Renamed `renesas,r9a09g057-syscon-wdt-errorrst` to `renesas,syscon-cp=
g-error-rst`
> > - Updated commit message
> > ---
> >  .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yam=
l b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > index 29ada89fdcdc..ca62ae8b1b0c 100644
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > @@ -112,6 +112,19 @@ properties:
> >
> >    timeout-sec: true
> >
> > +  renesas,syscon-cpg-error-rst:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      The first cell is a phandle to the SYSCON entry required to obta=
in
> > +      the current boot status. The second cell specifies the CPG_ERROR=
_RSTm
> > +      register offset within the SYSCON, and the third cell indicates =
the
> > +      bit within the CPG_ERROR_RSTm register.
> > +    items:
> > +      - items:
> > +          - description: Phandle to the CPG node
> > +          - description: The CPG_ERROR_RSTm register offset
> > +          - description: The bit within CPG_ERROR_RSTm register of int=
erest
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -182,7 +195,11 @@ allOf:
> >        properties:
> >          interrupts: false
> >          interrupt-names: false
> > +      required:
> > +        - renesas,syscon-cpg-error-rst
>
> New required property =3D=3D ABI break
>
> Once the OS driver relies on this being present, then older DTs will
> break.
>
In this case there is no ABI break, as the driver code [0] does not
fail the probe when the property does not exist, it's just that it
won't report the status of current boot.

[0] https://lore.kernel.org/all/20241227190210.69025-6-prabhakar.mahadev-la=
d.rj@bp.renesas.com/

Cheers,
Prabhakar

