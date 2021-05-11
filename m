Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392B637A7DA
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 15:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhEKNiW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 09:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbhEKNiT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 09:38:19 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72226C06174A;
        Tue, 11 May 2021 06:37:12 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u16so19038315oiu.7;
        Tue, 11 May 2021 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YW82r9Shi+W5Wd4oZFNM7KnqQ1f238S0OR4W4r1hOe4=;
        b=KRNPPP1YsjgzmYQoA2wjU4Yc9MAF6L9GrsLPQ74696/zZtUJAoXB6w7ZWWtsVK0KQC
         fg/B4WPFQA5X4pNytJnlrNWJaR+cy3F+K22Bv61hyQbwcU8+rl5q5Vc1f9x6TVtXEKwS
         3dgz+Gi2CcVvi8Fv+T9wcQi1ahFSPDzRidEAOoyCD1IBf5mphy1fI2BGhtIWtSLxx24o
         3eMBjN4KMJGYfTFGEGohrviqfXfX7g8QHKjciZ1WNexnw2w27g4c2T047qQnv1VonZBs
         na8t+D1w/JJkwB11azXOqcwKPY3+J3K+tm8L490RhV6lYi34O1hX4GVeIHXUufJqp6It
         N6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YW82r9Shi+W5Wd4oZFNM7KnqQ1f238S0OR4W4r1hOe4=;
        b=s6g9XOYa8lfadq/R0gn8dRQcqnlmn2ssr0IvEsq/6Lsc9ApJtemBCRm59sir3+Tf+6
         Lc6HSmahioZ4woe7obmuBxxCX+JoQgxwo7ERsyy17cDGolgWigwC/n5Tpvkwvqo+DDT+
         MpktfSEUqyD2PdTrnsXLV1XBjyc4AX9PPubK/N93x6FSXK1rN1oPTv88zb0Nhh5gNUpm
         9QEBkP9Aslpc76nOtGR+bNnEQXmft4mMmgUY3FPfzh2G16ukk2+auYrx9X9vLKO3wsbR
         3UHjPXgryNYAVxp8VKTeDN52fO9rd/qAKVYxxUgFMGKXf6oOs+SNn/DshK607gNDDxuo
         o/3w==
X-Gm-Message-State: AOAM531G1KkhOBz3VIdM2Og7J5B73kIkA52Z2Gnwv7p3FBqHw9D2a6mh
        cBKk0GNXIX/C1FKIW0oldDLdT/6lFak=
X-Google-Smtp-Source: ABdhPJxEPAX2MOhVCejnNBESY76RZEg+jQpWd4eFJG/frHsx2njNXVpqyhVCug9aiiPuBR7CLES/zA==
X-Received: by 2002:aca:30cc:: with SMTP id w195mr22380951oiw.78.1620740231267;
        Tue, 11 May 2021 06:37:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9sm3278256ooq.31.2021.05.11.06.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 06:37:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH -next] watchdog: sc520_wdt: Fix possible use-after-free in
 wdt_turnoff()
To:     Zou Wei <zou_wei@huawei.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1620716691-108460-1-git-send-email-zou_wei@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <78638328-536d-edf6-f913-38f6d3acb1d3@roeck-us.net>
Date:   Tue, 11 May 2021 06:37:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1620716691-108460-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/11/21 12:04 AM, Zou Wei wrote:
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
>   drivers/watchdog/sc520_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sc520_wdt.c b/drivers/watchdog/sc520_wdt.c
> index e66e6b9..ca65468 100644
> --- a/drivers/watchdog/sc520_wdt.c
> +++ b/drivers/watchdog/sc520_wdt.c
> @@ -186,7 +186,7 @@ static int wdt_startup(void)
>   static int wdt_turnoff(void)
>   {
>   	/* Stop the timer */
> -	del_timer(&timer);
> +	del_timer_sync(&timer);
>   
>   	/* Stop the watchdog */
>   	wdt_config(0);
> 

