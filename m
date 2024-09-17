Return-Path: <linux-watchdog+bounces-1950-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3197AA30
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Sep 2024 03:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB6428A511
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Sep 2024 01:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7C3EACD;
	Tue, 17 Sep 2024 01:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjkC4I+t"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF29F4F1;
	Tue, 17 Sep 2024 01:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726535391; cv=none; b=sWzU+Zrs6VaUWIiiKqhkiR7WHsss8F3kLWcXjVvkihi1I3Gvj2jWNHDOJ5OclEvLT/IxGUn4QY6c70QnaGilTINROo0uf9qbu0bMMg770UzyGcaeyTzE+otepefluNRJsSAXXp6uTs+8GK2Knq7GqET54bkWMGxLuUv/DD30tfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726535391; c=relaxed/simple;
	bh=TO2dyC2MiJx0AQrTYTPzWgKNA2McnZOzOTcbs6ZZ5hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YV0V7D3KKN5NZu9peHulQcsUOPRntT0IJP+YHXdbSfzP9say4eOTr20p2J9yrr75fJAy3PEJ2lduDjxi3CR2L+T2EKOg+cSTreKw5/Me286x19EPwCDOP47Kpee28ycNOOXDC/i7DLTCU0FBDTQGlmaCPIhl6+PLznW1bVpjhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjkC4I+t; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-717934728adso3913992b3a.2;
        Mon, 16 Sep 2024 18:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726535388; x=1727140188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0UWjBC2LkKkQFXRo7VSgs3OXZoFlbpyNQ5yYtvN4opw=;
        b=kjkC4I+tQ4Iztc9OIpPe3aWFjTuR6hbd3hKjIKSnGGcfiZdZGOpLrTarH8X/ZAZyY5
         Dwe1gnFI13pnnb1KZt+U9vnyOLLR2xp1VZh6HzjA96tE1XsSqLIjCrTl+ZcJHvkHdlMI
         xwYQVW7DreGvE9SatIcci0C9opzjlr23Vps8XrmfjCWwjjc0nC+7D3GAxj6JbLc2FamC
         cABlYR1cUgBRGyeNNgTIgxx/POHhYAolO/XlXlWAxY3BTXEMhNYYcCDy11nVuAkqpX+/
         orvGshoj9/KLD0eY93UxB/9/II7cIyz1GClFr3hDvzZCS/TMI5SRwAMSfR6274bHCC7q
         ytXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726535388; x=1727140188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UWjBC2LkKkQFXRo7VSgs3OXZoFlbpyNQ5yYtvN4opw=;
        b=Wpk8nL9ZLc3pq89MGK52G71BrBmGWy7caOAFi73ofQZhA/bpRrnPnuX3elEkeeyNqj
         5OBskE5dhUPW0R2pKBNA9kleVXfUgjHLMnDiKyVTnbYeyxO1DS65mEzS6T1W05h+T0BZ
         RJOD3R4TsJXQKIFlejBoHIk3Q0/FBnA/v7TNasBHd/ujOFIVG1EURRH6hx06eDylso5b
         7RjazomgWyF4zuKJuXvQO89AUajiCuv03MAvEIwKbzdsEmJWxQx2fd3DkSA6clm21gOb
         YnK+QwCYmXf+cmfWncNxsLVn1QHr/4cKPDVmqur2WMk19YVaMy1i/AY2sWKZchyHYsva
         LGaA==
X-Forwarded-Encrypted: i=1; AJvYcCXNAvaB9IztnG+usZouaOgmUZL3UEAfwXQnEcDNueya9uBC3swEeqZO308YSVawQlcOEH/dTMBn2/AOOXpWnPI=@vger.kernel.org, AJvYcCXxQY0DviVRM3lC9FSIMPN998bOU19Kn2uvNHGvMW8p8k3Wf6Uhf6UJVVifISaP0ndq2S2f2g+lOM3fPB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBLpOSJlmf0sO76WthFVFjGLmCh4Id3VjVEB+sDBQGC5ISpDi
	26bh+VBz6ee5unr6LfgVxlyqqu9ZcwSD9nO+ppGFDAmcrjTO9j2i
