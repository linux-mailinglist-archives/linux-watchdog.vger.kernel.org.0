Return-Path: <linux-watchdog+bounces-1345-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926892C4BC
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 22:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B4EC1C209F2
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 20:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6EE185616;
	Tue,  9 Jul 2024 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHQ4U0PY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2E4D8D0;
	Tue,  9 Jul 2024 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557582; cv=none; b=FXU3WkRlpOR2sampQzr+Nhe4Mcn7UTt6Z66KsyU0h8Vz/CK1eT5jd+m9htFMe4XiaVFK283Z5ZEHwYqg+UB3RRhD/vQfiWg+QYvCt7/uMuZgtl7hxY4E8pboud9pp1XXPeBsLCcmz0zgT8pEp4KjAaP6/hpS3NScuq/z2DqyxW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557582; c=relaxed/simple;
	bh=YbCxAjskhurlcicAtE80JEhsIcHZM51dDjUAVverLJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUB47xNxuTgdXDc/kr7D4rfCLkk8Kd8QgGu5wJdt+K6Gc2qXjLbXuh7qlhasZ2g7K6GQgVb0nyO4FShypgsH5Gz25qoOjcypMJwr2jH7pRKoKkaDvKR0PzevrSsIbt5LdHXlR8P/GnVm0DRqtvJkiiJVewQ981a9oLaKPzR4nVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHQ4U0PY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-707040e3018so3701422a12.1;
        Tue, 09 Jul 2024 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720557580; x=1721162380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wMH6/S1GWgPWYsGUnLymDYXj/scYO5GZHQIPqO4DPcA=;
        b=jHQ4U0PYOcvRUYApAXjr4rTuOmxoeg+xLJScEkvCsxgH81g2ob4ydUuT8frGVNFwKo
         DNzT/ANFMSpkNeQWhC5LYT8ioDvSmDcCQ9r4V5DC7RK62/0O9xSfYAktdiFDuCxyF4Xp
         fZvqlZ4+0hNXksG3a+84XySiwux0NKvRJzIcb0AFFwf8W0ME/rbd3tV0URV4V89upRqK
         ZrSE7Bfx5i24a8adQ2jDwt8HPo0+CAUBX9TupB72FlpDvopk6YFP5xBs76KDoCo0UphV
         Yxy9vf73mA/UH8+sFSaAWMy6GiigqECxqpGGDOyYmaFAslswbfUFBiYimz2hNFt1b7to
         1avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720557580; x=1721162380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMH6/S1GWgPWYsGUnLymDYXj/scYO5GZHQIPqO4DPcA=;
        b=mL8BUampkgMZzL4JLP5lYGUFraS+5I4cIuaVok5GD8AGQeDfeLW3trljhX+7ryKq1Y
         7CvksF7Ffybb16Ghkab/ZD4Nopvug1utRka/OuY3SU0Ql+UGD+jeRENcRvWhF33KpoEf
         uF7d8p9/hj3pLarXrMDGQ+4RANySYwaftVDXQ67wpVs5bJByReM2RkO8XFFrcQUvyeDU
         ocueeOJ7sQGopTdQJyMLLKfeCROHL7Koe2dozmoHABK05827zNKMREdJxPZvBvq/bIhm
         lP9xxnbrd7MzAdCA9mKuf1IeMN8bfSdpuPjknugJv/1BS5EeUoSuPTUbUMbSI072YHpl
         zjcw==
X-Forwarded-Encrypted: i=1; AJvYcCXfSavdBvPbsa/cVUvvX4vVu5jnVT5VqmZkeYc7Yq6uy3m8Pc6HscxvNo9dK3CQqZYlIZ0jCpnYICwVL8r2XMY/1RRqV8C7JyU8LXoPrAKnSvDrwN6rEVfAL8J2it/04wAYmC0lWd3Y5Q==
X-Gm-Message-State: AOJu0YwjvMGNjPmGBNGB/Paq8whAtW7v+HE+F6+V3Oee8jTH8K5Ng3q5
	figQFctaHYKdZyrcOUT7R1kcS7ZPH2waE5ovno1yk1+JNwatluSY
X-Google-Smtp-Source: AGHT+IGizthEMSDEjLzAHTrQDE9K9NMFEz/9caa6UdyKuB1Wtrs1wlyjmz6VYvkoeu9Bu6PNg0CYYA==
X-Received: by 2002:a05:6a20:3ba7:b0:1bd:2894:4015 with SMTP id adf61e73a8af0-1c2984c85b3mr3203199637.50.1720557579575;
        Tue, 09 Jul 2024 13:39:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6923459sm20494135ad.0.2024.07.09.13.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 13:39:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d0c929f3-d62f-466f-bd44-41842af7bd33@roeck-us.net>
Date: Tue, 9 Jul 2024 13:39:36 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: add support for Amlogic A4
 SoCs
To: xianwei.zhao@amlogic.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Huqiang Qin <huqiang.qin@amlogic.com>
References: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
 <20240709-a4-a5_watchdog-v1-1-2ae852e05ec2@amlogic.com>
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
In-Reply-To: <20240709-a4-a5_watchdog-v1-1-2ae852e05ec2@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/24 01:48, Xianwei Zhao via B4 Relay wrote:
> From: Huqiang Qin <huqiang.qin@amlogic.com>
> 
> Update dt-binding document for watchdog of Amlogic A4 SoCs.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> index 69845ec32e81..d0eff1ea52b4 100644
> --- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> @@ -21,6 +21,7 @@ properties:
>             - amlogic,t7-wdt
>         - items:
>             - enum:
> +              - amlogic,a4-wdt
>                 - amlogic,c3-wdt
>                 - amlogic,s4-wdt
>             - const: amlogic,t7-wdt
> 


