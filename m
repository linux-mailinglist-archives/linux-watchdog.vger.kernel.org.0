Return-Path: <linux-watchdog+bounces-3792-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B0AEFE73
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDB1F1887F27
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E70C278E71;
	Tue,  1 Jul 2025 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqKObUsA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9626F44C;
	Tue,  1 Jul 2025 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383841; cv=none; b=UXPThG2otth7OJbCLSeEZqMrVijCz/nYcb48ABfvcNu5bHeAsZWfNv1LV2ZMS1QPX1En46cJ3fXhgE0wFnM3MloE9KEZiBK1rxONnajJ363agyLAY5xd6RiZWpzDHa4oRaArXB9pTWn8xj6U1NCB7p/7qn8CKqoCMomie7xPBfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383841; c=relaxed/simple;
	bh=esq6GOU0YhrPGSWvYux2e5iZTTVZJjFx3fEwhZQPgKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnBD+Xb3nG3KHaG3km2iGWS3n4S6RxC6DNLeB3YfHmUHnL8TBwUPoN420EgEotYDJEgfzHy6Hr5WmosoFGh2N8mpln6+NZP5EEq/ylXCvTGBwoyXiVLOmZxrcUSd1gUrmuvR7FXAMbnQ+IPttqOIWW6ycChei98rOeGX7FCPfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqKObUsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAB0C4CEEF;
	Tue,  1 Jul 2025 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751383840;
	bh=esq6GOU0YhrPGSWvYux2e5iZTTVZJjFx3fEwhZQPgKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqKObUsA0XqJSdOTV38SUPg0qehNPYEJw21E8pe0ZtkEhIAN2gTubJDa34IPE44Zu
	 DgCYMxp1EQWaoDr6GCINznEm5mUb8XKTPUmZ3umEARYYWDwHJf/wP2q1iPUxF5+P2E
	 ZZyj0wi4AIugFmUoWzVWBJhvJjXSAojpt12nLvqAGeqRHae4yOWfbgSPvxdgdjfCOI
	 A2xHOk3VuKafVFC+csJbujA1ZguLjcUL/ZQd/LMLlJf7lVVTm9qmPKN1nkVFoS5Fmb
	 i6lz/uIS0yU1mdm/LzUr7flUnT/o2kmORh91MAitE4tmwZ84TPgNjBfKIlYb4UjL29
	 dcl4pPn2dC+Ug==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so596580466b.0;
        Tue, 01 Jul 2025 08:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8ps7vwtvPMQ1MFERqgycbbasnxE+B41INc1ZDCGHX0m6gW2xgGAke9KELBUX3PUFNBs0A91gImfb9@vger.kernel.org, AJvYcCV4VVg2dHMT4Bm0nITjoEM9IW1d9gbpRLzL5OcBQ4sbQbERJE669y976ByCGQt7M1XMx+wftrzQnsWBWuTo@vger.kernel.org, AJvYcCXZ/H+Yh4Vmpzo4/Pvcpx4rBNlqTswr8/CFveGOAnNPc6flyGrEg7BWSLzaRAQnvQeUe5exQNYECErl/Xkt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh7v1ntb+ZST1QU2wMLJMQZkpeNW9nMJ4+WeQ5ys8W/SYYYThG
	w+iI52gEB8U3jUjVfoUR6XXLeuJFZxEmQ96haIbNPPC6aDeue67H/UmFoSBmQLDbmpqCnianuAH
	skT/Zdzc63oju9L4RKjFTj5eQblwNLQ==
X-Google-Smtp-Source: AGHT+IGEOJ71QMmhygwwyoNyQvTUaSHGrectnbPhXO6fiW5U06Zpksqy5ktwiQlQijy6IeTYO+AYO14xuNYbA79IbCw=
X-Received: by 2002:a17:907:d86a:b0:ae3:6390:6acc with SMTP id
 a640c23a62f3a-ae363906fc2mr1532109666b.27.1751383839032; Tue, 01 Jul 2025
 08:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me> <175138000372.1627755.5505703571113478205.robh@kernel.org>
In-Reply-To: <175138000372.1627755.5505703571113478205.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Jul 2025 10:30:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLSa+1MYR6f6NcApGFdjCL0dDXSzpntVHCPGmKgytVfdQ@mail.gmail.com>
X-Gm-Features: Ac12FXzzE6a683eHMTyQ3BNDvQ78bAbSIDWu96D3LpnH4E2Ei9VCbyAZ1NSVMV0
Message-ID: <CAL_JsqLSa+1MYR6f6NcApGFdjCL0dDXSzpntVHCPGmKgytVfdQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] ARM: Add support for MediaTek MT6572 SoC
To: Max Shevchenko <wctrl@proton.me>
Cc: linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mediatek@lists.infradead.org, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:27=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Tue, 01 Jul 2025 09:06:54 +0300, Max Shevchenko wrote:
> > This series of patches adds support for the MT6572 SoC and
> > the JTY D101 tablet and Lenovo A369i smartphone based on it.
> >
> > Signed-off-by: Max Shevchenko <wctrl@proton.me>
> > ---
> > Changes in v3:
> > - Remove the compatible property from the SoC devicetree
> > - Link to v2: https://lore.kernel.org/r/20250626-mt6572-v2-0-f7f8421969=
86@proton.me
> >
> > Changes in v2:
> > - Drop the status property for the board devicetrees
> > - Add an soc node for the MT6572 and reorder the nodes and properties
> > - Change the commit title to a more descriptive one
> > - Change the cover title to the correct one
> > - Link to v1: https://lore.kernel.org/r/20250620-mt6572-v1-0-e2d47820f0=
42@proton.me
> >
> > ---
> > Max Shevchenko (11):
> >       dt-bindings: serial: mediatek,uart: add MT6572
> >       dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT=
6572
> >       dt-bindings: timer: mediatek: add MT6572
> >       dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
> >       dt-bindings: vendor-prefixes: add JTY
> >       dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
> >       ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
> >       ARM: mediatek: add MT6572 smp bring up code
> >       ARM: dts: mediatek: add basic support for MT6572 SoC
> >       ARM: dts: mediatek: add basic support for JTY D101 board
> >       ARM: dts: mediatek: add basic support for Lenovo A369i board
> >
> >  .../devicetree/bindings/arm/mediatek.yaml          |   5 +
> >  .../mediatek,mt6577-sysirq.yaml                    |   1 +
> >  .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
> >  .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
> >  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
> >  .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
> >  arch/arm/boot/dts/mediatek/Makefile                |   2 +
> >  arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  61 ++++++++++++
> >  arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  56 +++++++++++
> >  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 108 +++++++++++++=
++++++++
> >  arch/arm/mach-mediatek/Kconfig                     |   4 +
> >  arch/arm/mach-mediatek/mediatek.c                  |   1 +
> >  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
> >  13 files changed, 250 insertions(+)
> > ---
> > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > change-id: 20250619-mt6572-ef78a3d45168
> >
> > Best regards,
> > --
> > Max Shevchenko <wctrl@proton.me>
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0=
ca
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/mediatek/=
' for 20250701-mt6572-v3-0-8937cfa33f95@proton.me:
>
> arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): mem=
ory: False schema does not allow {'device_type': ['memory'], 'reg': [[21474=
83648, 536870912]]}
>         from schema $id: http://devicetree.org/schemas/root-node.yaml#
> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: Fal=
se schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1=
073741824]]}
>         from schema $id: http://devicetree.org/schemas/root-node.yaml#

'memory' node without a unit-address has long been deprecated. Please
don't add more cases.

Rob

