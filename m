Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8703F321BF3
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 16:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhBVP4f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 10:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhBVP4f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 10:56:35 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD57C061574;
        Mon, 22 Feb 2021 07:55:52 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id d20so14378444oiw.10;
        Mon, 22 Feb 2021 07:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TPpevQFvMZZaJ5SzMpqPhoMUxM8hXrVsQM4xh4VAqE0=;
        b=m0cbFoUW3OXA+TA1/2nGv1cjum3dpvIZg31hF14CB0UgAIGlLR/MvrWzsnEXtacM8m
         Fmj3AWJa1qzDaNdSGMCjH/MKHZdMoiqmMkVfQIlJtVZ51+psoFP6Ul4B1uqexRO+v/QF
         k/mGOCJaeHd6LRUc8XYEMg3CKPwJ3pGSfw8XFE5Dd4/dKWzSMpYxGI/DSQdmjcesLU8E
         jLyBR5XrWlKISITxUZsDrQM8D+dgC3UlifK7I6KFWdQGT4RegbRwlfF5d7DVyedH2vzT
         YZDIH5Xj+8SZjjmQvElLoazJnrn6NmR2UBTvUUqYBQuZVj/BkHIzxEgPV+NNx65erk2H
         /Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TPpevQFvMZZaJ5SzMpqPhoMUxM8hXrVsQM4xh4VAqE0=;
        b=efm7ZCiZKoQAdaxK0rEa8CR6lsvIOPYtGsLVzb47s97X/DtJrgR57BNAHQj6A2JPyP
         l0NaiAzHLUn4KdqQyy1XymrlvOX/6z1+XisYYj3JLjlt8qEQtECFzkUrXy1tQLaZZBpz
         xlVQnxa1chuQWlUVyhybnGvJLxx0jP4p9GnO12pgcyhGnVvkFU8pcO57jzjFHJQUs5nI
         9reAoz3SlfpnBxMMYLRede9IT4/tikfHPxNcRRUPFQkcA5hw8s3K5q4At/DOarb9qQFK
         NMDVNgYBzKDiwj9Oo4XiN04hM1btGIxatLRF0n7Ktr2CjoeYR1hvc2bF5t6tFI4/I5ns
         fKCw==
X-Gm-Message-State: AOAM53089u2yD1j3jWL7GX/vWsoxs4AO4mfzYgnZGskuD3IABrolsQVP
        MN5rzLjoe4IM/IxHctr4VkAEMQkXRBg=
X-Google-Smtp-Source: ABdhPJxEg0BBP7mWsE08uisVDLqWYrDPsvyCHU3uMb22kVyWIjJiTrrrK2B23MSxj0dtI55Eju57jg==
X-Received: by 2002:a05:6808:aa6:: with SMTP id r6mr4112330oij.128.1614009351635;
        Mon, 22 Feb 2021 07:55:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q132sm2254187oif.32.2021.02.22.07.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 07:55:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 20/20] s390/watchdog: Manual replacement of the deprecated
 strlcpy() with return values
To:     Romain Perier <romain.perier@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        kernel-hardening@lists.openwall.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210222151231.22572-1-romain.perier@gmail.com>
 <20210222151231.22572-21-romain.perier@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <98317dfa-d884-d4ae-9449-d84b902c0e5c@roeck-us.net>
Date:   Mon, 22 Feb 2021 07:55:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222151231.22572-21-romain.perier@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/22/21 7:12 AM, Romain Perier wrote:
> The strlcpy() reads the entire source buffer first, it is dangerous if
> the source buffer lenght is unbounded or possibility non NULL-terminated.

length

> It can lead to linear read overflows, crashes, etc...
> 

That won't happen here since both buffers have the same length
and the source is known to be NULL_terminated.

So this is another misleading patch. If strlcpy() is deemed so dangerous
nowadays, replace it with memcpy(). That is expensive too, but at least
it won't create the impression that a non-existing error would ever occur
On top of that, the code is handling all MAX_CMDLEN bytes twice anyway
later on, so we can for sure afford the extra cost of the memcpy().
Pus, we'll have the added benefit that the unused part of the buffer
will be cleared and no longer contain random data.

Guenter

> As recommended in the deprecated interfaces [1], it should be replaced
> by strscpy.
> 
> This commit replaces all calls to strlcpy that handle the return values
> by the corresponding strscpy calls with new handling of the return
> values (as it is quite different between the two functions).
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  drivers/watchdog/diag288_wdt.c |   12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
> index aafc8d98bf9f..5703f35dd0b7 100644
> --- a/drivers/watchdog/diag288_wdt.c
> +++ b/drivers/watchdog/diag288_wdt.c
> @@ -111,7 +111,7 @@ static unsigned long wdt_status;
>  static int wdt_start(struct watchdog_device *dev)
>  {
>  	char *ebc_cmd;
> -	size_t len;
> +	ssize_t len;
>  	int ret;
>  	unsigned int func;
>  
> @@ -126,7 +126,9 @@ static int wdt_start(struct watchdog_device *dev)
>  			clear_bit(DIAG_WDOG_BUSY, &wdt_status);
>  			return -ENOMEM;
>  		}
> -		len = strlcpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
> +		len = strscpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
> +		if (len == -E2BIG)
> +			return -E2BIG;
>  		ASCEBC(ebc_cmd, MAX_CMDLEN);
>  		EBC_TOUPPER(ebc_cmd, MAX_CMDLEN);
>  
> @@ -163,7 +165,7 @@ static int wdt_stop(struct watchdog_device *dev)
>  static int wdt_ping(struct watchdog_device *dev)
>  {
>  	char *ebc_cmd;
> -	size_t len;
> +	ssize_t len;
>  	int ret;
>  	unsigned int func;
>  
> @@ -173,7 +175,9 @@ static int wdt_ping(struct watchdog_device *dev)
>  		ebc_cmd = kmalloc(MAX_CMDLEN, GFP_KERNEL);
>  		if (!ebc_cmd)
>  			return -ENOMEM;
> -		len = strlcpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
> +		len = strscpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
> +		if (len == -E2BIG)
> +			return -E2BIG;
>  		ASCEBC(ebc_cmd, MAX_CMDLEN);
>  		EBC_TOUPPER(ebc_cmd, MAX_CMDLEN);
>  
> 

