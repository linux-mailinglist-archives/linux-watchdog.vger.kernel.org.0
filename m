Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9FD382219
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 01:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbhEPXfC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 16 May 2021 19:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbhEPXfC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 16 May 2021 19:35:02 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B26C061573;
        Sun, 16 May 2021 16:33:46 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id ez19so2308710qvb.3;
        Sun, 16 May 2021 16:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cVzvV6rPUoiqFucloq5JUBxmZon0M0hhdTcnCJ8NNFc=;
        b=WR7Q7sq2n0/c/AfqiHJL7itffA4kEdOdmP6etmaSG2bZEKmODzP9M0q7WRvFBLtaRG
         Rd+9cfFc1wqgt/SD7TD5KNUqGxgJYVjj1/PBHs55fQKGPIO0GpoE10qGJ51d1ywz724e
         xdEfRuM6CbUSL+ttqMftPeYnRmxHS8WLl1LuWuhc6Fdy6qvLYtpt2ZPQkzW6Nj0WxVuO
         VOKDT2YYVD3vKAbtaYc6628QZuyBm4tu77azVadAJe87faDGAhCxbQ2twSteu8a1tKr1
         NY/WcccYhEpaMjVt/COWyWoLzKOyBb3O+TAx9hWHl4nzozr12qV25OFk5n8V04mj/Shm
         J9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cVzvV6rPUoiqFucloq5JUBxmZon0M0hhdTcnCJ8NNFc=;
        b=LzhkwX5k4BcRrE+13RZnnggcGwXxx9o9LhaB/XKpx6kBbgowInGKlYxDcx82Mqluge
         7y/qDI/UvlFXFBLeToR7yi71fvTzwRou+N3quNx4ZMYpnTgITHBQxE1zAlJocXHwF/EU
         cmuPoa2loVk76AcyrNxd5YFET+dKY85K4Lsp44FCR+milCWa3SAx/ZPuL0svG/Qmov0D
         szciU+nbDZLgtmV0zGw2DPowlbP6U3tyqRmsyb02LNs+Vb7dUsj+w/eIryClD4c3aCXa
         E/+ptjREYn4ySQhW4Vc117l2Rpa9a2osSAjNqI9xRdkO33QKGHvRnTZBO0KYH4DdeSKO
         yJSw==
X-Gm-Message-State: AOAM533I9O1xOJ3BiQ329++eijk6lAUFBSHrTAIRnwH0JNYCs8J8+orZ
        35hkUEB7NPt93mPmG9tnufo=
X-Google-Smtp-Source: ABdhPJz5ckfrl+rPmPqchAQPLrzq81rlEgyynfvm30nlOP3YOAtXHRXgXx7I1pdvOYVXBpU2rmDJVw==
X-Received: by 2002:a0c:ea4a:: with SMTP id u10mr30428568qvp.8.1621208026077;
        Sun, 16 May 2021 16:33:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l197sm9406616qke.121.2021.05.16.16.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 16:33:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: mtx-1: drop au1000.h header file
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
References: <20210516211703.25349-1-rdunlap@infradead.org>
 <a1df3bdf-b883-008f-2989-27bbfe1c9b9e@roeck-us.net>
 <d22c3fb9-51c7-6f1f-f9ce-e761ad25502c@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6870b21e-c993-aec4-4214-ea25e6da1b0f@roeck-us.net>
Date:   Sun, 16 May 2021 16:33:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d22c3fb9-51c7-6f1f-f9ce-e761ad25502c@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/16/21 4:29 PM, Randy Dunlap wrote:
> On 5/16/21 4:08 PM, Guenter Roeck wrote:
>> On 5/16/21 2:17 PM, Randy Dunlap wrote:
>>> The mtx-1_wdt driver does not need the au1000.h header file.
>>> Instead, the header file causes build errors, so drop it.
>>>
>>> This change fixes multiple build errors, all in au1000.h. E.g.:
>>>
>>> In file included from ../drivers/watchdog/mtx-1_wdt.c:44:
>>> ../arch/mips/include/asm/mach-au1x00/au1000.h: In function 'alchemy_rdsys':
>>> ../arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Werror=implicit-function-declaration]
>>>     603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);
>>> ../arch/mips/include/asm/mach-au1x00/au1000.h:603:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>>>     603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);
>>>
>>> Fixes: 04bf3b4f5fc0 ("[WATCHDOG] MTX-1 Watchdog driver")
>>
>> More like
>>
>> Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> 
> Duh. Thanks.
> 

That patch wasn't exactly one of my better ideas.

$ git log v4.10.. | grep da2a68b3eb47
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Commit da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
     Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")

Me blush :-(

Guenter

>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: linux-watchdog@vger.kernel.org
>>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>>> ---
>>>    drivers/watchdog/mtx-1_wdt.c |    2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> --- linux-next-20210514.orig/drivers/watchdog/mtx-1_wdt.c
>>> +++ linux-next-20210514/drivers/watchdog/mtx-1_wdt.c
>>> @@ -41,8 +41,6 @@
>>>    #include <linux/uaccess.h>
>>>    #include <linux/gpio/consumer.h>
>>>    -#include <asm/mach-au1x00/au1000.h>
>>> -
>>>    #define MTX1_WDT_INTERVAL    (5 * HZ)
>>>      static int ticks = 100 * HZ;

