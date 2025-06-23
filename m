Return-Path: <linux-watchdog+bounces-3706-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8ABAE3B21
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 11:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACF13A6B77
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 09:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF0E235360;
	Mon, 23 Jun 2025 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="E8POB4Dv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2522DA0C;
	Mon, 23 Jun 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672216; cv=none; b=E+d3i7oF3EF+zVUq4gmYccSGS7pnkgCHgDCu1bMjOnx9/DtGUnYBbYl4J703jy3TJj7bl9QkOX9ghMOuNptDvwpwRAW0uSCoFqIIqtA2P7HXcfAAoR4CLPCOS60sDTsCobCAL2c8VS1oPqWtbofUf56KQ7JFf1xDT7i7njOODJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672216; c=relaxed/simple;
	bh=2qh1CJjO8c2zLPbBAKpH3KGrCB+i0u1GVzjXdu6Efzw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIczler/bOI62Q6mJbHTx5hyb7JXrbGuHkxcZN/QhgAogaoc2j2wLivL3qYv0xSOlUGrM2Va9YGc6OaXVcKtJRXL6OFG9fUipkrgUbOrCIb/w7YdAz/sLRvdnlWDscichgyToHyXiigSOhufESGnzyf58rh2yVWs5xXzQ/wgX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=E8POB4Dv; arc=none smtp.client-ip=109.224.244.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750672205; x=1750931405;
	bh=2qh1CJjO8c2zLPbBAKpH3KGrCB+i0u1GVzjXdu6Efzw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E8POB4Dv/lqhX+/sJjDZa0/eRygsCa8wa0bD650TGPocFSrQmngVcmH1D3sAxuPA+
	 LW1kx1i/1pOmqd1rUMvyIAhqBWl1APVUa8m9mGWcG7GKTjZYT6pcqc9TgtP7e47tmX
	 qniN6zrdbbESjD1VetTautbvt1mkQo6xrcZtlg2bNE8ZxjqWMJH+FOeC792/ZFCjA2
	 cJYsbS5g0TjVCk8W/p8chAN4R8U7yoOff0HvBQ2Nd5H/49aF46mWlAnjhafpzeMz3Z
	 K47KMGRf+oZnnk9ahBhiWXKdU8vibpziYrRLgevjgfQ3LlNNNuqTpqC9bZtwqcdO9a
	 e7L6adwy/WWKQ==
Date: Mon, 23 Jun 2025 09:49:59 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Max Shevchenko <wctrl@proton.me>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux@roeck-us.net" <linux@roeck-us.net>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "robh@kernel.org" <robh@kernel.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "wctrl@proton.me" <wctrl@proton.me>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>
Subject: Re: [PATCH 09/11] ARM: dts: mediatek: add basic support for MT6572 SoC
Message-ID: <kZ6sH6-8EHhW5FtsAmo9HXndj7D1jFyW0cv0A4KDO3i5SS9JiGEZNTd1gbMXizu4vI0M0hjROLK5DEnKbB36jWUKUPRKukq5IRK9Tz2qz7k=@proton.me>
In-Reply-To: <94fd71e6-0f09-42d0-94ef-1ff111daac9f@collabora.com>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me> <20250620-mt6572-v1-9-e2d47820f042@proton.me> <94fd71e6-0f09-42d0-94ef-1ff111daac9f@collabora.com>
Feedback-ID: 131238559:user:proton
X-Pm-Message-ID: 776204d2426614811a793f4a9aa639b87ffcd972
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Monday, June 23rd, 2025 at 11:35 AM, AngeloGioacchino Del Regno <angelog=
ioacchino.delregno@collabora.com> wrote:

> Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
>
> > From: Max Shevchenko wctrl@proton.me
> >
> > Add basic support for the MediaTek MT6572 SoC.
> >
> > Signed-off-by: Max Shevchenko wctrl@proton.me
> > ---
> > arch/arm/boot/dts/mediatek/mt6572.dtsi | 105 ++++++++++++++++++++++++++=
+++++++
> > 1 file changed, 105 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts=
/mediatek/mt6572.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..dd12231ca745be7455e9939=
1abd2d708f2f1a8a9
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2025 Max Shevchenko wctrl@proton.me
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + compatible =3D "mediatek,mt6572";
> > + interrupt-parent =3D <&sysirq>;
> > +
> > + cpus {
> > + #address-cells =3D <1>;
> > + #size-cells =3D <0>;
> > + enable-method =3D "mediatek,mt6589-smp";
> > +
> > + cpu@0 {
> > + device_type =3D "cpu";
> > + compatible =3D "arm,cortex-a7";
> > + reg =3D <0x0>;
> > + };
> > + cpu@1 {
> > + device_type =3D "cpu";
> > + compatible =3D "arm,cortex-a7";
> > + reg =3D <0x1>;
> > + };
> > + };
> > +
> > + system_clk: dummy13m {
> > + compatible =3D "fixed-clock";
> > + clock-frequency =3D <13000000>;
> > + #clock-cells =3D <0>;
> > + };
> > +
> > + rtc_clk: dummy32k {
> > + compatible =3D "fixed-clock";
> > + clock-frequency =3D <32000>;
> > + #clock-cells =3D <0>;
> > + };
> > +
> > + uart_clk: dummy26m {
> > + compatible =3D "fixed-clock";
> > + clock-frequency =3D <26000000>;
> > + #clock-cells =3D <0>;
> > + };
> > +
>
>
> Anything that has an MMIO address shall be child of "soc".
>
> soc {
> watchdog@....
>
> timer@....
>
> etc.
> };
>
> > + watchdog: watchdog@10007000 {
> > + compatible =3D "mediatek,mt6572-wdt",
> > + "mediatek,mt6589-wdt";
>
>
> those fit in one line:
>
> compatible =3D "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";
>
> > + reg =3D <0x10007000 0x100>;
> > + interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
> > + timeout-sec =3D <15>;
> > + #reset-cells =3D <1>;
> > + };
> > +
> > + timer: timer@10008000 {
> > + compatible =3D "mediatek,mt6572-timer",
> > + "mediatek,mt6577-timer";
>
>
> same
>
> > + reg =3D <0x10008000 0x80>;
> > + interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
> > + clocks =3D <&system_clk>, <&rtc_clk>;
> > + clock-names =3D "system-clk", "rtc-clk";
> > + };
> > +
> > + sysirq: interrupt-controller@10200100 {
> > + compatible =3D "mediatek,mt6572-sysirq",
> > + "mediatek,mt6577-sysirq";
>
>
> same; and reg goes after compatible.
>
> > + interrupt-controller;
> > + #interrupt-cells =3D <3>;
> > + interrupt-parent =3D <&gic>;
>
>
> are you sure that interrupt-parent is gic?

Other MT65xx devicetrees have GIC as parent for itself and SYSIRQ, so I ass=
ume.

>
> > + reg =3D <0x10200100 0x1c>;
> > + };
> > +
> > + gic: interrupt-controller@10211000 {
> > + compatible =3D "arm,cortex-a7-gic";
>
>
> reg here.
>
> > + interrupt-controller;
> > + #interrupt-cells =3D <3>;
> > + interrupt-parent =3D <&gic>;
>
>
> are you sure that the interrupt parent isn't sysirq here? :-)

not really, downstream has no mentions about SYSIRQ or its' address

>
> > + reg =3D <0x10211000 0x1000>,
> > + <0x10212000 0x2000>,
> > + <0x10214000 0x2000>,
> > + <0x10216000 0x2000>;
> > + };
> > +
> > + uart0: serial@11005000 {
> > + compatible =3D "mediatek,mt6572-uart",
> > + "mediatek,mt6577-uart";
>
>
> fits in one line
>
> > + reg =3D <0x11005000 0x400>;
> > + interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
> > + clocks =3D <&uart_clk>;
>
>
> clock-names =3D .....
>
> > + status =3D "disabled";
> > + };
> > +
> > + uart1: serial@11006000 {
> > + compatible =3D "mediatek,mt6572-uart",
>
>
> ...again.
>
> > + "mediatek,mt6577-uart";
> > + reg =3D <0x11006000 0x400>;
> > + interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> > + clocks =3D <&uart_clk>;
> > + status =3D "disabled";
> > + };
> > +};
>
>
> Cheers,
> Angelo

thanks for suggestions, applied.


Sincerely,
Max

