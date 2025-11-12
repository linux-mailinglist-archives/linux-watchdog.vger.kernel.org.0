Return-Path: <linux-watchdog+bounces-4570-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DDC54DBB
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 00:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 893A3343510
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 23:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35AD2EBDE0;
	Wed, 12 Nov 2025 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt0Gh3ix"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465C2E1F03
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991644; cv=none; b=VVnMfCbTiCFC6eJ4sQUZRr8srtG5ueloXcycE1v/FoJmSVhI2TRH6/ASo1YgA+Dl5wN3RBETvhrA1YBFJqr5QICMg7/Yrx46KpKq6HA5pk81w3yTLe3KhU5BCfxvOQt40mj4BC1ogn3X1L67gPSTQ+vGcwVtwzLJr9yW0gXlVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991644; c=relaxed/simple;
	bh=bfdAnt6N21QgkLRaO8Sbl/J0PbMxqUZVFCqbeYrPwlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6DuxLV2jSzhGITRkH6hjQLlrIkQIBhkaESEy8UawfAoA54qxsbYYktBtVmfy5qMBM3c+zO27xI+xFtrciUqKQAwnP3TFYZ1puA7dfUfx0eFH++ZE1GhOjFTIhC1is/YFaTukvrv3EnFMSpwIcmMcdikQN8+NmicONkyjFMrGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt0Gh3ix; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2980d9b7df5so1647745ad.3
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 15:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991643; x=1763596443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFSHq2TQze931jnwJtfVu6NeRHbqYueJM+k+Hey5afg=;
        b=Vt0Gh3ixhkgfBabjO4bh/VOWaxyh3VeBVeZWGROcEhr0L+GH0FJxgEsiSDds3GFcG6
         GsbrhGsnThbjab4GNm34zMGyy4FDIJZKOdRaGvyh9xiLkAdeecLbpafuTNueV26JeLbg
         KMnP1EhkXBuWuAm3Hw1tirKOAvTLGh4IbhA+UIrv8A2Xo/xyj3tda1ELHoRhihcTTeGO
         ScnsA3cMc5RDF1LrWDPnyaM4L9w+aRZwFTi5SxoUtE9/XuySO8F0Bl237SBhflVDJHuR
         AcbFhNBjuRUcvhcAwThyNCOqUgHZr0FkSQyKNs+FFCahNxvRkYtl/RN9cJ1QC5Sg1rrQ
         6vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991643; x=1763596443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFSHq2TQze931jnwJtfVu6NeRHbqYueJM+k+Hey5afg=;
        b=BMpX/HeK9rbZVQcXaHLnv+QAauewOdBEVcjovRzOTDoVJcNb4q73wP0Da8xoFe3t4I
         rCFIFZAmR4pImI6p+vnRSrURqTrX1GAEq32Zz75KX25gJMuuUUS0upq0OXhJX4OkafBu
         Y5XSIryBm46o2OfmMB34FNZ+Ct953JPa69GwpPO9A8LHhSW/4chumELVfPsN3vLVAhwa
         ShztHogb9CcWR6+QOmEojhQ2cE4aUdrE0/4KrskXMRMYHgesorOcK+cT3hOnYs5RBwN5
         yenVyslxxzauuStPiEDiHVmw4C9NRas7n+9mMUXZV1CqcNsXVfP5lBAqFAYblAeFlfkL
         htug==
X-Forwarded-Encrypted: i=1; AJvYcCUfaVDedLDOTMSnVS2B1+X1D5GeHsXlb8Hv7cOYLy9Dzi7ZKW2EJrFrD/oPPBVp2LwPfyIBZ1MAQ/0imgnWjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nEMeqQp5FFC/gq7Y7G+y/1mkZQoLiACuQXP77oUTO5u1tpPn
	oYOv0k8A3V24graMoIHGFkRklzVUS/adHG4m874j6FmmFHpSQBcRdNee
X-Gm-Gg: ASbGncs25mVQT66drBcwk4G9xO15qtcUji2gj959oDJSCuuSaWt+UGjWK9nxl4TUEFT
	zcE/dkwvnx6gBnU3TUMAaIQ/dFT0lndqFy1KC9WkBU36Ck5da6kFwHDLP+joJG0SzpjIuZwrgTi
	O0yVWHp2YO8vjjmQwDgkrJDl2HtemoVoAIgaC1H86b1cZRP3tFspbCanDUwN9DFd4i84uJa8i2J
	2VORqg0PTUjAqiMyqnH1kISg4iNJzMckwXKX2X0PNAA4vR43gT7jlQpZJb1/kAZFE+KOJUMT1V0
	igQo7IfGQ+ERmn1AegjozfcyiHunVh6DKggw4yAgMXNQRaSqtD5PUjAM13GOHNNThSYnx+IE4zt
	lO7bOHt9lt5kPMrj4BsVmOdUfkkYI77G/FKYNWjC0Pzs87YlMei5Mehujd5tajuVVcVrmetk83s
	+piXW7aVByn5zDG/htAedCRdY=
X-Google-Smtp-Source: AGHT+IEGOc1HlsHsRPGcd+y4vVfFBFj9v2mqQOArxmZBimDRKkrkYiGkzRLMz1a5z/lHBc3UTthgsw==
X-Received: by 2002:a17:903:2f88:b0:274:5030:2906 with SMTP id d9443c01a7336-2984edcd3a1mr61466505ad.46.1762991642666;
        Wed, 12 Nov 2025 15:54:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245e04sm3389265ad.38.2025.11.12.15.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:54:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:54:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 3/5] watchdog: loongson1: Drop CONFIG_OF
Message-ID: <74ea5501-e4ea-4dbc-8c94-a1ca5d4abc66@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <a374b938f2cc304b7e618bf22a5e8fa9f32e3efd.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a374b938f2cc304b7e618bf22a5e8fa9f32e3efd.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:29PM +0800, Binbin Zhou wrote:
> The general recommendation is to not use of_match_ptr() or CONFIG_OF
> ifdef.
> 
> Drop them.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/loongson1_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> index 781f01f1f888..255198cbf5bf 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -142,20 +142,18 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, &drvdata->wdt);
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id ls1x_wdt_dt_ids[] = {
>  	{ .compatible = "loongson,ls1b-wdt", },
>  	{ .compatible = "loongson,ls1c-wdt", },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
> -#endif
>  
>  static struct platform_driver ls1x_wdt_driver = {
>  	.probe = ls1x_wdt_probe,
>  	.driver = {
>  		.name = "ls1x-wdt",
> -		.of_match_table = of_match_ptr(ls1x_wdt_dt_ids),
> +		.of_match_table = ls1x_wdt_dt_ids,
>  	},
>  };
>  
> -- 
> 2.47.3
> 

