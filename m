Return-Path: <linux-watchdog+bounces-2438-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65B9C14DF
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2024 04:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800CC1C20AB7
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2024 03:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264EA1A2564;
	Fri,  8 Nov 2024 03:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBU0hscv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE319E83C
	for <linux-watchdog@vger.kernel.org>; Fri,  8 Nov 2024 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731037995; cv=none; b=eypsTieN+Lly7zDcHSKufqxR+72qlH77y8fHDm0Hs/SQO6autC1GvOGG33PKYEaBfhjI3ijIrOl5qJDqALe/h4wqrJMYIzEfywvr7jCnn8/42h7LhwvvX9jXFdrBZNBgllT6eb+r44o0Q952T3ejuKBt7L5XjjFsgXs1yDw6RhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731037995; c=relaxed/simple;
	bh=dkt6dNvmzJQ8RpknfBU1egkGqBw6oANkPzI+jPJLARw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o35RWGtrCfbT298PJQTZa0nP9Aedk3y8H2e+YjVIxuFnJoUg4l7VI8K4HsKq3dljKbGiSvfmS/3ZNxqeDlJ7tgm+Pan+qJyVRz5m8otFnOdQXrvE85C4nJxAg5S3KqapDuNWVFlKfO0VDibbUgm832ijSm+Ez7FAaYrY+834Ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBU0hscv; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-50c9f4efd09so655306e0c.2
        for <linux-watchdog@vger.kernel.org>; Thu, 07 Nov 2024 19:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731037992; x=1731642792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkt6dNvmzJQ8RpknfBU1egkGqBw6oANkPzI+jPJLARw=;
        b=BBU0hscvTENzzdhTiIChpqwE6PRVAjCpUH8KSpjwu9G+XC/zTtgeO0jdkecVoEu37g
         4z1lofo6NaRrnOARgQwrZ02oxBIyD1YhiuBW2CFwTz10iwWg9qTCFyYzVkOcPg/4ePa1
         Dm30xi6xU+uvKInQv4f1lJyJ0kzBmkfGtSCG/Dr4RlPNUS4r5vEg4xbwZauc29NTIV92
         PuCMxjjWtr5yQ9l8bD0TNZCnymHoi8Wk1mY2fYOjsMw/o0zaIPuF89Iyw5cKh4872o4F
         smX+6CPe1CtaHRiydoT/ehBu5upKq8XJuy69M8hLQ65htmVkN+IlDLJkNRxKD4Hynw4O
         wuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731037992; x=1731642792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkt6dNvmzJQ8RpknfBU1egkGqBw6oANkPzI+jPJLARw=;
        b=lG8Il7WXX1S5fSd2zQrkAS0xVs4v4Dw/t7erwZwWTi9NrGSheGBlXtSd3hOnWMjcQs
         fGAXMsf0GQ+8mtsiSMjgnfcHko+x+h8UKocKCM/UHKu9uKPyDn6wJhk3hNu4d21IxnHY
         RvfckZM7SL1IJ4zr2NKb2mYMqFvhz+4gJip+awvMS177L4xAWO63pu0Q6YwtmSuI9eDS
         QlpYQrJ2CgebGedv8WqYmsUgrgfb0hosUJwFHZLAf8ItZHZt7tet1upCLXSyq6dJxfFH
         6RAppiu7uN8OItWlMAMP8mcuuUIs3SkcAbMf6/HuGjqQvB6IsnlPM6Or0f05VGuLQFt0
         nFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJzbK+M15+ZAGPLWuL8dTwUcjydtZDwXjC9TyQ+tXmIJuC+ms45Ail8A0bvuttYP+psoRwP+qBKaEyy2kjJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydAap437mV6/NOTNtDO9huxY7Q1Xp/bDTvZRWm31ESuhLqp4EO
	qAxkWEvhXko8ZISwkPPtzHDlMUJGO53SipuWmSPnbTL5J3Hc5pT2W81EkyVBb/HjIV5yvtZ2GWw
	pL/AJJjj269QvGRJD4Pgk4vPEODU=
