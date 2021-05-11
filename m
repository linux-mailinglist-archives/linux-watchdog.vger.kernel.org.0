Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0462337A7D7
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 15:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhEKNiR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 09:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbhEKNiP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 09:38:15 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD08C06138C;
        Tue, 11 May 2021 06:36:57 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso17493233otn.3;
        Tue, 11 May 2021 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8PKRMx9MBXWK8U7e2Oztbh2Zz7bPL2jV0MPHBiguWvc=;
        b=XYvWl+o0fvuB7esKnRXswPCiu2rFCTLOo76GEBksBu+X2qlKTM+fkaFutoCbjffE0o
         D8IHVh8CHppDAzaQRzop3vzltv+107H4xeCTCiNcwpQRX5IG7/NRo73VwEhFnytWfGmf
         aT3Oaj5/9AOO0T3OtFnB2bbMlYU7CaPMWw5tZlBijrl42XJjfs2uYGF3TqSfyUCTdnO8
         3e2PaQKHr006GWUbCXIH5gmi22w4pb4t1j59S7phRJJBQ+CAZvv060hSnMIE537UaHvV
         I0CsmVQaqlXgTpb6HUmbl8c7CCOj580siuvAEohvNoNEHqR/c/Xw/ZwCqXqxp0N5FL+H
         FP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8PKRMx9MBXWK8U7e2Oztbh2Zz7bPL2jV0MPHBiguWvc=;
        b=VW0QFST9rEDqLptiwRXqIVfFyNvQlsR3gFk8TqBCP1Sb4XUnIw3Ny43M/qrKfQNTa6
         6GN3h82GBYz+w9bBoASp0nWW/HK58OrZegN3x8Q4eMM28+lTXF2p8CiEf6vqUCWDvmbC
         SkZoCA3h8E604NMEU3eccuZDsHyYdFIJaWfnA5UnxcMr9Wg5kFa7OuQG5ETWmB/UALPK
         nevzZSYqULJkhbXrwihvt+WwRc75j0XWwYGiPJImZn9YPy1PPkCS5YCdBTdzJIjArLos
         QlPNkKa3ooNRSrTf/s54gyt/4S6H4egKHO+WOfcl0mTpuCty2xog1TDBSBXKY8xNcgI+
         6Byw==
X-Gm-Message-State: AOAM532kPcK53LJPazLJAUWgNxs2OwjpEAy/ryzeaSSmMOtL3yhhei8t
        H3ALfPq4p4FSbCBumoQHaDy3I6/wkp4=
X-Google-Smtp-Source: ABdhPJxCu+mFzAyNhBMC0wcBeG6UDxjdm7Tl+k2I8/GHy2KxG+QJfIN11rSmohgs8oLjNqhN39U5Ng==
X-Received: by 2002:a05:6830:611:: with SMTP id w17mr12208512oti.225.1620740216340;
        Tue, 11 May 2021 06:36:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e7sm1871861oos.15.2021.05.11.06.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 06:36:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH -next] watchdog: Fix possible use-after-free in
 wdt_startup()
To:     Zou Wei <zou_wei@huawei.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1620716495-108352-1-git-send-email-zou_wei@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3862c1d1-dd78-0b80-74c4-5f32a821fbef@roeck-us.net>
Date:   Tue, 11 May 2021 06:36:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1620716495-108352-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/11/21 12:01 AM, Zou Wei wrote:
> This module's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
> 
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/sbc60xxwdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sbc60xxwdt.c b/drivers/watchdog/sbc60xxwdt.c
> index a947a63..7b97480 100644
> --- a/drivers/watchdog/sbc60xxwdt.c
> +++ b/drivers/watchdog/sbc60xxwdt.c
> @@ -146,7 +146,7 @@ static void wdt_startup(void)
>   static void wdt_turnoff(void)
>   {
>   	/* Stop the timer */
> -	del_timer(&timer);
> +	del_timer_sync(&timer);
>   	inb_p(wdt_stop);
>   	pr_info("Watchdog timer is now disabled...\n");
>   }
> 

