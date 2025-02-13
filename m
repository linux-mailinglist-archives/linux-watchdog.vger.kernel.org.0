Return-Path: <linux-watchdog+bounces-2924-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC5A33519
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 03:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1041887151
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 02:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9052A1CF;
	Thu, 13 Feb 2025 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjJxcVDi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B7720ED;
	Thu, 13 Feb 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739412227; cv=none; b=a8ZJjhFjRUrBguj7OySpUQBQ/oXuX+uOgpqjJZFnAwZdtA8JS0+Dn8+Nex2q1x2Xvd7n8U+wUxdxl8+KgiuF590m97odFSSnpVXidpHS8jRRWhKr4KUEO1NDFTTO4LaDRmtsAOGXx3AGGaCvue3Ta12mh1pbPrEU9KkMc3HQE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739412227; c=relaxed/simple;
	bh=tvaKS67qfxbYUWq8qedwWouq/TavZ9zbsv4O/ODLopE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCiMB4Un1p6B9pHERnMsBjq9YJcjYGEQ8dHsj6vYbawUXYeYu0ok/bBMdU+K5It3ZdEtgi5O2jJLUFAyg4wiD5nMYWJ6CJAYMO0aOzeN9z6mBG3SAOIcIlEQ2AbJ3JFN9L94Bi30T7nrS/m2gW6tUXGf8hw7QZ7NiLJ8sT0W+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjJxcVDi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220ca204d04so4223075ad.0;
        Wed, 12 Feb 2025 18:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412225; x=1740017025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=okyZjfmjMy5+1Py65oyI36EnaqkWxcyghxWxFA0COdg=;
        b=kjJxcVDi8RI/ep00eQWYUhKHL7jxzJ4sKYDftQBTmpEaDCbkzOk/8kc9QYCf2aBmAu
         KtvW3jMvt8J/bxEs9rTbe8YeMNogXUWqmEzmQA5VNggjNiRdvCD/P/DskBZyT15l1ckJ
         qABm2ptF6lSbQ9gEBng2EsijTjsY4QucLoppTpqlQUDlLyrG5ThzVXTwBEbullCDHGSy
         9jsLk8KnAt3/wp8ZWVK6X4KEaEor/L2PZJfyV4ILA+IXfa5cqzJjR7DLhRBF2nNTGwq6
         CclHbFeqFtFW4iTv3QbzltTIAk3T9+T5rfbipsZXGfV/3GuyDM4AoyeD0tUMOSmFZZ8/
         /3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412225; x=1740017025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okyZjfmjMy5+1Py65oyI36EnaqkWxcyghxWxFA0COdg=;
        b=Ktwivb1C1X2kX+5fvWyWhWU/Jn7sIWoH2IhkA993csj76eGIAAfF8cD5tlVBgmBYD2
         lLK3lodMYS3L60Ne0kRy3b4CHRJIM03DVOuZkH/y7pbqQtRouBaS1AK4oxFerw3z3KAZ
         hsKadIerR9nKednwjsvEho1DORhzzexVhCNlljz//bmpsF7ZkgzRfsQo02gDJNgYvWxz
         Cih3hoRihrA/Lf+mqUPZ69JMjR/MCPRmtl57klL0cHrCC/llRVADnc13FCRG7WAk+4fM
         pqtjeaDRxidLCS+7igRb4JhJKbCDtxOR/SkyOuO9DkPo8BgF954l/pZLpE14YbLfy8yA
         hCJw==
X-Forwarded-Encrypted: i=1; AJvYcCVtn3BvD1Tk9PXX3GDifETV4ZnKdlmgOAk49N0A/w5bM2VQaVeCz5MuxYJUItIfL7hshmq60N25U2eIrGY=@vger.kernel.org, AJvYcCW9BUZyMcsgq3/YCHkzbz0ArGFXQnqUbjzfwC0Bxn2gvBsYKAbyYBLmexyViqv2Fdn4Rh5p1pheRf6npd4200quH6s=@vger.kernel.org, AJvYcCWHYRAJAXszn5Lzt2BLNhqA4tuzJikirWu9uHWWZWINehIgQfeL907GycTNHPCM5jqeI9YityT3hFjf2Pc4VP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaf/aEQUPbSz5DI6jjRgd9dhvRoi+PHqBncImHzXoU4bxVXRTh
	caxlJ96Wtm2y7gwBHcOVVNcwfL7mONP/7F9fsj9t3td8uPOCBDK5
X-Gm-Gg: ASbGncslteKV+YPnSNwlbrHcmMDliCPHod59glaLtLCZ/wvL2l8J9a7BJg8GbEbdB7h
	JeVpx/5tpPpYH92feTRThRTXjqhhs1q3EXk5RRCjCkNBpraZ48hTq1WFdKVGLIsaWLYeRovaP0T
	NzN2xEtqap3XheZpBkuiAtG4ZtTIjjbKMHc6cJXa/8nE6FS+mdp+4TVsEwt2u/4Jcah1Ulkk05Z
	lwQtz0oDl36HORZevj+TGVitijFKO2IUITb9xUwVzMVAM2CTvqInc0xC1Yjb5CpndQ/yJWmyzzx
	TpaF5SUYmJyNcvrR3bEI+L+6FmDTZ+S2dbOIruKlnqwExJ+0p1bl0RKZtF8U6viw
X-Google-Smtp-Source: AGHT+IGnCXoV0wl0FLOAedLGFHQ6pTamijYmiRLBojhQ11nYOL2TnYuItn/7PyOh8H3mIlDAb0Qedw==
X-Received: by 2002:a17:902:e74e:b0:216:760c:3879 with SMTP id d9443c01a7336-220bbc7b79dmr92040105ad.46.1739412223273;
        Wed, 12 Feb 2025 18:03:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349634sm1992385ad.31.2025.02.12.18.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 18:03:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6875f457-1caa-4c0c-99f6-681922a01933@roeck-us.net>
Date: Wed, 12 Feb 2025 18:03:40 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
To: Sangwook Shin <sw617.shin@samsung.com>, krzk@kernel.org,
 alim.akhtar@samsung.com, wim@linux-watchdog.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kyunghwan Seo <khwan.seo@samsung.com>
References: <CGME20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0@epcas2p3.samsung.com>
 <20250213004104.3881711-1-sw617.shin@samsung.com>
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
In-Reply-To: <20250213004104.3881711-1-sw617.shin@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/25 16:41, Sangwook Shin wrote:
> From: Kyunghwan Seo <khwan.seo@samsung.com>
> 
> Fix the PMU register bits for the ExynosAutoV920 SoC.
> This SoC has different bit information compared to its previous
> version, ExynosAutoV9, and we have made the necessary adjustments.
> 
> rst_stat_bit:
>      - ExynosAutoV920 cl0 : 0
>      - ExynosAutoV920 cl1 : 1
> 
> cnt_en_bit:
>      - ExynosAutoV920 cl0 : 8
>      - ExynosAutoV920 cl1 : 8
> 
> Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


