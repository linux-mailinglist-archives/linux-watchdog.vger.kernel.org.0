Return-Path: <linux-watchdog+bounces-4032-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C968BB2FE7E
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 17:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E136E7BDCBB
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 15:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E98E274B34;
	Thu, 21 Aug 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJd7+HOL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1962749D2;
	Thu, 21 Aug 2025 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790543; cv=none; b=BYr/qUWoNVwjMnXnUZUrPwsG4246g7aRFBzhA0xlfrOadgZYKiT2EyiLlWOYJWvEYLxJqKA77gJNxpsVT1/gwhO9uZqInEz9Fp4b8QQFdHyxj9hSY+EYdRAE4lLA/2uZkFUisT2TlvqsvuGJ1w/0qSIL6CttDNEUJ4xleVNtraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790543; c=relaxed/simple;
	bh=TA5nLH9FettIz/NX5rkBkdZrNFHIEynhmykHMfiu3qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NroECaltOY5hADE9XMo6rkUHOUa31cNL1HAw6pEPcEKODYvs7vxQ12fWr9P2ZsjDzFC/nEeVD5FOlitEQW1KaHPqO095zWHnP6hyDyc6bZMDRQf3unKguyuma/+WgibDihckwlEvdzLna3NYTaYlJRxM3znbICWR50tKdTIVTuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJd7+HOL; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32326793a85so870379a91.1;
        Thu, 21 Aug 2025 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790541; x=1756395341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNbtJkl9CbiQnQE9KMMi2+OI3EANu4Z2H3R0mQsMgOs=;
        b=TJd7+HOLfQGDCNEv7DFGETLkhOl9WvVhCjI2v986LOzTO5+J0r/Lnj8e3MP+Wu40TU
         GIKxnviJa69cGzaIo2Fgg+CCM5/ZoTTw56JMFvEYHdos2mibOzKczbodlYibIJkv/KvH
         pLFCE/fEI0tJ2evQ/akCHxZOgeL6bYDT4AH0nBIK1OZk9VyZcxy0DM6qowblJ+ARgmZ6
         Wlffk0PMCn1aHYW9tPMSx7rbRv78M/Qq47Xb2H5GJBY/ln7f7bGeJQZOyTOph8WA0kbE
         fsHM2nPDrFyzdfbNgbFOqnEnmK61DPwXSJaJXJJ087oL0fZFwHCT6fG0U01xgrFGXK50
         30wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790541; x=1756395341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNbtJkl9CbiQnQE9KMMi2+OI3EANu4Z2H3R0mQsMgOs=;
        b=tYaVCriPIkz2tNH7CwraCYma8epVHC01lLJEpkdvNip/Et25kbTwIfS7TfFhW+qAyV
         L+HDJruvVTuSLlT/ufnJJWSCEd3vlZBihhjuUfpMVsQpvsnxtf8WFAQhI42zP+iANotU
         VW7x+8lD3ZwDUbHgG5NbxBlYzuBESSiYzx3//NI/dIEIW4AnnzjBymviWo9jI1W3VUh6
         g+xRiy0OvoZ0unkcT24svRlJVZ1WEquzt2qCDT+v9w6EeUh04PTgmyBmnCCoLD717kcY
         7ibtdm90/RYJBBDMcYsFfxyLGdjKkuGWzjHOExyD2kz/epbVLkmEMKHKIZX2w/uqu/BW
         N/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWXt7Mc5yd8l15Jt3AuEsltmU1Mtz5MBXmsdltAozogiK5zi/qhMRss1EyjAhwF/uIhF1rt9Xx5pWXrd5h4Atz/qU4=@vger.kernel.org, AJvYcCWbC2TJ/HoBnPSm2tuxlhoQd/KZO4n7WmIqRrjEhv3m8Vth37GptC1XWyEqm7r0TQ9H6Sb1wIvq4t/1ei4=@vger.kernel.org, AJvYcCWsZmCg6ZRlt9sIdJgtMHvByBgTNsOWG4vHdp1Mfe5VLvPsXsmxZKnsHkuzxp5c8+t81rHE2uiswiWYx9pIHkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc15mxY8xh1/Tx9LenLugZImQtYb1hFoJTz/DIsx4EGUJFpM0a
	U8ccKEuDw6bLm3K7/EJwCrauTxViBCmA3f0KXnaXr9mZbXVmVr+Cs2EA
X-Gm-Gg: ASbGncsGJ4X+NsH5Ry2A/uo+iEc8YeHY7HoMJCxX2+QQxRg1ay51KMZhShGckKDjE12
	Nn6W7E/0fxP2VsGLlL1DahexNNkhwbuZajtnJwnrX8nHFF+wJhMzmFWzXIFSt4Wt8mmC5PvWAXc
	pXektAtqc3bRQTmXwONDCkMm4NtiZW7EqmAoW/z9Bqf4o3+EcjsmzRQOT8EmRe8Fh2TWncXaT8q
	3vWC6eoWX4JVAXzEk7eyXm9gPITjjde9r3lpROYlXVodJbxh5KuxMohM70dENLRA9AtydGjsDfS
	wvQfghyzUxC3ZSebxG0VpBe0sqTnt+a3+Pj1NrpPaIe/ilMtY7KDR6sxSqZXHDT6ztIzxz2ZX9k
	bu0EgYbP4OHzufY8iVpV80GKTQd+0Q73Iwk0=
X-Google-Smtp-Source: AGHT+IHFGccMI4lnf99eQXSJ79WIr7CQog+uTRFdduTinDQOubPQFn2xjjcR2aWXeoHOPY0FZODa3w==
X-Received: by 2002:a17:90b:3dcf:b0:311:b413:f5e1 with SMTP id 98e67ed59e1d1-324ed15b898mr4012790a91.32.1755790540864;
        Thu, 21 Aug 2025 08:35:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325123e7879sm98778a91.1.2025.08.21.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 Aug 2025 08:35:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_CNT
Message-ID: <ee1907af-108a-421f-8f99-fa04261ca351@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836@epcas2p4.samsung.com>
 <20250818021826.623830-5-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-5-sw617.shin@samsung.com>

On Mon, Aug 18, 2025 at 11:18:25AM +0900, Sangwook Shin wrote:
> Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit WTCNT.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index d983cbcb975c..915d3c88565a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -357,7 +357,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
>  	.cnt_en_bit = 8,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -		  QUIRK_HAS_DBGACK_BIT,
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
> @@ -370,7 +370,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
>  	.cnt_en_bit = 8,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> -		  QUIRK_HAS_DBGACK_BIT,
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct of_device_id s3c2410_wdt_match[] = {
> -- 
> 2.25.1
> 

