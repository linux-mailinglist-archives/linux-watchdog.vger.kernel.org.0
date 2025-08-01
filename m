Return-Path: <linux-watchdog+bounces-3946-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F5B1887F
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 23:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429B4AA5753
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 21:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1001928DB7E;
	Fri,  1 Aug 2025 21:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNjX+wMg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14A61E0DD8;
	Fri,  1 Aug 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754082252; cv=none; b=PUc+ywOd25u1eoFDOVQY7EiHBv6KWMktpQnMe0+L7mk0cO3SRsavrb40wRbH7T+jYDpmLuU9m8XI8YYvmuoi3BUFazU4xx3WTH1MTJPmBf9Lou2p/gAWnXzKCWk6pKq0IlqRuUtXxkd5HcHeLE1PYagZCZngp0U4dOapl2LTfUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754082252; c=relaxed/simple;
	bh=5fG5UG6W2WEuQtpPCNSo9mrN3oYlA2oKdSmUSPppxLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXUpGOZpf51bAnr5/IXVnhwuhNlQfZGedJL8NXZWpmv+QWuIu2AmqUzGQfF6l09cQgWtqMBGGRrHYo/iFvgKpT6PagTYbdx4GUu2LIGWZfR4mDFwlw1HrQAYaE9IBtn9tsL0m04yWB0I+67HvoGbp0H2X7gRUFTHnllWu+K/jLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNjX+wMg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31f3b54da19so1779013a91.1;
        Fri, 01 Aug 2025 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754082250; x=1754687050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eJK+fkQbaJl/onlEGRaY6MmLyVCsFLJvmbnJkWyUVVU=;
        b=kNjX+wMgIaxEnyCF2pCWEWFZ5f3JW8RUjRLJN7yBZwwAwdrOnu7uF7zLGPkeybvk9K
         iD2PvGrLqPxn/uv9gDNYJzUqMfy+ptRFiDZeuOUhb/IS8qhMIShhRBpJlNnWRb2k89JT
         M+oMogOtOrniaFtGzlOW5ot/buK1bXq2eIGVFSkYz0uLS/cUxmsUo/48YWd2WBdofPlc
         od2V+iI5C2fCjrpcspPe0xjY2gZq3PxwkCHfax1S3m87u9FvRBZZeyfLti9Ps7j691MD
         ApvnGqZ6OjlPfijpZnreSi6sGiCLzlupx88RScUtejcNdN3AxXot+RBU+O8NonJ1sU6B
         TdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754082250; x=1754687050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJK+fkQbaJl/onlEGRaY6MmLyVCsFLJvmbnJkWyUVVU=;
        b=GkNScModkyvZyw5DUDt1Cw9s0p6xc/QYxrDuUHAMlj0nTmuvkKvqBv/nRo6BVGf9Qo
         4DeqBi+da0jWl0O5pfOEMaW1ugIrAkNIpAiVyhYt6ga290JQJeRGSOOVwjQV4OhFP6lK
         rI7+hPqkyerIcNwHCRs6AOZIUkAVARUvjoRTiVRY1Z8zbvfigWCeGYMx5P05rx9aH6mX
         8QGXyI2jLFid38cMn54uspxv2fhf/SKEHAKPOc7cb/mSWp3HEkJxaUCBQ1ZVliiT2xO4
         RCw5QSHd0xDHL+jO3P1dFdGadm1cyCYlMNV8lSnAJnzYqn7rm/oy/PKO6Cwk/nLeugFB
         8i/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlHb97MEZUly04rYPFoByU/efwCRS3Mh7TjjKbgt3LjGOfdxrizrLxCy+DfAz2knozfOi2JanHd8WO@vger.kernel.org, AJvYcCWqkN9N1V+ham4S4qv9UpQ76tYZcP2zDF0gyKatqLPgU8z0vTHb3w9ZQ7Zt50QdN2lDpuJSHVYmCCMjCyPSxnAvW5w=@vger.kernel.org, AJvYcCX5w7YQz4Ep7AC73t5yGBDSeYbYXIrTMAEu2vGQfduHjtDWQZx4w45GhGosQmSSKmpDl/H9ZrJayfaxZffc@vger.kernel.org, AJvYcCXBhYrgceGXjGor3DXNcKd9fhRWbuMC77s6sumWCMHiaiPjnTTyI2imEjTqooeSP7lP9B6Ldh3LbGqPvjrV2PA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkVowrh7CfTQLxHmObdjETnyxsjUMh6WVGeuJxd4gcDfbe+I7x
	yMTdJNklG0Acb1T8xxVRgA0w1kKRMsmvntZBTdHfXWf8QfdcyMxH7gLN
