Return-Path: <linux-watchdog+bounces-3662-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5ACAD8D10
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Jun 2025 15:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7A2189C5A2
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Jun 2025 13:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A647214EC62;
	Fri, 13 Jun 2025 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsCjCcCi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0B1E50E;
	Fri, 13 Jun 2025 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821085; cv=none; b=TRy6j/zdNKc0ymd02hEN9tCwSWTus0pWwHmG6/M9G8aIETAMF8WUQZnul2riIm5NfzvaHUTuRwd+yZOSZiLXgNuXVmDpGh+TuZ7BbMkx7+qjKt9CnrNhwW/iiYK5YzH7McPJED/K24oBUHFBKjT0k/UZOK8Ycpj/hV8c3F9TZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821085; c=relaxed/simple;
	bh=tOkVEKEMXNclCaMtag04qkqt+z54h+ZwBX10cOKCP8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8RRnAvFzT0u8qrNCK42QX0vwe0UIHjVoIeCpAkmnSQOGb6F8YkAFGQ8EfK6GDZqN/v1l1vdR+RTZtM0f/zZxqqJM4i0KZqng/hoYCND5CCrpGUe3usVMl2yin1dor42sHDVUc+0asc+ihX7Gbh+hgm5hbFHX+2Fpm8cAU5eImo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsCjCcCi; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-313a001d781so1936564a91.3;
        Fri, 13 Jun 2025 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749821083; x=1750425883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP1QV4sUieItyspzf8jXfbznQKvpoMI7baHkbF85A7k=;
        b=KsCjCcCiuBn9vBek5VNopz2n7N9UA4FcIFwB9EedMxeCS5+Ly5oFXR+hCKyCUlgBMU
         lUDc/nidCO8Wz8ejRG6g7SGSsCgLL544fORFdMmlEOkTwRkPxHJPFXZbVL1C1STMgyMV
         UPt3//U5Oe9rJN/8N6qbwJZlLovO9KN3HEUrxVsjBzxYTjvZEC07Cw08O4h62P948q6J
         BBW8qqGDr+5lHuORzLHbUudBA3lXrbsTWZTacyReOQ9zQYhXsUNWZQt6lJ8KEB4kviHN
         dvUCoG1JS0tScc4RG3Ku/N7N9j5QajunmK+Ck31DB7Uj27h8dRELbB+t15j+b6hUM3GQ
         Q4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749821083; x=1750425883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BP1QV4sUieItyspzf8jXfbznQKvpoMI7baHkbF85A7k=;
        b=t6gzvpNuIEN6m6QNJ5SOby7IjCY3R0/OzhaGvNDXNQgfd/WWO1vGe4jqIGgVJtto5x
         Ps5voZO+3Btx10nHUN+iMApwuLyX4qBE5IzEqz5wgdrWIi4j6JVgZu6UKqZoRcQW/LAs
         DRXefoapNEcXMnzN8hYCMas8W8Hk18Ta6077Esu+0HecwiPLeM2zCcV6HLawEWFAvuls
         8xBnXU+eIzfhye2JYnnkFB0FM2JTsnSSTb5qgXQpKauk1qZfmQkgQEcwA9LBxS/2GAgK
         oEo73HAlNcZbom8bsTb0HPEl0Wy9omnWtQ/Qs9cHjDFhqGaFkp1pQTRyFa6tHARIvgwt
         FBEg==
X-Forwarded-Encrypted: i=1; AJvYcCUmJmvNHdno4zZEVhEj5wh+Na9BiOoL+ed/zZCM4y42rt4paKyVfkqh1YTtz3qQqrfn0AJpgX9bT+vwBjHqIrw=@vger.kernel.org, AJvYcCXNZLRTrUO+SwMDpW+4HRoJTx5IvXBHAUNuvzHT3Dqip8ZNlKgdFVtH9hxKHvUWl2odpNg8A2mSHj5BjPM=@vger.kernel.org, AJvYcCXuqxhXwiMfeZx97g+SC1+a0skoWoXh0QjKJp+UH8ikzUbstLjtzV2qSHYvCwrHt/Wc3z4Gq+gCXXAl6II=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwIH6eKArsM8fIMuifIzOws3uKc85AJOwWjkhbh3uzcZGn95Ls
	SKJnciFLRBhwmmDlfaGPYgqqAEO/UBdsKlYuRZRbjKTBZIg+wnG6ZWP7yw/0p1X/
