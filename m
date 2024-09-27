Return-Path: <linux-watchdog+bounces-2052-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C669882D1
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Sep 2024 12:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 748F4B20C23
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Sep 2024 10:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38F8183092;
	Fri, 27 Sep 2024 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvVycrQ1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1227176231;
	Fri, 27 Sep 2024 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727434382; cv=none; b=azGP5ZBi+pCTCPkNdH7D9yvP1pYQqOT1ksn1/CgDp9t/G0tIDvY5Wk4aUhcBSj4pUtoMNRJZuWhD3aGt4xMtdnMX9aRP4Lmyy0FeZfOUOJjkkt698oTrCZ3I6YXBl9ENMXyyuefhv7mZF0QOhkIS0cpremrnYN+0NVYuZTJFJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727434382; c=relaxed/simple;
	bh=qpzjcK7P9aCIhyL9j6ErFx1L8MX/ouoRYzE4NRYamEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onvch/lRJCi4sOACc1OOZWsGHsLm827KG6uNSqdDd48CMnXBW36AJdQ/Ynl6Z1ntsCS7JDCp34yeukdby+4YiMn0GC8ZEzoZGsMnvHGnnGQ9xzQwaaHgt6ocK29Uk4MkY9JEfcYGjlKap0zjvrGR+wlqn1DME/sPEm/8YPgEStw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvVycrQ1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2054e22ce3fso23177935ad.2;
        Fri, 27 Sep 2024 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727434380; x=1728039180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=E+c2UctfRu4dEGPzoXRKlz44mkq/CrL/aM0G1S5KNv0=;
        b=lvVycrQ1sfe+2GVle3nLaF2UD8qeixxUmgcm6O4+45mkZPHw8AHMQUZmSQjY+uoAce
         eIfRx18DEYFPhnUvNanOByFTbZFVyDvilW6C272sS3NppmNNJ27rKNPKH6ZeMD00ZyN+
         07Caupbx+Y7RqlxGhXy1jYgfDbyHc6kDL/cBT5Bh5zs2AqqrULO6vxGJcVXJopR95QlL
         NgFjhIC7ujDkmqeTZkow1ObMH1tXQn5NdYjdWwe4IzSLcrVwPKmZn6YmeldWh4k1/At9
         +kwzgrqdL3al7lauUfw2qTTwjiPHmqAtGAMHZ4085nzOsjnbFE7RrqMwdvPyF6hwJMbz
         bmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727434380; x=1728039180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+c2UctfRu4dEGPzoXRKlz44mkq/CrL/aM0G1S5KNv0=;
        b=xVK1Q/3HD17hoxqX9Xgo25O0sCvz+ss0cfp/OW2FDlBaa45RAUrAhXeR9vTGPZTJ/e
         2Z/0/pSAZvU1baU+1U6aEZiJHwqmcWIzzvnNwVGbdnMCsq1ipkhoHa7FVcZ2LsFpzEVo
         2RB+Wav3td+ZCgKraZXnHWljAAghvtajBEujhIkj+GpleKcGTI4puhfseocCQCxMGvwe
         10A2tsvUzl6eDbLWqIa6vJRf/kwlM7awdLnz/aAKUVcdGan2PmWj1nMdyD/VrLj6Lkm+
         VUcTgxdcqOnix7OM5YKRn4kA4p5fxGdNJjKY79Xmv210l284rxCyrjkS0RGlbblCNK4R
         uG1A==
X-Forwarded-Encrypted: i=1; AJvYcCUrw8NW2UG84wuf1NBQcKT/z4uxGqfOiNkzIro3ld7wYzD+D+hL66PnnKShIbRfdcWuoZWK3awHZk4nUtA=@vger.kernel.org, AJvYcCXHzG8165jA0NyNCkEsTtS9nfJFgnPgPX0RU82181+Iso6AB+DbTgIcJUWDIqCarPpKCBABFxhZ84a6LTQyPlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLrhHGyQUzVPQfKnS5B5IlRBrL8Y5hfeV54C8DVI0rJhGbrfjh
	TyB0pO/AXcQIwCcnQWCIdrp5QycZDsJtN7LqLSwnIZwKbvGv+0s9
X-Google-Smtp-Source: AGHT+IFGNiiYrlQT5OIBiZ/pzB/VJiF7lU6NaACC3XfoT0i7X25FX8NVpQCZYuqjMSI+wOeV2Hj1Ag==
X-Received: by 2002:a17:902:ce88:b0:205:4531:54d with SMTP id d9443c01a7336-20b37b6f245mr41351605ad.30.1727434379981;
        Fri, 27 Sep 2024 03:52:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37db029csm11624785ad.106.2024.09.27.03.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:52:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8fb6bcdf-be19-4769-a1cb-dada2e9c3362@roeck-us.net>
Date: Fri, 27 Sep 2024 03:52:57 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] MAINTAINERS: Update the maintainer of StarFive
 watchdog driver
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Ziv Xu <ziv.xu@starfivetech.com>, linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20240927065032.2773997-1-xingyu.wu@starfivetech.com>
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
In-Reply-To: <20240927065032.2773997-1-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/24 23:50, Xingyu Wu wrote:
> Samin quits maintaining the StarFive watchdog driver and Ziv joins instead.
> Update the maintainer of this driver from Samin to Ziv.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


