Return-Path: <linux-watchdog+bounces-3964-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD57B1AD37
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 06:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF90818A27E1
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 04:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6177B20CCCA;
	Tue,  5 Aug 2025 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMeJPmLU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A41201269;
	Tue,  5 Aug 2025 04:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369237; cv=none; b=ffhABAUEoQ0UlOoPKjNiiZ6ET3AUtV0jCemP8BvIbWvZSSSiwHuCLzWAQ/Z9xAZik8IuPUxI9O2JbTCbucGlNp8yPXeEMxfGETFX+zLWxxamVWmFB2o27yxX6MVsJRN89sdKCC9NprPt4YvI/Oz5chHv0Y1gTXopyhgBs208Y/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369237; c=relaxed/simple;
	bh=5EyV9W1p+eRAF32BWJq+rGR0/9SRgu9cQOc+UTlyHMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eA2lOZ9hg684LfDguRQ1G5cJltneur7bH8H+JO1c8JIXl1ZtmyZgu8kHB1nqKVm8ZMRJOOsrV1ST+hi56Ytj1KrBEp8ihLiaDyjeoUJmnm6FpSYpkitBiqwtxtqq7HgSnPR5605dOUc4B3hIVjVtSzRE0SY8FHwrVPgzxCV+WO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMeJPmLU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24099fade34so41562045ad.0;
        Mon, 04 Aug 2025 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754369235; x=1754974035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iXPfazU7cIbMUIyerGOFfz8XN/djYB2vzUoaHbctEVo=;
        b=CMeJPmLUHVO228kitWjZJzG2rMe0hJolUNrAQpn//kNPSx4yUTZa3bZ/TSMzI1fhLe
         de+KDyUwsj3S7+yZsS2oqYOB7RyCvg2bPWrxRtGQ8SCTQ6cZucKByPWZgMOPmWLLzTnK
         QuBoiFPMJgE57v274AcMUKxIlsqYp+oUZcsp8gfMURAyWW4pLXPiv1Ill3Zb5gV5oWYS
         FiO7RzTZGiineP835E7ug0Yvtez2s/bQ8UpRX6Rq1RdKN//l9+ajdW1T54xRKNl2iUWS
         6stcg7YRR7Mlz0e71ISssNaOOi7IIQtphVNhPRuxXRs+o+k/q9uvRH+akBLo0FDahYCP
         Zl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369235; x=1754974035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXPfazU7cIbMUIyerGOFfz8XN/djYB2vzUoaHbctEVo=;
        b=WeyZNGX7vb2/tcGMs/UOhzXkadOVpvX2JPgVBQEwnGejqJHHzIOYkkUuNwPx6oVVqQ
         QGwIBMwE23HkYLKgKYuJvG82D/abRVXxrnNUP+KrpOIXm9o+Osrf/bQ0nm65ASHUetgm
         gdoC3kqo8/Xz6doahGFkEq7Ab3w4QVf+GC5d+MuTtVQYxV93THAmkcvDoTtNoTVFdGA6
         5gbV9wZ3t4iAqpKyCqVdWk3pVwVhvsHfRTI/ccs4VJhBI31TTqvnFScKHqFjeRHk3GwL
         9I4UkQxdM8f1ZNLTXK+Bzmgtsx7uzNd9uCVlxUrhatzqcHoY1aQIhs+DiHfkehuVFXua
         ilsg==
X-Forwarded-Encrypted: i=1; AJvYcCUN410R6KecvPLk6YPwA6uvrms7yKrPsS0vwI7lTJBWYRyd7PEcI6YDzalLHi0AKjg4KKsbE8z6XRkf/5YRpJM=@vger.kernel.org, AJvYcCWCCqGUvFPOGOVccFnKH1ovWCitgSD1wF+fzJwwtn8UxUsTbEFdtcgDetGKauKZx3Bdy4zvlJegWLic1+U5jyOc+E4=@vger.kernel.org, AJvYcCXr/o+j78nEfe2TEtGAtVHRvK+6fnHlx/RPdg2+Rdk4Wqz8rcItUBjjNmrTjvlZxuSNCOukOEOtzSC6aPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzARhyeabY+vMq3bV+ifBjmBpa4Vu8A+TuHZm/rw/DXED/pp4Nx
	J1u13OL2miIJS2UoVVAsu6dYIFMu5KC4MdIcAIxaEgWPbwkcfO+9CRnc
