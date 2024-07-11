Return-Path: <linux-watchdog+bounces-1362-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D114492F257
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 00:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88270282239
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 22:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC2216D4E8;
	Thu, 11 Jul 2024 22:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwQ7NHDj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386A01A01B3;
	Thu, 11 Jul 2024 22:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720738557; cv=none; b=mDDrJHC41GY2iiUoIo1v2lp3R9bKeeU0TtqAo/j/AzZp6DMawNLZ+gbUpSHmCxZfdhr0W0ChMywnf7fwOOloUSV/tRTgWXdfejAC1ypa1axYEHef/9yRL8sfDHRSlK6LYnmJ29l18UpkucM18vxwrSFgNBLcmO+/JQLgluIKBk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720738557; c=relaxed/simple;
	bh=Mo+9VEhaKXrJvyIIl0Tyru4MXCNFIaHePIM31J/9U0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4e+zRfp/TVXiUgcMT/bCXHqMqhRCTfDwH12Z9StKlQj8nZPeXy9jEq28t/hq7XPHYiv8/wc9o62DVYmpBoOkjoBLELqb/vyPW2AJqQ7MENVSmssRpJ7GV6LOaXWteVkxj2rgd+iV8tZpZo8eL0jbg2/ZpGohBOndsyVuhUxp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwQ7NHDj; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso920283a12.2;
        Thu, 11 Jul 2024 15:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720738555; x=1721343355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x1loahMMaLspFbuMb9Cc5mUjzYYmly045uRUWyjnZF4=;
        b=YwQ7NHDj8XqsCHVKiMUgVK9nVF97EMVeFmdJs4onevpbaIob7aKD3MQleUdhdZU96Y
         eeLqTb06mKr3etUlgA798XR4Pnxg13ofLARRt+w53pipPYtTgH8CnZXSfjhmxBVTeruD
         46mA6TMuj1OuEcICjoB1ZhDD1AvdLySZMTb8zCFI7EUpuP7z+qHzw0EdfUhPClRRYnJ/
         s8HAyUCU1BH1NtC4FLzzIHDJQ4zrdsqFYIti71JmzHyA1q7oQa0CH/UavhgaWEbXQqvg
         4p6BbOJ8ohmajKnP5+ixET1rkRUa2mBU9ib4KeKI5xdY7rjJF6k/hXsyBbDBj5iQ+oEr
         xZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720738555; x=1721343355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1loahMMaLspFbuMb9Cc5mUjzYYmly045uRUWyjnZF4=;
        b=Pg6vMfmQtftPV8Ok1vxr/8YUJlLDEl6F5Z4IqadI5WvkUXnxL7UGgz3eThJ6WNrNwb
         lvLIdf8lxd3lWjTTJap/w/BGPdMFM+SeL47VpzaIjlRvxTQgCJpLUelCL2JYl7S6LwlP
         9A7QwOrcleSgyi7T1J7DbYKNh+IDPEsGLgdO1pMoCHLBybgIaRSEff+vqvqh5Zzwk3Ze
         gIvAAtWFtywNiMYJvTLYcaYnZzJTEkFzmasiScqph4P9dY0OWfq5aBOL37JFXR91vwj5
         Fdkhe7qYKsuX1sIOx/na99LzwGRKt304hH4bs6DMJtF0HCyfostnXXVHMyIXwHW6b7Wj
         KL1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9hTPX3EgoZV8hXaMoYmxuFr2OBq5HUDcFgp1vM/rrMXSqB3mOvEQn7FpO7TM0IzAdNGwWAs76LXLjlKkCYSLpL7I2L0Bh5DcvcTwW
X-Gm-Message-State: AOJu0YwLYvIp0VEteCLWCpRo7QgdW4Ix1Y7mQ2ZRZRMvzMZeZ21pYi60
	t2oW02Oh2JxeNe/sjkRavkfHjJgGRrPILW/qijIN/Z+t1r3qxe/yC9JzYA==
X-Google-Smtp-Source: AGHT+IF57L9AfWCFlz5+WKrBNpRQgZ7R67SvXjq5FRE1JaWog8Xvos9BThKvid6JhRrNn1G2WUy0LA==
X-Received: by 2002:a05:6a21:999d:b0:1c2:a0b2:e69 with SMTP id adf61e73a8af0-1c2a0b2110bmr9714462637.33.1720738555305;
        Thu, 11 Jul 2024 15:55:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4396788csm6218064b3a.134.2024.07.11.15.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 15:55:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <696425a1-8e71-464f-9fe7-b965452b9d84@roeck-us.net>
Date: Thu, 11 Jul 2024 15:55:52 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: imx7ulp_wdt: needn't wait 2.5 clocks after
 RCS is done for iMX93
To: Frank Li <Frank.Li@nxp.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ye Li <ye.li@nxp.com>, Alice Guo <alice.guo@nxp.com>
References: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
 <20240711-wdt-v1-2-8955a9e05ba0@nxp.com>
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
In-Reply-To: <20240711-wdt-v1-2-8955a9e05ba0@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/11/24 15:41, Frank Li wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So set
> post_rcs_wait to false for "fsl,imx93-wdt".
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 904b9f1873856..3a75a6f98f8f0 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -405,7 +405,6 @@ static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
>   static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>   	.prescaler_enable = true,
>   	.wdog_clock_rate = 125,
> -	.post_rcs_wait = true,
>   };
>   
>   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> 
Introducing that flag in the previous patch just to remove it here doesn't
make sense to me, sorry.

What the two changes do together is to disable post_rcs_wait for iMX93.
That is a single logical change, and it can and should be done in a
single patch. If you do that by moving the flag into imx_wdt_hw_feature
or by adding another of_device_is_compatible() is your call.

Guenter


