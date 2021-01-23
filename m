Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4943014F9
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 13:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbhAWMHQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 07:07:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57710 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726702AbhAWMHO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 07:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611403547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FrqhDx/yfs8o1a6U/G7NdQ0fMpLKUQbILxw1+XT5R6c=;
        b=T3Xk0usWCpOVns3aM1PR+0JsOpRiT0pMeI62IxGdRJAlJ8PMqU+DwjsgmPxNtc3KB4ndCl
        fGWK3hUWSW0WwHWsIA4UkIFJPWUoFdIkZwzULLUuaMl3YQwxT88G/q7e93a9xhoQtgQI9N
        aodJDxl2f1Ciw2y0XwMWM9g5Y7pKijQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-a7QKpX2qMIObPFGXOM6FKg-1; Sat, 23 Jan 2021 07:05:45 -0500
X-MC-Unique: a7QKpX2qMIObPFGXOM6FKg-1
Received: by mail-ed1-f71.google.com with SMTP id dg17so4415089edb.11
        for <linux-watchdog@vger.kernel.org>; Sat, 23 Jan 2021 04:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FrqhDx/yfs8o1a6U/G7NdQ0fMpLKUQbILxw1+XT5R6c=;
        b=uQUsDGI0AhOm/xjYamONYpzl8x/7qbKzPS4XyGThgRsolqPCTZz1xhH/ehuKkoBJh5
         PwIlQD1xX6CY+hNrx77MLyRLpFfD4VMt42+E8AzcMeqIxwCgNBfUQQrNotuoD3HlTSRo
         PKu1qGkolT47oRDLmW+v+7dCBuC52+lRbXsADrrFRGVfk34Hv3sNu1us2jSwG0mqj8+P
         HnjuS7DWFJfnMSagFExl+WgFDuzEpXWyObThND58E49IuNuAM+q+4MV9M894KARwBSy2
         lG0JKXjOtvsR58XvSBBFoBjyi+SVpQo1VAgo9FSY+vD4lqnkhpK5skZ3psyCsgFHIXSt
         vbBA==
X-Gm-Message-State: AOAM530d1xsaET3rtcU8Ild4qewJZFI1EQK5AZLlfktk7sWEogLVV9gk
        gkIo/2a+IVbjcc1rqzHXSai/1VTTEWGsZSMVfyXVb8gWww/A2hUFdax1Nn3mi/gassGcDcXbjfT
        oMmXJkLKw8FrAtJEBnDYHKlTjV6o=
X-Received: by 2002:a05:6402:2694:: with SMTP id w20mr1314088edd.200.1611403544743;
        Sat, 23 Jan 2021 04:05:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl7sfTlMMK3NC9zcuZWcwZrF9+px1pGLBvlNPqv9ywmJa/qm4iAqCnIrMwgQEnnCdYnoYBDQ==
X-Received: by 2002:a05:6402:2694:: with SMTP id w20mr1314081edd.200.1611403544610;
        Sat, 23 Jan 2021 04:05:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id x2sm5604125eds.51.2021.01.23.04.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jan 2021 04:05:43 -0800 (PST)
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
To:     Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com>
 <YArtsQSQsGdfNlBI@smile.fi.intel.com> <YArzAvcZXfv8DaI4@smile.fi.intel.com>
 <4ba64643-9254-055d-49a0-55104b8669d8@redhat.com>
 <1d57c7b0-9ef4-3306-1566-2b99f40d92d1@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <eeda93c6-04cb-a775-7d79-b29a53c6a138@redhat.com>
Date:   Sat, 23 Jan 2021 13:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1d57c7b0-9ef4-3306-1566-2b99f40d92d1@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

HI,

On 1/23/21 1:27 AM, Guenter Roeck wrote:
> On 1/22/21 1:04 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 1/22/21 4:45 PM, Andy Shevchenko wrote:
>>> +Cc: Arnd, RTC maintainers, Lee
>>>
>>> On Fri, Jan 22, 2021 at 05:22:25PM +0200, Andy Shevchenko wrote:
>>>> On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> What is the plan for merging this series ?
>>>>>
>>>>> It touches files under:
>>>>> arch/x86
>>>>> drivers/watchdog
>>>>> drivers/platform/x86
>>>>>
>>>>> It is probably best if the entire series is merged through a single
>>>>> tree. I don't expect this to cause any conflicts with current / upcoming
>>>>> changes under drivers/platform/x86, so I'm fine with this being merged
>>>>> through another tree.
>>>>>
>>>>> Or if I can get an ack for that from the x86 and watchdog maintainers
>>>>> I can merge the entire series through the pdx86 tree.
>>>>
>>>> For time being I'm collecting tags and comments.
>>>> As of today this series is independent per se, but other (later) clean up
>>>> patches may rely on this.
>>>>
>>>> One strategy can be providing an immutable branch for anybody who wants it and
>>>> merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
>>>> are more patches touching other stuff, though independently, in this matters).
>>>
>>> Yes, I think one more time and guess the best is:
>>>  - get tags from x86 / watchdog
>>>  - get tag from RTC
>>>  - collect everything in PDx86 immutable branch
>>
>> Ok, that works for me. I assume that it is best for the other subsystems
>> if I create an immutable branch for this based on 5.11-rc1
>> (and then merge that into pdx86/for-next) ?
>>
>> Guenter, I believe you have already reviewed all the watchdog changes,
>> are you ok with me creating an immutable branch for the entire series
>> and then sending you a pull-req for that ?
>>
> 
> Wim handles watchdog pull requests,

Ah, sorry I was under the impression you would do that because you were
doing the reviews (which I'm sure Wim appreciates).

> and he usually creates a branch
> for Linus to pull from either during or shortly before a commit window.
> Also, I don't immediately see why the watchdog tree should carry the other
> patches of this series, immutable or not; I would not expect a dependency
> against those.
> 
> Anyway, I am fine if the the wdt driver removal is submitted through some
> other branch.

Hmm, looking at the code again it indeed seems that patch 1/5 + 2/5 could
be simply merged through the watchdog tree, as they don't appear to
have any interdependencies with the arch/x86 and drivers/platform/x86
changes.  Andy ?

Regards,

Hans

