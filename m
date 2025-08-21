Return-Path: <linux-watchdog+bounces-4029-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D8B2FECD
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 17:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A4CAE7D1C
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046C9274B34;
	Thu, 21 Aug 2025 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvBn2kNr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CA326C391;
	Thu, 21 Aug 2025 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790454; cv=none; b=X3BwI25EItZenEU4DUAutLmBFGyiQJGl6c3e2/0VQ2qp/dCD/2EDV/l2LSoea6v3Q2ODvTSI5yxucE0Rpu4oNxF9M+KR2fyHJHAkAQQTHgMd5Il7plQh1wkRFS7e8pgzmPDyhVfiaxSYCCIi5FH+RqIcpmNE8mGs0D9wvj+ayZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790454; c=relaxed/simple;
	bh=ZCFeNAshEFhCWo4sDPdpaN8gp2jA/pCiZT260Rj+FzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xt+anhLGE2GapsBXVioqf4xxjdwSSSUg9PD2HOf15ujzkIQH2BnXKpcd23utLJIkgN94KGlN+l7y7pOP3Of4sP/l3OwyyMdKjeWa4brCIcFSFkbcAZ7Cc6lcpulQba0c3m3OxCZdaK6u+7L6CG1eQjHtoQqgX57TQ3np22Wo7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvBn2kNr; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1181779b3a.0;
        Thu, 21 Aug 2025 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790452; x=1756395252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhbMU6v+jjbb6Z6LM8sDFyUeJpRkw18OGXHOosKZUjc=;
        b=SvBn2kNruJr0m91JbyOkPhY4cU3LdGe0V5Itg5cwjidHCtR5VVIUVh9x7CzLbtzTBR
         C9h2+sBqUGL96+Px8EhaY5D7IqggIfChYHiNDenBJi+t02UtDxntWSziGUxb0MiBxY+0
         5dymRhC8f3H74HJBh+QFXYNdMnQdJZWpxej+NDjLKxT0yP6kACQXz78u04VG7j5jOplx
         ZeERf/KwNKEBw6IvkhePb3xsvd4m5iL5sTB1GhLC4TNXoKrtaelhmJahI1TZBcgLs0ry
         H7YRfnh7nSRukgQlzVtJ7xJKsoiphXAB4pQHEKoZkGoWyUglnFnmPglB3XMvNR/3MzSB
         dccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790452; x=1756395252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhbMU6v+jjbb6Z6LM8sDFyUeJpRkw18OGXHOosKZUjc=;
        b=PlXJhonEVO36zZ292P6cbjpGuQlA644nsmtHsz8WTDgUEOZik0edlYoOafcKCjwQRI
         JPcF7Ntbi4chmZvHwoferBEyaRjU1bA5YuPFUbe8enDU4+wRfvxEV9E/LLOMFjj4QmnA
         0m6q7r2DDZeyU1gLQBK1jO/quIIYoXjlZ+nLGE36JGlOvW7Q5nwMvEdKn0QJGzG0HeT5
         Qy5fgX9DnbuGHqzN2cXUUwtZb771bJSOjvCJn6Ia8lf+Zh8Jq0oOpD/o+IMGfS9iTXnf
         +U+iu5P8zmo0oFsPDSmi9P0EhS1vj/C/+W5e+n9A7euTb+1NR84Aul+It1VP64gR6vLg
         CxYw==
X-Forwarded-Encrypted: i=1; AJvYcCUOu8i87ePvFbvacCQqYan1IPpNxf+3n9MxkterHbRxlthg7LB2wR8NaPHQNanbOG8q/qx93SiNmTrzpWQ=@vger.kernel.org, AJvYcCWOBWqZrRang2VzfkwGc7Bv4uI7RJ61AbSxt5HKboDqKRNRmvstw9q90LRoKaQpIhYsoyHI7gv0X5zeSQbcmCw=@vger.kernel.org, AJvYcCXPtN6zXA0nJl9LcBtEF6r1lFrY/hvVUzQpPmV0MmPrUuFVRjXaw6qVARP+cwyNqpEXcgBYG/jpscREk2MT4T9Lrt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxirt2c5E4sgW1okITetjLmoNpbugmOv82BRo37aSL2SjJc1aNC
	fHkzxnu3Rb1jxFOwfjZ10o4uQ9FNufI0zFxgz7VppLV3wc3SlND2dVqC
X-Gm-Gg: ASbGnctwV0tKBySu11TYRLiLCPa7Y5W04DXhBe7cFwhwYyJ2ceXq0TS0njDFdTLUOje
	YN1xsr/0pn6mcvPvkCjJzr6G1T54WqCKXuI68OVDlqSl5QG1QhCRVRZAJH4s2Q6gCCixOAlibPl
	PUl1o84yeR7jXWhEcdXmEc1nerTE7r1nhHypK3LY5r0ihfjBHJPq03MXWSogiGPKM5U3ref7jI5
	g67T7vcXgudQhX/TCBzz3ldg9OlSy6JXkN50HkxLGR6/GTtzdgCGZ9vV8Z05U3Dpy2c3izh9lD/
	xflGLcsV17sf2mJqJ3r+G9jd16iGnnFyF+cuKLetDhaSlpfoqgUZVBehLK+h9qH3a/RiS6mML4M
	YhTsgw1sU9mxWea0/+YtP8ETMN5g3t7yF0cF4GncOmbb361uaNJh9uPSC
X-Google-Smtp-Source: AGHT+IEfixcJibn3sKeBVf1yb6GiXC8iqzvWoYUmwD9JZea+OYTONZjvXbmz56Cn68D44vOXlPbaiQ==
X-Received: by 2002:a05:6a00:4c92:b0:76f:9e0a:f790 with SMTP id d2e1a72fcca58-76f9e0af8d5mr2510888b3a.19.1755790452337;
        Thu, 21 Aug 2025 08:34:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d11c8bcsm8603434b3a.33.2025.08.21.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:34:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 Aug 2025 08:34:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] watchdog: s3c2410_wdt: Replace hardcoded values
 with macro definitions
Message-ID: <c9306682-6f99-488e-bfc9-4552a06cdce9@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50@epcas2p2.samsung.com>
 <20250818021826.623830-2-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-2-sw617.shin@samsung.com>

On Mon, Aug 18, 2025 at 11:18:22AM +0900, Sangwook Shin wrote:
> Modify the code to utilize macro-defined values instead of hardcoded
> values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
> S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
> difficult to understand and reducing code readability.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 40901bdac426..95f7207e390a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	if (count >= 0x10000) {
>  		divisor = DIV_ROUND_UP(count, 0xffff);
>  
> -		if (divisor > 0x100) {
> +		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>  			dev_err(wdt->dev, "timeout %d too big\n", timeout);
>  			return -EINVAL;
>  		}
> -- 
> 2.25.1
> 
> 

