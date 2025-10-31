Return-Path: <linux-watchdog+bounces-4495-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF86C25DF2
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 16:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961AE189FD29
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 15:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340822E283E;
	Fri, 31 Oct 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJjpSUV1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497892E0B5A
	for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761925349; cv=none; b=t3Ncml45hQDAf1fzgSgHlUjDx1Ob9Vg+VazG/nu9ZuKyXbb+fceLt8Ai2w9AOX8+5C4xUMi0DJHqn32uCC+alWiQGS+jl4NgAiujnCY4CmiozcTpS0Yy+3NSWstFanZJfsaa75Ccc29eOPCcwPxJQG/cmWVCBVIec4Xv1LiZjd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761925349; c=relaxed/simple;
	bh=DkC3XUMOy5x4fzNHe6722Vv0CXnahuKKD/D1E6lxj4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYJRC3vbZEXMJj6YXV5CUfjrd9K6Bq+Xg+S9sm/qW31ULgJeo/OQl0ZIorTWNKEqfH4AMtqj0KZnlIUSgwiMxt7TqdDnPRQRAgca/sIe+NwIYlJnluaSkkTGi0XDwS06GfCGedf6dIt22sZ05vDYzEJUz1PPjsx0rqgMHBmergk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJjpSUV1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so2353758a91.2
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Oct 2025 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761925347; x=1762530147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DUW12GL783o5v1SNVDp+240/b8eqDDVvpE7KYeAY/BE=;
        b=kJjpSUV1dPqH/N2jhFnh8YDjZV6SIEacxm4XSDXbkfhsIc/CRzKnZyC6IRsJEncIMB
         aRg0dBxnT41ZBXWNr4KXrAeUksc4QmSxLAJjC0tvkPILQ2SxV0tMnS49F9vnclwd7BOO
         WqVTsCj8S0ZR3mjdE6zOhyaRo8FWmgiPWSWiedes4YsRLsm7f+8GOvQgS2Cq9yEsp/1G
         D2z7GQnczbQxETOak8oXnDZNt1hEW4xwGsn/RVZdKJBW63dc3XZ4ldW9hbCm6TnH8Qz8
         x76C7JX5/4qEVGPdV+e3kIRbqvYRM+us4AbKFC4Rqpni7k6wzkO6PU2gnCi3dKkGYVc1
         517A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925347; x=1762530147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUW12GL783o5v1SNVDp+240/b8eqDDVvpE7KYeAY/BE=;
        b=vZ/EpCIa+HMX/LPSkny5jnzQK59CW8Boj8IsJnFh1mIIjIV2zyzZv5xMZ2cP2fqHIR
         binoLil/o+0oyVgSIgQDB5Xg0R6AUbLpEuDJpRUSVjxyeMQHoNuckbPzTykIarNfdB8Y
         XYZfxBjkSNtU4BIG6DW5fDW3u9joiKFM3i/uukY5mBP3n7TPRZv9zUa6sWMncF/qy1t7
         ebAELNS31PLC+NMmFUm2Ka4m8MWnMFTbZHVHrtQoDNEv/ztrkSFHYDnKQHGVHaI2ino1
         ZeCERj0tqE1ao6/aV4h31xVBXFVh1R45J/1cBnjmWxZJqY2OwS4NY3MdjUknk1GL9ZiJ
         99Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVUrfcUomfAk6iqdIbcmjNQkdw2BJy0QTQx0WEwhlyApodGd30MC1sSPMX+afayqWGOfEQtkRGFHSeRe1VkCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyArjtG1Ehe/N3HFGw8avKfE0iKY3k1LMh8c781cbKFBDlebRVa
	FN61UXSjCc8CpgR9J2cuQxnOEROpKxCiMYSsKdv2VdyocsBdx1ncROv2
X-Gm-Gg: ASbGncsmmbf5d0+0ChvSFEd/oDxCC9k9J66kmjR1BK0Jw7yZe2k+IyiLwzz5wPQDT8g
	CCf6ms169VdEhytxFTHKkqEjbSvNi7pKS6wFrCaSqPEsVTCwvawQ9gyzfBhmUZ8IPmtUJq106Le
	KUFk3mPR6R4c5ht/TtuiWhYQ20u4z5r7WI4H36k3nT7590uz1r3Gw+CgzK/CbpdpEAvO27aB6p3
	8nGaC1s0pDqpM39Ea0zpHrNnW+pT0kGL5SM9CRU1IrsC/1x/Buza+Jsmm8vPoo2bX4PgkooXirJ
	7WudPE2BD9j4fA+9goiEWDDOOiitcUzmV9Bsz5TnTFy4xyGj2mDy7NTNf3TaCVsXkth4Q0ZCNeA
	YLG/ZKR2ixaf0FG6dLFn04WGMEAIhcLEsWswdlMzyH5c69uHBmDE1tCoUzVZ56TJmgi+NFRQJtP
	8o73OcXiLRxtrjhfxfiKnj5f/xeoRvVbzaH2HN5zqqrNcf6gea
