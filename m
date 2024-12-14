Return-Path: <linux-watchdog+bounces-2576-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596809F20FE
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 22:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6607B166893
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 21:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BADD1A76B7;
	Sat, 14 Dec 2024 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUTo62qD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36645137E;
	Sat, 14 Dec 2024 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734212801; cv=none; b=FxzNM3aRgTpQrEqWgGlowPwYHMZiKgc2E5WklQ7cyxFPFVAd0hyYeMqv6kUXKDl0UsIvECmghhMOCH5iHwN3WZp+f3B5ZNuMj+x8SjJK/V/2Bsup94lcePgGSd+3153St40undKDluIf4cPmaDw2jx7oi859OpUbVFobslhrMVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734212801; c=relaxed/simple;
	bh=5M02OVns2Iz8P3BP7U+TZ+l7ty5OV2Jj4S5MCvNcS6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gIvXbw8hi6fKrLsrAkevrw0iS0BGcIZ8bOSW35NRL++GM582w6zu2u+JUBzh1/vZM61xfmBQjjY0aoABR14EAgPaTQ3iv43Q2ECmjzI+b9ETs7KDwv2xwOg4kgAwgV+PB85b2CUC4SKWUU/YuP9guSepUa+rrDZ+ZEVj9DF/gX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUTo62qD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21636268e43so36304515ad.2;
        Sat, 14 Dec 2024 13:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734212798; x=1734817598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6UvuuTwlUaB3Br+i87vUX933lDcfu6mE+mstWL6yF9U=;
        b=YUTo62qDjgktMuQ27n1H7wFajDXjra1x8deoP03a6d0gAXV8k2h8w+S0Pp2wggpNiz
         2bqD05ZeIG+P51i/ce2n7RP9RBFBOA3e0/Iuk85dRm7Qps+9eBo0UxgQY/rxRCLjf9Je
         3mkFCkDuGwAky19NXY6ytMt28Qg1fgPYx88C3lEL8AslPE/NkCIEkJsGDBtLJx5cIL4F
         f7Wky9YPGmxE4vxJhje3JQNHShOKR/MKu6w6/UR43uvt3oLDMJ8HPSmpI2LPajQnh8vV
         mzlIduy7N397KR6u/Mh2B7QnPe6kn97EIutad7AffzOuEM36huRjxTXnHGOqf7urOdY9
         MLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734212798; x=1734817598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UvuuTwlUaB3Br+i87vUX933lDcfu6mE+mstWL6yF9U=;
        b=u4vdoFtbERJUgEb21uT3GvXZb3l+P2SLW4O6ZwbOMcDXeF2Dum17JekNuy74R+0qRC
         ubZeoMWjallcJK2pbPbP8/sQ9e0NcqvShfoiZ7SZd4wopffo5hMdqL8ReDmCDk3Ln98z
         1aib/lWYxCoEPba6PdVu6FrtkfvrdsJ3ZgfhjGxCGnoQhHugq4/PIbSdxlvRZsZxKcfe
         5dcXD0yA7vwNuzg+j+WhjxKABQjETmvgfQOF3YafiVMwrabxnoRzcYgljQwCEk7Nk1iY
         OWkOMZWul0aEmeFPJH1K/03aN44dEsoETMO1om8aBSSWdLJ9SWRu/tuUobCnyvbxwWco
         LStg==
X-Forwarded-Encrypted: i=1; AJvYcCVImwtQrY1TyNjL/sbHyAB0oTL72lnqLHdI5YQwCNgMTCblO+l9fOvzd+LNXrVXxzabGuu3klY4Ku7R8LQ=@vger.kernel.org, AJvYcCVdso9qsdThukts20Pb0iIt/NboHWrLCrgFE1MDdhPxp78tf4t0xnaUiV0+f4Wq2Dmd6DxvLyJEFdwTcjV5bN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMXfx9MOumrRAfl3jEu5UtAd55/2qiOKZ5d/m2nfBIHj+Z7lB
	hYAfSo9lv46pXGoeQ1TSgkABiCJKDAMDANHEHVy6dCFWQ9Y7U3L/
X-Gm-Gg: ASbGncuvXu1pICD/64rcBwJUTaVz6mENarWR4kzooQeIL+KboXegzlft8ZmKp9jHaxo
	urRYY72m1ZkawQib+zLrC+l4MXiBKMTkH7aI1fsFBWzrxlsHxH+dLe+9coO5zvmZBU4Oxd7/B3X
	O4hNLJ9pbA78YvSiFvd3RU0E9B9CYqq4oPElfQBPdulXyrLdMSHbgU8rQBZFUv0UENKSk+24CBt
	A7u0zyJhvEkGTrosJiLSv6Tj+XrHsXun9zbKCax0Wjw1QU03rBdMR0upCgcAFhSAoXud9rd0hv1
	FFg8XHhJ1dYDQfnZU3Kl2rakYHf12Q==
X-Google-Smtp-Source: AGHT+IEZPwXuT+jhvGafA+HbJxXjg528LE13RpAPOnkGSYOwMGLuNDL4Y/sz5BWORDDjKyhDUEn2SQ==
X-Received: by 2002:a17:903:234d:b0:216:42fd:79d2 with SMTP id d9443c01a7336-21892a52c51mr91855615ad.49.1734212798464;
        Sat, 14 Dec 2024 13:46:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e4ff7asm16770315ad.134.2024.12.14.13.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 13:46:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <927f2063-4587-423f-8c75-441f55e17671@roeck-us.net>
Date: Sat, 14 Dec 2024 13:46:36 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: aspeed: replace mdelay with msleep
To: David Laight <David.Laight@ACULAB.COM>,
 Phil Eichinger <phil@zankapfel.net>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241212113014.1075414-1-phil@zankapfel.net>
 <3fe75eab-e700-4ae2-984b-42342ec7d784@roeck-us.net>
 <d7ab80332def4a328cb9492fddcb8bef@AcuMS.aculab.com>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <d7ab80332def4a328cb9492fddcb8bef@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/24 13:21, David Laight wrote:
> From: Guenter Roeck
>> Sent: 12 December 2024 13:56
>> To: Phil Eichinger <phil@zankapfel.net>; wim@linux-watchdog.org; joel@jms.id.au;
>> andrew@codeconstruct.com.au; linux-watchdog@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH] watchdog: aspeed: replace mdelay with msleep
>>
>> On 12/12/24 03:30, Phil Eichinger wrote:
>>> Since it is not called in an atomic context the mdelay function
>>> can be replaced with msleep to avoid busy wait.
>>>
>>> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
>>> ---
>>>    drivers/watchdog/aspeed_wdt.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
>>> index b4773a6aaf8c..98ef341408f7 100644
>>> --- a/drivers/watchdog/aspeed_wdt.c
>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>> @@ -208,7 +208,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>>>    	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
>>>    	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
>>>
>>> -	mdelay(1000);
>>> +	msleep(1000);
>>>
>>>    	return 0;
>>>    }
>> This is a _restart_ handler. The only purpose of the delay is to wait
>> for the reset to trigger. It is not supposed to sleep.
> 
> With the recent scheduler changes isn't the code likely to get
> pre-empted?
> Which (effectively) converts is to a sleep?
> 

This code is called from do_kernel_restart(), which in turn is called from
machine_restart(). I'd think that the kernel has a severe problem if it
decides to preempt that function.

Guenter


