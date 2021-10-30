Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB40440AB8
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Oct 2021 19:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhJ3RuM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 30 Oct 2021 13:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhJ3RuL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 30 Oct 2021 13:50:11 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AD9C061570;
        Sat, 30 Oct 2021 10:47:40 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id e200-20020a4a55d1000000b002b8bedf08cdso4610783oob.1;
        Sat, 30 Oct 2021 10:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3sCDBjP+ugtdqrbN6EODE7mSZY/dTM4KGdsgd+tdp3U=;
        b=j1xzX0HpRNdqNRZ8fBN30WA0k5pPJKjXjz2626eyJEk1iQSC2oMGCjBvBva/oZeG9Z
         XAfeybZjlQ7PIEh/7xACo9+a4u8WVBT1jnlodCgER+Pl0+3fPvDPuwI0mWYfQ53ZPpnF
         9aJIdihNW1LB+LwIXn5D5wximox8V2HiFA0Be7ybPVpe5koLVfKnkGMX8Hb31Fnq113N
         1/D0+PbIfdc4+vLkC6xp2bI2J8RcVsq0L9DO+TUIX2LttCxeww/tltaf+fef0PjZaNEV
         7oLaVcVMM6XLXZaOSYJxYKICzYe5UQBAXSYh8hKJG8HgtYGTRoBYj6RtUJ+iexHiQl56
         behg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3sCDBjP+ugtdqrbN6EODE7mSZY/dTM4KGdsgd+tdp3U=;
        b=DRihFBSRYEhe5Cm6fujdagqbB2sN4VE9wOUWvmQuemeqH/6qfxHKRm/3XVFMdvfq/A
         xbNH34O3UOZWrRElRKZuDLQ+Cno6jlPR9X0nSX14pIUqVsAcMwWEHqYoGw75HDoNCVx0
         wKxzC84rlgaE9cAC2nzJXMTdKgak9MqWZxhXcKzQZurpBgnoXQtYFbRebQDyBONetN3j
         gjYcevLuflFy9gUIInMTq+/lI63JC8E5tbl3udonbMKZkr+TRXoHfRPb5IBuGLqbdvOx
         9J1xRXnRZ/bfQgyOBjN2MHwveLq2jQORg0ul+cjmTJ4P7bVgw/y41b9SdTORNBr37Aws
         rBcA==
X-Gm-Message-State: AOAM532EcIraMojm9Q2UbCXmJ1yJDGPXbua8qcLKmhCboDuvarB3c0up
        m1lUuMie55sMW4yqcWp1uHidNs9wkuw=
X-Google-Smtp-Source: ABdhPJzPJyiIEsDy62L04KvCS9M5n8iiEFmS5KwYVy2KKNS/i/vjBiCDm0pcKNRhPpkaeYjWk/BdmA==
X-Received: by 2002:a4a:9204:: with SMTP id f4mr12780924ooh.87.1635616060003;
        Sat, 30 Oct 2021 10:47:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v9sm2899102oth.62.2021.10.30.10.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Oct 2021 10:47:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-8-semen.protsenko@linaro.org>
 <1ad6b625-4388-bc78-e258-eae0b9357b96@roeck-us.net>
 <CAPLW+4kphtac24fcpVUENAMUAdHp2fkzJ0N_r_63Soq6R2VZBg@mail.gmail.com>
 <7c9a8dd4-7607-55a2-3d65-a445fa246667@roeck-us.net>
 <CAPLW+4kTANfSaw5g=rnJUJTMcT_J1Z8ju09kzmAPE70U_8KWDQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 7/7] watchdog: s3c2410: Let kernel kick watchdog
