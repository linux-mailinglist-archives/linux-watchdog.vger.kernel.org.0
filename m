Return-Path: <linux-watchdog+bounces-2686-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E08A0BCEA
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 17:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B2AD1644BF
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 16:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A5620F069;
	Mon, 13 Jan 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRVT0ifl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70320AF78;
	Mon, 13 Jan 2025 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784537; cv=none; b=KxRSWLq9WzeznyWpk5TOc1rI4/tx5sU1q7orEoqijeMWIagk7hfgrpQHoExQO1zmZHn3oAqKhpcYp7g9hr5Q3OwtxGzhCLKQ6Qe0IYvCahAy60XpBTEygR7iIIqCrlTGZgrMGgy5r4OzAR+EYXGOzisw5mVJKfOyBzFlmSzgQqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784537; c=relaxed/simple;
	bh=IfgGRWz6ae8S4EK9cNKKZjQIeQuO+rzio0Y7EIEjxs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=neFDDZMg36PsVVVCnz/EyujRpnYPQ6LxAh3gdb8Ya97DIF9eOEELeARvnJ7uskTrTaVvBnnw7ZsbApOuUL9KDzlNSf7/8LUDTDkPfdQuYwgGVULfVGV8b2A52w0jKxiLQe/SxpRTHz6pWOiAYfPa3EAUO9hg/hsts/unFDjV2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRVT0ifl; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so5693388a91.1;
        Mon, 13 Jan 2025 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736784534; x=1737389334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NRETzwkOZKuaOhGGrnA3lxukHHTM1H1HlsIzOvybFl4=;
        b=eRVT0iflqkGmyPQPAZ9Ez21YxVLaj5XoKttpMLsdb/rF+uM1ajzqeHsfistj3+hHbP
         dscjGzSbJHJP0qStXgokjQGpIxk2lMWFpJWe76iwjTOJeozThbJk1LAdY+bjvmq2WU4I
         IEkpoZrR3TTYIa1tblImt39x4pmaUDnBCpGC/5eYr1FPOvydWgVEwdAJuxFA4tYYvKEQ
         NXEXymmZ3k6H9pZavBEV/iPnC4OqAbGyG4SjwRZUoej6PC2k+ghN4eP0usQRmWm7JLtU
         fGi3YVBEfA7UwuAHDx1CC8gdITMDIjODvelj4DDHPv2q5O6Bk/GRMDOFBanXK2vbmriG
         4+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784534; x=1737389334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRETzwkOZKuaOhGGrnA3lxukHHTM1H1HlsIzOvybFl4=;
        b=o8Wxt/+DTYvI3kOPmZUnp/Fa7ldPqAd6+bVbKFs8BVDFTAE5PnvuCegzpONBZMk8yw
         3xYW3kvqE6nolfDZfl4kvCNpALcDLgTTOZQDEdotFKt2X5aE2UCVqE67VR1sTtwKMx3X
         01uNcPCovMMvFkfxItUMNYVc9XgDFuSuJDd1r5IPEz1rtJTLsVm6Ft/9a7tOoxaZK9sN
         chAAyjEB2lHpwdVnR4BNKg2Juhbre0TnghfyRy+5OV9EdvZcMltteNGBvDf3JEPRyW4l
         RkAauPI7LRB6rUyKEh58/F5sWs0EvzSg/et/HAxn+5e2PGm7BwNhuddjrWnaxTXY9AOC
         Oa9g==
X-Forwarded-Encrypted: i=1; AJvYcCUTy23GbGLIqrKIszhbDeUI/m8dX3+gwaFMGAskALMTesmeCCh9zsqribUrMoGhYzu2mMg8BGmu2XqDxl5P3tDz138=@vger.kernel.org, AJvYcCVg9FqcrKmWY3BDwFvra6ag+qooZ3ZQpKqDw/XxA/2nMvmb14BBktAj2dQjhGbVs3XZwXTvJ2taeAL4@vger.kernel.org, AJvYcCX0rmnP7D+ablMiGTCA+hUMhP0PntuEKXGNnZJWBGxm2X906jaiZbyS2p4pEwmKyXVQfF6Hg7WKoyuv@vger.kernel.org, AJvYcCX2lecvBIbrtNR0CgK7u3OzG4M31PdaXWnTBcmcTGfSjOblhPrMLmj5GZvhk1Ru5xUt0WgtsDy0umnFSKlTihA=@vger.kernel.org, AJvYcCXLkcmDE0gGkxxzLSJnfRMl3nA49EmRa0ML++ibVch4zeG8N7mVkD1NFCjgnwDihSHp4q4tnxJ0OAl30epH@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOUkfFtylU+SZEF1tdBXHvdxEANljQcP/QzGMXUJzgnSfZLaZ
	wm65BBiqUJUs9ULJgLPaqZBhFQgdXaQxSdGqg8UARASNPlHNJudU
