Return-Path: <linux-watchdog+bounces-2602-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9E9FA55E
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Dec 2024 12:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FD3A7A282E
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Dec 2024 11:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD66189B86;
	Sun, 22 Dec 2024 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNR00JeX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE827701;
	Sun, 22 Dec 2024 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734865933; cv=none; b=d0SyErFjRZaXRb4oHTFhDV/4b5A4icsCIgL3Pt3u69q/W0ufhhqOybjdi0bMZ7OSaCs5VzwOLOZTeS1kRZFoeyCQt3oQolOpI0PdrZ7AjgSbj+e5GwQBCuZBd3KO9oj0T3Hg9vu74KB5imeYarBbXb9O01oIUiamR530wQGS4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734865933; c=relaxed/simple;
	bh=tYHkUG/wwSiHJTIS7J31NBfaoJAiP+EUB+eJhYTo/BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+gzcF84pEvKKsV0CFTb6ZaVdm2sygagcHlILcWn1cAm8G1/BexvlkXKyLhctpDK92gEOSCHFoJW4vNVwtAwTzEKqbKS+NH8tjOFgbZaDFA4hlJPNPga8dg7RVrYqaSuhHgGZarexNIOI9cLzuRgGlU/wbFLSpTCxeuNlZW3YxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNR00JeX; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5174db4e34eso2754461e0c.0;
        Sun, 22 Dec 2024 03:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734865930; x=1735470730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbqXfv341dales403hwtYmrdKYyd7RfvpT5RuaGbgWY=;
        b=LNR00JeXfdITPghEnpUN/uBtOIxUoZxg/RCwoN6a106noAwr55oLOXpezQ8ALklpft
         vTjKcy1MGttFBCmQXYDLB/7MuXXWZSaOxreT6zopXozw7yBBtPFwAqc0p+52fqgTg6Gj
         dvgeelObcLHceXI7Kd7nNHW96uRHtdPp2aujz0oiAjStZe4Q95a0gmvpHjcFpkgv84Ql
         OYSyfa/Ch1BcwRFEo4NQmI3vqUuBS1rspm1J8FjVtDVjnxpRsPJGlngvvyDSB0mR3owZ
         nKGABkx5fEix1TV8A6r1NewrS/b2xcgcShuenpkMOeZYUKJW802zkyEFNJHZR6IgVxbq
         CdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734865930; x=1735470730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbqXfv341dales403hwtYmrdKYyd7RfvpT5RuaGbgWY=;
        b=qAW8ppSd2XYn5+Sydeen2aJc0bjXMxL7enC/sLKfxisGoDS845xPAWutIiNoGQ+RJT
         ajC5MdlnqZ1CbWbVn1R5zgydpdjEjJBnXqCXfhQ3XmAvsHlDxcZvJIhOATOL3CTouJC4
         bAiNrPa/KgXtIiXUc3Q7QQeDCtpoOk4/j2tGWsFCqplHabEo5JK/aQk9YzEKH0Brk7FK
         0pRHBqy71DBBkJbydQZbFmMsn1lmde5Yqk1yoj/9ZTuvptv0zdkPWRJXdHqzH2Ps2vW+
         YAVKBK1q5PoTz+IN3jipM4i1OEXKiXQ1wPaZaGe5COfzXG3LnZMvP2ENqJYKaVwIh2Wq
         RJIA==
X-Forwarded-Encrypted: i=1; AJvYcCU8dL4/D2jioWo+iApmPtWc4avLEwg2jZzhz4kJmEY3uRlSROPpicDSN+dW5wLtbnUjq/2TnQPrQE2vjGEJ@vger.kernel.org, AJvYcCXHbLFZAAylvqQToj4gU+mI4lzhCaC2QRcqj0bt1IvMaO8ktA2CSS3G7gyEbNKwaui0t7VEDtmcFT90giouj2c=@vger.kernel.org, AJvYcCXTkIYJ2Me+typ2+DLsmtJtmLQQyjwz+MHZ6ckK6MVGFxzzo6q9gpv9AI1CisDN9iwb04oa8rxn17LM@vger.kernel.org, AJvYcCXa6lODd/aVSDpRUf/oGbVYMt5QkzZzusJqMoi1FU9VvZkH0kmRngHLcxgB44J1dd76FCUDlIpLUjX0HCXKpFchH6s=@vger.kernel.org, AJvYcCXzFYsxwZmdKP5WMKsp60lZdUcMMq0HoGw0cy0AdnwDznaHNsXmvsfubeNfa53Sdx9DLqGu0j6t9N3d@vger.kernel.org
X-Gm-Message-State: AOJu0YymlWsD4O6EVG5moHdHRgMvmLs4BJwT5wRmHiY6G+r4nG38Yux6
	k7mC+BrG7LkuFhh7RIyoKhzgrR6g1+4aJG1EoAb95RQMYT+U90KI7UQgh55sTMnnvGhGYYP2HA+
	kSLIKbNs2s0KeNJroazMB3KQJiYbornPY0Ww=
