Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E499225F44E
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Sep 2020 09:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgIGHuZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Sep 2020 03:50:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:10824 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726443AbgIGHuX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Sep 2020 03:50:23 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8FF7D959581DFC30C317;
        Mon,  7 Sep 2020 15:50:20 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.253) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Sep 2020
 15:50:18 +0800
Subject: Re: [PATCH 1/1] watchdog: remove unneeded inclusion of
 <uapi/linux/sched/types.h>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-watchdog <linux-watchdog@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20200827062154.1847-1-thunder.leizhen@huawei.com>
 <55ad40ff-dcc1-5051-65d2-24201c471a8f@roeck-us.net>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <f80cc7ea-9d1f-64a4-7c18-faf672bf8cf6@huawei.com>
Date:   Mon, 7 Sep 2020 15:50:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <55ad40ff-dcc1-5051-65d2-24201c471a8f@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Wim Van Sebroeck, Guenter Roeck:
  What's your opinion? Guenter Roeck given "Reviewed-by" two weeks ago.


On 2020/8/27 21:40, Guenter Roeck wrote:
> On 8/26/20 11:21 PM, Zhen Lei wrote:
>> There has been no reference to "struct sched_param" since
>> commit 94beddacb53c ("sched,watchdog: Convert to sched_set_fifo()"), so
>> there's no need to include <uapi/linux/sched/types.h> any more, delete
>> it.
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
>> ---
>>  drivers/watchdog/watchdog_dev.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
>> index 6798addabd5a067..0f18fa2433310b0 100644
>> --- a/drivers/watchdog/watchdog_dev.c
>> +++ b/drivers/watchdog/watchdog_dev.c
>> @@ -43,8 +43,6 @@
>>  #include <linux/watchdog.h>	/* For watchdog specific items */
>>  #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
>>  
>> -#include <uapi/linux/sched/types.h>	/* For struct sched_param */
>> -
>>  #include "watchdog_core.h"
>>  #include "watchdog_pretimeout.h"
>>  
>>
> 
> 
> 

