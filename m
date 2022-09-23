Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59CC75E7C3E
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Sep 2022 15:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbiIWNtS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Sep 2022 09:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbiIWNtP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Sep 2022 09:49:15 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64A012754D
        for <linux-watchdog@vger.kernel.org>; Fri, 23 Sep 2022 06:48:58 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id t70so299371pgc.5
        for <linux-watchdog@vger.kernel.org>; Fri, 23 Sep 2022 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=mYm9gpdbJBGiaKlprqiHaLmIHCCDOXNeAwHTGhMLL2k=;
        b=bW5UkQ+k81rRWZEU4vVkeoWx0YgJXRucfl5NIbkDaG4vO6sUcPNmrap1P7saX/ElGJ
         gmHdkXlwgfemwtwcaeHY0KFSGHgtn7WvCpnzG+Mwa9vilBQW+tUCg7sGx0Z5xkQnwGmm
         uNg4Q+eZcP6gmzmCcoW5ovpQ4/07oqfAmR4nsPXcXG5/7BbteG4l1vEJ+JUwcL9qm1DZ
         0oo0RN7MaHAbaF30Mw3D6123qeM2yqiktSa0826EY3EPLm4aERNmtiRtBafb3+8IPSTQ
         pagAH5/eQTuft5hmHu0gnrdGrTCzKuNjtACSJIF4N567lYQzDE0suWEaGHQ4c/iU9WHF
         vfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mYm9gpdbJBGiaKlprqiHaLmIHCCDOXNeAwHTGhMLL2k=;
        b=2A4dGiVvt1wMjRYJDSKyXUT8lsogFPsikidW0NJ2BSZCrh4taJDu2QvAT8UoOXpi3Q
         JxNmCXhfus7XR1TTprgQxCryHsc7kvchcwkX+39ydQJ+yTADjScno2GYEkAafP4nkTc7
         5mXpddi1B2r9MHirYOvkfeS6tT8R9VUNZgXFcsCYUe8WzSxyXRbOZxoaeXHp34Tc24jL
         77F8m2TMPFxbq/Qb/bGH2zSC3jcYFtNnrFPtrtSNWbMRV6VyfRuqpfZKXF9u2spcYebx
         PkoHr0zwtnw6KKwIP1Xd6Uxgknka4AEs+RSQEcQ4QQxUgaXT5hAQiEM8q/qKMj+lwDb0
         YpCQ==
X-Gm-Message-State: ACrzQf2DzTvxpeGugBdi0ndcmSPcrRL7oCOnJKHCqP53y1SGbGkHybqf
        TRd3zOZmbEUIacZvwPtXMqRQfjMHoFTlVg==
X-Google-Smtp-Source: AMsMyM74aL9xicnJ9FfYC08WvuFW4l0We2TosJw9Pi3XXBpuc6OFh8OI9P3Bbhh7guPcsr/DjjmS3A==
X-Received: by 2002:a05:6a00:4211:b0:541:212b:e0cd with SMTP id cd17-20020a056a00421100b00541212be0cdmr9160103pfb.1.1663940938143;
        Fri, 23 Sep 2022 06:48:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b00172a670607asm6037469pln.300.2022.09.23.06.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 06:48:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5ce53d5a-532f-0d56-9a5a-c95c7c7b170b@roeck-us.net>
Date:   Fri, 23 Sep 2022 06:48:54 -0700
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
 <72fb8f04-52d1-af99-dfff-4a53ee3d3440@roeck-us.net>
 <a761d821-6beb-e4d7-b0c1-37178b3bacc2@norik.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH 0/1] Suspending i.MX watchdog in WAIT mode
