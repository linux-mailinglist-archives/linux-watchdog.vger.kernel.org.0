Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB325409758
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Sep 2021 17:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343704AbhIMPc5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Sep 2021 11:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245403AbhIMPco (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Sep 2021 11:32:44 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98964C120D49;
        Mon, 13 Sep 2021 07:37:05 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id n27so14356404oij.0;
        Mon, 13 Sep 2021 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jPneWkdJJ/yC2zoSfmCm8kIHoNWifAPRW5x1OCcNU6g=;
        b=BbwbDPBrhOXA/sOMKhWIz6rm4L4v3eguY72PBETM7s8cprasKUlY6xXHNR+i5wurHV
         HkbG8HWSs+0xtx3FcGDSqKwSFxOxRihfrlhTHsMRGO7YDmfbyLCOQ8+Q0XQ0DSt5gfyi
         DDfHK9ILuf6L8AHj/AzcGfDXsLeNj7BSRQXU9gKNdKiz9DCQevSYBc4jrXX3+cqt8BnO
         cMfMk1FNB5eLwvFDEpVfeU+PMd3wvTlliJapGwP3I+sgl/TAmL9zPLIpG9pp8gBQ8SpX
         7dJDNFGrZdRbQyAMdlYbxBIqjkoOMjqNjSqA0dsV/2u4tXYfb8WvvU42eu0dRZHFkvpD
         mSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jPneWkdJJ/yC2zoSfmCm8kIHoNWifAPRW5x1OCcNU6g=;
        b=hRklGJ/yUhUg39GoUOmTtpaypqqCdI2lNhtZ9TGixWuApqSSF1+GKJ7lyOaamn2UJ7
         fm8MwZRIErCHlbGvj/tUUASFj8pCwGNuI427RxAT4wbiahPktrw9WBTPNyeOjEU0eYvR
         XjDQlC6XivjsVUnkQzEu5XkK+b0v7dVpcuKIsUUWUpyTFfnErZRkmYQW1wjLtFYN/3+7
         Q8dVO5fx2XKGGgbkdx6KIuVvHaXDvETglfe2YaSYXtSsSFCplQrtHpWQilORTYQXPaZW
         BsC4Tudeox1UXE7y7kxvwqFEGAlFmt14dCsk8WovHa6euSr2++VeLYaM62gnFOEHIfPm
         CI8Q==
X-Gm-Message-State: AOAM5300GJBmrm7U0BBgkhtWV1srPQc6JhaY05shoBD8C5SG1Ogb9bx5
        uPtstDrPuujJIGZRjx4Y9qK2eWqGyWo=
X-Google-Smtp-Source: ABdhPJzLvPuR+YB+ZDrU3ATCDeUAPO1GNcb3YP3Jy5cn9yjdwAWUz9DKjtj5LE0Xdgmb2PTOoX946Q==
X-Received: by 2002:a05:6808:10c8:: with SMTP id s8mr8210876ois.6.1631543824718;
        Mon, 13 Sep 2021 07:37:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k23sm1899911ood.12.2021.09.13.07.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 07:37:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC][PATCH] watchdog: rti-wdt: Provide set_timeout handler to
 make existing userspace happy
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        "Su, Bao Cheng (RC-CN DF FA R&D)" <baocheng.su@siemens.com>
References: <4d82b8ce-bc34-e4b2-c5fe-9e883b0db59d@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a454fd16-b49d-b803-6bcd-c245e059d3d8@roeck-us.net>
Date:   Mon, 13 Sep 2021 07:37:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4d82b8ce-bc34-e4b2-c5fe-9e883b0db59d@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/13/21 4:41 AM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Prominent userspace - systemd - cannot handle watchdogs without
> WDIOF_SETTIMEOUT, even if it was configured to the same time as the
> driver selected or was used by firmware to start the watchdog. To avoid
> failing in this case, implement a handler that only fails if a deviating
> set_timeout is requested.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

NACK. This is a userspace problem. The ABI clearly states that
WDIOF_SETTIMEOUT is optional, and userspace must not depend on it.
We can not start making kernel changes just to make broken userspace
code happy. systemd should be fixed instead.

Guenter

> ---
> 
> See also https://github.com/systemd/systemd/issues/20683
> 
>   drivers/watchdog/rti_wdt.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 359302f71f7e..365255b15a0d 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -173,13 +173,27 @@ static unsigned int rti_wdt_get_timeleft_ms(struct watchdog_device *wdd)
>   	return timer_counter;
>   }
>   
> +static int rti_wdt_set_timeout(struct watchdog_device *wdd,
> +			       unsigned int timeout)
> +{
> +	/*
> +	 * Updating the timeout after start is actually not supported, but
> +	 * let's ignore requests for the already configured value. Helps
> +	 * existing userspace such as systemd.
> +	 */
> +	if (timeout != heartbeat)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
>   static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
>   {
>   	return rti_wdt_get_timeleft_ms(wdd) / 1000;
>   }
>   
>   static const struct watchdog_info rti_wdt_info = {
> -	.options = WDIOF_KEEPALIVEPING,
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
>   	.identity = "K3 RTI Watchdog",
>   };
>   
> @@ -187,6 +201,7 @@ static const struct watchdog_ops rti_wdt_ops = {
>   	.owner		= THIS_MODULE,
>   	.start		= rti_wdt_start,
>   	.ping		= rti_wdt_ping,
> +	.set_timeout	= rti_wdt_set_timeout,
>   	.get_timeleft	= rti_wdt_get_timeleft,
>   };
>   
> 

