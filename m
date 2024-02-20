Return-Path: <linux-watchdog+bounces-693-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 654FA85BD0C
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Feb 2024 14:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2822873E2
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Feb 2024 13:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C416A034;
	Tue, 20 Feb 2024 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZJ0Lt2q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26569E0E
	for <linux-watchdog@vger.kernel.org>; Tue, 20 Feb 2024 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708435251; cv=none; b=s5PL/lMEW18+S9ERyACc4F4EYQP5Lh8Mr+r78rrG7ioyJDs4TdETqvq30rIyT9bExEZArPyHJlnm+dtNfOJNNmSwLJgTfr9Bk5uNUZxehqHkUwbPQvL7sth7QD4yLjMMWpkFTShrMMtFXNIlgHc3RPkt8vW5f74jhV0JoOkG3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708435251; c=relaxed/simple;
	bh=AzES946XJIoeKOfWXh7Y99KFaeGFmJOweba4tNi0w1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdEpkJaQVvEvgTyfpxCIplVGdKOtVasl3mRMHTrMN8baEFdQHoOUjsbp07r1uLy6Z9SX4yb9GQjtTIRt6joSralEqCrk/eOCpNrOl2y1KxOaZJRX+npWseMdgoVDn4UkTqlRI0X6oWiNyVbUB4KzLCj+fb//76ux+hOwcBFd0jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZJ0Lt2q; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c031c24fbeso4437301b6e.3
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Feb 2024 05:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708435249; x=1709040049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP+3iL6xb/RVVeTHHQMqfvj9HZcG1WEGgQ50AkstGdo=;
        b=yZJ0Lt2qQVvGSmPGS22BJivIJAiOlBtO52bVhSuW2bvEOvNyHTwYQdsFP9IlXsURnl
         fIqTRPpbGMrpB2/+gOMD7L904dqOMiT1sOrvtDHSTOdwY1qVdxEgtcrQjOQdyFSVwcUE
         QmlMhkRFZWaCEdWLBkTPzqNoY5A6FxasXqCxsYxMjJhOI68F2F8s8CHrL7ZU/4jmyiMY
         8JAso2u/2WtPfMMf9fa8EvuEgOJpp4KcwzAyD10f55eJOdxb+POMYFSqxPi1uFaeYuOU
         x8ALytAXjM8kDOc1yo6+90YIv2cCRGBqgmGQtXe064RABlvNBuc17zfUzWkt95yA75In
         DhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708435249; x=1709040049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WP+3iL6xb/RVVeTHHQMqfvj9HZcG1WEGgQ50AkstGdo=;
        b=GngY4SZUzPjJCKWXuybWKURsW0EybNP6FNh7fiAwh3RO/OcGrXLaIZwr+c4Zl23imi
         s+CTdSZAXc8esTOaO2ZU4whbr/K5IU9UAvsaxTu+O/qcZrShV5wYSXFu46IRu2EVlnnT
         Q7c+HIaoD7oXUCsyyJtS4KJq/H/HWY0JctiQh9YwlLGjQ0XPKsRxjO0Dn2rX+ujROVlF
         JvKhC2zdHxTd19eEVEqk2yjCic0uwzN95yOfuQUm7wCWyVMp7q6x4Rfc7l6KZvKh/Wxa
         /6i51lGaSGStYRhlQ/o2vXl5F1rpb9MB8z2vvkm3fSe/lLSrYhBZpVYXpxTyK3bV+XZE
         J3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQuSpO6fNklBATuICZu8CLTp4kL0JOc6Nph+dYU+g2qv4+RG8Ni3ix+jeqPpTNdlMyD/Y0xlGLRM8sUEGHVRCc8zC+awxIc3WNxz/D73c=
X-Gm-Message-State: AOJu0YwUQlsl6iuSR/FaAcamPAuM6v1tsUjeswDPipPpmMp3LHH6FquS
	N2+6Abd5Fzo4FGiyY3/v64pjkOD+ePmyUFP9TdTqeqYcGg8BwW/byhVLfsfzIeTW0ImCxqXAcEA
	4DSQKaKycHWSsT1x1VSMOZVpmHLBkZ8CNRt+Q+w==
