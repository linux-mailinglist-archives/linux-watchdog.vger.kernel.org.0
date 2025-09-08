Return-Path: <linux-watchdog+bounces-4211-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B9B48F72
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Sep 2025 15:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24E08163431
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Sep 2025 13:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D04730B52F;
	Mon,  8 Sep 2025 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alUja21n"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6C130B518;
	Mon,  8 Sep 2025 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338054; cv=none; b=mlT5jJRJJyj5ihy+JkJ04JFCUAYABMpjdqzqyqfqYCosZr/u7+lyek5TGfLPdYVCVNyeqAqP5ymTEQt7seU/7fh/7Y6kv18fvY/ibplE3H3kT7qkLJJ5ppdT99/PvkoLw/fsIEVtwLwAU64KaJgx9r++ZGV25G3iYhjeYT7Qlhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338054; c=relaxed/simple;
	bh=EMnZwioFS9ldoQsAg3weXxlkOgMTh8+7cR4xNNezO9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzuRr7w3gHi49slwdEbm5xTrkw7j/S2A5rlbuzTyH/OZ8pJ/q//fgMm9EiV5dkp4cHxyApjI+gYCc0Om3xRw80BL/npKUjxLuwEh8Qkqbxnnctr4CC9+yZ3BcBr753/azM1COHw6MOnQwFT1M/HkmiNPx8SOZX+halzv4eaVois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alUja21n; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7724cacc32bso3320089b3a.0;
        Mon, 08 Sep 2025 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757338051; x=1757942851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I0l71D8MFHugq5TyO2rGPUzHlXMYD/GEMQn83W+FG2Y=;
        b=alUja21n9uO5aDs9yqn9G5ZoWNZxLo/PYfSnfmsEn2N45JSwqx6n31/eoq3M4qpDTN
         qu9DMl02UXGPm2YhAKS8A8qGdJ2Iwwy/JMvDWdtBCxPjmKS+LlG+ycG2AucV6Carzh5X
         V87nhIp0jhx9a8gERgApmRNmBl+dX3LgFFUUxIU/fEFYwEm2uT2kywsyrBWYzffsJYOa
         +TfXkRQCjoNyt6acZG1QrRfEvCWhOacIU+r4b7ubzbZAYXRk8xpNlTKclqJ6OgLqltCy
         LoGy2sVva9KoqLTu7lsHbxuweZV4LFwDO7iXRdpN6a8fMcBewumWNU0u0RHHGH3zyvD9
         JsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757338051; x=1757942851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0l71D8MFHugq5TyO2rGPUzHlXMYD/GEMQn83W+FG2Y=;
        b=wieP142cWS16vfWJrhrETI/q5GegXmpMV98RA+1JEFZ3drl9q7A5g59IM/rGv0rdNW
         kVUIIT8B4aexz7AQo28O2l3kWFUik2uICZzV5Oo7rl3MjKjYB4uc/BaxlFZGxXuZaK9p
         5CagU1QsQ8qd8NR3+wAgyjbunr13XLO7EYEEIOQgW+hS0w6S7Dc2ecZhi5qmQYZC0rv/
         MnepShrvG41XkUze7wgsjIaa7Irs4Ay0foVDVEkeOuvW/qqJRJbMhndf3njzFnXa2P03
         wLNF1KsWHCgPyCmJzThLM3Mb8ysmFVwq/CD2dlTn6Aq0QKANA064S6pQOOJu+46XwZIu
         bQHg==
