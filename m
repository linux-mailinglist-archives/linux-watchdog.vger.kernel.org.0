Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF77B5E74D6
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Sep 2022 09:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiIWH2C (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Sep 2022 03:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiIWH17 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Sep 2022 03:27:59 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442FC12A4BB
        for <linux-watchdog@vger.kernel.org>; Fri, 23 Sep 2022 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fysP4kJY4fWd7RSeiA8CQcBRw6PrT+4bka0YkXSBeiU=; b=FLUjHMFWruBhDEaGkinBZ+PJXF
        7TLuwx+ZB7/osT5ZMlyV182b78dUC1w1+BvO+cUilImQDidBSj9XG1B2t0CAh6QHnMqkzwhQ5WrOs
        d+ZtchgUh9r9NM3oM20GMnQxe/6mbeC5M7Rgebk4MBwWvyGpSTNpZuhi1RbDr19DSn1KrW/LC9tGS
        IFL73gQdZ/TiFQmGpINuSajQ8cqimUnaS+iPdli4XAlSCEBo7RCw06bk3ip0sDM1JDN7lkJqSUjoE
        +aujiNu8Yw7mc0n/lNSLJG+je+KRF97BsGkpwjMi9DIXaXGg9rN4moTD12NaBN9zyQ7uEyvw1/YY5
        30nCB63Q==;
Received: from [89.212.21.243] (port=50442 helo=[192.168.69.85])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <andrej.picej@norik.com>)
        id 1obd67-009sSc-Kd;
        Fri, 23 Sep 2022 09:27:50 +0200
Message-ID: <a761d821-6beb-e4d7-b0c1-37178b3bacc2@norik.com>
Date:   Fri, 23 Sep 2022 09:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/1] Suspending i.MX watchdog in WAIT mode
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
References: <20220921124647.1521667-1-andrej.picej@norik.com>
 <5823717b-0288-a679-824d-5a26dec5a606@roeck-us.net>
 <325585e9-3d50-eee2-4443-5509dde6da90@norik.com>
 <72fb8f04-52d1-af99-dfff-4a53ee3d3440@roeck-us.net>
From:   Andrej Picej <andrej.picej@norik.com>
In-Reply-To: <72fb8f04-52d1-af99-dfff-4a53ee3d3440@roeck-us.net>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 22. 09. 22 16:56, Guenter Roeck wrote:
> On 9/22/22 00:17, Andrej Picej wrote:
>> Hi Guenter,
>>
>> On 21. 09. 22 16:18, Guenter Roeck wrote:
>>> On 9/21/22 05:46, Andrej Picej wrote:
>>>> Hi all,
>>>>
>>>> we are using i.MX6UL with its watchdog WDOG1 and kernel 5.15.62. It was
>>>> discovered that the watchdog triggers reset when the device is put into
>>>> 'Suspend-To-Idle' (WAIT) state.
>>>>
>>>
>>> Is that equivalent to "suspend" from Linux perspective, or some other
>>> mode ? How does the device get into this state ?
>>
>> I think WAIT mode maps to System idle mode in linux [1].
>>
> 
> Sorry, I am not going to read that entire manual.
> 

Perfectly understandable, you are busy guys, basically in chapter 21.1.1 
it is written:
"System idle maps to WAIT mode."

>> Sorry don't quite understand your second question.
>> Do you mean how we trigger this state?
>> We trigger this state with:
>>  >     imx6ul-dev:~# echo freeze > /sys/power/state
>>
> 
> So it is not "suspend" ? I am not sure if it is appropriate to stop
> the watchdog timer in this situation. Normally it is only stopped
> in suspend mode.
> 

Well suspend/resume functions are still called when entering this 
"freeze" mode, but watchdog can not be disabled by software or pinged in 
this mode, that's why our idea is to set this bit.

Basically, that was my main question. Is it appropriate to stop watchdog 
in this situation? I guess not. Probably it is not meant to enter this 
mode for longer period of time.

> Also, how does this interact or interfere with the suspend/resume code
> in the driver, and does it behave the same for all chips supported by
> the driver ? For example, in the current code, i.MX7D is handled
> differently. What compatible entry are you using anyway ? There is none
> for i.MX6UL. Did you make sure that the same bit doesn't mean something
> else for other chips ?
> 

I don't think it interact/interferes with suspend/resume code in any way 
since mx2+ watchdog is not stoppable during runtime. Not sure if 
watchdogs on other devices behave the same, sorry.