X-Google-Smtp-Source: AGHT+IH6YHYON/cS3zVfm4L6/D3K+zW0MCNLmnL1KIAGoMwmU2wJPkMMTzZ+P1kUiag2Po5m+zZ30FhRHWlUGNOiv+s=
X-Received: by 2002:aca:d0f:0:b0:3c0:4ac4:d7f1 with SMTP id
 15-20020aca0d0f000000b003c04ac4d7f1mr12737522oin.35.1708435248949; Tue, 20
 Feb 2024 05:20:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219204238.356942-1-peter.griffin@linaro.org>
 <20240219204238.356942-2-peter.griffin@linaro.org> <CAPLW+4nOq_62rBhwRUf0RW0zTiGa+-Zpt+FLcTa87biX8Nq-BA@mail.gmail.com>
In-Reply-To: <CAPLW+4nOq_62rBhwRUf0RW0zTiGa+-Zpt+FLcTa87biX8Nq-BA@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 20 Feb 2024 13:20:37 +0000
Message-ID: <CADrjBPrMC4Zh1yOzfPZ81bfnkz5BG9MktPpgny9r3F0x8mekxw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	alexey.klimov@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 19 Feb 2024 at 23:06, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Mon, Feb 19, 2024 at 2:42=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> > security hardening reasons so that they are only write accessible in el=
3
> > via an SMC call.
> >
> > As most Exynos drivers that need to write PMU registers currently obtai=
n a
> > regmap via syscon (phys, pinctrl, watchdog). Support for the above usec=
ase
> > is implemented in this driver using a custom regmap similar to syscon t=
o
> > handle the SMC call. Platforms that don't secure PMU registers, get a m=
mio
> > regmap like before. As regmaps abstract out the underlying register acc=
ess
> > changes to the leaf drivers are minimal.
> >
> > A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drive=
rs
> > that currently use syscon_regmap_lookup_by_phandle(). This also handles
> > deferred probing.
> >
> > Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes since v4:
> >  - Use same argument names as in struct regmap_config
> >  - Remove inline keyword and rely on compiler
> >  - Update kerneldoc wording
> >  - property -> propname argument rename
> >  - reverse Xmas tree
> >  - Only call of_node_put() when of_parse_phandle is called
> >  - Collect tags
> >
> > Changes since v3:
> >  - Fix PMUALIVE_MASK
> >  - Add TENSOR_ prefix
> >  - clear SET_BITS bits on each loop iteration
> >  - change set_bit to set_bits in func name
> >  - Fix some alignment
> >  - Add missing return on dev_err_probe
> >  - Reduce indentation in loop
> >
> > Changes since v2
> >  - Add select REGMAP to Kconfig
> >  - Add constant for SET/CLEAR bits
> >  - Replace kerneldoc with one line comment
> >  - Fix kerneldoc for EXPORT_SYMBOL_GPL funcs
> >  - remove superfluous extern keyword
> >  - dev_err_probe() on probe error
> >  - shorten regmcfg name
> >  - no compatibles inside probe, use match data
> >  - don't mix declarations with/without initializations
> >  - tensor_sec_reg_read() use mmio to avoid access restrictions
> >  - Collect up Reviewed-by
> >  - const for regmap_config structs
> > ---
> >  drivers/soc/samsung/Kconfig            |   1 +
> >  drivers/soc/samsung/exynos-pmu.c       | 235 ++++++++++++++++++++++++-
> >  drivers/soc/samsung/exynos-pmu.h       |   1 +
> >  include/linux/soc/samsung/exynos-pmu.h |  11 +-
> >  4 files changed, 245 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> > index 27ec99af77e3..1a5dfdc978dc 100644
> > --- a/drivers/soc/samsung/Kconfig
> > +++ b/drivers/soc/samsung/Kconfig
> > @@ -42,6 +42,7 @@ config EXYNOS_PMU
> >         depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
> >         select EXYNOS_PMU_ARM_DRIVERS if ARM && ARCH_EXYNOS
> >         select MFD_CORE
> > +       select REGMAP_MMIO
> >
> >  # There is no need to enable these drivers for ARMv8
> >  config EXYNOS_PMU_ARM_DRIVERS
> > diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exy=
nos-pmu.c
> > index 250537d7cfd6..d6ae8025fdb4 100644
> > --- a/drivers/soc/samsung/exynos-pmu.c
> > +++ b/drivers/soc/samsung/exynos-pmu.c
> > @@ -5,6 +5,7 @@
> >  //
> >  // Exynos - CPU PMU(Power Management Unit) support
> >
> > +#include <linux/arm-smccc.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/mfd/core.h>
> > @@ -12,19 +13,134 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/delay.h>
> > +#include <linux/regmap.h>
> >
> >  #include <linux/soc/samsung/exynos-regs-pmu.h>
> >  #include <linux/soc/samsung/exynos-pmu.h>
> >
> >  #include "exynos-pmu.h"
> >
> > +#define PMUALIVE_MASK                  GENMASK(13, 0)
> > +#define TENSOR_SET_BITS                        (BIT(15) | BIT(14))
> > +#define TENSOR_CLR_BITS                        BIT(15)
> > +#define TENSOR_SMC_PMU_SEC_REG         0x82000504
> > +#define TENSOR_PMUREG_READ             0
> > +#define TENSOR_PMUREG_WRITE            1
> > +#define TENSOR_PMUREG_RMW              2
> > +
> >  struct exynos_pmu_context {
> >         struct device *dev;
> >         const struct exynos_pmu_data *pmu_data;
> > +       struct regmap *pmureg;
> >  };
> >
> >  void __iomem *pmu_base_addr;
> >  static struct exynos_pmu_context *pmu_context;
> > +/* forward declaration */
> > +static struct platform_driver exynos_pmu_driver;
> > +
> > +/*
> > + * Tensor SoCs are configured so that PMU_ALIVE registers can only be =
written
> > + * from EL3, but are still read accessible. As Linux needs to write so=
me of
> > + * these registers, the following functions are provided and exposed v=
ia
> > + * regmap.
> > + *
> > + * Note: This SMC interface is known to be implemented on gs101 and de=
rivative
> > + * SoCs.
> > + */
> > +
> > +/* Write to a protected PMU register. */
> > +static int tensor_sec_reg_write(void *context, unsigned int reg,
> > +                               unsigned int val)
> > +{
> > +       struct arm_smccc_res res;
> > +       unsigned long pmu_base =3D (unsigned long)context;
> > +
> > +       arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
> > +                     TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
> > +
> > +       /* returns -EINVAL if access isn't allowed or 0 */
> > +       if (res.a0)
> > +               pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0=
);
> > +
> > +       return (int)res.a0;
> > +}
> > +
> > +/* Read/Modify/Write a protected PMU register. */
> > +static int tensor_sec_reg_rmw(void *context, unsigned int reg,
> > +                             unsigned int mask, unsigned int val)
> > +{
> > +       struct arm_smccc_res res;
> > +       unsigned long pmu_base =3D (unsigned long)context;
> > +
> > +       arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
> > +                     TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
> > +
> > +       /* returns -EINVAL if access isn't allowed or 0 */
> > +       if (res.a0)
> > +               pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0=
);
> > +
> > +       return (int)res.a0;
> > +}
> > +
> > +/*
> > + * Read a protected PMU register. All PMU registers can be read by Lin=
ux.
> > + * Note: The SMC read register is not used, as only registers that can=
 be
> > + * written are readable via SMC.
> > + */
> > +static int tensor_sec_reg_read(void *context, unsigned int reg,
> > +                              unsigned int *val)
> > +{
> > +       *val =3D pmu_raw_readl(reg);
> > +       return 0;
> > +}
> > +
> > +/*
> > + * For SoCs that have set/clear bit hardware this function can be used=
 when
> > + * the PMU register will be accessed by multiple masters.
> > + *
> > + * For example, to set bits 13:8 in PMU reg offset 0x3e80
> > + * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
> > + *
> > + * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
> > + * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
> > + */
> > +static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 =
val,
> > +                                 u32 mask)
> > +{
> > +       int ret;
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < 32; i++) {
> > +               if (!(mask & BIT(i)))
> > +                       continue;
> > +
> > +               offset &=3D ~TENSOR_SET_BITS;
> > +
> > +               if (val & BIT(i))
> > +                       offset |=3D TENSOR_SET_BITS;
> > +               else
> > +                       offset |=3D TENSOR_CLR_BITS;
> > +
> > +               ret =3D tensor_sec_reg_write(ctx, offset, i);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +       return ret;
> > +}
> > +
> > +static int tensor_sec_update_bits(void *ctx, unsigned int reg,
> > +                                 unsigned int mask, unsigned int val)
> > +{
> > +       /*
> > +        * Use atomic operations for PMU_ALIVE registers (offset 0~0x3F=
FF)
> > +        * as the target registers can be accessed by multiple masters.
> > +        */
> > +       if (reg > PMUALIVE_MASK)
> > +               return tensor_sec_reg_rmw(ctx, reg, mask, val);
> > +
> > +       return tensor_set_bits_atomic(ctx, reg, val, mask);
> > +}
> >
> >  void pmu_raw_writel(u32 val, u32 offset)
> >  {
> > @@ -75,11 +191,41 @@ void exynos_sys_powerdown_conf(enum sys_powerdown =
mode)
> >  #define exynos_pmu_data_arm_ptr(data)  NULL
> >  #endif
> >
> > +static const struct regmap_config regmap_smccfg =3D {
> > +       .name =3D "pmu_regs",
> > +       .reg_bits =3D 32,
> > +       .reg_stride =3D 4,
> > +       .val_bits =3D 32,
> > +       .fast_io =3D true,
> > +       .use_single_read =3D true,
> > +       .use_single_write =3D true,
> > +       .reg_read =3D tensor_sec_reg_read,
> > +       .reg_write =3D tensor_sec_reg_write,
> > +       .reg_update_bits =3D tensor_sec_update_bits,
> > +};
> > +
> > +static const struct regmap_config regmap_mmiocfg =3D {
> > +       .name =3D "pmu_regs",
> > +       .reg_bits =3D 32,
> > +       .reg_stride =3D 4,
> > +       .val_bits =3D 32,
> > +       .fast_io =3D true,
> > +       .use_single_read =3D true,
> > +       .use_single_write =3D true,
> > +};
> > +
> > +static const struct exynos_pmu_data gs101_pmu_data =3D {
> > +       .pmu_secure =3D true
> > +};
> > +
> >  /*
> >   * PMU platform driver and devicetree bindings.
> >   */
> >  static const struct of_device_id exynos_pmu_of_device_ids[] =3D {
> >         {
> > +               .compatible =3D "google,gs101-pmu",
> > +               .data =3D &gs101_pmu_data,
> > +       }, {
> >                 .compatible =3D "samsung,exynos3250-pmu",
> >                 .data =3D exynos_pmu_data_arm_ptr(exynos3250_pmu_data),
> >         }, {
> > @@ -113,19 +259,75 @@ static const struct mfd_cell exynos_pmu_devs[] =
=3D {
> >         { .name =3D "exynos-clkout", },
> >  };
> >
> > +/**
> > + * exynos_get_pmu_regmap() - Obtain pmureg regmap
> > + *
> > + * Find the pmureg regmap previously configured in probe() and return =
regmap
> > + * pointer.
> > + *
> > + * Return: A pointer to regmap if found or ERR_PTR error value.
> > + */
> >  struct regmap *exynos_get_pmu_regmap(void)
> >  {
> >         struct device_node *np =3D of_find_matching_node(NULL,
> >                                                       exynos_pmu_of_dev=
ice_ids);
> >         if (np)
> > -               return syscon_node_to_regmap(np);
> > +               return exynos_get_pmu_regmap_by_phandle(np, NULL);
> >         return ERR_PTR(-ENODEV);
> >  }
> >  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
> >
> > +/**
> > + * exynos_get_pmu_regmap_by_phandle() - Obtain pmureg regmap via phand=
le
> > + * @np: Device node holding PMU phandle property
> > + * @property: Name of property holding phandle value
>
> This doesn't match the actual param name.

Doh, I missed the kerneldoc comment in the renaming from property ->
propname. I will send a v6 in a moment with this fixed

Peter.

