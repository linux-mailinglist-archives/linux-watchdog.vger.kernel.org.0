Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0942D408585
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Sep 2021 09:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237650AbhIMHoa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Sep 2021 03:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237637AbhIMHo3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Sep 2021 03:44:29 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDC9C061574
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Sep 2021 00:43:14 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w19so12906896oik.10
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Sep 2021 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BjzB+iC4yNOadnpiw3qFkItcAiHmjQcXJ53WvUtL/lc=;
        b=WEGZHWcWlkW5f7huCCk4m1nQ8Sn/Dy2Ef2ClSwuZRdKvg0b46ZOjiRslw5MWSTGn+M
         z/T5DGEft/HW1l5jHvjjLRBl6U72MYAVYuaMEahxfmSYhY47ZhUR+JHLStjr+HS0orzz
         7wonj3IjsFPnSEV3m3hX99HTMs+QFAfJ+6iCZN4fw7W9vJuGDbH7j8dHeFX2j+pYDzhD
         SUOI82zy1ZTPdXr+9TWRZtxKpdl69tCePL0XZavk92DT16p49xDQXOGLaoSiVtOxmsgY
         RqJRRmrw6aY5bFTO/IpNVwN8mYB22lszxQe8RVADX82CJK4UtwVgHv8mwBvwa48gnCrP
         j2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BjzB+iC4yNOadnpiw3qFkItcAiHmjQcXJ53WvUtL/lc=;
        b=KKB4yIAeShMWoKDRaAXNbqvZyKzV4WyWItwQsZwoj5AQ28KZSUOUvSEgvdWCuTlTf0
         5gVw+7cPGehgKP2l/O21qLiA2y21wgkm0X9uUPhZEp2AilF67yZLFJxo9Rd7ErY88HRo
         454HV7UGWlAPRKlicmIYlOW8UKGfVizZYg2YCVtAubWgoB7g9erMCx7vxClvj630+q2l
         YJ0kSas8lMj6b2O0oxxNGtaXJwmVBkDuHApUXbJWMkW0w2EFVBdkXWLRGgFLmmaQRJU1
         mmHQQY8UZCmoAa3g2MpR8NJr6gcewbvzMIPHS5QiZdRQVyy3VqhAVl3HAN/ezJEpgom8
         noYA==
X-Gm-Message-State: AOAM531fzJOJh8eAw3T/l2CWhkknWOMtkhchR9VP+jYGg8shjelOpI/v
        Tp8uHPrXVZJsLNsEY5JaY7gdHC70/QQ=
X-Google-Smtp-Source: ABdhPJwlFHL4fhpEsK8K2Aabc9/yRojG9dhEWNcfuGMJv5HC+/g3STGC+1I9QFDUu3VkLFBvTOYbYg==
X-Received: by 2002:a05:6808:220e:: with SMTP id bd14mr6558023oib.41.1631518993599;
        Mon, 13 Sep 2021 00:43:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i27sm1675408ots.12.2021.09.13.00.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 00:43:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog/sb_watchdog: fix compilation problem due to
 COMPILE_TEST
To:     Jackie Liu <liu.yun@linux.dev>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <20210913073220.1159520-1-liu.yun@linux.dev>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <71b688d5-a48e-2875-7909-ade58d8085a2@roeck-us.net>
Date:   Mon, 13 Sep 2021 00:43:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913073220.1159520-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/13/21 12:32 AM, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> Compiling sb_watchdog needs to clearly define SIBYTE_HDR_FEATURES.
> In arch/mips/sibyte/Platform like:
> 
>    cflags-$(CONFIG_SIBYTE_BCM112X) +=                                      \
>                  -I$(srctree)/arch/mips/include/asm/mach-sibyte          \
>                  -DSIBYTE_HDR_FEATURES=SIBYTE_HDR_FMASK_1250_112x_ALL
> 
> Otherwise, SIBYTE_HDR_FEATURES is SIBYTE_HDR_FMASK_ALL.
> SIBYTE_HDR_FMASK_ALL is mean:
> 
>   #define SIBYTE_HDR_FMASK_ALL  SIBYTE_HDR_FMASK_1250_ALL | SIBYTE_HDR_FMASK_112x_ALL \
> 				     | SIBYTE_HDR_FMASK_1480_ALL)
> 
> So, If not limited to CPU_SB1, we will get such an error:
> 
>    arch/mips/include/asm/sibyte/bcm1480_scd.h:261: error: "M_SPC_CFG_CLEAR" redefined [-Werror]
>    arch/mips/include/asm/sibyte/bcm1480_scd.h:262: error: "M_SPC_CFG_ENABLE" redefined [-Werror]
> 
> Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>   drivers/watchdog/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index b81fe4f7d434..bf59faeb3de1 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1666,7 +1666,7 @@ config WDT_MTX1
>   
>   config SIBYTE_WDOG
>   	tristate "Sibyte SoC hardware watchdog"
> -	depends on CPU_SB1 || (MIPS && COMPILE_TEST)
> +	depends on CPU_SB1
>   	help
>   	  Watchdog driver for the built in watchdog hardware in Sibyte
>   	  SoC processors.  There are apparently two watchdog timers
> 

