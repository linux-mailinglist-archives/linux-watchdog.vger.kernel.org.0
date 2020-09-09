Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655312632DC
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Sep 2020 18:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731074AbgIIQvD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Sep 2020 12:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730916AbgIIQFE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Sep 2020 12:05:04 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784C4C0617BA;
        Wed,  9 Sep 2020 09:04:42 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x19so2882661oix.3;
        Wed, 09 Sep 2020 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EbrqMoC+c7yXfoDTMmlsBLHXLeTrkA+VhWv/HvLY3gE=;
        b=Om606TiZfkZGMyAMTvLheIAZvtUuuLMPnVs9D45MqdNZp0ogvK2EMow6kW5xkLOWrB
         43EmNY7ufeX6sXwYjcrbD0PI7ABl3tsozVVmJGxuv8cI2ePd70duUMI0FoF2YjRb9vir
         rMdmTrtteAirQZlhHMf1Q6y6Dvf1w4VIb+UU0NaySN82GSCFWU16z6QaRDocOg6guTrN
         CwmxKgI7QIxXBbXSbMyAijRfPVjtvV3DAcHnFQARMTRG/jVDj7U7ygp4c69rh5M1Xyh1
         UjVnodTMbup/6Z7b9tspk3ScSnRzafVNn4d7VIcSyZVPNTdfrzCu+RDoRflL3Dzl10eC
         bf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EbrqMoC+c7yXfoDTMmlsBLHXLeTrkA+VhWv/HvLY3gE=;
        b=DdVOyXrd0h8furwGTbny0c4vMHXEMHq9zARhLgBCsy0Tqsz+r6FgbeI4XOEliZgf8b
         0WekT5E7DBA87GseMXxgvaCnapWf+CnM4R1qVxBUy6UXerWqGEO2liyxveQUabHzAosm
         8IckC+eWo0mOftF2HjnMxMsZLGZmz1rVzK5mObnP1D5WDdm9Wct4M5RxiCTG+q/PxXkW
         UHWO6YUbQkxpqfQnnd6wAVH+vkxcvZWexdx6pW9fxhcoOZ7GsHdFpmIhxjLfVpGNCpiw
         jOrIqtdqPKDkBBAbS3290KCNVdo7+t9R1B3nsN4Vjrg4WRsDD8lfCwI9p99SaDuCzKvh
         oleQ==
X-Gm-Message-State: AOAM533dWqJzgpODWNjiPc49dD9g6sWtyUWzq6eFiuqgLDZdt394+8pX
        GtTCnQxTdUqXaka215a54rk=
X-Google-Smtp-Source: ABdhPJxEkqdfVq+qK/E+EWwKzK/1UxtSLkMfURZ2VtZBjrkh3Fbei/MgWpMHWfm2ISMNNVBP1HeOsw==
X-Received: by 2002:a54:4704:: with SMTP id k4mr1032294oik.78.1599667481749;
        Wed, 09 Sep 2020 09:04:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k19sm446282otb.45.2020.09.09.09.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 09:04:40 -0700 (PDT)
