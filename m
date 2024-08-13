Return-Path: <linux-watchdog+bounces-1483-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946D59506F4
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 15:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78EC1C22955
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 13:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EF219D068;
	Tue, 13 Aug 2024 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OT/S8A62"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523ED19CD13
	for <linux-watchdog@vger.kernel.org>; Tue, 13 Aug 2024 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723557423; cv=none; b=iZ4/Di8yXA2CrM7eMPLC66IzOxKLCRcie8N6J8vrX4Hkm7GJJ3PdFNAkQlbiJbaSxiPfx9ralrPUPTRRrX8el8+2GXjX2ZmfRBlyg7zEqWfTFrcB7A1EHX74GgV1/GAn9NGXt89lZlW/5iu1EUPRtcqDWfpUvEmdHnVxi3zNo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723557423; c=relaxed/simple;
	bh=gA+QStwRj/LVatDuKESJdCv++0LFZ88d5P6I6zHRsOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiXMm5m4M5vVo56Q4uVk89yAaGE0On8TBPX9P8UrVK7ixoXzXlv374MYAq3nC+0M39VYZSF5FnzqYfhqmxa2AJqfLAGRAM3vBWVh+l7FJN1WfJCGqgwrKN7JCAVDWsikCs1YSRtUJbOAWq76MuV3q26zyzgNnDPfjItX+Vw+EF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OT/S8A62; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e0857a11862so5529373276.1
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Aug 2024 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723557421; x=1724162221; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zLSLN/JNWAOSXtxRH8miLcEkaLp2UzeNqUb5zeUUf0g=;
        b=OT/S8A62y9zYsr69otgjbk24Ht0LA8z/uk936ABsW5HIJGf11g8HYOsKjDzrhVjlU2
         DbWhIJY54Mxt6D0OlbPHLXz2AEmrGHqRHj0Z30znT7onYTyc2Dq/u1qB4XOq72/a29bf
         Y8gpqNbxILEragu2S0mHpNcu22G2W9jyqDJphO9UQDc5P/puXeWafhhLE0NV7PysPpwS
         8EVFo6k9dnA0Lss+4sJ4OYwFliWT54VxY0lDKhnedXOe/JMt0cxu8rpvK0JQsIx43Ar6
         vhfQYX8skbcaK+LPVmBvJB9ztil0jVeO5yx7Kcusqx2ScOyp7jzxxtZAPuCW/PJMaaXx
         Y/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723557421; x=1724162221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLSLN/JNWAOSXtxRH8miLcEkaLp2UzeNqUb5zeUUf0g=;
        b=gpWs0ru01Ru0YMX9+oJRMBnrdjchsthv2CFGNMowFYkTKmMIyo4wQNSaDuHgu2hozJ
         XYHL/wpatOHpFZWHgFeOi3wrWH8kzjBNwHi7XuE/Y5NshxgQdxxVzLykiz0POFBAXYEj
         9Qj3WLWhWim1sTJuR3NNnXsXE8OBofkTgruvNmkB2TYudqR1ae7Iz5+1TiBHLUsDyvTa
         3FIoX03g2BZ+uF7OQVn91MFY5TfbXyvIrSJGTm5Cu2EKgJzt40YvESEry/mSU2r2W4zb
         3zdnyiJo+/VGiIfJbXMMRFqq6GM4eq9SsQrRoe++R5uItWg/710Fx1P00w2iAw0rvfyo
         91xg==
X-Forwarded-Encrypted: i=1; AJvYcCW5E1Kp0G6AwWJuzyN9fKoU//JxI7SlFQrm6LvkMIDIsQlefEgqomHKRvA7PN/k5q8/iwUA4JFrazUI0YdRzUOPBP7te2bspQhg5CzzmS0=
X-Gm-Message-State: AOJu0YwtRJM4A9ZAOQtXpzqrltdztgOB4RTQb5Ly3U72Zj2IwzE27ked
	BAUAtm8jiZggSoKd8HbYGF+kqQasF5UPjY+heJ/G8JmFgjzCbz0t8WzdabYtPi+a1tm1BD1RC2A
	u0JmWc6T2gVRp1FJhLuQ7HIgVPab49z20PT61Zg==
X-Google-Smtp-Source: AGHT+IGSRXHkL7PvnTNEwvOCFZfzIGVjr9cYpYKwW+c0HMHoaWdUmQ9IzZF7tEGG+VM8etItOggTy4TAzrcmiyP930o=
X-Received: by 2002:a05:6902:2805:b0:e0b:f45f:65dd with SMTP id
 3f1490d57ef6-e113d2e303emr3310212276.57.1723557421255; Tue, 13 Aug 2024
 06:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com> <20240619120920.2703605-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240619120920.2703605-4-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Aug 2024 15:56:24 +0200
Message-ID: <CAPDyKFq1EX1Spedhkek=50EdwmHY5erNTmvegVGbxfLzTqYjEA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] watchdog: rzg2l_wdt: Power on the PM domain in rzg2l_wdt_restart()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, rafael@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, geert+renesas@glider.be, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jun 2024 at 14:09, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The rzg2l_wdt_restart() is called in atomic context. Calling
> pm_runtime_{get_sync, resume_and_get}() or any other runtime PM resume
> APIs is not an option as it may lead to issues as described in commit
> e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'")
> that removed the pm_runtime_get_sync() and enabled directly the clocks.
>
> Starting with RZ/G3S the watchdog could be part of its own
> software-controlled power domain. In case the watchdog is not used the
> power domain is off and accessing watchdog registers leads to aborts.
>
> To solve this, the patch powers on the power domain using
> dev_pm_genpd_resume_restart_dev() API after enabling its clock. This is
> not sleeping or taking any other locks as the watchdog power domain is not
> registered with GENPD_FLAG_IRQ_SAFE flags.

Would it be a problem to register the corresponding genpd using the
GENPD_FLAG_IRQ_SAFE?

Assuming it wouldn't, it looks like we should be able to make the
watchdog device irq-safe too, by calling pm_runtime_irq_safe() during
->probe().

In that case it should be okay to call pm_runtime_get_sync() in atomic
context, right?

Kind regards
Uffe

>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/watchdog/rzg2l_wdt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 6e3d7512f38c..bbdbbaa7b82b 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/units.h>
> @@ -169,6 +170,17 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>         clk_enable(priv->pclk);
>         clk_enable(priv->osc_clk);
>
> +       /*
> +        * The device may be part of a power domain that is currently
> +        * powered off. We need to power it on before accessing registers.
> +        * We don't undo the dev_pm_genpd_resume_restart_dev() as the device
> +        * need to be on for the reboot to happen. Also, as we are in atomic
> +        * context here, there is no need to increment PM runtime usage counter
> +        * (to make sure pm_runtime_active() doesn't return wrong code).
> +        */
> +       if (!pm_runtime_active(wdev->parent))
> +               dev_pm_genpd_resume_restart_dev(wdev->parent);
> +
>         if (priv->devtype == WDT_RZG2L) {
>                 ret = reset_control_deassert(priv->rstc);
>                 if (ret)
> --
> 2.39.2
>

