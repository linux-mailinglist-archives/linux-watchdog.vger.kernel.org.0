Return-Path: <linux-watchdog+bounces-3530-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC6ABC6AE
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 20:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 868A24A4123
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 18:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B37228AB15;
	Mon, 19 May 2025 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7c7OuPu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A028C2C1;
	Mon, 19 May 2025 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677514; cv=none; b=KdKqSj53GYH6e7DpA7bYUAJYkY7jNHNfDLwXElx92yXTlsafloZO70mk923ypYQ0A4vftDx9apTTMjcyyyNbUs6pgHxjcL0PNrRpzXBbKwlyaE8LckKm5rCXmlvM05TvbSyRdhl4ZX48xcRyBC66rTZAsbCaHJCBnSYyHi8bz80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677514; c=relaxed/simple;
	bh=HgyPDstZYBUDgPti8FMuvI3K+U1gsiJCagHsuF/rrII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odmnN8tyGEVuQkOt0Iui2nDd1IFQkb82Dcgf1b4Y6fPvWWOh2UynF5B1WI07iuAIG01VR+ViDAJrm6kCAS4l2h9uFUUaxz/O09Qy/PY0Oe66w6e3/mJOQmLaQXvsQ+I1WBgPdI9BrW6dVY1RPY9aW3zgwoazoJ0nfGm4rSbYufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7c7OuPu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30e9397802eso2309846a91.1;
        Mon, 19 May 2025 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677512; x=1748282312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Karrir3qGfnZexw7hDw/No/aef2xlPMTVGkHG+coGOo=;
        b=W7c7OuPuWDvIObMUkjnpunEyppnrXkVg7llNwIno3vb5XeL4Y2Ygr06tf10YTVWqBn
         zfMx3Xf4HUuLMgW6vKIbtR1yudifZ48fJvp/9js5dI14kbiJGxgrGwhNXcpdGDM00103
         JDGvcDasNp4HWhejV+L6emk25ohSF4unuYRIEZoWSEw7wn2pYwar/k+0MJo6PTxWmTja
         rpnC3QK9XBANXwXYeqSQz5U95FZJ5n/u/Wua40M+wwN4rSJwp9F96mNJ/2/qpI9ag2oR
         8psiMpKlSL3+/Qwy21src8znDeeVpU16WVRZyLzZwP16Nf/FimUcjJ058FDa1+EPB5f5
         T3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677512; x=1748282312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Karrir3qGfnZexw7hDw/No/aef2xlPMTVGkHG+coGOo=;
        b=BIv8Rk7MpuJBQZ1OIpwDN5y1C/22hKfD0cmNE6inH5sRl6wX8EkKIxKN3K49dTrmu+
         lBaZU0aqXs0HTwI+y1zOIbYNBzfzb5KTl0Dfl3lEK08y7GeMUsC3LOV7RN5FtyLyXd2R
         hUVFaP6HFV8F4EUYytwHUCOlasUbsejo5EdKmfxHyYueeBx8IMfWp2bE+wYZz+3am2i+
         2mFswrQ0mDv4uSBAerW7D1mf7MJ+UTg5DTEjTqYdrzpDw3kH+fcZuom4p4bOC7K14Ojd
         cODSUeXTW7mpGtPGPBhNRjW06mhYk9MJVeJMsnwNCyDhqvXOPHi57xkPIRH0Iy3PXuyR
         qsQg==
X-Forwarded-Encrypted: i=1; AJvYcCUnLCHvTjlnXT6mvmlAQUBOv39SA8SGVgRTIkauSfGUB05bEDmZGOOphX+pqrkTHzXEUW+EH5Bz8oMIYUNtG8A=@vger.kernel.org, AJvYcCViwtE0lnR2b7IzBuTXuMdhlZNYuywoLXcpkn3xq8NQ1naj9ttX5s30hHgoKubtDnJJs+RalbaUQKG6k1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxViUGBojbSKasHQmJj6qwfACs9tIP4lTsQYqujl/5SmaFIhBMs
	SSDC1/5OyqT+rxEWH/E+15/jYUXGqwvpoBpO0V37sNJvVAZzEp+Jpdll
