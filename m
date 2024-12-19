Return-Path: <linux-watchdog+bounces-2596-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08C9F7935
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2024 11:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E707F16B153
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2024 10:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79C1221DB3;
	Thu, 19 Dec 2024 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIcCud6f"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4130433A4;
	Thu, 19 Dec 2024 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734602814; cv=none; b=g32Tj9HWNqmOjmCEUKWOK+HSQJH78psynZB73d+nfMCBv8C8O+hDFBOzJ8/lavDcTPna9LUz+I4bsDugqbAxnZdpAXlcOpgxULO/LX2uVir2S2Cl07ze06cSZgq37+mkUfxacEst3CqFxphORkMuj/0Rin/QS7SXmUQSUDCYzZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734602814; c=relaxed/simple;
	bh=gZ9h5ruC2dwTE9Lk3qVntz+kZ63Pg681SG5Vg3pXOQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLdujFXYH3eMa1YYu5u+z2czb0uzsDCX0NOALipni1Ztl94BpmI+X+1SOU5/dgQjoh9L8Ylv1bkpYRA1E9OQPb4j8CEyK2oBtbQ+j5Q9eUA4xvTd1n5n1H410zre465mf+lSDjCIPZHp6c1uQGqtT515Ab7+nXfVq7Ie4Uw0Y14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIcCud6f; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-518ae5060d4so199053e0c.0;
        Thu, 19 Dec 2024 02:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734602811; x=1735207611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkq7Lxj/zqMZ3ehkTx5p7KdMjUNc3jyVN9Y7DIq/Nj0=;
        b=nIcCud6f+vOpmIAaCqDtBtZE+shzZYt000gO0SJXau5j2+yvVM7n5cbHdA4LITl/Wz
         SjcbdsGizMeOqsDjWwUEQojU/IJCxKwONri22lR6XBjot0KXlUqWSlCO13UzOhYK24ob
         oL9TylMbCcmetNJUJazZqYUT1llZELJe/Fwsst2T6rBVYEOy42b2y3xCwT4VRuFY53SL
         OkYA+QkOy3RQhB9XEUcckif8RFCZGIhgVcjtKs2VZIl3GYkWxZsELE/3dkOvh4Bqtt4f
         Q0btjye4juEYYnSUuVrUphaMdi5ptmf2OTWdZKOUwcUHSS0I+S6/V4ULlHNNsSve+vKy
         +i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734602811; x=1735207611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkq7Lxj/zqMZ3ehkTx5p7KdMjUNc3jyVN9Y7DIq/Nj0=;
        b=HMNp4K3gJ6tPL/eO2VPfMzurtKW6xpJzlGWtGTxu0WU3zsu2UzJJ7YXhAT8XPG97Eb
         HSv1Ie2cxQlRvQxBME3s+4GE6UP37ao6IPEg3aA0Tiy+EZOV9UuU4MM1zzrWee4NMGFA
         i4pH2UR/Wr2vzBKDrOGxotWv7Cew5MHpo/V9K5zBe1+6S3a7dA8Ty8SYUoqaj8U9ldA4
         d/5Oqxj2TpnlklNnEsW5Ar3hR1OzxFjgPaA6W0Jd9JcZB77t+8rY7galqrvzx/iv6R1v
         VwCFxFDZU85+c45NrPYaQ0XwQCzS1mrgAGT0XHAY+YtRWi1WxqhdQPy9ahtIyjcS+Rp9
         NPUw==
X-Forwarded-Encrypted: i=1; AJvYcCVeNq2/rwAcz7m+8rJvZYRc+S12ILSoCgEK7Tq4e1M6NUoIe08sfuEMJB9CsNyhrhM06NPHxNSsu3tk6LU2AI2TidE=@vger.kernel.org, AJvYcCVodn1e+gF6lnypG/YIlksNHknh775PNe80e+OYtmEQdjyBQYXGXuPl+wkmyMJ3y0692S5CZrK1TCd2@vger.kernel.org, AJvYcCWWBooAB3pMcSnmkiVLQiumSYwZftSJyBjhOyyAj2rVXzTCnlVh7veqpnY+y0aew8W+RitKDTBThuK6@vger.kernel.org, AJvYcCX/Uuwh07VNJeFQtGH34DKzvQWjJsDqR2rD8D5kTpoN/VYKREM5x/VI5ypYDL6ZkLf9lkhEswrIKr9eLBKV@vger.kernel.org, AJvYcCX088pUMGGAiEGZebqOUgiDnh9CXhlSQsx2GnWbR8YSgC/5cNkS2KCAK3ZrTS4jFWqQzGrTnsVyWOBJVWCH9BE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXWmiQ2KjGBsgCVhI8YEgKZMZEgz5txNoyT1rSe3Z6TU80kHbg
	i/E2PsMBjzRHhs2/hXOtFvVzfWov/xd32bq7umzbSoU4Em4Sdn5br6x9igH4+OHyQYMHtmF9TDu
	exklF2QjE0N/9u3RxCYX+GCPmwpQ=
