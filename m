Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C1F1026A6
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2019 15:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfKSO3P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Nov 2019 09:29:15 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46192 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbfKSO3O (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Nov 2019 09:29:14 -0500
Received: by mail-pg1-f194.google.com with SMTP id r18so11413684pgu.13;
        Tue, 19 Nov 2019 06:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wy/0pAle2bZtclFjkoUE1xo0n8AZMzVXDMErGESZPSI=;
        b=Kik3fPUuhBlnAZH9HSQfmxytQHuv7nlMTM4XkbkmSNuJW7wbTI2v8uhj5G47bNFOfO
         BE4PgyJx3ZPGGx4K51K9AWJMX1U7lzVM6jdvkoJAVNQ8nyRecQzGAt6T+MTdvEjztBpq
         XWXQSKGG4ZbScqVK8Gr6pbN2iUYcL9oZUQ46Z0VYE1GVRycJphk4CIJXCm00U27TxmMD
         Gs7a9SJ1boEQXQ5/ZWvaqLzOFeC1USH3CSoFR5bb1EkshLwjMSq4Y0mXhVRJoFbwleNF
         udlroKICE4MBQjQye3yBh4TiUlwyHHsUf9wva4MIeVibL8wv36/eLPsn2OoFvJaUvc4R
         iN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wy/0pAle2bZtclFjkoUE1xo0n8AZMzVXDMErGESZPSI=;
        b=W4wV2nGBCtNP/2nSk6Gm+y6kgo9KWuDw9Dr2YH0FcJQFoJdwbTQskV09LxuCgAE9IV
         ZWj7Trh7Xz4b2cbwQkMM7JWGdjJ3Pb7QmyR0GBXPa39fkgHZGBZTsBPbgtiO6GRq+7Vi
         4gwDDg/Al23SSlrPNwhCeBUGyVihloIJzmTAQrfTzF5B+1trfjv0jPF4PtfnyK3V2KgY
         kb41lAXHhb7woRHQEz2b+TiZIsFRLiD8ig4V3mCOd9QFVX11JzchNnQCliSQWvGHyaxu
         dH+FNCo1Q2uHYacaLPFS5fsjWW/NaE15tklKomdg5eIa2ZXRtOxHdJXzlb2FIXDxbc9+
         OE9g==
X-Gm-Message-State: APjAAAXDx8wuXmvuTfy5TxjHk9iUp9JKvNdsaBfUXV1XopAfohrm2x1O
        1f+u5Iuy7CD0Mb0qk/ZSLEW+2Wri
X-Google-Smtp-Source: APXvYqyTFUSxptid+dDQcXnXBtbX603rHUsfst8tSAKgMpuZ5E5sE1Hu5j6XDasBeiBwPHlSmGi3kA==
X-Received: by 2002:a63:1b1f:: with SMTP id b31mr2819735pgb.177.1574173752437;
        Tue, 19 Nov 2019 06:29:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m68sm14120378pfm.85.2019.11.19.06.29.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 06:29:11 -0800 (PST)
Subject: Re: [PATCH] watchdog: Remove iop_wdt
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Lennert Buytenhek <kernel@wantstofly.org>
References: <20191118220432.1611-1-labbott@redhat.com>
 <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
 <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4f283ab6-0f3c-60e9-cfd1-29d10d978986@roeck-us.net>
Date:   Tue, 19 Nov 2019 06:29:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0=3J3WHTKU7sPvd37VEwg3wOuZ5S2-xXtNYEcSQhWyHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/19/19 1:40 AM, Arnd Bergmann wrote:
> On Tue, Nov 19, 2019 at 3:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/18/19 2:04 PM, Laura Abbott wrote:
>>>
>>> Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
>>> removed support for some old platforms. Given this driver depends on
>>> a now removed platform, just remove the driver.
>>>
>>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>>> ---
>>> Found this while reviewing config options. Not sure if this was kept
>>> around for other reasons or just missed.
>>> ---
>>>    drivers/watchdog/Kconfig   |  16 ---
>>>    drivers/watchdog/Makefile  |   1 -
>>>    drivers/watchdog/iop_wdt.c | 249 -------------------------------------
>>>    3 files changed, 266 deletions(-)
>>>    delete mode 100644 drivers/watchdog/iop_wdt.c
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 58e7c100b6ad..fef9078a44b6 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -554,22 +554,6 @@ config PNX4008_WATCHDOG
>>>
>>>          Say N if you are unsure.
>>>
>>> -config IOP_WATCHDOG
>>> -     tristate "IOP Watchdog"
>>> -     depends on ARCH_IOP13XX
>>> -     select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)
>>
>> This is a bit confusing, but it suggests that the watchdog may also work
>> with ARCH_IOP32X, which is still supported. I don't know anything about
>> those architectures, but I hesitate to have the driver removed unless
>> we have confirmation that it won't work with ARCH_IOP32X.
>> Maybe the dependency needs to be updated instead ?
> 
> See commit ec2e32ca661e ("watchdog: iop_wdt only builds for
> mach-iop13xx") from 2014: the watdog hardware exists on iop32x
> but the driver only successfully built on iop13xx, which is now gone.
> 
> Adding Russell (who said he still uses iop32x hardware) and Lennert
> (who is still listed in the MAINTAINERS file, but previously said he
> does not use it any more) to Cc. If neither of them see a reason to
> keep the driver, I'd say we can remove it.
> 
> It seems unlikely that anyone wants to revive the driver if they have
> not done it yet, and if they want to do it later, it is barely harder to revert
> the removal than to fix the compile-time problem.
> 

Good point, especially since apparently no one cared for five years.

Guenter