Message-ID: <d07b0269-acff-b267-b90a-732502978712@roeck-us.net>
Date:   Sat, 30 Oct 2021 10:47:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4kTANfSaw5g=rnJUJTMcT_J1Z8ju09kzmAPE70U_8KWDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/30/21 9:59 AM, Sam Protsenko wrote:
> On Sat, 30 Oct 2021 at 18:14, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/30/21 7:29 AM, Sam Protsenko wrote:
>>> On Fri, 29 Oct 2021 at 03:30, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 10/28/21 11:35 AM, Sam Protsenko wrote:
>>>>> When "tmr_atboot" module param is set, the watchdog is started in
>>>>> driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
>>>>> watchdog core driver know it's running. This way wathcdog core can kick
>>>>> the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
>>>>> enabled), until user space takes control.
>>>>>
>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>> ---
>>>>>     drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
>>>>>     1 file changed, 15 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>>>> index ca082b1226e3..9af014ff1468 100644
>>>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>>>> @@ -732,6 +732,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>>>>>         wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>>>>>         wdt->wdt_device.parent = dev;
>>>>>
>>>>> +     /*
>>>>> +      * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
>>>>> +      * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
>>>>> +      *
>>>>> +      * If we're not enabling the watchdog, then ensure it is disabled if it
>>>>> +      * has been left running from the bootloader or other source.
>>>>> +      */
>>>>> +     if (tmr_atboot && started == 0) {
>>>>> +             dev_info(dev, "starting watchdog timer\n");
>>>>> +             s3c2410wdt_start(&wdt->wdt_device);
>>>>> +             set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
>>>>> +     } else if (!tmr_atboot) {
>>>>> +             s3c2410wdt_stop(&wdt->wdt_device);
>>>>> +     }
>>>>> +
>>>>
>>>> This doesn't cover the case where the watchdog is already enabled by the BIOS.
>>>> In that case, WDOG_HW_RUNNING won't be set, and the watchdog will time out
>>>> if the userspace handler is not loaded fast enough. The code should consistently
>>>> set WDOG_HW_RUNNING if the watchdog is running.
>>>>
>>>
>>> As I understand, in the case when bootloader started the watchdog, the
>>> driver just stops it. You can see it in the code you replied to.
>>>
>>>       } else if (!tmr_atboot) {
>>>               s3c2410wdt_stop(&wdt->wdt_device);
>>>
>>> In other words, having "tmr_atboot" module param makes it irrelevant
>>> whether bootloader enabled WDT or no.
>>>
>>
>> Sure, but I am concerned about "if (tmr_atboot && started)", which doesn't
>> set WDOG_HW_RUNNING with your current code, and I was looking for something
>> like
>>
>>          if (tmr_atboot) {
>>                  if (!started) {
>>                          dev_info(dev, "starting watchdog timer\n");
>>                          s3c2410wdt_start(&wdt->wdt_device);
>>                  }
>>                  set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
>>          } else {
>>                  s3c2410wdt_stop(&wdt->wdt_device);
>>          }
>>
> 
> Wow, I really overlooked that case. Nice catch! Not having '} else {'
> section is vicious...
> 
> Though if started != 0, it means s3c2410wdt_set_heartbeat() failed to
> set wdd->timeout, and without that the watchdog core won't be able to
> calculate correctly ping interval in watchdog_next_keepalive(), and
> WDOG_HW_RUNNING bit won't do much good, right? So I'll probably just
> call s3c2410wdt_stop() in that case, to be on the safe side.
> 
> Also this 'started' variable name is misleading, I'll convert it to
> "bool timeout_ok" while at it.
> 

This driver is a mess :-(. "started" true means that the driver doesn't
work as currently written because there is no known valid timeout. In
reality, s3c2410wdt_set_heartbeat() should in that case select a valid
timeout and set it. On top of that, a timeout value out of range should
never be passed to it in the first place. The check for "if (timeout < 1)"
is, in that context, pointless. The range check should happen in
s3c2410wdt_max_timeout(). If that range check is invalid, ie if
s3c2410wdt_set_heartbeat() fails even though the timeout is in the range
of 1 ..s3c2410wdt_max_timeout(), s3c2410wdt_max_timeout() is buggy.

The simplest fix (kludge/hack) might be to fail driver installation if
s3c2410wdt_set_heartbeat() fails.

Guenter