X-Gm-Gg: ASbGncs7jzbdDvAsXDIqMkI4k3WCiILbtX1xOH3E9VlQFdsHRkOUxRJHNoEVnw1hqi4
	V8OlBVsufdOfwKknX3S3cX4p9M9ueFMDZhR5KBR48LE2bdhLviivBVmQtuOYqCyS/ZcrgiNh5BK
	W9pTLI3UNopLzfM1azCZoVYzc3vtk8UXS422NdSPUbSaA7xZhld4hL3eJwNF+KM2lk6gEtPitLU
	+S+ByksJvJCSSdVr1lh92TkRJkpfmoQMBjiwjRBav4b6Vb5SpJOs/PPwopJavmBMG7JRMlXcwkT
	icYpCsBSoltu2xMsLrGpIJoiWyySYMTDv6eVtBZz2jZ/rxmIg2RnjliZcH6mdFKKrxi+ElEPsus
	FI5NFxBBpKlUGS6GQ7JGELYWaaPNAIXkTZHI=
X-Google-Smtp-Source: AGHT+IGO5VhCfHqzwe45oRjW0HQKf7V5Mdw6UX6FnmvfK7pEEurQpJKwXL6VZzmbMg6xgYUW3QBNXA==
X-Received: by 2002:a17:90b:3c45:b0:30a:4c29:4c9c with SMTP id 98e67ed59e1d1-30e7d4eeecdmr20887688a91.6.1747677511640;
        Mon, 19 May 2025 10:58:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e87575c61sm6513115a91.41.2025.05.19.10.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 10:58:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
Date: Mon, 19 May 2025 10:58:29 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: arm_smc_wdt: get wdt status through
 SMCWD_GET_TIMELEFT
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250519170055.205544-1-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 10:00, Antonio Borneo wrote:
> The optional SMCWD_GET_TIMELEFT command can be used to detect if
> the watchdog has already been started.
> See the implementation in OP-TEE secure OS [1].
> 
> If CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set, at probe time check
> if the watchdog is already started and then set WDOG_HW_RUNNING in
> the watchdog status. This will cause the watchdog framework to
> ping the watchdog until a userspace watchdog daemon takes over the
> control.
> 
> Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>   drivers/watchdog/arm_smc_wdt.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005fb..f1268f43327ea 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, enum smcwd_call call,
>   		return -ENODEV;
>   	if (res->a0 == PSCI_RET_INVALID_PARAMS)
>   		return -EINVAL;
> +	if (res->a0 == PSCI_RET_DISABLED)
> +		return -ENODATA;
>   	if (res->a0 != PSCI_RET_SUCCESS)
>   		return -EIO;
>   	return 0;
> @@ -131,10 +133,20 @@ static int smcwd_probe(struct platform_device *pdev)
>   
>   	wdd->info = &smcwd_info;
>   	/* get_timeleft is optional */
> -	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
> -		wdd->ops = &smcwd_ops;
> -	else
> +	err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
> +	switch (err) {
> +	case 0:
> +		if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED))
> +			set_bit(WDOG_HW_RUNNING, &wdd->status);

This is the wrong use of this configuration option. It is only needed
in a driver if the watchdog status can not be read from hardware.
That is not the case here. Worse, using it in a driver like this
overrides the watchdog core module parameter "handle_boot_enabled".

Guenter

> +		fallthrough;
> +	case -ENODATA:
>   		wdd->ops = &smcwd_timeleft_ops;
> +		break;
> +	default:
> +		wdd->ops = &smcwd_ops;
> +		break;
> +	}
> +
>   	wdd->timeout = res.a2;
>   	wdd->max_timeout = res.a2;
>   	wdd->min_timeout = res.a1;
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21


