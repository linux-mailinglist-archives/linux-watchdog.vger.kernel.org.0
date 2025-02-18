Return-Path: <linux-watchdog+bounces-2956-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB999A392B7
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 06:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F056A3A465B
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 05:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5908610E5;
	Tue, 18 Feb 2025 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi32Lfz3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294D01487E1;
	Tue, 18 Feb 2025 05:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739856814; cv=none; b=fPoQpgwcYwXtll/DwAsFWzr1IrfZPb6rGbaOVisOdy01a5A6ZLiczsa5CX21SEsuYHvIb5QttlYebvPBzbvOSbi/M35+V38mGix5XhWAq+xaFAeRaHP0t+r+ioFP6Snja84OPt/Wg0r86COv3bELj9lys9fXTSvjmVlqSCFaCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739856814; c=relaxed/simple;
	bh=b7eaHQiaQtjVK1fiP/qM0VCML6QIVUHW7f27DumvJFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HedNxwp6nZn7yhcPVfyZka40wlzy8qsp1mKqtsS6gYhlGgxq9PksdS5eEIPuyMjPxHYAZuKLCglv7ZciNKCTxYOAic865x0Baa80Ms4T7SrX1lcZ43ByK+30nYHwQ03mG+1iO1iVTFcIX6plfT4lm1UpnF6qUzPCDeg44zPomF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi32Lfz3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2210d92292eso65258555ad.1;
        Mon, 17 Feb 2025 21:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739856811; x=1740461611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIXUg8SbRufb036zZV3HGnjlaTM/TH+KOn8o/6auPy0=;
        b=Gi32Lfz3lHDBx39H0Rh57HY446xUH04j8Pa8/WzfJvr83EOU2DU8nZYTCbJg4WlVvk
         0s2HithLYKEX4M/TEakqGG7y+WKNp9EE3aeGqsGmegDjHt3NYUPArdsJbfJ4EUHp+lnS
         XS8bLqMn7WQyUBa8HVA6zaytD15M4Ti5Q9kOoGQUgItZJRRkRs+hhplvkH/I1ihOP8D5
         N1lA/aZQZLOc1MA6/M5VwGuUWO1T5jJJU43yerLgsNXz3ahDIStwfIEvX9JbyXwa2mzS
         3qvf9TyQ2Q4q/VwVr7RwBey4TcEVvpauf/HnEWt67CGJX47w4JGhDUoGw4rrT60gtknk
         7kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739856811; x=1740461611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIXUg8SbRufb036zZV3HGnjlaTM/TH+KOn8o/6auPy0=;
        b=Coo0A16RuFwySc36ceuOyo8XvsqFINJBWpXgVlcXA9Q+N34AcXvJRw26w6iIdQNcCX
         WKP8J8TVdzw0P8Fs5oQm1Ka880ijWUeySGgC624F2my9+H9ih3xI6j2BTpLVSglNGEwd
         HJpyWAHEvm6kWB4UCKx9sPENDk9Z4OJXw3KOfMFb6k3e8Mmgn5uNdHAzXr9XW6UXsU8F
         fzFV/iXu4SaYR3b00U1d1wPH1jWqMBn0h5YJYKbWgbqzzztF2fQU+pn1c/noomF4MPDs
         9wmeNocBORdVNhLWrpcTUZOvvs4xX5ZeIFvU2jPWt3IPvAr5x7e+WPX18SwnNZvbNSID
         oOaw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Ktoxr2ZtBeMQbRZ88kuSJIlW3HkMtDwONSEU9h+3fZ7wypq/XuwGkJLV88ZZpkI1Xxit2YOMgDleg6ZI1RE=@vger.kernel.org, AJvYcCVclQNxRBc1WlsEhrBfqyq2O57NDVbEU40UajjPCmhZh/H1BqX/sGBpiJyVzVP2woDEEZtFFovWIQIK1j8J@vger.kernel.org, AJvYcCWWfmENjSMNRxY8FRtGr2FpneWejvGASDz0z5zUlqEc+2N360aexdLPUC+th81rqKkBtyg6SX5xB89y@vger.kernel.org
X-Gm-Message-State: AOJu0YwCmm3e5AyQWo52ERWlIfULTbp78jNbvBwcslRMtoPmhLuwjBdX
	duoUWm7exhnvRBM3zfcxHQ9B314TUjKwN6lI6PFlTqRG6PN0pQwS
X-Gm-Gg: ASbGnctpDme5zTJuON7wRi7ah8PNQe+j7PqQHT7WehXSH1IcpknjpO6/o77Es6N449C
	sprRVHMfXDmkN2V3bRR4Gmteut3W7gBG6cA9JhfYhmo11F1ipZeKWk+1S66AAuyOYyEz140Ib6S
	Wt5QfZ6tU00daLs2DnBLgL+zItqvBWvieMKI+bl+hUr47byBszzvi1FJPa0JKt4yqoBeiNd44Bj
	bm13FckVJo8TUqpejyVXtTFncYBIvlyF234XJ+6cdQ5wQN/8hIDMIzUMyO4I+quzCswGSjLaIuH
	P66Wd677evx+ykYFSs8Eflg29Ur9Zzh4MqE7s1Z84Woa9cpPNHKiLekw2prVX4jb
X-Google-Smtp-Source: AGHT+IE3yaFBuZ3jvd/c/xksrjQzXgC2Ka5HLYonZdx0VSjT+fo54DpWdxFWB6u9LmDK+vl70/Lj3Q==
X-Received: by 2002:a05:6a00:2e08:b0:730:74f8:25c1 with SMTP id d2e1a72fcca58-732618c0351mr16588841b3a.15.1739856811308;
        Mon, 17 Feb 2025 21:33:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73270de9b7asm4451004b3a.90.2025.02.17.21.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 21:33:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Date: Mon, 17 Feb 2025 21:33:27 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/25 19:16, Heyi Guo wrote:
> Aspeed watchdog uses counting down logic, so the value set to register
> should be the value of subtracting pretimeout from total timeout.
> 
> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
> 
> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Eddie James <eajames@linux.ibm.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..520d8aba12a5 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
>   	u32 actual = pretimeout * WDT_RATE_1MHZ;
>   	u32 s = wdt->cfg->irq_shift;
>   	u32 m = wdt->cfg->irq_mask;
> +	u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
> +

It is unusual to use a register value here and not the configured timeout
value. I would have assumed that pretimeout is compared against wdt->timout,
not against the register value, and that the multiplication with WDT_RATE_1MHZ
is done after validation. This needs an explanation.

> +	if (actual >= reload)
> +		return -EINVAL;
> +

On top of that, you'll also need to explain why watchdog_pretimeout_invalid()
and with it the validation in watchdog_set_pretimeout() does not work for this
watchdog and why this extra validation is necessary.

Guenter

> +	/* watchdog timer is counting down */
> +	actual = reload - actual;
>   
>   	wdd->pretimeout = pretimeout;
>   	wdt->ctrl &= ~m;


