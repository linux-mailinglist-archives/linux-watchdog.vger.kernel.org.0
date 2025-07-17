Return-Path: <linux-watchdog+bounces-3878-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A565B08161
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 02:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461994A7DB2
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 00:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2663249641;
	Thu, 17 Jul 2025 00:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORS8BUmb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7112E72623;
	Thu, 17 Jul 2025 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752711912; cv=none; b=hm/f+DokQcNhGcN9+M1dqiQ/zt0YFkSBzSHQWaxu0PFtFxvy4cB0urHf4kYYYQxpWcXPxd4QJSmQAVBbKr8jRvJCdb6m4wbwO6VtOcxvmUdZaqUI2oqgmeXGBsFAvXRffLmRrvIhK+3ram7TRx+yTqqK7RzZsR5nYBE9Mu146QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752711912; c=relaxed/simple;
	bh=Gxa9PKufh+aR/0kJPhDsDZBqTrxI5XIdOR4wCRI+bg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skKgwVd8ryj61vpfXv+lH6UV8IlpyTzU2+A0YsiNmwYX70xf1+PAWMwuVUARvSi4fKzI/oFkpex0wllTUjsGse+3yTk8vbr0NEb+FuTN1tsPJKYSJ52qCJEtb1gQw4WJPyxprd//ULiEDXr6nriiSYpRoHzDMEWcd26Wm0Ed03M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORS8BUmb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31393526d0dso382932a91.0;
        Wed, 16 Jul 2025 17:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752711910; x=1753316710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WmWfwzZK0KTH8AomG9GKSVKLZ4xZpIh4lyGzd2MmRKg=;
        b=ORS8BUmbOgcD3qeKruFbB2S5nXx8rGrdYcQ707j74XYsNov28ixbv7aglCE3owgkfG
         GWxCf5vD4rGWVOh9iH03Ph3CYwmuAp5cgayRQrwa7j0akRcMBwVA5tHEwVYkcc5NU8sI
         2d8/EV0RCDvSj15YnID5nIK7m7Fgh5C30Gm1atPIBvwgNiEUO5REJl7z+0VjD3ACdeYC
         Q5MaKXmWJ8Mc5Ox27ea6Ya3xF7OG2XmyS0du4nfAv5BwzJJdoQBFJ30ICpZJc27OBi7m
         i570YLdBrcNxo4v4lLPb25J7xTDkQCwKxpBupLLyCZpg47Erg/ujPFd0KT6CmXAdhbVq
         khHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752711910; x=1753316710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmWfwzZK0KTH8AomG9GKSVKLZ4xZpIh4lyGzd2MmRKg=;
        b=amdVQ+rg0Hli0phwh7AyuUKBZkqBDn/6Ld3aNHOjLDzMyjrwicbARz4bhQmVntSk4B
         gRkpNaUwQOWJLpGfUZEPPEd+SHxoB6+AUJW0GR7iRpZy3ctwxZ+ZdESyHN5eOrve3KSm
         LRqhNeWl4mCk1EnrZIAIn7rEJM3nz7npP6oMjeZXOS5F1aHMmztqcaHMmwasBOngynlF
         DoneeFZhjPaw3P9oTd0xiDhTQCmOSfLcTNjGsQGfY4G3A7vWwHXdZwvxTcJdPoK4cZac
         f0/nnn/xlXiDKcZE86/L1Ft00H9FaDDWlp3TtH4WGtgXt9y1SCXBjbVO4ZlmY2iYZZFg
         i4pA==
X-Forwarded-Encrypted: i=1; AJvYcCUMmiXJVeyC4W4CMAv5dFug9fQbaqq5ib5I3L68Wzm4DPBqG50aInCCvxkPoDFI8m3PtdxfxZ/ydTprfkw=@vger.kernel.org, AJvYcCWEhlXi7/kz/ks4hcf/v23F1MTFkOphgw93tThtudJTQaqdtVgWDSnEFOWGiYwYlkS8Eg7/UOWa5nMte1Ey0/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIugkxDLJ9k7QrRdD2LEnYZzY6G6LAkeCzrcRSBBE2Wm5WLBwe
	4sXfGegQ+ccVa4lgs6ZPB9MTDNXD5QazvzaYiavmWsb+TnnbnTctIlkZ
