Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4C2606FAC
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Oct 2022 07:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiJUF4Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Oct 2022 01:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiJUF4R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Oct 2022 01:56:17 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679EE1AA251;
        Thu, 20 Oct 2022 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WwEOW9UNLcS8nsd2aSBapizmkmLE2U0qOFg8vtqEoZ8=; b=VJq0lyXROIw370sXXxOb2+ndrM
        Q6InkMEwLQpheSIM3aMq1x21KB4a7Qj2y95I9cv3+mHSXrytEirbRjFl6K49M//vt19imi9HYpbgT
        OY/NSMDI1nAlw1ghC4seVj+9LKTDcnSjYisvTK+5E8xqjf7lhP5pbYl7QIay/BzVzk+inf1diLpan
        Bel+4mm2ceThmkOFChV/q3vk3S3lP6wKCR9X8oKwz0XeEyansJF8L0Vty9IemBx2rxvDCbACygR9t
        /WVjuYQylchiKwfL4kbraCfqbMRhp4sM9qH6gNSKB6NqbYuShthHWCV0pgY06+MESr5Dl0E0zYx4/
        y1yWJMuw==;
Received: from [89.212.21.243] (port=52262 helo=[192.168.69.85])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <andrej.picej@norik.com>)
        id 1oll0h-0012oZ-VJ;
        Fri, 21 Oct 2022 07:56:07 +0200
Message-ID: <ceb604bf-9773-d617-18e7-8f1400fd2cf9@norik.com>
Date:   Fri, 21 Oct 2022 07:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: fsl-imx: document suspend in
 wait mode
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com, festevam@gmail.com,
        kernel@pengutronix.de, s.hauer@pengutronix.de,
        wim@linux-watchdog.org, robh+dt@kernel.org
References: <20221019111714.1953262-1-andrej.picej@norik.com>
 <ea6893f6-be39-697c-4493-7f1c0ed6708d@linaro.org>
 <143f1466-e34a-254d-4e6e-fefa17ad1390@norik.com>
 <24401572.EfDdHjke4D@steina-w>
 <1a3a1c8c-8baf-ef70-9e5b-e817bb14cfad@norik.com>
 <f8435311-42fa-4858-4623-8088d644f6c6@linaro.org>
