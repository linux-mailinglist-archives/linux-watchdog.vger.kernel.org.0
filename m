Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065995F2FBD
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Oct 2022 13:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiJCLgy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Oct 2022 07:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiJCLgw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Oct 2022 07:36:52 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3591EE77
        for <linux-watchdog@vger.kernel.org>; Mon,  3 Oct 2022 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc
        :To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=GkQzXyKAcNh3HDaGQW72UaBFpxrS9UOecLHf/XfRZEo=; b=ZdoIFHiALOxDW+i/Drg3MxYkf5
        kRBQXRX1xG5ZhO2YayxdZuLsk9Yyl4ujrRvmrGVBfG4xwMHQn5GLMyVqtcS2tBIw2iTPeuBhw60oq
        kbMaf6doLFI275HnKi6wU0ygDqO8OYYdCikc6jXf9yIOQGYpaSlBo/g42BBopz3hf2KUClYRXRwEJ
        79WzO0s4HLt5dTiKMLoLYx0ekknrSPex/VEAhVjc7glLmMfJnKLL71RNhFJGfmYGHpmkZ8Sacjl6S
        gb/sgoij/Vsd5N+n/2YF9FvRMQnEotLI3cTz6Kpi2qwgfiyn6UCU0PXcBQ73NZPFMCDB5eXRKhCc6
        6ktwRuCw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33596 helo=[192.168.69.85])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <andrej.picej@norik.com>)
        id 1ofJkX-002DKz-Db;
        Mon, 03 Oct 2022 13:36:41 +0200
Message-ID: <2e1855f5-3bbe-4442-adbf-63c28d40dc59@norik.com>
Date:   Mon, 3 Oct 2022 13:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/1] Suspending i.MX watchdog in WAIT mode
Content-Language: en-GB
From:   Andrej Picej <andrej.picej@norik.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
References: <20220921124647.1521667-1-andrej.picej@norik.com>
 <5823717b-0288-a679-824d-5a26dec5a606@roeck-us.net>
 <325585e9-3d50-eee2-4443-5509dde6da90@norik.com>
 <72fb8f04-52d1-af99-dfff-4a53ee3d3440@roeck-us.net>
 <a761d821-6beb-e4d7-b0c1-37178b3bacc2@norik.com>
 <5ce53d5a-532f-0d56-9a5a-c95c7c7b170b@roeck-us.net>
 <7662f5dd-2acb-6b05-cbba-8a03dab5244d@norik.com>
