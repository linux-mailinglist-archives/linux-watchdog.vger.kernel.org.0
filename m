Return-Path: <linux-watchdog+bounces-4713-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB3CCA457
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Dec 2025 05:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CCBE301471C
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Dec 2025 04:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8762773F9;
	Thu, 18 Dec 2025 04:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFumEL7v"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7644236A73
	for <linux-watchdog@vger.kernel.org>; Thu, 18 Dec 2025 04:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766033617; cv=none; b=R2bmCQODN7zl+8KFzebe8xiEdGL2Y2420aiq9n7iVqUDKWxSs7KHKX6HGw5lnKAhjm33y2pyEj6DPtXajEsHEu8kj61vo6+2a7lXNJoxnhQxH24jKmO7ZHy0vuhR6Gjgbxe7zNRGlSpDCm/5USo1zdIVz0vwKjZqceG6NBySAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766033617; c=relaxed/simple;
	bh=gC3ugXYp1tMJq3Cs3Hrdsa3w75J7g6V6e9ZGeoc/Sfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwCbz2x0tVQh3qTKaIsf9GQINgT+xrAu91cJ9ZpwvR+PDUZ2eoVx1Pqcb9cAQbEDpVMSKEJa8olBbYRjEOnwWC0YwbdEcXeaWmXZ/mRQqLGBbRVC07loc170koVbrN7Znm18R+Oa3rmdFKIrWvUrmEU9AwN8ej2qsaSLk1rxasQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFumEL7v; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11b6bc976d6so2007503c88.0
        for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 20:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766033615; x=1766638415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OgxD9acskh/VQiAtEaUet6zCftwQMFxsHsnGcHh6oWE=;
        b=KFumEL7vMlRam6tM/hOpAHPhQEQzvvGUtB6pXwgAR6MUrkPUUPPkIGlUSr9310mgUV
         pbPU4ZhJoX3wIZeyJueTOOiaJrzEmTXo1YSu6U6IWWwLHiKR8cei65ma+0m3CGPJXKzz
         m6VKqhb3hfrW5Dttx06p4WhpVnYSQ8H3lcEVoYum8Fe7x3rR2wOuYh7o40QMwKsEJiLt
         PhiS1sWw+Wl65JPweM1wMwhUZC9tszK8d8CaQQxsTPshmSrhQwdFKwlsKoyaa50ufFkd
         /dZkfqsTZ68TIqfYK25+R5QB6FCYgQhSCn1sVcSQEAnl1pYPCfbkZciyq6jsfPjXhIol
         wTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766033615; x=1766638415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgxD9acskh/VQiAtEaUet6zCftwQMFxsHsnGcHh6oWE=;
        b=irk0X5vgf2QP9BUz2D6weAVWf4I0DdPk+os8KkTFYjl+TVLOYq5BMvhqs90hFtHWMp
         p55vG/seLvOetgxRghLBMSMja5LK7p9aqIh+r412NWB+wbTLHc0R9j+QZMMqQveuDTpQ
         DDu4HDSas//1r3vKL1I/ccmF9qnKjz8OBdQ0ZF5yWGOTMdXxxFw6q6wQEBa+euaYYqJ2
         +h0VL7Ef6IeBZEsqFo7aOb9F4CJHooH3RNv82z5tBwsgamZUjXAneftpJcx0bcgsddOa
         NwLpTxM8BiNx+MfQvm9TUjVZVURXA+7LYRBGEOmimDHkSGcQjIdFSROW8JydAhiPqOex
         r22Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6dj144S+MwoofMyKo05kfOb5VD0v7A8f7FCojc+IIMg3EUw8BS/w9s96KTAPv8XNQKkHr9U76dRwXT37NIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdnVHYv+NZxmq1eIkPGCc86+4ZrBtpnohx44FupANglR0Lqxy
	8fdhLS7mD1xxQrYQIFlb30QFsUMaDBt2nhSS77aIJoCpK67q83ez2C4w
X-Gm-Gg: AY/fxX64w243hQwhCa+LkNM8OEc8gMfhvlAn1eWDYVWaEOZ53W92YLjgsuyH3gWmkx3
	C2uNXqtZ/rwBTVfT/ONp9i05wbCzyEZsaiL60OOaH59m5ZQaq1nN9q1yON4Wbcz4vbmGMGDGWJw
	8No6njDE0oirkibCbvfyUMZfsVi2T0m+PN1hzSYSOAwab+gULJtZmi32x2Oma/p93qUJWF0J/Qz
	xn67Mkavw5c37E/muG6iOUj9C6HJdgCBcAYu1izEeJldbgNm2/4VTCQE02fIRA4NKHiDfkOdRn2
	lt5IlPtzcMkk/bGEw2v0bwSQ5K/p/X08Pt4aGOBS+sFsuCsTFcE60i9uK2795Mz9DePZdKHU4fC
	teSFAkFoBsqv6I+wLuk7jcD1WZKLHA7H6pEEKF4VrtLEOJccTBi4ebUpDjnp1VqNdwBfYLrWtrc
	sYYKhbyD2LY1MkU0qlGSCntKSOcqztJxxTEgE35325aLKc4VH+pepU9Gq2vLDz
X-Google-Smtp-Source: AGHT+IGtK2sKqghMtwNzmEIezygUub7cRsHjuKPFgrXpP47Vo2J4XU7GfKUwjyggfsFigcji6XVPjA==
X-Received: by 2002:a05:7022:b90:b0:11b:3eb7:f9d7 with SMTP id a92af1059eb24-12061975750mr1349154c88.14.1766033614784;
        Wed, 17 Dec 2025 20:53:34 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f54947sm4359090c88.7.2025.12.17.20.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 20:53:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6fda7aa7-244a-4650-b120-acd66ca0d1c9@roeck-us.net>
Date: Wed, 17 Dec 2025 20:53:33 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sbsa-gwdt: clamp timeout before updating
 wdd->timeout
To: Zhu Ling <1536943441@qq.com>, linux-watchdog@vger.kernel.org
Cc: wim@linux-watchdog.org, linux-kernel@vger.kernel.org
References: <tencent_E88A86F3126F065BA4E3D4FC9CEB1A9A2406@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_E88A86F3126F065BA4E3D4FC9CEB1A9A2406@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/25 18:31, Zhu Ling wrote:
> sbsa_gwdt_set_timeout() updates wdd->timeout before clamping the user
> requested value to the hardware-supported range. As a result,
> WDIOC_GETTIMEOUT and sysfs may report a timeout larger than what is
> actually programmed into the hardware.
> 
> Clamp the timeout first and then update wdd->timeout so that
> userspace-visible values always reflect the effective hardware
> timeout.
> 
> Signed-off-by: Zhu Ling <1536943441@qq.com>
> ---
>   drivers/watchdog/sbsa_gwdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index 6ce1bfb39..826469645 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -155,8 +155,8 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
>   {
>   	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
>   
> -	wdd->timeout = timeout;
>   	timeout = clamp_t(unsigned int, timeout, 1, wdd->max_hw_heartbeat_ms / 1000);
> +	wdd->timeout = timeout;
>   
>   	if (action)
>   		sbsa_gwdt_reg_write((u64)gwdt->clk * timeout, gwdt);


This is wrong. With max_hw_heartbeat_ms set, the timeout value is not limited to
the hardware timeout and becomes a virtual timeout. If it is larger than the
maximum hardware timeout, the watchdog core will issue any necessary heartbeats.
The current code is perfectly correct.

NACK.

Guenter


