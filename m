Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0D3E0546
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Oct 2019 15:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388135AbfJVNjB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Oct 2019 09:39:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37650 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388106AbfJVNjB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Oct 2019 09:39:01 -0400
Received: by mail-pl1-f194.google.com with SMTP id u20so8382880plq.4;
        Tue, 22 Oct 2019 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gpoW/8Yw0CDfvnTYDUEt7wnlvPB+LdjenekF+dbtjls=;
        b=r3lN2fcNiqbiD+lTtxMThvS7h5kEpehwJT2wWH9MYxpdx0zW6ZvPe5+oJTGHBdo3UJ
         +1snUlb5BmZKfZgCMc5oHa9QCVpM51bJtLcoi0n8l6jvNxfYgPFgQ3xMC4wejMQvvNYf
         FLjLePAA2nsc9FCaZLwszr/yv2z8Vo+c37bA8ZqlWGieYmxcCBCFDjIlAayEvRnKlNTe
         rqo/FUiZITczTRPc6fHUG/C01orY7LXqFnZKXsZ7XIBhPyrITrbCxMUTxVQfktXKt10E
         YtnLrgW/UV4XeUX78ycvlYJllBR+2c+GHpwybsbZFCsZd91dCUD8z8jlNuKghFtR7G86
         EPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gpoW/8Yw0CDfvnTYDUEt7wnlvPB+LdjenekF+dbtjls=;
        b=AUGwPbPwoXLPDAYRjGmvwEPtzEdlSMz3iixGNDBdffY14Bi4wUIbqjQVkZb+MW2Dzk
         lkaYNEU1PAg7JXfLhqtSxpgy50m3BYm91sXSrFlfDcLtkE9z/3snsi3oxE7RUfVS3jiZ
         2He8/I71I8HKs/X3cYXFPDEOGU8tvN/atLosaXz7C15H9nLls2bJZujJ8sEAN/aGmMK8
         5RTn98PlYEFXTyUl0XSAjqbejd5faNhyRjYPbI63iyNE3uMWcHTKpz6D4jPYdAVcfk4S
         gEBHFQZAep+AssdqbSVN03mFZNOo8bIZvlDBOmPGwV6JzKJMvEtyQRCgeSFCH/lGL3F/
         cMzQ==
X-Gm-Message-State: APjAAAUrrK+mNU/wp0Gzzbgba7og3kSx9snAMFD9L2p52dxpA6OTbB/n
        SlqP5qFYY8Jmw9A1NWuxMqtQhCOu
X-Google-Smtp-Source: APXvYqxnblBiUF+4VE72i3RD2Q7pDJaYooI6GNAv8EneUhqFZsEv0k6WdGtSCJU5/e/gq6M4YVlHIA==
X-Received: by 2002:a17:902:d90f:: with SMTP id c15mr3753482plz.157.1571751540152;
        Tue, 22 Oct 2019 06:39:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f188sm22206087pfa.170.2019.10.22.06.38.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 06:38:59 -0700 (PDT)
Subject: Re: [PATCH 09/46] watchdog: sa1100: use platform device registration
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-9-arnd@arndb.de>
 <bb4713a0-60bd-8d27-874f-e7e3a5adaec8@roeck-us.net>
 <CAK8P3a0GPVs+PqUwsL2H8VJqLh=MJnMTwPu9nhX+Nq-xiMS1yQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <21d72661-a4f1-d51f-ddf0-f8cebb984029@roeck-us.net>
Date:   Tue, 22 Oct 2019 06:38:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0GPVs+PqUwsL2H8VJqLh=MJnMTwPu9nhX+Nq-xiMS1yQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/22/19 2:44 AM, Arnd Bergmann wrote:
> On Sat, Oct 19, 2019 at 4:07 PM Guenter Roeck <linux@roeck-us.net> wrote:
> 
>>> @@ -319,10 +316,13 @@ static struct platform_device *sa11x0_devices[] __initdata = {
>>>
>>>    static int __init sa1100_init(void)
>>>    {
>>> +     struct resource wdt_res = DEFINE_RES_MEM(0x90000000, 0x20);
>>>        pm_power_off = sa1100_power_off;
>>>
>>>        regulator_has_full_constraints();
>>>
>>> +     platform_device_register_simple("sa1100_wdt", -1, &wdt_res, 1);
>>> +
>>>        return platform_add_devices(sa11x0_devices, ARRAY_SIZE(sa11x0_devices));
>>
>> Wouldn't it be better to add the watchdog device to sa11x0_devices ?
> 
> Generally speaking, platform_device_register_simple() is better than
> platform_add_devices(), it does the same thing with fewer source lines
> and smaller object code, and it doesn't have the problem of lifetime rules
> for statically allocated reference-counted devices.
> 
> One day we may want to replace all static platform_device instances with
> platform_device_info instead, but right now there are too many of those.
> 
> I can change this one to a platform_device for consistency though if you
> think it's worth it.
> 

No, I was just wondering. Thanks for the explanation.

Guenter

