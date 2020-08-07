Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0AF923F537
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Aug 2020 01:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgHGXX5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 19:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgHGXX5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 19:23:57 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E24DC061756;
        Fri,  7 Aug 2020 16:23:57 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s15so1760337pgc.8;
        Fri, 07 Aug 2020 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xeyRmBMtht9F/95S4PxaQKGge21ituHAnotfo3X2meM=;
        b=tbgt4hQD25W0pSZ4Yo1gL5rlx4vXvb5c8AoYeLxH7hDkreXBP6TPVD9o8Zsz6/ZnyK
         wyB0bx6N1agIUqBg8EgdLh/oVN2O9Q4tfcNsiHUHpJFzfHYWFOK6l7O3pGuheYPbSUaX
         5iKHRtYQjY6+93o9FWMXXzPEfv96ArfmOam9O/8B4JuEn0lqDDK/48CtPbaEo2IV9Q2y
         FQwU7zqaqgT9nGYA6i2BeZeKRkG8ybDhL58HeEucPFOdijNw5TgJBqc8s/8NazrbkEj+
         pAlJ0fCgLFlsm8GLjX5vx07s9r+GfHpI2LuwHlextoMmBhUruN0L2ng6+kVHNrfe7/hj
         NXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xeyRmBMtht9F/95S4PxaQKGge21ituHAnotfo3X2meM=;
        b=jo8zuUEuPRVzDuCSnZ5l0m/eb+ApggHCdZ++f0MnK/bJG2dmoceinEs8ZllJbevp9F
         bVXQCEdExhonCyAcwNyqfMfjYKLfvMqhCkZ5ooW8CW4QnZMuQflBC2/6K4biYCnKVUVb
         jAucACc7fI/muzkqdgC5jBbcQMibQ1pqoYz39GE1wQuL4ImlwloYbouKi2H0pSg5SItQ
         9IZ9gMymcoFmUKCkcFDg/Bzi+amO2C5jLn4zX77lmbo1WCrI5F9HuL8J4XUWZSbBp6Xq
         rgy9dDXjkonLIRCGe4qCSCrXdhIdILc09m/UCkRv1NybgFGotFE2qX1aePtM+Xmc4pSz
         02QA==
X-Gm-Message-State: AOAM530PVO3U1OEglilx/nHSAmxLFmM6SS6vO+W7schxFaNtHtbDpI7I
        ODiU060wBDnJ1Ar97EBvIZ4=
X-Google-Smtp-Source: ABdhPJxtxxnjrXzFAkYLWm5oN6dnVTBjVXaMrPs4pgZ95x0fTux1eUaR/zbm6jwHH9YkyAPR3qH7DA==
X-Received: by 2002:a62:7dd5:: with SMTP id y204mr16088852pfc.318.1596842636725;
        Fri, 07 Aug 2020 16:23:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u21sm12165863pjn.27.2020.08.07.16.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 16:23:55 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
To:     Florian Fainelli <f.fainelli@gmail.com>,
        madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net>
 <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
 <bc8c5d7d-91a4-e955-854f-eef88812ac1a@roeck-us.net>
 <1b9db5ad-0edf-091b-a04e-a8f3a6ac08e2@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c7a03401-2c50-868b-57b0-ae3c0bd61e70@roeck-us.net>
Date:   Fri, 7 Aug 2020 16:23:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1b9db5ad-0edf-091b-a04e-a8f3a6ac08e2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Florian,

On 8/7/20 1:09 PM, Florian Fainelli wrote:
> 
> On 8/7/2020 12:08 PM, Guenter Roeck wrote:
>> On 8/7/20 11:08 AM, Florian Fainelli wrote:
>>>
>>>
>>> On 8/7/2020 9:21 AM, Guenter Roeck wrote:
>>>> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>>>>> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>>>
>>>>> In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>>>>> after misc_register(), hence if ioctl is called before its
>>>>> initialization which can call rdc321x_wdt_start() function,
>>>>> it will see an uninitialized value of rdc321x_wdt_device.queue,
>>>>> hence initialize it before misc_register().
>>>>> Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>>>>> function called from write callback, thus initialize it before
>>>>> misc_register().
>>>>>
>>>>> Found by Linux Driver Verification project (linuxtesting.org).
>>>>>
>>>>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>>
>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>
>>>> Having said that ... this is yet another potentially obsolete driver.
>>>> You are really wasting your (and, fwiw, my) time.
>>>>
>>>> Florian, any thoughts if support for this chip can/should be deprecated
>>>> or even removed ?
>>>
>>> I am still using my rdc321x-based SoC, so no, this is not obsolete as
>>> far as I am concerned, time permitting, modernizing the driver is on my
>>> TODO after checking/fixing the Ethernet driver first.
>>>
>>
>> Do you have a manual ? I'd give it a try if you can test it - conversion
>> should be simple enough (I have a coccinelle script which partially
>> automates it), but this chip seems to have a fast timeout, and the
>> comments in the code ("set the timeout to 81.92 us") seem to be quite
>> obviously wrong.
> 
> Yes, there is a public manual for that SoC, search for RDC R8610 and the
> first link you find should be a 276 page long manual for the SoC.
> 

I found two, one for R8610 and one for R8610-G. Unfortunately, none of those
describes the use of bit(31) in the watchdog register, nor the meaning
of bit(12) and bit(13). Bit(31) is described in the code as "Mask",
and it is set by a couple of commands. I _suspect_ that bit(31) has to be
set to change some of the register bits, for example the counter value.
That is just a wild guess, but it would explain why the driver works
in the first place.

It is also not clear if the bits in the counter register are accumulative
or if only the highest bit counts. The datasheets suggest that only the
highest bit counts, but then the value of RDC_CLS_TMR doesn't make much
sense since it sets two bits.

Since you wrote the driver, I was hoping that you might have a datasheet
which explains all this in more detail.

Thanks,
Guenter
