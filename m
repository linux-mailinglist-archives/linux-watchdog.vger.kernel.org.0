Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264E340225E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 05:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhIGC56 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Sep 2021 22:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbhIGC56 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Sep 2021 22:57:58 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA19CC061575
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Sep 2021 19:56:52 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso11046137ota.8
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Sep 2021 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rfTPh05SljWLqE54TG2P76kYj86OLIMHnddAO9esLK0=;
        b=LODsiPGx3xZu6vp8JavgMVe3eTiXdxVAADfr9n8PtkN/5Wt+ShB5Bo/V/c2hQHpd5s
         oDtSizSXW5Yznc4GFxl5o+OvOxa+BihzTNMN0Mybn5gwTT+J04rjwossqALIybbicGPy
         WL0IuKk1xcD5D6UA5DbmAW3GR2iBMbSmeoPiv0LU7gsqdow5ZxPzvQ+9sKh1WIf1Yl79
         ue57tSofhUJGIKOmPUtAGdWGLE+OSHcSd7r23ujDVHa3VeDjVnWzqa6w+iSNnnLEAcEm
         D0IVO/q3tszBGs/R2tDH/HE+bHF5GR4owv5ZVjKdcZcN2fQdumFIyxRmgr4x4/s/SokR
         3f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rfTPh05SljWLqE54TG2P76kYj86OLIMHnddAO9esLK0=;
        b=nBYmEBKXzUit7o8YzglOtG6lOJfymddqo7m/IhLAIc0MeZHI9x9wVKstRGgcv7tqkL
         FcPpHA7h6+Ig/vioqPJwXKePgHoOVSa1cKLxJ3TpjOIiMGffR3otrk2K4Ztg4h3d8rvq
         e7stvNcCrWgnvRvBBFoR/0v5QVwCwbdI7Z71Vzfzad2KOdJmaX+8e4yXi2bhIHiEECS/
         yfkm8vlTBA3LUjTyy6Pfr5Qti8wHAmvYv3JO0xg7yI4XszL0xE4MS0uC+JPo5Ber8zv/
         7ifHNJGl3fSK5N2YX7EZv+bSgfsee8BfhceeAVs+QcGo3dR3zLBfYh8IQq/xnws4avOr
         imcw==
X-Gm-Message-State: AOAM53231bJIVaX+No28ZLJXQsJ6g7YOvTfTcw+NeeONbMdfKwyk6FfN
        7byRYIG4k0Z1pgMe9VMfYwABEL1bi4g=
X-Google-Smtp-Source: ABdhPJx4Yw0favJq+XOAM2I9XKEtBh0OM/6pqjb6XcTHRVDmaTcH+P0NIHnFKLjBuYpoSpYt4aklYw==
X-Received: by 2002:a05:6830:2a0c:: with SMTP id y12mr1805372otu.93.1630983411223;
        Mon, 06 Sep 2021 19:56:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 33sm2124842otx.19.2021.09.06.19.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 19:56:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] ar7: fix kernel builds for compiler test
To:     Jackie Liu <liu.yun@linux.dev>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <20210907024904.4127611-1-liu.yun@linux.dev>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cf3c4565-2cab-a168-72fb-03c3847e6ec9@roeck-us.net>
Date:   Mon, 6 Sep 2021 19:56:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907024904.4127611-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/6/21 7:49 PM, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> TI AR7 Watchdog Timer is only build for 32bit.
> 
> Avoid error like:
> In file included from drivers/watchdog/ar7_wdt.c:29:
> ./arch/mips/include/asm/mach-ar7/ar7.h: In function ‘ar7_is_titan’:
> ./arch/mips/include/asm/mach-ar7/ar7.h:111:24: error: implicit declaration of function ‘KSEG1ADDR’; did you mean ‘CKSEG1ADDR’? [-Werror=implicit-function-declaration]
>    111 |  return (readl((void *)KSEG1ADDR(AR7_REGS_GPIO + 0x24)) & 0xffff) ==
>        |                        ^~~~~~~~~
>        |                        CKSEG1ADDR
> 
> Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0bc7046ab942..cb5cfa31849d 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1691,7 +1691,7 @@ config SIBYTE_WDOG
>   
>   config AR7_WDT
>   	tristate "TI AR7 Watchdog Timer"
> -	depends on AR7 || (MIPS && COMPILE_TEST)
> +	depends on AR7 || (MIPS && 32BIT && COMPILE_TEST)
>   	help
>   	  Hardware driver for the TI AR7 Watchdog Timer.
>   
> 

