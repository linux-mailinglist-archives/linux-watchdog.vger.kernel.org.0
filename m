Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70F920A012
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jun 2020 15:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405012AbgFYNfW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jun 2020 09:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404926AbgFYNfV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jun 2020 09:35:21 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E75EC08C5C1;
        Thu, 25 Jun 2020 06:35:21 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u5so3030211pfn.7;
        Thu, 25 Jun 2020 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YnBw2TzO+gARDF+ksFnfoxC0mIOwPXnaKGHDEyud/8M=;
        b=OsCI98IXRRRmr+mhllJZhc20u+ItuQIE2HTmXozBFK3KoN4SadeWRfIBmYIsC5cClu
         4IpJtEN+Xh6G8tOLcwDEdjF38GzSRcZYoxLEJHDXwmZrxCF/kluL6cOv/MN0TQFFCZqG
         Zb8qRoa+n6tEb+mtAbyo22C/kQmIJbrKI6ZzNoZW96qMKaWY5V4BaRoAYcZUGwMZXiIF
         SsWWCjIInFOj0yNQeG1Gv+e0kwhIRWZtjzSJrULCF9yyEqHVuap4W4tpfuWimHC+Gu6+
         rpgNk6Jm4907hl8f/nsl+sTsQ1ei+464OvTKHkUA18hsOJgRNZfwk/kqkiFFt89E9acA
         +r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YnBw2TzO+gARDF+ksFnfoxC0mIOwPXnaKGHDEyud/8M=;
        b=Pxjlimqono0uQWscle/vyNJeRNUR4ywF++7j/dSvZaE+b71ohie+xEL/AV+kVB3rM9
         TncC296XU6s+AtfADd6NsH/jRkkK7RN52jK6zdCXE937mKsEhg8GNDnqd2WI3zFidDV3
         P0BinHsS7ucX12cveRCAh+mce7Pk1J05oLDR7VaL8EMHKzaNdsg5Xii34FbtBtsniTiA
         tAZLdcBV+vvP2+6x7QAJaPcmGVW2rbFjbM5wOyuMZGM7FrkCs5HWHkNUWldhc2wFxRJ/
         iaR+Ujyib17X+q057s/qzHZI5/OovMSZ6fEISsApv3KpJFTreTvAkWvsqxdLIZJOZk3d
         LM3A==
X-Gm-Message-State: AOAM533X7cNbvLRef21cBUSYc+HRZ3KQV4Rruq4Tjuc6f/tMZaqSzijY
        XUNfuJypUDfIbCaa/gzUI+/d/Rhn
X-Google-Smtp-Source: ABdhPJxc/EQGiI6C+5m8Odj8oTATR4Z9YKWdNne+ihvRVr1D/nNt57facXre9Iy96n5TDYq6g7GX4w==
X-Received: by 2002:a63:e00c:: with SMTP id e12mr4471253pgh.413.1593092120476;
        Thu, 25 Jun 2020 06:35:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m10sm8427442pjs.27.2020.06.25.06.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 06:35:19 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match
 initial allowed window
To:     Tero Kristo <t-kristo@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-3-t-kristo@ti.com>
 <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
 <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <25bf3ed1-5434-9b45-20ae-e1b2cfc5e5c0@roeck-us.net>
Date:   Thu, 25 Jun 2020 06:35:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/25/20 1:32 AM, Tero Kristo wrote:
> On 24/06/2020 18:24, Jan Kiszka wrote:
>> On 24.06.20 13:45, Tero Kristo wrote:
>>> If the RTI watchdog has been started by someone (like bootloader) when
>>> the driver probes, we must adjust the initial ping timeout to match the
>>> currently running watchdog window to avoid generating watchdog reset.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   drivers/watchdog/rti_wdt.c | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>> index d456dd72d99a..02ea2b2435f5 100644
>>> --- a/drivers/watchdog/rti_wdt.c
>>> +++ b/drivers/watchdog/rti_wdt.c
>>> @@ -55,11 +55,13 @@ static int heartbeat;
>>>    * @base - base io address of WD device
>>>    * @freq - source clock frequency of WDT
>>>    * @wdd  - hold watchdog device as is in WDT core
>>> + * @min_hw_heartbeat_save - save of the min hw heartbeat value
>>>    */
>>>   struct rti_wdt_device {
>>>       void __iomem        *base;
>>>       unsigned long        freq;
>>>       struct watchdog_device    wdd;
>>> +    unsigned int        min_hw_heartbeat_save;
>>>   };
>>>   static int rti_wdt_start(struct watchdog_device *wdd)
>>> @@ -107,6 +109,11 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
>>>       /* put watchdog in active state */
>>>       writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
>>> +    if (wdt->min_hw_heartbeat_save) {
>>> +        wdd->min_hw_heartbeat_ms = wdt->min_hw_heartbeat_save;
>>> +        wdt->min_hw_heartbeat_save = 0;
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>> @@ -201,6 +208,24 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>>           goto err_iomap;
>>>       }
>>> +    if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
>>> +        u32 time_left;
>>> +        u32 heartbeat;
>>> +
>>> +        set_bit(WDOG_HW_RUNNING, &wdd->status);
>>> +        time_left = rti_wdt_get_timeleft(wdd);
>>> +        heartbeat = readl(wdt->base + RTIDWDPRLD);
>>> +        heartbeat <<= WDT_PRELOAD_SHIFT;
>>> +        heartbeat /= wdt->freq;
>>> +        if (time_left < heartbeat / 2)
>>> +            wdd->min_hw_heartbeat_ms = 0;
>>> +        else
>>> +            wdd->min_hw_heartbeat_ms =
>>> +                (time_left - heartbeat / 2 + 1) * 1000;
>>> +
>>> +        wdt->min_hw_heartbeat_save = 11 * heartbeat * 1000 / 20;
>>> +    }
>>> +
>>>       ret = watchdog_register_device(wdd);
>>>       if (ret) {
>>>           dev_err(dev, "cannot register watchdog device\n");
>>>
>>
>> This assumes that the bootloader also programmed a 50% window, right? The pending U-Boot patch will do that, but what if that may chance or someone uses a different setup?
> 
> Yes, we assume 50%. I think based on the hw design, 50% is the only sane value to be used, otherwise you just shrink the open window too much and for no apparent reason.
> 

Not sure if that is a valid assumption. Someone who designs a watchdog
with such a narrow ping window might as well also use it. The question
is if you want to rely on that assumption, or check and change it if needed.

Also, I wonder if we should add an API function such as
"set_last_hw_keepalive()" to avoid all that complexity.

Thanks,
Guenter
