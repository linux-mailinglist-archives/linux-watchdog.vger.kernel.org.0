Return-Path: <linux-watchdog+bounces-3817-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF44AF93C2
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jul 2025 15:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882CA7B9BBB
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jul 2025 13:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827902F7CF6;
	Fri,  4 Jul 2025 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZb9Hk+/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25F92D9488;
	Fri,  4 Jul 2025 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634587; cv=none; b=oaHxnWQRywor5dnoshDr8viqnJjvQyaEkTNNT7zdQDmZliDtKwNh4uPq5U2T45P3CM2MwdcayIn/2h0Rp/4LdoHnOjuN7R2s/mCVirqovggc6pdtLznUPP2GsUs+Nlj8+AxTSyGvkffbCM/CoJYQ6kjohs6gXUuGqshWgvrV5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634587; c=relaxed/simple;
	bh=KiuuQsGgXKamQlcfuLFslgTizWPYc0a+MtlO4Cjk/hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Of4lAwwBLFGorcLmfHiBbZwe8qUusaKt0cfMhVOgTyJCLlTqZ5eZLAMs0N/9LCzY+q9Q/S2TqqMv/cWt/toHuxa+Pfj1JSl4MhnjGMy9lCNCmD8CJB4Kh6WPNDgoe7uRxQMmDkT2yY+wOunyZzXd7u6PcMNthO2cEYgQTJZ6GLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZb9Hk+/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23636167b30so9641375ad.1;
        Fri, 04 Jul 2025 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751634584; x=1752239384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvCIAO2HkPmsR+rjBTB8UTnehZixGY8goOegXYs0T+8=;
        b=EZb9Hk+/9lKRm2kr5XE0LU4S8Z8fyLJZfQfqbIQ8n78vg7XgsWCxlTyDuytGOmTcBS
         VA0GWH8tZtIkLCfBay8FQjLi6p7bqrmf3K9jVW09njHMZYf4n5MFDJnBF7gjoe4gyfBz
         dZDq9aGNTbAVY1u+Q2b03gQsHz2uo1Ao6rEaZ+bMDO4stWsK4Jb4xlplHi1nLZ2gzNN2
         kzdm1mdD8k/xR1DrUNXN0w6V4s+qG3/AwpfJPh28hXS9jduavgk5Xmzq6Aj+BZzu9Cqr
         ql7cisQpTJgzaWklCKRrKTjTkzpIF/DJufDwjWWNCY6V0o3G241lcrca0iT/vRjgyZFO
         Hj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751634584; x=1752239384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvCIAO2HkPmsR+rjBTB8UTnehZixGY8goOegXYs0T+8=;
        b=AxQt3cPzjihtY7PGGZ4cF1soySBYhfUwZ228E1WLRgdQ1/s+HIgMg8kaerlvPz9H8C
         clC8+dEqRZm3TXtX8MYqsD7rcHYPBVU9mRtnv8Tz+o6qqVVR2+e3hSX65dLhy7FjplPC
         CfqAsv23aZhYcGC2nytSnjGYcQ60OszLw9HjHEAyTWfBgl14VP7aXCNXVwQV/BCYwgUL
         3MUSaG46x1smfAKOyHsoDjz5Twj/fbBvIYBB7F82LZzsGI48r+x/WdFu1qYZItlnWVBq
         q8b2nVylRg5na78aTqX8LTVVzA3WhPDr1LBI9VwoAmWlIMFXv+usnwT7hRQuSM/nNhlY
         R3xw==
X-Forwarded-Encrypted: i=1; AJvYcCUUe/QY75v35TcSkwoiBr3+wVIRbHcS3DN8hX0wwcCPWCfeg1RhwpbVOlCF2+6qgxEHzMu+8peRQaLwnvI=@vger.kernel.org, AJvYcCWKWIjzpfJSBdjuywEhYmKSeqxL++aLYhhzFEqXQVypYYk7AG6i3pZJPzTqNRz0eu6F8LirYi+bDx3V9IN1PvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx93ify5OCRHZ0G8Nu4b+PI1DCgSoM0M27vSV/TincH29L45qe+
	t+HHg3nnjEzeQYq6btjQJtOZcohkctUhsEQnRsOAdrYg2TgdtF3p4YvNsf+82Q==
