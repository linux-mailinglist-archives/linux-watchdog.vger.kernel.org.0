Return-Path: <linux-watchdog+bounces-171-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18780AEA5
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Dec 2023 22:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C42FA281AA1
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Dec 2023 21:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DE35733B;
	Fri,  8 Dec 2023 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRTtM8Hy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7814C172B
	for <linux-watchdog@vger.kernel.org>; Fri,  8 Dec 2023 13:14:33 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-67a338dfca7so14305346d6.2
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Dec 2023 13:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702070072; x=1702674872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMdZYz3DPUe4bdT/CXZ3OjIbw+BdLseGOOZQ+mLDsoY=;
        b=BRTtM8HyZ5oo26RBVqVnaW3H4dNEwvwuMf+/k9lwAuSiUTnsWtOgwS+NZ74gHzFQPl
         c3JxqVdVi+6KZAJq2mgSsWdF1+Nk4GyjYyL/YQHeup3LwJc/5Hw7tLRKHM7JbdrHNwEp
         pzjjtKICWNTqRya+iSwgtad2E0CcLE0lgZ79M0A/g2E/ZY9zui9IocEztLq38IIOZW5x
         J4f9K0ZeEIr3P/5zMaEtaDx+MbfW5lPwWoBcvsjoJuSrYk95tsfUw662AhPq3c5vBAXw
         VE0KOtTXNrKmqT1Mi1cKea8OORceEUpi/tlYsHVRd0N8/Lro1X/snnfWoTHp+HMBCDk/
         Xs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702070072; x=1702674872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMdZYz3DPUe4bdT/CXZ3OjIbw+BdLseGOOZQ+mLDsoY=;
        b=YnpgPNQhkBycqErw4huD3sSvXxxlHgRoouTNrCyHZDnzIqqgpGDMaS0+HhXO0WylXv
         y6HVUCvFw7/o4YXcGpV7C/hqx8aY3RHLdFyyBBts4IJFWxp86FGIhL0AjbYnfuWDPqkM
         CKIH/VwpSqd8+RieQ2S2Eu91bsY2d94T33PK4ZI6Dd673DFo7++wTA3iszGENLh29BOY
         mCoyG8ntwktnpDTdFlFo4QD8R2LODXY74eoXzfDezV3FC2hzCEBZcrySlBgCbqk+DIn/
         +ZdIcNy5h85xbFENaC1OKDmci2ziQARin6r83JWfE9kCD8Oa3oQ8jVcx+1ZDIkedbkS8
         IC4Q==
X-Gm-Message-State: AOJu0YxuwdrEaE+TlBHV7cTw1S13B6ANR2sHefdShBd34fGgWm9x7IVR
	S/jzQZXN7EfIzEsiMTOpOPUS31ma63VzO2vamFBAww==
X-Google-Smtp-Source: AGHT+IGpulKyZ3OIbS0DyP2qkU03il9CmjBCOxhzoGEpedDhT+htnC+NzAmQyXg4CgZlNXYQiSL6lZrAvMlkclzO+XA=
X-Received: by 2002:a05:6214:a91:b0:67a:a721:f304 with SMTP id
 ev17-20020a0562140a9100b0067aa721f304mr526927qvb.68.1702070072556; Fri, 08
 Dec 2023 13:14:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-13-peter.griffin@linaro.org> <5e9c0b1c5885775a7bc32ef59cb09a2a93d4cbe1.camel@linaro.org>
In-Reply-To: <5e9c0b1c5885775a7bc32ef59cb09a2a93d4cbe1.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 Dec 2023 21:14:21 +0000
Message-ID: <CADrjBPqAjqW27TvvT3BpEovOsouRedsnB49qdkkgSto=z0jM3Q@mail.gmail.com>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Tue, 5 Dec 2023 at 07:52, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Pete,
>
> On Fri, 2023-12-01 at 16:09 +0000, Peter Griffin wrote:
> > cmu_top is the top level clock management unit which contains PLLs, mux=
es,
> > dividers and gates that feed the other clock management units.
> >
> > cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> > APM module.
> >
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/Makefile    |    1 +
> >  drivers/clk/samsung/clk-gs101.c | 2495 +++++++++++++++++++++++++++++++
> >  2 files changed, 2496 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefil=
e
> > index ebbeacabe88f..3056944a5a54 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       +=3D clk-=
exynos7.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynos7885.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynos850.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynosautov9.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-gs101.o
> >  obj-$(CONFIG_S3C64XX_COMMON_CLK)     +=3D clk-s3c64xx.o
> >  obj-$(CONFIG_S5PV210_COMMON_CLK)     +=3D clk-s5pv210.o clk-s5pv210-au=
dss.o
> >  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)   +=3D clk-fsd.o
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > new file mode 100644
> > index 000000000000..6bd233a7ab63
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -0,0 +1,2495 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 Linaro Ltd.
> > + * Author: Peter Griffin <peter.griffin@linaro.org>
> > + *
> > + * Common Clock Framework support for GS101.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <dt-bindings/clock/google,gs101.h>
> > +
> > +#include "clk.h"
> > +#include "clk-exynos-arm64.h"
> > +
> > +/* NOTE: Must be equal to the last clock ID increased by one */
> > +#define TOP_NR_CLK   (CLK_GOUT_TPU_UART + 1)
> > +#define APM_NR_CLK   (CLK_APM_PLL_DIV16_APM + 1)
> > +#define MISC_NR_CLK  (CLK_GOUT_MISC_XIU_D_MISC_IPCLKPORT_ACLK + 1)
> > +
> > +/* ---- CMU_TOP ------------------------------------------------------=
------- */
> > +
> > [...]
> > +
> > +/* ---- CMU_APM ------------------------------------------------------=
------- */
> > [..]
> > +
> > +/* ---- CMU_MISC -----------------------------------------------------=
-------- */
>
> nit - the CMU_MISC comment here is an outlier.

Will fix.

Peter.

