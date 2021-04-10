Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDC135AAE4
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Apr 2021 06:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhDJEf4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 10 Apr 2021 00:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhDJEf4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 10 Apr 2021 00:35:56 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B713C061762;
        Fri,  9 Apr 2021 21:35:42 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id c12-20020a4ae24c0000b02901bad05f40e4so1814622oot.4;
        Fri, 09 Apr 2021 21:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WZZcv4dXPGfcweYSKUPtzUjMWPM1Ln7H/1gmkASy0xs=;
        b=trbbCTf2ankWYnd+6bz81jc8CfhhXEnnCpBUijGOD/SEYeT3b+xaZpYF5nqdznXCX8
         8UWL8wiOqlbAS5usAmskeL6RK6J5KVN2+hoXKEQxnnBwMO6En/+xMUDUPB7Lq6W+zhry
         MVdSF8Fgq8iWeL1C0bQWpVeUF3dOzw14rUHCLVsPFkb+VTnxde+fMd00lh5keku79+5K
         iPXeLQkjf/Ck+od+NLZY9pilZeKjmsTiBmTyxB4dEyg6nvTv4ej3jChfYOpgP4p9TIsV
         PO8LkvDUhXoRGOy43p+kQw5e6g0nRZOnzH7ydphSWlSImSXm7E5/fNECXh10WxqZAy4W
         TOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WZZcv4dXPGfcweYSKUPtzUjMWPM1Ln7H/1gmkASy0xs=;
        b=K1O2yEFMjsHoDJ5rtpynZoYcPiEZ1P773TVvoLIjhepNgpAKvkKp1W+qpIKbb2gGra
         vCoW4DJvGWkugB3b6skC0MwHifgoqY2XUhk+WBGyHXuRt7E6FibKEXQrx1jz0AkpRvPZ
         jhAw5fUs4RZUQFIDL7AlZWFBfksdtddzAgoDmHIfVtvGgOYNwJIilGMWt5zco5Xr/VIT
         bkuuM+iqgKU7+OjfYEaIlZxhUoNi9guTzJaV0NPC5p2jQEu1Wp39zFzUfr6J5CLR5ZLb
         z2lou5ImO0Ai7eAlKFpu8zNIhFpRJEIdqiB8WKx6+DcFl0hjTAFhJd1GRCpF+EZx/cCD
         ZjJA==
X-Gm-Message-State: AOAM5325s58h68S21ckjneNK4OsGieuTBzBYi2b6covpe0A71c0VlW4u
        DfslElrwW8ZYwVrhmK/23iptfWvpX74=
X-Google-Smtp-Source: ABdhPJz/ghvLOfdY8tPV2aFbdVuxLZl2L7ayPpRz0C+U0pyI0b+OVCaTSQtLrW/ifnsbtV+uI+9vPg==
X-Received: by 2002:a4a:8247:: with SMTP id t7mr14466269oog.53.1618029341237;
        Fri, 09 Apr 2021 21:35:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e20sm1060496otl.15.2021.04.09.21.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 21:35:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: mtk: support pre-timeout when the bark irq is
 available
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <AKoADwCwDn4bllbdA00CnKoA.3.1618024305455.Hmail.wangqing@vivo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <45e40a84-9d98-87e7-659e-6c34834e6280@roeck-us.net>
Date:   Fri, 9 Apr 2021 21:35:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AKoADwCwDn4bllbdA00CnKoA.3.1618024305455.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/9/21 8:11 PM, 王擎 wrote:
> 
>> On 4/9/21 7:42 PM, 王擎 wrote:
>>>
>>>> On 4/9/21 2:55 AM, Wang Qing wrote:
>>>>> Use the bark interrupt as the pretimeout notifier if available.
>>>>>
>>>>> By default, the pretimeout notification shall occur one second earlier
>>>>> than the timeout.
>>>>>
>>>>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>>>>> ---
>>>>>  drivers/watchdog/mtk_wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++---
>>>>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>>>> index 97ca993..8b919cc
>>>>> --- a/drivers/watchdog/mtk_wdt.c
>>>>> +++ b/drivers/watchdog/mtk_wdt.c
>>>>> @@ -25,6 +25,7 @@
>>>>>  #include <linux/reset-controller.h>
>>>>>  #include <linux/types.h>
>>>>>  #include <linux/watchdog.h>
>>>>> +#include <linux/interrupt.h>
>>>>>  
>>>>>  #define WDT_MAX_TIMEOUT		31
>>>>>  #define WDT_MIN_TIMEOUT		1
>>>>> @@ -234,18 +235,35 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>>>>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>>>>>  	int ret;
>>>>>  
>>>>> -	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>>>>> +	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout - wdt_dev->pretimeout);
>>>>
>>>> That looks suspiciously like the real watchdog won't happen at all.
>>>> What will happen if the pretimeout governor is set to none ?
>>>>
>>>> Guenter
>>>>
>>> The pretimeout governor is panic by default. If pretimeout is enabled and the governor is
>>> set to none, it means the timeout behavior does not need to be processed, only printing.
>>>
>>
>> That was not my question. My question was if the real timeout happens in that case.
>>
>> Guenter
>>
> Yes, the real timeout will happen. After WDT timeout, IRQ is sent out instead of 
> reset signal first. In order to ensure that CPU does not get stuck after IRQ is sent out, 
> WDT will time again and send reset signal to reset.
> 

When will that be, or in other words how does the chip know when to time out ?
After all, only a single timeout value is written into the chip. I don't see how
it would know to reset the chip after wdt_dev->timeout.

Guenter