X-Gm-Gg: ASbGnctQ0Ea+zSyt37zO1H2zt7lzmctxnITw8Nuuv2sVeiquo2EM86PHNO/9ijpdiWS
	CourdLqiaF8NZNruW9pO9XBCL4aoW9236kUt4Nyw1QvQ4D25P3dN8Y1jqGQmtvFmXs1OSOqmu3X
	hJaOjr6Gwz1Mm1hmLqYdzJAW+gTdrNLU4jpnO4a+c8ZmtfMfxjNugwhDKDYYP/sT4JRwI50Z9Re
	7GLpG3vhymWExgTcMDIq0WpQAebvliMNWMRA5hx7bzNHojjkivt7dwvgGf0V24sy7IShlmg6Abp
	dHa88FLEB56WXDW9wYVKa7fI/mZz6VI9dMsnoHWLLTHoztkXzT8JmMfB5Lmqi2Qahg55FsEYlPI
	=
X-Google-Smtp-Source: AGHT+IERAETKwDh0tgWJI7w22h3ozsp99e+iUWJZC/yIN7BLousuH0j+z3XeSZZYdoEoNo4B6Nt5RQ==
X-Received: by 2002:a17:902:f682:b0:234:9670:cc73 with SMTP id d9443c01a7336-23c85d8f503mr42105205ad.5.1751634583902;
        Fri, 04 Jul 2025 06:09:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455b904sm19800305ad.111.2025.07.04.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:09:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Jul 2025 06:09:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziyan Fu <13281011316@163.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, fuzy5@lenovo.com
Subject: Re: [PATCH] watchdog: iTCO_wdt: Report error if timeout
 configuration fails
Message-ID: <2066161e-95e6-4316-b08a-0a0f0dcc9150@roeck-us.net>
References: <20250704073518.7838-1-13281011316@163.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704073518.7838-1-13281011316@163.com>

On Fri, Jul 04, 2025 at 03:35:18PM +0800, Ziyan Fu wrote:
> From: Ziyan Fu <fuzy5@lenovo.com>
> 
> The driver probes with the invalid timeout value when
> 'iTCO_wdt_set_timeout()' fails, as its return value is not checked. In
> this case, when executing "wdctl", we may get:
> 
> Device:        /dev/watchdog0
> Timeout:       30 seconds
> Timeleft:      613 seconds
> 
> The timeout value is the value of "heartbeat" or "WATCHDOG_TIMEOUT", and
> the timeleft value is calculated from the register value we actually read
> (0xffff) by masking with 0x3ff and converting ticks to seconds (* 6 / 10).
> 
> Add error handling to return the failure code if 'iTCO_wdt_set_timeout()'
> fails, ensuring the driver probe fails and prevents invalid operation.
> 
> Signed-off-by: Ziyan Fu <fuzy5@lenovo.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

You might want to figure out why this fails in the first place, and address
the root cause in addition to its consequences. A timeout of 30 seconds
should never be invalid.

Guenter

> ---
>  drivers/watchdog/iTCO_wdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 9ab769aa0244..4ab3405ef8e6 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -577,7 +577,11 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	/* Check that the heartbeat value is within it's range;
>  	   if not reset to the default */
>  	if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
> -		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
> +		ret = iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
> +		if (ret != 0) {
> +			dev_err(dev, "Failed to set watchdog timeout (%d)\n", WATCHDOG_TIMEOUT);
> +			return ret;
> +		}
>  		dev_info(dev, "timeout value out of range, using %d\n",
>  			WATCHDOG_TIMEOUT);
>  		heartbeat = WATCHDOG_TIMEOUT;
> -- 
> 2.27.0
> 

