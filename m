Return-Path: <linux-watchdog+bounces-4566-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAF9C5454F
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 21:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 22D5E3485AD
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 20:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0742C1CAA79;
	Wed, 12 Nov 2025 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7RlQRq9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4F29B233
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762977761; cv=none; b=WRIoAK1OgKDYzI2yr2/AMdTWgmQHyB6LFMXCug55SoGNH9rYhaVa6dlqDxxaNfTJ7XCHElgEmAh11jvUdf6l6K/dDcaPlz47ABA+Iyh9z2PTalVcRZFfIPb+JQYWzPdOOXYgoHDechWPsT4+jwazJKlrFkoUpW5IvHFFsSHFt3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762977761; c=relaxed/simple;
	bh=szxYCDA2yiNozpuMKqUvb5jwgp3jMOyREloKUW0yZm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qr5KBhjJUPm0uTN7xnT5fMpTEUTeuDg8gQWEoUPQlwu7zrVQPh4NrgE2xRB+AHUy08CWsygHxf7E7di4WE4JmLVPpqIARdZjuBhjKepdpIM8bIz8XovGpd7D9G96dhF35ltbrv/HnLhvbdi4Uv02yCF87ZfwYluDMy8sZwyLg7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7RlQRq9; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3437af8444cso29633a91.2
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 12:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762977759; x=1763582559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dnVDsYK8mexerhnMWSX2g7mFYk5pE48QSYMSlhfSuTk=;
        b=e7RlQRq9yA6Ou3JRaUc7jPZGFM+H3ypbyXTKG+K17simkIigaK2OlBYhQufeJERMhm
         B67RpzozeiFl1yfGzQSLBXXW6dzVnvcvJhuG8tQgJt0L/6aDk2/qZN6weMHoePZObd03
         9n95TDCICCoVRO1WRzrk+HiVJMUkH3/XZX0URrNYzGzG9S4ses0IVbpjpZIMugiotRp6
         q7qBGEBbPCsBPvrYncalkNBWsrqkDduyXeLG0nrW4amOmn5wX+SMTK8EF2j3S5q33H43
         si2An6lvbZi+3ZSKS2kNGeIrJLsZ2sNqFbW4T9fwSjdVRLknxC4PGzfS4x3C5Ze93sub
         zh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762977759; x=1763582559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnVDsYK8mexerhnMWSX2g7mFYk5pE48QSYMSlhfSuTk=;
        b=fciYJ+vCtSmD9rB+GA5URCER0Yk+Ugb607BwShxYKgwaFYC3L/04CWSF5GnaNlc+Kb
         P1BM5y1QXnYrXuFCBV04T5fPODkOYR/3HBNSrrPuBSwvulXaHUfaDX4Pl+fQW1+ENHCU
         t/TtHJicZQLPOm9ANd1xn/fM43W7dpTLzRth51FD3KITOOr6do6d0PqnPrdqa1gBn6n+
         C4CBhWVg2JWdMf+nAbMZQv71DGX+hB8CdAXjP8+ZEMwHikK1uhdgAbOPXrmFC942jxJH
         MGucE9Rn0HI0M9KzbY2BMl0g5BJ3+ddOqAHn/r/T6ZolyS6H4AXf9PnCUQWMWZzS8vhk
         +7tQ==
X-Gm-Message-State: AOJu0Yy1FwPy2xanWIl3zWHr13RpwoGAuNTUfiIzLQk8nYDZ41WtzaHK
	B3WLP/2bBMTbc4bGAcd0jOPIb3EeDKdGmivnIwlFSb4Jeoy1+bcXdlYt
X-Gm-Gg: ASbGncuoKHTpnPTAYk+gT9NqbExPA33+oY7OZKe8zmZq3ry2GAgEc9RTC9NdrAND2jJ
	vKAHqcQ4v7LleAI0VzEvbg12DIjWb8I53rLRIYRD7egYVlajX3Q6gYK9UDn0XVu3V0XI4L3EtKw
	n4jkUO2jDKLFiuj4aXiuRFS+pAPMNVD/NBUM11eDGk6NsnInr+PNtPtbtCisYCLbLaO3Vc2llb7
	/BXmWo46eCY5Ub0uQJzp+IhMmEhqOIOsp4QJ8Vc0lSRLFLv66Kyp+G2rNTribAWpH9HwfB+RIr7
	RUzo0emtFQaKeRvviw3x/M9FJL7AKVieCX8xmo7JprE7sqqsTO3FuLLn5JxpqXdhTfpZ/ebRsI8
	ikhD/aqVfS1WkVhA3ZFo/WRerGhcB2Hq7r+e98rnZc6DcqBEnta21IcSsGjz7hMWubR81tV7fcZ
	oVp2PrIsCrLnd9ChOl9R6Kbk2fD0Y5iXvCs6c21K9Dv0QjSlAn
X-Google-Smtp-Source: AGHT+IE6nCLvePpUZdszdgWOYBz9TKuNHMW8Mw6WmPqtXyr0R8N0K77ny8oAEfufSfsd6NKUCYhwzg==
X-Received: by 2002:a17:90b:3b46:b0:32e:3830:65d5 with SMTP id 98e67ed59e1d1-343ddef467amr5161291a91.36.1762977759129;
        Wed, 12 Nov 2025 12:02:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b8b4fc8453sm774461b3a.33.2025.11.12.12.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 12:02:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b5c23a86-37a5-48af-b3f3-48bcd5d57cd8@roeck-us.net>
Date: Wed, 12 Nov 2025 12:02:36 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: wdat_wdt: Fix ACPI table leak on probe
 errors
To: Haotian Zhang <vulab@iscas.ac.cn>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251111032832.1985-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20251111032832.1985-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/25 19:28, Haotian Zhang wrote:
> wdat_wdt_probe() calls acpi_get_table() to obtain the WDAT ACPI table but
> returns early on multiple error paths without calling acpi_put_table().

It _never_ calls acpi_put_table().

> This causes a permanent ACPI table memory leak if the driver probe fails.
> 
Seems to me that itdoesn't just cause a table leak if probe fails.

> Add a single cleanup path which calls acpi_put_table() and redirect all
> error returns to it, ensuring the ACPI table is always released.
> 
> Fixes: 058dfc767008 ("ACPI / watchdog: Add support for WDAT hardware watchdog")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>   drivers/watchdog/wdat_wdt.c | 66 ++++++++++++++++++++++++-------------
>   1 file changed, 44 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index 650fdc7996e1..f827844a0c69 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -318,7 +318,7 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   	struct resource *res;
>   	void __iomem **regs;
>   	acpi_status status;
> -	int i, ret;
> +	int i, ret = 0;

Unnecessary initialization.

Guenter


