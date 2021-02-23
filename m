Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6E33224BF
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Feb 2021 04:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhBWDmR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 22:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbhBWDmQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 22:42:16 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE66EC06174A;
        Mon, 22 Feb 2021 19:41:35 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id q20so7930127pfu.8;
        Mon, 22 Feb 2021 19:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xE9Ze+WH2EKjTJXP/D53kBpmyA4MR/yC1eo+XyylITs=;
        b=E7lSwWfT3lyGzG+VczTlJz+0fez2EsTEWoKx96eUxXYlapFk8kA06LcVBQqtG+1v7m
         +QvRI2SRQmolrrphuM6M7shgEf868DBQUQfnzqd4X+rqNoq72KByhouLoaPiYECbVQ64
         pL2otGGJGY90yREaDelwajy9rZ3a8xZiUWYpJYkuuy1pLt/EB2kx5g/BHyUhZ11Pf4L9
         0IfaXT5402lfFvIPtwl7isODGELmNERVtkOS1tQFwFG9NHjyX8HfeX163iAlkRUCqtY+
         llr67xiV+tZE7AjoSUSBwgX9dtDKvBsGoZB1Pm+0bWsPReVRTTEKTBQuc8ZeFJEsZGGq
         is2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xE9Ze+WH2EKjTJXP/D53kBpmyA4MR/yC1eo+XyylITs=;
        b=uUOMkG/8V3f1V0ewF1L15ehhc1Fs2VsBrjMVAgGzUONXtC+JI19/4lAAZZ15RgXiQ8
         6TX7H7Ms+RFDpnJo/efG+mLj5UQwprkk/k/yhHGMnKrZwxEwKrvEbm0BmzvABng4lfKN
         WAOnRyTGw65raMxSw2Gyn+hMlZaxWjUMbLic6jTOipptyb6Yib2/GXxzz9n0WJ/EiOeX
         V7/PKO6ZGUzFlcJpE880fYw57dGrltaLbhXFmXbV7v9tCintAjuD/NSrA8rwzUWBLPPR
         6/wGyBpL554KSjTRUWZvwTsu2qw+IfJC83/Jx6QhZqzWZ3JUrizex/tnlp3CJxPB56t8
         cFmg==
X-Gm-Message-State: AOAM531awFI07vk14SsAy7WsY85U7zm2T30PTCysa1OapTHBTW5wJmvz
        7wfn3LCKlDKRmIwPIAaAA/FV49wIffE=
X-Google-Smtp-Source: ABdhPJxhthnHnJDAntMkty76mEeZSzTpw1Vh5c/o4+rLciIP6hsCPP3wjgyTrRLGYxL1NW9U4jF7vg==
X-Received: by 2002:a65:690a:: with SMTP id s10mr18341572pgq.162.1614051695086;
        Mon, 22 Feb 2021 19:41:35 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id i2sm950853pjj.35.2021.02.22.19.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 19:41:34 -0800 (PST)
Subject: Re: [PATCH] watchdog: bcm7038_wdt: add big endian support
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9381ef9e-a569-9bcd-5546-a48922e4961d@roeck-us.net>
 <80DB1B7E-D719-4597-A2B7-7CAD592E1B19@gmail.com>
 <20210222222447.GA177866@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <339490a4-4ccd-0d83-b6d7-8732bf39608a@gmail.com>
Date:   Mon, 22 Feb 2021 19:41:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222222447.GA177866@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 2/22/2021 2:24 PM, Guenter Roeck wrote:
> On Mon, Feb 22, 2021 at 10:48:09PM +0100, Álvaro Fernández Rojas wrote:
>> Hi Guenter,
>>
>>> El 22 feb 2021, a las 22:24, Guenter Roeck <linux@roeck-us.net> escribió:
>>>
>>> ﻿On 2/22/21 12:03 PM, Álvaro Fernández Rojas wrote:
>>>> bcm7038_wdt can be used on bmips (bcm63xx) devices too.
>>>>
>>> It might make sense to actually enable it for BCM63XX.
>>
>> bcm63xx SoCs are supported in bcm63xx and bmips.
>> bcm63xx doesn’t have device tree support, but bmips does and this watchdog is already enabled for bmips.
>>
> 
> Maybe add a note saying that this will only be supported for devicetree
> based systems.
> 
>>>
>>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>>> ---
>>>> drivers/watchdog/bcm7038_wdt.c | 30 ++++++++++++++++++++++++------
>>>> 1 file changed, 24 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
>>>> index 979caa18d3c8..62494da1ac57 100644
>>>> --- a/drivers/watchdog/bcm7038_wdt.c
>>>> +++ b/drivers/watchdog/bcm7038_wdt.c
>>>> @@ -34,6 +34,24 @@ struct bcm7038_watchdog {                                 
>>>>
>>>> static bool nowayout = WATCHDOG_NOWAYOUT;
>>>>
>>>> +static inline void bcm7038_wdt_write(unsigned long data, void __iomem *reg)
>>>> +{
>>>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>>>> +    __raw_writel(data, reg);
>>>> +#else
>>>> +    writel(data, reg);
>>>> +#endif
>>>> +}
>>>> +
>>>> +static inline unsigned long bcm7038_wdt_read(void __iomem *reg)
>>>> +{
>>>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>>>> +    return __raw_readl(reg);
>>>> +#else
>>>> +    return readl(reg);
>>>> +#endif
>>>> +}
>>>> +
>>>
>>> This needs further explanation. Why not just use __raw_writel() and
>>> __raw_readl() unconditionally ? Also, is it known for sure that,
>>> say, bmips_be_defconfig otherwise uses the wrong endianness
>>> (vs. bmips_stb_defconfig which is a little endian configuration) ?
>>
>> Because __raw_writel() doesn’t have memory barriers and writel() does.
>> Those configs use the correct endiannes, so I don’t know what you mean...
>>
> So are you saying that it already works with bmips_stb_defconfig 
> (because it is little endian), that bmips_stb_defconfig needs memory
> barriers, and that bmips_be_defconfig doesn't need memory barriers ?
> Odd, but I'll take you by your word. And other code does something
> similar, so I guess there must be a reason for it.

It would be so nice to copy people, and the author of that driver who
could give you such an answer. Neither bmips_be_defconfig nor
bmips_stb_defconfig require barrier because the bus interface towards
registers that is used on those SoCs is non-reordering non-buffered.

> 
> Anyway, after looking into that other code, please use something like
> 
>         if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>                 __raw_writel(value, reg);
>         else
>                 writel(value, reg);

Yes please.
-- 
Florian
