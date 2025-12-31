Return-Path: <linux-watchdog+bounces-4750-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124BCEC14C
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Dec 2025 15:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13F773012277
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Dec 2025 14:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC9626738D;
	Wed, 31 Dec 2025 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzgwFsgr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E418261B8F
	for <linux-watchdog@vger.kernel.org>; Wed, 31 Dec 2025 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191300; cv=none; b=Z3PB2F1ZyYAbfjLfetacoaXAjTBGGckWhTWwBXgn7oosHyrcSr33ibFH4TDSTsAADb3G/i1rte7FuCKhiPxRJup95W4TLLxEAl4P5ercgw45aiblWsOV+pAbT+L2IyKForG626tC1HsvYd80i3zuyDqV05F9wt41hvEiTNOlVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191300; c=relaxed/simple;
	bh=2eFuPTdKA5XuNm5nzNn9/WiAWLq+5UoOPb5Um71Qgr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcznJN00cyz7z1oTbH1Wo7M7xtLsGPvRToHmbR/rrL03TmhlDOiyKwu5FGLE2Jiqj/Cq1XG/WK/GlgyshT8WAUa7QvWQD2+QmCyjmxxxo2+mqjBeZsbr6f+YYBu1a3c8p/pUrsT0kR0gix5JZKwi1Tc9E8uBdjwCeMNdm1AqK8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzgwFsgr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a081c163b0so100842445ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Dec 2025 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767191298; x=1767796098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMV6DeeoDol5vW6Ifpd5XnY16YMsP6em2WlQ7TohT2g=;
        b=CzgwFsgrktAgAZep2PSUtCdm5nfN5f/CUJkJB/asxoMiWkaOPkaN0ug19ycxVChwYE
         LdGeNo698x3oeIRZP3oVru7OYSWgrEcYj46oyMuJ0gU97PEck02V6ifDQ/simNAjylns
         jmzZgiNUBWa3HLOW6kChIkK9KCXFlFM4t6Ncxg7xC/un++0m9E5lqx6H5E7zxQDphCeE
         I1vMkaT5OFgD+cd8LUIsLK8AvCmmfpV03Go5+1JMR/WXOfJMV1Q5LuK6xt3P5KeJYE81
         MpCBF9Gp1Wg0yr4ojRObDhJsu46tZT6CG9dUPzMyaI5b+Q3gkEN54sdkL9I27XwaONgH
         dyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191298; x=1767796098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMV6DeeoDol5vW6Ifpd5XnY16YMsP6em2WlQ7TohT2g=;
        b=xGagyrI3uRNkDLSYOsQHxOLUBvs9aN6EE2+FjBiWS+BGJOoHadpoZvz1jXYR55oBhN
         C3mfDzj+6ATEes53Gs5+gx8f7upE6w6TiC2c9OjFn1JFDg83EkbLOajgjJ3C5vvGk5i1
         AthX7KtS2w2IAA/adExlmJdIDKqz0paT9yLvNEl+QH6xfvL/JDlhWqXayb52iKrJUvCq
         YM4w8XSxbTi7DZGsmwl47Owim7CYajZkhvfuI37gCq4CAsRLTNww85gTzrlkPSQKaAcj
         527iCtzdgQuhvTYphaSVM4x/LUf4Jr0lGtGg+rMbZnxEfg9VM+jUqLVUDkoEMs6fDMzD
         5KQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSEHSTZ3hOSZaXva6F50bg9Jkf5+X16BARiwiFXJpKuzhOvBAjMv8JrDChXxO4QTAtb0OlUWzu9lijEC8MUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9KXK8jhWiI6nUJyzlcnWUTv3TvPAjhCYWLtAakU+Fhy/hlggd
	EfHXdDJMPEvoelnPJ8uHf+HFJxJ0Yzco407JvibzADpOkc0p3hOPyOJu
X-Gm-Gg: AY/fxX6u/Usl5AZwns6Yr8SR3CbrFxUUhURbqJZkUkAxeT0wVAyAsUoODHg69RTiJA3
	ocDnW6OxCGaKYpd7Dgo0v2d4MlbFK2E10Tf2SQYkanq0cFPRc+ngxcBONc8qbCiV+prjbfVvkBq
	fQzROJTAB8vQR/VKlQnODi33IhuM+fZRpQi5u4SLdvfLUssiv2xgfe4FV1BA7UlznougM5DiKIB
	0ge/2oSZ+W/xliufSwfZ7CcE3BC8WJLCl9OCUN0BcjghjMcyHP6PYtjcl9hTRAXNCrKcQginRJ/
	l1ccw7BhxL1piqHcjxql2gEnUWMmOD7PRETUsQn3sEOFl0MLwXD2CJlNENnvuo5KBjQRJh69rVZ
	u6PecTziLsr+Wi9CYA3pOtoAsYl3MdF0svTZMq+YPyFYi7Yht74r+018xwSTGaAutJvxcig1DlA
	KFpMmRyOZRKKsb9WGvDgB3ppTA
X-Google-Smtp-Source: AGHT+IHT1LbcUINYNqMyB9CX8YBrFNHzxw864OFLPJDnx9s6IC7xwrB55T2EWxDGNkf6J10kosGXXw==
X-Received: by 2002:a05:7022:f698:b0:11d:bea3:c93d with SMTP id a92af1059eb24-121722eba22mr29428274c88.29.1767191298434;
        Wed, 31 Dec 2025 06:28:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm135194664c88.15.2025.12.31.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:28:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Dec 2025 06:28:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
Message-ID: <68e8bd60-85b1-4b4a-8a82-f47640ad0ad9@roeck-us.net>
References: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>

On Wed, Dec 31, 2025 at 01:07:21PM +0100, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,wdt" anymore [1]. Use
> "apple,t8103-wdt" as base compatible as it is the SoC the driver and
> bindings were written for.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
I don't understand the rationake from the reference. This patch will need
an Ack from a DT maintainer.

Thanks,
Guenter

> Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
> device trees in [2].
> 
> 2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
>  
>  static const struct of_device_id apple_wdt_of_match[] = {
> +	{ .compatible = "apple,t8103-wdt" },
>  	{ .compatible = "apple,wdt" },
>  	{},
>  };
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 

