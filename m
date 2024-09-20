Return-Path: <linux-watchdog+bounces-1996-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A297D730
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 16:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7FF2284730
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 14:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E9379C0;
	Fri, 20 Sep 2024 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1I4h3JQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83D17C21B;
	Fri, 20 Sep 2024 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844304; cv=none; b=iyZ80O5Xsf8EeBi+6PaVjV/Np9sJZ60jOZDi+OyMLdtHPPCjOHdSUb/CyokYufGMu5G5Za1AFdpYeiIzj8/TDtohHw9kHWUSsc/IWYVwFqzVlzHBCOB7IAWEl2GjnKLPRuoQ/Ttdo4YfPhRL0Mtt/lJ5tR6ciiFXqsYnH0YZis8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844304; c=relaxed/simple;
	bh=F7VW+38YkfYrOdIps0qbmxsKsewCErp6/rAUqx/w9/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N328yhPRevDowCu5RI3zPqXoM3t1QzlpHvXdTKAFXAu/9ttFNWG+gqJF/vG9+QPWTdXTa+ZMNjJ/eJY6P8cRp+Ad6FmEe+doE6ZhdZnYtL2OX4znOTYA3KDTunocl1ZZOFkbcO0UPOTKWqHN8K0/2M/01FTIuM/+B1y1OnE7JgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1I4h3JQ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db1f0e1641so724895a12.1;
        Fri, 20 Sep 2024 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726844302; x=1727449102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=69Ai5LvhNUYR4IJgcq7IQfzna+mHgTfiWiM32wBl+Nw=;
        b=G1I4h3JQ6Ya97y4maifapbw7D47giHOu3SewW1UeHLBjZ4BryU+Yi0h7nWZecijcb6
         hjxGkYjF7R6cZQTL/KZDqkN94l8DxM7Y5WGeUaWsaTB0oNlLdF3WwDQ70o+GCNGsplWI
         6Un4fyM9ECFtDLGwkXROoAymx4HRIOGOKDGfqEAakYYHdYa265/03q4KmTFQywpaJVm8
         bGiqfXCb2bTCcssPUr2WYC9CAgIGfXru+Ltixp0AeCfRTNdkn+TMJSRwDJBeZ3S5WDt8
         5lnqSwL+E7dEbBawTGufYMUCrKDuw26huY3rKVFS3YlvswbB2uniD20k/Rxa4hIcTdLv
         XMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726844302; x=1727449102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69Ai5LvhNUYR4IJgcq7IQfzna+mHgTfiWiM32wBl+Nw=;
        b=n4zw5wer8N5TxyAy0tMReLlFQ//5X1xyxLHlQcFZudXCg0lX/CzRHfHs9Oq1RODZFK
         g1Pi/9RD8lLzoUSyvN0IOxJZhZR2hn8jOMaObxaxdjAi1GLK0YjhvC3fGPiOTYEVRXBR
         mez/JTzkuTnOQTmpBr8DG1KHF39UXE3oFzXj/IICtXvxfYxo0Y670iAqonn9GnskRjb8
         TRCZRtkc5bSmemqqzkf8ukxOH6W5vCsfF35Y9LT/q+O0sRGaYJFocz9L/BykXdcBeNiC
         6Vg5E1gIBftuDc6NsESEigqX9IXhG1VIzgakKXBKZSvED5XQmNYiRFq/Qk51x7wFqNXY
         uDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ1AyTc5NXHn0mMZHgLoC5DoDD44OLJGA7f8PN5ehDIzt6eI96gJfVs7prTSS812qkEubxAYdA0XJr0AKgkQ=@vger.kernel.org, AJvYcCXrRxVD+g/HaRN+5S2UWXCiQsiwWOShUA3rfRy85anO0+0e4DIdKanDqJEC8tZr19oB63r0jpYS4WoobIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4LleR8FGQgsDEr0Z63lSVusdd2+yHMnfXTD0ARIs8mxZxDRB
	arfzQTpYD6VtfPec02eCb0oqCuw1gyIvXCYAW1CfGnV4fH17TDk0XLbHFA==
X-Google-Smtp-Source: AGHT+IFS14r+vvooHawbdxg3AAjDYfpTobgQO43FAsXAs68QAa14OqW1P3sy4RxFtqwrQZi0KfRW2w==
X-Received: by 2002:a05:6a20:b603:b0:1cf:2875:c4af with SMTP id adf61e73a8af0-1d30a947cd1mr4070594637.8.1726844301998;
        Fri, 20 Sep 2024 07:58:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a9cab5sm9927233b3a.5.2024.09.20.07.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 07:58:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2509005b-2dbd-4dde-bd78-c832a2a343a0@roeck-us.net>
Date: Fri, 20 Sep 2024 07:58:19 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms
 using clock frequency
To: Harini T <harini.t@amd.com>, michal.simek@amd.com,
 srinivas.neeli@amd.com, shubhrajyoti.datta@amd.com
Cc: srinivas.goud@amd.com, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20240913113230.1939373-1-harini.t@amd.com>
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
In-Reply-To: <20240913113230.1939373-1-harini.t@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 04:32, Harini T wrote:
> In the current implementation, the value of max_hw_heartbeat_ms is set
> to the timeout period expressed in milliseconds and fails to verify if
> the close window percentage exceeds the maximum value that the hardware
> supports.
> 
> 1. Calculate max_hw_heartbeat_ms based on input clock frequency.
> 2. Update frequency check to require a minimum frequency of 1Mhz.
> 3. Limit the close and open window percent to hardware supported value
> to avoid truncation.
> 4. If the user input timeout exceeds the maximum timeout supported, use
> only open window and the framework supports the higher timeouts.
> 
> Fixes: 12984cea1b8c ("watchdog: xilinx_wwdt: Add Versal window watchdog support")
> 
> Signed-off-by: Harini T <harini.t@amd.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


