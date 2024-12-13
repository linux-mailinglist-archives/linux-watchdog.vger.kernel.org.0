Return-Path: <linux-watchdog+bounces-2570-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E999F1574
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 20:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 439FB7A143C
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 19:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A661EB9FF;
	Fri, 13 Dec 2024 19:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0s38yJ5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3961E500C;
	Fri, 13 Dec 2024 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734116923; cv=none; b=b08SwsRIJzhEYTf3ISyc7I13EfgCAK5ZKTtT0Yi2Gf8QsK+OGB+281phThmTTE2DeSZWhGdd/ahCmuD/qtCHSzxr67mZo5yavGYpepNZhuQzkOca8WBhfB96K1gRUuz2BntF6J7zSWW5wDN0pmCAB2IzbCJWVwxXjOxKzJ3BkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734116923; c=relaxed/simple;
	bh=vJMC0hZGT8CtOnTeFyWtR/U6iBSrXN+3khQ+rMIKtQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXBNPLyRE3LkIkNoK7gVCRpNXCMvD6uHBnZQkRJvYsNcHxpElrktwwgHgSoTwOXUU96WlWRTOMpavWmqCkvUgS4G3QKdndz+qaLkNLV7dAhzUPD4gm1u6EPR++taqphHWJlZ6pojMBGZ6xwF4F2+Mic+xQ8Me4z7AEmCiGQeRAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0s38yJ5; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-518c46cc6e4so429441e0c.3;
        Fri, 13 Dec 2024 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734116920; x=1734721720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzke9aEcGgi69gWVsaQm5tcJqVbt5y30w2k08zXHinM=;
        b=N0s38yJ5tRgM5owEHffGYEUMZhFOjcTUvFv6m5JwRf9O3FLUcinXFRHhVzptUsec13
         Ap0OChVANo0Umu5ZMEU/n5q8LCj1UZOhk2h5SsRBsnLlEtcipuFJjJcPyfXploR2//CY
         sLJixn/Zp0oDNOwRK+1zm9FNawfZ9a7YyHaGYlTFuTyOOlub97QzBuwU0cOdOeF5sxol
         E59jsWxDcIWa6zM65bGcVPfWVu56n2z4xMjOae832IqasfJBWINMZTKfblWZIHYyiZy3
         kk2Iokl8YhfRYhm+VZUntTVj6+cf87fXsK4olBfHaXM9O10UZCkRPY3CtKCmf6bRahKJ
         e4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734116920; x=1734721720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rzke9aEcGgi69gWVsaQm5tcJqVbt5y30w2k08zXHinM=;
        b=qtGeKnmqutqjAAuZELm/cVVDyY/P8iHHko/2IHYYospJxIS/aTuTrTAGzE2OoNd9dO
         y2d01zktXH/2exvZ2M0xpe7C7Cfiu5cZGxS/fXKgQMislxfW15FYcMsdtu+9Yp4MPckd
         OaOwLIRN/QNR7fEcQk6UHVj3fqPpDJNewDrbtbecxADkTvhGM8ert2GWM9e55QzisLXb
         JTYkZob1jVrDTSJEsaCV6FjLv5ZBEr0jMfq31nOKsX9rXthlUz++WOvRUru4Ie94fxpK
         r5NNny+8cweqty5b9pst2M14cMy4lirqHGTcuxnz93x/kqrHEr947igGvyVZ+hIurpgP
         OCVA==
X-Forwarded-Encrypted: i=1; AJvYcCVBubTD88uSFbz+TQQHPx9PunpQTD/4hwJIvKMKoO1OFmzmAUiUSWUqGeJLO1Tp7qBp6Dtl2VlbVJbOj18y@vger.kernel.org, AJvYcCWa4FsF5cBVUEEzEWLqSOo/N9NPSHbw1q48ALHVOb0QL8sKKFlGUyAv8ltO6ZbYTqt6tSvYhRMVegFMZ+PB6nDZwDU=@vger.kernel.org, AJvYcCXmv/IFk5l+io4tYpMZewocNoBi/32K749NfU+kqP0NRgXR0I19fwkk2IUqMMZXN+fZVInoFYX/y8nzOTbpXLY=@vger.kernel.org, AJvYcCXrYEj8BMeOKPSA5J4zJPCKO0AocfcYHBcJPL75uhhiwLG6dKHQ3LIvbDEWJhCjixjRX3XEze5xWJCF@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEb/mrGlAEZ4In1PE8ai7P8O0K4v6zViFWFtH+rgSqr9SfTOR
	2vhr+6A0bPZir88+CIXzVra3ARMdsddrskoDEyjr4WS75kvaPsnjPhdkkixfSa7tb0uWoBkJQLW
	dmfE1rIqQ8b2DBIGWNSTo5xH+2tA=