X-Gm-Gg: ASbGnctYKuYSDFuBPfPrPFHk/fP4MtfSZb2SuZeNkXRGkOtiYX5e3XdjoxMvIUHXSsV
	44AMQWHJUkQIAtYofexIvD0hTr78rbEEMYcrBs8s=
X-Google-Smtp-Source: AGHT+IFEOLg8CjE68EUWYJtp8mfvtAQEKXwkXBL7fnowhEwwMZqxJSPIB40t6Uhwsvny0Zt/APmJpkcA6EZE2Y9ji0c=
X-Received: by 2002:a05:6122:659b:b0:517:4fb0:74bc with SMTP id
 71dfb90a1353d-51a36c519d0mr6176416e0c.3.1734602811544; Thu, 19 Dec 2024
 02:06:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218003414.490498-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <wouo4k7rd7y57jzez3qdrz27fscozofuksgs4ivft75y6cwvqa@zfq3wgerwaza>
In-Reply-To: <wouo4k7rd7y57jzez3qdrz27fscozofuksgs4ivft75y6cwvqa@zfq3wgerwaza>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Dec 2024 10:06:25 +0000
Message-ID: <CA+V-a8s-_OMJy=4v_whpBr7S4aE3Dn6KouFfCnQ=oUBM9MD4nA@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: watchdog: renesas: Document
 `renesas,r9a09g057-syscon-wdt-errorrst` property
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Thu, Dec 19, 2024 at 9:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Dec 18, 2024 at 12:34:12AM +0000, Prabhakar wrote:
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
> > To facilitate this operation, add `renesas,r9a09g057-syscon-wdt-errorrs=
t`
> > property to the WDT node, which maps to the `syscon` CPG node, enabling
> > retrieval of the necessary information. For example:
> >
> >     wdt1: watchdog@14400000 {
> >         compatible =3D "renesas,r9a09g057-wdt";
> >         renesas,r9a09g057-syscon-wdt-errorrst =3D <&cpg 0xb40 1>;
> >         ...
>
> Drop, obvious.
>
Ok.

> >     };
> >
> > The `renesas,r9a09g057-syscon-wdt-errorrst` property consists of three
> > cells:
> > 1. The first cell is a phandle to the CPG node.
> > 2. The second cell specifies the offset of the CPG_ERROR_RSTm register
> >    within the SYSCON.
> > 3. The third cell indicates the specific bit within the CPG_ERROR_RSTm
> >    register.
>
> Don't describe the contents of patch.  Drop paragraph. There is no need
> to make commit msg unnecessary long. Focus on explaining unknown parts
> of commit: why? or who is affected by ABI break? why breaking ABI?
> instead of repeating diff.
>
Ok, I'll drop the para. There isnt any ABI breakage as the driver
patch [0] will skip supporting watchdog bootstatus if this property is
not present.

[0] https://lore.kernel.org/all/20241218003414.490498-6-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yam=
l b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > index 29ada89fdcdc..8d29f5f1be7e 100644
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > @@ -112,6 +112,19 @@ properties:
> >
> >    timeout-sec: true
> >
> > +  renesas,r9a09g057-syscon-wdt-errorrst:
>
> There are never, *never* SoC names in property names, because we want
> properties to be re-usable.
>
I should have mentioned this in my commit message (my bad). The
renesas,wdt.yaml binding file is being used for all the SoCs
currently. To avoid any conflicts by just having vendor specific
property I added SoC name to the preoperty.

@Geert/Wolfram - Maybe we need to split the binding on per SoC bases?

> Make the property generic for all your devices and be sure to disallow
> it everywhere the CPG_ERROR_RSTm *does not* exist (which is different
> from "where CPG_ERROR_RSTm is not used by watchdog driver").
>
This patch already disallows `renesas,r9a09g057-syscon-wdt-errorrst`
for the rest of the SoCs and only allows for RZ/V2H(P) SoC or am I
missing something?

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
> > +        - renesas,r9a09g057-syscon-wdt-errorrst
>
> No, ABI break.
>
As mentioned above we won't break ABI, this required flag is for future cha=
nges.

Cheers,
Prabhakar

