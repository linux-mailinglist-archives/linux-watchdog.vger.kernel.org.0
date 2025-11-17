Return-Path: <linux-watchdog+bounces-4602-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D15C61F23
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 01:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 503DC4E1DC5
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 00:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9AC2BAF7;
	Mon, 17 Nov 2025 00:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/SX/Wwg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D7D645
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 00:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763338574; cv=none; b=cfcd5ZUxGzG5XtCOXj+QNHAO5+iriOtYWCyTy55jYKrzN0Lu4apHIkebna8letz9As3Q+hyNhEITHAQDaWJzE+Z5qUknu9z+RIYKKTLFtioN0LQoL7kj1vIIsdLyL/fBeltbxw8dM/L8/3kaeliyKixwbogJa3jgeHOf+Wgc8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763338574; c=relaxed/simple;
	bh=9egEtZhWV6vFN3bhVfg9uHAsmj98G3kFs6JEQzKjIe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qz2rzdU6pVjifQgKfKkvUAL8Hv1ZAozd7bQpqdNii2WiU+HgwBzrV9E0TLlvOTK/JCYnUJzpl0O/WSYPxCuc6O2e7k50ozTIcykwXVFXX5EuOuN5r39GPeun1yl+p1D2FutrBTV4PRloL2VDQCmgLkUM3iMz96xVDz3m1kfoJd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/SX/Wwg; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso2178395a12.3
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 16:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763338569; x=1763943369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aiU1Dw/hg9i2QqC9D4nQ5VNkXEIpJmSbDCgNmIbjpbc=;
        b=j/SX/WwgNFbjeRkRr9NeN+uah0XfvuoEQZnu7Rlblile9EfoDYQuzwYaTWXttPHsja
         H7KdqldPyZS/95A3fnbYPrp50LQGDigRiispRDj4Qj/TVytQiTMP8dMNH1qSq/6FUbqp
         9rE/HcQqfQFagh6xtbNcQd9OKutTsOdIqiVW/g0Pmw4GT5XpJdkqqWV06k8XZbrnhB5u
         TuNFVnNNOgEsDraR7SeyrLci5SzqN0xXbzUpuYFnGfLowg1bgPTwSOLC3/tIRZA09R7i
         zgZuCnvySLQWaa2FyNzVupewkvAmqkuaFL37cN820rRlYq2UPAv69arBV87/ZuRF+1Fu
         Ymdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763338569; x=1763943369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiU1Dw/hg9i2QqC9D4nQ5VNkXEIpJmSbDCgNmIbjpbc=;
        b=j/iuybm/2Ge9qUAarVhRb1B+rJarbJD8cPuVcgYTXZP95lnW2WOI6/DSF654VykPli
         66ZUCH8K/7tUv5jHDH9pyWX5cK5N8ogKtsUrg/0HnGvTt/naCdEJn/PXxJxBD28Q0fLT
         zrN/uVx0CHhbzl7diJ2vshWXpiNaW5UHkKvpDmRJZPD8q2XenwWletg3HmGmFiikP0ZE
         HMFrkah1chbJqWtvLnLWeRTKxM7r5ED6GyW7SLAfIpt9cRywtKy08BH0B3cj4ceLBmXA
         mElNkB7Np/SpjYQ32U77jkfpboOaL7rHD77uJeWmyrw04oqg2XsxW19eH3Npb4s5iAhI
         2Myw==
X-Forwarded-Encrypted: i=1; AJvYcCWqVy8dRhCU3c5MWZOuyPqze7ogpMWhIM11bBx9EI4Cbzk7s4UyYvfrOD3tBMtDjXLDPf0pxStKVpDTEkjM6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6xYthwtW8fs7lPqFEcFNXBdpYxC4D0IydSi/jr4ThlfiV/9ju
	jtkkA8iFFkeSKjLF3Ek5j4XEG9RYZv0aMoiKFmvOxJs8aR4Ka303M25d
X-Gm-Gg: ASbGncs0huzUb8MgKpeBfMnjdsWjKyycfa4/PgqaIPEMO6fqq/ZzYc9yB6K1BtLxbXF
	o9RtRh9p57efNnIozw5CNVcSbapg+7kdrwq1FdJe2aMpmKq+zRw1Q+yEqQesM1s7ZNqlhlEyAnZ
	q6Aw0Cg1nT/2prt4dkUSQM8N7B7AyftWwUUfZAD5fxpJPr/SSQnJrBY864/xVpfRUi81cdWxA7u
	oDHMB2ZKHZb2BHsq+zuLKAmuRHyhkKPw1TvxBg3rdNhlbA08mjA6YehVQxbUCWZjjvP9Z0XP/7G
	QJ0B1QfrNwvS0tcfkE7VxM1R1pLOcDzmK7zuVSG5YS0TIM7910igTOpM/f8PPXbHHSzpKNyjLaU
	JeiEDzac4w+/jzzc4XPeW/tzqRRUfVpI0E7qzTx8ADCp0rjn7DWLEc5kar/N7iQFh/LoGewfCKV
	wbQy3XYqEDELaHBRNiSU4xWmAEWt8leYEZBNqGqE4Gh2frS4bidLdJKZqPdk0Q6A8H/nV0yQ==
