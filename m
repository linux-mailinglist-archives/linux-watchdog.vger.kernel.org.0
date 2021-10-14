Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADE942DFC6
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Oct 2021 18:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhJNQ6y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Oct 2021 12:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhJNQ6x (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Oct 2021 12:58:53 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72237C061570;
        Thu, 14 Oct 2021 09:56:48 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 62-20020a9d0a44000000b00552a6f8b804so8485170otg.13;
        Thu, 14 Oct 2021 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vDxvJOrUCOzJegufFjD8r64gOrQvZGZRTGeVejWGUUg=;
        b=HuIXF/tEL5LfsI+Un7H7cXc99a1FXYJsxvKu3iOrjPKPnqHwt+3Cq837ISl4ah137j
         hm4WT9iBeDCSmTXBpcMhpzRqCMloxAhqI2/npfIkDogWzrbeC5ZVrhG6RidjCDTBO/bq
         PMbEWdhxbrfVF2C2Cmjbr681PUFDeYIHrgfEqYVyxY1hXeCCPZXlC5E4kc04H849+0xw
         fQqmjc6MvszRGuEUEc9osf5lXHzXcGWQKdBK5QG+tlYkHBKS3Hl58agt1CyNhqun3Idg
         BNxV5iRa9X142+QUatgOQUKvMGqdkrWWR+SYDHJmR20ImsDya7GbkjfpZDJ756upPqEV
         ERsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vDxvJOrUCOzJegufFjD8r64gOrQvZGZRTGeVejWGUUg=;
        b=bISH+3v23TXyEhAS2ZN1Fjzb+9q/d8kL7Zvrf0s2tVPPK1Nr7NZlUWSIXlRUJ8rU1J
         HzCRE4y9gBw5pYdqyT401m12Q9yWZVwUK1APLnqNB1DMFbn99zKRE943ycIswBA0jmZ2
         kdKkAwxkvcyJpD5OICdWnCxrvRkMvnDWphnwY3u4OeAURos96N4Pi3DPcTUGSMVZSIkk
         g1nWTjKfD/dioQIAhK7cmeAVMXb73YDfMMNVxbn8Oi9Ia9CkyuJ5R9S3zhf3huES2yNK
         DhiuS15Th5hjYREJ/Zd3zkRLYt0sxQnBlnMSsYb0zC4B/0Mw6a3U1HMkBpEvZQAGhNFh
         cP0g==
X-Gm-Message-State: AOAM5303Qh493rSrwRgNEIcZwG0RTexHbe1ZbRAVmfXEwH0lnGq/9Vbg
        SVrM+XUWQhdnuD/OrtvMWY0btQouvI0=
X-Google-Smtp-Source: ABdhPJxpwXfcRsInDOadXloKe0wOu+msYvy2XUeUbofhVvov1LuXG6CZA0IlmgU868NHXSmMYR7E0w==
X-Received: by 2002:a9d:17c4:: with SMTP id j62mr3401295otj.225.1634230607501;
        Thu, 14 Oct 2021 09:56:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z8sm520292oof.47.2021.10.14.09.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 09:56:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1634131707.git.sander@svanheule.net>
 <7eb1e3d8a5bd3b221be0408bd6f0272e6d435ade.1634131707.git.sander@svanheule.net>
 <20211013184852.GA955578@roeck-us.net>
 <4cf85218627371e1d07238257d0a89f824606415.camel@svanheule.net>
 <6b1a9479-c456-ceeb-5aa2-6121f5c5d67f@roeck-us.net>
 <b1c8713cd10358355d4086e6d80ce6f10d295fe8.camel@svanheule.net>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] watchdog: Add Realtek Otto watchdog timer
