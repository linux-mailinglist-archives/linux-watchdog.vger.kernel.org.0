Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED0228D85B
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Oct 2020 04:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgJNCOR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Oct 2020 22:14:17 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39796 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbgJNCOQ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Oct 2020 22:14:16 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C4ED4804279DE037329C;
        Wed, 14 Oct 2020 10:14:14 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.134) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 14 Oct 2020
 10:14:10 +0800
Subject: Re: [PATCH 1/1] watchdog: remove unneeded inclusion of
 <uapi/linux/sched/types.h>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-watchdog <linux-watchdog@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20200827062154.1847-1-thunder.leizhen@huawei.com>
 <55ad40ff-dcc1-5051-65d2-24201c471a8f@roeck-us.net>
 <f80cc7ea-9d1f-64a4-7c18-faf672bf8cf6@huawei.com>
 <18762ecb-9b47-18ed-6fbf-7cb4ee561a10@roeck-us.net>
 <1098f1d5-0c36-d5b4-741a-4f2f6f42b428@huawei.com>
Message-ID: <fd1d675e-4d7d-6d4f-64bc-feee23161b6d@huawei.com>
Date:   Wed, 14 Oct 2020 10:14:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1098f1d5-0c36-d5b4-741a-4f2f6f42b428@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 2020/9/8 11:34, Leizhen (ThunderTown) wrote:
> 
> 
> On 2020/9/8 10:40, Guenter Roeck wrote:
>> On 9/7/20 12:50 AM, Leizhen (ThunderTown) wrote:
>>> Hi, Wim Van Sebroeck, Guenter Roeck:
>>>   What's your opinion? Guenter Roeck given "Reviewed-by" two weeks ago.
>>>
>>
>> The patch is in my watchdog-next branch, and Wim usually picks it up
>> from there.
> 

Hi, Guenter:
  Have you sent [GIT PULL] updates for 5.10, I don't see this patch in linux-next.

> Oh, thanks.
> 
>>
>> Guenter
>>
>>>
>>> On 2020/8/27 21:40, Guenter Roeck wrote:
>>>> On 8/26/20 11:21 PM, Zhen Lei wrote:
>>>>> There has been no reference to "struct sched_param" since
>>>>> commit 94beddacb53c ("sched,watchdog: Convert to sched_set_fifo()"), so
>>>>> there's no need to include <uapi/linux/sched/types.h> any more, delete
>>>>> it.
>>>>>
>>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>>
>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>>> ---
>>>>>  drivers/watchdog/watchdog_dev.c | 2 --
>>>>>  1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
>>>>> index 6798addabd5a067..0f18fa2433310b0 100644
>>>>> --- a/drivers/watchdog/watchdog_dev.c
>>>>> +++ b/drivers/watchdog/watchdog_dev.c
>>>>> @@ -43,8 +43,6 @@
>>>>>  #include <linux/watchdog.h>	/* For watchdog specific items */
>>>>>  #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
>>>>>  
>>>>> -#include <uapi/linux/sched/types.h>	/* For struct sched_param */
>>>>> -
>>>>>  #include "watchdog_core.h"
>>>>>  #include "watchdog_pretimeout.h"
>>>>>  
>>>>>
>>>>
>>>>
>>>>
>>>
>>
>>
>>

