Return-Path: <linux-watchdog+bounces-3604-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA93ACB20C
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Jun 2025 16:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 072754076F3
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Jun 2025 14:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E5023C4EA;
	Mon,  2 Jun 2025 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0y9cyjr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C8023BD1A;
	Mon,  2 Jun 2025 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873499; cv=none; b=AZPLAyoWNSa3pzmEoWJEWBb4l50hOII+B9AvIKwCiNBe2y/q5cbqtF27mlIoprRQd7TBSHoEZqytwtEqY3/SKXbIRieJVktfLpWh1rG5ARTEPUs5TuMgR4G5imH9gzLnJBHlcXhSxXqqB91+LKHNBvh6BKTiy8R+FysAS0+SGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873499; c=relaxed/simple;
	bh=Oqi/dneJGeyGAoSf6jrH1IEST05UFsco/17naRZEefA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0LrPhrnwLRpMjvwP9+TcndCY5TTaxYJEy6ZXII8P/Rq2Cq+fRUoXx1kMLfBUBqzxB18vXlB3/ASBElZ5s3u8AHF5jQi7TaohhQ25032OaD0ITvcnf6KH6FPqSGncmMgh+izrJ8WFJH3sWehBfklEVIiEI79FAi8b7u1/h5TelU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0y9cyjr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-231e8553248so42062745ad.1;
        Mon, 02 Jun 2025 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748873497; x=1749478297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RQuw7/TJU1j7Z0HT/rwULfCMawLOPYNu/pS+8IoIehM=;
        b=E0y9cyjrFqE5kZOVtO3IbxxEBuWzbKOQVvfXEXPIHyH6jjBL/NSg2EYOR5RU1V/Aea
         MuuRGtTExKuyru9o9vhz89ocmDXdhaVCtOJEm+2sYM8Q3sRMWJJcJZ1763Grk+pCSBRW
         3mNJdd+NHseiAkk3VJRAuSdthpa+/ob9K0Fw+Z83SlTRMWOCX/TbFJwfhpwmBgspjfWR
         U/bBgcVXkKTuuHCOf3KYhGQJhN7d3tw0Jlget6ydRoOXadzW107FIl7GYlcTGrFwzTYn
         P8PJ/UqE0Ap96hoahsB6jCE+WlB5d2fhuvyOeNIrf8blCR3MHuZHCaleu4jncTIfswD3
         Hqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748873497; x=1749478297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQuw7/TJU1j7Z0HT/rwULfCMawLOPYNu/pS+8IoIehM=;
        b=Qj+yCGeNjTiyGGHx7Zd2U0hzceSy6GnhNCvmtzBitIexj9OqocIfPoIW/4P540LEV1
         KlFHuc/ft8KHEcFmunh+GwUk19MiId+ykVSahVqQlarOodTTkJgQJIrUh53FpA6tR9g1
         UGl0CDhdT+C/E8xBTLTFI8muPFi5jTJpmZqAlgbHZqgpFCNSYOwr9R5IhvQyFJhNw0kZ
         HiIoH168NDhmK7CbKLurSkfESSgI7C2JbstGMHccA1dlSfvWGvJmJQ3ldnshqYcMuSOa
         2834oZurEWRTGzeAZx+chREEEEt+6jcqyYJ9YfFFV8aGFqTGXsYa8RJiHZzqY/I4UWKO
         r66w==
X-Forwarded-Encrypted: i=1; AJvYcCWX2Q8DMF8y8tyPKESr9UxwBypW0ynvcLhs3Rl/6suTaiBcwQRRoawm7J0PIO8GhXpww2xZlRk6LtYQx04=@vger.kernel.org, AJvYcCXhgSBZRhNoaWrhbc9eVR4/bCS7yqBXljs22/JC4jXEMYhbP9xmurqHJigyxzfPhbAWkm8f44SHdk/cZKCbbQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeustUTIv2ntk+btT/rZqU/l5/p84oX243C8avWSjwBsnlHMAx
	aOkyDoT+0IekTBBM+BQ+nYBoVQ5UUxE9RTkn+LUuQlHwbIPHzZuzcoPr8dLbqOFo
X-Gm-Gg: ASbGncvfLgjRWVF2xN4FGdDO/VyWP08WgdwtSafvvVAwdLh4vZrD6VgqSvmr98qzHfO
	6PEfto5VVX8g+NN0eFt0qNuAD/G9/ysZFJPBixQUQQoY47seO9zTg9zXDfchuVv1LkpGtREb/fQ
	Ry07j/bjnLoktT+3Oaw1WRHBEiaWLx3/wGmtfB5rGDQ+Eg4DXUXBPLHX5WGkWOGQTc4Ap+kBWwh
	xXhGs3fmEbCEeDVS6AlrxRSN3W5DoPilAqAR6V3TNTz6RdxkDwyPuHmhGZuXYXguJOwzk5EfuRb
	yuPfbhygB+qgKa8rVhGpSKgKXXh+4AftsE0G2m1OOfTCbsvD8eCMbvojUzSfiFfklDvzWt+qGMP
	iLAcclYXxzZwtrgNowwtgOXl/
X-Google-Smtp-Source: AGHT+IFIMpWcEWdbPQ8RhkKRIxsANnzG7tpSbIsv99Ipr+jjFtQBzgn2lOu/+i10qxUsOx6xQeEHQw==
X-Received: by 2002:a17:902:cf10:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-235395c1ae0mr144531795ad.23.1748873497127;
        Mon, 02 Jun 2025 07:11:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21df0sm71361925ad.229.2025.06.02.07.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:11:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e7c1cf7e-b007-49cb-9441-31ecdce3614c@roeck-us.net>
Date: Mon, 2 Jun 2025 07:11:34 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: ziirave_wdt: check record length in
 ziirave_firm_verify()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1748463049.git.dan.carpenter@linaro.org>
 <3b58b453f0faa8b968c90523f52c11908b56c346.1748463049.git.dan.carpenter@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <3b58b453f0faa8b968c90523f52c11908b56c346.1748463049.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/25 13:22, Dan Carpenter wrote:
> The "rec->len" value comes from the firmware.  We generally do
> trust firmware, but it's always better to double check.  If
> the length value is too large it would lead to memory corruption
> when we set "data[i] = ret;"
> 
> Fixes: 217209db0204 ("watchdog: ziirave_wdt: Add support to upload the firmware.")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Guenetr Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/ziirave_wdt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index fcc1ba02e75b..5c6e3fa001d8 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -302,6 +302,9 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
>   		const u16 len = be16_to_cpu(rec->len);
>   		const u32 addr = be32_to_cpu(rec->addr);
>   
> +		if (len > sizeof(data))
> +			return -EINVAL;
> +
>   		if (ziirave_firm_addr_readonly(addr))
>   			continue;
>   


