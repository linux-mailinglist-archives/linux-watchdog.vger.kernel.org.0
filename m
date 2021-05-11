Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DA0379F7B
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 08:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhEKGER (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 02:04:17 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2689 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhEKGEQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 02:04:16 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfS2Q0M7tz1BLFT;
        Tue, 11 May 2021 14:00:30 +0800 (CST)
Received: from [10.67.77.175] (10.67.77.175) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 11 May 2021
 14:02:59 +0800
Subject: Re: [PATCH] watchdog: sbsa: Support architecture version 1
To:     Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Al Stone <al.stone@linaro.org>,
        Jianchao Hu <hujianchao@hisilicon.com>,
        Huiqiang Wang <wanghuiqiang@huawei.com>
References: <1620618117-20135-1-git-send-email-zhangshaokun@hisilicon.com>
 <87833e5a-978a-aac5-fc4b-1a922864066b@roeck-us.net>
 <bf9e1b65-119b-d027-fc3d-8491cbc38cde@hisilicon.com>
 <669e1175-2eee-6c4b-8524-c672626022b6@roeck-us.net>
 <fb880396-4c30-78ff-2c1f-62ad4fef935f@hisilicon.com>
 <65876276-ddd5-7e1c-c0e3-d94c316f2d93@roeck-us.net>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <ef4ae3e7-21bf-4f47-57a4-7da681fe6a40@hisilicon.com>
Date:   Tue, 11 May 2021 14:03:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <65876276-ddd5-7e1c-c0e3-d94c316f2d93@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.77.175]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On 2021/5/11 11:52, Guenter Roeck wrote:
> On 5/10/21 7:49 PM, Shaokun Zhang wrote:
>> Hi Guenter,
>>
>> On 2021/5/10 21:16, Guenter Roeck wrote:
>>> On 5/10/21 1:25 AM, Shaokun Zhang wrote:
>>>> Hi Guenter,
>>>>
>>>> On 2021/5/10 12:25, Guenter Roeck wrote:
>>>>> On 5/9/21 8:41 PM, Shaokun Zhang wrote:
>>>>>> Arm Base System Architecture 1.0[1] has introduced watchdog
>>>>>> revision 1 that increases the length the watchdog offset
>>>>>
>>>>> Is that how they call the watchdog count register ?
>>>>>
>>>>
>>>> I think yes.
>>>>
>>>>> Also, doesn't that mean that the maximum timeout supported
>>>>> by the hardware is now larger ?
>>>>
>>>> No, maximum timeout is the same. But the clock can be higher than
>>>> before. For Armv8.6, The frequency of CNTFRQ_EL0 is standardized to
>>>> a frequency of 1GHz which will set gwdt->clk. If the timeout is
>>>> greater than 4(second), the 32-bit counter(WOR) is not enough.
>>>>
>>>
>>> The maximuma timeout is limited with
>>>
>>> wdd->max_hw_heartbeat_ms = U32_MAX / gwdt->clk * 1000;
>>>> You did not update that calculation. That means that the maximuma
>>> timeout is still U32_MAX / gwdt->clk * 1000, which still fits
>>> into 32 bit.
>>
>> Correct, I will fix this in next version.
>>
>>>
>>> Please correct me if I am missing something.
>>>
>>
>> My bad, you are right. The maximum timeout shall be
>> 0xFFFF.FFFF.FFFF / 1000.000.000(1GHz) which is larger than before
>> 0xFFFF.FFFF / 100.000.000(100MHz) by the hardware.
>>
>> Can I do like this, after the version is got and check the version?
>>          sbsa_gwdt_set_timeout(wdd, wdd->timeout);
>> +       sbsa_gwdt_get_version(wdd);
>> +       if (wdd->version > 0)
>> +               wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
>>
> 
> I would suggest to set max_hw_heartbeat_ms in one place
> to avoid confusion. Either check the version earlier,
> or move setting both max_hw_heartbeat_ms values
> after the call to sbsa_gwdt_get_version().
> 

Got it, I will follow the former that many members in @wdd are
initialized closely.

Thanks again,
Shaokun

> Thanks,
> Guenter
> 
> .