Message-ID: <c81fd654-011f-0375-7dde-61365c898efb@roeck-us.net>
Date:   Thu, 14 Oct 2021 09:56:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b1c8713cd10358355d4086e6d80ce6f10d295fe8.camel@svanheule.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/14/21 3:26 AM, Sander Vanheule wrote:
> On Wed, 2021-10-13 at 14:03 -0700, Guenter Roeck wrote:
>> On 10/13/21 12:46 PM, Sander Vanheule wrote:
>>> On Wed, 2021-10-13 at 11:48 -0700, Guenter Roeck wrote:
>>>> On Wed, Oct 13, 2021 at 03:29:00PM +0200, Sander Vanheule wrote:
>>> [...]
>>>
>>>>>
>>>>> diff --git a/drivers/watchdog/realtek_otto_wdt.c
>>>>> b/drivers/watchdog/realtek_otto_wdt.c
>>>>> new file mode 100644
>>>>> index 000000000000..64c9cba6b0b1
>>>>> --- /dev/null
>>>>> +++ b/drivers/watchdog/realtek_otto_wdt.c
>>>>> @@ -0,0 +1,411 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +
>>>>> +/*
>>>>> + * Realtek Otto MIPS platform watchdog
>>>>> + *
>>>>> + * Watchdog timer that will reset the system after timeout, using the
>>>>> selected
>>>>> + * reset mode.
>>>>> + *
>>>>> + * Counter scaling and timeouts:
>>>>> + * - Base prescale of (2 << 25), providing tick duration T_0: 168ms @
>>>>> 200MHz
>>>>> + * - PRESCALE: logarithmic prescaler adding a factor of {1, 2, 4, 8}
>>>>> + * - Phase 1: Times out after (PHASE1 + 1) × PRESCALE × T_0
>>>>> + *   Generates an interrupt, WDT cannot be stopped after phase 1
>>>>> + * - Phase 2: starts after phase 1, times out after (PHASE2 + 1) ×
>>>>> PRESCALE × T_0
>>>>> + *   Resets the system according to RST_MODE
>>>>
>>>> Why is there a phase2 interrupt if phase2 resets the chip ?
>>>>
>>>
>>> The SoC's reset controller has an interrupt line for phase2, even though
>>> then it then the
>>> WDT also resets the system. I don't have any documentation about this
>>> peripheral; just
>>> some vendor code and there the phase2 interrupt isn't enabled. I mainly
>>> added it here for
>>> completeness.
>>>
>>
>> It seems pointless to mandate an interrupt just for completeness.
> 
> Okay, then I will just drop it here. As I understand, the bindings should be as
> complete as possible, so I think the phase2 interrupt definition should remain
> there?
> 

I still don't see the point of it if there is no known use case. At the very
least it will need to be optional, but even then I would expect a description
of the use case.

FWIW, technically I suspect that there is a means for the watchdog to generate
a second interrupt instead of resetting the hardware (otherwise the second
interrupt would not really make sense), but without hardware and without
datasheet it is impossible to confirm that.

Guenter

>>
>>> One thing to note is that after CPU or software reset (not SoC reset) the
>>> phase2 flag in
>>> OTTO_WDT_REG_INTR will be set. That's why I always clear it in
>>> otto_wdt_probe(), because
>>> otherwise enabling the interrupt line would trigger otto_wdt_phase2_isr().
>>> On warm
>>> restarts this bit could be used to determine if there was a WDT timeout, but
>>> not if the
>>> WDT is configured for cold restarts (i.e. full SoC reset).
>>>
>>>>
>>> [...]
>>>>> +
>>>>> +       raw_spin_lock_irqsave(&ctrl->lock, flags);
>>>>> +       v = ioread32(ctrl->base + OTTO_WDT_REG_CTRL);
>>>>> +       v |= OTTO_WDT_CTRL_ENABLE;
>>>>> +       iowrite32(v, ctrl->base + OTTO_WDT_REG_CTRL);
>>>>> +       raw_spin_unlock_irqrestore(&ctrl->lock, flags);
>>>>
>>>> Is it really necessary to disable interrupts for those operations ?
>>>
>>> The ISR routines only use REG_INTR, which isn't modified anywhere else
>>> (outside of probing
>>> the device). I will replace these with raw_spin_{lock,unlock} throughout.
>>>
>>
>> In that case you should not need any locks at all since the watchdog core
>> ensures
>> that the device is opened only once (and thus only one entity can enable or
>> disable
>> the watchdog).
> 
> If there is an external guarantee that at most one of {set_timeout,
> set_pretimeout, enable, disable} will be called at a time, I can indeed drop the
> lock. I had added the lock initially because of the read-modify-write operations
> on the control register these ops perform.
> 
> 
>>
>>> [...]
>>>>> +/*
>>>>> + * The timer asserts the PHASE1/PHASE2 IRQs when the number of ticks
>>>>> exceeds
>>>>> + * the value stored in those fields. This means the timer will run for
>>>>> at least
>>>>> + * one tick, so small values need to be clamped to correctly reflect
>>>>> the timeout.
>>>>> + */
>>>>> +static inline unsigned int div_round_ticks(unsigned int val, unsigned
>>>>> int
>>>>> tick_duration,
>>>>> +               unsigned int min_ticks)
>>>>> +{
>>>>> +       return max(min_ticks, DIV_ROUND_CLOSEST(val, tick_duration));
>>>>
>>>> Are you sure that DIV_ROUND_CLOSEST is appropriate in those calculations
>>>> (instead of DIV_ROUND_UP or DIV_ROUND_DOWN) ?
>>>>
>>> [...]
>>>
>>>>> +
>>>>> +       timeout_ms = total_ticks * tick_ms;
>>>>> +       ctrl->wdev.timeout = DIV_ROUND_CLOSEST(timeout_ms, 1000);
>>>>> +
>>>>
>>>> That means the actual timeout (and pretimeout) can be slightly larger
>>>> than the real timeout. Is this really what you want ?
>>>
>>> Is it a problem if the WDT times out later than specified by
>>> watchdog_device.(pre)timeout?
>>> I can see that premature timeouts would be an issue, but I don't suppose
>>> it's problematic
>>> if the WDT is pinged (slightly) sooner than actually required?
>>>
>>
>> I am not concerned with early pings. However, if the timeout limit is set to a
>> value
>> lardger than the real timeout (eg the real timeout is 25.6 seconds and the
>> timeout
>> value is set to 26 seconds), the reset may occur a bit early. Granted, it
>> doesn't
>> matter much, but most driver authors would ensure that the timeout is set to
>> 25 seconds
>> (ie rounded down) in that situation.
> 
> I'll replace tick rounding with DIV_ROUND_UP, and timeout rounding with regular
> flooring division. This results in a few timeout values being rounded up for the
> coarsest tick duration, but those are then stable values.
> 
> Best,
> Sander
> 
>>
>>> The coarsest ticks are 1342 ms, so it is not always possible to provide the
>>> requested
>>> (pre)timeout value, independent of the rounding scheme. Although I think it
>>> should be
>>> possible to replace timeout rounding by DIV_ROUND_UP (of total_ticks_ms),
>>> and pretimeout
>>> rounding by DIV_ROUND_DOWN (of phase2_ticks_ms), and keep stable timeouts
>>> when alternating
>>> between set_timeout/set_pretimeout.
>>>
>>>>
>>>>> +       pretimeout_ms = phase2_ticks * tick_ms;
>>>>> +       ctrl->wdev.pretimeout = DIV_ROUND_CLOSEST(pretimeout_ms, 1000);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int otto_wdt_set_timeout(struct watchdog_device *wdev, unsigned
>>>>> int val)
>>>>> +{
>>>>> +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
>>>>> +       unsigned long flags;
>>>>> +       unsigned int ret;
>>>>> +
>>>>> +       if (watchdog_timeout_invalid(wdev, val))
>>>>> +               return -EINVAL;
>>>>
>>>> This is not supposed to happen because the calling code already performs
>>>> range checks.
>>>
>>> Right, I will drop the redundant check here and in set_pretimeout.
>>>
>>>>
>>> [...]
>>>>> +static int otto_wdt_restart(struct watchdog_device *wdev, unsigned long
>>>>> reboot_mode,
>>>>> +               void *data)
>>>>> +{
>>>>> +       struct otto_wdt_ctrl *ctrl = watchdog_get_drvdata(wdev);
>>>>> +       u32 reset_mode;
>>>>> +       u32 v;
>>>>> +
>>>>> +       devm_free_irq(ctrl->dev, ctrl->irq_phase1, ctrl);
>>>>> +
>>>>
>>>> Why is this needed (instead of, say, disabling the interrupt) ?
>>>
>>> Disabling the interrupt should actually be enough. I'll replace the
>>> devm_free_irq() with
>>> disable_irq(). Somehow I didn't find disable_irq(), even though that was
>>> what I was
>>> looking for...
>>>
>>> [...]
>>>>> +
>>>>> +       /*
>>>>> +        * Since pretimeout cannot be disabled, min_timeout is twice the
>>>>> +        * subsystem resolution. max_timeout is 44s at a bus clock of
>>>>> 200MHz.
>>>>> +        */
>>>>> +       ctrl->wdev.min_timeout = 2;
>>>>> +       max_tick_ms = otto_wdt_tick_ms(ctrl, OTTO_WDT_PRESCALE_MAX);
>>>>> +       ctrl->wdev.max_timeout =
>>>>> +               DIV_ROUND_CLOSEST(max_tick_ms *
>>>>> OTTO_WDT_TIMEOUT_TICKS_MAX, 1000);
>>>>
>>>> Any reason for using max_timeout instead of max_hw_heartbeat_ms ?
>>>
>>> I must have missed this when I was looking at watchdog_device. Makes sense
>>> to use
>>> max_hw_heartbeat_ms since that reflects the actual value more accurately.
>>>
>>>>
>>>
>>> Thanks for the feedback!
>>>
>>> Best,
>>> Sander
>>>
>>
> 