In-Reply-To: <7662f5dd-2acb-6b05-cbba-8a03dab5244d@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 26. 09. 22 09:36, Andrej Picej wrote:
> 
> 
> On 23. 09. 22 15:48, Guenter Roeck wrote:
>> On 9/23/22 00:27, Andrej Picej wrote:
>>> On 22. 09. 22 16:56, Guenter Roeck wrote:
>>>> On 9/22/22 00:17, Andrej Picej wrote:
>>>>> Hi Guenter,
>>>>>
>>>>> On 21. 09. 22 16:18, Guenter Roeck wrote:
>>>>>> On 9/21/22 05:46, Andrej Picej wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> we are using i.MX6UL with its watchdog WDOG1 and kernel 5.15.62. 
>>>>>>> It was
>>>>>>> discovered that the watchdog triggers reset when the device is 
>>>>>>> put into
>>>>>>> 'Suspend-To-Idle' (WAIT) state.
>>>>>>>
>>>>>>
>>>>>> Is that equivalent to "suspend" from Linux perspective, or some other
>>>>>> mode ? How does the device get into this state ?
>>>>>
>>>>> I think WAIT mode maps to System idle mode in linux [1].
>>>>>
>>>>
>>>> Sorry, I am not going to read that entire manual.
>>>>
>>>
>>> Perfectly understandable, you are busy guys, basically in chapter 
>>> 21.1.1 it is written:
>>> "System idle maps to WAIT mode."
>>>
>>>>> Sorry don't quite understand your second question.
>>>>> Do you mean how we trigger this state?
>>>>> We trigger this state with:
>>>>>  >     imx6ul-dev:~# echo freeze > /sys/power/state
>>>>>
>>>>
>>>> So it is not "suspend" ? I am not sure if it is appropriate to stop
>>>> the watchdog timer in this situation. Normally it is only stopped
>>>> in suspend mode.
>>>>
>>>
>>> Well suspend/resume functions are still called when entering this 
>>> "freeze" mode, but watchdog can not be disabled by software or pinged 
>>> in this mode, that's why our idea is to set this bit.
>>>
>>> Basically, that was my main question. Is it appropriate to stop 
>>> watchdog in this situation? I guess not. Probably it is not meant to 
>>> enter this mode for longer period of time.
>>>
>>>> Also, how does this interact or interfere with the suspend/resume code
>>>> in the driver, and does it behave the same for all chips supported by
>>>> the driver ? For example, in the current code, i.MX7D is handled
>>>> differently. What compatible entry are you using anyway ? There is none
>>>> for i.MX6UL. Did you make sure that the same bit doesn't mean something
>>>> else for other chips ?
>>>>
>>>
>>> I don't think it interact/interferes with suspend/resume code in any 
>>> way since mx2+ watchdog is not stoppable during runtime. Not sure if 
>>> watchdogs on other devices behave the same, sorry.
>>>
>>> i.MX6UL devices use "fsl,imx6ul-wdt", "fsl,imx21-wdt" for compatible 
>>> entry. I checked control registers with other supported devices by 
>>> this driver:
>>>
>>> - fsl,imx25-wdt (same behaviour -> WDW)
>>> - fsl,imx27-wdt (bit is reserved)
>>> - fsl,imx31-wdt (bit is reserved)
>>> - fsl,imx35-wdt (same behaviour -> WDW)
>>> - fsl,imx50-wdt (same behaviour -> WDW)
>>> - fsl,imx51-wdt (same behaviour -> WDW)
>>> - fsl,imx53-wdt (same behaviour -> WDW)
>>> - fsl,imx6q-wdt (same behaviour -> WDW)
>>> - fsl,imx6sl-wdt (same behaviour -> WDW)
>>> - fsl,imx6sll-wdt (same behaviour -> WDW)
>>> - fsl,imx6sx-wdt (same behaviour -> WDW)
>>> - fsl,imx6ul-wdt (same behaviour -> WDW)
>>> - fsl,imx7d-wdt (same behaviour -> WDW)
>>> - fsl,imx8mm-wdt (same behaviour -> WDW)
>>> - fsl,imx8mn-wdt (same behaviour -> WDW)
>>> - fsl,imx8mp-wdt (same behaviour -> WDW)
>>> - fsl,imx8mq-wdt (same behaviour -> WDW)
>>> - fsl,ls1012a-wdt (bit is reserved)
>>> - fsl,ls1043a-wdt (bit is reserved)
>>> - fsl,vf610-wdt (same behaviour -> WDW)
>>> - fsl,imx21-wdt (reserved)
>>>
>>
>> And then there is fsl,imx7ulp-wdt which has its own driver.
>>
>>> Looking at this table WDW is not really i.MX6UL specific. It is 
>>> strange that more people don't experience this problem. I guess using 
>>> "freeze" mode is not very common, which is understandable, since 
>>> other low power modes are more energy efficient.
>>>  > Anyway, if some people are using this "feature" of watchdog for 
>>> WAIT mode supervision, setting this bit would break their use. I just 
>>> wanted to get your opinion on this, which I got.
>>>
>>
>> Oh, no, you are just giving up too early.
> 
> Well I'm not really sure if it is worth the struggle. But if you insist, 
> I'll dig a bit deeper :).
> 
>>
>> Other watchdogs do get stopped in suspend. That is why the suspend 
>> function
>> exists and is used in watchdog drivers in the first place. Yes, 
>> fsl,imx21-wdt
>> can not handle that, but that doesn't mean that others can't either. The
>> current workaround for fsl,imx21-wdt is to set the timeout to the maximum
>> and to stop the watchdog timer clock. You say that the suspend 
>> function is
>> called, so the watchdog clock _should_ be stopped. However, it looks like
>> that is not the case. Can you try to figure out the reason ?
> 
> Ok, so a quick look at clocks used in watchdog reveals an interesting 
> find. The watchdog uses two clocks:
> - low-frequency reference clock (ipg_clk_32k) for its counter and 
> control operation and
> - peripheral bus clock for register read/write operations.
> 
>  From reference manual:
>> Low frequency (32.768 kHz) clock that continues to run in low-power
>> mode. It is assumed that the Clock Controller will provide this clock 
>> signal
>> synchronized to ipg_clk in the normal mode, and switch to a non-
>> synchronized signal in low-power mode when the ipg_clk is off.
> 
> In suspend function we are stopping wdog1_clk which is child of ipg_clk. 
> This low-frequency reference clock is left running, which means that 
> watchdog counter keeps running. The problem is that ipg_clk_32k is meant 
> to be running in low-power mode, that's why this clock can not be gated 
> off (no gating register).
> 
>>
>> Either case, I think it would be worthwhile exploring if the WDW bit can
>> be used on the CPUs supporting it to stop the watchdog in suspend mode.
>> How does your sysytem behave if put into suspend ? Does the watchdog 
>> still
>> reset it ? How is the watchdog clock configured ?
> 
> If the system is put into suspend mode, the watchdog is suspended, due 
> to WDZST bit, which similar to WDW bit suspends the watchdog in 
> low-power modes (STOP and DOZE). If this WDZST bit is NOT set, the 
> watchdog triggers when system is put into "Suspend-to-RAM" and 
> "Standby/Power-On Suspend".
> 
> I had a look at some of other devices watchdogs this driver supports and 
> it looks like i.MX6, i.MX8, i.MX7 and i.MX5x have this low-frequency 
> reference clock in common.
> 

What if we used a new device-tree property "fsl,suspend-in-wait" to set 
WDW bit? And we leave WDW bit unset if this property is not defined, 
keeping the default watchdog behaviour as it is? Would that be acceptable?

Best regards,
Andrej
