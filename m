Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6487F2608B4
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Sep 2020 04:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgIHCkx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Sep 2020 22:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbgIHCkv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Sep 2020 22:40:51 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3249CC061573;
        Mon,  7 Sep 2020 19:40:51 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id h17so12858374otr.1;
        Mon, 07 Sep 2020 19:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ds+6vEl6Yp3tWrOqUKPpbWWKCypA5xj+0xQQv+mXGpc=;
        b=ujrgCmvBPEayO01j5ft6loi8+50afR8jBVH1w9tYCeBAi4/E5zIT5Poh8f6mwAO3cO
         IKuvVmEsvlaWJBsl3yA+nSROtRQrtZGXj5Cwi9c0K73KhIfUBNWuUjrHUd0aw64WR8c6
         hFiAXoqoILmUzXRmnftmxG2qXAEN2RDLzGjrU3ga+d9AUL5jfWnifODUYvOYcI8ZRZ6T
         5sZ+vswEkhxNR+4f2JPyNVjMhKuLsh3GSLbPI0Sgo8Oo8Z7msw4jL/fEZF+deeEJa0VY
         ZGNfcIz8HZo12C5lwNUhzA6Ma/nGctSqKOP9/g0bqDjn6cWaEV/I0xi7rk3G+EBYomY1
         1ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ds+6vEl6Yp3tWrOqUKPpbWWKCypA5xj+0xQQv+mXGpc=;
        b=EvQ888p9KnrlG27fmWDSNgpLtvK/mpSEVag5We9VsiTYXZCJYAArhtiRCNaY8TFEgy
         Bum+hrBVsYMsQjRivN1gmMXMeOXt5yI/3Bitjadz69n4KD/amQCXW6Hhnjageg0dmQcP
         /fD2Rc5O8+KP7ji8fKOEXZ7XzM/Q4tqyrQ1eZw6+uYZga5Sg166sfXMGBZz373g8QDlh
         ZcYAOxNipynFm82Nz8VUf63TMizPG7E3pv4v6y9LOBQhRbmCd9XmTggJ32rquneann3m
         RW/IH5kiIAPD3bun2tv9NZvV/ShXelK8IfQNgZjX8xXpIO+/eRn7e9Lao7aYdSIUx85j
         p+aA==
X-Gm-Message-State: AOAM532TIoG1CJfD052sk/OztgYGzdjyZO9otkPWTCGps7oiBy6LIsAj
        YfodbKVB/Ik7QbZJuwBN2Wce1SebIDg=
X-Google-Smtp-Source: ABdhPJxPwyHOw04oMPCL6Ep899ZfdICxNwM5Y+XnIl+9bYipKTFgB5rliMkGIEnvAkbISIelaP8ujA==
X-Received: by 2002:a9d:75d1:: with SMTP id c17mr2476302otl.59.1599532850366;
        Mon, 07 Sep 2020 19:40:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q15sm3206236ooh.44.2020.09.07.19.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 19:40:49 -0700 (PDT)
Subject: Re: [PATCH 1/1] watchdog: remove unneeded inclusion of
 <uapi/linux/sched/types.h>
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-watchdog <linux-watchdog@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20200827062154.1847-1-thunder.leizhen@huawei.com>
 <55ad40ff-dcc1-5051-65d2-24201c471a8f@roeck-us.net>
 <f80cc7ea-9d1f-64a4-7c18-faf672bf8cf6@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <18762ecb-9b47-18ed-6fbf-7cb4ee561a10@roeck-us.net>
Date:   Mon, 7 Sep 2020 19:40:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f80cc7ea-9d1f-64a4-7c18-faf672bf8cf6@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/7/20 12:50 AM, Leizhen (ThunderTown) wrote:
> Hi, Wim Van Sebroeck, Guenter Roeck:
>   What's your opinion? Guenter Roeck given "Reviewed-by" two weeks ago.
> 

The patch is in my watchdog-next branch, and Wim usually picks it up
from there.

Guenter

> 
> On 2020/8/27 21:40, Guenter Roeck wrote:
>> On 8/26/20 11:21 PM, Zhen Lei wrote:
>>> There has been no reference to "struct sched_param" since
>>> commit 94beddacb53c ("sched,watchdog: Convert to sched_set_fifo()"), so
>>> there's no need to include <uapi/linux/sched/types.h> any more, delete
>>> it.
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>>> ---
>>>  drivers/watchdog/watchdog_dev.c | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
>>> index 6798addabd5a067..0f18fa2433310b0 100644
>>> --- a/drivers/watchdog/watchdog_dev.c
>>> +++ b/drivers/watchdog/watchdog_dev.c
>>> @@ -43,8 +43,6 @@
>>>  #include <linux/watchdog.h>	/* For watchdog specific items */
>>>  #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
>>>  
>>> -#include <uapi/linux/sched/types.h>	/* For struct sched_param */
>>> -
>>>  #include "watchdog_core.h"
>>>  #include "watchdog_pretimeout.h"
>>>  
>>>
>>
>>
>>
> 

