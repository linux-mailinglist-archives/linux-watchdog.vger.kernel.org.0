Return-Path: <linux-watchdog+bounces-2800-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC8A21F92
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 15:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EB003A2496
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 14:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6DFAD51;
	Wed, 29 Jan 2025 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhzNL2L4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF942033A;
	Wed, 29 Jan 2025 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162089; cv=none; b=mRENXwRUutqq/OXxeM6cTMmSz42o0shgTg+v3uQyTfW1ptnLP61XgIMc5f0BKqYKcvIhPgZ+//qcZUgb96VfmXqpy7UEyegYiR9dR/yqHxjm1ypIeWc0X4HqPSWdzJ6VUSUzcWxjVqFHkvQsVKzX5+t4wxTRrJV5uml6lTYLmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162089; c=relaxed/simple;
	bh=zf1iNrFl7lo6jxE4yxXErxMxFRokwIekPR/v6sGOJzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkdgG3dSB15NDwA/wh7IMVLcYGuomtHXrm7r1ZhaxadyRuPK+3nGzy9Wj47McO/y8Q2xw2dKJuYisdLkcSc5yZaGRFplBYIVma6QsmUW71SfSrHabYaRWOlHQ0y3InPZGKHHOGMEbJ8Jg6XKe9P1rG+cclu4vtvv4eZkd6KmD7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhzNL2L4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2165448243fso10171415ad.1;
        Wed, 29 Jan 2025 06:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738162087; x=1738766887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn73dDm1IgOb+09czxsAhVAWIkGMPx2d9kCIkGzUY1k=;
        b=hhzNL2L4yrgMKTN8ZsuoaE0EQYSsGFSNtiEzrx909TacJhcsw+mK3cb8bXebvrqmV2
         YMPtDpSGkA0J26/oSJ+JHNnkgQDjcJcBAaQE67SdiX4HtOfw4FdJ6zlUJHqJ9zYMGR/L
         hTtKlOuA6yKuE9iYI3uiM/czpZASsf6N7Tb+SHdEtnWHzCTpQ2gOHtYmxIhPFbStKOFS
         NNPTtIT4EZR4Ud4Ia1LDxjLibQs5jBKm5R+Wb3Fc8T/wjKm0aZeFAi25QBKsR3xtMit2
         Hlq6cxwX5M68QY78nDFFX3T3rS/8mkynBAhylxcA0UqojTgG7sFmZ2B25nceC0fNnHKi
         uDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162087; x=1738766887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xn73dDm1IgOb+09czxsAhVAWIkGMPx2d9kCIkGzUY1k=;
        b=NEzusbglRbxdI7jGfdL/FX5TLSII50x4Zo5mXgIYmQFIZ8oh5pY2rvL2xfZUSqYgNT
         KMyW67/eaTAEinRonIa50TFBRGTuyIyFnfzXmjrnHfqqCdJJIRR5Piv09+Am7yHuK1em
         hrjq7g7J4vvqsvqttDDFL9bF8je3qS0e6kd76eAszrdIy9RC6Z/8EDFD4GjtXoIYMJxE
         IOuKojuscZCEoXHAI32KmmMFzKh+OwS2aC0EpEafcLQfqM7Dlq1G7WQTC7Vh3NJo6Fwi
         HkRKtdK0efIS1Gt9P8HtB8/NQTf33AfHeT4ldFbLzOC/UGsBDQYRv6JSgBEmqYKWwt+R
         bIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx32bTcly1CDbZ4HBRavPECYrfnU/yL78AiqwzxW3S4QcviDEzuIq6+vRpfs22M5JTN06OPt5T0zE1bd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDqJBrfWb2n9mM8HPVkKeZ/bTd7zlu30qD3Qy6StaX5xfOLLG
	I8JX+P72elbhjFSs7gGySOg2XkOXz7d4c1Rmv1HeRdh00938kvUY
X-Gm-Gg: ASbGncvDifP+TTzm8mRVDcRo/0lAcB74adz4xG42bJgPNoEHeptdk2dBD8W6UA01ilZ
	6KcFUbS8R1U2f7UxYmc+UDPvx4UIVT2Tffnxbxwe+LxGzPvxhU/JS3EpQsE34cXT/IpaKqOicIe
	y6wOmfHeKHDo4GH4mZLavURjVy/98E8HJ5YakiJsqC94JIZIVodMjpjJ15Cp/X8pREmHUjKOyQg
	b//GT2D5WwDzU4mUJpkgaeteT21WL3M2zRIw9ezae3eEwDjY8GcXNJNOTLnwSBW2k2r1T/nkTW/
	FxQgv7G7goQ4lhzdEMorTHUYpAG50FuTsH0aFbsCnpnKUkDPZjZTGH8q+5ViPyCp
