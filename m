Return-Path: <linux-watchdog+bounces-4287-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB1BA718A
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Sep 2025 16:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F26916F463
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Sep 2025 14:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25433219A7E;
	Sun, 28 Sep 2025 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPaurFue"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D01F7586
	for <linux-watchdog@vger.kernel.org>; Sun, 28 Sep 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759069241; cv=none; b=Tn47Gc84Xy8aUMJAVxYRLtOiuMxxSFaKGE8BsfdQ2dwVU4xtTPnyKYaS8N+ra//+LhEX72M7Ku/cMHDQZ4e6RozW7fN7o6OthPFGs/bf28Q/RlV7I+HVctzAX8Tg+nIc+F3D8otMc4N6xBF9RxM3YqgnMQCWjLNPY8SSuAcOVuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759069241; c=relaxed/simple;
	bh=MABUtmW7hs3j6sSEFukRcJjPKjgLALDyIMyqN3Z/8cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8B4yGDiwAhM+GrWj3PWViC3bu8QD3CJJqCn3TMKkboZVIrwuz9Tjkr09JvklCnMBVZN9db09vVH/gn8Y1TC0YVRUHHwjPR3nFH9fYCvZLS/mLsHaPMeqZ1L/d2+LpKUryIwbQGqCmLG8mL0RxBMewN20LjwotD83pwbW9J/ZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPaurFue; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-782023ca359so1034112b3a.2
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Sep 2025 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759069237; x=1759674037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jBliwOJXPnzX5/lt9z5sUm0XkPB682hQdmEorp2useA=;
        b=CPaurFue6DK9B34TD9XFm9HG7q+SEKVlXX5IDoj6wjsNxk443b+H38QBl2xrf8NZdz
         ROqok5nkpBn68T9vOVZ+WGhzZ5rauPm/dowp8GI5E9kdvS8QnT9d24Z+eGQAOw8Jla6z
         xfMcnwzcCBP6CiEZ3OD87dMceq1GT6TjxVPLUDtwqhBAcZ9doDPLkqrvWZ2gzcPXAh9b
         CRxlofzgIyzkcp2ycb4YI8Akb17QyX0dC/jfIg3TWxtLxU45pJphKdXbmeaS6XkFc/XQ
         BRxlPcxFvq2ATb29ILJ8kcMvXNfbDGJUDkS37RZJjOmWxYnfG+rZewFgYQcK78rSPmyT
         EVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759069237; x=1759674037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBliwOJXPnzX5/lt9z5sUm0XkPB682hQdmEorp2useA=;
        b=QcQZen7i82m6oUoGXZC1wvcrtUlgbjoZZDBpzBAj6ndDlvPU/1l5K+niQI38fJQqLi
         +74cCfEafATxPz1CB62pKCGYHYjXsEsLhvbrsAceYLs+xPYnDvS5sK/qSOpzwHCBdpLw
         7hBn4Rp3AFevFKbj95NtnTIQpH8+NfTZ6zHDdui0A93FEteHX7vMqnU+USIzzmE+py9n
         t31cF1KuLkRRZnDMB/AeMR6arw7JNo9r7dYJfHmkzUif0g2qfTfnLKynpXnLe7F40dXo
         QBfk60BYravbGNl4up+xG6Opz7iOjDblKHcCOotBz/55cbiCUldMMkUMI3KxWnwl2DBd
         ODeg==
X-Gm-Message-State: AOJu0YygX5qk4wLl5RFsHOdZJAlMvHiUaMN1S/dYGd/bMfNS0OBlxMWA
	8e2O0NaZzM432lp+6jOzNAPMptR1c0Kf1QSuIU8BlLIDKh5R89Ovi3g7
X-Gm-Gg: ASbGncsablvfk58jvZ9YQuL/4swlwm/VnSYRh7ox/eAgfcPQhJdO9p4d+25+a5UITXB
	za9gPdlkoan8zazuwRjt+x61eCURrcLY+B+e93Vl5KMQOwqfTuuT35QZJO9XS6ecvI1Z/6fDtuM
	936NaJ0hLN/XYpiq5hOgxyOv4cs3/afHtbK4pkpWtYOsL2XcVnq/u0RCFZgdXYRa8KHq1KGr8ww
	8V54Dyq+67OJNJN7opMfXQJhvvcBGskzcz0HieHQ4Ddu9yZ0h7DqPWnx5Z80KmQf2FI+q9nAMNy
	f5AjLLKykk+9jVuvpp11UTT73bvtr2YZFCTKBT+c3p9KxYkMgUf6i5ZL5Km2ELN178FOQ5/4GWD
	Q3uKqeZyYh70N9Wd6YcfK54ed0qJzrI0iZI27hge46hQK+tn0KYW2AjXcYIhqmZY72OsOp6a+bs
	PDAuRtzA==
X-Google-Smtp-Source: AGHT+IHVLp13cexWtdeZOpKIUVtPdhV6F5Ee+dX4OY0UFLu6wmCVbE3Gx8hDTID8re6UlOrb9jFCBA==
X-Received: by 2002:a05:6a20:7348:b0:251:9f29:4553 with SMTP id adf61e73a8af0-2e7c1bd0c99mr17754459637.10.1759069237022;
        Sun, 28 Sep 2025 07:20:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53cac77sm9207630a12.17.2025.09.28.07.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 07:20:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <08e2bfe4-8cee-4d72-96ed-30d1e04e8f63@roeck-us.net>
Date: Sun, 28 Sep 2025 07:20:35 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] via_wdt: fix critical boot hang due to unnamed resource
 allocation
To: Li Qiang <liqiang01@kylinos.cn>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250928083332.3035370-1-liqiang01@kylinos.cn>
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
In-Reply-To: <20250928083332.3035370-1-liqiang01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/25 01:33, Li Qiang wrote:
> The VIA watchdog driver uses allocate_resource() to reserve a MMIO
> region for the watchdog control register. However, the allocated
> resource was not given a name, which causes the kernel resource tree
> to contain an entry marked as "<BAD>" under /proc/iomem on x86
> platforms.
> 
> During boot, this unnamed resource can lead to a critical hang because
> subsequent resource lookups and conflict checks fail to handle the
> invalid entry properly.

FWIW, I only see the name used in print messages, which should show <NULL>
when called with a NULL pointer. Some more details would have been useful,
especially with the idea in mind that a missing resource name should be
reported but not result in a hang and/or crash.

> 
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>   drivers/watchdog/via_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/via_wdt.c b/drivers/watchdog/via_wdt.c
> index d647923d68fe..f55576392651 100644
> --- a/drivers/watchdog/via_wdt.c
> +++ b/drivers/watchdog/via_wdt.c
> @@ -165,6 +165,7 @@ static int wdt_probe(struct pci_dev *pdev,
>   		dev_err(&pdev->dev, "cannot enable PCI device\n");
>   		return -ENODEV;
>   	}
> +	wdt_res.name = "via_wdt";
>   
>   	/*
>   	 * Allocate a MMIO region which contains watchdog control register


