Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32BE3681FB
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Apr 2021 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236427AbhDVN5I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Apr 2021 09:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236092AbhDVN5H (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Apr 2021 09:57:07 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFB2C06174A;
        Thu, 22 Apr 2021 06:56:31 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l17so14541966oil.11;
        Thu, 22 Apr 2021 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HZfLafI/IDvNf3tC/EcEnaGMSlDdEftiWqvB2zdaIMs=;
        b=tMyGr+b2P8/zMWY7Cd2ZzlRPUzRewyV7dpglbKrUhh1IjQuVhp7PigSID7j2F7ufVn
         F10j2dg8Z5FpUS5NQWbbfLq79eeGr/h3r+1iXJpfpi3AwC+pXta8ausRU/ilbMeK5eMW
         X3AKtejloWnp9dgv3p10Yc+ujiUnigjIfnsXcXOLl4lbKWKmoJ3acPdnBfPP5QfVM18q
         P5TGAVYXxLVJseQfKDoQChFMkp3idt1R/rmURsAJrpFZzqAr7HgbCZT9XaRVBy4yJ0oW
         t4jx5VZCDO4P197bUH0BiqTgZ+G2+oQFuHc7AZFFqOZIgQ/LnnG4RMZ07yzlFVkzCztk
         ewjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HZfLafI/IDvNf3tC/EcEnaGMSlDdEftiWqvB2zdaIMs=;
        b=OShgjYqV0bSjZ0JWSFKhp2bcgsRme0ZZc5nb7BMUyRxlP3iDtiAX2tI4pCnG24XSmR
         VwWWcmuL+7360KJnH+pHz/GMatW7Ctk++/IlZLw9+ZxqREHmEL5fKXg/2i0oZa/DbRbR
         rMGqG1OF4E13M+SQsitceh0x5JfzeFbyi8OfQi3L4c3BN+SooIqFSVLGWJ0Q8C0hBEa4
         FnEJkUIcThWtLRdso0sVOtFdOKwoirsFRgEyKqbpn9m9ek2R/2LRefinAycKZ/WJ5Vqi
         +XIzix1Hq+c6aPnUhZ4LQMs1CiAo/KCo8BjcBaEPuvBvhEoBO6xoR9mwRDCxCTNsLwEP
         MQtg==
X-Gm-Message-State: AOAM532EKJrKEs+FGW9FVhnqOt0OZfi+2h7rDsLfmy/1X/rEioMXRoQi
        QBIr89zYOaATTX0LnaiCjjEFdQ7T+gs=
X-Google-Smtp-Source: ABdhPJzNHtXVuCLj7dYY6j0LeN6zhR1wn1tTX5qyZupoVL5zfMqVjQxFSSvo3i78MJcfybtu4Hd+5Q==
X-Received: by 2002:aca:3286:: with SMTP id y128mr75632oiy.145.1619099790369;
        Thu, 22 Apr 2021 06:56:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m5sm651589ots.13.2021.04.22.06.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 06:56:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V6 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <AHkAYwDkDhOuqx67*F9EB4r-.3.1619075149689.Hmail.wangqing@vivo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <56f16371-5342-5c71-2393-41258cecb516@roeck-us.net>
Date:   Thu, 22 Apr 2021 06:56:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AHkAYwDkDhOuqx67*F9EB4r-.3.1619075149689.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/22/21 12:05 AM, 王擎 wrote:
> 
>> On 4/21/21 8:46 PM, 王擎 wrote:
>>>
>>>> On 4/21/21 7:45 PM, Wang Qing wrote:
>>>>> Use the bark interrupt as the pretimeout notifier if available.
>>>>>
>>>>> When the watchdog timer expires in dual mode, an interrupt will be
>>>>> triggered first, then the timing restarts. The reset signal will be
>>>>> initiated when the timer expires again.
>>>>>
>>>>> The pretimeout notification shall occur at timeout-sec/2.
>>>>>
>>>>> V2:
>>>>> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
>>>>>
>>>>> V3:
>>>>> - Modify the pretimeout behavior, manually reset after the pretimeout
>>>>> - is processed and wait until timeout.
>>>>>
>>>>> V4:
>>>>> - Remove pretimeout related processing. 
>>>>> - Add dual mode control separately.
>>>>>
>>>>> V5:
>>>>> - Fix some formatting and printing problems.
>>>>>
>>>>> V6:
>>>>> - Realize pretimeout processing through dualmode.
>>>>>
>>>>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>>>>> ---
>>>>>  drivers/watchdog/mtk_wdt.c | 53 +++++++++++++++++++++++++++++++++++++++++-----
>>>>>  1 file changed, 48 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>>>> index 97ca993..ebc648b
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
>>>>> @@ -184,15 +185,22 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>>>>  {
>>>>>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>>>>> +	unsigned int timeout_interval;
>>>>>  	u32 reg;
>>>>>  
>>>>> -	wdt_dev->timeout = timeout;
>>>>> +	timeout_interval = wdt_dev->timeout = timeout;
>>>>> +	/*
>>>>> +	 * In dual mode, irq will be triggered at timeout/2
>>>>> +	 * the real timeout occurs at timeout
>>>>> +	 */
>>>>> +	if (wdt_dev->pretimeout)
>>>>> +		timeout_interval = wdt_dev->pretimeout = timeout/2;
>>>>
>>>> Please run checkpatch --strict and fix what it reports.
>>>> Also, there should be a set_pretimeout function to set the
>>>> pretimeout. It is ok to update it here, but it should be set
>>>> in its own function to make sure that the actual value
>>>> is reported back to userspace.
>>>>
>>>> Thanks,
>>>> Guenter
>>>
>>> The reason why the set_pretimeout interface is not provided is 
>>> because the pretimeout is fixed after the timeout is set,  we need
>>> to modify timeout after setting pretimeout, which is puzzling.
>>>
>>
>> What you need to do is to set pretimeout = timeout / 2 if a pretimeout
>> is set to a value != 0. Just like we adjust timeout to valid values
>> when set, we adjust pretimeout as well. I don't see a problem with that.
>>
>> Guenter
> 
> Thanks, Guenter. But this will complicate the situation:
> First, set_pretimeout will become an interface for dynamically enable and
> disable the pre-timeout func, instead of adjusting the pretimeout time. 
> 
Effectively yes. That is what it is, based on its limitations. That is
not a problem, and in true for every pretimeout function. Set it to 0,
and it is turned off. Set it to a value other than 0, and it is turned on.

> Secondly, when the irq is not registered, the user cannot be allowed to set
> the pretimeout to non-zero. When irq is registered, it doesn't make any sense
> to turn off pre-timeout func. 
> 

That is your opinion. It is still a user decision to turn it on or off,
just like it is a user decision to set the timeout to a specific value
or to enable the watchdog in the first place. There is no reason to
make it mandatory just because an interrupt has been provided
(or, rather, connected).

Also, if the interrupt is not provided, WDIOF_PRETIMEOUT is not set,
and trying to set the pretimeout would return -EOPNOTSUPP.

Guenter
