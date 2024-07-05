Return-Path: <linux-watchdog+bounces-1315-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C787B928176
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2024 07:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5D5B1C2186D
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2024 05:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147E61369A8;
	Fri,  5 Jul 2024 05:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5HGakLx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF373445;
	Fri,  5 Jul 2024 05:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158001; cv=none; b=j49Qf8lHw/Lmvtxw8VmSxfSMdtaehnniXS3gyXw6HtMchaeRRxiB4JplEhBrqYASv7Ow3o/so3nyTEUNPQncKOPGd2p2OXc3aI0NH6kv6sjoORDEAk7qOFekdkFC4wHgPhlbuA4LBVtjxq7XpG7d6Un3rVytVxYChGy+GYweZEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158001; c=relaxed/simple;
	bh=XDnv6DEu13jsGb709vZS+vUyzmjSVOaczBcXnOSYvo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+lVr81fccqZFV6Uo2a4vw9W+l4EfW+PR9WiyFGvYRn/0PDn9h8j4PUIO2PAmKsfUEr09JtXqs4vVIww1dbz78TuXt5GpyXk8Zfz3lpStEqYnRhsvSHXNSSTSRK+rUwjsFZP+NFK90IyrSSMuItYgmiDa24tF1aWbXRdkUmwj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5HGakLx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c980a9fe88so1558015a91.1;
        Thu, 04 Jul 2024 22:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720157999; x=1720762799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ajOat6QGjTsLVU3KHoFvk0jx5iROcl5ZcsIusUCCpis=;
        b=G5HGakLx/NekcSKTt+PWdD577i1/J1Z3/poua2xZ+a5IlDPTwFGMO9UFARG/lM8MIv
         cI/FVVRg2yritIXdrF0cp6mk7tOGtEle1afKDvtsS6hNYGUePHkv3G02zSgKiuLijccx
         XC0A0IUo5CATz7kgZ61iI+nhyvSKgq5VVXdgqwDVqEK2v5OlXpL5mSEUVWzu4FQsKNW0
         eB2BYmK7DxskvnNY8QS3/cM79hH8wndGFEZ6Y+D6dCqB885b+G53SPgWyjvvdZzVX/bH
         HXsnootbDn4Aqxb1KSGO976KkuRqH6P7qBN+1ySYtvhmRI93zvbm/g0ACwFAWXxm4wJI
         fspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720157999; x=1720762799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajOat6QGjTsLVU3KHoFvk0jx5iROcl5ZcsIusUCCpis=;
        b=uRdeuWLb6mw08PPuiyeKY0Yn1D9HHoYhpa4sqNOxz63O2mK+yENMS9nzHGrhPpX0yU
         MbqyWngS6rAV5/EYodmbf4R+q1vUE0+mlONbs/khTqLmQdd4FIZjEbov/tyulo9ltaP1
         AGxRN3AVKtpheAsBJ36R7PI4d1p+EI5KYcK2F4LqR73/2z6B4RHlKMCpTpRiiU7VoY0k
         FGluEd00sNRGeQ/KBTFc0l7K4PDg0tgJH9YbRWNG8F58Q/fMdKDoZdLr+ajIE2T0WrLM
         jQWXC+UVRxHxr1AxW1hoAnhK2GVVap+XN9V1fHPuO4uV+QMsrNHKiw4/0nh5Mu/+/1X4
         nMcw==
X-Forwarded-Encrypted: i=1; AJvYcCUasiqqDTq5+lYOHO9d+EnT1EU0XsmbjWb89G5jH9z8JzGXDfV+jnJhNdYAYfNG57FmVeYM6EoTuTgircK/Eo9H/wJOJ6Nfwz+ZLVhoyTbFTxl//X1RNXTLUx03UMveqpANOHTO6RCCeoES+v8=
X-Gm-Message-State: AOJu0YwY0DLqOrXrMFH7lNGMOZ3v16XdnpgQNOYSBQELQp/42eq8D6YM
	4swxK9CFb7SwrHFHENSb0pHDBTIQbF60XPvIfJmorL5R4Dn7amsV
X-Google-Smtp-Source: AGHT+IHKy1iMEDCirIlx5BdFtRSmg8NHJJvGB/p795CohosHVH7k1z1f9OYsxfD7I2WmCaao38EOVA==
X-Received: by 2002:a17:90a:9c9:b0:2c8:4b95:465d with SMTP id 98e67ed59e1d1-2c99f352619mr5196698a91.11.1720157998420;
        Thu, 04 Jul 2024 22:39:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aa3196csm2488948a91.57.2024.07.04.22.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:39:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1f19f7a4-86db-4d49-b121-e8d38baa74cd@roeck-us.net>
Date: Thu, 4 Jul 2024 22:39:54 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx7ulp_wdt: keep already running watchdog
 enabled
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20240703111603.1096424-1-s.hauer@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240703111603.1096424-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/24 04:16, Sascha Hauer wrote:
> When the bootloader enabled the watchdog before Kernel started then
> keep it enabled during initialization. Otherwise the time between
> the watchdog probing and the userspace taking over the watchdog
> won't be covered by the watchdog. When keeping the watchdog enabled
> inform the Kernel about this by setting the WDOG_HW_RUNNING so that
> the periodic watchdog feeder is started when desired.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/imx7ulp_wdt.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index b21d7a74a42df..94914a22daff7 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -290,6 +290,11 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout
>   	if (wdt->ext_reset)
>   		val |= WDOG_CS_INT_EN;
>   
> +	if (readl(wdt->base + WDOG_CS) & WDOG_CS_EN) {
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> +		val |= WDOG_CS_EN;
> +	}
> +
>   	do {
>   		ret = _imx7ulp_wdt_init(wdt, timeout, val);
>   		toval = readl(wdt->base + WDOG_TOVAL);


