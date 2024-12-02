Return-Path: <linux-watchdog+bounces-2495-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8389E0EC7
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 23:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5CF282E59
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2024 22:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3E922331;
	Mon,  2 Dec 2024 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwFxX/3l"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56431DE3AF
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Dec 2024 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177874; cv=none; b=ozjJ/ACayJ1Eu7f3th4NFQXRX5a3C7h0qrdvA7wQi1q22qKsx9TfNUcuRHy5mozneAjKFXpyhtYL1OMb5dU2OkwzH3jcqLYjwd0OX8TIuVQ8Xfq7jf3bwOrjHLNg64ocW0jCHHUcTc691++mxdLl9bRWJ9wuYjX5g/1qPMmQ/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177874; c=relaxed/simple;
	bh=2jccRlna9VYrDkxoeTPsD14/xby02d7ZFMCcV87j1X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EivveITbSEH347qDDwscPK2rQXoyWcANvDwfEiOJnnGNvCCWjIdYlltPf8Ke0bmbAMUDQ5FD8AJO14tA2c8GdR8whrT0yV8xBTq88qOsF7Bq5TCCvFd3a+HEjfc09jduNbQDiSf8Y85qAFSiMB7MG0tDeAxKnZTuoXailFK1mts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwFxX/3l; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724fc1aaa91so4368188b3a.3
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Dec 2024 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733177872; x=1733782672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sHgkDx6tmBlIlrKSrSQI7gId4n9DQzOw2s4DITLMcPw=;
        b=CwFxX/3lCdgDLEpz6cYU6sbA9cduEzC0iSdfmSEJJQsn4e5kOK/uwYxPu3j5HzuqSC
         XQJdHSplQ8NxXySk0NOlpH8Mkorfvu2VFQIE6h/dUZd3u8+hhrzZPSr77eOz7FkE2qtr
         s1h9qovCVPdNcc31hk3MKJK1y950FJgkeWyrFijpEnHAf9ikxqLvzEIhB9iqQPdqH/lL
         HIk5nP65yeDUxYtSgWNYh1DXsQtGdK/yqK+SPiQhDE7ZDBes+rQERh/u8o/yGHzC7IpZ
         yw54cjjTdmgRORlqRkpGibn4zkT6leNVOcucYNkqJ2xXQAjAKQfixVQXaXtWddZ4sfYX
         fxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733177872; x=1733782672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHgkDx6tmBlIlrKSrSQI7gId4n9DQzOw2s4DITLMcPw=;
        b=LT234RUy/n0u/cTXaZ3/DyYuwi3ZB9FcF3o3+GYdKahJPWoZH6o4aogtLf3f8qZoGg
         VtWzLYlADd8+dQbYUwNAPzYmK6JQaMAVjhjeXY7fGCVHsuNLGAy3CEGJrvgMbQcJvTDV
         D4ZGNFXOVj5BAbKx3qdsuY6SB7YNoSxkVCez7efiK6FqKsSzOQ35NcHT4AqzaEVEbXMw
         A0yXBLBP68U7cKlUUZkKkQnSEJVaA0eiie0IG7LvQDgFUjKpe2GAFTPrRUEH/d0P3dlz
         uQdK5fvppeb7nJy3xRrT1x2o6mhZ2JGFttT7QzJrHfks0wnwRfeCQceZIg6+GS2psjg+
         h02Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbUnbjglP6KGSd03BL7JTdCC8/FSwRBajmak7vO07UTCPB81gCD969NgB535daKzFyyR3DHA+Rkx+8c+jY3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbPamdoUiJJ9CICG9XVjaaOd1IcnEUk0lmpTa2s51/C6L6/Uk
	0NtuoZPJ/xAqcLOBpUMtIE+UBLKhu0lKM0yGOjiT99os0dpw+ZEG
X-Gm-Gg: ASbGncu7Qr1lyvI5tIRU/fbskABoQWKDozT4Nilwu16pGws3O9ZjFMMzStZk6CAEPvf
	pLeZ1W51ga5KLK4Bv6iFbDgwvKniMliTF55EwjqN3AtwcwOsy6/0dDDmAUWWOpw5bn1nRnZjvK3
	lkxvcJw95lc5Gf1YhUSSd3hT063kyH23VMqSjUfZUuYzgp68p7hR9vSsae9FDYcSKKRFzsiWd/L
	i6TPdKCafjr3wm0Ih3cQZyy76/vN7zhCQmicD5heKL68JVld3N3KGwU4sAVe8YgFieF4t8Ku1BK
	CM7IRKFSeQrmuRfKf1YbPAE=
X-Google-Smtp-Source: AGHT+IGmNNH6slRYYlkQJqGz9lpFQ+4J3MvE5LYT0z5CTC3b/S1T5N5ugCdIjGWRKdqeGlGl5N+Aag==
X-Received: by 2002:a05:6a00:189c:b0:71e:5d1d:1aaf with SMTP id d2e1a72fcca58-7253015ec8cmr37474565b3a.23.1733177872144;
        Mon, 02 Dec 2024 14:17:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3a2a5asm8332653a12.80.2024.12.02.14.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 14:17:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <51b69960-393b-4e87-84f7-103561463755@roeck-us.net>
Date: Mon, 2 Dec 2024 14:17:50 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sp805: Report correct timeleft at maximum
To: Mike Crowe <mac@mcrowe.com>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20241202214343.2425341-1-mac@mcrowe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241202214343.2425341-1-mac@mcrowe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/24 13:43, Mike Crowe wrote:
> sp805_wdt::load_val is of type unsigned int. When the interrupt is
> inactive wdt_timeleft adds one to the value, and then adds that to the
> value used to calculate the time remaining. Unfortunately it's not
> unlikely that load_val contains LOAD_MAX, which is 0xFFFFFFFF and wraps
> to zero when one is added to it, resulting in the time left being
> understated by about 21.7s.
> 
> It would be possible to widen load_val to 64-bit, or cast the value
> before adding it, but it's easy to just cap the value one tick lower at
> 0xFFFFFFFE so that the addition is guaranteed to succeed. Add a
> static_assert to ensure this remains true.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>   drivers/watchdog/sp805_wdt.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Of course a simple cast to u64 would work just as well. Please let me
> know if you'd like me to fix this in a different way.
> 
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 109e2e37e8f0..1f9a7001d0d6 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -39,7 +39,7 @@
>   /* watchdog register offsets and masks */
>   #define WDTLOAD			0x000
>   	#define LOAD_MIN	0x00000001
> -	#define LOAD_MAX	0xFFFFFFFF
> +	#define LOAD_MAX	0xFFFFFFFE
>   #define WDTVALUE		0x004
>   #define WDTCONTROL		0x008
>   	/* control register masks */
> @@ -127,8 +127,10 @@ static unsigned int wdt_timeleft(struct watchdog_device *wdd)
>   	load = readl_relaxed(wdt->base + WDTVALUE);
>   
>   	/*If the interrupt is inactive then time left is WDTValue + WDTLoad. */
> -	if (!(readl_relaxed(wdt->base + WDTRIS) & INT_MASK))
> +	if (!(readl_relaxed(wdt->base + WDTRIS) & INT_MASK)) {
> +		static_assert((__typeof__(wdt->load_val))LOAD_MAX + 1 != 0);

"load" is already an u64. A typecast of wdt->load_val to u64 in the assignment below
would be much simpler and much less confusing.

Guenter

>   		load += wdt->load_val + 1;
> +	}
>   	spin_unlock(&wdt->lock);
>   
>   	return div_u64(load, wdt->rate);


