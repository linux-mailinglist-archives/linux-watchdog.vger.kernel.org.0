Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A7E35E228
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 17:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhDMPBi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 11:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhDMPBh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 11:01:37 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5446CC061574;
        Tue, 13 Apr 2021 08:01:16 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id x77so7902172oix.8;
        Tue, 13 Apr 2021 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JRUeb3ZzrfQ4HyJMTQfJUcD6ujohgtGeTVl92DtiHt0=;
        b=hSuRHe7s738Cs0qNrwBGeOVPeOddkyFYxwTxFb+S2LZM2PzeyGNKSDeuYKZZDKGUmH
         81jqw80/RVegCnShscpEm0QmUi08q+zu18CdSepKqHYOQz0GZDCHZ4XaxFmuvtQ9Vrvd
         4EIVq0kvcKeyMbzBNwmInuAM3DMXwd//8el5R2KByNOuwJ5BCI6U26djI+gwcsD5xDP5
         5cO7LfgPw5J77wnY4i2SE4y147pTqTU5auUTvtvlkTe/9Y8a7EQhIKrcJzqOevpHqYnC
         1P68eDjWOCHhG8OtStFvql76oCMQGyqWVwsfvZ10iD5Aw09eUVSqgn+f1277w5P5qz6D
         HEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JRUeb3ZzrfQ4HyJMTQfJUcD6ujohgtGeTVl92DtiHt0=;
        b=Jy6LK00guwCMF/rHNzNosHflImdS+m0sLlCO3MrtxHJAAndYhzHkmGxdibV/4PcIjF
         bSdILsqCBIxnNX4pwrSK/6KHE9uuK1tP0ACn97l+/uvanRiY66qwv8Um8vzzgcWiJtpe
         GWn+opiNlw6bh3W2+lEF/ZOnZ3K94hPWQHF5z4+322U3NPGg0YZpK0ov95z5HWzj2IC9
         BuOYfMNA2Etmmu6JkWOWi8N+C72o+1qObS25wCoOtmMJxfS/pURSm0I8IWvsbqZYoeB8
         Dc0WRju+nmZ3P8NXvs02w0YU5oZWLp5Dss0DhrecuOULQt/SsYg7suBDe3YDk63nPrcF
         JYBw==
X-Gm-Message-State: AOAM532KyvMAQitqwvqzP2WbAWv7k+arywLjOR5KMzkPA5o5t63yT6fO
        Yw7iJfoFM1ZDF6FkJPeIBn+IUIuGaU0=
X-Google-Smtp-Source: ABdhPJyBvsWDQMnM9Ft+C0YpWn/fakeLiOvRmPkbqBl+mPL/BdrLUPYZUUlUK4ZVfq8xMX25eYKvmQ==
X-Received: by 2002:a05:6808:542:: with SMTP id i2mr326788oig.84.1618326074187;
        Tue, 13 Apr 2021 08:01:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y11sm2852338oiv.19.2021.04.13.08.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 08:01:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: it87_wdt: remove useless function
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1618306460-57286-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e57ade58-e4b3-e872-c8e7-097ced9635c9@roeck-us.net>
Date:   Tue, 13 Apr 2021 08:01:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1618306460-57286-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/13/21 2:34 AM, Jiapeng Chong wrote:
> Fix the following clang warning:
> 
> drivers/watchdog/it87_wdt.c:155:20: warning: unused function
> 'superio_outw' [-Wunused-function].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it87_wdt.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index 2b48318..bb11229 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -152,14 +152,6 @@ static inline int superio_inw(int reg)
>  	return val;
>  }
>  
> -static inline void superio_outw(int val, int reg)
> -{
> -	outb(reg++, REG);
> -	outb(val >> 8, VAL);
> -	outb(reg, REG);
> -	outb(val, VAL);
> -}
> -
>  /* Internal function, should be called after superio_select(GPIO) */
>  static void _wdt_update_timeout(unsigned int t)
>  {
> 

