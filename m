Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641613224CA
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Feb 2021 04:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhBWD7d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 22:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhBWD7c (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 22:59:32 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD83AC061574;
        Mon, 22 Feb 2021 19:58:52 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id t5so952283pjd.0;
        Mon, 22 Feb 2021 19:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wTgq6ECYl3IbuIikvT9+1eErs3t8engi8mR5GYjryTM=;
        b=t9aNAL3Mj69YpsxG9fqHx3bVmTTwBWNHbwD/gLrmduWh+/48/IzA4O29ObY4gO1aL9
         7oONpNWC2myO6LBpZGzJoeoAVwyTSYOKSI8uUPAR8/4rmePJzH9oZMDAi2T0/k2hfOwW
         /v9H2pp5K2FVyZ7b6B68JI8bsYIck+X5HJV3Hb9LggflJaOpyjj+Gx5/oPzuWBEhwO1S
         ftAldgouLGuy+5vXmvdB2J3HU2VdIow/S5vX6Se4OQmRrrPYWop4KiSOB0g+KFr/T+LZ
         eS/EPWI0uC701vay5P9pqwNp9SUkgYxageZgY7nCwnwLZ6rss47FcjwPMLjtdjWzdFAP
         lC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wTgq6ECYl3IbuIikvT9+1eErs3t8engi8mR5GYjryTM=;
        b=bNV38tez6juwjX+U9ArGk4IQflb8HZ7Z1zISRzXJpNFgLKKmjXK3Ots8DcKvXVT6YT
         uBPwv9u/y1+EN8wxAoTvOH2Osri0x5xqIZROHS4c85iX98+N+5kNcfXxDBTU+PHRXbbn
         s7IEfiDxbS7ahLF60RUJ/tMUHdi1kZTPB8v9KwM/jidgR9BAFJA52H3HJvdxGPOtiuX3
         02QzgY+M0lWNxLWSTFRDWGO7aUHXH1wkzix1bLl+mcTTvoQo3thkS9SLnMUYMkjhR73I
         QxMkCb3X8mb7CZrxsvvDHc+9NhhtloJWErig1DedBRlxOtT/eIfayOwz5hc7sGfanw+Q
         LSjQ==
X-Gm-Message-State: AOAM5315yiav5ZMXzE2/yFjGwmIzfN7HnBZQySfx/j1G/1wOUO8YqGc4
        KgKG3JUVezFezh44wv/phEHL6PyMFaw=
X-Google-Smtp-Source: ABdhPJxx3Rzu4StyIOPxp0Pr9nEadvy3L5Ml+WzWDhr19TkRTZ21KxYytlWvYT0Ei/Ka9KT/w+tVlw==
X-Received: by 2002:a17:902:e812:b029:e3:9877:7c38 with SMTP id u18-20020a170902e812b02900e398777c38mr575350plg.49.1614052730667;
        Mon, 22 Feb 2021 19:58:50 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t17sm21817473pgk.25.2021.02.22.19.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 19:58:50 -0800 (PST)
Subject: Re: [PATCH] watchdog: bcm7038_wdt: add big endian support
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9381ef9e-a569-9bcd-5546-a48922e4961d@roeck-us.net>
 <80DB1B7E-D719-4597-A2B7-7CAD592E1B19@gmail.com>
 <20210222222447.GA177866@roeck-us.net>
 <339490a4-4ccd-0d83-b6d7-8732bf39608a@gmail.com>
Message-ID: <651a9064-cfe5-19ea-e6db-90d959ff1c54@gmail.com>
Date:   Mon, 22 Feb 2021 19:58:48 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <339490a4-4ccd-0d83-b6d7-8732bf39608a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 2/22/2021 7:41 PM, Florian Fainelli wrote:
> 
> 
> On 2/22/2021 2:24 PM, Guenter Roeck wrote:
>> On Mon, Feb 22, 2021 at 10:48:09PM +0100, Álvaro Fernández Rojas wrote:
>>> Hi Guenter,
>>>
>>>> El 22 feb 2021, a las 22:24, Guenter Roeck <linux@roeck-us.net> escribió:
>>>>
>>>> ﻿On 2/22/21 12:03 PM, Álvaro Fernández Rojas wrote:
>>>>> bcm7038_wdt can be used on bmips (bcm63xx) devices too.
>>>>>
>>>> It might make sense to actually enable it for BCM63XX.
>>>
>>> bcm63xx SoCs are supported in bcm63xx and bmips.
>>> bcm63xx doesn’t have device tree support, but bmips does and this watchdog is already enabled for bmips.
>>>
>>
>> Maybe add a note saying that this will only be supported for devicetree
>> based systems.
>>
>>>>
>>>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>>>> ---
>>>>> drivers/watchdog/bcm7038_wdt.c | 30 ++++++++++++++++++++++++------
>>>>> 1 file changed, 24 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
>>>>> index 979caa18d3c8..62494da1ac57 100644
>>>>> --- a/drivers/watchdog/bcm7038_wdt.c
>>>>> +++ b/drivers/watchdog/bcm7038_wdt.c
>>>>> @@ -34,6 +34,24 @@ struct bcm7038_watchdog {                                 
>>>>>
>>>>> static bool nowayout = WATCHDOG_NOWAYOUT;
>>>>>
>>>>> +static inline void bcm7038_wdt_write(unsigned long data, void __iomem *reg)
>>>>> +{
>>>>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>>>>> +    __raw_writel(data, reg);
>>>>> +#else
>>>>> +    writel(data, reg);
>>>>> +#endif
>>>>> +}
>>>>> +
>>>>> +static inline unsigned long bcm7038_wdt_read(void __iomem *reg)
>>>>> +{
>>>>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>>>>> +    return __raw_readl(reg);
>>>>> +#else
>>>>> +    return readl(reg);
>>>>> +#endif
>>>>> +}
>>>>> +
>>>>
>>>> This needs further explanation. Why not just use __raw_writel() and
>>>> __raw_readl() unconditionally ? Also, is it known for sure that,
>>>> say, bmips_be_defconfig otherwise uses the wrong endianness
>>>> (vs. bmips_stb_defconfig which is a little endian configuration) ?
>>>
>>> Because __raw_writel() doesn’t have memory barriers and writel() does.
>>> Those configs use the correct endiannes, so I don’t know what you mean...
>>>
>> So are you saying that it already works with bmips_stb_defconfig 
>> (because it is little endian), that bmips_stb_defconfig needs memory
>> barriers, and that bmips_be_defconfig doesn't need memory barriers ?
>> Odd, but I'll take you by your word. And other code does something
>> similar, so I guess there must be a reason for it.
> 
> It would be so nice to copy people, and the author of that driver who
> could give you such an answer. Neither bmips_be_defconfig nor
> bmips_stb_defconfig require barrier because the bus interface towards
> registers that is used on those SoCs is non-reordering non-buffered.

I should mention though that using __raw_writel() with an ARM big-endian
would not work which is why {read,write}l_relaxed() should be preferred
such that all combinations work. A good example that has been proven to
work on BMIPS BE/LE and ARM BE/LE is bcmgenet.c
-- 
Florian