X-Gm-Gg: ASbGncuOaEDDO2ZChIfMgMI/nLRtYqSO9U5xD9zcA/xpKTYqiOgBH6dd+SP272jzPhQ
	YayfaApuyeDD8iZBkp229hIqxmlJahqjPIuwCb3VR+XcBVVR25s/uUXWhE3zP6QGQP9JuFVLINY
	Q/O+ioJFa0Mt1BLhKHJ97WeFCk1FmG/y27nOC6bFk0IQ5lSeGFtMoe4/WhSpeGqrDn4emiORseV
	f5b0wsT91jhIs3Ja2ZsXanL43jERWg1M0EL6ED0n63Y0XKufOlbRSIghM6pygkzaDMdHtDggtM8
	b8eOQVmW8ajRyyR4nUNYEfxY9vV89U1NIyPkzM6LykuF3UCBuupt+/OYl6NtUwThR0tjlo9l1KG
	zpEhEWS7xOHk7Dyo7h0x8fvSGgOz51/m3PUicYLfJAlkthpf+1zHTldGR9VzNL7qgWLc1lYs=
X-Google-Smtp-Source: AGHT+IGHcOYigzHIAUS0Fj07O1hbtXB+Bi/0NCv/FJrkxjisyDWs3KCdlZlpMW8IhDoHQPG+qbQnBw==
X-Received: by 2002:a17:90a:dfcc:b0:31f:12d:ee4f with SMTP id 98e67ed59e1d1-321162d62e0mr1421893a91.23.1754082249976;
        Fri, 01 Aug 2025 14:04:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63ee49c7sm8173291a91.21.2025.08.01.14.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 14:04:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6b9338c0-e333-47dd-a3e0-0446b346f008@roeck-us.net>