X-Google-Smtp-Source: AGHT+IHzRt2IQAq49HtbK6kPh+mT205eusm0v30d77JYLIGZB3Pyg8nionXZOk5b5MIz/yIeIUsVdQ==
X-Received: by 2002:a17:90a:d450:b0:340:a961:80c5 with SMTP id 98e67ed59e1d1-340a961873emr1202725a91.32.1761925346582;
        Fri, 31 Oct 2025 08:42:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bef83380sm2466159a12.31.2025.10.31.08.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 08:42:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ba0a378e-ccc3-45be-9c82-43e08b6ac3af@roeck-us.net>
Date: Fri, 31 Oct 2025 08:42:24 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] watchdog: Add driver for Gunyah Watchdog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
 <4bxoananq55f7u4kckqjof37or6fflppmbyyc3j6noodzr75nt@vtfxbnhrcgzy>
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
In-Reply-To: <4bxoananq55f7u4kckqjof37or6fflppmbyyc3j6noodzr75nt@vtfxbnhrcgzy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 07:36, Dmitry Baryshkov wrote:
> On Fri, Oct 31, 2025 at 10:18:14AM +0000, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>
>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>> through MMIO is not available on all platforms. Depending on the
>> hypervisor configuration, the watchdog is either fully emulated or
>> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
>> Specific Hypervisor Service Calls space.
>>
>> Add driver to support the SMC-based watchdog provided by the Gunyah
>> Hypervisor. Device registration is done in the SMEM driver after checks
>> to restrict the watchdog initialization to Qualcomm devices.
>> module_exit() is intentionally not implemented as this driver is
>> intended to be a persistent module.
>>
>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                   |   1 +
>>   drivers/watchdog/Kconfig      |  14 +++
>>   drivers/watchdog/Makefile     |   1 +
>>   drivers/watchdog/gunyah_wdt.c | 249 ++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 265 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c0b444e5fd5a..56dbd0d3e31b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3083,6 +3083,7 @@ F:	arch/arm64/boot/dts/qcom/
>>   F:	drivers/bus/qcom*
>>   F:	drivers/firmware/qcom/
>>   F:	drivers/soc/qcom/
>> +F:	drivers/watchdog/gunyah_wdt.c
>>   F:	include/dt-bindings/arm/qcom,ids.h
>>   F:	include/dt-bindings/firmware/qcom,scm.h
>>   F:	include/dt-bindings/soc/qcom*
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 0c25b2ed44eb..f0dee04b3650 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -2343,4 +2343,18 @@ config KEEMBAY_WATCHDOG
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called keembay_wdt.
>>   
>> +config GUNYAH_WATCHDOG
>> +	tristate "Qualcomm Gunyah Watchdog"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on HAVE_ARM_SMCCC
>> +	depends on OF
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Say Y here to include support for watchdog timer provided by the
>> +	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
>> +	  to interact with Gunyah Watchdog.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called gunyah_wdt.
>> +
>>   endif # WATCHDOG
>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>> index bbd4d62d2cc3..308379782bc3 100644
>> --- a/drivers/watchdog/Makefile
>> +++ b/drivers/watchdog/Makefile
>> @@ -102,6 +102,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>>   obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>>   obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>>   obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
>> +obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
>>   
>>   # X86 (i386 + ia64 + x86_64) Architecture
>>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
>> diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
>> new file mode 100644
>> index 000000000000..bfe8b656d674
>> --- /dev/null
>> +++ b/drivers/watchdog/gunyah_wdt.c
>> @@ -0,0 +1,249 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/arm-smccc.h>
>> +#include <linux/delay.h>
>> +#include <linux/errno.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> 
> Is this header used here?
> 
>> +#include <linux/platform_device.h>
>> +#include <linux/watchdog.h>
>> +
>> +#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
>> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
>> +			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
>> +
>> +/* SMCCC function IDs for watchdog operations */
>> +#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
>> +#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
>> +#define GUNYAH_WDT_PING      GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
>> +#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
> 
> What about calls 0-4?
> 
>> +
>> +/*
>> + * Control values for GUNYAH_WDT_CONTROL.
>> + * Bit 0 is used to enable or disable the watchdog. If this bit is set,
>> + * then the watchdog is enabled and vice versa.
>> + * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
>> + * it's expected to be 1.
>> + */
>> +#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
>> +#define WDT_CTRL_DISABLE BIT(1)
>> +
>> +enum gunyah_error {
>> +	GUNYAH_ERROR_OK				= 0,
>> +	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
>> +	GUNYAH_ERROR_ARG_INVAL			= 1,
>> +};
>> +
>> +/**
>> + * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
>> + * @gunyah_error: Gunyah hypercall return value
>> + */
>> +static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
>> +{
>> +	switch (gunyah_error) {
>> +	case GUNYAH_ERROR_OK:
>> +		return 0;
>> +	case GUNYAH_ERROR_UNIMPLEMENTED:
>> +		return -EOPNOTSUPP;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
>> +			   unsigned long arg2, struct arm_smccc_res *res)
>> +{
> 
> 	struct arm_smccc_res res;
> 
> There is no need to pass it through arguments.
> 
>> +	arm_smccc_1_1_smc(func_id, arg1, arg2, res);
>> +	return gunyah_error_remap(res->a0);
>> +}
>> +
>> +static int gunyah_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +	unsigned int timeout_ms;
>> +	struct device *dev = wdd->parent;
>> +	int ret;
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
>> +	if (ret && watchdog_active(wdd)) {
>> +		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	timeout_ms = wdd->timeout * 1000;
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
>> +			      timeout_ms, timeout_ms, &res);
>> +	if (ret) {
>> +		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
>> +			__func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
>> +	if (ret)
>> +		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int gunyah_wdt_stop(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
>> +}
>> +
>> +static int gunyah_wdt_ping(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
>> +}
>> +
>> +static int gunyah_wdt_set_timeout(struct watchdog_device *wdd,
>> +				  unsigned int timeout_sec)
>> +{
>> +	wdd->timeout = timeout_sec;
>> +
>> +	if (watchdog_active(wdd))
>> +		return gunyah_wdt_start(wdd);
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +	unsigned int seconds_since_last_ping;
>> +	int ret;
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
>> +	if (ret)
>> +		return 0;
> 
> This is the only place which passes something back in res. Please wrap
> it separately and return int value.
> 
>> +
>> +	seconds_since_last_ping = res.a2 / 1000;
>> +	if (seconds_since_last_ping > wdd->timeout)
>> +		return 0;
>> +
>> +	return wdd->timeout - seconds_since_last_ping;
>> +}
>> +
>> +static int gunyah_wdt_restart(struct watchdog_device *wdd,
>> +			      unsigned long action, void *data)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	/* Set timeout to 1ms and send a ping */
>> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
>> +	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1, &res);
>> +	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
>> +
>> +	/* Wait to make sure reset occurs */
>> +	mdelay(100);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct watchdog_info gunyah_wdt_info = {
>> +	.identity = "Gunyah Watchdog",
>> +	.firmware_version = 0,
> 
> =0 is default and can be omited
> 
>> +	.options = WDIOF_SETTIMEOUT
>> +		 | WDIOF_KEEPALIVEPING
>> +		 | WDIOF_MAGICCLOSE,
>> +};
>> +
>> +static const struct watchdog_ops gunyah_wdt_ops = {
>> +	.owner = THIS_MODULE,
>> +	.start = gunyah_wdt_start,
>> +	.stop = gunyah_wdt_stop,
>> +	.ping = gunyah_wdt_ping,
>> +	.set_timeout = gunyah_wdt_set_timeout,
>> +	.get_timeleft = gunyah_wdt_get_timeleft,
>> +	.restart = gunyah_wdt_restart
>> +};
>> +
>> +static int gunyah_wdt_probe(struct platform_device *pdev)
>> +{
>> +	struct arm_smccc_res res;
>> +	struct watchdog_device *wdd;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
>> +	if (ret) {
>> +		dev_dbg(dev, "Watchdog interface status check failed with %d\n", ret);
> 
> dev_err
> 

Then -ENODEV is inappropriate and the actual error should be returned.

Guenter

>> +		return -ENODEV;

