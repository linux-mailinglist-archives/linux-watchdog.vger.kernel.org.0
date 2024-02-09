Return-Path: <linux-watchdog+bounces-645-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DD84FDF6
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Feb 2024 21:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7A521F2579D
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Feb 2024 20:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8043B5681;
	Fri,  9 Feb 2024 20:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHLHprVU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FDFD294
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Feb 2024 20:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707511862; cv=none; b=RKMgknsexrO/SU77w8+5SnC+3zoBoN+Rk+0cx4BxFPN1BIBCnM5wdFN3dIAXWobceCwgm3RbQ6gc5wxMCd/3OkK6sAG34zMLhB++lQ3gF2wd+w4AezmZQ4/Unphovwq09SorK0aUFyaRAdxmz/S6VYbGdOmJrYZemdWjZ0Y06i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707511862; c=relaxed/simple;
	bh=ZoVRZmhMTEbMqPzzv5w5CFJWujcFIccMaB2SyuC1d9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKaODsWyuspDHltQHeH8A4LJ9A3h+mBXubAbt4aJntNfDNRbZh3Gn6q5prrZXONybZi3q7la1eNWWrswZTMxZiVkFpqFS3DTx8fGYfAhDmHiKtccfHUjSYD9LbaANw1xgxe7hrENVmEbkqKVhJzNHeymr0cV/X95Axdo0Vktf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHLHprVU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-296dcd75be7so1013894a91.2
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Feb 2024 12:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707511860; x=1708116660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=my+1LiAYuNXeB9+Zdk0Nb8kG6dgw7OKctVsm44J9maw=;
        b=lHLHprVUze2KRZ0BQeg8Pt4u+q9yDqapFmmlBP2LYeMaTwFvrRpyIRNPAugGFD//z3
         KHvvdCKBxgg9pwUbryIaNy3yjzpNed6TybsPvjqILPk2gdoGoSa7C3dA38fdyPHBDpbW
         qstd/4A/QKx3sZz6yEvzhN3LZEy0/WABzOzn4+mO+QOavdIEZo9ac4EHA7WlyUQhC8Up
         Sufsq3L8MfsZRyHLI5WZB7Hoe7Qfu+fzwfvUHxH7F3eCFVsfLldrWyTruZ8lA9kOVqka
         OOy5f0Qu9BjcButG2eKoOqNCoBPu86mTkiE77VFFJANP0Qmv/vQFlJuTvvOxxcrqm4n6
         41Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707511860; x=1708116660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my+1LiAYuNXeB9+Zdk0Nb8kG6dgw7OKctVsm44J9maw=;
        b=wUbuGB4nK8mClsoHRsoC81sN6AOz4rrghZicglrCXpeTSv/e2sLQHD4IwBo5N/hZ8E
         s2VgndpD5AC4Y1+jT5Uv70pbnjQFluBjri+ZXU/Xa53X7l/+SO5CItxXsRE7B4hDVp9N
         jpkNLbP9oA1LXVAYYBMXTyxpsyhYe5Ejud+Sdp9Akcf28HFycKzK9M3ySTaStZ9rr3bm
         okk0j+I00/d4qzbwlQf1e8FyTMPwDYZpDWKsu9ky/4M9UsJQFmAOx6L+excPyjXw1qLc
         1dZ6ScRLxgSntAUXk7GsCRpUb+rfC41RoQJt1G4unAEhrZX3AaSrQnDMIJ4eI5HkRcvB
         zfNQ==
X-Gm-Message-State: AOJu0Yw5jaziqQkD8ZswHRtCPawTlar9zz8DTxuL1I5E0AXk9JivrhEo
	nO5V/G0rmgGuzawbTVKMSWRQ2nyoS4TVdLjTVV7TXR/af6UVtIID58+kUzcFuktpFpLf1rpSM/X
	P3LNSuO4zNRQBhIRLyGcursXg/+5nOOahoEp5tQ==
X-Google-Smtp-Source: AGHT+IFhT7u2HipNxPOduULsp5SKmt129Rb/+f33f0/AgE9qOw2rPWraconpAvwa5TKV0Tld7kJKRX3Ty64BDxysfe8=
X-Received: by 2002:a17:90b:368a:b0:296:1ac3:c573 with SMTP id
 mj10-20020a17090b368a00b002961ac3c573mr172571pjb.15.1707511860131; Fri, 09
 Feb 2024 12:51:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208161700.268570-1-peter.griffin@linaro.org> <20240208161700.268570-2-peter.griffin@linaro.org>
In-Reply-To: <20240208161700.268570-2-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 9 Feb 2024 14:50:48 -0600
Message-ID: <CAPLW+4mSyqnkzz5N1seFoaDAR1pd_jQEO3ThkGf3U_ozfwedyA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	alexey.klimov@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 10:21=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> security hardening reasons so that they are only write accessible in el3
> via an SMC call.
>
> As most Exynos drivers that need to write PMU registers currently obtain =
a
> regmap via syscon (phys, pinctrl, watchdog). Support for the above usecas=
e
> is implemented in this driver using a custom regmap similar to syscon to
> handle the SMC call. Platforms that don't secure PMU registers, get a mmi=
o
> regmap like before. As regmaps abstract out the underlying register acces=
s
> changes to the leaf drivers are minimal.
>
> A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
> that currently use syscon_regmap_lookup_by_phandle(). This also handles
> deferred probing.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v3:
>  - Fix PMUALIVE_MASK
>  - Add TENSOR_ prefix
>  - clear SET_BITS bits on each loop iteration
>  - change set_bit to set_bits in func name
>  - Fix some alignment
>  - Add missing return on dev_err_probe
>  - Reduce indentation in loop
>
> Changes since v2
>  - Add select REGMAP to Kconfig
>  - Add constant for SET/CLEAR bits
>  - Replace kerneldoc with one line comment
>  - Fix kerneldoc for EXPORT_SYMBOL_GPL funcs
>  - remove superfluous extern keyword
>  - dev_err_probe() on probe error
>  - shorten regmcfg name
>  - no compatibles inside probe, use match data
>  - don't mix declarations with/without initializations
>  - tensor_sec_reg_read() use mmio to avoid access restrictions
>  - Collect up Reviewed-by
>  - const for regmap_config structs
> ---

Tested-by: Sam Protsenko <semen.protsenko@linaro.org>

Tested on my E850-96. All modules that use PMU are still functional
with this patch (watchdog, USB host and Ethernet). No regressions.

[snip]