X-Gm-Gg: ASbGnctI1l+ygpBCwtugh6ImwxuKsVbDThAsJGzEhPdzQ0QTDmsnmctTQw3nmB0n49o
	eDqFnij05s7YoedJRDm4JIDjlIEaTfsUVCV0dqbqIpA3/9gyor2oMh6PutwwokUSFuXo7uyq6q6
	btL8Xen+sKMJE5ttRAtk2SNljdOsFHiCryr0ch2o7XAhh29eFYNBS0bMXaEPgij6DkIFIIsk1OT
	bZ0BOyJyvvD2A7HyyO9vYvXQcjV+HOEUOKSL2eB7rYP7mVzmr5OqsrF1WVVpoqdfsWzZjevatKM
	+zxC+ozultyvR/0lxzvlDBnLrTjsRwzKDpX2Q30uAYMXRD8yGIvx9QIyjoo1olzUn8cx9Xzq9Us
	=
X-Google-Smtp-Source: AGHT+IGekiRSBJ+kbms44njHRzdmd7Q8ixErbibo4Dnrs3p9LH0tWKgyorpHc60qghBSU+Ldv9EaMA==
X-Received: by 2002:a17:90b:38c7:b0:313:283e:e881 with SMTP id 98e67ed59e1d1-313d9d797c6mr4835640a91.11.1749821082701;
        Fri, 13 Jun 2025 06:24:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm13807225ad.131.2025.06.13.06.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:24:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 13 Jun 2025 06:24:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org,
	jonathanh@nvidia.com, tglx@linutronix.de, pohsuns@nvidia.com,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	sumitg@nvidia.com, linux-watchdog@vger.kernel.org,
	wim@linux-watchdog.org
Subject: Re: [PATCH v8 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <5c5ba239-f8e4-43b5-ab58-b3850c57d74b@roeck-us.net>
References: <20250507044311.3751033-1-robelin@nvidia.com>
 <20250507044311.3751033-2-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507044311.3751033-2-robelin@nvidia.com>

Hi,

On Wed, May 07, 2025 at 12:43:09PM +0800, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
> 
> This change adds support for WDIOC_GETTIMELEFT so userspace
> programs can get the number of seconds before system reset by
> the watchdog timer via ioctl.
> 
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index ea742889ee06..e3ea6110e6f5 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clocksource.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
>  
>  #define TMRSR 0x004
>  #define  TMRSR_INTR_CLR BIT(30)
> +#define  TMRSR_PCV GENMASK(28, 0)
>  
>  #define TMRCSSR 0x008
>  #define  TMRCSSR_SRC_USEC (0 << 0)
> @@ -46,6 +48,9 @@
>  #define  WDTCR_TIMER_SOURCE_MASK 0xf
>  #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>  
> +#define WDTSR 0x004
> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> +
>  #define WDTCMDR 0x008
>  #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>  #define  WDTCMDR_START_COUNTER BIT(0)
> @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> +	u32 expiration, val;
> +	u64 timeleft;
> +
> +	if (!watchdog_active(&wdt->base)) {
> +		/* return zero if the watchdog timer is not activated. */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Reset occurs on the fifth expiration of the
> +	 * watchdog timer and so when the watchdog timer is configured,
> +	 * the actual value programmed into the counter is 1/5 of the
> +	 * timeout value. Once the counter reaches 0, expiration count
> +	 * will be increased by 1 and the down counter restarts.
> +	 * Hence to get the time left before system reset we must
> +	 * combine 2 parts:
> +	 * 1. value of the current down counter
> +	 * 2. (number of counter expirations remaining) * (timeout/5)
> +	 */
> +
> +	/* Get the current number of counter expirations. Should be a
> +	 * value between 0 and 4
> +	 */
> +	val = readl_relaxed(wdt->regs + WDTSR);
> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> +	if (WARN_ON_ONCE(expiration > 4))
> +		return 0;
> +
> +	/* Get the current counter value in microsecond. */
> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft = FIELD_GET(TMRSR_PCV, val);
> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain.
> +	 */
> +	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);

This results in

xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_timer_remove':
timer-tegra186.c:(.text+0x350): undefined reference to `__udivdi3'
xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
timer-tegra186.c:(.text+0x52c): undefined reference to `__udivdi3'

when trying to build xtensa:allmodconfig.

Guenter

