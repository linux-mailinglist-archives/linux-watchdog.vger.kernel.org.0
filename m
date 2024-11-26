Return-Path: <linux-watchdog+bounces-2491-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB59D9A73
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Nov 2024 16:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D86BB215F8
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Nov 2024 15:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC011D5ADA;
	Tue, 26 Nov 2024 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9ADWYFU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A11E1D5CFE
	for <linux-watchdog@vger.kernel.org>; Tue, 26 Nov 2024 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732635174; cv=none; b=aXIKvr5+ygcvoWHTsPqnmxif8vFhdsHWYmnvf8pWQsUssGEFCx8yOZMhidMZHW7fAzNORpmvtlJlbi29VB9Pdud9wu8XVc0ZaF7o9VbjjKQ6sxP8p5UTECauCBGY18j34aEm/eSE8WELOwP/9ct5B0IM4oPZg9zhU/pTZZjZ7r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732635174; c=relaxed/simple;
	bh=sI1PdnMG+EwfqZQa0MvzB3N21EHRVuwzkFIinfRP7Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppmedhAaasonKVJ68E/UKbhcz/Iuj1U8zw693UC1WVVzO8EdKsBrcrGOcPhpfrd9Pv1Avq8A0THfAV6SrzcxjCl2GkOEXq/A57Uu+fmJtsbrLm5cSgwUPvKuEIGGiLTftwdvE4S7+TLn6hskVG1MMvNEo3vb53IusTNnB8SoleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9ADWYFU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so5082402a12.0
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Nov 2024 07:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732635172; x=1733239972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+G0SRkTm4LW2cWO/9wDnxt8QGAOUsLs7tvoMLIMwSCY=;
        b=b9ADWYFUKPtnBMb9Vcyz7HAmr4fDVh98GmTzuQ1tx38MjSLkgut92f633a7qw+AeaM
         jyrxF0xwoKz0lT91gHIgVWq9ro6FVUWIIurHTv0QVINSEycqE9KwYAnjJ8jzOgvjJTg7
         OZOSgLWeGA28XWr94RdoI8+Q8j3uBq7pmRvJgWGW0lQjX8JRlGt4yYFKYW1lA0kUerEI
         ANkJi5+AK1ktRcnvTmgDIOi3Kx5OByfR7HZvIoJrt9QlmliJcvY5ONj78CGeAoh5FymR
         QaNa55FSTo4HW5iiCVeZQqhxXswfWSyGow2gPXBS7G0Ezo/QanKnvl9H17kNXYzdJ8z/
         vDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732635172; x=1733239972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G0SRkTm4LW2cWO/9wDnxt8QGAOUsLs7tvoMLIMwSCY=;
        b=YAjG+8b8mLo5TL3218CWxSveSmDGGhF89xPyrepEXA2JIlhyA6ElhmLZWcyAzCHOnj
         R6/RUIdiqcAv4ui8xMmGdLAJBBH5nBwGH/KWV7TMzhTsJwUDmzfzScEXLTxm1+IXd4gQ
         lI6FtuiE6r3aNYEkWlXNpWMA5D2YO0RZcGMfp3dfqMeUmXkbCWREvYiQ7t73Le/a0g39
         xXmjSJvqqKPfRzdYUZU3iBSTBB6rqU7vuEuUdpuqld3tnxjHrgKLyI7zx6e0Sz9b7hEq
         4D7TU5HE86RnZIcoUxBUVFXq24kP3cxoe3CPQ4XmQbcQ+4it327T05val6/dYClVG7Hm
         rLqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfxKFA23J1GPk3mF8z8rhGhb4Rey15HE4CZvsxox2++jj8kP1EpGo5E0L3NbEKXNyjhL26jG+II2LM4G+QWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4GiGjYe4/rXzgnbjQrD7GMDnL9N2tK8cDV3ejPCwLm1JR8Tq5
	fVrMjVe8brk6nLmKqxO+KF4aC6XtB37nc2/QB3Nu3WvHYAVXjhPq
X-Gm-Gg: ASbGncsqTir7zWdvG20Sdq/EGI8ZuCG5qHjSCLQSwUrTZFlqpp+gq2L7MmqpS5MYjrv
	iSs4WmVpRV0A2f5jTzmgfx5XW38rD1bJgfHv+q1MVLoE2fpUG3hjTzjMO1cMIdYJjZh9NyWYJpA
	nbJSPJd/EIT3ZfAHOD4je6IXegzaMPtmHMjmexaOcuaDHb1I/bfSAc7IB9/0I8tLJgLFWPf8NGD
	MV6OJmLovEVXsMyTReqQObTwB9poXX5l/ZWVkiwd8kxQsS9RIu4xfwjPinNO/UARaJRkrzwRzWH
	/Fa0ch9WlTfzylk3whd2W3Q=
X-Google-Smtp-Source: AGHT+IEnbgw6xnf5zyl51NyFAOj2i06X3LCEJ+TBAZYsRx2VDs7CDSxWVKZovfhpV5CdD1g/PlM5BA==
X-Received: by 2002:a05:6a20:914e:b0:1dc:790e:3bd0 with SMTP id adf61e73a8af0-1e09e420895mr26262282637.15.1732635171664;
        Tue, 26 Nov 2024 07:32:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724dea69e96sm8482541b3a.73.2024.11.26.07.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 07:32:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5500eecd-2dd9-46cc-a7d8-dfd004cd00a8@roeck-us.net>
Date: Tue, 26 Nov 2024 07:32:48 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rti: Fix off-by-one in heartbeat recovery
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Judith Mendez <jm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <t-kristo@ti.com>
References: <20241126073646.126752-1-alexander.sverdlin@siemens.com>
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
In-Reply-To: <20241126073646.126752-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/24 23:36, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> According to AM62x TRM WDT period is (RTIDWDPRLD + 1) * (2^13) / RTICLK1,
> Fix the heartbeat recovery. In practice this doesn't affect rounded
> heatbeat in seconds, but it does correct 4% of error in milliseconds,
> for, say, default 60s heartbeat. This affects last_ping calculation.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/rti_wdt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 563d842014dfb..0416e54b17edb 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -273,7 +273,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>   
>   		set_bit(WDOG_HW_RUNNING, &wdd->status);
>   		time_left_ms = rti_wdt_get_timeleft_ms(wdd);
> -		heartbeat_ms = readl(wdt->base + RTIDWDPRLD);
> +		/* AM62x TRM: texp = (RTIDWDPRLD + 1) * (2^13) / RTICLK1 */
> +		heartbeat_ms = readl(wdt->base + RTIDWDPRLD) + 1;
>   		heartbeat_ms <<= WDT_PRELOAD_SHIFT;
>   		heartbeat_ms *= 1000;
>   		do_div(heartbeat_ms, wdt->freq);


