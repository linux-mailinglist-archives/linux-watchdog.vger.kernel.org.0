Return-Path: <linux-watchdog+bounces-4033-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 378DEB2FF06
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 17:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FE73640E75
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 15:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E789A2765D6;
	Thu, 21 Aug 2025 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqDW5n33"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D939258EFF;
	Thu, 21 Aug 2025 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790558; cv=none; b=nT2TM2YERLcyQOdtz89dhnmXY2F8vIg7dvvOJ6ogoG2qBmVQ2q9GmX77pnjov1v6j6ZaD16Wn/JiG+zvjRqRHHYIKauUK2f0PXgoa2r9YE+bISnMcdENKcVKMJMOodkzfQXC/stH9socD+dK0OfqlGs/OC4LUvAtAKTmF9A+hwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790558; c=relaxed/simple;
	bh=s82GxoNSw63yRZx/u0+Xxio+PIiKpP4YwVGMnr28pv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVxC/nBrNSYJrdaGSdx0lKuN0S2sb/kodDpEwecd/Q5wexgYDWAObYhCSq4d1zf+JYuioUD6LK9vvAGh7U0ydgd0h3VN8XDef6yIZQ3MVNIJL8szVXeoZN05x0TVZhC3Wmu2o//QrXtuSqvfR+4zLcO+xhnnthLYsx9ZPEO7EiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqDW5n33; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-245f2a8fa81so15634215ad.0;
        Thu, 21 Aug 2025 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790556; x=1756395356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMyV1g4zn80PbhfAc9iWBO3qy/khW3/zllYxtdudBRY=;
        b=OqDW5n33ztzGfzYnTNt48WQChRpq9dh6R8iwydErRcUk8kBxTdFQgIXRC1hMn6MRRo
         ekKE23V5eGRoBEMXyg5lAFEPGTXckj7dkW7aU7Qsm+LKcmDqIPzV1e39A86RLYR9edDC
         FYpdTPB15TzwDxHw3A4UX06BO5OcpX5pv3q/WM/WB1bstqEAqulySsrOPbBU9kMLsJHm
         K/1GvzCo0Zr4/CQrPF0ws+Tr+Q3tiFtmSoHbxTOxoaIxk6BTrCpVYLCzEcWPEthDBdwh
         lhUnHg9ks4Rp6xZwWAGK/cVofNSSRRjfl5QSeB4wEJ0L/JNI61U9KYEzE2y+ZCnvB8Gm
         SBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790556; x=1756395356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMyV1g4zn80PbhfAc9iWBO3qy/khW3/zllYxtdudBRY=;
        b=Egar0tCYGm9yzXZhpXMza565LDBCR0MLw6K3pkSaYsb7Da5DWAb+74L8Mo9REDXSNN
         WN4xikjS8djDJ/utrm9HmCYxzSVdcuxKODENqFUlgImD0C837LYL07Uv0U/L4GfDfsnP
         Q/z8RcBRvn63C/6DqCjEMRbX6SGuf0cfFmEtMzN4XB+yMfX/gqvLVLl3ZqOcVTXbM5bu
         meMQE3V/4i7C8LKQVcAZx6w0aZQ8yFzZzDdUO2KoAtECntIdI+utVulMcDHnj6/U+sgW
         jxUbULv3VWF9ceRJbobP7lSXV7mh/MvzUNXmwjNxN+NvIkRJ8wmi73NcHza9Y1RFIkAY
         cX1w==
X-Forwarded-Encrypted: i=1; AJvYcCU7ohkfmhx4e6H/utrtIVNqBGeMT1Meft5EUgF87lWCKmS4g/GMtF952l2om195xb6BUsfZBgfR5LCiG8NntkEy4iw=@vger.kernel.org, AJvYcCW06NEAY9yqcMbq99I3STVSToJWNKBw2D+S9Gt9c86NB27iQFTxZPZqv2ve0l8k7T57MaxPG91YMA31siM=@vger.kernel.org, AJvYcCXGrCRE9NMCj+hN+iVKnAokUh6LdKfRaM0XNa/O2MgGknmCoZyYBBNsl7glKyGQJZozaG3cSr2CvMQeqSY4R6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YywQsZhqBVRZhCXRCw9XLee7k8S+CgACABK4OgQfYPURHtKaP7B
	UbKp1lEBvp7XHDCkAGEZ9GSPGPi2ZgJB7/kDojZZ1G2gONH18Jet4f8E
X-Gm-Gg: ASbGncsHXJG64uw75UTlw2UOkQ//RVYJXNG/Ut6PvOa8hKjRcM6ZQuNcYt6MTigj+SA
	dOg677dOKEQLkShtzEkzwEcGgz6wQ4NXffUD7mU6r1TNe9oE8EcHGAfe8dD+XFHou6du+tpO4B/
	/W5JB6ZDlaU2bze1cHzKRFkouhEVE8h4JSD9xJVepqfOQJk2pNyHrDa6fK0r+uzsPXhI+KiisA3
	AOX0mpLS6vtkXhFdZgajDNLYRSymh3dzg8I9nWiEhNmZU11vnK4o4iUKsthApNEgFnWa8S07gww
	MTsSegAP/1KNSydWx5rA3iln6Obe/rIrdJgTTYu0phsJSjNbTdvz5VkIqOkXa1j0SFlCqcl0X7H
	OpcmCTpfmmXLhEBc+ASOlJxKFvEtXL6xJ2+jzM59CWqjeRA==
X-Google-Smtp-Source: AGHT+IGrMWesMUWnFglIGSBoWLu6F3+7GZd8RAE67E8bXFw1pRYGmeUsNSijIB145sp3eYLYZFRBaQ==
X-Received: by 2002:a17:902:f54d:b0:235:efbb:9537 with SMTP id d9443c01a7336-2460238be4amr27003675ad.3.1755790556289;
        Thu, 21 Aug 2025 08:35:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325154b70e0sm71365a91.29.2025.08.21.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 Aug 2025 08:35:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Message-ID: <8798e925-6c99-4efe-a0e8-5cedf04a3403@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4@epcas2p1.samsung.com>
 <20250818021826.623830-6-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-6-sw617.shin@samsung.com>

On Mon, Aug 18, 2025 at 11:18:26AM +0900, Sangwook Shin wrote:
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_CNT
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 915d3c88565a..b774477190b6 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -306,7 +306,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
>  	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
>  	.cnt_en_bit = 7,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
> @@ -318,7 +319,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
>  	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
>  	.cnt_en_bit = 7,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
> -- 
> 2.25.1
> 
> 