X-Google-Smtp-Source: AGHT+IFYKllIurADZoscUfvxgUpPKoFStBdZ607Ms4FVvbgcb8w1M68PAn0X00K0VaHaFoK8azXhTQ==
X-Received: by 2002:a05:6a00:2d2a:b0:706:61d5:2792 with SMTP id d2e1a72fcca58-71926081bf9mr22048997b3a.8.1726535388500;
        Mon, 16 Sep 2024 18:09:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db499a1c6csm4786512a12.91.2024.09.16.18.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 18:09:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05dba51b-7c3c-4455-9c97-09777e885fac@roeck-us.net>
Date: Mon, 16 Sep 2024 18:09:45 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit()
 call
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: jdelvare@suse.de, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, mika.westerberg@linux.intel.com,
 wim@linux-watchdog.org, wsa@kernel.org, xe-linux-external@cisco.com
References: <cc652ed1-32c7-4ea2-b494-698b344f24a0@roeck-us.net>
 <20240913191403.2560805-1-oocheret@cisco.com>
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
In-Reply-To: <20240913191403.2560805-1-oocheret@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 12:14, Oleksandr Ocheretnyi wrote:
> Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
> PCH iTCO") does not mask NMI_NOW bit during TCO1_CNT register's
> value comparison for update_no_reboot_bit() call causing following
> failure:
> 
>     ...
>     iTCO_vendor_support: vendor-support=0
>     iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
>                                      disabled by hardware/BIOS
>     ...
> 
> and this can lead to unexpected NMIs later during regular
> crashkernel's workflow because of watchdog probe call failures.
> 
> This change masks NMI_NOW bit for TCO1_CNT register values to
> avoid unexpected NMI_NOW bit inversions.
> 
> Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   V2 -> V3: Removed not necessary variable 'mask', updated multi-line comments
>   V1 -> V2: Provided comments and macro define with bit description
> 
>   drivers/watchdog/iTCO_wdt.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 264857d314da..dd297dcd524c 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -82,6 +82,13 @@
>   #define TCO2_CNT(p)	(TCOBASE(p) + 0x0a) /* TCO2 Control Register	*/
>   #define TCOv2_TMR(p)	(TCOBASE(p) + 0x12) /* TCOv2 Timer Initial Value*/
>   
> +/*
> + * NMI_NOW is bit 8 of TCO1_CNT register
> + * Read/Write
> + * This bit is implemented as RW but has no effect on HW.
> + */
> +#define NMI_NOW		BIT(8)
> +
>   /* internal variables */
>   struct iTCO_wdt_private {
>   	struct watchdog_device wddev;
> @@ -219,13 +226,23 @@ static int update_no_reboot_bit_cnt(void *priv, bool set)
>   	struct iTCO_wdt_private *p = priv;
>   	u16 val, newval;
>   
> -	val = inw(TCO1_CNT(p));
> +	/*
> +	 * writing back 1b1 to NMI_NOW of TCO1_CNT register
> +	 * causes NMI_NOW bit inversion what consequently does
> +	 * not allow to perform the register's value comparison
> +	 * properly.
> +	 *
> +	 * NMI_NOW bit masking for TCO1_CNT register values
> +	 * helps to avoid possible NMI_NOW bit inversions on
> +	 * following write operation.
> +	 */
> +	val = inw(TCO1_CNT(p)) & ~NMI_NOW;
>   	if (set)
>   		val |= BIT(0);
>   	else
>   		val &= ~BIT(0);
>   	outw(val, TCO1_CNT(p));
> -	newval = inw(TCO1_CNT(p));
> +	newval = inw(TCO1_CNT(p)) & ~NMI_NOW;
>   
>   	/* make sure the update is successful */
>   	return val != newval ? -EIO : 0;


