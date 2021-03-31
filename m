Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E865734F668
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Mar 2021 03:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhCaBx1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Mar 2021 21:53:27 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15408 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233072AbhCaBxN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Mar 2021 21:53:13 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F98S15rdzzlWFn;
        Wed, 31 Mar 2021 09:51:29 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.202) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Wed, 31 Mar 2021
 09:53:09 +0800
Subject: Re: [PATCH 1/1] watchdog: dw_wdt: Remove duplicated header file
 inclusion
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog <linux-watchdog@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210327012028.1606-1-thunder.leizhen@huawei.com>
 <28b7616a-daa7-e944-8c0f-640eddaaebc8@roeck-us.net>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <fe4808f6-a628-7126-5d9c-d0132a0e97fc@huawei.com>
Date:   Wed, 31 Mar 2021 09:53:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <28b7616a-daa7-e944-8c0f-640eddaaebc8@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 2021/3/28 3:50, Guenter Roeck wrote:
> On 3/26/21 6:20 PM, Zhen Lei wrote:
>> The header file <linux/kernel.h> is already included above and can be
>> removed here.
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> 
> Already submitted:
> 
> https://patchwork.kernel.org/project/linux-watchdog/patch/20210325112916.865510-1-wanjiabing@vivo.com/
> 
> In general, when removing duplicate or unnecessary header files,
> please retain or improve alphabetic order. This patch makes it worse.

Okay, thanks for the heads-up. I'll pay attention next time.

> 
> Guenter
> 
>> ---
>>  drivers/watchdog/dw_wdt.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
>> index 32d0e1781e63c4e..b1642e2d9175584 100644
>> --- a/drivers/watchdog/dw_wdt.c
>> +++ b/drivers/watchdog/dw_wdt.c
>> @@ -19,7 +19,6 @@
>>  #include <linux/delay.h>
>>  #include <linux/err.h>
>>  #include <linux/io.h>
>> -#include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/moduleparam.h>
>>  #include <linux/interrupt.h>
>>
> 
> 
> .
> 

