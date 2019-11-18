Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD728FFC78
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 01:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfKRAXH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 17 Nov 2019 19:23:07 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38838 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbfKRAXH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 17 Nov 2019 19:23:07 -0500
Received: by mail-pj1-f65.google.com with SMTP id f7so949513pjw.5
        for <linux-watchdog@vger.kernel.org>; Sun, 17 Nov 2019 16:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k7sY5KPhenbsui1D5JlbBrXDYp0rL8ClYhS1bikCzwU=;
        b=I+RXpQzmg/J+ii+sCmPEiuSIMUtsBMaFKYAI63izE3+MbgSAs9Y2i6HNy1TEyNGowY
         8sAuxEAoh5rtuHChmN+0oMQrSj1snOExjlmrYPEihN9AafipphEtbhMTctj49uom8V60
         bhjwmWn4nvCnG6nfRaPcqoyWZvzjgxsgF3zp2Az9bU17PiqCFAF5x/eddrgG5xh/7cOV
         y0JqsMy6fevTpebpSq3OM2eLdKP57tMlJ5spnofeSPg5akr0mRQWhY7HMrUfd0yEzg1t
         2Go0nt2TYNHeHJvm6dNi/3qVac3JyqeMWt+5DsvsKpGV8qz+cXTkFsRj1N+Aqlq6QDXF
         +ALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k7sY5KPhenbsui1D5JlbBrXDYp0rL8ClYhS1bikCzwU=;
        b=WTNISfHO6ChG+CB9LbAR9NIJr8bXQN/R/hTYc2y/bXppDZxk9zuV1GaigjeKGpEaCU
         Z7IE6zduWbbWquWSziyIN0T0x8KCKq3IMdBynT80DPxEVKX/NqnBcoJflfoMpdCdZEP7
         hJi+4RzyhCQNkaPcRlXcnB9tmShFc5nkLW/NkVK2m/nO/e9lHbG/h71dAUIuTrfiDLHA
         FXu2Ohqj/kv7KDgCqubs4qWb4H7ZPz4p5eyEvwCEfXglczsX4r84LvFJ3tbl2EGnx9kO
         5IZ0gfCGbDIG4KwOIsEfeyHs6pQypdom+k5H+wTggOPZGCllbNWLo1k9XT+i0LlcqKJQ
         iXfA==
X-Gm-Message-State: APjAAAX7dYTLyZxlWq47tlm0mEeMPC63iZARLAsgTCY2o2GHw+gN+yBn
        /SojX6IZWd05hKzGiXPRzMs=
X-Google-Smtp-Source: APXvYqzjDcvD8qHFmqSbRlJiAcwFl/9mhYza+BFy+BL9dCX0dFegxfEuLivhcrb6/tRW20igCTRzuQ==
X-Received: by 2002:a17:902:7c07:: with SMTP id x7mr26619112pll.124.1574036585774;
        Sun, 17 Nov 2019 16:23:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o20sm19641933pfp.16.2019.11.17.16.23.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Nov 2019 16:23:04 -0800 (PST)
Subject: Re: [PATCH] watchdog: omap: Fix early_enable to start watchdogd
To:     Brandon Maier <brandon.maier@collins.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
References: <20191117200325.142419-1-brandon.maier@rockwellcollins.com>
 <6e9a6f3b-0723-ac59-b859-f8b7b75d39a9@roeck-us.net>
 <CA+fik53-RrzN1Q-Y+6hgtFyjharyMOLAy9w6gn0bfsUN=AwEUA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0338087a-07cf-5673-7c3b-5d1211f359e2@roeck-us.net>
Date:   Sun, 17 Nov 2019 16:23:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+fik53-RrzN1Q-Y+6hgtFyjharyMOLAy9w6gn0bfsUN=AwEUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/17/19 2:19 PM, Brandon Maier wrote:
> On Sun, Nov 17, 2019 at 3:44 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/17/19 12:03 PM, Brandon Maier wrote:
>>> When the 'early_enable' module_param is enabled, Linux's watchdogd
>>> thread does not start, causing the watchdog to eventually fire.
>>>
>>
>> What does early_enable have to do with watchdogd ?
> 
> The early_enable doesn't directly control the watchdogd, it only
> controls starting the watchdog. The problem is that, if the watchdog
> is started, we need the watchdogd to ping the watchdog. It watchdogd
> is not running, then the watchdog will trip and reset the system.
> 
>> Why would watchdogd not start if this flag is set ?
> 
> watchdog_register_device() checks this flag, and only enables the
> watchdogd if it's set. See following:
> https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/watchdog_dev.c#L1031
> 
>>
>> The purpose of early_enable in this driver, as I understand it,
>> was to force watchdogd to start within the timeout period. So
>> it does exactly what it is supposed to be doing.
> 
> I'm not sure what you're referring to by "timeout period". But
> early_enable does force the watchdog to start during module insertion,
> that works correctly. The issue is that the driver doesn't tell the
> watchdog core to launch the watchdogd.
> 

If you refer to the kernel "watchdogd", that is not of interest here.
_Userspace_ is supposed to start a watchdog daemon if early_enable
is set. If userspace doesn't do that, it is a userspace problem,
not a kernel problem.

The whole point of early_enable is to force _userspace_ to start its watchdog
daemon. Your proposed patch would defeat that by pinging the watchdog in the
kernel, and it would keep doing so forever even if userspace hangs completely.
This would be just wrong.

Guenter

> This change is based off many of the other watchdog drivers. They also
> set the WDOG_HW_RUNNING flag if the watchdog is running. The only
> significant difference is that those drivers don't typically have an
> early_enable, they just detect if the watchdog was already running
> before insertion. But the end result is the same, the watchdog is
> running and will trigger if watchdogd isn't.
> 
>>
>> Guenter
>>
>>> For the watchdogd to be started, the WDOG_HW_RUNNING flag must be set
>>> before watchdog_register_device().
>>>
>>> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
>>> ---
>>>    drivers/watchdog/omap_wdt.c | 10 ++++++----
>>>    1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
>>> index 9b91882fe3c4..ecc8592c00a5 100644
>>> --- a/drivers/watchdog/omap_wdt.c
>>> +++ b/drivers/watchdog/omap_wdt.c
>>> @@ -268,8 +268,13 @@ static int omap_wdt_probe(struct platform_device *pdev)
>>>                        wdev->wdog.bootstatus = WDIOF_CARDRESET;
>>>        }
>>>
>>> -     if (!early_enable)
>>> +     if (!early_enable) {
>>>                omap_wdt_disable(wdev);
>>> +             clear_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
>>> +     } else {
>>> +             omap_wdt_start(&wdev->wdog);
>>> +             set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
>>> +     }
>>>
>>>        ret = watchdog_register_device(&wdev->wdog);
>>>        if (ret) {
>>> @@ -281,9 +286,6 @@ static int omap_wdt_probe(struct platform_device *pdev)
>>>                readl_relaxed(wdev->base + OMAP_WATCHDOG_REV) & 0xFF,
>>>                wdev->wdog.timeout);
>>>
>>> -     if (early_enable)
>>> -             omap_wdt_start(&wdev->wdog);
>>> -
>>>        pm_runtime_put(wdev->dev);
>>>
>>>        return 0;
>>>
>>
> 
> Brandon
> 

