Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F0A36A24A
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 19:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhDXRH6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 13:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbhDXRH4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 13:07:56 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA91C061574;
        Sat, 24 Apr 2021 10:07:17 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id u21-20020a0568301195b02902a2119f7613so1204187otq.10;
        Sat, 24 Apr 2021 10:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d4NnKzhKkn7UShTJKGF/Zr37XZCZgMIbulj2rR2q0ks=;
        b=hS4iA2+EcrPmLo4kNU+WxWR51TRi/zkDHNzKgHYgdtRZJiomMot9lG53poFaKM4KHU
         sbMSIcITzK9MDeYzwVb5lp+Yk8vbnTucmJJmZiXjR1ZbrJrl8qFTs+pu36ptL03/h0I7
         d35J8TRu9nY5cgQxXcBUuyehhrzhRWAzmBqAqWM32qXOmM24Xrw8WMxTFig3xSKrOL7g
         btP9VfB7qwEBkeuxQVA+Vb9q5LikQspR5UqRH8jIAyWbRJ0D/5tHXEtq024b4rDuEjCX
         u3X+wB3ikBD0uK4iiW9bhf8ls7y+YfP9FwTkxpYwlPoFVHluvI6Iuvpue1+ez0CRbcWC
         d6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=d4NnKzhKkn7UShTJKGF/Zr37XZCZgMIbulj2rR2q0ks=;
        b=OruVXbZYOHwZaWDe5Joj2ty3Mjlig0ZQ93VLxmI5AALwd4vbtHRYcwZxneDZ585Gtx
         QqRoo4vzhYfxkBP4v/2c/UWNVfYzC3pLIdSYnDE3WqHioTbGypmLFWT3JglolNUmQH0T
         7Hx6k67wWVqyXmGZL+Au9QmfS70Dey1R4njkApYTcHR1kXfgIs+V/mKscBDGplevPfAn
         OgA5kdNSqwuz7ACwsDm4/mIalGDCZjOniWHqBDyFZwdbDv/GqbBy6ae9VLTh8qQtkMfq
         +Rikct33xbMdqs76VmER1r7yW0O4aKuHU7zRabqrZlrkE4oNmDMLxBdgXQX6EKsEPBO/
         NWrA==
X-Gm-Message-State: AOAM532zBtmBe5OHgpywB5C1/oAiT/LQXTjboHYdQl/6BlAKc4dDVmml
        cHA56JjfQTrd3fm/ES+qYOQ=
X-Google-Smtp-Source: ABdhPJz7D+4t4GVcINcM8EteMlcFXCPAknsgmtePCelsGlaFcBOGi8GWQEEOfmLOm3QcfHqIuyJlcg==
X-Received: by 2002:a05:6830:1204:: with SMTP id r4mr7575087otp.358.1619284036446;
        Sat, 24 Apr 2021 10:07:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p22sm2235908otf.25.2021.04.24.10.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 10:07:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
To:     Peter.Enderborg@sony.com, wim@linux-watchdog.org,
        akpm@linux-foundation.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        shakeelb@google.com
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
 <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
 <ed9e0944-fc75-6705-98ea-3f6cf86f5053@sony.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ded189ad-6c94-1063-45f8-1818462b7c69@roeck-us.net>
Date:   Sat, 24 Apr 2021 10:07:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ed9e0944-fc75-6705-98ea-3f6cf86f5053@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/24/21 8:27 AM, Peter.Enderborg@sony.com wrote:
> On 4/24/21 4:41 PM, Guenter Roeck wrote:
>> On 4/24/21 3:25 AM, Peter Enderborg wrote:
>>> This is not a rebooting watchdog. It's function is to take other
>>> actions than a hard reboot. On many complex system there is some
>>> kind of manager that monitor and take action on slow systems.
>>> Android has it's lowmemorykiller (lmkd), desktops has earlyoom.
>>> This watchdog can be used to help monitor to preform some basic
>>> action to keep the monitor running.
>>>
>>> It can also be used standalone. This add a policy that is
>>> killing the process with highest oom_score_adj and using
>>> oom functions to it quickly. I think it is a good usecase
>>> for the patch. Memory siuations can be problematic for
>>> software that monitor system, but other prolicys can
>>> should also be possible. Like picking tasks from a memcg, or
>>> specific UID's or what ever is low priority.
>>> ---
>> NACK. Besides this not following the new watchdog API, the task
>> of a watchdog is to reset the system on failure. Its task is most
>> definitely not to re-implement the oom killer in any way, shape,
>> or form.
>>
>> Guenter
> 
> Do you have better idea where the re-invented wheel might
> fit better if it not for watchdog API?
> 

The watchdog subsystem does support pretimeouts and a variety
of configurable pretimeout notifiers. A pretimeout notifier which
invokes the oom killer might be something worth discussing, though
it would require an audience large enough to determine if it really
makes sense (instead of improving the existing oom killer itself).

A possible alternative might be to introduce watchdog pretimeout
callbacks; this has actually be proposed in another context but
without upstream user. The oom killer could then subscribe to
watchdog pretimeouts and perform the action suggested here if
a pretimeout is observed. Again, such an approach might be worth
discussing with a larger audience.

Thanks,
Guenter