X-Gm-Gg: ASbGncuanzYmj9WqackVx59MojFoC+t/+xb1ZlUfDBnRk59QLyXqRKSb4utkrOp3vUx
	J8Alh1DPZqnkIDs1UaVA8cJyVKDzFMr1LX1ymts3lLiiLYZ9wTse6+i+XMDGslKAmqTY8ERc8Sn
	XOJUynyVcmYWXCo5ww9IX2hp/uzCESAL8JRX4H5szSAsttWFXqCucaFeDPA8tFhfloEFI8xXWoU
	uWCt3A5Z0tbw8Yr38l/7sbhwYbA14TpcDHULf9I+KQy1GVCUguwGFg8on5NBuzXvHrLpLcZ9r3H
	ki2BT9ppHeXbAWJT7PAv5qxNovey8gJbBEgQrNWv0MCcXkc3Z9gcOl5MKP4wG2LmPkAZRuV6Sit
	9j5JcV2p+Qyjb5tip/wl8QnM0rLUjCsev7aO5RSob0De8DBF11IDNCoi8l+WW1Scwqilg390=
X-Google-Smtp-Source: AGHT+IEu/O0VhHXkV8gf/X0iOQ2i+OmIoFF8JYbZacGHj1Foi2wbmBVgypYCDMTArPmJRfakeImHcA==
X-Received: by 2002:a17:90b:1d47:b0:31c:15d9:8aa with SMTP id 98e67ed59e1d1-31c9e78cefamr6061720a91.34.1752711909554;
        Wed, 16 Jul 2025 17:25:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4289274sm131099335ad.43.2025.07.16.17.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 17:25:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c38edb68-e250-4c54-8a91-e678d3f1eae9@roeck-us.net>
Date: Wed, 16 Jul 2025 17:25:08 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: Don't use "proxy" headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20250708133646.70384-1-andriy.shevchenko@linux.intel.com>
 <20250708133646.70384-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250708133646.70384-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/25 06:33, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/watchdog_core.h       |  8 +++++++-
>   drivers/watchdog/watchdog_pretimeout.c |  2 ++
>   include/linux/watchdog.h               | 12 ++++++++----
>   3 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
> index 5b35a8439e26..ab825d9f9248 100644
> --- a/drivers/watchdog/watchdog_core.h
> +++ b/drivers/watchdog/watchdog_core.h
> @@ -24,8 +24,14 @@
>    *	This material is provided "AS-IS" and at no charge.
>    */
>   
> -#include <linux/hrtimer.h>
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/hrtimer_types.h>
> +#include <linux/init.h>
>   #include <linux/kthread.h>
> +#include <linux/mutex_types.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
>   
>   #define MAX_DOGS	32	/* Maximum number of watchdog devices */
>   
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index e5295c990fa1..2526436dc74d 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -7,6 +7,8 @@
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
>   #include <linux/watchdog.h>
>   
>   #include "watchdog_core.h"
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 99660197a36c..8c60687a3e55 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -9,14 +9,18 @@
>   #ifndef _LINUX_WATCHDOG_H
>   #define _LINUX_WATCHDOG_H
>   
> -
>   #include <linux/bitops.h>
> -#include <linux/cdev.h>
> -#include <linux/device.h>
> -#include <linux/kernel.h>
> +#include <linux/limits.h>
>   #include <linux/notifier.h>
> +#include <linux/printk.h>
> +#include <linux/types.h>
> +
>   #include <uapi/linux/watchdog.h>
>   
> +struct attribute_group;
> +struct device;
> +struct module;
> +
>   struct watchdog_ops;
>   struct watchdog_device;
>   struct watchdog_core_data;


