Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7425D23F595
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Aug 2020 02:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgHHAmG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 20:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgHHAmG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 20:42:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D561C061756;
        Fri,  7 Aug 2020 17:42:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k18so2017920pfp.7;
        Fri, 07 Aug 2020 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OWmRiiY1ajUidkV+ex1iLiz+iRJer13P1EHnmTWY5Y8=;
        b=eRS9r27SO6tSzYjU9IP97NXHnwEnUIMU/P2Xy1XvRvbFj6M+LDWTDSpdt1H+rnP/DK
         LZUWqUFbiLmqsGoBD/4gaURPaa2KdOrky1VLLqmDi+MmCSYI8/6UbGikMNeVt/2INtss
         fVThHADAd6sPvNTa0Lu6vJiEmg18tYxci3Gd+hdRlncFQckAkKue3NN2LXjjAR+gSMzi
         q4ZRFK1skIHoP27yvDI8U4onBJWygua6Kqs8fmarWIr8RZLX6NKJHjT4dNAsWGcwoOQF
         kijhkmucP39glx74qFTGaWmyhW8atlIjcoAOGmixqsLX9t1E0aSo2Mb/HMgRoOmJLjzp
         AE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OWmRiiY1ajUidkV+ex1iLiz+iRJer13P1EHnmTWY5Y8=;
        b=OC1IBjLSNXEmTYjCjdkjKeySJ768CTFtXFVPZsyJHTdQrnfOmovCTLWQPAJoqA2ess
         dM1tH0N6nIKw9td/RXmYFnIMyOqdv54kBfUBWwEqVzhL6TPCHhgb97pT8zjMb2I9sbrB
         q3kEez0dER1YQrdc5b+GWA7Yiq5DfQE98C0SquwIvIK29T4M5ZmyKRZaIUjmfLTj0euO
         rEOHm7ZpFD/ZrHQ8cRObWexqg9GMiI4OUQAhMNKpEEgDpOhPg6OgXapkl3YyXzpNFDuF
         8C9iXTZLngRHHf2N+ZIYEjFyDg1NDH4IADyVy/cN5vl+Vbj4eJAAXfpDSRzLLdKfyNXp
         ncIQ==
X-Gm-Message-State: AOAM530GK8UxPM/eM3ETZxW1RfKMUoXOhHUYQOp4/Zt+1SN6LjnQCCMa
        JObtey+XJeSncbDSkmMg+wA=
X-Google-Smtp-Source: ABdhPJwsxoW/t8ROjo8qhKS1fYcEX/4qKZdm33HQWAXI4UXV+w3EwSAge+KxW+HLE8Yz5vD8gQGUEA==
X-Received: by 2002:a63:9256:: with SMTP id s22mr11833063pgn.75.1596847325753;
        Fri, 07 Aug 2020 17:42:05 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h5sm14230583pfq.146.2020.08.07.17.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 17:42:05 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
To:     Guenter Roeck <linux@roeck-us.net>, madhuparnabhowmik10@gmail.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrianov@ispras.ru,
        ldv-project@linuxtesting.org
References: <20200807112902.28764-1-madhuparnabhowmik10@gmail.com>
 <20200807162141.GA41980@roeck-us.net>
 <8dca64a1-8cd9-6a41-b61d-1c4c14e5cd5e@gmail.com>
 <bc8c5d7d-91a4-e955-854f-eef88812ac1a@roeck-us.net>
 <1b9db5ad-0edf-091b-a04e-a8f3a6ac08e2@gmail.com>
 <c7a03401-2c50-868b-57b0-ae3c0bd61e70@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5c048af7-e7b0-4928-9088-b0bbbcfab0ed@gmail.com>
Date:   Fri, 7 Aug 2020 17:41:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c7a03401-2c50-868b-57b0-ae3c0bd61e70@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/7/2020 4:23 PM, Guenter Roeck wrote:
> Hi Florian,
> 
> On 8/7/20 1:09 PM, Florian Fainelli wrote:
>>
>> On 8/7/2020 12:08 PM, Guenter Roeck wrote:
>>> On 8/7/20 11:08 AM, Florian Fainelli wrote:
>>>>
>>>>
>>>> On 8/7/2020 9:21 AM, Guenter Roeck wrote:
>>>>> On Fri, Aug 07, 2020 at 04:59:02PM +0530, madhuparnabhowmik10@gmail.com wrote:
>>>>>> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>>>>
>>>>>> In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
>>>>>> after misc_register(), hence if ioctl is called before its
>>>>>> initialization which can call rdc321x_wdt_start() function,
>>>>>> it will see an uninitialized value of rdc321x_wdt_device.queue,
>>>>>> hence initialize it before misc_register().
>>>>>> Also, rdc321x_wdt_device.default_ticks is accessed in reset()
>>>>>> function called from write callback, thus initialize it before
>>>>>> misc_register().
>>>>>>
>>>>>> Found by Linux Driver Verification project (linuxtesting.org).
>>>>>>
>>>>>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>>>>
>>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>>>
>>>>> Having said that ... this is yet another potentially obsolete driver.
>>>>> You are really wasting your (and, fwiw, my) time.
>>>>>
>>>>> Florian, any thoughts if support for this chip can/should be deprecated
>>>>> or even removed ?
>>>>
>>>> I am still using my rdc321x-based SoC, so no, this is not obsolete as
>>>> far as I am concerned, time permitting, modernizing the driver is on my
>>>> TODO after checking/fixing the Ethernet driver first.
>>>>
>>>
>>> Do you have a manual ? I'd give it a try if you can test it - conversion
>>> should be simple enough (I have a coccinelle script which partially
>>> automates it), but this chip seems to have a fast timeout, and the
>>> comments in the code ("set the timeout to 81.92 us") seem to be quite
>>> obviously wrong.
>>
>> Yes, there is a public manual for that SoC, search for RDC R8610 and the
>> first link you find should be a 276 page long manual for the SoC.
>>
> 
> I found two, one for R8610 and one for R8610-G.

The R8610-G datasheet is the one that I have had and used thus far.

> Unfortunately, none of those
> describes the use of bit(31) in the watchdog register, nor the meaning
> of bit(12) and bit(13). Bit(31) is described in the code as "Mask",
> and it is set by a couple of commands. I _suspect_ that bit(31) has to be
> set to change some of the register bits, for example the counter value.
> That is just a wild guess, but it would explain why the driver works
> in the first place.
> 
> It is also not clear if the bits in the counter register are accumulative
> or if only the highest bit counts. The datasheets suggest that only the
> highest bit counts, but then the value of RDC_CLS_TMR doesn't make much
> sense since it sets two bits.
> 
> Since you wrote the driver, I was hoping that you might have a datasheet
> which explains all this in more detail.

I do not, and this was over 12 years ago, and I honestly do not recall
all the details, when I get the board running a newish kernel, I will
poke around.
-- 
Florian
