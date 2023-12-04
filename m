Return-Path: <linux-watchdog+bounces-122-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D50803C07
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 18:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83451C20ABA
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 17:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827012EAEE;
	Mon,  4 Dec 2023 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWvMOGEu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F66119
	for <linux-watchdog@vger.kernel.org>; Mon,  4 Dec 2023 09:51:47 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c09f5a7cfso16494485e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 04 Dec 2023 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701712306; x=1702317106; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0xgC+ecJ/aYtY2CvVGurydBuFpa6kzX9Y0C6MFp5IkI=;
        b=eWvMOGEudiafOX/lUDK0Cp7kzPnaQUBQSUkzISJLBEFQEOITgBRJXCeShENLgqRcwX
         iNELsPNVTx2I1F8/lvE7sAgifmAbzu2MOaPJV5eKCkF8OxDoWukCpfpchUK2f888X9QO
         TLXJomtduvblUgRg6JW5wzKhL7s60epsYiXtIZFVk+Viea5iErOcvAgrsGEUB5f2f00T
         kcdXr6WYIzyqjwJMkNrMdeFoYI2v22ylO4MtOqtNGD9IuIYJyuREkxlAAeC4Rk9x/XTC
         QRf9lvrglZ8PYTO6TNzhZd6Af8n5a5cV7a6Uduck5xe+Pc3zG/fE00RF+2mkquBzjg35
         gbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701712306; x=1702317106;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xgC+ecJ/aYtY2CvVGurydBuFpa6kzX9Y0C6MFp5IkI=;
        b=PLxmetRRx8WZwyBAanRY+9S4/7yYT2m+wLRoEZwf0D6XJNdwHt95o9s/IgimaPKRLl
         ujw9spex766GkFG1Qm1kFytfU5wGPkm3ItAL+YVc3YbDRf17+GivFqejD6lx6nZ7xBhZ
         0BVujVNiFpv2MMgDFFSbWGq6LAoSP2mSwF0PZwE1xHcfhvt3PxfuX/kKdKnec703BnfB
         lwz3Irc7mNg4DO60lQ/FjmRnYLOXNz/w25sa4Rb6Xv64O1BehAewFMgz7Fzf5J/0Vvva
         SuHBw0OpGQPD4X4SFf/hpwJ5qScc1M43ap4jF5s7mYvIQ2PJny+aSWPVL3GKpxxM9DjP
         v2Iw==
X-Gm-Message-State: AOJu0Yy4OfE2h25AEdtIemC69P9nLxe+3lEYRb4FN2okDqTJKNfnNLTn
	DQWohzvLgtUXqnRcjFOuXrn/Ig==
X-Google-Smtp-Source: AGHT+IHg/7kveHuWDixjU8ouQ7zKYnDBAtnudtwu6W88VoQ8XBhhZ2T41NB6zJGoDZ53CE5QrdWRqQ==
X-Received: by 2002:a7b:cd07:0:b0:40b:5e59:ea0b with SMTP id f7-20020a7bcd07000000b0040b5e59ea0bmr2920644wmj.170.1701712306207;
        Mon, 04 Dec 2023 09:51:46 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b004094d4292aesm15918570wmg.18.2023.12.04.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 09:51:45 -0800 (PST)
Message-ID: <20bf05b9d9ccc5c11ef17500ac7a97c46dd46a9a.camel@linaro.org>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Mon, 04 Dec 2023 17:51:43 +0000
In-Reply-To: <20231201160925.3136868-13-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
	 <20231201160925.3136868-13-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-12-01 at 16:09 +0000, Peter Griffin wrote:
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>=20
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>=20
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0drivers/clk/samsung/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
1 +
> =C2=A0drivers/clk/samsung/clk-gs101.c | 2495 ++++++++++++++++++++++++++++=
+++
> =C2=A02 files changed, 2496 insertions(+)
> =C2=A0create mode 100644 drivers/clk/samsung/clk-gs101.c
>=20
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index ebbeacabe88f..3056944a5a54 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7.=
o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7885.o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos850.o
> =C2=A0obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynosautov9.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-gs101.o
> =C2=A0obj-$(CONFIG_S3C64XX_COMMON_CLK)	+=3D clk-s3c64xx.o
> =C2=A0obj-$(CONFIG_S5PV210_COMMON_CLK)	+=3D clk-s5pv210.o clk-s5pv210-aud=
ss.o
> =C2=A0obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+=3D clk-fsd.o
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> new file mode 100644
> index 000000000000..6bd233a7ab63
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -0,0 +1,2495 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Common Clock Framework support for GS101.
> + */
> [...]
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI0 */
> +PNAME(mout_cmu_hsi0_usb31drd_p)	=3D { "oscclk", "dout_shared2_div2" };
> +
> +PNAME(mout_cmu_hsi0_bus_p)	=3D { "dout_shared0_div4", "dout_shared1_div4=
",
> +				=C2=A0=C2=A0=C2=A0 "dout_shared2_div2", "dout_shared3_div2",
> +				=C2=A0=C2=A0=C2=A0 "fout_spare_pll" };

This should also be updated....
=20
> [...]
> +	MUX(CLK_MOUT_HSI0_BUS, "mout_cmu_hsi0_bus", mout_cmu_hsi0_bus_p,
> +	=C2=A0=C2=A0=C2=A0 CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS, 0, 3),

...because we have 8 possibilities now.

(I didn't check the other parents, but you mentioned you updated field widt=
hs
in other registers, too, so maybe need to double check the parent strings a=
s well)


Cheers,
Andre'