X-Gm-Gg: ASbGncs3CHIO+/nmEh54GQGQM0BIv4gVtUWZtKkA2xM9u0u0vY8Oi86xklQhofY0LLX
	5b7QUQBwAEM53olH3OXj9+Lzwcfh+rTXmGgN7mUpwdpwiBjFGlHJtscI5NU7h01APjOkv78YrxD
	Ym2pLMCsg9lCjqwrsHLAcPhZ/wnNtE5uxoRztvGS5cdQG6HLZrbRPX3J7ED4gUxOCtQgVUDRAo/
	m48XugN91crtikSP1X9iUubJk7mu7wwUHYypRALNpanUYjgbJ/BitFgpFTekz449GF3idYk6wHM
	cL/xS+W6jlD2UbHLC5lbESd2z175Qg==
X-Google-Smtp-Source: AGHT+IEhnLpZ/7Lxjz0KTy7GYhvIULupFuK4VJsIGKRNP5/8fvGuTmf67/SE0EhBQd4QB2pJrr5JIA==
X-Received: by 2002:a17:90b:2dc2:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2f548ee5378mr28145322a91.21.1736784533566;
        Mon, 13 Jan 2025 08:08:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593feae0sm8030878a91.17.2025.01.13.08.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 08:08:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5cb9f4c9-c1b2-477c-9c6a-797a4e60d30e@roeck-us.net>
Date: Mon, 13 Jan 2025 08:08:50 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tQ_tyxPn2pO=mSPVW2RffVhFz=CPCxR2pxXP1FLkcQcA@mail.gmail.com>
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
In-Reply-To: <CA+V-a8tQ_tyxPn2pO=mSPVW2RffVhFz=CPCxR2pxXP1FLkcQcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/25 04:40, Lad, Prabhakar wrote:
> Hi Biju,
> 
> On Mon, Jan 13, 2025 at 11:38 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>
>> Hi Prabhakar,
>>
>>> -----Original Message-----
>>> From: Prabhakar <prabhakar.csengg@gmail.com>
>>> Sent: 13 January 2025 11:24
>>> Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from watchdog for RZ/V2H(P) SoC
>>>
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Hi All,
>>>
>>> This patch series adds SYSCON support to retrieve boot status information for RZ/V2H(P) SoC.
>>> Summary of Changes,
>>>
>>>      Clock:
>>>          Add syscon compatible support to the CPG block in bindings and
>>>          device trees.
>>>
>>>      Watchdog:
>>>          Document the renesas,r9a09g057-syscon-wdt-errorrst property.
>>>          Update the watchdog driver to fetch and report boot status via
>>>          Error Reset Registers (CPG_ERROR_RSTm).
>>>
>>>      Device Tree:
>>>          Add the syscon property to CPG and WDT nodes in R9A09G057 and
>>>          R9A09G047 SoC DTSI.
>>>
>>> These changes enable the watchdog driver to identify boot sources like Power-on Reset and Watchdog
>>> Reset, improving system diagnostics.
>>
>> This means that, we should assume U-boot/bootloader should not clear the WDT reset status bit.
>>
>> If they clear it, there should be a way to propagate it from u-boot/bootloader to linux,
>> otherwise, we get wrong bootstatus in linux.
>> But the clearing of watchdog status by one of the cases:
>>
>> 1) u-boot identify the boot source and clear the status bit
>>
> I agree, if the tf-a/u-boot clears the register, the bootstatus
> reported by Linux will be in-correct.
> 

I would rephrase that: Today, the boot status is _always_ incorrect if a reboot
was triggered by a watchdog reset. After this patch, it will be correct unless
the boot loader resets the status bit.

> Alternative solution, would be:
> 
> Let the TF-A create WDT nodes for us and add a property
> `renesas,r9a09g057-wdt-bootstatus` and propagate the WDT nodes to
> Linux.
> 
> renesas,r9a09g057-wdt-bootstatus = <0/1>;
> 

That would require both a property change as well as a change in the bootloader.
I suspect it would also be inappropriate as standard property and would have
to be passed as 'chosen' property (if that is even permitted) or as command line
argument.

Either case, if the boot loader has to be changed anyway, why not just tell it
to leave the boot status alone ?

Guenter


