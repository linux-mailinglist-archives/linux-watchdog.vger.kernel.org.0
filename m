Return-Path: <linux-watchdog+bounces-3877-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E0B0815F
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 02:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652ED4A7BF7
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 00:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1F121348;
	Thu, 17 Jul 2025 00:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnLpXSi+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208001799F;
	Thu, 17 Jul 2025 00:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752711899; cv=none; b=ME2GdWLH8amqW7TKzNgrkvxqw+9iO6NcD7cdWjfmFK8/pOkmpZ4T3T5EeKuAy+LY/HZOUoBNp5ueeRPIvRNNS/lO4ja/nO+c0y+ZVXC76CimKGewXtriUdZAj/wdIoSAkxRqiBQKCfnXRm/aqpW3aaeT96xhPZCcw3qZnUTOwC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752711899; c=relaxed/simple;
	bh=LuKolpuRHUSfSWdVW11ldVecIX7BnRkJQDxMDYB1ukM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ym8zcdPAau4HRkJ+BOz2N6ZrJTsS/KSodvaK860giRUrRry1JvS6E15+Z3+IU83+wSN9rzaorcsTi5QxhW7hYnsb5q60ldN5ga3893VrbnvESaZ/9aowzie1A5cuTYrBGbCIwUrF9X+EpPqLqBYZqSzKdJ6lD1wYRw5Xyk3vSA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnLpXSi+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234bfe37cccso3053265ad.0;
        Wed, 16 Jul 2025 17:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752711897; x=1753316697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D33PJ1weY8/mdLQW1iw5tG9vj4+pyB4UQgnzZxRMDKU=;
        b=LnLpXSi+WXVO8/P1KcpjdX+12LkxuW3AIu4/iy+KInzT2LVcUaHo+iHQopmXl0dYLP
         R+YiEy6RrhgJ4MI3ZtV6Vd89VJWmue9cb7IrpiFPxFWQ/Abv84/v1DgRRcEZvdNJMhVX
         9nTnjEJDZM0AY/tVRduxCpOK8sD484Af6KJ8URvtmhkN+5vxQGseBSrVMA4GxPu94kJt
         VtyQl00AkTpd11bIyopYwV06UoC5UnkV21vQGbGezAuaVxBD1YC1nlfa56GUW8kQxoPI
         Vnkdh2WcZ2lHIx2kJZVUfDMkBoZnyvUS2jd37Cd5iT9eC+MO2mLPtpQBqA/50gsa/2fj
         6Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752711897; x=1753316697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D33PJ1weY8/mdLQW1iw5tG9vj4+pyB4UQgnzZxRMDKU=;
        b=WQZqyUR1C1TeDHar/3xfDcgyvp+Sarl6bAcGTCpngqOCTegRP01ctgsThXnf01sqve
         gWv6XI/f7mLVfhAp6LavBxpQviTruEAbY5NxmLstCQVAkymiJ/0PWTySpGJ2duAnWwQD
         kC+nOrZNQME9gEpvV0qcEzwZT/sm8BW1cTCatlTmAnrXBTwJBZY2hFBNDQIziqIqR7VF
         Tfz5ejohACN7Ml/aooyADQx8ojyOqeB+TQvJ6sq0zOksRM5i7f4AEaYq6z7wmtqJdMUR
         NNxj3mpHyXyGBoWridVLeoOCE6xQqsYoAiAaCMNduNmdhQ8LjlfS/1mbZbSOg1ciYMrU
         /8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU43T7ebtJ00bTIrI+NAkuNRQpS6UhC2WgdSZS6Yvr7OapIMvmrB4mTQnUOeFrwQLIRnUFWnch+ky66hhSOZxQ=@vger.kernel.org, AJvYcCVjqoy1Af+yXrjMpnLYVpxhYOP6rd8+rxV5GqaPi+PLRMvYBr82rBEO9Gvh674VjgFGQKaYMTuJCVTsFrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymSTgruTTycgVg0yXNJb/URIzcxYd+4sqlO6ROEzsr+bu27S8u
	ZAaYhSOD1urjWDZTbga7xGLxKVBqjxUWeF3vRzdaYgj5mhgCh5yu4ZLI6i/JgQ==
X-Gm-Gg: ASbGnctdNLLmPFi7hLLlz4bNIk0L7eH3xcQtQyKuYqvnt9OJ6v0/nu0Ikbc8M5SVRHX
	ptkkhdQJ3rfAHQjsOgs/lo2phV7Glcw2PN+zchqzmeTBZ8AAQ12K74+zYfoJjrSltC8n+kAbuvx
	olHiecavBbCZ5P8zwuyAvDNnirO0gAbA35Qc4u51sbVwmiZU1xBr+vaOSlik2GFxlmZ4w+pNrnl
	sVCm89reAu4s5rkTiDex4WGRjCHjoPEpFGimH7eLJL1fQUptn3qaa8JNY2XbIzrKHo9lN0t2H65
	O7GRYXIjc5ndFepXS1JAoXmVYv2znCY7jTT50IWukCQ6whdRBOqVjsGj2y+o664D2Vr6Y7SLRgA
	CWZW4vY2IgWB2xdM7017KV/k7pFTizQ4Ns3obSos+ytC0zwufj9yKdrr7Xcrk1Ijgz1MzHkwd2T
	P4NQi+hg==
X-Google-Smtp-Source: AGHT+IHW7YoB0xH+rq7y1zz+Rwcz3jA2fFUCSkGgO0qKiFCzP4VkW7EQGgZEktifvFnfgJ2Mq0SQ6Q==
X-Received: by 2002:a17:902:dac7:b0:235:e1e4:ec5e with SMTP id d9443c01a7336-23e24f70854mr74300635ad.49.1752711897210;
        Wed, 16 Jul 2025 17:24:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e31027f80sm1978905ad.123.2025.07.16.17.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 17:24:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5e471ef4-5303-4c7f-a7fa-e19f8fea0f8f@roeck-us.net>
Date: Wed, 16 Jul 2025 17:24:55 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] watchdog: it87_wdt: Don't use "proxy" headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20250708133646.70384-1-andriy.shevchenko@linux.intel.com>
 <20250708133646.70384-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250708133646.70384-2-andriy.shevchenko@linux.intel.com>
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
>   drivers/watchdog/it87_wdt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index a1e23dce8810..3b8488c86a2f 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -22,11 +22,13 @@
>   
>   #include <linux/bits.h>
>   #include <linux/dmi.h>
> +#include <linux/errno.h>
>   #include <linux/init.h>
>   #include <linux/io.h>
> -#include <linux/kernel.h>
> +#include <linux/ioport.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
> +#include <linux/printk.h>
>   #include <linux/types.h>
>   #include <linux/watchdog.h>
>   


