Return-Path: <linux-watchdog+bounces-277-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59980F3AB
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 17:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1A8281B63
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 16:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA97E7A23B;
	Tue, 12 Dec 2023 16:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaewN0hw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3AA95;
	Tue, 12 Dec 2023 08:54:49 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3ba10647a19so1473441b6e.3;
        Tue, 12 Dec 2023 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702400088; x=1703004888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ+S0orBz6C1ng5onoO/NzTMLdkN0FeeuOcfpzewD3s=;
        b=WaewN0hwLeWTTwkFfzwHkDGymCE7FrqMoqsQ5pLQya6IJJYJ6PWJj+9MgurHpC43US
         mKtoHo5lAPXhwbJ+qOnSe50usi5364iQFOmVwdCbVwiT9spo3CZgfBZAvjQDUSgcIs57
         TcJNrGA9PUlSxtb/YVNovsRrDEM9TSaT9TUZc7ufpZNhOn+VesbPJEzhfhdOzBLe+Tup
         OyxmMxvCF/lSbC6XNucEfb9uWZt09aP1gaegA7DVMk4iWBcjFCNah1omVk/b6w/NFD9C
         PuIYpstPIRuQygmM3gBCg5H+WGUTjCX1mkIinDOLcxehsZImuPEIfEdFOQPoF/c2/wzj
         WHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400088; x=1703004888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ+S0orBz6C1ng5onoO/NzTMLdkN0FeeuOcfpzewD3s=;
        b=gdkD7LXZmmFNUmfpkUyGmEoApMJ8n2TZ5eOaCJb6pDY1c78QMhmXwuccUHiteSnMIF
         xWE97PtfY2X0rXOftCvur6LWLPJMAIRBqi5nvyZ9eYFEqPch20ZyCdfSScvizipW4kfV
         ePeNYG3wc/XwJuoGm38aFJDByk0XFWPBnZXMMhI9+UCdHLVeXGABVt0H6Oqp3GzHnpYu
         rihagKeU/UGBN9iR8sk+llSh7Ni6VYF3cXakqG5bAsdlUyYtVBF7APc5T2WzFdNzem/D
         Erx6HnpaDhRYVbGdi+d+fU1z2CRENxXaVqzOLcC68nPFhwEZzXV6bnHRj+riyWnNvA/f
         UkZA==
X-Gm-Message-State: AOJu0Yw7biIFJ7GA8RC5kPE0ZHHUJ9yCSJ5Kq+otRrE7xaCcxidkyxm/
	d4bhKnDqq0N5LU93wuYI5Mw=
X-Google-Smtp-Source: AGHT+IGJ2u/eLfuLHjm7rOZQXRm7UyYQB4WC6Nc4Q5fBFWnt8iBIvRvKdqdc9NEQZrDNte02vEFkRA==
X-Received: by 2002:a05:6870:d18c:b0:1fb:75a:de85 with SMTP id a12-20020a056870d18c00b001fb075ade85mr7948203oac.115.1702400088572;
        Tue, 12 Dec 2023 08:54:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id lu10-20020a056871314a00b001fb08477cf3sm3259833oac.47.2023.12.12.08.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 08:54:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Dec 2023 08:54:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
	samin.guo@starfivetech.com, xingyu.wu@starfivetech.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: starfive: add lock annotations to fix context
 imbalances
Message-ID: <794a9aa8-b948-4479-98fd-4417c0f08965@roeck-us.net>
References: <20231122085118.177589-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122085118.177589-1-ben.dooks@codethink.co.uk>

On Wed, Nov 22, 2023 at 08:51:18AM +0000, Ben Dooks wrote:
> Add the necessary __acquires() and __releases() to the functions
> that take and release the wdt lock to avoid the following sparse
> warnings:
> 
> drivers/watchdog/starfive-wdt.c:204:13: warning: context imbalance in 'starfive_wdt_unlock' - wrong count at exit
> drivers/watchdog/starfive-wdt.c:212:9: warning: context imbalance in 'starfive_wdt_lock' - unexpected unlock
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/starfive-wdt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
> index 5f501b41faf9..49b38ecc092d 100644
> --- a/drivers/watchdog/starfive-wdt.c
> +++ b/drivers/watchdog/starfive-wdt.c
> @@ -202,12 +202,14 @@ static u32 starfive_wdt_ticks_to_sec(struct starfive_wdt *wdt, u32 ticks)
>  
>  /* Write unlock-key to unlock. Write other value to lock. */
>  static void starfive_wdt_unlock(struct starfive_wdt *wdt)
> +	__acquires(&wdt->lock)
>  {
>  	spin_lock(&wdt->lock);
>  	writel(wdt->variant->unlock_key, wdt->base + wdt->variant->unlock);
>  }
>  
>  static void starfive_wdt_lock(struct starfive_wdt *wdt)
> +	__releases(&wdt->lock)
>  {
>  	writel(~wdt->variant->unlock_key, wdt->base + wdt->variant->unlock);
>  	spin_unlock(&wdt->lock);
> -- 
> 2.37.2.352.g3c44437643
> 
> 

