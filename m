Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303C15E6641
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Sep 2022 16:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbiIVO45 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Sep 2022 10:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiIVO44 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Sep 2022 10:56:56 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476DDE11BB
        for <linux-watchdog@vger.kernel.org>; Thu, 22 Sep 2022 07:56:54 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id b5so1220254pgb.6
        for <linux-watchdog@vger.kernel.org>; Thu, 22 Sep 2022 07:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=UfMsBqQwM1Jtdp8qK24qwlTAKtFRgCB45U28BHLv3rE=;
        b=ouMhchvcKX43+hR5mZMKmTqYF+Cvyxrrl/zHMrYgA7Oj+42/aCwmUowIr1FnJZ+uGD
         wDpxz/aT8dGoKZgxRKI188oF9zQ164ZQJQPL6BFb/ixvOxqNTd2XXoPCe/3rpEmcICXL
         xYEAmRgkEvrzgPXEwZ/+89xxy1hc2MPnVHIoZf/ABnOzCUOqylHsRzXbE0h0y55cBR/K
         mpdrEHWZsZGx6G9VUzvU2YA4+2ZAq13UiuxzWB6p+cT4aZERPCZRfavzzWMqYal2paB2
         nSjr+CYVHQKBlggPCkicbUCheUEc9f5ZLtKcEjOqphaAMCh8vtoH6SbwOeDz8SZBFTKh
         cUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UfMsBqQwM1Jtdp8qK24qwlTAKtFRgCB45U28BHLv3rE=;
        b=q+RabdBeMl6+SnnsgKjeTcIab4RDEcCGCoJT+gKFnn07hz/BEnrHavVOQBRQzoACbZ
         tWb7SH/moY5811PzVFJOmw9W7MnAdgjbiDlfVbQrHjl5Kai1qCln9YXgkcrPioYxmKs3
         xlmzblm7QXfrBAwMJ7d2EZ0+hHDxNMS7SlzHtEHUXcwxxDOSpArVCcZk6i3oDSni1Ecu
         heDIo4euBrctLYxAPOkvwL2XStzERm7lV6uqGv2Y2XzztH8xsrHzLCKx/FLEtw7RY9jd
         Zwsnnan2h6MrykE8onw98ILLu2/f3QEIFHyPanOm3mE59Y7DVQP594Wey3KzOViacDLG
         1B+A==
X-Gm-Message-State: ACrzQf3E+bjge6+5uxEwE84+SPw+2wmnL/ZImJJMKjq79iFHOPPDTw5E
        5T8g3W5PhmOGfFIEck/sawo=
X-Google-Smtp-Source: AMsMyM52qNt4LHlpn5bTujs751aFjLPmaizf9fySzu/dwrR3j2Xd0l1LxMrQBvcKxLsV2GdXWt5YNA==
X-Received: by 2002:a63:171b:0:b0:438:e47d:e79b with SMTP id x27-20020a63171b000000b00438e47de79bmr3314012pgl.542.1663858613087;
        Thu, 22 Sep 2022 07:56:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 201-20020a6215d2000000b00537daf64e8esm4579411pfv.188.2022.09.22.07.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:56:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72fb8f04-52d1-af99-dfff-4a53ee3d3440@roeck-us.net>
Date:   Thu, 22 Sep 2022 07:56:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Andrej Picej <andrej.picej@norik.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
References: <20220921124647.1521667-1-andrej.picej@norik.com>
 <5823717b-0288-a679-824d-5a26dec5a606@roeck-us.net>
 <325585e9-3d50-eee2-4443-5509dde6da90@norik.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH 0/1] Suspending i.MX watchdog in WAIT mode
In-Reply-To: <325585e9-3d50-eee2-4443-5509dde6da90@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/22/22 00:17, Andrej Picej wrote:
> Hi Guenter,
> 
> On 21. 09. 22 16:18, Guenter Roeck wrote:
>> On 9/21/22 05:46, Andrej Picej wrote:
>>> Hi all,
>>>
>>> we are using i.MX6UL with its watchdog WDOG1 and kernel 5.15.62. It was
>>> discovered that the watchdog triggers reset when the device is put into
>>> 'Suspend-To-Idle' (WAIT) state.
>>>
>>
>> Is that equivalent to "suspend" from Linux perspective, or some other
>> mode ? How does the device get into this state ?
> 
> I think WAIT mode maps to System idle mode in linux [1].
> 

Sorry, I am not going to read that entire manual.

> Sorry don't quite understand your second question.
> Do you mean how we trigger this state?
> We trigger this state with:
>  >     imx6ul-dev:~# echo freeze > /sys/power/state
> 

So it is not "suspend" ? I am not sure if it is appropriate to stop
the watchdog timer in this situation. Normally it is only stopped
in suspend mode.

Also, how does this interact or interfere with the suspend/resume code
in the driver, and does it behave the same for all chips supported by
the driver ? For example, in the current code, i.MX7D is handled
differently. What compatible entry are you using anyway ? There is none
for i.MX6UL. Did you make sure that the same bit doesn't mean something
else for other chips ?

Thanks,
Guenter

> If you mean what is done prior to entering this state?
> The device enters WAIT mode when CLPCR bit is set to WAIT. The device
> enters WAIT mode by gating the CPU clock, all other clocks can be gated
> by programming CGR bits in WAIT mode.
> 
> [1] i.MX Linux Reference Manual, Rev. 0, 07/2016
> 
> Andrej
> 
>>
>> Guenter
>>
>>> i.MX6UL watchdog has a WDW (Watchdog Disable for Wait) bit in WCR
>>> (Watchdog Control Register) which can put the watchdog in suspend when
>>> the device is put to WAIT mode. Similarly, WDZST bit is already set in
>>> imx2_wdt driver by default, which suspends the watchdog in STOP and DOZE
>>> modes.
>>>
>>> This RFC patch suspends watchdog when the device is in WAIT mode, which
>>> fixes our problem. During development, we noticed some reports where
>>> setting WDW bit caused inconsistent timeout events or inability of
>>> watchdog to reset the board. We didn't have these problems but I am
>>> curious if there is a case where device is put into WAIT mode and
>>> watchdog should be enabled?
>>>
>>> Maybe for cases where watchdog is used for WAIT mode supervision? So
>>> basically to reset the system if device doesn't exit WAIT mode on its
>>> own?
>>>
>>> The problem can be recreated with:
>>>
>>>     imx6ul-dev:~# echo freeze > /sys/power/state
>>>     [  101.093336] PM: suspend entry (s2idle)
>>>     [  101.097785] Filesystems sync: 0.000 seconds
>>>     [  101.122295] Freezing user space processes ... (elapsed 0.001 seconds) done.
>>>     [  101.130637] OOM killer disabled.
>>>     [  101.133998] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
>>>     [  101.142941] printk: Suspending console(s) (use no_console_suspend to debug)
>>>     ...
>>> Device resets after watchdog timeout expires! ~105s
>>>
>>> Thank you for your feedback.
>>>
>>> Best regards,
>>> Andrej
>>>
>>> Andrej Picej (1):
>>>    watchdog: imx2_wdg: suspend watchdog in WAIT mode
>>>
>>>   drivers/watchdog/imx2_wdt.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>
> 

