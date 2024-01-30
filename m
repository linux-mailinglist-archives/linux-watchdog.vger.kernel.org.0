Return-Path: <linux-watchdog+bounces-519-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC49842779
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jan 2024 16:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7A64283518
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jan 2024 15:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D49811E2;
	Tue, 30 Jan 2024 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3TbaF8Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AE77A73C
	for <linux-watchdog@vger.kernel.org>; Tue, 30 Jan 2024 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626930; cv=none; b=OQruUMIq4IFqS0732JMXMzJySbxslIj4KhlMPiWnvtkdDyO9ckuyOfa8I2gWs2NEGmZO3/n7HiKHtiBf+v5z5NUWgJWdH+dkTkfF0Lua2wjSgtR0fysbR9j7EXG1O04kXLiUMk5DhSO0vBad02vlVbZMqgYIMy1Yzbs8ddiXC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626930; c=relaxed/simple;
	bh=xU89VXeOgdeVGO8ifM+y778gFYd1HxXjIaxrSD2so0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dla660Qson9XehuKhwjpSbIJOC4IAO/va8TEh2ALr0BAj9lWWk8nOoLLKOpbyH31Jpme0cMQbPfHvGPHDhH+E9bHn6byqOC9XFF52l6sUsR3Tv0dBa3pCZNvLFNeECePxh4poIV21wrTnQ+kZyaG7koUgwidVd7JBO9QP4oaAWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3TbaF8Z; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42a8be32041so31348711cf.1
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jan 2024 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706626926; x=1707231726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ+gflKj48xYGvVtJjeC3SYWWp6ebgTpGb8GhCSAMwk=;
        b=b3TbaF8ZtcGUUthTboJaZqv9R/A5e1fatSjJMg+ywDvd4IuKT3BPR19Ixy30zRtLpa
         uaA/IIY45ZbTXnrGJph8CkdTrDC8afLYsrUGSyyZUuf1KPyeFfNWecyOM7BpFimRy/2B
         R0BC3iaK+qad6AKRQm1KDrvl7LZKX+NwvGxG4ntgbJ3URz+wheDt/5ChOUcA+pn/avwY
         RyJi9Q2AS9rO/KAp1PwnegvHqJWnZW9I1Y3+eXvI4xGpz6ZDZ1He5RU6mGLPW9NajTds
         TFU8Ffyu9gac84ll2o7HWda7el+85V/azO5chfWihG+KK+NWrrio/RA3JXyn1WxVDrCa
         kZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626926; x=1707231726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJ+gflKj48xYGvVtJjeC3SYWWp6ebgTpGb8GhCSAMwk=;
        b=w3OC6ul6v9afJxN3zNP2M4i++xW3/tD9diL7ZW8+C4vX0ffGMOsT2GapUYKFrMQeBH
         n+v39dOJBuNbo2Q60PM47Me8iW0zBysnhJP94+++cE7/ytDOQmPZ3w9wZHqjcSNjNRGq
         Vl/vE6KF7rXDCWMRQwaQ3sxUw5FGxlmczAEa2A8X0TqHy616XxQErgT5z2tX1GeALubN
         Sgi7oUIiWq1kPNE3kr7nGm5tmaZeyemWsw8z2uchwot+UDkZOzFHWa1y0A5tx1lu29Kh
         CX68iCIIoGeaONp0cKmwwbZlx9tfrkysF79ioE8ogNDau1Fmbom1NzNpKTFlw8GcCVja
         p6pA==
X-Gm-Message-State: AOJu0YwISo8jN4yNcfK1ZqFiz7bBG6T7K85cgKCxEWmWYE0YMhaQ7QM0
	6UGxFG9z4MjeyvCjBUafvA93T3DoQC6D6yWU6gmpG0n/fc5WTE6X/2sGhq6BVLdwDSwi8ygXxfA
	3nDuvFqV3Qy9O0mdbujGnWLqp7PxYRdOVQk4Sww==
X-Google-Smtp-Source: AGHT+IHXg+32TKi5xcy+oIQz9oqU8rWRsJ2Fi4QgcBOniIyeMqG+ulFYU5PWZSXQm342RKVoD9XX/PYp3pIdBrV6//c=
X-Received: by 2002:ac8:4e86:0:b0:42a:b809:7f95 with SMTP id
 6-20020ac84e86000000b0042ab8097f95mr1371826qtp.8.1706626925869; Tue, 30 Jan
 2024 07:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129211912.3068411-1-peter.griffin@linaro.org>
 <20240129211912.3068411-2-peter.griffin@linaro.org> <b1798b8a-5794-4c79-a1d3-50259fa3ba81@roeck-us.net>
In-Reply-To: <b1798b8a-5794-4c79-a1d3-50259fa3ba81@roeck-us.net>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jan 2024 15:01:54 +0000
Message-ID: <CADrjBPrr5t-ZbYH-agsfniztBCtf15UMMmUGTNuHTX3dm=Rkxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Guenter Roeck <linux@roeck-us.net>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, wim@linux-watchdog.org, 
	alim.akhtar@samsung.com, jaewon02.kim@samsung.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thanks for the feedback.

On Tue, 30 Jan 2024 at 06:26, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 1/29/24 13:19, Peter Griffin wrote:
> > Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> > security hardening reasons so that they are only accessible in el3 via an
> > SMC call.
> >
> > As most Exynos drivers that need to write PMU registers currently obtain a
> > regmap via syscon (phys, pinctrl, watchdog). Support for the above usecase
> > is implemented in this driver using a custom regmap similar to syscon to
> > handle the SMC call. Platforms that don't secure PMU registers, get a mmio
> > regmap like before. As regmaps abstract out the underlying register access
> > changes to the leaf drivers are minimal.
> >
> > A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
> > that currently use syscon_regmap_lookup_by_phandle(). This also handles
> > deferred probing.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> [ ... ]
>
> > +/**
> > + * exynos_get_pmu_regmap
> > + * Find the pmureg previously configured in probe() and return regmap property.
> > + * Return: regmap if found or error if not found.
> > + */
> >   struct regmap *exynos_get_pmu_regmap(void)
> >   {
> >       struct device_node *np = of_find_matching_node(NULL,
> >                                                     exynos_pmu_of_device_ids);
> >       if (np)
> > -             return syscon_node_to_regmap(np);
> > +             return exynos_get_pmu_regmap_by_phandle(np, NULL);
> >       return ERR_PTR(-ENODEV);
> >   }
> >   EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
> >
> > +/**
> > + * exynos_get_pmu_regmap_by_phandle
> > + * Find the pmureg previously configured in probe() and return regmap property.
> > + * Return: regmap if found or error if not found.
> > + *
> > + * @np: Pointer to device's Device Tree node
> > + * @property: Device Tree property name which references the pmu
> > + */
> > +struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
> > +                                             const char *property)
> > +{
> > +     struct device *dev;
> > +     struct exynos_pmu_context *ctx;
> > +     struct device_node *pmu_np;
> > +
> > +     if (property)
> > +             pmu_np = of_parse_phandle(np, property, 0);
> > +     else
> > +             pmu_np = np;
> > +
> > +     if (!pmu_np)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver,
> > +                                         (void *)pmu_np);
> > +     of_node_put(pmu_np);
> > +     if (!dev)
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +
> > +     ctx = dev_get_drvdata(dev);
> > +
> > +     return ctx->pmureg;
> > +}
> > +EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> > +
>
> I think there should be a detailed comment explaining why the complexity
> is necessary instead of just returning pmu_context->pmureg.

Ok, I'll add a detailed comment for v3.

Thanks,

Peter

