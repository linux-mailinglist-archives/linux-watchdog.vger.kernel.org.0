Return-Path: <linux-watchdog+bounces-4148-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01027B40A61
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 18:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71AC17FE1F
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 16:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FB9283689;
	Tue,  2 Sep 2025 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJtzUvbZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D1156F5E
	for <linux-watchdog@vger.kernel.org>; Tue,  2 Sep 2025 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829834; cv=none; b=FPabBhLtipN8dvPuSqoZqC1YHfqWED249emRojjIaS+InHMtH4ZckzqNwQvyj1bC9TpIO/NSiYU4VqDfsyLtkM0TztK9eERkQGALnpXYUemgm1rGfg3ikGoWlffHvSbVMt8vRb2mayj+2qD9U3VPfVhWCLT5oojmmZWucTGFdOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829834; c=relaxed/simple;
	bh=4smLet63U21kzyE8MsVffFN1zJOiXEyi7QuZeJN8uZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CECnf0n2Yr8M23xzUP63orgf1uxm63HhBb2OQ9aX4t+nJqKbJu5LY1LJyy2AErw42TNCgXJq4juDkeRzQ9HDvxUSL3HDRm7p41ZYFdZvdGVENva9/yOVHMB67EYtvu7v0+ovUD10kUufgx/pp4CrwhaDulR38x9wKK/tmHIsQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJtzUvbZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77264a94031so1041325b3a.2
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Sep 2025 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756829832; x=1757434632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfTT/0L5kL1Bj/6bdsdzAICO5F5R4CJvks4G8LxlPY=;
        b=aJtzUvbZxdTLvlZuHS6baDIimAEFIETW+r25YI8Tcxcih6okDa0/64KvUItAkIrOd7
         V3TKhGgRRVzNI16BKgj4yKlaLjt06cd19W2694Wm2w0exAgxzetDXjGLswqi7wXcOP0c
         nW3k9U/6AWvOH5vu5sxE/s2bmAzqpnwQPBaxe/qwolGHacuqA6qsXeCwUemOyT7iVt+c
         RPlfyeGBbfaDwhVI4CEYdFL/12i3RMnATjBo5gpVnrnMYmFPJYKpiThBe+YXZ+tKb7Nm
         AQGZIMzPuitgy5ohRc0hUqv/8W7IZqI4CpGXuoa+XUyGVH+Wh3Ujbs5PVRpkuUM9DH4f
         xWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829832; x=1757434632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPfTT/0L5kL1Bj/6bdsdzAICO5F5R4CJvks4G8LxlPY=;
        b=Pa/jCf7ftNaaAcmszgfB721bM9QDJo/LyTtpNtmBqU9kCApQqNtx35ie8SJBI4ZQCt
         mXPe43s0bAvtDOOJcD4GhC9qfJQnugbIdE8yS/5CZdwkvrL7EzV1tp4K/LWu630hD4TG
         jWWLLZk0M3acsEVbdgX5Zdc4wqAVBlW3YNsk2Wj+Uv3FthD7F6CHcXUePk5MmMxopz35
         HblGhylaXHT7Kg7uZymYvHmR4zuK+Kiq2EtbB0iudNrMaYoFNJbKHKEtyXgvvCfyR+OX
         BrxlqaJexKMhQymFjcRGMkITLTV0FAXBSp3nwyzPmEdMYhS4L+U8vIVuymUozS80sgZo
         OQ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8ZBlWHQqRimmgI3vU02uTzwJ9qy3E0etGZQfIUE+a6X2LmSa7XiTdduM7WgvoPqr7MXUmvtmJHt9OLKo8Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/idl9a6JOeZ9SOf/sEqtHdzMOlMXgF0DkwBNSLI35mbMDdK8X
	u4Ey6DKEYG7eicIgKm7X/szA6Wn8ZXySpZLGjk+QugcqOM6jPG83PRDd
X-Gm-Gg: ASbGncvwjlYI//ocedSyvtAL1z2CKVIEHawuTGnRtNKeT+oqR85v8HNRNuF+udSWVPh
	7rmsYUjzcy8Q7VKl26CHBvvhty/2y5CDSEdCXkoh5wa4FWGF8YtmhR5xiNHETL6dB2gfPod3JZC
	0N44HBqinHiMHqXoGWoZw+ZlDTRgtI5wbPH+WM/zbRXzG24BRmCa0Zu9XrDDF4P4CMSTvWkCfFl
	uMfryIVVmPANy0wAo27orTglEqyjutGuaI/Djv8rAJj2RSGqBUh5ifq36PY7fjf/jXZLgs4K0OM
	e1rTP4ezxk4iMlfqCH8MIEWYYKDBPDG4Pe3SC6T1rxzDr637o1+yiWGtKeBg3AgZTfcFuO1tJbY
	NpT/CLABja28v+HCtvVhdaZZVHiDCQDd1dEF/6eyABKj0Viub1Y+4GE5/UJ3uLBrj7TpPYIc=
X-Google-Smtp-Source: AGHT+IE20K+tA/6/z1BySaXCYennEWsXPCv07XakypHENnnb7aFGqIZ3vmG/e1SUUKAD6wtf/+hPhA==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr16422834637.49.1756829832415;
        Tue, 02 Sep 2025 09:17:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772590e054csm6562208b3a.87.2025.09.02.09.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:17:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0c7829cc-e7e4-4d15-8d67-6e188e2d42f5@roeck-us.net>
Date: Tue, 2 Sep 2025 09:17:10 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] watchdog: visconti: don't print superfluous errors
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-arm-kernel@lists.infradead.org
References: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
 <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
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
In-Reply-To: <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 12:05, Wolfram Sang wrote:
> The watchdog core will handle error messages already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


Reviewed-by: Guenter Roeck <linux@roeck-us.net>


