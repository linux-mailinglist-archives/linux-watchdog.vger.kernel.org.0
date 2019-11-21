Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4639104FD2
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 10:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfKUJ4D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 04:56:03 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38950 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfKUJ4D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 04:56:03 -0500
Received: by mail-pg1-f195.google.com with SMTP id b126so1327687pga.6;
        Thu, 21 Nov 2019 01:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FzoSL4YP+wGhKXl+dqpfFhOcKj1KTUkz/Dcb+UIksRo=;
        b=gkLUSRZ57R42ncaj1Bx/kvu7relx6lzvV5Xn0I6r0sBxURtE1G5TWry9NP/BMT8BNF
         3S+kDKmnBj/WuPhqh4ANh59+4wGbZvZfPCDdxdkO2mA4AyMc11Od74bt54Q0vHa20hAb
         zG2o/zMVd3//A5wOPM5jlulk4BK2f/GZ7TqIQGxuug6XxqqlHWfQ5pY81l55QICfHn84
         EU+fOSNb+9V2NoPd8j3VsqHCJJJmbukdakcn6WNjQeh+05V10vd/ek9g0ao/+K9XZI4I
         8eLZrAhFe91mPLk6ze4v3kLC7ZPeaLSKrpVnAsWOEszlazVf4AV5l4FRqhozEpHn3QsP
         0W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FzoSL4YP+wGhKXl+dqpfFhOcKj1KTUkz/Dcb+UIksRo=;
        b=e7GlTYIvfdO1AdeSpAfI2B1t4Pmmju8aI34nqNqYpFVb8EGRVLmypCbS2Cshh4xy5/
         derJijXIGR4gAEpzH05mVe7k2UskTIynBfrfeLmufrtcQZv1cMa7Xf2G+93WQHCl7Ike
         JcKJGewueSZtG+cIGRJbPTFw6QG1arLPVaDTXZ1m/wMDAs+JU3Ig/XjraLC+aznOAusO
         hNVeHIrf5k7VKnGGV+ezSjWkFafIvXYzhufwRu8YGplAkiO4isoz/kUu5VOSp+BGGJPU
         3beNE+CJjwRIbQU/8ysohcNts1ScpBDTdOfOHxDOF2yEJEe49FHWwfzuHHMHGLuuwdUP
         atXQ==
X-Gm-Message-State: APjAAAVzii1EuhpqAb5tgwVr7DOgpiCjvoTEdrNbzdJbYmafpecqOxGV
        H6egTqdcAu0W4DfSU8XxQPAwVq62
X-Google-Smtp-Source: APXvYqyb4umAwUrsdD0WCRtfuTBglwOyAN46dhme08ZiqWXDp3YaUcs4wdsgRn0piCBPqPDoEcCseA==
X-Received: by 2002:aa7:9a96:: with SMTP id w22mr10066954pfi.162.1574330161967;
        Thu, 21 Nov 2019 01:56:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c2sm2614445pfn.55.2019.11.21.01.56.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 01:56:01 -0800 (PST)
Subject: Re: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
To:     "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>,
        Guenter Roeck <groeck7@gmail.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4468f40ed5f5413ab27825bbcc611d65@nokia-sbell.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d31883d3-7f5b-545c-cc64-beb3848dbe7d@roeck-us.net>
Date:   Thu, 21 Nov 2019 01:56:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4468f40ed5f5413ab27825bbcc611d65@nokia-sbell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/21/19 12:21 AM, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
>>From d21d084122d08816454a1e338f0946a9da1f81e3 Mon Sep 17 00:00:00 2001
> From: Peng Wang <peng.1.wang@nokia-sbell.com>
> Date: Wed, 20 Nov 2019 15:12:59 +0800
> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
>   timeout value
> 
> watchdog_dev.c provides means to allow users to set bigger timeout value
> than HW can support, make DesignWare watchdog align with this.
> 
> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>
> ---

Please version your patches, and add a change log here.

>   drivers/watchdog/dw_wdt.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index fef7c61..f1a431c 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -114,7 +114,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>   	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>   	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>   
> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	/*
> +	 * In case users set bigger timeout value than HW can support,
> +	 * kernel(watchdog_dev.c) helps to feed watchdog before
> +	 * wdd->timeout

No, before wdd->max_hw_heartbeat_ms.

> +	 */
> +	if ( top_s * 1000 <= wdd->max_hw_heartbeat_ms )
> +		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	else
> +		wdd->timeout = top_s;
>   
>   	return 0;
>   }
> 

