Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764EB356BF0
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Apr 2021 14:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238686AbhDGMRZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Apr 2021 08:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbhDGMRY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Apr 2021 08:17:24 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BBFC061756;
        Wed,  7 Apr 2021 05:17:15 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so17859153oto.2;
        Wed, 07 Apr 2021 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=70+GcYXrhuJrP0UYwYv+CFmEhXNJE1a7+ZVUXRbKnYk=;
        b=j4ySgEnWvK4MFx5Z5ZTK9SCd+znXPVQXbqki0JCF//Ijj6eFMYRsT/cQwYQg4jkriM
         rufwOTxrYpmHFAb5yuwzhOUYxcZ4XcCeLqdOF5QDmu3cU/IIQPQ4iAJ2JS1sbICFLJzo
         OP5VZHCYeZP0Mds3sT9CDzTLtGIqwyu2MiD2ysTcH31c0/AADZUKDoSHIX+JzBRbAU1X
         rM4jy1vcPLnx93mRxILa/O271sb8dOnjJD9nax/4/STFXjJzDA4X9DHm2CW+J/71tm4C
         h80ZkW9z+hsjziKvaxstmQoH+cxUi8HoKOXWH6O3aEJgNPcxwmzSy8g1PyRFahjoIkUo
         XXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=70+GcYXrhuJrP0UYwYv+CFmEhXNJE1a7+ZVUXRbKnYk=;
        b=MwcSmd0Z4kcB3avHSn5szir9BtVqQhEHLG4QIkALOwj+QOvA/qBPNcaZGGyWckY72P
         jgifaqCcMd12omcvFJD9eLTK0Rk8uQf9J3yfyTDhPn1mJbTtrgRGA2tZJkqA8AVcxP3N
         C8lPJ4uXd+/Bogc5cdlCI/ZGWLzdJODmR3XS7qu8a7YuIAvuO1RXBVuhUEsIFFb9iWfi
         /4SCEZyEcpOlGapHdG+8KMydzN0b53zRkCfyG6Zcz+91p8Kb4pA/XGVWH2HwqHmlCMhU
         LMJtKhCbC2BKWHgPfUH3DsQErMe6apYAk3bID5Y5tfgQqmrDxPrPPjxbh36Um5AUMDyz
         rAZw==
X-Gm-Message-State: AOAM530pJO/qn8MGT6QRb2LTqYFnYOnOgz6D0Bsj8ywMjaM7CJdBXYqJ
        i8nJO9/KbIVtrh/5k6xN8kk=
X-Google-Smtp-Source: ABdhPJxXytaUlX3kxvjhsWa4k3vSHMdymBtk5gA9XOS6fbF1PpLsf6NHaGk6+p5SC31GOTEIzz1diw==
X-Received: by 2002:a9d:3d2:: with SMTP id f76mr2736068otf.171.1617797834852;
        Wed, 07 Apr 2021 05:17:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o6sm5538317otj.81.2021.04.07.05.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 05:17:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 3/4] watchdog: simatic-ipc-wdt: add new driver for
 Siemens Industrial PCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Henning Schild <henning.schild@siemens.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
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
 <20210406165247.78791bf7@md1za8fc.ad001.siemens.net>
 <CAHp75VcOw0WD8s9ZP=-N5Gesmfx0UEkV5s7SSwDwCzYDYoVuPg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e36d8b9f-42a1-0d8c-a4cc-f497acd155fe@roeck-us.net>
Date:   Wed, 7 Apr 2021 05:17:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcOw0WD8s9ZP=-N5Gesmfx0UEkV5s7SSwDwCzYDYoVuPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/7/21 1:53 AM, Andy Shevchenko wrote:
> On Tue, Apr 6, 2021 at 5:56 PM Henning Schild
> <henning.schild@siemens.com> wrote:
>>
>> Am Thu, 1 Apr 2021 18:15:41 +0200
>> schrieb "Enrico Weigelt, metux IT consult" <lkml@metux.net>:
>>
>>> On 29.03.21 19:49, Henning Schild wrote:
>>>
>>> Hi,
>>>
>>>> This driver adds initial support for several devices from Siemens.
>>>> It is based on a platform driver introduced in an earlier commit.
>>>
>>> Where does the wdt actually come from ?
>>>
>>> Is it in the SoC ? (which SoC exactly). SoC-builtin wdt is a pretty
>>> usual case.
>>>
>>> Or some external chip ?
>>
>> I guess external chip, but again we are talking about multiple
>> machines. And the manuals i read so far do not go into that sort of
>> detail. In fact on some of the machines you will have two watchdogs,
>> one from the SoC and that "special" one.
>> That has several reasons, probably not too important here. The HW guys
>> are adding another wd not just for fun, and it would be nice to have a
>> driver.
>>
>>> The code smells a bit like two entirely different wdt's that just have
>>> some similarities. If that's the case, I'd rather split it into two
>>> separate drivers and let the parent driver (board file) instantiate
>>> the correct one.
>>
>> Yes, it is two. Just like for the LEDs. One version PIO-based another
>> version gpio/p2sb/mmio based.
> 
> I tend to agree with Enrico that this should be two separate drivers.
> 

Agreed.

Guenter

>> In fact the latter should very likely be based on that gpio pinctl,
>> whether it really needs to be a separate driver will have to be seen.
>> There are probably pros and cons for both options.
> 
> 

