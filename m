Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90AF35CAC9
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Apr 2021 18:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243252AbhDLQHG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Apr 2021 12:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243273AbhDLQGi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Apr 2021 12:06:38 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F95CC06174A;
        Mon, 12 Apr 2021 09:06:13 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id t17-20020a9d77510000b0290287a5143b41so2047216otl.11;
        Mon, 12 Apr 2021 09:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wAVNn8xjtubClg/NLnom971ZmZvav5KGD7/XW7E7Eqc=;
        b=OP//Ho27GAV+3aJZdg3aQRO0ILpu6XmkAQgbRto+0cSjwlgcLB1MK95yqfaGgiV2Zf
         NhWeLse4ZmWXBJbXLKckEnDcz8nPzSzxcqQHxsXaS399IJBdQ44hmMsl0n7cSj1fdYpP
         au3zLHesnjevdSCkwZOVxoR2M5XuufaAXdRFB9kRkU0whhrp8i6a+4p0TwXDa/H2XHcl
         L9nzu4aNzZJpK4/z3nOzuBNNr30e8TdAN+YvJjlMRF8pmOlhWC6zAXffZVpX3s+SdRAk
         QYHJQ+f3jyRQFZj5zix7yM1rHLdvhOMgh3SXJ8/6GUB5TKgoxTa5aG6wT6uk634lqOVt
         62Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wAVNn8xjtubClg/NLnom971ZmZvav5KGD7/XW7E7Eqc=;
        b=fB0Z4qTQIBbGmNm9vpHqW6wJdPqjyMdmboFqqIvDk0wOSiZQpnrXWcqLKNTMr2IzXG
         RHGna9fzSpJkxxZpCudl84N07lePCsWXeYJRoGitatZ8XPqR62qDquoaaovYF2tdcO0N
         4jC4QR/5Ij2rvnFzCtFsAFUnlc6DTzW941mG66VxMt8bFKo2r3axB454mXj0EVXHLOzN
         1QhprbLv9YU3+Kd4ZV3Ky8d7mTZo2jl22wErmZLhoGWaSD79iUlD0EqdCU+dYrJMjvYd
         WWXIGBjrg5qA8qPPxlZLQn9tyPFyIsS+zwaXhmWO/kuuyFb0lgnfl+DpJZnjVfpeHkMc
         h2vQ==
X-Gm-Message-State: AOAM533EDq6lxRSI6dM1q9zXVLt/Jg2D/H8VDXFQGHglWt+i9+e2mYQc
        rNkpCn6Seigfwor7TRHaYo0=
X-Google-Smtp-Source: ABdhPJxkOEBXn+Cj32kONEXGH/3fOBwxDFYEPISSWiI7EfVt/Y6ZXsVFAuwRo4oWtta/7ekrAX6X4A==
X-Received: by 2002:a9d:bc9:: with SMTP id 67mr25249111oth.352.1618243572975;
        Mon, 12 Apr 2021 09:06:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q23sm27822otc.7.2021.04.12.09.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 09:06:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20210329174928.18816-1-henning.schild@siemens.com>
 <20210329174928.18816-4-henning.schild@siemens.com>
 <ffdfe9a9-ab17-18af-300e-062b79d132f3@metux.net>
 <20210412173531.4140e461@md1za8fc.ad001.siemens.net>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <610b566d-10a8-fa6b-145d-db7a453f97cf@roeck-us.net>
Date:   Mon, 12 Apr 2021 09:06:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412173531.4140e461@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/12/21 8:35 AM, Henning Schild wrote:
> Am Thu, 1 Apr 2021 18:15:41 +0200
> schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:
> 
>> On 29.03.21 19:49, Henning Schild wrote:
>>
>> Hi,
>>
>>> This driver adds initial support for several devices from Siemens.
>>> It is based on a platform driver introduced in an earlier commit.  
>>
>> Where does the wdt actually come from ?
>>
>> Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a pretty 
>> usual case.
>>
>> Or some external chip ?
>>
>> The code smells a bit like two entirely different wdt's that just have
>> some similarities. If that's the case, I'd rather split it into two
>> separate drivers and let the parent driver (board file) instantiate
>> the correct one.
> 
> In fact they are the same watchdog device. The only difference is the
> "secondary enable" which controls whether the watchdog causes a reboot
> or just raises an alarm. The alarm feature is not even implemented in
> the given driver, we just enable that secondary enable regardless.
> 

Confusing statement; I can't parse "we just enable that secondary enable
regardless". What secondary enable do you enable ?

The code says "set safe_en_n so we are not just WDIOF_ALARMONLY", which
suggests that it disables the alarm feature, and does make sense.

> In one range of devices (227E) that second enable is part of a
> pio-based control register. On the other range (427E) it unfortunately
> is a P2SB gpio, which gets us right into the discussion we have around
> the LEDs.
> With that i have my doubts that two drivers would be the way to go,
> most likely not. 
> 

Reading the code again, I agree. Still, you'll need to sort out how
to determine if the watchdog or the LED driver should be enabled,
and how to access the gpio port. The GPIO pin detection and use
for 427E is a bit awkward.

Thanks,
Guenter

> Only that i have no clue which pinctrl driver should be used here. My
> guess is "sunrisepoint" because the CPUs are "SkyLake" i.e. i5-6442EQ,
> i3-6102E
> And "grep INT344B /sys/firmware/acpi/tables/DSDT" matches. I booted a
> kernel patched with the series from Andy but the "pinctrl-sunrisepoint"
> does not seem to even claim the memory. Still trying to understand how
> to make use of these pinctrl drivers they are in place but i lack
> example users (drivers). If they should be available in sysfs, i might
> be looking at the wrong place ... /sys/class/gpio/ does not list
> anything
> 
> regards,
> Henning
> 
> 
> 
>>
>> --mtx
>>
> 