X-Gm-Gg: ASbGnctS45OoqewhJYwoEZkPiDjNskhCmW30TvV7hEPRkn+wzUIZ7Zlb7d5O76c1ZOl
	jwIJHGOw02FmedtzJ9MbrPMbDJPtC+5GBYxGOAPfNftLjw2qDi2ZQsvril0U4UMVa6ytI19mH2+
	SMHUPjLpcUHfqfTsVEOO8wFuNkBHhQDmqqIcKOjBHz6p29CYFDdg+vhdfUkV3XczKJ4Jyzlwf+Y
	Ock1WjMzsihHCTn7VhSBmuO67xSQH10AAlc5nP5YP/58AgOV4aj2LK162Ecb8gzrugAG+LDQmR2
	gUR4QeiR2XSNNKkmusuYPp2JuCgni1HFsrOkUT2hc4ozRMW8vK/K20HJ/rHWLV87O/QgqMrN1Vs
	/8892ZFQhae9YBbziptAUSDMs4ECnX5HHiv0/C5y2MdByxXe4hFOVftRFcWwot85kluVE2S7cXG
	u4ItsiWw==
X-Google-Smtp-Source: AGHT+IFRmiQ7ZlIJtTOEEwOYYDOIvHRJnWLaM4H23tvUN6aEoH8QKnC0VXtgR0x8R9QnCygL2zeloQ==
X-Received: by 2002:a17:903:187:b0:236:9726:7264 with SMTP id d9443c01a7336-24246f3ecf0mr201885345ad.5.1754369234567;
        Mon, 04 Aug 2025 21:47:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaadadsm123348155ad.156.2025.08.04.21.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 21:47:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
Date: Mon, 4 Aug 2025 21:47:12 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: sw617.shin@samsung.com, 'Sam Protsenko' <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
 khwan.seo@samsung.com, dongil01.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com>
 <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/25 21:22, sw617.shin@samsung.com wrote:
> On Saturday, August 2, 2025 at 1:12 PM Sam Protsenko <semen.protsenko@linaro.org> wrote:
> 
>> How about something like this instead?
>>
>> 8<--------------------------------------------------------------------->8
>> static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq) {
>>      const u64 div_max = (S3C2410_WTCON_PRESCALE_MAX + 1) *
>>                  S3C2410_WTCON_MAXDIV; /* 32768 */
>>      const u64 n_max = S3C2410_WTCNT_MAXCNT * div_max;
>>      u64 t_max = n_max / freq;
>>
>>      if (t_max > UINT_MAX)
>>          t_max = UINT_MAX;
>>
>>      return (unsigned int)t_max;
>> }
>> 8<--------------------------------------------------------------------->8
>>
>> This implementation's result:
>>    - is never greater than real timeout, as it loses the decimal part after
>> integer division in t_max
>>    - much closer to the real timeout value, as it benefits from very big
>> n_max in the numerator (this is the main trick here)
>>    - prepared for using 32-bit max counter value in your next patch, as it
>> uses u64 type for calculations
>>
>> For example, at the clock frequency of 33 kHz:
>>    - real timeout is: 65074.269 sec
>>    - old function returns: 65535 sec
>>    - your function returns: 32767 sec
>>    - the suggested function returns: 65074 sec
> 
> Thank you for your feedback.
> I'll make the code changes as follows in the next patch set:
> 
> static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
>   {
>          const unsigned long freq = s3c2410wdt_get_freq(wdt);
> +       const u64 div_max = (S3C2410_WTCON_PRESCALE_MAX + 1) *
> +                       S3C2410_WTCON_MAXDIV;
> +       const u64 n_max = S3C2410_WTCNT_MAXCNT * div_max;

Not sure if splitting this expression adds any value. Why not just the following ?

const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
                    S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;

Or just use a define ?

> +       u64 t_max = n_max / freq;
> 

Make sure this compiles on 32-bit builds.

> -       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
> -                                      / S3C2410_WTCON_MAXDIV);
> +       if (t_max > UINT_MAX)
> +               t_max = UINT_MAX;
> +
> +       return (unsigned int)t_max;

I am quite sure that this typecast is unnecessary.

Guenter