X-Google-Smtp-Source: AGHT+IETZPA4oKvZAJ36NGD4H/YR9gKFk2yH9fG4H9uJSyyGt8jfG8GIdvypwzFfw2ppp8bJbf1EGA==
X-Received: by 2002:a05:7022:ea48:20b0:11b:803c:2cf5 with SMTP id a92af1059eb24-11b803c2eb6mr2405989c88.33.1763338569202;
        Sun, 16 Nov 2025 16:16:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm52663393eec.1.2025.11.16.16.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 16:16:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bda0bda0-8e7e-4dd1-8726-30685496e187@roeck-us.net>
Date: Sun, 16 Nov 2025 16:16:07 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fix it87_wdt early reboot w/ FW started timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
References: <20251116.145908.308086523429052446.rene@exactcode.com>
 <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
 <20251116.210920.587481738814327702.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251116.210920.587481738814327702.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/25 12:09, René Rebe wrote:
> Some products, such as the Ugreen DXP4800 Plus NAS, ship with the it87
> wdt enabled by the firmware and a broken BIOS option that does not
> allow to change the default time or turn it off. This makes installing

Again, "and a broken BIOS option that does not allow to change the default
time or turn it off" is secondary. The key is that the BIOS/firmware may have
enabled the watchdog.

> Linux difficult and annoyingly rebooting early in an installer; unless
> one loads and starts a watchdogd in the installer environment.
> 
Also again, please drop irrelevant information (how to work around the
problem without this patch is irrelevant) and provide a more neutral
description. Add as much additional details after "---" if you like.

> Change it87_wdt to report a running timer to the watchdog core using
> the user supplied or module's default time so it is reset before
> triggering.
> 
> Signed-off-by: René Rebe <rene@exactco.de>
> 
> v1:
> - just clear hw timer register
> 
> v2:
> - detect running hw timer and report to watchdog core
> 
> v3:
> - multiply TOV1 in _wdt_get_timeout
> - don't wrongly and superfluously set .max_hw_heartbeat_ms
> - don't call set_timeout manually
> 
> --- linux-6.17/drivers/watchdog/it87_wdt.c.orig	2025-09-28 23:39:22.000000000 +0200
> +++ linux-6.17/drivers/watchdog/it87_wdt.c	2025-11-16 20:05:01.650672740 +0100
> @@ -188,6 +190,21 @@
>   		superio_outb(t >> 8, WDTVALMSB);
>   }
>   
> +/* Internal function, should be called after superio_select(GPIO) */
> +static unsigned int _wdt_get_timeout(void)
> +{
> +	unsigned int t;
> +	u8 cfg;
> +
> +	cfg = superio_inb(WDTCFG);
> +	t = superio_inb(WDTVALLSB);
> +	if (max_units > 255)
> +		t |= superio_inb(WDTVALMSB) << 8;
> +	if (cfg & WDT_TOV1)
> +		t *= 60;
> +	return t;

Given the context, this can be simplified to something like

static bool _wdt_running(void)
{
	return !!(superio_inb(WDTVALLSB) || max_units > 255 && superio_inb(WDTVALMSB));
}

[ where the !! isn't really necessary ]

> +}
> +
>   static int wdt_update_timeout(unsigned int t)
>   {
>   	int ret;
> @@ -292,6 +309,7 @@
>   	u8 ctrl;
>   	int quirks = 0;
>   	int rc;
> +	unsigned int _timeout;
>   
>   	rc = superio_enter();
>   	if (rc)
> @@ -374,8 +392,6 @@
>   		}
>   	}
>   
> -	superio_exit();
> -
>   	if (timeout < 1 || timeout > max_units * 60) {
>   		timeout = DEFAULT_TIMEOUT;
>   		pr_warn("Timeout value out of range, use default %d sec\n",
> @@ -388,6 +404,15 @@
>   	wdt_dev.timeout = timeout;
>   	wdt_dev.max_timeout = max_units * 60;
>   
> +	/* wdt already left running by fw bios? */
> +	_timeout = _wdt_get_timeout();
> +	if (_timeout) {

	if (_wdt_running()) {
	}

and the code can be moved ahead of the superio_exit() call above,
avoiding the need to move it.

> +		pr_info("Left running by firmware.\n");
> +		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
> +	}
> +
> +	superio_exit();
> +
>   	watchdog_stop_on_reboot(&wdt_dev);
>   	rc = watchdog_register_device(&wdt_dev);
>   	if (rc)
> 