i.MX6UL devices use "fsl,imx6ul-wdt", "fsl,imx21-wdt" for compatible 
entry. I checked control registers with other supported devices by this 
driver:

- fsl,imx25-wdt (same behaviour -> WDW)
- fsl,imx27-wdt (bit is reserved)
- fsl,imx31-wdt (bit is reserved)
- fsl,imx35-wdt (same behaviour -> WDW)
- fsl,imx50-wdt (same behaviour -> WDW)
- fsl,imx51-wdt (same behaviour -> WDW)
- fsl,imx53-wdt (same behaviour -> WDW)
- fsl,imx6q-wdt (same behaviour -> WDW)
- fsl,imx6sl-wdt (same behaviour -> WDW)
- fsl,imx6sll-wdt (same behaviour -> WDW)
- fsl,imx6sx-wdt (same behaviour -> WDW)
- fsl,imx6ul-wdt (same behaviour -> WDW)
- fsl,imx7d-wdt (same behaviour -> WDW)
- fsl,imx8mm-wdt (same behaviour -> WDW)
- fsl,imx8mn-wdt (same behaviour -> WDW)
- fsl,imx8mp-wdt (same behaviour -> WDW)
- fsl,imx8mq-wdt (same behaviour -> WDW)
- fsl,ls1012a-wdt (bit is reserved)
- fsl,ls1043a-wdt (bit is reserved)
- fsl,vf610-wdt (same behaviour -> WDW)
- fsl,imx21-wdt (reserved)

Looking at this table WDW is not really i.MX6UL specific. It is strange 
that more people don't experience this problem. I guess using "freeze" 
mode is not very common, which is understandable, since other low power 
modes are more energy efficient.

Anyway, if some people are using this "feature" of watchdog for WAIT 
mode supervision, setting this bit would break their use. I just wanted 
to get your opinion on this, which I got.

Andrej

> Thanks,
> Guenter
> 
>> If you mean what is done prior to entering this state?
>> The device enters WAIT mode when CLPCR bit is set to WAIT. The device
>> enters WAIT mode by gating the CPU clock, all other clocks can be gated
>> by programming CGR bits in WAIT mode.
>>
>> [1] i.MX Linux Reference Manual, Rev. 0, 07/2016
>>
>> Andrej
>>
>>>
>>> Guenter
>>>
>>>> i.MX6UL watchdog has a WDW (Watchdog Disable for Wait) bit in WCR
>>>> (Watchdog Control Register) which can put the watchdog in suspend when
>>>> the device is put to WAIT mode. Similarly, WDZST bit is already set in
>>>> imx2_wdt driver by default, which suspends the watchdog in STOP and 
>>>> DOZE
>>>> modes.
>>>>
>>>> This RFC patch suspends watchdog when the device is in WAIT mode, which
>>>> fixes our problem. During development, we noticed some reports where
>>>> setting WDW bit caused inconsistent timeout events or inability of
>>>> watchdog to reset the board. We didn't have these problems but I am
>>>> curious if there is a case where device is put into WAIT mode and
>>>> watchdog should be enabled?
>>>>
>>>> Maybe for cases where watchdog is used for WAIT mode supervision? So
>>>> basically to reset the system if device doesn't exit WAIT mode on its
>>>> own?
>>>>
>>>> The problem can be recreated with:
>>>>
>>>>     imx6ul-dev:~# echo freeze > /sys/power/state
>>>>     [  101.093336] PM: suspend entry (s2idle)
>>>>     [  101.097785] Filesystems sync: 0.000 seconds
>>>>     [  101.122295] Freezing user space processes ... (elapsed 0.001 
>>>> seconds) done.
>>>>     [  101.130637] OOM killer disabled.
>>>>     [  101.133998] Freezing remaining freezable tasks ... (elapsed 
>>>> 0.001 seconds) done.
>>>>     [  101.142941] printk: Suspending console(s) (use 
>>>> no_console_suspend to debug)
>>>>     ...
>>>> Device resets after watchdog timeout expires! ~105s
>>>>
>>>> Thank you for your feedback.
>>>>
>>>> Best regards,
>>>> Andrej
>>>>
>>>> Andrej Picej (1):
>>>>    watchdog: imx2_wdg: suspend watchdog in WAIT mode
>>>>
>>>>   drivers/watchdog/imx2_wdt.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>
>>
> 