Date: Fri, 1 Aug 2025 14:04:07 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on
 max_hw_heartbeat_ms
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aIw-P6zkQSOhvYJW@shikoro>
 <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
 <c06bcde9-0aa5-46d1-a5bf-bae5a319565c@roeck-us.net>
 <CA+V-a8sDP7iir-bPetbCw0fakPRxua5F-F1hVvXUD8bGAMdhFA@mail.gmail.com>
 <cd0653d0-4a2f-4361-8eb2-c1937d988a8c@roeck-us.net>
 <CA+V-a8v0KZaeJwJAmEpRRdS3F3vC_CYv7zGN_n9a+M6qhFDMHg@mail.gmail.com>
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
In-Reply-To: <CA+V-a8v0KZaeJwJAmEpRRdS3F3vC_CYv7zGN_n9a+M6qhFDMHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/25 13:51, Lad, Prabhakar wrote:
> Hi Guenter,
> 
> On Fri, Aug 1, 2025 at 7:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 8/1/25 08:30, Lad, Prabhakar wrote:
>>> Hi Guenter,
>>>
>>> On Fri, Aug 1, 2025 at 2:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 8/1/25 04:05, Lad, Prabhakar wrote:
>>>>> Hi Wolfram,
>>>>>
>>>>> Thank you for the review.
>>>>>
>>>>> On Fri, Aug 1, 2025 at 5:10 AM Wolfram Sang
>>>>> <wsa+renesas@sang-engineering.com> wrote:
>>>>>>
>>>>>> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
>>>>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>>>>
>>>>>>> Update the watchdog minimum timeout value to be derived from
>>>>>>> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
>>>>>>> consistent minimum timeout in seconds.
>>>>>>
>>>>>> I don't understand this change. Why is the _minimum_ timeout based on
>>>>>> the _maximum_ heartbeat?
>>>>>>
>>>>> The reason for deriving min_timeout from max_hw_heartbeat_ms is to
>>>>> ensure the minimum watchdog period (in seconds) is compatible with the
>>>>> underlying hardware.
>>>>>
>>>>> max_hw_heartbeat_ms is calculated as:
>>>>> max_hw_heartbeat_ms = (1000 * 16384 * cks_div) / clk_rate;
>>>>>
>>>>> This value varies by SoC:
>>>>>     RZ/T2H: cks_div = 8192, clk ≈ 62.5 MHz -> max_hw_heartbeat_ms ~ 2147ms
>>>>>     RZ/V2H: cks_div = 256, clk ≈ 240 MHz -> max_hw_heartbeat_ms ~ 174ms
>>>>>
>>>>> Since min_timeout is in seconds, setting it to:
>>>>> min_timeout = DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);
>>>>>
>>>>> ensures:
>>>>> The minimum timeout period is never less than what the hardware can support.
>>>>> - For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
>>>>> - For V2H, it’s just 1s (174ms -> 1s).
>>>>>
>>>>
>>>> Sorry, I completely fail to understand the logic.
>>>>
>>>> If the maximum timeout is, say, 2 seconds, why would the hardware
>>>> not be able to support a timeout of 1 second ?
>>>>
>>> The watchdog timer on RZ/V2H (and RZ/T2H) is a 14 bit down counter. On
>>> initialization the down counters on the SoCs are configured to the max
>>> down counter. On RZ/V2H down counter value 4194304 (which evaluates to
>>> 174ms) is and on RZ/T2H is 134217728 (which evaluates to 2147ms). The
>>> board will be reset when we get an underflow error.
>>>
>>> So for example on T2H consider this example:
>>> - down counter is 134217728
>>> - min_timeout is set to 1 in the driver
>>> - When set  WDIOC_SETTIMEOUT to 1
>>> In this case the board will be reset after 2147ms, i.e. incorrect
>>> behaviour as we expect the board to be reset after 1 sec. Hence the
>>> min_timeout is set to 3s (2147ms -> 3s).
>>>
>>> Please let me know if my understanding of min_timeout is incorrect here.
>>>
>>
>> The driver is missing a set_timeout function. It should set RZ/T2H
>> to 62514079 if a timeout of 1 second is configured.
>>
> Ok, you mean to handle the 1sec case, introduce the set_timeout for RZ/T2H SoC.
> 
> Although we cannot achieve the exact 1sec case as we can have only 4
> timeout period options (number of cycles):
> 
> 1] For TIMEOUT_CYCLES = 1024
>   - (1000×1024×8192)/62500000 = 134.22 ms
> 2] For TIMEOUT_CYCLES = 4096
> - (1000×4096×8192)/62500000 = 536.87 ms
> 3] For TIMEOUT_CYCLES = 8192
> - (1000×8192×8192)/62500000 = 1,073.74 ms
> 4] For TIMEOUT_CYCLES = 16384
> - (1000×16384×8192)/62500000 = 2,147.48 ms
> 
> So to handle the 1sec case I'll set the timeout period to 8192 with
> which we get a timeout of 1,073.74 ms.
> 

Just four possible values to set the hardware timeout ? That is an odd
hardware. In that case, you could also set the period to 1024 or 4096
and set max_hw_heartbeat_ms accordingly. That would avoid the rounding
error.

Guenter