X-Gm-Gg: ASbGncuSwuWNF9e4qgd23CgL9kM9gRIS7e2NBUpQYHjHbsepozkoiXNzs6cm+QvIGJG
	DFNF+ZdeCpoaKYSKBbK/aVOtzNRv6EyCZGPvQ63cW9W2uoI6L9Iay3nPgYVEgpdNAnkuohEE=
X-Google-Smtp-Source: AGHT+IGNuQK2GTtvmXP3JZWm895wrx+wGNLBgKgubD3wUpIfMG2SgpYFKlJdrBlzMYOg2c0P1HXW5hdFJ2+k5DSxZtk=
X-Received: by 2002:a05:6122:a0e:b0:518:a261:adca with SMTP id
 71dfb90a1353d-518ca460b50mr4370525e0c.8.1734116920236; Fri, 13 Dec 2024
 11:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net>
In-Reply-To: <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Dec 2024 19:08:13 +0000
Message-ID: <CA+V-a8uasq+E+_7rk+o729hRp6PwYSgTcUQYbTe44CkXfSE71A@mail.gmail.com>
Subject: Re: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review.

On Fri, Dec 13, 2024 at 6:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 12/13/24 09:44, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the RZ/V2H(P) SoC we can determine if the current boot is due to
> > `Power-on-Reset` or due to the `Watchdog`. The information used to
> > determine this is present on the CPG block.
> >
> > The CPG_ERROR_RSTm(m =3D 2 -8 ) registers are set in response to an err=
or
> > interrupt causing an reset. CPG_ERROR_RST2[ERROR_RST1] is set if there
> > was an underflow/overflow on WDT1 causing an error interrupt.
> >
> > To fetch this information from CPG block `syscon` is used and bootstatu=
s
> > field in the watchdog device is updated based on the
> > CPG_ERROR_RST2[ERROR_RST1] bit. Upon consumig CPG_ERROR_RST2[ERROR_RST1=
]
> > bit we are also clearing it.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > @Geert, I intend to drop WDT0/2/3 nodes (and related clocks) as HW manu=
al
> > says WDT1 is for CA55 (I'll first confirm this internally)
> >
> > Hi Geert/Rob,
> >
> > I havent included a binding changes as part of the RFC as I wanted to g=
et
> > some initial feedback on the implementation. Currently CPG block doesnt
> > have the "syscon" this patch has been tested with below diff to SoC DTS=
I
> >
> > Cheers,
> > Prabhakar
> >
> > Changes to SoC DTSI:
> > @@ -243,7 +243,7 @@ pinctrl: pinctrl@10410000 {
> >                  };
> >
> >                  cpg: clock-controller@10420000 {
> > -                       compatible =3D "renesas,r9a09g057-cpg";
> > +                       compatible =3D "renesas,r9a09g057-cpg", "syscon=
";
> >                          reg =3D <0 0x10420000 0 0x10000>;
> >                          clocks =3D <&audio_extal_clk>, <&rtxin_clk>, <=
&qextal_clk>;
> >                          clock-names =3D "audio_extal", "rtxin", "qexta=
l";
> > @@ -455,6 +456,7 @@ wdt1: watchdog@14400000 {
> >                          clock-names =3D "pclk", "oscclk";
> >                          resets =3D <&cpg 0x76>;
> >                          power-domains =3D <&cpg>;
> > +                       syscon =3D <&cpg>;
> >                          status =3D "disabled";
> >                  };
> >
> > ---
> >   drivers/watchdog/rzv2h_wdt.c | 27 ++++++++++++++++++++++++++-
> >   1 file changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 8defd0241213..8e0901bb7d2b 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -4,14 +4,17 @@
> >    *
> >    * Copyright (C) 2024 Renesas Electronics Corporation.
> >    */
> > +#include <linux/bitfield.h>
> >   #include <linux/clk.h>
> >   #include <linux/delay.h>
> >   #include <linux/io.h>
> >   #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >   #include <linux/module.h>
> >   #include <linux/of.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >   #include <linux/reset.h>
> >   #include <linux/units.h>
> >   #include <linux/watchdog.h>
> > @@ -40,6 +43,10 @@
> >
> >   #define WDT_DEFAULT_TIMEOUT 60U
> >
> > +#define CPG_ERROR_RST2                       0xb40
> > +#define CPG_ERROR_RST2_ERR_RST1              BIT(1)
> > +#define CPG_ERROR_RST2_ERR_RST1_WEN  (BIT(1) << 16)
>
> I could understand BIT(17) or BIT(1 + 16) or
>
> #define CPG_ERROR_RST2_ERR_RST1_BIT     1
> #define CPG_ERROR_RST2_ERR_RST1         BIT(CPG_ERROR_RST2_ERR_RST1_BIT)
> #define CPG_ERROR_RST2_ERR_RST1_WEN     BIT(CPG_ERROR_RST2_ERR_RST1_BIT +=
 16)
>
> but "BIT(1) << 16" really does not add value.
>
OK, I will switch to the above mentioned macros.

> > +
> >   static bool nowayout =3D WATCHDOG_NOWAYOUT;
> >   module_param(nowayout, bool, 0);
> >   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (=
default=3D"
> > @@ -135,7 +142,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *w=
dev)
> >   }
> >
> >   static const struct watchdog_info rzv2h_wdt_ident =3D {
> > -     .options =3D WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTI=
MEOUT,
> > +     .options =3D WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTI=
MEOUT | WDIOF_CARDRESET,
> >       .identity =3D "Renesas RZ/V2H WDT Watchdog",
> >   };
> >
> > @@ -207,12 +214,29 @@ static int rzv2h_wdt_probe(struct platform_device=
 *pdev)
