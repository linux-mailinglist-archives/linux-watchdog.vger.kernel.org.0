Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB04635AA65
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Apr 2021 04:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbhDJC5C (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Apr 2021 22:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDJC5B (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Apr 2021 22:57:01 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4260BC061762;
        Fri,  9 Apr 2021 19:56:48 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so2477410otf.12;
        Fri, 09 Apr 2021 19:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SVR2eN/8DGiy/V1JHUR96/GaDSzjKtaVBwZ1h8GZUN0=;
        b=uUD2O/y51KW3JSdZbAgToXoJGs1ixszwRykqnfHRQ0eyrS5GFry/NNWbdnQENL21/P
         IlBQhUQ0P5UQqllx0WvT6Nfsir3Pl9SdSz3F3OZAi9Sd/AsPfjywMRoouGGUlmyFX1U3
         i7p1oiVpmO7FqR720vxGGvjpj731Jtp5AF88MtKYdYrXaZsGUqQu9q+NkDJzlu17zDKM
         3m4+v+hxRBZVo54UyauBlwxlN8MSc2DXUu/tocFpD/2eoBS8TfnIP2LoKhv2mSRVq38a
         SKj/WwGiSuPqWRG9fKc3fp5+DQNgbeUOSv3U0pyhYCbLtFRkUsCJdKwTYl7IEoV1+txW
         BPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SVR2eN/8DGiy/V1JHUR96/GaDSzjKtaVBwZ1h8GZUN0=;
        b=RJ6fPOm6dkvZX+HlvJbdG7UmK+92yojmtVswOlpDeUjEqHioX8egjMj3wpHTr5KVT7
         X2ny3fEeqVHrEVKl0tMmm5rJ3qbm3cxzO5hxgcRP+foa/qU2pqLa+aP8pSyd/NfdN3Y/
         VdrXD0JG/P/Fi4f3S/kOhH+Bs3XFTVrGolOZtxguy9lTz/fCZUNgLeVqPR4zqbxj2ucv
         SSAHjW4mplSmVa81ShU3eHdZGeXIug6nSLdqb3dK+LTfHq/EmCYs9bTEGO0Qb2d/Dq8b
         mMSUBg2DNLmJqk3kofcXY7s3OWrCb8bwpp7zHIo/QjwodhFQ84JzWWGdgFg0YlgUgCoz
         eDzQ==
X-Gm-Message-State: AOAM532O5GtT0BZUyIaACogMwiC9jVg7ToIZUr6Cu1X3IE7ROu3y4X2O
        1bBExu4GFyXTonhPgcuAx6Hj9WO4eFE=
X-Google-Smtp-Source: ABdhPJxK9Xr35G5Tb9LyWMJhEbLRDKeNHIScNazBc5xFbZnU/yYYo9l8G376bIhW8g2jw9Gfk1VhbQ==
X-Received: by 2002:a05:6830:1af6:: with SMTP id c22mr14123458otd.291.1618023407436;
        Fri, 09 Apr 2021 19:56:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j10sm882405oos.27.2021.04.09.19.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 19:56:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: mtk: support pre-timeout when the bark irq is
 available
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <ANUA4QBkDhibiES5bK7X8Ko8.3.1618022553315.Hmail.wangqing@vivo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <95861c15-0294-ddda-6080-ca15f19eb048@roeck-us.net>
Date:   Fri, 9 Apr 2021 19:56:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ANUA4QBkDhibiES5bK7X8Ko8.3.1618022553315.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/9/21 7:42 PM, 王擎 wrote:
> 
>> On 4/9/21 2:55 AM, Wang Qing wrote:
>>> Use the bark interrupt as the pretimeout notifier if available.
>>>
>>> By default, the pretimeout notification shall occur one second earlier
>>> than the timeout.
>>>
>>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>>> ---
>>>  drivers/watchdog/mtk_wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>> index 97ca993..8b919cc
>>> --- a/drivers/watchdog/mtk_wdt.c
>>> +++ b/drivers/watchdog/mtk_wdt.c
>>> @@ -25,6 +25,7 @@
>>>  #include <linux/reset-controller.h>
>>>  #include <linux/types.h>
>>>  #include <linux/watchdog.h>
>>> +#include <linux/interrupt.h>
>>>  
>>>  #define WDT_MAX_TIMEOUT		31
>>>  #define WDT_MIN_TIMEOUT		1
>>> @@ -234,18 +235,35 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>>>  	int ret;
>>>  
>>> -	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>>> +	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout - wdt_dev->pretimeout);
>>
>> That looks suspiciously like the real watchdog won't happen at all.
>> What will happen if the pretimeout governor is set to none ?
>>
>> Guenter
>>
> The pretimeout governor is panic by default. If pretimeout is enabled and the governor is
> set to none, it means the timeout behavior does not need to be processed, only printing.
> 

That was not my question. My question was if the real timeout happens in that case.

Guenter