Subject: Re: watchdog: sp5100_tco support for AMD V/R/E series
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jan Kiszka <jan.kiszka@siemens.com>, linux-watchdog@vger.kernel.org
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
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <cfa0b445-d4c7-94e3-9585-579f0103a7eb@roeck-us.net>
Date:   Wed, 9 Sep 2020 09:04:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <39327ba6-0eff-3555-124c-64f3f105c9fe@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/7/20 1:45 PM, Guenter Roeck wrote:
> On 9/7/20 12:18 PM, Guenter Roeck wrote:
>> On 9/7/20 8:46 AM, Jan Kiszka wrote:
>>> On 07.09.20 17:31, Guenter Roeck wrote:
>>>> On 9/7/20 4:20 AM, Jan Kiszka wrote:
>>>>> Hi all,
>>>>>
>>>>> Arsalan reported that the upstream driver for sp5100_tco does not work
>>>>> for embedded Ryzen. Meanwhile, I was able to confirm that on an R1505G:
>>>>>
>>>>> [   11.607251] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
>>>>> [   11.607337] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
>>>>> [   11.607344] sp5100-tco sp5100-tco: Watchdog hardware is disabled
>>>>>
>>>>> ..and fix it:
>>>>>
>>>>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>>>>> index 85e9664318c9..5482154fde42 100644
>>>>> --- a/drivers/watchdog/sp5100_tco.c
>>>>> +++ b/drivers/watchdog/sp5100_tco.c
>>>>> @@ -193,7 +193,8 @@ static void tco_timer_enable(struct sp5100_tco *tco)
>>>>>  		/* Set the Watchdog timer resolution to 1 sec and enable */
>>>>>  		sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN3,
>>>>>  					  ~EFCH_PM_WATCHDOG_DISABLE,
>>>>> -					  EFCH_PM_DECODEEN_SECOND_RES);
>>>>> +					  EFCH_PM_DECODEEN_SECOND_RES |
>>>>> +					  EFCH_PM_DECODEEN_WDT_TMREN);
>>>>
>>>> Confusing. The register in question is a 32-bit register, but only a byte
>>>> is written into it. Bit 24-25 are supposed to be the resolution, bit 25-26
>>>> set to 0 enable the watchdog. Bit 7 is supposed to enable MMIO decoding.
>>>> This is from AMD Publication 52740. So something in the existing code
>>>> is (or seems to be) wrong, but either case I don't see how setting bit 7
>>>> (or 31 ?) would enable the watchdog hardware.
>>>>
>>>> Hmm, I wrote that code. Guess I'll need to to spend some time figuring out
>>>> what is going on.
>>>
>>> The logic came from [1] which inspired [2] - that's where I pointed out
>>> the large overlap with the existing upstream driver. I would love to see
>>> all that consolidated.
>>>
>>> BTW, the R1505G is family 0x17. Maybe something changed there, and that
>>> bit 7 was just reserved/ignored so far. ENOSPECS
>>>
>>
>> Thanks for the pointers.
>>
>> I think you are talking about bit 31. Bit 7 is and was WatchdogTmrEn, but that
>> supposedly only enables watchdog timer memory access at 0xfeb00000. From what
>> I glance from the other drivers, the existing code is wrong. It should set
>> the disable and resolution bits in register offset 3 (bit 24..27), not 0.
>> In other words, EFCH_PM_DECODEEN3 should be defined as 0x03, not as 0x00.
>> Which actually makes sense from the name.
>>
>> Playing with my hardware, turns out that setting bit 7 in EFCH_PM_DECODEEN
>> (register offset 0) does indeed enable the watchdog. I'll need to check
>> if it actually works. Either case, -ENOSPECS is really a problem here.
>>
> 
> ... and it does work. After playing with it, it seems that on Family 17h
> CPUs EFCH_PM_DECODEEN_WDT_TMREN not only enables watchdog timer memory
> access at 0xfeb0000, but also enables the watchdog itself.
> 
> Also, turns out the documentation is now public, at least for some of the
> Family 17h CPUs (though oddly enough not for all of them). See processor
> reference manuals at https://www.amd.com/en/support/tech-docs. The documents
> for model 18h and model 20h include a note stating that bit 7 of
> EFCH_PM_DECODEEN enables both memory access and the watchdog hardware.
> 
> So we'll need two patches - one to fix the value of EFCH_PM_DECODEEN3,
> and one to enable the watchdog bit setting bit 7 of EFCH_PM_DECODEEN
> for Family 17h CPUs.
> 
Jan - any chance you can submit those patches ? Or do you want me to do it ?

Thanks,
Guenter

> Thanks,
> Guenter
> 
>> Guenter
>>
>>> Jan
>>>
>>> [1]
>>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/commit/meta-amd-bsp/recipes-kernel/amd-wdt/files/amd_wdt.c?id=cd760c9f04d276382a0f5156dabdb766594ace56
>>> [2]
>>> https://github.com/siemens/efibootguard/commit/3a702aa96d193f26571ea4e70db29ef01a0d4d5f
>>>
>>
> 