X-Google-Smtp-Source: AGHT+IFT1eUMG6szpGP6P2RGS6FbL4G1Cj3T5E2TfY4MesckdFi0TRT9IhCA/Xcr3T8+UPz19CvOyyA8Df60e5VAivc=
X-Received: by 2002:a05:6102:c53:b0:493:c3b2:b5ba with SMTP id
 ada2fe7eead31-4aae134f736mr2171782137.6.1731037992043; Thu, 07 Nov 2024
 19:53:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106080907.GA14713@www.linux-watchdog.org>
In-Reply-To: <20241106080907.GA14713@www.linux-watchdog.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 7 Nov 2024 20:53:01 -0700
Message-ID: <CADvTj4qg0F5772jK=B3an9=_9f6z=2y8cfcWPZOjyJzJdJRyWA@mail.gmail.com>
Subject: Re: Patches add for v6.13-rc1 in Linux-watchdog-next
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, Byoungtae Cho <bt.cho@samsung.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Fabio Estevam <festevam@denx.de>, Harini T <harini.t@amd.com>, 
	Jean Delvare <jdelvare@suse.de>, lijuang <quic_lijuang@quicinc.com>, Marek Vasut <marex@denx.de>, 
	Nick Chan <towinchenmi@gmail.com>, Oleksandr Ocheretnyi <oocheret@cisco.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Rosen Penev <rosenp@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, 
	Xin Liu <quic_liuxin@quicinc.com>, Yan Zhen <yanzhen@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 1:38=E2=80=AFAM Wim Van Sebroeck <wim@linux-watchdog=
.org> wrote:
>
> Hi All,
>
> Following patches have been added in Linux-Watchdog-Next the last days:
> [PATCH v3] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
> [PATCH V3] watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clo=
ck frequency
> [PATCH v2] dt-bindings: watchdog: Document Qualcomm QCS615 watchdog
> [PATCH] watchdog: ziirave_wdt: Drop explicit initialization of struct i2c=
_device_id::driver_data to 0
> [PATCH v1] MAINTAINERS: Update the maintainer of StarFive watchdog driver
> [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
> [PATCH v2 1/2] watchdog: apple: Actually flush writes after requesting wa=
tchdog restart
> [PATCH v2 2/2] watchdog: apple: Increase reset delay to 150ms
> [PATCH] watchdog: armada_37xx_wdt: remove struct resource
> [RFC PATCH 1/9] watchdog: always print when registering watchdog fails
> [RFC PATCH 2/9] watchdog: da9055_wdt: don't print out if registering watc=
hdog fails
> [RFC PATCH 3/9] watchdog: gxp-wdt: don't print out if registering watchdo=
g fails
> [RFC PATCH 4/9] watchdog: iTCO_wdt: don't print out if registering watchd=
og fails
> [RFC PATCH 5/9] watchdog: it87_wdt: don't print out if registering watchd=
og fails
> [RFC PATCH 6/9] watchdog: octeon-wdt: don't print out if registering watc=
hdog fails
> [RFC PATCH 7/9] watchdog: rti_wdt: don't print out if registering watchdo=
g fails
> [RFC PATCH 8/9] watchdog: rza_wdt: don't print out if registering watchdo=
g fails
> [RFC PATCH 9/9] watchdog: sl28cpld_wdt: don't print out if registering wa=
tchdog fails
> [PATCH v3 1/2] dt-bindings: watchdog: airoha: document watchdog for Airoh=
a EN7581
> [PATCH v3 2/2] watchdog: Add support for Airoha EN7851 watchdog
> [PATCH] watchdog: Delete the cpu5wdt driver
> [PATCH v2 1/2] watchdog: da9063: Do not use a global variable
> [PATCH v2 2/2] watchdog: da9063: Remove __maybe_unused notations
> [PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04

This v3 patch had a bug, a v4 with a fix was posted here:
https://lore.kernel.org/all/20241025063441.3494837-1-james.hilliard1@gmail.=
com/

> [PATCH] watchdog: Switch back to struct platform_driver::remove()
> [PATCH v4 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain in the r=
estart handler
> [PATCH v3 2/3] watchdog: s3c2410_wdt: add support for exynosautov920 SoC
> [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phand=
le() for PMU regs"
> [PATCH][next] docs: ABI: Fix spelling mistake in pretimeout_avaialable_go=
vernors
> [PATCH v1 1/3] dt-bindings: watchdog: Document Qualcomm QCS8300
> [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endia=
n' property
>
> Kind regards,
> Wim.
>
>