> >   {
> >       struct device *dev =3D &pdev->dev;
> >       struct rzv2h_wdt_priv *priv;
> > +     struct regmap *regmap;
> > +     unsigned int buf;
>
> That is a bad variable name since it suggests a buffer, not some
> register content.
>
Agreed I will rename it to reg.

> >       int ret;
> >
> >       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >       if (!priv)
> >               return -ENOMEM;
> >
> > +     regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node, "syscon"=
);
> > +     if (IS_ERR(regmap))
> > +             return PTR_ERR(regmap);
> > +
>
> That is a change in behavior. Up to now the syscon phandle did not have t=
o exist
> for the driver to work. Is it guaranteed to not result in regressions on =
systems
> where it doesn't ? Also, is this documented ? I don't seem to be able to =
find it.
>
Agreed. I will add a fallback mechanism to handle cases where the
syscon property is not present in the WDT node. This will ensure no
regressions occur, and the bootstatus will simply be set to 0 in such
scenarios. As mentioned in the patch comments, I have not yet
submitted the DT binding changes because I wanted feedback on the
syscon approach. The new RZ SoCs have registers scattered across
various locations, and I was exploring if there might be a better way
to handle this.

> > +     ret =3D regmap_read(regmap, CPG_ERROR_RST2, &buf);
> > +     if (ret)
> > +             return -EINVAL;
>
> Pass error codes back to caller. This is most definitely not an
> "Invalid argument".
>
OK.

> "
> > +
> > +     if (buf & CPG_ERROR_RST2_ERR_RST1) {
> > +             ret =3D regmap_write(regmap, CPG_ERROR_RST2,
> > +                                CPG_ERROR_RST2_ERR_RST1_WEN | CPG_ERRO=
R_RST2_ERR_RST1);
> > +             if (ret)
> > +                     return -EINVAL;
>
> Same as above.
>
OK.

Cheers,
Prabhakar