In-Reply-To: <a761d821-6beb-e4d7-b0c1-37178b3bacc2@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/23/22 00:27, Andrej Picej wrote:
> On 22. 09. 22 16:56, Guenter Roeck wrote:
>> On 9/22/22 00:17, Andrej Picej wrote:
>>> Hi Guenter,
>>>
>>> On 21. 09. 22 16:18, Guenter Roeck wrote:
>>>> On 9/21/22 05:46, Andrej Picej wrote:
>>>>> Hi all,
>>>>>
>>>>> we are using i.MX6UL with its watchdog WDOG1 and kernel 5.15.62. It was
>>>>> discovered that the watchdog triggers reset when the device is put into
>>>>> 'Suspend-To-Idle' (WAIT) state.
>>>>>
>>>>
>>>> Is that equivalent to "suspend" from Linux perspective, or some other
>>>> mode ? How does the device get into this state ?
>>>
>>> I think WAIT mode maps to System idle mode in linux [1].
>>>
>>
>> Sorry, I am not going to read that entire manual.
>>
> 
> Perfectly understandable, you are busy guys, basically in chapter 21.1.1 it is written:
> "System idle maps to WAIT mode."
> 
>>> Sorry don't quite understand your second question.
>>> Do you mean how we trigger this state?
>>> We trigger this state with:
>>>  >     imx6ul-dev:~# echo freeze > /sys/power/state
>>>
>>
>> So it is not "suspend" ? I am not sure if it is appropriate to stop
>> the watchdog timer in this situation. Normally it is only stopped
>> in suspend mode.
>>
> 
> Well suspend/resume functions are still called when entering this "freeze" mode, but watchdog can not be disabled by software or pinged in this mode, that's why our idea is to set this bit.
> 
> Basically, that was my main question. Is it appropriate to stop watchdog in this situation? I guess not. Probably it is not meant to enter this mode for longer period of time.
> 
>> Also, how does this interact or interfere with the suspend/resume code
>> in the driver, and does it behave the same for all chips supported by
>> the driver ? For example, in the current code, i.MX7D is handled
>> differently. What compatible entry are you using anyway ? There is none
>> for i.MX6UL. Did you make sure that the same bit doesn't mean something
>> else for other chips ?
>>
> 
> I don't think it interact/interferes with suspend/resume code in any way since mx2+ watchdog is not stoppable during runtime. Not sure if watchdogs on other devices behave the same, sorry.
> 
> i.MX6UL devices use "fsl,imx6ul-wdt", "fsl,imx21-wdt" for compatible entry. I checked control registers with other supported devices by this driver:
> 
> - fsl,imx25-wdt (same behaviour -> WDW)
> - fsl,imx27-wdt (bit is reserved)
> - fsl,imx31-wdt (bit is reserved)
> - fsl,imx35-wdt (same behaviour -> WDW)
> - fsl,imx50-wdt (same behaviour -> WDW)
> - fsl,imx51-wdt (same behaviour -> WDW)
> - fsl,imx53-wdt (same behaviour -> WDW)
> - fsl,imx6q-wdt (same behaviour -> WDW)
> - fsl,imx6sl-wdt (same behaviour -> WDW)
> - fsl,imx6sll-wdt (same behaviour -> WDW)
> - fsl,imx6sx-wdt (same behaviour -> WDW)
> - fsl,imx6ul-wdt (same behaviour -> WDW)
> - fsl,imx7d-wdt (same behaviour -> WDW)
> - fsl,imx8mm-wdt (same behaviour -> WDW)
> - fsl,imx8mn-wdt (same behaviour -> WDW)
> - fsl,imx8mp-wdt (same behaviour -> WDW)
> - fsl,imx8mq-wdt (same behaviour -> WDW)
> - fsl,ls1012a-wdt (bit is reserved)
> - fsl,ls1043a-wdt (bit is reserved)
> - fsl,vf610-wdt (same behaviour -> WDW)
> - fsl,imx21-wdt (reserved)
> 

And then there is fsl,imx7ulp-wdt which has its own driver.

> Looking at this table WDW is not really i.MX6UL specific. It is strange that more people don't experience this problem. I guess using "freeze" mode is not very common, which is understandable, since other low power modes are more energy efficient.
>  > Anyway, if some people are using this "feature" of watchdog for WAIT mode supervision, setting this bit would break their use. I just wanted to get your opinion on this, which I got.
> 

Oh, no, you are just giving up too early.

Other watchdogs do get stopped in suspend. That is why the suspend function
exists and is used in watchdog drivers in the first place. Yes, fsl,imx21-wdt
can not handle that, but that doesn't mean that others can't either. The
current workaround for fsl,imx21-wdt is to set the timeout to the maximum
and to stop the watchdog timer clock. You say that the suspend function is
called, so the watchdog clock _should_ be stopped. However, it looks like
that is not the case. Can you try to figure out the reason ?

Either case, I think it would be worthwhile exploring if the WDW bit can
be used on the CPUs supporting it to stop the watchdog in suspend mode.
How does your sysytem behave if put into suspend ? Does the watchdog still
reset it ? How is the watchdog clock configured ?

Thanks,
Guenter
