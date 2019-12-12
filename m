Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBE911D584
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 19:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730396AbfLLS2z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Dec 2019 13:28:55 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39664 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730387AbfLLS2y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Dec 2019 13:28:54 -0500
Received: by mail-ed1-f65.google.com with SMTP id v16so2632048edy.6;
        Thu, 12 Dec 2019 10:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rxgoHR5J2Qe8HfpDYXAiZBhrfiy6CgVWq6a9/HkC3MY=;
        b=LLuOSsS7V9ZoDdPhJtwGYTkp6PcGa1J8G1CN6xPN7aSOsNM4veyaprlKLIYGqnx83L
         J5p+sSr6uWKqDxPsJ73of4T78CQ37GhEB3MrrOqyg8BhxAvWekAX53XlAwwY8RngU7LK
         +6FxmzEVVwbapOWMPC8Z7tle/48oK7HwuN91M860Lmv5oBk/d16Jvs970W6kANsm5s4E
         bVYhGP7iLsONNw1dgjPpJ61BrpNSWY22iqKjLztP7fN9Bcfay/KRxQYAus+aunOMlvNp
         N9CxsoyNlkNQG6yW5XMFiXZNXm16OmZUCsqu+mZ25UPV7MqS/jQowu3b+ofiFI9j98Y/
         pDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rxgoHR5J2Qe8HfpDYXAiZBhrfiy6CgVWq6a9/HkC3MY=;
        b=AG5hgaHOQLCjLDstJ2/j1hEedcSz67sfIKp4H4sQR4ZqlawpkBI/ktWPMkta9i8Qfs
         Hifg8S3ewbkmDcPOzlRyTwT178ANTkmYHm7SBDSS+xJ8Yr2WCXV1+DkCtr7EWiNxfhKf
         wzQ7Wu4awqKGYLKwKemv/zCM93+o8Vf7nhGh6OB8ifVXrnMpUPeELTK0CU+KgHVNJQxq
         HxIOvxeUMXLvn1MAaPhvCtcNxlo3QXGj1i0s2UE3agaBiMdU9URIACrzwhl9Ybh4DIaO
         LSvX73ErbS4tWnPKsOMjGoUXhDq52vZi/0jDQIBqcdbU5MvYuKheyOd5QlKsHnxgz7gp
         0tpA==
X-Gm-Message-State: APjAAAUluHtrnN9BfzTbueca4RzEA9ODQm5mgkKLU/L4o2kyl44bRr3o
        apLeVvkwbulHAJg/Svzvc80=
X-Google-Smtp-Source: APXvYqyGnM/yAvIokjmDl5wh/sBSvqMZKnail/qemB/IqxXAxEtbQOMlJxpz95CAh/Xh4dnHqzm3wQ==
X-Received: by 2002:a17:906:5808:: with SMTP id m8mr3592245ejq.1.1576175332073;
        Thu, 12 Dec 2019 10:28:52 -0800 (PST)
Received: from [10.67.50.53] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n3sm183146ejj.29.2019.12.12.10.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 10:28:51 -0800 (PST)
Subject: Re: [PATCH 1/2] watchdog: mtx-1: Drop au1000.h header inclusion
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@linux-mips.org, Paul Burton <paulburton@kernel.org>,
        Denis Efremov <efremov@linux.com>
References: <20191211210204.31579-1-f.fainelli@gmail.com>
 <20191211210204.31579-2-f.fainelli@gmail.com>
 <21b7be75-db61-3b14-c57c-04af0b78b347@roeck-us.net>
 <3fdc99fa-f75c-33d4-e1c4-ec8ad185e2cd@gmail.com>
 <20191212181902.GA31779@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <1bb1d080-b13e-e785-5ea7-760e5ac215f0@gmail.com>
Date:   Thu, 12 Dec 2019 10:28:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212181902.GA31779@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/12/19 10:19 AM, Guenter Roeck wrote:
> On Wed, Dec 11, 2019 at 07:38:29PM -0800, Florian Fainelli wrote:
>>
>>
>> On 12/11/2019 5:35 PM, Guenter Roeck wrote:
>>> On 12/11/19 1:02 PM, Florian Fainelli wrote:
>>>> Including au1000.h from the machine specific header directory prevents
>>>> this driver from being built on any other platforms (MIPS included).
>>>> Since we do not use any definitions, drop it.
>>>>
>>>> Reported-by: Denis Efremov <efremov@linux.com>
>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>> ---
>>>>   drivers/watchdog/mtx-1_wdt.c | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
>>>> index 25a92857b217..aeca22f7450e 100644
>>>> --- a/drivers/watchdog/mtx-1_wdt.c
>>>> +++ b/drivers/watchdog/mtx-1_wdt.c
>>>> @@ -41,8 +41,6 @@
>>>>   #include <linux/uaccess.h>
>>>>   #include <linux/gpio/consumer.h>
>>>>   -#include <asm/mach-au1x00/au1000.h>
>>>> -
>>>>   #define MTX1_WDT_INTERVAL    (5 * HZ)
>>>>     static int ticks = 100 * HZ;
>>>>
>>>
>>> Given that this is nothing but yet another gpio watchdog driver, I'd
>>> personally rather have it merged with gpio_wdt.c. On a higher level,
>>> cleaning up old-style watchdog drivers, without converting them to
>>> using the watchdog core, is a waste of time.
>>
>> If that makes you feel any better, I was not planning on going further
>> than that, and yes, removing this driver and using gpio_wdt.c would be
>> the way to go, this driver greatly predates gpio_wdt.c and I have since
>> then not had access to my MTX-1 platforms which is why this did not
>> happen. We can attempt a "blind conversion" without testing, but what
>> good would that make, not sure.
>>
> 
> It sounds like this is a purely cosmetical change to improve test build
> coverage for a more or less obsolete driver. No, that doesn't make me feel
> better; I get way too many of those lately. Worse, some of those test build
> "improvements" actually end up breaking real builds, which then costs me
> and others even more time to track down.
> 
> We should really discourage that. Is there some challenge going on somewhere,
> along the line of "improve test build coverage" ?

Not really, the only challenge would be access to the original hardware
in order to remove the driver and migrate over to gpio_wdt, which is low
risk, but the watchdog on that platform has bitten me before.
-- 
Florian