X-Google-Smtp-Source: AGHT+IFjdiXdL16A3+waHiaZcYyN+iFMZhAzasogsB5ZkmD8MMmJbR+OsHGReCPwasmYt4JBG6LgkA==
X-Received: by 2002:a17:903:188:b0:21d:dfae:300c with SMTP id d9443c01a7336-21ddfae34camr6066465ad.3.1738162087055;
        Wed, 29 Jan 2025 06:48:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414edb3sm100088235ad.202.2025.01.29.06.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:48:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <56d8a231-3af7-4e12-a08b-f7faa549c96a@roeck-us.net>
Date: Wed, 29 Jan 2025 06:48:04 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: da9052_wdt: respect TWDMIN
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@combitech.com>
References: <20250129-da9052-v1-1-aa0dfc2ad595@gmail.com>
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
In-Reply-To: <20250129-da9052-v1-1-aa0dfc2ad595@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/25 01:24, Marcus Folkesson wrote:
> From: Marcus Folkesson <marcus.folkesson@combitech.com>
> 
> We have to wait at least the minimium time for the watchdog window
> (TWDMIN) before writings to the wdt register after the
> watchdog is activated.
> Otherwise the chip will assert TWD_ERROR and power down to reset mode.
> 

This is missing a key explanation:

Why does setting @min_hw_heartbeat_ms in struct watchdog_device
not work for this driver ?

Guenter

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> The current implementation does not respect the time window for all
> cases not it handle when the jiffie wrap around.
> E.g. setting a new timeout and immediately perform a 'ping' causes the
> chip to assert TWD_ERROR.
> ---
>   drivers/watchdog/da9052_wdt.c | 33 +++++++++++++++++++++++----------
>   1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
> index 77039f2f0be54273df1666fe40c413b6c89285a1..5ca957a6c2219d99cb3e653205e3f556f7cfb56f 100644
> --- a/drivers/watchdog/da9052_wdt.c
> +++ b/drivers/watchdog/da9052_wdt.c
> @@ -45,6 +45,21 @@ static const struct {
>   	{ 7, 131 },
>   };
>   
> +static void da9052_wdt_wait_for_twdmin(struct watchdog_device *wdt_dev)
> +{
> +	struct da9052_wdt_data *driver_data = watchdog_get_drvdata(wdt_dev);
> +	unsigned long msecs, twdmin, jnow = jiffies;
> +
> +	/*
> +	 * The host must wait at least TWDMIN ms between writings to the watchdog
> +	 * register or the DA9052 will assert TWD_ERROR and power down to RESET mode.
> +	 */
> +	twdmin  = driver_data->jpast + msecs_to_jiffies(DA9052_TWDMIN);
> +	if (time_before(jnow, twdmin)) {
> +		msecs = jiffies_to_msecs(twdmin - jnow);
> +		mdelay(msecs);
> +	}
> +}
>   
>   static int da9052_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   				  unsigned int timeout)
> @@ -53,6 +68,7 @@ static int da9052_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   	struct da9052 *da9052 = driver_data->da9052;
>   	int ret, i;
>   
> +	da9052_wdt_wait_for_twdmin(wdt_dev);
>   	/*
>   	 * Disable the Watchdog timer before setting
>   	 * new time out.
> @@ -89,8 +105,8 @@ static int da9052_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   		}
>   
>   		wdt_dev->timeout = timeout;
> -		driver_data->jpast = jiffies;
>   	}
> +	driver_data->jpast = jiffies;
>   
>   	return 0;
>   }
> @@ -109,16 +125,9 @@ static int da9052_wdt_ping(struct watchdog_device *wdt_dev)
>   {
>   	struct da9052_wdt_data *driver_data = watchdog_get_drvdata(wdt_dev);
>   	struct da9052 *da9052 = driver_data->da9052;
> -	unsigned long msec, jnow = jiffies;
>   	int ret;
>   
> -	/*
> -	 * We have a minimum time for watchdog window called TWDMIN. A write
> -	 * to the watchdog before this elapsed time should cause an error.
> -	 */
> -	msec = (jnow - driver_data->jpast) * 1000/HZ;
> -	if (msec < DA9052_TWDMIN)
> -		mdelay(msec);
> +	da9052_wdt_wait_for_twdmin(wdt_dev);
>   
>   	/* Reset the watchdog timer */
>   	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
> @@ -130,8 +139,11 @@ static int da9052_wdt_ping(struct watchdog_device *wdt_dev)
>   	 * FIXME: Reset the watchdog core, in general PMIC
>   	 * is supposed to do this
>   	 */
> -	return da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
> +	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
>   				 DA9052_CONTROLD_WATCHDOG, 0 << 7);
> +
> +	driver_data->jpast = jiffies;
> +	return ret;
>   }
>   
>   static const struct watchdog_info da9052_wdt_info = {
> @@ -187,6 +199,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	driver_data->jpast = jiffies;
>   	return devm_watchdog_register_device(dev, &driver_data->wdt);
>   }
>   
> 
> ---
> base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> change-id: 20250129-da9052-661dfbb7de38
> 
> Best regards,