From:   Andrej Picej <andrej.picej@norik.com>
In-Reply-To: <f8435311-42fa-4858-4623-8088d644f6c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 20. 10. 22 20:23, Krzysztof Kozlowski wrote:
> On 20/10/2022 09:05, Andrej Picej wrote:
>>
>>
>> On 20. 10. 22 14:41, Alexander Stein wrote:
>>> Am Donnerstag, 20. Oktober 2022, 14:36:10 CEST schrieb Andrej Picej:
>>>> On 20. 10. 22 14:18, Krzysztof Kozlowski wrote:
>>>>> On 20/10/2022 02:23, Andrej Picej wrote:
>>>>>> Hi Alexander and Krzysztof,
>>>>>>
>>>>>> hope I can reply to both questions here.
>>>>>>
>>>>>> On 19. 10. 22 17:51, Krzysztof Kozlowski wrote:
>>>>>>> On 19/10/2022 09:00, Alexander Stein wrote:
>>>>>>>> Hello Andrej,
>>>>>>>
>>>>>>>> Am Mittwoch, 19. Oktober 2022, 13:17:13 CEST schrieb Andrej Picej:
>>>>>>> Missing commit msg.
>>>>>>>
>>>>>>>>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>>      Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 5
>>>>>>>>>      +++++
>>>>>>>>>      1 file changed, 5 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git
>>>>>>>>> a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>>>>>>>>> b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml index
>>>>>>>>> fb7695515be1..01b3e04e7e65 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>>>>>>>>>
>>>>>>>>> @@ -55,6 +55,11 @@ properties:
>>>>>>>>>            If present, the watchdog device is configured to assert its
>>>>>>>>>            external reset (WDOG_B) instead of issuing a software reset.
>>>>>>>>>
>>>>>>>>> +  fsl,suspend-in-wait:
>>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>>>>>>> +    description: |
>>>>>>>>> +      If present, the watchdog device is suspended in WAIT mode.
>>>>>>>>> +
>>>>>>>>>
>>>>>>>>>      required:
>>>>>>>>>        - compatible
>>>>>>>>>        - interrupts
>>>>>>>>
>>>>>>>> What is the condition the watchdog is suspended in WAIT mode? Is this
>>>>>>>> specific to SoC or platform or something else?
>>>>>>
>>>>>> Sorry, what exactly do you mean by condition?
>>>>>
>>>>> Ugh, I also cannot parse it now...
>>>
>>> Sorry, Krzysztof already asked the right question: When does one want to
>>> enable/disable this feature?
>>>
>>>>>> When the property
>>>>>> "fsl,suspend-in-wait" is set the watchdog is suspended in WAIT mode, so
>>>>>> this is defined by the user. Didn't want to apply it for all the
>>>>>> supported machines since there could be devices which depend on watchdog
>>>>>> triggering in WAIT mode. We stumbled on this problem on imx6 devices,
>>>>>> but the same bit (with the same description) is found on imx25, imx35,
>>>>>> imx50/51/53, imx7 and imx8.
>>>>>
>>>>> I meant, what is expected to happen if you do not enable this bit and
>>>>> watchdog triggers in WAIT mode? IOW, why someone might want to enable or
>>>>> disable this property?
>>>>
>>>> If this is not enabled and you put the device into the Suspend-to-idle
>>>> mode the device resets after 128 seconds. If not, the device can be left
>>>> in that state for infinite time. I'm guessing you want me to better
>>>> explain the property in device tree docs right?
>>>> I can do that in v2.
>>>>
>>>>>>> And what happens else? When it is not suspended in WAIT mode?
>>>>>>
>>>>>> When you put the device in "freeze"/"Suspend-To-Idle" low-power mode the
>>>>>> watchdog keeps running and triggers a reset after 128 seconds. So the
>>>>>> maximum length the device can stay in this mode is limited to 128
>>>>>> seconds.
>>>>>
>>>>> And who wakes up the system before 128 seconds? IOW is there a use case
>>>>> of not enabling this property?
>>>>
>>>> Well I can think of one, system can be woken up by some other interrupt.
>>>> Like RTC which triggers interrupt (for example every 10s). So if this
>>>> property is left disabled the watchdog can handle errors where other
>>>> wakeup sources don't trigger interrupt or if the system is unable to
>>>> wake from low-power state. In that case the watchdog will do a hard
>>>> reset of the device.
>>>>
>>>> But I'm not really sure if anybody uses this, just wanted to make sure
>>>> that we keep the default behaviour as it is, since this driver is used
>>>> by many devices and for quite some time.
>>>
>>> This sounds more like (application) configuration. If so this should not be
>>> configured in device tree, IMHO.
>>>
>>
>> Do you have an idea where should it be configured? Just keep in mind
>> that this can not be configured at runtime, since this is write-once bit
>> so any configuration changes regarding this functionality can not be done.
>>
>> Basically if I can sum up the problem:
>>
>> Without this property enabled, the WDW bit is left unset:
>> $ echo freeze > /sys/power/state
>> #device enters Suspend-to-idle, watchdog is left running and the device
>> resets after 128 seconds in this state
> 
> I still wonder (and still did not receive) about such use case. When
> would you like to have such behavior?
> 

Is this not a valid one?:
>>>>> Well I can think of one, system can be woken up by some other interrupt.
>>>>> Like RTC which triggers interrupt (for example every 10s). So if this
>>>>> property is left disabled the watchdog can handle errors where other
>>>>> wakeup sources don't trigger interrupt or if the system is unable to
>>>>> wake from low-power state. In that case the watchdog will do a hard
>>>>> reset of the device.
>>>>>
>>>>> But I'm not really sure if anybody uses this, just wanted to make sure
>>>>> that we keep the default behaviour as it is, since this driver is used
>>>>> by many devices and for quite some time.

Basically watchdog acting as a supervisor for suspend states.

>>
>> With this property set, the WDW bit is set at watchdog initialization:
>> $ echo freeze > /sys/power/state
>> #device enters Suspend-to-idle, watchdog is suspended and the device can
>> be left in this state until some other wakeup source triggers interrupt.
> 
> Assuming there is such use case, for keeping watchdog running even
> though system sleeps (and cannot poke watchdog), it's fine.
> 

Best regards,
Andrej
