Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDCA263CFC
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Sep 2020 08:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgIJGJb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Sep 2020 02:09:31 -0400
Received: from thoth.sbs.de ([192.35.17.2]:47371 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgIJGJa (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Sep 2020 02:09:30 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08A698gW015304
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Sep 2020 08:09:08 +0200
Received: from [167.87.23.29] ([167.87.23.29])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08A6978D012373;
        Thu, 10 Sep 2020 08:09:07 +0200
Subject: Re: watchdog: sp5100_tco support for AMD V/R/E series
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org,
        "Awan, Arsalan" <Arsalan_Awan@mentor.com>,
        "Hombourger, Cedric" <Cedric_Hombourger@mentor.com>,
        "Farnsworth, Wade" <wade_farnsworth@mentor.com>
References: <15c8913e-9026-2649-9911-71d6f1c79519@siemens.com>
 <f7e3233b-97e4-1f25-e18e-edb39ca86ce9@roeck-us.net>
 <9e270546-7962-932b-2e4c-3c833b7d4b30@siemens.com>
 <a70578a9-4e55-602b-68fe-56a01805965e@roeck-us.net>
 <39327ba6-0eff-3555-124c-64f3f105c9fe@roeck-us.net>
 <cfa0b445-d4c7-94e3-9585-579f0103a7eb@roeck-us.net>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bbb50d5f-869d-3a18-e568-ba541c9a2569@siemens.com>
Date:   Thu, 10 Sep 2020 08:09:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cfa0b445-d4c7-94e3-9585-579f0103a7eb@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 09.09.20 18:04, Guenter Roeck wrote:
> On 9/7/20 1:45 PM, Guenter Roeck wrote:
>> On 9/7/20 12:18 PM, Guenter Roeck wrote:
>>> On 9/7/20 8:46 AM, Jan Kiszka wrote:
>>>> On 07.09.20 17:31, Guenter Roeck wrote:
>>>>> On 9/7/20 4:20 AM, Jan Kiszka wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> Arsalan reported that the upstream driver for sp5100_tco does not work
>>>>>> for embedded Ryzen. Meanwhile, I was able to confirm that on an R1505G:
>>>>>>
>>>>>> [   11.607251] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
>>>>>> [   11.607337] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
>>>>>> [   11.607344] sp5100-tco sp5100-tco: Watchdog hardware is disabled
>>>>>>
>>>>>> ..and fix it:
>>>>>>
>>>>>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>>>>>> index 85e9664318c9..5482154fde42 100644
>>>>>> --- a/drivers/watchdog/sp5100_tco.c
>>>>>> +++ b/drivers/watchdog/sp5100_tco.c
>>>>>> @@ -193,7 +193,8 @@ static void tco_timer_enable(struct sp5100_tco *tco)
>>>>>>  		/* Set the Watchdog timer resolution to 1 sec and enable */
>>>>>>  		sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN3,
>>>>>>  					  ~EFCH_PM_WATCHDOG_DISABLE,
>>>>>> -					  EFCH_PM_DECODEEN_SECOND_RES);
>>>>>> +					  EFCH_PM_DECODEEN_SECOND_RES |
>>>>>> +					  EFCH_PM_DECODEEN_WDT_TMREN);
>>>>>
>>>>> Confusing. The register in question is a 32-bit register, but only a byte
>>>>> is written into it. Bit 24-25 are supposed to be the resolution, bit 25-26
>>>>> set to 0 enable the watchdog. Bit 7 is supposed to enable MMIO decoding.
>>>>> This is from AMD Publication 52740. So something in the existing code
>>>>> is (or seems to be) wrong, but either case I don't see how setting bit 7
>>>>> (or 31 ?) would enable the watchdog hardware.
>>>>>
>>>>> Hmm, I wrote that code. Guess I'll need to to spend some time figuring out
>>>>> what is going on.
>>>>
>>>> The logic came from [1] which inspired [2] - that's where I pointed out
>>>> the large overlap with the existing upstream driver. I would love to see
>>>> all that consolidated.
>>>>
>>>> BTW, the R1505G is family 0x17. Maybe something changed there, and that
>>>> bit 7 was just reserved/ignored so far. ENOSPECS
>>>>
>>>
>>> Thanks for the pointers.
>>>
>>> I think you are talking about bit 31. Bit 7 is and was WatchdogTmrEn, but that
>>> supposedly only enables watchdog timer memory access at 0xfeb00000. From what
>>> I glance from the other drivers, the existing code is wrong. It should set
>>> the disable and resolution bits in register offset 3 (bit 24..27), not 0.
>>> In other words, EFCH_PM_DECODEEN3 should be defined as 0x03, not as 0x00.
>>> Which actually makes sense from the name.
>>>
>>> Playing with my hardware, turns out that setting bit 7 in EFCH_PM_DECODEEN
>>> (register offset 0) does indeed enable the watchdog. I'll need to check
>>> if it actually works. Either case, -ENOSPECS is really a problem here.
>>>
>>
>> ... and it does work. After playing with it, it seems that on Family 17h
>> CPUs EFCH_PM_DECODEEN_WDT_TMREN not only enables watchdog timer memory
>> access at 0xfeb0000, but also enables the watchdog itself.
>>
>> Also, turns out the documentation is now public, at least for some of the
>> Family 17h CPUs (though oddly enough not for all of them). See processor
>> reference manuals at https://www.amd.com/en/support/tech-docs. The documents
>> for model 18h and model 20h include a note stating that bit 7 of
>> EFCH_PM_DECODEEN enables both memory access and the watchdog hardware.
>>
>> So we'll need two patches - one to fix the value of EFCH_PM_DECODEEN3,
>> and one to enable the watchdog bit setting bit 7 of EFCH_PM_DECODEEN
>> for Family 17h CPUs.
>>
> Jan - any chance you can submit those patches ? Or do you want me to do it ?

Oh, I was reading your reply as if you were writing the patches. The
first one is definitely your finding, and while I can also see now what
is wrong and needed on 17h, I'm unsure about the rest. If you have a
better picture, please go ahead.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