X-Forwarded-Encrypted: i=1; AJvYcCU4W0836hPmQ8aF0sJUWkX++6s8aNoCIMIZB10kR2+riV2jVfPWOGom+fb1JKH7p66kILSmBrVpvPme4YY=@vger.kernel.org, AJvYcCV0YIHf3tBWE8i/rrXbvVctv/CkAb4Lqh+MKbEvzDFgCFhkZT3FgnqpTOHc5Him/fe61VZMLb6SBlBK9b4N@vger.kernel.org, AJvYcCVyE2+9ivf6kqk/lGaUoGfDibu0y5MFWnbK+1An+ERVS+z9Xo/zY6nxtYEPLELFwFzhnhQMh/WqovMb@vger.kernel.org, AJvYcCW3MvCaAYWj1D8V67X1rVqCCaFw+/7sWTQ6mZwYCv7hJXnPG/CN7j/HWESK+Ro8xoBygh/MpFUERBCjKkCdhWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY/xyWEleXLuOgQUi3wegkKJ2TLfbOfKic3+55QfoxPzcvQiCz
	UK27nH/kcNIYtCctSiwfNyz25/LZr3pkNZvYyn6+tF58HP1UP+Zfxh/A
X-Gm-Gg: ASbGncvOI/bNIhjflFUCOv+nRtRpc9is8cgaS6WJq9JvwN8Fotp2QTq87jqq9KTgEoP
	4VQD6U8YdSn3f7EiEUjDlUqIFolBrp7Dt2Tcs9kiZHt7ufa1M+NraZUXXgJO/QzAW5+PJktIfa+
	GsAcb/UKssfOSoa81qhQMvBkUfAAhaUBN1/jA7AO9gJ8wFzmKA+rKX3wHAliHuxD4C/zI1StuAT
	Z6DDejsCQjKNq7/liEra1yAklHMndNzEwTtV5xAulBiuIHDYEUkDlwUypDCIqbKG4WxU2xOiq2+
	RhInSbAr6MXDo7mkkzNxrJF/fJfsW/MGvNNNXTqs+7BUOAHMJ6oj6jtc+UwAkmXr4YXHalGQ9gN
	wXkSwJ6Xr6gfFrxN1yYxvhzohHuUbtpMX/5IYhXtDEVvW1BYjN9mycaBXmraNOVDOmnrOgls=
X-Google-Smtp-Source: AGHT+IG5mHu1wEH4bpvsyLlzH1twN75NRcxvdgvbm4gluUQV37+2bxa2wzMIMNShSDalyUmEmo85uQ==
X-Received: by 2002:a05:6a20:939d:b0:243:fe1e:2f9e with SMTP id adf61e73a8af0-2533d6029c4mr12013727637.4.1757338051281;
        Mon, 08 Sep 2025 06:27:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a501a94sm29908945b3a.93.2025.09.08.06.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:27:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6cf6192-faf5-4e69-aa62-b3cacfa38f4d@roeck-us.net>
Date: Mon, 8 Sep 2025 06:27:29 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] hwmon: sl28cpld: add SMARC-sAM67 support
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822131531.1366437-7-mwalle@kernel.org>
 <83189bf7-6831-4373-a352-2a3a05526e08@roeck-us.net>
 <DCN86WR0CPF1.38V3X1O08VYJG@kernel.org>
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
In-Reply-To: <DCN86WR0CPF1.38V3X1O08VYJG@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/25 00:04, Michael Walle wrote:
> Hi Guenter,
> 
>>>    static const struct of_device_id sl28cpld_hwmon_of_match[] = {
>>> -	{ .compatible = "kontron,sl28cpld-fan" },
>>> +	{ .compatible = "kontron,sl28cpld-fan", .data = &sl28cpld_hwmon_chip_info },
>>> +	{ .compatible = "kontron,sa67mcu-hwmon", .data = &sa67mcu_hwmon_chip_info },
>>
>> Effectively this means that the two chips have completely different functionality.
>> One reports fan speeds, the other reports voltages and current.
>> This should be a separate driver.
> 
> Fair enough. I wasn't sure, the reason why I've chosen to add it to
> the sl28cpld driver was that I don't want to clutter the directory
> with many small board specific drivers. They all have the simple-mfd
> parent driver in common. In the end it's up to you of course, so
> separate driver?
> 

Yes, please. The parent is irrelevant. Functionality isn't.
Thanks,
Guenter


