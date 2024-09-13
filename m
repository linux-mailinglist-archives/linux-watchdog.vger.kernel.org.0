Return-Path: <linux-watchdog+bounces-1889-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9537977BC4
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 11:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD49428951D
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2751E1BCA01;
	Fri, 13 Sep 2024 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="EPV16MLu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B101E80B;
	Fri, 13 Sep 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726218056; cv=none; b=iW4aqjCtJ17kIP9ORI6bRV+Il+BRiMeH0Ysni7boRWXXVS6x9ejPtVvACTmQagkqyPYf6qlTaZPfpK+h872pKOTo5uKmzTLgL4BUBZHJF/Sy1fx6dA5msLEflATmOrqW1GoGOE0TFX5h6dByjjPt3/PYJKCKbNfdQksONeffL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726218056; c=relaxed/simple;
	bh=yWD/92u+XFhtQdYKm2gtn2rSyWlAtkwRqZS6BFKn22E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF68CsSr8fBGQqnR1Px324hXzlCpj+PRMdZJa5ReI4QzlSG69b3hcnA90s3GnqnGP+ubW6449FgsLT1J2fsZyMYIizvvzAKu0neH9AYryuxllGL9MjX4cgQRvpl4lXZZyk6Ulg4id5Hoef47q6QSSoYmaUIYKOljBUJU22cCr+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=EPV16MLu; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 87E2640A91; Fri, 13 Sep 2024 10:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 87E2640A91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1726216597;
	bh=yWD/92u+XFhtQdYKm2gtn2rSyWlAtkwRqZS6BFKn22E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPV16MLu21t81sea0feTtu/2h/f0iY2B0ocNE1v1OA6iakls8HysQv0mSGLH7iGvU
	 xnTM9USnjz6sW1b0ZGKlTjbqI15+LOl5IcmOLogGEtv2gHdRPndcrHPo3osTfc7lJh
	 tW02TL7MWW3adNO7rm1NDwfTWlAmwjKGnZ0OFTwk=
Date: Fri, 13 Sep 2024 10:36:37 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] watchdog: Convert comma to semicolon
Message-ID: <20240913083637.GA31468@www.linux-watchdog.org>
References: <20240910070058.40867-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910070058.40867-1-shenlichuan@vivo.com>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Shen,

> To ensure code clarity and prevent potential errors, it's advisable
> to employ the ';' as a statement separator, except when ',' are
> intentionally used for specific purposes.
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
>  drivers/watchdog/iTCO_wdt.c   | 4 ++--
>  drivers/watchdog/pm8916_wdt.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 264857d314da..35b358bcf94c 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -563,8 +563,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	ident.firmware_version = p->iTCO_version;
> -	p->wddev.info = &ident,
> -	p->wddev.ops = &iTCO_wdt_ops,
> +	p->wddev.info = &ident;
> +	p->wddev.ops = &iTCO_wdt_ops;
>  	p->wddev.bootstatus = 0;
>  	p->wddev.timeout = WATCHDOG_TIMEOUT;
>  	watchdog_set_nowayout(&p->wddev, nowayout);

Removed this part since there was allready a patch for this that is in linux-watchdog-next.

> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index f3fcbeb0852c..007ed139ab96 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -218,7 +218,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	wdt->wdev.ops = &pm8916_wdt_ops,
> +	wdt->wdev.ops = &pm8916_wdt_ops;
>  	wdt->wdev.parent = dev;
>  	wdt->wdev.min_timeout = PM8916_WDT_MIN_TIMEOUT;
>  	wdt->wdev.max_timeout = PM8916_WDT_MAX_TIMEOUT;
> -- 
> 2.17.1
> 

Reviewed-by: Wim Van Sebroeck <wim@linux-watchdog.org>

And added it to linux-watchdog-next also.

Kind regards,
Wim.


