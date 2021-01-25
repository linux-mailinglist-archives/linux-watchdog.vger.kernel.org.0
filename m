Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38305304476
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jan 2021 18:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbhAZGBN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jan 2021 01:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55384 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728998AbhAYNku (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jan 2021 08:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611581952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3IjtZuDDA2/cFI4YzNshXxFpENBPrTYgWly++K/E6vI=;
        b=FTOQDs3+kx7Styv0W6rp/SVH6WPWqCqYKMjv9IwM68Z5xRVVoKnCNBaxP1kgrC4wRar92v
        YDtV8q60HUMO4TOMkcYTnqq7UytpmPHIl9lGaJkTYvIgzSlD3KFO/Duk1B8VCD667EjkTT
        DTR44zXGzxM5DRId+zgiNpdreMrGv7M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-RZNHXejiPcSg5zLmKoPI1Q-1; Mon, 25 Jan 2021 06:23:06 -0500
X-MC-Unique: RZNHXejiPcSg5zLmKoPI1Q-1
Received: by mail-ed1-f69.google.com with SMTP id t9so7192711edd.3
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Jan 2021 03:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3IjtZuDDA2/cFI4YzNshXxFpENBPrTYgWly++K/E6vI=;
        b=XKPfchbPD9rvpwrDSfbJUsCa9nLfIVVAz6NSk3GvFGs+hKZZI5wXviEn86D7lYWrs8
         1RJyBotp9n1Vjdi3IEcXEuafZAqRDPvegjX1VIJ9V5sUq9s8hwzJ7+8gGM2/zDQo2Z8V
         88KbnGmVhey43IuTEhSF+mid7rxFogJxxcyQbWmLZeXAm92NsDkUt4t+SkyjKMOADKp/
         szo22I/n0t4vuG5oapIQExDDfoVRF+USZETAjhyI4ZETbDY06qqUCSyvpPW7upaSNQdh
         gDT+fxIC4uKjmg4oy0KdoVpBx/KAzQhAjXRzCKrga7+WWEJIlAm1kMVjBdV8DPJPOGoH
         o00g==
X-Gm-Message-State: AOAM530Hon+YK6Jb37+dkVDMUyGywHn3Z5kdhzyZXunAwSJCSaXAsqdZ
        nWFxHinNeTCZVkRBuQ1Ee3732LYZ07zABeawWikc4OJTm2mtZwlBH7AIIYL5+F0xL5sQy3Wakh3
        iB7wiwZySSqi5e7DJzupphNRoDLk=
X-Received: by 2002:a05:6402:1655:: with SMTP id s21mr30001edx.360.1611573785181;
        Mon, 25 Jan 2021 03:23:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/lEmC0ELKChTQcbvuINIiOY64kpZ3OjM5r5wqEI0r3THJrzBNCnSmjQlGeR2B6SaYkRQ1jQ==
X-Received: by 2002:a05:6402:1655:: with SMTP id s21mr29986edx.360.1611573785032;
        Mon, 25 Jan 2021 03:23:05 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id x25sm10187897edv.65.2021.01.25.03.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 03:23:04 -0800 (PST)
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
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
 <eeda93c6-04cb-a775-7d79-b29a53c6a138@redhat.com>
 <CAHp75VdE4LSHTKLuZ6x744224N2AvbMU0JeMmTWoqeEHDj7=2A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f89f2650-73aa-337d-5219-141cd1a2ba32@redhat.com>
Date:   Mon, 25 Jan 2021 12:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdE4LSHTKLuZ6x744224N2AvbMU0JeMmTWoqeEHDj7=2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 1/25/21 12:15 PM, Andy Shevchenko wrote:
> On Sat, Jan 23, 2021 at 2:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/23/21 1:27 AM, Guenter Roeck wrote:
>>> On 1/22/21 1:04 PM, Hans de Goede wrote:
>>>> On 1/22/21 4:45 PM, Andy Shevchenko wrote:
>>>>> On Fri, Jan 22, 2021 at 05:22:25PM +0200, Andy Shevchenko wrote:
>>>>>> On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:
> 
>>>>>>> What is the plan for merging this series ?
>>>>>>>
>>>>>>> It touches files under:
>>>>>>> arch/x86
>>>>>>> drivers/watchdog
>>>>>>> drivers/platform/x86
>>>>>>>
>>>>>>> It is probably best if the entire series is merged through a single
>>>>>>> tree. I don't expect this to cause any conflicts with current / upcoming
>>>>>>> changes under drivers/platform/x86, so I'm fine with this being merged
>>>>>>> through another tree.
>>>>>>>
>>>>>>> Or if I can get an ack for that from the x86 and watchdog maintainers
>>>>>>> I can merge the entire series through the pdx86 tree.
>>>>>>
>>>>>> For time being I'm collecting tags and comments.
>>>>>> As of today this series is independent per se, but other (later) clean up
>>>>>> patches may rely on this.
>>>>>>
>>>>>> One strategy can be providing an immutable branch for anybody who wants it and
>>>>>> merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
>>>>>> are more patches touching other stuff, though independently, in this matters).
>>>>>
>>>>> Yes, I think one more time and guess the best is:
>>>>>  - get tags from x86 / watchdog
>>>>>  - get tag from RTC
>>>>>  - collect everything in PDx86 immutable branch
>>>>
>>>> Ok, that works for me. I assume that it is best for the other subsystems
>>>> if I create an immutable branch for this based on 5.11-rc1
>>>> (and then merge that into pdx86/for-next) ?
>>>>
>>>> Guenter, I believe you have already reviewed all the watchdog changes,
>>>> are you ok with me creating an immutable branch for the entire series
>>>> and then sending you a pull-req for that ?
>>>
>>> Wim handles watchdog pull requests,
> 
> Wim, can you Ack the watchdog changes?
> 
>> Ah, sorry I was under the impression you would do that because you were
>> doing the reviews (which I'm sure Wim appreciates).
>>
>>> and he usually creates a branch
>>> for Linus to pull from either during or shortly before a commit window.
>>> Also, I don't immediately see why the watchdog tree should carry the other
>>> patches of this series, immutable or not; I would not expect a dependency
>>> against those.
>>>
>>> Anyway, I am fine if the the wdt driver removal is submitted through some
>>> other branch.
>>
>> Hmm, looking at the code again it indeed seems that patch 1/5 + 2/5 could
>> be simply merged through the watchdog tree, as they don't appear to
>> have any interdependencies with the arch/x86 and drivers/platform/x86
>> changes.  Andy ?
> 
> The first patch is a dependency to the later (that are not published yet).
> I was considering gathering all dependent patches in immutable
> branches and doing in three parts / phases.
> 
> I can prepare a branch with a first batch (with Acks from respective
> maintainers) and send a PR to you.
> Would it work?

I guess you would then publish this as an immutable branch yourself and
send a PR to all involved subsys-maintainers ?

You have commit rights to the pdx86/platform-drivers-x86 git repo if
I'm not mistaken, so you could publish the immutable branch there if
you want.

That actually sounds like a good plan to me, assuming the other maintainers
are ok with it too.

Regards,

Hans