X-Gm-Gg: ASbGnctPfYM/L9rHDhntWZYCzQrcGSUpwZXebITLW7GJtIgz8jKSV0349CxV1H7SN21
	CXR8QlnOo4PnfNZ4ELCPImor+AqbxpYsn76aaB81ZLrPXMr3Owx1OvzJDjll5Xlnfv6I1MiIY
X-Google-Smtp-Source: AGHT+IHr5jGnBX5megrDEttfJ7yETwjwC0xtVzXTy0wlZpRUIIKi3QSnhsChi8SCJsKEXzBokgFt1eruNuAAs3sbyJA=
X-Received: by 2002:a05:6122:d04:b0:516:1b30:8779 with SMTP id
 71dfb90a1353d-51b76ce6a08mr7598638e0c.6.1734865930401; Sun, 22 Dec 2024
 03:12:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218003414.490498-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <wouo4k7rd7y57jzez3qdrz27fscozofuksgs4ivft75y6cwvqa@zfq3wgerwaza>
 <CA+V-a8s-_OMJy=4v_whpBr7S4aE3Dn6KouFfCnQ=oUBM9MD4nA@mail.gmail.com> <53c2fc82-2b09-4f7e-a89f-c7c16c38cb8e@kernel.org>
In-Reply-To: <53c2fc82-2b09-4f7e-a89f-c7c16c38cb8e@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 22 Dec 2024 11:11:44 +0000
Message-ID: <CA+V-a8sXqWTPqRN_fFiYpNiSVghC9e+DHpVBF4CCG_e9s3s0TA@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: watchdog: renesas: Document
 `renesas,r9a09g057-syscon-wdt-errorrst` property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
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

On Thu, Dec 19, 2024 at 4:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/12/2024 11:06, Lad, Prabhakar wrote:
> >>> To facilitate this operation, add `renesas,r9a09g057-syscon-wdt-error=
rst`
> >>> property to the WDT node, which maps to the `syscon` CPG node, enabli=
ng
> >>> retrieval of the necessary information. For example:
> >>>
> >>>     wdt1: watchdog@14400000 {
> >>>         compatible =3D "renesas,r9a09g057-wdt";
> >>>         renesas,r9a09g057-syscon-wdt-errorrst =3D <&cpg 0xb40 1>;
> >>>         ...
> >>
> >> Drop, obvious.
> >>
> > Ok.
> >
> >>>     };
> >>>
> >>> The `renesas,r9a09g057-syscon-wdt-errorrst` property consists of thre=
e
> >>> cells:
> >>> 1. The first cell is a phandle to the CPG node.
> >>> 2. The second cell specifies the offset of the CPG_ERROR_RSTm registe=
r
> >>>    within the SYSCON.
> >>> 3. The third cell indicates the specific bit within the CPG_ERROR_RST=
m
> >>>    register.
> >>
> >> Don't describe the contents of patch.  Drop paragraph. There is no nee=
d
> >> to make commit msg unnecessary long. Focus on explaining unknown parts
> >> of commit: why? or who is affected by ABI break? why breaking ABI?
> >> instead of repeating diff.
> >>
> > Ok, I'll drop the para. There isnt any ABI breakage as the driver
> > patch [0] will skip supporting watchdog bootstatus if this property is
> > not present.
> >
> > [0] https://lore.kernel.org/all/20241218003414.490498-6-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
>
> Really? I see in rzv2h_wdt_probe():
>
> +               if (ret)
> +                       return ret;
>
> so to me you are failing the probe, not skipping anything.
>
Yes really this wont break any ABI. From patch [0] we have the below:

[0] https://lore.kernel.org/all/20241218003414.490498-6-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

    /* Do not error out to maintain old DT compatibility */
    syscon =3D syscon_regmap_lookup_by_phandle(np,
"renesas,syscon-cpg-error-rst");
    if (!IS_ERR(syscon)) {
        struct of_phandle_args args;
        u32 reg;

        ret =3D of_parse_phandle_with_fixed_args(np,
"renesas,syscon-cpg-error-rst",
                               2, 0, &args);
        if (ret)
            return ret;

        ret =3D regmap_read(syscon, args.args[0], &reg);
        if (ret)
            return -EINVAL;

        if (reg & CPG_ERROR_RST2(args.args[1])) {
            ret =3D regmap_write(syscon, args.args[0],
                       CPG_ERROR_RST2(args.args[1]) |
                       CPG_ERROR_RST2_WEN(args.args[1]));
            if (ret)
                return -EINVAL;
        }
        cardreset =3D true;
        bootstatus =3D reg & CPG_ERROR_RST2(args.args[1]) ? WDIOF_CARDRESET=
 : 0;
        regmap_read(syscon, args.args[0], &reg);
    }

Case 1: "renesas,syscon-cpg-error-rst" is missing in the device tree (DT).
In this case, syscon_regmap_lookup_by_phandle() will return an error
code. Since the condition (!IS_ERR(syscon)) checks for a success case,
the code does not enter the if block when an error is returned.

Case 2: "renesas,syscon-cpg-error-rst" is present in the DT.
Here, syscon_regmap_lookup_by_phandle() will return 0, allowing the
code to enter the if block. Once inside the if block, we can confirm
that "renesas,syscon-cpg-error-rst" is present in the DT. At this
point, we validate the property and use
of_parse_phandle_with_fixed_args(). If the property does not match our
requirements, we return an error. Does returning an error when
"renesas,syscon-cpg-error-rst" is present but with unexpected values
in the DT break the ABI in this scenario?

> >
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> ---
> >>>  .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++=
++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.y=
aml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> >>> index 29ada89fdcdc..8d29f5f1be7e 100644
> >>> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> >>> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> >>> @@ -112,6 +112,19 @@ properties:
> >>>
> >>>    timeout-sec: true
> >>>
> >>> +  renesas,r9a09g057-syscon-wdt-errorrst:
> >>
> >> There are never, *never* SoC names in property names, because we want
> >> properties to be re-usable.
> >>
> > I should have mentioned this in my commit message (my bad). The
> > renesas,wdt.yaml binding file is being used for all the SoCs
> > currently. To avoid any conflicts by just having vendor specific
> > property I added SoC name to the preoperty.
>
> I know what you did and I replied: that's a no go for reasons I stated.
>
> >
> > @Geert/Wolfram - Maybe we need to split the binding on per SoC bases?
>
> You can but I don't understand why exactly.
>
OK, I'll rename the property to "renesas,syscon-cpg-error-rst".

> >
> >> Make the property generic for all your devices and be sure to disallow
> >> it everywhere the CPG_ERROR_RSTm *does not* exist (which is different
> >> from "where CPG_ERROR_RSTm is not used by watchdog driver").
> >>
> > This patch already disallows `renesas,r9a09g057-syscon-wdt-errorrst`
> > for the rest of the SoCs and only allows for RZ/V2H(P) SoC or am I
> > missing something?
>
> No, that's fine, but to avoid disallowing it for others you named it per
> SoC.
>
> >
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >>> +    description:
> >>> +      The first cell is a phandle to the SYSCON entry required to ob=
tain
> >>> +      the current boot status. The second cell specifies the CPG_ERR=
OR_RSTm
> >>> +      register offset within the SYSCON, and the third cell indicate=
s the
> >>> +      bit within the CPG_ERROR_RSTm register.
> >>> +    items:
> >>> +      - items:
> >>> +          - description: Phandle to the CPG node
> >>> +          - description: The CPG_ERROR_RSTm register offset
> >>> +          - description: The bit within CPG_ERROR_RSTm register of i=
nterest
> >>> +
> >>>  required:
> >>>    - compatible
> >>>    - reg
> >>> @@ -182,7 +195,11 @@ allOf:
> >>>        properties:
> >>>          interrupts: false
> >>>          interrupt-names: false
> >>> +      required:
> >>> +        - renesas,r9a09g057-syscon-wdt-errorrst
> >>
> >> No, ABI break.
> >>
> > As mentioned above we won't break ABI, this required flag is for future=
 changes.
>
> Then why is this required? Or at least explain this in the commit msg.
>
Sure i'll explain this in the commit message.

Cheers,
Prabhakar

