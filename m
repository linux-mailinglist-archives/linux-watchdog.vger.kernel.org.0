Return-Path: <linux-watchdog+bounces-4441-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1059C162C5
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 18:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A45E35075FC
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 17:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530CE34BA3B;
	Tue, 28 Oct 2025 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaV+STcO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DB34B1B7
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672577; cv=none; b=IxB78bBseCK4Rz7JHOSgokqBMvTDkumy+jikhmHFKxQOsAKMFoo+72ty9wWgWYZC6+VzvqUrUQXyoKQpz+195elA6eF+QR32gKAbAX0UIw4ECCtYwiCgTeEVxOGhu9V20QzE4XBVTPpv28Ne2ElE66Fs3cHiaAdbCsfgE3aG3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672577; c=relaxed/simple;
	bh=mLaJkdITSv6Is8zPQGc2oaU9txa3BtXHgeprQEssuU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNlVtZhUAMtWQHEXHnPb+TTqbWN+YNPSgTdHMTOIFzZp0QOX3BN89j3USu29CoPzsr7XRBth52Qo6JFt8dZQU3YaYHSa1k8EnzSbfYreUduH2dS6vge+CdDHJ1FKeFeEOkfHrMMzydxC/fXI9z4IrA13I3sjp9HcgcEBonBSTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaV+STcO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so3665432b3a.1
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761672575; x=1762277375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gcJ0tdXPSdBcMOQywcDfmNdijzeyIMqzu46LHOg2GhE=;
        b=iaV+STcOP85Zt9U22XZ9gdk9mZSdURT2cB4BJjOvWScO3zD5K4PQkGSwKIE6wFggSt
         eJV3yCOGEQRWCXvXlnA31H+9dbxr3qv1HQDSdM1NB/MXzEaQL5eeh9HGvDHrJJdHiHey
         btMWFKTf8ic1tZkqz/mvY5HIOyUztDbScJgUhJg671d8pzkWVT0rgwsdHRBvw9aWZb7n
         RB39aHKN52/bnsxg+QgPEVo/B5T2b3qw/xbSyJR9XE4Zh6wqs8Zpbvew1za4mb296vyT
         VjSyLSHqqTK4HEDSuu1bZkIg6n+bQQ6sMaTYqJZuZ0N+uwal8KBYxLe+PuogVBHCxiDx
         ek0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761672575; x=1762277375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcJ0tdXPSdBcMOQywcDfmNdijzeyIMqzu46LHOg2GhE=;
        b=wIupPjmLRt1WK6V4RNzGmClXjoLxSPJhAoj1s8USukqGG5CrLeUcJBRh3AdTyhR/TX
         2JFISV3mATXmS5ZClNHXmfRud6RI/zEJpBB+xzDgQT3809387lN23rN71dxslrK1ZMh0
         g5N/uORLNrI6qsDNNel+2wlbahVIaxasyXScVLq/VuCIxZz06Lqv5hDW5ilEIq53NofK
         vk+qi5CFvSjPh56tUzRtsxnQgltr2Nlyw76VrcNl+8xVDWjngf7T1Gnd/r/DvVYwZ+Di
         d4NJXoDfqQykR0GjAqrp56MNn/09rBR+j2pjh9f67V0PtVpM9iLYVupSF9xt+NXsj8ph
         Jcow==
X-Forwarded-Encrypted: i=1; AJvYcCVKtsPYSfH2s9ubH6gicKYbCZBSPu0hhbqJWqiUK6RH8XOkCtB/TVdbeGnXdyQXew8H2NlB/a0py5qpSpta5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YH2fJy329232wp6PtQfjjMG2gempcVCgZW7YnUFKsrxSEX4h
	E4kcaz+gYvQwxEZqgeiEqTsg+rlFeKRE/xKdzW/CxYpdsNdRHdw3QCat8g0fFg==
