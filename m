Return-Path: <linux-watchdog+bounces-96-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5F8019AF
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Dec 2023 02:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9A8BB21080
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Dec 2023 01:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3D817C4;
	Sat,  2 Dec 2023 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8ylR2w0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E8710F3
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Dec 2023 17:54:31 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-58a42c3cbb8so1675950eaf.3
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Dec 2023 17:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701482070; x=1702086870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+ToaTrjwyD5gojSHi1UUMNsPCnQ3LFAWQitPm0svnY=;
        b=R8ylR2w0RhcO2aFWL2JOM3dkLq2XKDonlyENBZegeSOabVlhG/exab2Pmw3SBrydVd
         LmFSpJM7qlQnBZacQlIVECFgvxgugBeMetwwBplmFzxAJZRk5G7nBsllrruLP75U78Q4
         4vj8QtdA3AavnmEX5062jpKOGjHkJ4uWF3erQdMccADCf0gTrPcJ/SO8yYcv6x1PKrTw
         elqgh1201IcRn4lcJUruh/WmrPeYADgHr+vWX2Cez8hrzZplLWZduFasjvDxO+1UraGS
         VXVVWAx5Z986VdMyyZM1Yv4UlyFyri4kemtPEu9mpPVHE7jq1ti5I5KOYcMnbCAF/x57
         UbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701482070; x=1702086870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+ToaTrjwyD5gojSHi1UUMNsPCnQ3LFAWQitPm0svnY=;
        b=jT5DhWoLsbRR2qbwwSYK20S0P/rrwhWGSyjnBNwXR/89La/CX8dX4dLyGyDVWmJDSI
         MzTnyNDdPv80iNihzGdMW7j2J/ymX5DolIt04zhEhxbwsBp4Pz7pO/H4wlMNR1n6YO1X
         n3Ye+W9o94ReVbVlcpTd41SiX1uZXxJLBoF9Z1OuMYi8ZOniZN5L2kaDM3L0ooTXbzm+
         yO+vJ6PN/WTLks0yktgfmKDhdxhqHE9OeguTk5qOE8C/MyzVBWi+kzxB8vgFjPOw+yMD
         u/I5NjmvfWwAG4qByyrO3CqEbsqs7IiDmTHB+bvZkUls6oqMb77SEG17sILN23qDVHdA
         gAag==
X-Gm-Message-State: AOJu0YxV9krd+qfY4+54NEoFSg7yYFqREipHaFjj0UFDu9HflfQASO9o
	CPrSaxwBGxtzp8igLHdA88SyJtL9U6Wki7qzusoXqg==
X-Google-Smtp-Source: AGHT+IHDJSQwASBdDewXp1sesbiMTvOPdKnFiep8hR+pKFK6KWB8YrbLtRrDfaUPzaNTnrSXc0N1htNLcmIVpm6E+4s=
X-Received: by 2002:a05:6358:4194:b0:168:e737:6b25 with SMTP id
 w20-20020a056358419400b00168e7376b25mr627751rwc.20.1701482070315; Fri, 01 Dec
 2023 17:54:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-19-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-19-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 19:54:18 -0600
Message-ID: <CAPLW+4ki_GUAnor4sTanXFLzKrAB9JpxK98PED1fUY-MLCzUdA@mail.gmail.com>
Subject: Re: [PATCH v5 18/20] arm64: dts: exynos: google: Add initial Google
 gs101 SoC support
To: Peter Griffin <peter.griffin@linaro.org>, krzysztof.kozlowski+dt@linaro.org
Cc: robh+dt@kernel.org, mturquette@baylibre.com, conor+dt@kernel.org, 
	sboyd@kernel.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, 
	linus.walleij@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> phones. It features:
> * 4xA55 little cluster
> * 2xA76 Mid cluster
> * 2xX1 Big cluster
>
> This commit adds the basic device tree for gs101 (SoC).
> Further platform support will be added over time.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../boot/dts/exynos/google/gs101-pinctrl.dtsi | 1250 +++++++++++++++++
>  .../boot/dts/exynos/google/gs101-pinctrl.h    |   33 +
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  476 +++++++
>  3 files changed, 1759 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101.dtsi
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi b/arch/=
arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
> new file mode 100644
> index 000000000000..8c0f0cf75edb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
> @@ -0,0 +1,1250 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GS101 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright 2019-2023 Google LLC
> + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> + */
> +
> +#include "gs101-pinctrl.h"
> +
> +&pinctrl_gpio_alive {
> +       gpa0: gpa0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa1: gpa1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa2: gpa2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa3: gpa3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa4: gpa4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa5: gpa5-gpio-bank  {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa9: gpa9-gpio-bank  {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa10: gpa10-gpio-bank  {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       uart15_bus: uart15-bus-pins {
> +               samsung,pins =3D "gpa2-3", "gpa2-4";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       uart16_bus: uart16-bus-pins {
> +               samsung,pins =3D "gpa3-0", "gpa3-1", "gpa3-2", "gpa3-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       uart17_bus: uart17-bus-pins {
> +               samsung,pins =3D "gpa4-0", "gpa4-1", "gpa4-2", "gpa4-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi15_bus: spi15-bus-pins {
> +               samsung,pins =3D "gpa4-0", "gpa4-1", "gpa4-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi15_cs: spi15-cs-pins {
> +               samsung,pins =3D "gpa4-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&pinctrl_far_alive {
> +       gpa6: gpa6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa7: gpa7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa8: gpa8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +
> +       gpa11: gpa11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH 0>;
> +       };
> +};
> +
> +&pinctrl_gsacore {
> +       gps0: gps0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gps1: gps1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gps2: gps2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +};
> +
> +&pinctrl_gsactrl {
> +       gps3: gps3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +};
> +
> +&pinctrl_hsi1 {
> +       gph0: gph0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gph1: gph1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       pcie0_clkreq: pcie0-clkreq-pins{
> +               samsung,pins =3D "gph0-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_UP>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_UP>;
> +       };
> +
> +       pcie0_perst: pcie0-perst-pins {
> +               samsung,pins =3D "gph0-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +       };
> +};
> +
> +&pinctrl_hsi2 {
> +       gph2: gph2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gph3: gph3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gph4: gph4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       sd2_clk: sd2-clk-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_cmd: sd2-cmd-pins {
> +               samsung,pins =3D "gph4-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_UP>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_bus1: sd2-bus-width1-pins {
> +               samsung,pins =3D "gph4-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_UP>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_bus4: sd2-bus-width4-pins {
> +               samsung,pins =3D "gph4-3", "gph4-4", "gph4-5";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_UP>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_7_5_MA>;
> +       };
> +
> +       sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
> +               samsung,pins =3D "gph4-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +       };
> +
> +       ufs_rst_n: ufs-rst-n-pins {
> +               samsung,pins =3D "gph3-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       ufs_refclk_out: ufs-refclk-out-pins {
> +               samsung,pins =3D "gph3-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       pcie1_clkreq: pcie1-clkreq-pins {
> +               samsung,pins =3D "gph2-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_UP>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_UP>;
> +       };
> +
> +       pcie1_perst: pcie1-perst-pins {
> +               samsung,pins =3D "gph2-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_10_MA>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +       };
> +};
> +
> +&pinctrl_peric0 {
> +       gpp0: gpp0-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp1: gpp1-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp2: gpp2-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp3: gpp3-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp4: gpp4-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp5: gpp5-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp6: gpp6-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp7: gpp7-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp8: gpp8-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp9: gpp9-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp10: gpp10-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp11: gpp11-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp12: gpp12-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp13: gpp13-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp14: gpp14-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp15: gpp15-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp16: gpp16-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp17: gpp17-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp18: gpp18-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp19: gpp19-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       /* USI_PERIC0_UART_DBG */
> +       uart0_bus: uart0-bus-pins {
> +               samsung,pins =3D "gpp1-2", "gpp1-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       disp_te_pri_on: disp-te-pri-on-pins {
> +               samsung,pins =3D "gpp0-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_EINT>;
> +       };
> +
> +       disp_te_pri_off: disp-te-pri-off-pins {
> +               samsung,pins =3D "gpp0-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_INPUT>;
> +       };
> +
> +       disp_te_sec_on: disp-te-sec-on-pins {
> +               samsung,pins =3D "gpp0-4";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_EINT>;
> +       };
> +
> +       disp_te_sec_off: disp-te-sec-off-pins {
> +               samsung,pins =3D "gpp0-4";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_INPUT>;
> +       };
> +
> +       sensor_mclk1_out: sensor-mclk1-out-pins {
> +               samsung,pins =3D "gpp3-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk1_fn: sensor-mclk1-fn-pins {
> +               samsung,pins =3D "gpp3-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk2_out: sensor-mclk2-out-pins {
> +               samsung,pins =3D "gpp5-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk2_fn: sensor-mclk2-fn-pins {
> +               samsung,pins =3D "gpp5-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk3_out: sensor-mclk3-out-pins {
> +               samsung,pins =3D "gpp7-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk3_fn: sensor-mclk3-fn-pins {
> +               samsung,pins =3D "gpp7-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk4_out: sensor-mclk4-out-pins {
> +               samsung,pins =3D "gpp9-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk4_fn: sensor-mclk4-fn-pins {
> +               samsung,pins =3D "gpp9-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk5_out: sensor-mclk5-out-pins {
> +               samsung,pins =3D "gpp11-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk5_fn: sensor-mclk5-fn-pins {
> +               samsung,pins =3D "gpp11-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk6_out: sensor-mclk6-out-pins {
> +               samsung,pins =3D "gpp13-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk6_fn: sensor-mclk6-fn-pins {
> +               samsung,pins =3D "gpp13-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk7_out: sensor-mclk7-out-pins {
> +               samsung,pins =3D "gpp15-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk7_fn: sensor-mclk7-fn-pins {
> +               samsung,pins =3D "gpp15-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk8_out: sensor-mclk8-out-pins {
> +               samsung,pins =3D "gpp17-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_DOWN>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       sensor_mclk8_fn: sensor-mclk8-fn-pins {
> +               samsung,pins =3D "gpp17-0";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_5_MA>;
> +       };
> +
> +       hsi2c14_bus: hsi2c14-bus-pins {
> +               samsung,pins =3D "gpp18-0", "gpp18-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart14_bus_single: uart14-bus-pins {
> +               samsung,pins =3D "gpp18-0", "gpp18-1",
> +                              "gpp18-2", "gpp18-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi14_bus: spi14-bus-pins {
> +               samsung,pins =3D "gpp18-0", "gpp18-1", "gpp18-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi14_cs: spi14-cs-pins {
> +               samsung,pins =3D "gpp18-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi14_cs_func: spi14-cs-func-pins {
> +               samsung,pins =3D "gpp18-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c8_bus: hsi2c8-bus-pins {
> +               samsung,pins =3D "gpp16-0", "gpp16-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PDN_OUT0>;
> +       };
> +
> +       uart8_bus_single: uart8-bus-pins {
> +               samsung,pins =3D "gpp16-0", "gpp16-1", "gpp16-2",
> +                              "gpp16-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi8_bus: spi8-bus-pins {
> +               samsung,pins =3D "gpp16-0", "gpp16-1", "gpp16-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi8_cs: spi8-cs-pins {
> +               samsung,pins =3D "gpp16-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi8_cs_func: spi8-cs-func-pins {
> +               samsung,pins =3D "gpp16-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c7_bus: hsi2c7-bus-pins {
> +               samsung,pins =3D "gpp14-0", "gpp14-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart7_bus_single: uart7-bus-pins {
> +               samsung,pins =3D "gpp14-0", "gpp14-1",
> +                              "gpp14-2", "gpp14-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi7_bus: spi7-bus-pins {
> +               samsung,pins =3D "gpp14-0", "gpp14-1", "gpp14-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi7_cs: spi7-cs-pins {
> +               samsung,pins =3D "gpp14-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi7_cs_func: spi7-cs-func-pins {
> +               samsung,pins =3D "gpp14-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c6_bus: hsi2c6-bus-pins {
> +               samsung,pins =3D "gpp12-0", "gpp12-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart6_bus_single: uart6-bus-pins {
> +               samsung,pins =3D "gpp12-0", "gpp12-1",
> +                              "gpp12-2", "gpp12-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi6_bus: spi6-bus-pins {
> +               samsung,pins =3D "gpp12-0", "gpp12-1", "gpp12-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi6_cs: spi6-cs-pins {
> +               samsung,pins =3D "gpp12-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi6_cs_func: spi6-cs-func-pins {
> +               samsung,pins =3D "gpp12-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c5_bus: hsi2c5-bus-pins {
> +               samsung,pins =3D "gpp10-0", "gpp10-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart5_bus_single: uart5-bus-pins {
> +               samsung,pins =3D "gpp10-0", "gpp10-1",
> +                              "gpp10-2", "gpp10-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi5_bus: spi5-bus-pins {
> +               samsung,pins =3D "gpp10-0", "gpp10-1", "gpp10-2";
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi5_cs_func: spi5-cs-func-pins {
> +               samsung,pins =3D "gpp10-3";
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-con-pdn =3D <GS101_PIN_PDN_PREV>;
> +               samsung,pin-pud-pdn =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       hsi2c4_bus: hsi2c4-bus-pins {
> +               samsung,pins =3D "gpp8-0", "gpp8-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart4_bus_single: uart4-bus-pins {
> +               samsung,pins =3D "gpp8-0", "gpp8-1",
> +                              "gpp8-2", "gpp8-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi4_bus: spi4-bus-pins {
> +               samsung,pins =3D "gpp8-0", "gpp8-1", "gpp8-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi4_cs: spi4-cs-pins {
> +               samsung,pins =3D "gpp8-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi4_cs_func: spi4-cs-func-pins {
> +               samsung,pins =3D "gpp8-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c3_bus: hsi2c3-bus-pins {
> +               samsung,pins =3D "gpp6-0", "gpp6-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart3_bus_single: uart3-bus-pins {
> +               samsung,pins =3D "gpp6-0", "gpp6-1",
> +                              "gpp6-2", "gpp6-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi3_bus: spi3-bus-pins {
> +               samsung,pins =3D "gpp6-0", "gpp6-1", "gpp6-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi3_cs: spi3-cs-pins {
> +               samsung,pins =3D "gpp6-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi3_cs_func: spi3-cs-func-pins {
> +               samsung,pins =3D "gpp6-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c2_bus: hsi2c2-bus-pins {
> +               samsung,pins =3D "gpp4-0", "gpp4-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart2_bus_single: uart2-bus-pins {
> +               samsung,pins =3D "gpp4-0", "gpp4-1",
> +                              "gpp4-2", "gpp4-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi2_bus: spi2-bus-pins {
> +               samsung,pins =3D "gpp4-0", "gpp4-1", "gpp4-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi2_cs: spi2-cs-pins {
> +               samsung,pins =3D "gpp4-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi2_cs_func: spi2-cs-func-pins {
> +               samsung,pins =3D "gpp4-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c1_bus: hsi2c1-bus-pins {
> +               samsung,pins =3D "gpp2-0", "gpp2-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart1_bus_single: uart1-bus-pins {
> +               samsung,pins =3D "gpp2-0", "gpp2-1",
> +                              "gpp2-2", "gpp2-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi1_bus: spi1-bus-pins {
> +               samsung,pins =3D "gpp2-0", "gpp2-1", "gpp2-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi1_cs: spi1-cs-pins {
> +               samsung,pins =3D "gpp2-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi1_cs_func: spi1-cs-func-pins {
> +               samsung,pins =3D "gpp2-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&pinctrl_peric1 {
> +       gpp20: gpp20-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp21: gpp21-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp22: gpp22-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp23: gpp23-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp24: gpp24-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp25: gpp25-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp26: gpp26-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       gpp27: gpp27-gpio-bank {
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +       };
> +
> +       hsi2c13_bus: hsi2c13-bus-pins  {
> +               samsung,pins =3D "gpp25-0", "gpp25-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart13_bus_single: uart13-bus-pins {
> +               samsung,pins =3D "gpp25-0", "gpp25-1",
> +                              "gpp25-2", "gpp25-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi13_bus: spi13-bus-pins {
> +               samsung,pins =3D "gpp25-0", "gpp25-1", "gpp25-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi13_cs: spi13-cs-pins {
> +               samsung,pins =3D "gpp25-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi13_cs_func: spi13-cs-func-pins {
> +               samsung,pins =3D "gpp25-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c12_bus: hsi2c12-bus-pins {
> +               samsung,pins =3D "gpp23-4", "gpp23-5";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart12_bus_single: uart12-bus-pins {
> +               samsung,pins =3D "gpp23-4", "gpp23-5",
> +                              "gpp23-6", "gpp23-7";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi12_bus: spi12-bus-pins {
> +               samsung,pins =3D "gpp23-4", "gpp23-5", "gpp23-6";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi14_cs2: spi14-cs2-pins {
> +               samsung,pins =3D "gpp23-6";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi12_cs: spi12-cs-pins {
> +               samsung,pins =3D "gpp23-7";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi12_cs_func: spi12-cs-func-pins {
> +               samsung,pins =3D "gpp23-7";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c11_bus: hsi2c11-bus-pins {
> +               samsung,pins =3D "gpp23-0", "gpp23-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart11_bus_single: uart11-bus-pins {
> +               samsung,pins =3D "gpp23-0", "gpp23-1",
> +                              "gpp23-2", "gpp23-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi11_bus: spi11-bus-pins {
> +               samsung,pins =3D "gpp23-0", "gpp23-1", "gpp23-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi11_cs: spi11-cs-pins {
> +               samsung,pins =3D "gpp23-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi11_cs_func: spi11-cs-func-pins {
> +               samsung,pins =3D "gpp23-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c10_bus: hsi2c10-bus-pins {
> +               samsung,pins =3D "gpp21-0", "gpp21-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart10_bus_single: uart10-bus-pins {
> +               samsung,pins =3D "gpp21-0", "gpp21-1",
> +                              "gpp21-2", "gpp21-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi10_bus: spi10-bus-pins {
> +               samsung,pins =3D "gpp21-0", "gpp21-1", "gpp21-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi10_cs: spi10-cs-pins {
> +               samsung,pins =3D "gpp21-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi10_cs_func: spi10-cs-func-pins {
> +               samsung,pins =3D "gpp21-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c9_bus: hsi2c9-bus-pins {
> +               samsung,pins =3D "gpp20-4", "gpp20-5";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart9_bus_single: uart9-bus-pins {
> +               samsung,pins =3D "gpp20-4", "gpp20-5",
> +                              "gpp20-6", "gpp20-7";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi9_bus: spi9-bus-pins {
> +               samsung,pins =3D "gpp20-4", "gpp20-5", "gpp20-6";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi9_cs: spi9-cs-pins {
> +               samsung,pins =3D "gpp20-7";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi9_cs_func: spi9-cs-func-pins {
> +               samsung,pins =3D "gpp20-7";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_2>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       hsi2c0_bus: hsi2c0-bus-pins {
> +               samsung,pins =3D "gpp20-0", "gpp20-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       uart0_bus_single: uart0-bus-pins {
> +               samsung,pins =3D "gpp20-0", "gpp20-1",
> +                              "gpp20-2", "gpp20-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +       };
> +
> +       spi0_bus: spi0-bus-pins {
> +               samsung,pins =3D "gpp20-0", "gpp20-1", "gpp20-2";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi0_cs: spi0-cs-pins {
> +               samsung,pins =3D "gpp20-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_OUTPUT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       spi0_cs_func: spi0-cs-func-pins {
> +               samsung,pins =3D "gpp20-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_3>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +

Nitpick: this empty line is not needed.


> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h b/arch/arm=
64/boot/dts/exynos/google/gs101-pinctrl.h
> new file mode 100644
> index 000000000000..853505e45b60
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Pinctrl binding constants for GS101
> + *
> + * Copyright (c) 2020-2023 Google, LLC.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_GS101_H__
> +#define __DT_BINDINGS_PINCTRL_GS101_H__
> +
> +#define GS101_PIN_PULL_NONE            0
> +#define GS101_PIN_PULL_DOWN            1
> +#define GS101_PIN_PULL_UP              3
> +
> +/* Pin function in power down mode */
> +#define GS101_PIN_PDN_OUT0             0
> +#define GS101_PIN_PDN_OUT1             1
> +#define GS101_PIN_PDN_INPUT            2
> +#define GS101_PIN_PDN_PREV             3
> +
> +/* GS101 drive strengths */
> +#define GS101_PIN_DRV_2_5_MA           0
> +#define GS101_PIN_DRV_5_MA             1
> +#define GS101_PIN_DRV_7_5_MA           2
> +#define GS101_PIN_DRV_10_MA            3
> +
> +#define GS101_PIN_FUNC_INPUT           0
> +#define GS101_PIN_FUNC_OUTPUT          1
> +#define GS101_PIN_FUNC_2               2
> +#define GS101_PIN_FUNC_3               3
> +#define GS101_PIN_FUNC_EINT            0xf
> +

Still feels fishy to me that it was decided to have this file instead
of re-using existing Exynos constants. For example, in Exynos850 I
used common constants and it was ok, but it's not ok for this SoC,
althought they look *identical* in a sense of pinctrl. And all those
constants already exist, also identical. So I wonder why something
like this shouldn't be done for Exynos850 as well. But ok.

> +#endif /* __DT_BINDINGS_PINCTRL_GS101_H__ */
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> new file mode 100644
> index 000000000000..40f6654a23f2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -0,0 +1,476 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GS101 SoC
> + *
> + * Copyright 2019-2023 Google LLC
> + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> + */
> +
> +#include <dt-bindings/clock/google,gs101.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
> +
> +/ {
> +       compatible =3D "google,gs101";
> +       #address-cells =3D <2>;
> +       #size-cells =3D <1>;
> +
> +       interrupt-parent =3D <&gic>;
> +
> +       aliases {
> +               pinctrl0 =3D &pinctrl_gpio_alive;
> +               pinctrl1 =3D &pinctrl_far_alive;
> +               pinctrl2 =3D &pinctrl_gsacore;
> +               pinctrl3 =3D &pinctrl_gsactrl;
> +               pinctrl4 =3D &pinctrl_peric0;
> +               pinctrl5 =3D &pinctrl_peric1;
> +               pinctrl6 =3D &pinctrl_hsi1;
> +               pinctrl7 =3D &pinctrl_hsi2;
> +               serial0 =3D &serial_0;

Please check commit f4324583cd4d ("arm64: dts: exynos: move aliases to
board in Exynos850"). At least for Exynos850 the serial alias was
moved to the board dts by Krzysztof.

> +       };
> +
> +       pmu-0 {
> +               compatible =3D "arm,cortex-a55-pmu";
> +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluste=
r0>;
> +       };
> +
> +       pmu-1 {
> +               compatible =3D "arm,cortex-a76-pmu";
> +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluste=
r1>;
> +       };
> +
> +       pmu-2 {
> +               compatible =3D "arm,cortex-x1-pmu";
> +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluste=
r2>;
> +       };
> +
> +       pmu-3 {
> +               compatible =3D "arm,dsu-pmu";
> +               interrupts =3D <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH 0>;
> +               cpus =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> +                      <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +       };
> +
> +       /* TODO replace with CCF clock */
> +       dummy_clk: oscillator {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <12345>;
> +               clock-output-names =3D "pclk";
> +       };

Don't you already have real USI/UART clocks implemented in your clock drive=
r?

> +
> +       cpus {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu =3D <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu =3D <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu =3D <&cpu3>;
> +                               };
> +                       };
> +
> +                       cluster1 {
> +                               core0 {
> +                                       cpu =3D <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu5>;
> +                               };
> +                       };
> +
> +                       cluster2 {
> +                               core0 {
> +                                       cpu =3D <&cpu6>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a55";
> +                       reg =3D <0x0000>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a55";
> +                       reg =3D <0x0100>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a55";
> +                       reg =3D <0x0200>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a55";
> +                       reg =3D <0x0300>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ANANKE_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <250>;
> +                       dynamic-power-coefficient =3D <70>;
> +               };
> +
> +               cpu4: cpu@400 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a76";
> +                       reg =3D <0x0400>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ENYO_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <620>;
> +                       dynamic-power-coefficient =3D <284>;
> +               };
> +
> +               cpu5: cpu@500 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a76";
> +                       reg =3D <0x0500>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&ENYO_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <620>;
> +                       dynamic-power-coefficient =3D <284>;
> +               };
> +
> +               cpu6: cpu@600 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-x1";
> +                       reg =3D <0x0600>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&HERA_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <650>;
> +               };
> +
> +               cpu7: cpu@700 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-x1";
> +                       reg =3D <0x0700>;
> +                       enable-method =3D "psci";
> +                       cpu-idle-states =3D  <&HERA_CPU_SLEEP>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <650>;
> +               };
> +
> +               idle-states {
> +                       entry-method =3D "psci";
> +
> +                       ANANKE_CPU_SLEEP: cpu-ananke-sleep {
> +                               idle-state-name =3D "c2";
> +                               compatible =3D "arm,idle-state";
> +                               arm,psci-suspend-param =3D <0x0010000>;
> +                               entry-latency-us =3D <70>;
> +                               exit-latency-us =3D <160>;
> +                               min-residency-us =3D <2000>;
> +                       };
> +
> +                       ENYO_CPU_SLEEP: cpu-enyo-sleep {
> +                               idle-state-name =3D "c2";
> +                               compatible =3D "arm,idle-state";
> +                               arm,psci-suspend-param =3D <0x0010000>;
> +                               entry-latency-us =3D <150>;
> +                               exit-latency-us =3D <190>;
> +                               min-residency-us =3D <2500>;
> +                       };
> +
> +                       HERA_CPU_SLEEP: cpu-hera-sleep {
> +                               idle-state-name =3D "c2";
> +                               compatible =3D "arm,idle-state";
> +                               arm,psci-suspend-param =3D <0x0010000>;
> +                               entry-latency-us =3D <235>;
> +                               exit-latency-us =3D <220>;
> +                               min-residency-us =3D <3500>;
> +                       };
> +               };
> +       };
> +
> +       /* ect node is required to be present by bootloader */
> +       ect {
> +       };
> +
> +       ext_24_5m: clock-1 {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "oscclk";
> +       };
> +
> +       ext_200m: clock-2 {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "ext-200m";
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-1.0";
> +               method =3D "smc";
> +       };
> +
> +       reserved_memory: reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               gsa_reserved_protected: gsa@90200000 {
> +                       reg =3D <0x0 0x90200000 0x400000>;
> +                       no-map;
> +               };
> +
> +               tpu_fw_reserved: tpu-fw@93000000 {
> +                       reg =3D <0x0 0x93000000 0x1000000>;
> +                       no-map;
> +               };
> +
> +               aoc_reserve: aoc@94000000 {
> +                       reg =3D <0x0 0x94000000 0x03000000>;
> +                       no-map;
> +               };
> +
> +               abl_reserved: abl@f8800000 {
> +                       reg =3D <0x0 0xf8800000 0x02000000>;
> +                       no-map;
> +               };
> +
> +               dss_log_reserved: dss-log-reserved@fd3f0000 {
> +                       reg =3D <0x0 0xfd3f0000 0x0000e000>;
> +                       no-map;
> +               };
> +
> +               debug_kinfo_reserved: debug-kinfo-reserved@fd3fe000 {
> +                       reg =3D <0x0 0xfd3fe000 0x00001000>;
> +                       no-map;
> +               };
> +
> +               bldr_log_reserved: bldr-log-reserved@fd800000 {
> +                       reg =3D <0x0 0xfd800000 0x00100000>;
> +                       no-map;
> +               };
> +
> +               bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
> +                       reg =3D <0x0 0xfd900000 0x00002000>;
> +                       no-map;
> +               };
> +       };
> +
> +       timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupts =3D
> +                  <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>,
> +                  <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>,
> +                  <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>,
> +                  <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_L=
OW) 0>;
> +               clock-frequency =3D <24576000>;
> +       };
> +
> +       soc: soc@0 {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges =3D <0x0 0x0 0x0 0x40000000>;
> +
> +               cmu_misc: clock-controller@10010000 {
> +                       compatible =3D "google,gs101-cmu-misc";
> +                       reg =3D <0x10010000 0x8000>;
> +                       #clock-cells =3D <1>;
> +                       clocks =3D  <&ext_24_5m>, <&cmu_top CLK_DOUT_MISC=
_BUS>;
> +                       clock-names =3D "oscclk", "dout_cmu_misc_bus";
> +               };
> +
> +               watchdog_cl0: watchdog@10060000 {
> +                       compatible =3D "google,gs101-wdt";
> +                       reg =3D <0x10060000 0x100>;
> +                       interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       clocks =3D
> +                         <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0_IPCLKPORT=
_PCLK>,
> +                         <&ext_24_5m>;
> +                       clock-names =3D "watchdog", "watchdog_src";
> +                       samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
> +                       samsung,cluster-index =3D <0>;
> +                       status =3D "disabled";
> +               };

Krzysztof, can you please advice which scheme is preferred right now:
sorting by name or by address? I saw your patch for dts style doc, but
just want to know the current state of affairs.

> +
> +               watchdog_cl1: watchdog@10070000 {
> +                       compatible =3D "google,gs101-wdt";
> +                       reg =3D <0x10070000 0x100>;
> +                       interrupts =3D <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       clocks =3D
> +                         <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER1_IPCLKPORT=
_PCLK>,
> +                         <&ext_24_5m>;
> +                       clock-names =3D "watchdog", "watchdog_src";
> +                       samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
> +                       samsung,cluster-index =3D <1>;
> +                       status =3D "disabled";
> +               };
> +
> +               gic: interrupt-controller@10400000 {
> +                       compatible =3D "arm,gic-v3";
> +                       #interrupt-cells =3D <4>;
> +                       interrupt-controller;
> +                       reg =3D <0x10400000 0x10000>, /* GICD */
> +                             <0x10440000 0x100000>;/* GICR * 8 */
> +                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +                       ppi-partitions {
> +                               ppi_cluster0: interrupt-partition-0 {
> +                                       affinity =3D <&cpu0 &cpu1 &cpu2 &=
cpu3>;
> +                               };
> +
> +                               ppi_cluster1: interrupt-partition-1 {
> +                                       affinity =3D <&cpu4 &cpu5>;
> +                               };
> +
> +                               ppi_cluster2: interrupt-partition-2 {
> +                                       affinity =3D <&cpu6 &cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               sysreg_peric0: syscon@10820000 {
> +                       compatible =3D "google,gs101-peric0-sysreg", "sys=
con";
> +                       reg =3D <0x10820000 0x10000>;
> +               };
> +
> +               pinctrl_peric0: pinctrl@10840000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x10840000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +               };
> +
> +               usi_uart: usi@10a000c0 {
> +                       compatible =3D "google,gs101-usi",

I can't see this compatible in USI driver. Does it make sense to add it the=
re?

> +                                    "samsung,exynos850-usi";
> +                       reg =3D <0x10a000c0 0x20>;
> +                       samsung,sysreg =3D <&sysreg_peric0 0x1020>;
> +                       samsung,mode =3D <USI_V2_UART>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;
> +                       clocks =3D <&dummy_clk>, <&dummy_clk>;

The same concern as above. I think I saw those clocks already
implemented in gs101 clock driver.

> +                       clock-names =3D "pclk", "ipclk";
> +                       status =3D "disabled";
> +
> +                       serial_0: serial@10a00000 {
> +                               compatible =3D "google,gs101-uart";
> +                               reg =3D <0x10a00000 0xc0>;
> +                               reg-io-width =3D <4>;
> +                               samsung,uart-fifosize =3D <256>;
> +                               interrupts =3D <GIC_SPI 634
> +                                             IRQ_TYPE_LEVEL_HIGH 0>;
> +                               clocks =3D <&dummy_clk 0>, <&dummy_clk 0>=
;

Ditto.

> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               pinctrl_peric1: pinctrl@10c40000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x10C40000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +               };
> +
> +               sysreg_peric1: syscon@10c20000 {
> +                       compatible =3D "google,gs101-peric1-sysreg", "sys=
con";
> +                       reg =3D <0x10C20000 0x10000>;
> +               };
> +
> +               pinctrl_hsi1: pinctrl@11840000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x11840000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +               };
> +
> +               pinctrl_hsi2: pinctrl@14440000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x14440000 0x00001000>;
> +                       interrupts =3D <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +               };
> +
> +               cmu_apm: clock-controller@17400000 {
> +                       compatible =3D "google,gs101-cmu-apm";
> +                       reg =3D <0x17400000 0x8000>;
> +                       #clock-cells =3D <1>;
> +
> +                       clocks =3D <&ext_24_5m>;
> +                       clock-names =3D "oscclk";

Doesn't CMU_APM take any clocks from CMU_TOP?

> +               };
> +
> +               sysreg_apm: syscon@174204e0 {
> +                       compatible =3D "google,gs101-apm-sysreg", "syscon=
";
> +                       reg =3D <0x174204e0 0x1000>;
> +               };
> +
> +               pmu_system_controller: system-controller@17460000 {
> +                       compatible =3D "google,gs101-pmu", "syscon";
> +                       reg =3D <0x17460000 0x10000>;
> +               };

Just a suggestion: it might be relatively simple to add syscon-reboot
node in pmu_system_controller, and it might just work. One more
feature for free! :)

> +
> +               pinctrl_gpio_alive: pinctrl@174d0000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x174d0000 0x00001000>;
> +
> +                       wakeup-interrupt-controller {
> +                               compatible =3D "google,gs101-wakeup-eint"=
,
> +                                            "samsung,exynos850-wakeup-ei=
nt",
> +                                            "samsung,exynos7-wakeup-eint=
";
> +                       };
> +               };
> +
> +               pinctrl_far_alive: pinctrl@174e0000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x174e0000 0x00001000>;
> +
> +                       wakeup-interrupt-controller {
> +                               compatible =3D "google,gs101-wakeup-eint"=
,
> +                                            "samsung,exynos850-wakeup-ei=
nt",
> +                                            "samsung,exynos7-wakeup-eint=
";
> +                       };
> +               };
> +
> +               pinctrl_gsactrl: pinctrl@17940000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x17940000 0x00001000>;
> +               };
> +
> +               pinctrl_gsacore: pinctrl@17a80000 {
> +                       compatible =3D "google,gs101-pinctrl";
> +                       reg =3D <0x17a80000 0x00001000>;
> +               };
> +
> +               cmu_top: clock-controller@1e080000 {
> +                       compatible =3D "google,gs101-cmu-top";
> +                       reg =3D <0x1e080000 0x8000>;
> +                       #clock-cells =3D <1>;
> +
> +                       clocks =3D <&ext_24_5m>;
> +                       clock-names =3D "oscclk";
> +               };
> +       };
> +};
> +
> +#include "gs101-pinctrl.dtsi"
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>

