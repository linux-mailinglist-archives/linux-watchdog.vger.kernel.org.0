Return-Path: <linux-watchdog+bounces-2539-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC39ED31F
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 18:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A269167093
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 17:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD9F24634B;
	Wed, 11 Dec 2024 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llN44uBz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F82A1DDC11;
	Wed, 11 Dec 2024 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733937131; cv=none; b=JLzNaVuZLtmvVaSuXeDr66KuaeDbCenSQkQtrQNA6NWNfBAgOLxcHVjAXN5zboGhEIViuByoKlOOBVTUz1Z+TFUNomkIEJVcIREECF3gh7dQ0mDByxZ6xVsLCgvSbGm8kUTYk/emNgnNKDWiFcRZ6Rmam5Tq1PY1v0HdmwB6xog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733937131; c=relaxed/simple;
	bh=IGipVbStRxY+9NnW6skGplPEKqm1H/qhkNh4NFWdMGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IW48nyI5y0UoRaDnuB3OElCoGsJqAjHoM+6SyAdsJhEmt526QnUCZlp6Qvihw6zMBICFflaV5z9I/WYgnwkUGGJH93+lInrpWxLU3HpE6xlEASU7G58maKMVSh9uZeG7xmdbUzkDekrIS+ovnCraeDNcHs/i0Na80MlMhbwYqTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llN44uBz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163b0c09afso39362775ad.0;
        Wed, 11 Dec 2024 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733937129; x=1734541929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sIXMJ1ZYrC0ZfzeXus7WJ4iSXyvaP59GTvAsdbdQD+Y=;
        b=llN44uBzuPXAP0rSkgZtKv9oT53NFhuF7f3uLr/x/jTDMO+K/rDO8pvnxBniTxWIPi
         llsyEEpAGsTtmfP9sRCS26/c4zxbDirPQ28X2ucwwY2ouoNFA122riearexPyIS+E2bx
         p22mhy524v//O8uln0d1dGBkXTNqiSkNMAZX/cvK16AEqagswn2EW3/ZM+Cz5wR1lA1L
         O5/YtCGj6gISaEpnN4DivrHawYdHFGAe69zoeegrj7/Erv8ESKAiFhywEOGH78MOFjGz
         ld29rC/mN/uNuFr6cHqog+XmgV3tn6QW69RlAoTWmjunuvKCxdghAHf8q0Jb+zTESSGd
         Pg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733937129; x=1734541929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIXMJ1ZYrC0ZfzeXus7WJ4iSXyvaP59GTvAsdbdQD+Y=;
        b=aIplLDl/r9C5fiGL+Otgh/gaZCEeN/t1wy3Y0lR4UDZ6DVJRS2xhid0ubSgeo6FSuh
         ZMiFElJZaWUMLZzc6Y1+uvyHqh6L78Ci4JVSV7IsvRNZ9O7HC4Ojfb1r2S7P5RScYQXg
         Xt00JX4UrIC/gnGRMpwzAeqWXW5BRGQuKAdaKvHB/RNY4BOfu/8aSyNl4UM4izPXNySL
         Z9mxHaTfax1ZM0jc3Ph9BfQKNOPEBi5tYp7+CgMPSPsgMaBPGLgM4MBZTjk0UB4fBZgq
         5FCP+ZAWLn24eidz9qS3tT2icMaVRlGJHG4JAKbNWrMUdTWVKmOhDdW3He4xMnRKvAxz
         aK6A==
X-Forwarded-Encrypted: i=1; AJvYcCWbRiycjPYLhMzBBjD3aH/jU2NVmaTZuR3XIKqdf0joggVp6Cgud0Q4aKYguMDLGQzRqrmq4S842/DWnZw=@vger.kernel.org, AJvYcCXvYzMRLI8W66hnTp66wlkIKfNrUxrNak2VibnA24Lcs8Unmg94+hcDDmk2+g/KlfVV+hxaCTYYyQ80afKwt/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4UOpbc0MAaJVJErwIh/e/O70bs2qzb8XtrusXneBeEXwYVNLs
	JMFpY6e6rj+R+FBSRg3j7Oiz+MXqeBmumpSx69FvuB9dCZtftflk
X-Gm-Gg: ASbGncvqUULwQlopXt84q95qX745TlSVDQbkx74POP1X99MmvVjh2M6Ha60iEEr1wWn
	Na3y7fK302NvcjLRBNb5K+1AYGgtMBoXMPKCWmH/Z3Ya1UNUNjaKQUtX0D9jUI1TQ19U70t7Oxu
	6EpwmkumyHzt7+6ooByp/7/dNAgIi4KZxsfVnlcdaCKZFCDlqCh/frq2xlmS59DAGRwonpUm4Nf
	BmV8zZaOKLrYXfzm5S/pZ1/R/5hPRvdcUx/Pp+HHtY22ysgA4Wu7RoyRYWTw37iN5bgjvcWUk5A
	9h8tiumNR0WMwFMMsumq9Ibw8H8=
X-Google-Smtp-Source: AGHT+IHYT7AOgxnWx/J7njq421pvdT5RVtm7+2GQ8l+rCNO36MOZPhHyAqro6NWj/eR2bXFBKcZViQ==
X-Received: by 2002:a17:902:f78b:b0:216:7cef:99b3 with SMTP id d9443c01a7336-2178af03c54mr7681475ad.52.1733937128927;
        Wed, 11 Dec 2024 09:12:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21779e0f7besm15574125ad.115.2024.12.11.09.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 09:12:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <213073e5-c929-4207-a9a5-13194012cf70@roeck-us.net>
Date: Wed, 11 Dec 2024 09:12:06 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: stm32_iwdg: fix DT backward compatibility
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241211163457.301140-1-clement.legoffic@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/24 08:34, Clément Le Goffic wrote:
> The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> introduces the support for the pre-timeout interrupt.
> 
> The support for this interrupt is optional but the driver mandates the
> interrupts property in the device-tree, breaking the compatibility with
> existing device-trees.
> 
> Use the platform_get_irq_optional() API to comply with existing
> device-trees.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Please consider merging this patch in the v6.13 cycle to avoid breaking
> the compatibility of the existing device-tree.
> 
> drivers/watchdog/stm32_iwdg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index d700e0d49bb95..8ad06b54c5adc 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -286,7 +286,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
>   	if (!wdt->data->has_early_wakeup)
>   		return 0;
> 
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq <= 0)
>   		return 0;
> 
> 
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> --
> 2.34.1
> 