X-Gm-Gg: ASbGncslLaZ1kXhfKvR2D3REE7yD5X0gprpguFM1wISAUEkl+bwD6Pw91pKKP8OofVh
	PYepJy0FPzLqpMCF+9UeVHDUQYMVsiGr51Oue7CFqqRvQpcwcAQpedhVa+o7xlodmxl05ywTDhU
	5r+zC367xNv/hYDirtL62lu85bkoQyGMB9J6SnK9xStr1Tv1nRztugyL6uS1wnXDgxPPcvT8BoT
	sp0FoFtLTp0Kectk1+6F4xC0m0YzB7U9z2tOu8Hm4wQ7Wbc4tFuwQwbVlK7pVbjULfOhvi5pdQW
	R7cSSHfyK6e8HedfWWRZ3/1izEuElb9P+MIeo+XKXeepqO8Uep50om+AoeRh3DvnGzZ6e/dE+Jf
	MCpKQRd7QvD/oIEQN2dDcfPn+/xtWTsdIsOor8sP4oyD8fLEwyNnFq9yECR+bMi2THQRlm4rU+d
	W9HdMFDb2w5EV6rhCnXqJIS9wz564sqCrb67ac2T9G3TcmwFSF9X6TmbkQjWk=
X-Google-Smtp-Source: AGHT+IEShVBffr8PhT0kvfjmLJE8orJUsSaD0VqPcsjclNHp2TKIqt7OXzFI6Bt7Z6FnBrFqK09bTA==
X-Received: by 2002:a05:6a20:3c8e:b0:340:cc06:94ef with SMTP id adf61e73a8af0-344d4907489mr5343988637.56.1761672574418;
        Tue, 28 Oct 2025 10:29:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed74028fsm12789159a91.8.2025.10.28.10.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 10:29:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6ceb8331-cc4a-4754-8b9e-dea887665efc@roeck-us.net>
Date: Tue, 28 Oct 2025 10:29:32 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <4659e69b-907a-49ba-8eb6-ac17232a5219@roeck-us.net>
 <3e4fd54c-90fb-4b15-a9cd-a2d11b0aa952@quicinc.com>
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
In-Reply-To: <3e4fd54c-90fb-4b15-a9cd-a2d11b0aa952@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 09:40, Pavan Kondeti wrote:
> On Tue, Oct 28, 2025 at 09:06:12AM -0700, Guenter Roeck wrote:
>> On 10/28/25 02:35, Hrishabh Rajput via B4 Relay wrote:
>>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>>
>>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>>> through MMIO is not available on all platforms. Depending on the
>>> hypervisor configuration, the watchdog is either fully emulated or
>>> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
>>> Specific Hypervisor Service Calls space.
>>>
>>> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
>>> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
>>> the devicetree. If we detect either of the device nodes, we don't
>>> proceed ahead. Otherwise, we go ahead and invoke GUNYAH_WDT_STATUS SMC
>>> to initiate the discovery of the SMC-based watchdog.
>>>
>>> Add driver to support the SMC-based watchdog provided by the Gunyah
>>> Hypervisor. module_exit() is intentionally not implemented as this
>>> driver is intended to be a persistent module.
>>>
>>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>> ---

...
>>> +	gunyah_wdt_dev = platform_device_register_simple(GUNYAH_WDT_DRV_NAME,
>>> +							 -1, NULL, 0);
>>
>> I did not follow the discussion around this, so I may be missing something.
>> If so, apologies.
>>
>> This is a highly unusual approach. What is the point of not instantiating
>> the watchdog device through devicetree and doing it in the init function
>> instead ? There should be a devicetree node which instantiates the device;
>> it should never be instantiated from the init function unless there _is_
>> no devicetree, which is obviously not the case here.
>>
>> Every other driver which supports devicetree has an .of_match_table
>> which triggers device instantiation. If the Gunyah watchdog can for
>> some reason not use that approach, its devicetree description should
>> be fixed. Instantiating the device from its init function because its
>> devicetree description is bad or missing is just wrong. It is even more
>> wrong to try to contact the hardware or embedded controller to figure out
>> if the device is there. This can have all kinds of negative impact on other
>> hardware.
>>
> The Gunyah WDT node gets overlayed by bootloader. We see that this
> overlay is failing w/ upstream device tree since the overlay has
> references to downstream code. Please see [1]. Hence we are trying to
> register the platform device dynamically.
> 

This is just wrong. Whatever happens downstream is not an upstream concern.
If an overlay is broken, fix it.

NACK to the current approach.

Guenter


