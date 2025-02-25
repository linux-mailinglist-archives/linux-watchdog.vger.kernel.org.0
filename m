Return-Path: <linux-watchdog+bounces-3003-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8077A44089
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 14:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA84444164B
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 13:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F858269803;
	Tue, 25 Feb 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWkh7cpj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A055268FDB;
	Tue, 25 Feb 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489249; cv=none; b=Q1ryTaQ/Y5ct/hPA04oQysfIwlGS6DANebokKWWgeFsFAasTWcrhD67lzjZVaO9nFWz136eE/Ej9fVGNNS+pvJ+1hnmSZGJx/RroVnlcKgxxeL2eSnDmp6TOS1ht4KtifcE4KnksWsXKx5m9Mf5tHJVJ1shNkOgXzH2WI8u/KPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489249; c=relaxed/simple;
	bh=v1iIaERknrbs8eqWlTOb/MgMkMtkVDqJt5teF3ovGX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ni/nOR2w9cufLLaYiKdJInU3yDd263CR5GEZvABJDEqWk5XOmLNV2Edv96WYMGTAFpsgbIw1t9Q4iPkKPJ6V2koB9j1+VCOKZZs/5uIAHrH+xVYJYBBn1IQzMW2llsIRJjtkCU9ZCav4ncn7rC0WNUkdaZVwzkqQW53hLbr3jHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWkh7cpj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-222e8d07dc6so37664805ad.1;
        Tue, 25 Feb 2025 05:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740489247; x=1741094047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sYLcWu+xpfN0lDdZpNbKgmtUozIU0xde+CMOHsFz2oM=;
        b=QWkh7cpjXk9zH33ZTrEVDc7sskl4Epabbf7Lh0AA/204wbWWuIdntPI2Hm6nz4IVLx
         WAQ3eP3+kzj67hCvHsmvoimZWTeFsmJwoseuqjudjyAUHl66yT+cKLY51W3lfZFWdSkK
         cZosshd+vW09EEL7n6w/p60fqk5S1bkv1ongwoPbfxLBwbU2LpKXWaS16BQV8Olqw6Zc
         +kS10e4tFrXuh1ng0iFgn+V+ernPWaCMSLmeL7/v4G1YyB8Y9gozul9d6Da59LmIa9Vb
         PtcMgM+NfD8F7ek4/6ZN32ktLuSaDS2O+lCA+M7COjjmWudndORSahxRdn4EFq2Eg5bk
         y+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740489247; x=1741094047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYLcWu+xpfN0lDdZpNbKgmtUozIU0xde+CMOHsFz2oM=;
        b=YfsParCCH/mg6wwfeXldOn8ZccNOFfZ2gzsMeCTTh5LJVtjsWnW1RhucRsFCFS78Ke
         ho5iH++vJirf4CyLAkQAd0mfGStUG8vkm6yCIniCL3LtH+QGb7ZaRMh8IYbmwx3WewuR
         hFPkhq8x4XQBKJR3tQPWSNDUQgaY9c+9QBgzeYk0SlgkfpAhRlQwI6/Oa/zCeSByiSAW
         kqGKOslHIQD5/Qe9WDQSzuhSuuAbf5Oeq75VHHD1RH3jV4331WuQVLr15XdrfQlJhQZa
         hLTweJFHDtD/r3GKsB7SEMVmqInoh4HEbEZXMpuiQ5Tl9jOjadK9DrfSR8jNyvwkVWtx
         fWYw==
X-Forwarded-Encrypted: i=1; AJvYcCVMC/jEiKPw/7Ev3z9zF/3ueOtXRq+poxzhtjPqAaQ/RBSnb/+PJoqSM8LPoIZ1SgtJicHJARKDFjfgRQED@vger.kernel.org, AJvYcCWsxQNq9gTrODK9zvofZSDZjx+Q+RrT5gbQmrn9ksiKng8GMY9DlA1cF9NwlkoJ8K2Q5lq4NztSieA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPHH/oQR2OuBYEGvZcjNfGS8Qfd3ZSWpCAy1eR9z/lUAKY6hOG
	cJLmxdH6UX0Muidi5WVLBMdU0vFxgaDFanP6vNMsOyFH2TY64hXW
X-Gm-Gg: ASbGncuJqJIYB7Nz824AK/cIGCazUOYKZic4oasLLLvn/4i0wKwMzTgmNLKpLrD9qXd
	SSTUnRk117xycTtKT3pW8HYMBQjPVs21cDFj7pcRvVEdJ9B8nvahsQNTSbpFURJDRKxy/zJnp05
	kM8U++aYFarNF5qrqGODxEwkY2FlBNoSlXBTrjSV8+/YIgyrU/RwgaEn1mSnk9ZEGfeZkK6yRUC
	iOUx1RIxIJbOiZXUDFPeT4sLJfg/Es3UWMjKgBBqsypd0o5xZJzfEkd7lD8u8fNwKnJEkbfSJ5u
	kbFSm4Dvrcj21ELuvrs8VnNrT3d6YzSWb6lWhaKrbQU+XCjDBki10EhFfQ3yGX2Sy3B6uzkkS3M
	=
X-Google-Smtp-Source: AGHT+IF9xSVNNuEnu6Nb7s+MD3IYoAuPzopICChiSlU5gJPgycSfrX2OtQiuNgsgcv93eNwA8suD2w==
X-Received: by 2002:a17:903:32c7:b0:215:5600:18cc with SMTP id d9443c01a7336-221a0010c3amr294829325ad.22.1740489246673;
        Tue, 25 Feb 2025 05:14:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0aec2dsm13697015ad.221.2025.02.25.05.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:14:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3308b190-b639-4aff-a1f8-3ad9761dd991@roeck-us.net>
Date: Tue, 25 Feb 2025 05:14:05 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: watchdog: Add support for panic notifier
 callback
To: George Cherian <george.cherian@marvell.com>, wim@linux-watchdog.org,
 corbet@lwn.net
Cc: linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250225095203.2139482-1-george.cherian@marvell.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250225095203.2139482-1-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/25 01:52, George Cherian wrote:
> Watchdog is not turned off in kernel panic situation.
> In certain systems this might prevent the successful loading
> of kdump kernel. The kdump kernel might hit a watchdog reset
> while it is booting.
> 
> To avoid such scenarios add a panic notifier call back function
> which can stop the watchdog. This provision can be enabled by
> passing watchdog.stop_on_panic=1 via kernel command-line parameter.
> 
> Signed-off-by: George Cherian <george.cherian@marvell.com>
> ---
> Changelog:
> v1 -> v2
> - Remove the per driver flag setting option

You didn't actually remove it.

> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index d46d8c8c01f2..8cbebe38b7dd 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
...>
> +/* Use the following function to stop the watchdog on panic */
> +static inline void watchdog_stop_on_panic(struct watchdog_device *wdd)
> +{
> +	set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
> +}

Under what circumstance could or would a _driver_ request this ?
I do not see the use case, sorry.

Guenter


