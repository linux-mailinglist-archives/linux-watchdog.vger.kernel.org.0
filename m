Return-Path: <linux-watchdog+bounces-4030-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BEB2FECB
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 17:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9E9B00268
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42DA2701C3;
	Thu, 21 Aug 2025 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byEbK2LR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C5623E359;
	Thu, 21 Aug 2025 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790490; cv=none; b=S34yKNrHYKIY2NHpC1DHX+eYEutRPDxAzOwEkzi18yLTfnxiOSwD780IHpK4QE+lO8JHP14oP1hI3K1LO7ufhHI+UIT1NytOr7dGOQiaiB0paZb0PB1rqfppF84Vmm2XpkQiDveoqPI+7AbjVO2EXdTMwYDhKVtIWCpbAjTdgLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790490; c=relaxed/simple;
	bh=guKJXmCwkwU9PYeJnZlpndZK/pCn72j0ZjDmbS7fyWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beDJo6dPQsYGQKsqHhyg34gi0caVeBRKVC62NI1A+pyucgkFV8Mc7+kPagM8FFory3hEHWGmTAw6AN2FBqMh4ueZQeACq03w4NhzyUTS4+uPbUF0IjaiVsTf8OHWfHPB4ULaZI926RniYZmgjg/uLZde1whyAmB8lG1muKc17vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byEbK2LR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2445811e19dso9880405ad.1;
        Thu, 21 Aug 2025 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790488; x=1756395288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZMkN5YvHpJeNte42wZOPpEqbuPgRtmnzX3DDrAk664=;
        b=byEbK2LRT/SbTSCILozMm9krTPK7bT1EbmPl056Ks04+O/RkdvMThDi2S5EPe/G5Eu
         fAjcSHWLqFqNdVHw950BPE/1u2TS5Tlen7D0Y7jtQkEu8MF3KlbUiup6WQq3OT7gvqzY
         qpR4wfOEcyLB3EPtLLBU7DU/cE7ECzhk4Ef0GvN6kJywH6dxEi5UGs6Zeid/S3ntsnOE
         n8NnnOc25x8E8ANBRvJOW2oVbt+jhoXCFRsK3FyjatkIUmNiLzgIs86n5/2preY9tDJI
         aRvcEm5AOxjp+cmMaG4YHwT6B0csilLnIs4iZy2Ruzlk0UxHg4sjHP+3t3qlShYzXQA+
         qDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790488; x=1756395288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZMkN5YvHpJeNte42wZOPpEqbuPgRtmnzX3DDrAk664=;
        b=ODn8A69CnAMzTKMs7gKrbIfUGeqKlh0zk2YccvnyWfCMMYHigYbH/MY0xZZsjjcQwG
         PnyiZZin+ZhdEeNw7mRnY6Aw0mVdPac6L6RXThpWAJgi3b/Abz+3abLz1slRDLWdffLX
         VhiFgDqPbcHu3P8cx/JWrCG56/ikyNmWe/3JPQQP15zqGHdXg8HwTcva0VRpoxVIHdnJ
         WFcTzMli3VAo1bjtrqcMvYi9s4D0csOQs/zycRZsc3D2fjfa+t8Q6dSTZLzqIU7wDOwt
         ootkBe3CMwIioOEmCi9tNpZGCqu0a8So5XxDoFKkSlsMTELg/c/AePIFBH4FoRZzwAIU
         Zo0g==
X-Forwarded-Encrypted: i=1; AJvYcCVlh+wxsRFa9h50Bwht1TJqfL7V+02c2nY2MpTJC/uhMq2DFftjmj/phwxTegXatVT96c3hP3SAnHAkavutzLXndL4=@vger.kernel.org, AJvYcCWz4u1RCg4NKZJvPfjhTD7cKuVgtKW2vvwCg20cepkkzQd8aaCYtSwOPaDEAgHl7RUGG2QLggDp/tnG1DHUkTc=@vger.kernel.org, AJvYcCX+hkF7mzRUbrYOvsnWWUcZpSACQmTB5Kd89u3P61UMZkLiw5WoxDK6KMsSvRA9ohg45/0NGrRTXaW9n+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXihPqfWOMW02eYcs5mt2FA/OuM9CN+R9EemC5JBNIOeEJY/G
	lyV7UwBsXa1anrLr/ip1RiAsRxsf7fJNxs8SIff9jWDU8G0jy0W4hati
X-Gm-Gg: ASbGnctQwDz6lU3H4aNDCcJX/z/kRqezhYd71InBexE1ukGRgMzEWXmzIa2u1sNf51s
	cpzxFubk2Qzc17O3gjI4G5BQ/Fj0BGqYYsjzoTvZq68pCa00PDYan4UkaMmMzfhV4Cexj8pp2v7
	kWnpHir+CE+pcyLu6KAExjo2E8hEoBgysSBui8o26EzsAMtRKrwaBZ3K59eihSyfGZVwCyTl9xG
	O/yPtchAw6y1p01u21TO/Qe2BuNF75qDFiA0Q2Ea9FFM4ZBIHujrWzzNFw3zP+qI4s+6J6xutXZ
	gLqgCqr34GGGM+6gY6zQU9vinp+7NVOpJ5++raUtZySTOPQZjV6SJrKLH6mox56y3uVHjLyZEhP
	wqe59z1uch8axrBGEnFiZrmS4NuhkTjyja5DTY+CSFHrn2A==
X-Google-Smtp-Source: AGHT+IGy7lLN0XbKBJzGbkOJWP5hCwPYT0HFzGwRoCFGoJH3tmocfSIP7t5zy9AEvNNLlOYoQuCGcg==
X-Received: by 2002:a17:902:f54c:b0:240:11cd:8502 with SMTP id d9443c01a7336-245fec04caamr35159015ad.13.1755790487983;
        Thu, 21 Aug 2025 08:34:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c745dsm58574395ad.73.2025.08.21.08.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:34:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 Aug 2025 08:34:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Message-ID: <f7f009c8-3f7b-4493-9120-d45d42a8c5e9@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>
 <20250818021826.623830-3-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-3-sw617.shin@samsung.com>

On Mon, Aug 18, 2025 at 11:18:23AM +0900, Sangwook Shin wrote:
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
> is discarded during the calculation process. This leads to a larger
> calculated value for max_timeout compared to the actual settable value.
> To resolve this issue, the order of calculations in the computation process
> has been adjusted.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 95f7207e390a..1e8cf0299713 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -27,6 +27,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/math64.h>
>  
>  #define S3C2410_WTCON		0x00
>  #define S3C2410_WTDAT		0x04
> @@ -410,9 +411,14 @@ static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
>  static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
>  {
>  	const unsigned long freq = s3c2410wdt_get_freq(wdt);
> +	const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
> +			S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
> +	u64 t_max = div64_ul(n_max, freq);
>  
> -	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
> -				       / S3C2410_WTCON_MAXDIV);
> +	if (t_max > UINT_MAX)
> +		t_max = UINT_MAX;
> +
> +	return t_max;
>  }
>  
>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> -- 
> 2.25.1
> 
> 

