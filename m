Return-Path: <linux-watchdog+bounces-3914-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29646B14EF1
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 16:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636993BD938
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 14:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D42DA933;
	Tue, 29 Jul 2025 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moL0hcfB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3902E36E2;
	Tue, 29 Jul 2025 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753797642; cv=none; b=V4n1qCQzsrnBnDaIxQP6fYlUEuWEc6oir7jnP7L7yjWbruv+xP2To15vYlQo3H6Zw69EwXyxX0RH3Ep7teRs29W0/78tUaW9qAaBtLvuJ5tOhgJBFo1tP9QmYfSghK+K6Ala7DK9P7SIXk83/ZjvbHmD4fo94hIxa8Hg/GQTRy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753797642; c=relaxed/simple;
	bh=sOxtkDYdkQGd7k6eC0OIl3338t3jmSISjmThtXeV0Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mShRKmr92UDvzoAbcVHNIgnodHEGr0nAF9oNiHwfoXvLEH3kwCz5QVXmCX3AvXtCrTUUcrRSEobDrSQgU2OkNSB921AvZx6juTsOKtGcHVl5jawLqJeaJIaN0H7A9FUrAvzg/D+1XJH3nyEtSM8CKk4Wo5SnN+l0jO0CixUsMb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moL0hcfB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso3292203b3a.0;
        Tue, 29 Jul 2025 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753797640; x=1754402440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZ3Q4vacdASfiKmYfor37WZJr9osSzqsT23+mekRAPw=;
        b=moL0hcfB8SqXeF61fpn1h/AaE2Ci+My4fIOw++91ZHKIBeaQ0IlmFxNNzStO+sWeJ6
         tsk6rOUWX6DYYvVxT3UfPk2Qt0s9mn8kNK8Q8rVl+Iizm3kHsRVPwNlK7M/JTJbscjf8
         cZUkdqX7dER/Wm90RRL4J1EeaHBmECSFZIRZgET+AqNI1QJWmgZjn4GPa2i3FVtKkOqc
         amVc+s3PXRMcUo0KBNzzsjEqCkinMe4vf5LmJUVZxyi40fAvUxa4D/FLXZEAQ6eyxqhg
         7cfvU94sxo6Tn14nEFmYEeOHEsOQJx/uoPLRuuxpqlRMjuJC2luD+eIUPctS+kZqScvH
         4SaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753797640; x=1754402440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZ3Q4vacdASfiKmYfor37WZJr9osSzqsT23+mekRAPw=;
        b=nIhFQdKXEiMenwy860E0VSK9rKaUdIiJsjQpGW7zmFE34oQDyD3BjQzG8ImlhO4aTm
         tXVo0nU8xT8eU7yDg4y9Jqbd5yNhbkL2XOjnvXKqLaTKmCn1EP+v/t90QVkUpWSCJMWF
         8qBsx0QG+Orqf4EZOLA3A2FBbnkl+yIHb4kbQF4B0Z4v4hLROG04FwBe8TDNIe6FAWnU
         0LDT77EFVez1MOtzwmpbFmyd1z/c1pLENxFYBh2sQiZAdcO5g8yzaPDx4H2Du76BCoVK
         OxUrUUcGl5Jvva9Y42ucPWlM4izGZLe0906CCk78qo5N+6sRmADCiejLZsk1FQ/V8p7d
         TqOw==
X-Forwarded-Encrypted: i=1; AJvYcCX3hbEH3jSsB4o5LvqbpaXY5gT4GRqmBjTk6Ssj8Q+EZEphp3nzrGUzlJz0pbF4kyq2myjWTQQ0B+1WTDo=@vger.kernel.org, AJvYcCXkiOZoGgJYl3lN8VtPa5E4Eg2Qebj+w8eN5j7wYi7X2UNXHuXhuHSETAuPeRN6vXirZupRH9TeQXu/RqCf7FE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwULa0Qtc++/m1QsDXLW8k6V/2QcP9c7UFctlwT8XqUI2kso133
	Uo4zVWFB+jFSoi5ic0yZeuwuFU452ily9NVX/C7zqxyxGQc4PhHICxX/2B0HBw==
X-Gm-Gg: ASbGncsZvuFAUVZPGS1X7AqsYulVSTeTndU8ZoznNdD5R35n6NNWd6I36mBIwbEE8yB
	rzVOOF9uKacIgkuJcsjq2skYrwG7gGvxwB2wZ9IAQ1fXyckm8/92yEg59AAFIKJG1qIL5psjQ5x
	llkrJdSJAUsg2+61CPXQnqN3+Y38WSKLEnwVmfKC4xgNoVq1woNE/qjGBPWfaTL4Y5qeB9IbA2D
	uWdkGcVG91aEbKrAZt0qv8Gz8dgO4bT4sMrT+/8bBjQ2CWsNR4BZxJUzyDz/xULhn4mpuoAR+Zi
	lepJ8Fs5bzugdCGiuxpn0SJTlNGQitD4c2YhZq3r0LUjhf6hcFIWJbJ8KNUrf/tTlZpq65b77wi
	Xaoc+6HBVGNY7oYcc/K17e/WEJC5MKViOy/w=
X-Google-Smtp-Source: AGHT+IFXGaCEVs7xY7OEH0Rh57cbQdgev16rb7LJALK0hoS/2THeoTBzdzd2hGNISOcI5cbGug0+vQ==
X-Received: by 2002:a05:6a00:8d1:b0:736:d297:164 with SMTP id d2e1a72fcca58-7633227ed77mr17122565b3a.1.1753797638427;
        Tue, 29 Jul 2025 07:00:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b2de3dbsm8211262b3a.113.2025.07.29.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:00:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 29 Jul 2025 07:00:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ao Sun <aosun718@gmail.com>
Cc: wim@linux-watchdog.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	geng.sun@transsion.com
Subject: Re: [PATCH] watchdog: mtk_wdt: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Message-ID: <2bf292d6-0f51-473c-bd44-f129a0b2a7ab@roeck-us.net>
References: <20250729035117.3170-1-aosun718@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729035117.3170-1-aosun718@gmail.com>

On Tue, Jul 29, 2025 at 11:51:17AM +0800, Ao Sun wrote:
> During the device resume process, an interrupt storm occurs after
> interrupts are enabled, preventing the watchdog device from being
> awakened and functioning.
> 
> To ensure that the watchdog is executed before interrupts are enabled,
> Use NOIRQ_SYSTEM_SLEEP_PM_OPS().
> 
> Signed-off-by: Ao Sun <aosun718@gmail.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393f609d..5f2179dabd67 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -327,7 +327,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
>  
>  static const struct dev_pm_ops mtk_wdt_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
> +	 SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
>  				mtk_wdt_resume)

Extra space added at beginning of line, and bad multi-line alignment.

Guenter

