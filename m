Return-Path: <linux-watchdog+bounces-1503-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7A95A845
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Aug 2024 01:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEB71F213D3
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2024 23:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AADF1741FA;
	Wed, 21 Aug 2024 23:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNnbrPDR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6B1494AD;
	Wed, 21 Aug 2024 23:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724282887; cv=none; b=BnOv/7hYIDK9St0cR1GvAo3zk4mmMjKUXUNH8W23+DYQwPAgtqJ6knptFbb+li4RtA1UZyDCgngQhy8aY7n3DZymKxbZvHaki6LCx5Fj9ZUXpCWGmqqNU7jXdWAlR+Tjn1MIyOktKGwPntDgCZ+LosAbcZWj7xofi/EfG18t6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724282887; c=relaxed/simple;
	bh=bmspfLGRSyPfr6LEXPKJ1LZ8cusLiFmBRst6H1MBHbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5KP0C32YB+Faeu7eFS71ItPF3G5DAQXvYkgZyVPwH2Rd0zcnNOVlE/2RJnnTC4SWinbzoSLZOZu0Zfrnn7HV7/7/fSNEWRHk5PQneg/1bi/rZgnzJh5nO8E6Ijju/OcMiYTO7sQvyuwZIzyoZKVI5H/aAbFDACXFyE+0HILYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNnbrPDR; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7cd835872ceso162628a12.3;
        Wed, 21 Aug 2024 16:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724282885; x=1724887685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzavSjSr+Ufe9KXvnL4Jh01VE4pUqT4qvpYJpFBfiZo=;
        b=ZNnbrPDRUARHs9B5S60URcToNIzQkCtH9lK+cn3lztXC9wFOu0fLNAmct+/Ua8Jpdr
         gEdnzV2o0pNTVUcZA4AsL2QtETTtVFIYYPEgKkibvU5rPX1gw0YPypzeXGbcSjZR2SJu
         r/ONh7cyAIhhzD6eE4gx/z2cAYZvWKb1lCLKF2eta0xCDgCpiHKiHen0hViwi9ITDCAk
         3uhLFfuzgmbBJRpIa8IOXVC2hYw2WP+Fk6LPrKTG8wDIhIJwYNttP/Ige414JSBVse6Q
         LM5lvysXRuufa3Sr/HfJPU0IoYrxO2ydWw9CwYhrAtEnpo3QZD7qrn7iMBOzV00zc+WB
         UMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724282885; x=1724887685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzavSjSr+Ufe9KXvnL4Jh01VE4pUqT4qvpYJpFBfiZo=;
        b=jI44r/+4jyF/e1OHN8qgIobGqNQrxoWYBZwSbImrFc9c3kPucLgU6NNp8y5juR/bY1
         dcDEWaAu5owua4e4whZRv9V6siNa29HJtMrpkKGhwKduZdFcn8fIUERdsMkJ9Yh+mQ8i
         h0Pj3/dwhWF8wPQ1T5Gb+XfUJWfeC/39UZ+45Ya3u+1+Eg/dkst/yACKBYBTnoYTEhrd
         3nL/0l1ywWwGTf9EhQof39uN0FIHrB+cYBiYvRZ/5v6QZtvYbHoUP5E896ZVVIAbPJrH
         f+Woi6Lppg/2lTBCqOHGvShtQmRwdBHXZQg6AZQlm8gBOkvwUJeva/oM9WHGbvWxqNXy
         EciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlMvHxna/c1JuQIO22GlIjaM8Mqrt62Wc1PgsHQyrvmLqdNhkaBqSYBZljuCGygfpbLEn1njkry/2Pncg=@vger.kernel.org, AJvYcCXLAjaPPCb6g142iY9ZT+k3Gm6mRXf1QRR7JGIHARJ4i08M+ROyxjk630XaTczPpkYF3Av7PVYmjBNM9eWTx0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fTDvlP652FWe/yFOEfWhLCnVEF2ZI03KSngDBzXyKsswaCVu
	HSAIz8okKbd6rjxYN+fo47X+NTNah0z0FlubT/j6ETQJSfziZUh7ITno4A==
X-Google-Smtp-Source: AGHT+IFt99+ajzSZEebPJFQO+Ku1/I6Ny2KXn3iwi9yxGssd7i3YdCIEcDbenuxom2FzMRXzXEUf1A==
X-Received: by 2002:a17:90b:d81:b0:2c9:9b16:e004 with SMTP id 98e67ed59e1d1-2d5ea9a09famr3587670a91.43.1724282884798;
        Wed, 21 Aug 2024 16:28:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613b1c996sm196700a91.53.2024.08.21.16.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 16:28:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 21 Aug 2024 16:28:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Judith Mendez <jm@ti.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: rti_wdt: Allow timeout config with timeout-sec
Message-ID: <a9de6e68-baac-4fe7-a05c-ca4d79ddd84e@roeck-us.net>
References: <20240821201935.1698146-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821201935.1698146-1-jm@ti.com>

On Wed, Aug 21, 2024 at 03:19:35PM -0500, Judith Mendez wrote:
> Currently rti_wdt does not allow timeout to be configured
> via DT property timeout-sec, so fix watchdog_init_timeout
> to be able to use timeout-sec.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  drivers/watchdog/rti_wdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 8e1be7ba01039..7260c67e60a25 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -332,7 +332,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  		memunmap(vaddr);
>  	}
>  
> -	watchdog_init_timeout(wdd, heartbeat, dev);
> +	wdd->timeout = heartbeat;

The proper fix would be to initialize the 'heartbeat' variable with 0,
set wdt->timeout to DEFAULT_HEARTBEAT, and to keep passing 'heartbeat'
to watchdog_init_timeout(). That used to be done but was explicitly
changed in an earlier commit, presumably on purpose. I am not inclined
to accept a (partial) revert unless the author of commit 5527483f confirms
that this is acceptable and desirable. Otherwise we'll just end up in an
edit war, which I really don't want to get into.

Guenter
`

> +	watchdog_init_timeout(wdd, 0, dev);
>  
>  	ret = watchdog_register_device(wdd);
>  	if (ret) {
> 
> base-commit: 860bbe8e618fd62446309e286ab4a83d38201c0a
> -- 
> 2.46.0
> 

