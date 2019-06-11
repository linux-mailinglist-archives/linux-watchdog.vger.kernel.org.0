Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 831AB3C9A1
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Jun 2019 13:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388630AbfFKLCF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Jun 2019 07:02:05 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37991 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388629AbfFKLCF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Jun 2019 07:02:05 -0400
Received: by mail-pg1-f193.google.com with SMTP id v11so6770968pgl.5;
        Tue, 11 Jun 2019 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FbfnQ+vyxLkky9Y2QN7piyoWYG4+Tbz+gCXalexofB0=;
        b=ZiSHqTWDMwZI2ncl7CzllBTrpA5z72DaPReLrAyt7+0qSTaxxWRNMhzOBWGr1JI56Y
         qi9RpektgZCibhRtOn+ktx8REAZo10rR/7Up+FAMlSZeEPA4XYnHblcrAp13yNegjr6+
         mhPEcJrCIK3boLuR4OMqXbHALynvgH5NNj8SlgpiV0XTMX6sYx8PZxF3iudh0UoVNbFv
         d8U1bEHaqVjqSCV7f7+GCjQT2r2MN5gGUr9wHhOB1csBBZkTvK32Z3w3iOBKWxpgZNnL
         1mJuREZJYHWIY7SdEe+Lcq5ivHJo5SSlSHJga6OAJdxOH09pR4eeN/RfIBkNPEtAaMVX
         q7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FbfnQ+vyxLkky9Y2QN7piyoWYG4+Tbz+gCXalexofB0=;
        b=h/EmZevCOJZQeKnyOeKrZRbqCVh7YMmwlNgMujsKN3dbc92jFY85vYKVTo0b+otLyU
         iBcyMXgsF87DQWzfnfTvL84TlcrL81405dBLSLxZfPL5llUafZKcjgtZ4Au+s4+oIsVt
         5+DiFT9BEwG4gLtvoiBw1DTEbcet9zMsEdeCJkTvxYsjEvoMefzuCYZ+k1iox5rp0xE+
         eT7hbwnPgnlgghw1Zf5jts1r/uIzL++ZkLCquX/pEpGS0KRj95w4YXqu4LxFw2YFaiU4
         4murETaBsq7cPFhnG7TZHmrPEWmgcXoJl5G/MlxYQIzgtczyOOCux4kKO5ffz89Oyb7U
         iXMA==
X-Gm-Message-State: APjAAAXtaTKD5/YWvoHx69sfQH1qXoMprM7L26eN4AqLlzVnwvaDyAUi
        GcGerOtbNwjZ4y76yZq01U0gd5p3
X-Google-Smtp-Source: APXvYqzLrsi7tvCerG4HlwMb+BvOOeMt0VY8IGu1xT+3WGJ2yVlQzaXQjG9a+bLlrRpZPyI/f+tMpQ==
X-Received: by 2002:a63:cc4e:: with SMTP id q14mr19621119pgi.84.1560250924091;
        Tue, 11 Jun 2019 04:02:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e4sm19432780pgi.80.2019.06.11.04.02.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 04:02:03 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] watchdog: jz4740: Make probe function
 __init_or_module
To:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190607162429.17915-1-paul@crapouillou.net>
 <20190607162429.17915-5-paul@crapouillou.net>
 <0dc0fd0a-54fc-5d70-af78-1874b5ece418@c-s.fr>
 <1559987821.1815.0@crapouillou.net>
 <78ef0273-5ec6-f522-428a-8429f40684ca@c-s.fr>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f64db403-f8be-4e39-81e7-515b1c1c0c17@roeck-us.net>
Date:   Tue, 11 Jun 2019 04:02:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <78ef0273-5ec6-f522-428a-8429f40684ca@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/10/19 10:16 PM, Christophe Leroy wrote:
> Hi Paul,
> 
> Le 08/06/2019 à 11:57, Paul Cercueil a écrit :
>> Hi Christophe,
>>
>> Le sam. 8 juin 2019 à 9:51, Christophe Leroy <christophe.leroy@c-s.fr> a écrit :
>>> Hi Paul,
>>>
>>> Le 07/06/2019 à 18:24, Paul Cercueil a écrit :
>>>> This allows the probe function to be dropped after the kernel finished
>>>> its initialization, in the case where the driver was not compiled as a
>>>> module.
>>>
>>> I'm not sure that's what  __init_or_module flag does.
>>>
>>> As far as I understand, this flag makes the function being dropped only when the kernel is built without modules support, ie without CONFIG_MODULES. See https://elixir.bootlin.com/linux/latest/source/include/linux/module.h#L145
>>
>> So it doesn't depend on the driver being built-in or compiled as a module?
> 
> No it doesn't. This flag is for built-in functions that are needed by init and modules init. If the kernel doesn't support modules, it can drop the function after init. If the kernel supports modules, it has to keep the function. That's what this flag is made for.
> 
> If your need is to mark a function so that it gets discarded after init or module init, just mark it __init. If it is built in, it will be dropped after init. If it is in a module, it will be dropped after the module is initialised.
> 
>>
>>> In addition, I'm not sure you can simply define a probe function as __init. What if someone tries to unbind and rebind the device through sysfs for instance ?
>>
>> Ouch. I feel stupid now.
>>
>>> It seems there is a special function called __platform_driver_probe() for registering devices when the probe function is to be in __init, see https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L684
>>
>> Yes, but only usable by drivers that won't defer probe, and it removes the bind/unbind attributes from sysfs,
>> so it shouldn't be used for non-critical drivers, I think.
> 
> I guess it would make sense for watchdog drivers, we don't expect this kind of driver to be unbinded, do we ?
> 

Except for debugging, where it can be extremely useful to be able to do it.

Guenter

> Christophe
> 
>>
>>> Christophe
>>>
>>>>
>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>> ---
>>>>
>>>> Notes:
>>>>      v2: New patch
>>>>
>>>>   drivers/watchdog/jz4740_wdt.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
>>>> index 7519d80c5d05..2061788c1939 100644
>>>> --- a/drivers/watchdog/jz4740_wdt.c
>>>> +++ b/drivers/watchdog/jz4740_wdt.c
>>>> @@ -157,7 +157,7 @@ static const struct of_device_id jz4740_wdt_of_matches[] = {
>>>>   MODULE_DEVICE_TABLE(of, jz4740_wdt_of_matches);
>>>>   #endif
>>>>   -static int jz4740_wdt_probe(struct platform_device *pdev)
>>>> +static int __init_or_module jz4740_wdt_probe(struct platform_device *pdev)
>>>>   {
>>>>       struct device *dev = &pdev->dev;
>>>>       struct jz4740_wdt_drvdata *drvdata;
>>>>
>>
> 

