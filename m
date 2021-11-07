Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152C544750B
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 20:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhKGTEi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 14:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhKGTEh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 14:04:37 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBC0C061570;
        Sun,  7 Nov 2021 11:01:54 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id bg25so23531748oib.1;
        Sun, 07 Nov 2021 11:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TVhJyX2q5rlxh+7dmDUcqQ782Sh+g5l5RRH7lPpROSU=;
        b=kzPcJB5pI5MavXMNPqrEzttz1lHU3J70DNU9hu/wv+w1txUavjFHf+ZRCxKlOkIGa4
         jNOjep3nZytb811qWQLlU48AnWOwTIr+++0lvawOd3N4AFhsbrU6C1feO0tJI2wo61Ss
         8LX5kMa0O85jWodc60IM82PCm4d2o3cRPjd6iwoBNr5qOTazajRL3iwp3gCiBzGs6fGA
         F4PdbyiRK8gqcnID+Og1LSMUOh67cnjLGGAH/LKgQWc2Z9yTiD9DhXT5NPPW5YF9eBo0
         x+JVr83gVWbYqwzf3w0w6Bvqdz5jjs8YUrISxeL0RPGTexIe0lLDVppJuTMoXAkAxAKm
         S3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TVhJyX2q5rlxh+7dmDUcqQ782Sh+g5l5RRH7lPpROSU=;
        b=35WqlU8JwTthtC08lU1yWswDoGQ4tZBxKOxHVCp2oDbyKyOk3f7YGiwLyPinIwUy9A
         LeEO/RcKWhftV0C0yOGJGTYQdjuTRzuxW5CG6wbCxF2FwptGC9qr27T+ftT/gZbLxawG
         1zl6G3/aDFVBDwnwVxK7nnX6+OqWNWa7towktfHTK6xWfonabPeLIXeay7IUp47Tw5b/
         GDMmmp4jXMuiKfw5BSprTWBpkIDvDlWzPif3pnpUA17+Xa27pURV/2vncq1m+cz2mdtq
         +9p97YK8oNk7g8QfMEH0TYNtGUdzBvbqTU3Ca++gfPU982wZxgHf6pIRbWNQRjtmz+NV
         XRvg==
X-Gm-Message-State: AOAM530KaIvQz4LghKZJg2vSZjxvE7ntPKhvwGfgtwXAHNXHHAaviP0Q
        6CYY/ZTiIOqiy6m1e6w/+a6k4H2s3z4=
X-Google-Smtp-Source: ABdhPJzE4K10hZ0oOgP/aig76nYbQqXtz9Ej2DvOqG1IyXsrtpkb7gCMO46x6LZCAxt/gngtoiFONA==
X-Received: by 2002:aca:3bd4:: with SMTP id i203mr31999917oia.69.1636311713816;
        Sun, 07 Nov 2021 11:01:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bi20sm604829oib.29.2021.11.07.11.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 11:01:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 10/12] watchdog: s3c2410: Support separate source clock
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-11-semen.protsenko@linaro.org>
 <a63f37a9-ea04-2606-e4f5-1170c4e59db2@canonical.com>
 <CAPLW+4mhD+k03S1cR-AdNk4etPiK=wsCoR4+o39gDe==XdoY8w@mail.gmail.com>
 <b65c74f3-0735-7b8b-888a-3b14aee55a4f@roeck-us.net>
 <CAPLW+4=_dk50ESva1RwN3a9gtT2tJn2WT=m5C8Q9c1VTdemJxQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1b53d47f-07ba-95eb-b89e-a56307958f2f@roeck-us.net>
Date:   Sun, 7 Nov 2021 11:01:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=_dk50ESva1RwN3a9gtT2tJn2WT=m5C8Q9c1VTdemJxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/7/21 10:51 AM, Sam Protsenko wrote:
> On Sun, 7 Nov 2021 at 18:09, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/7/21 7:55 AM, Sam Protsenko wrote:
>>> On Tue, 2 Nov 2021 at 12:15, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>>
>>>> On 31/10/2021 13:22, Sam Protsenko wrote:
>>>>> Right now all devices supported in the driver have the single clock: it
>>>>> acts simultaneously as a bus clock (providing register interface
>>>>> clocking) and source clock (driving watchdog counter). Some newer Exynos
>>>>> chips, like Exynos850, have two separate clocks for that. In that case
>>>>> two clocks will be passed to the driver from the resource provider, e.g.
>>>>> Device Tree. Provide necessary infrastructure to support that case:
>>>>>     - use source clock's rate for all timer related calculations
>>>>>     - use bus clock to gate/ungate the register interface
>>>>>
>>>>> All devices that use the single clock are kept intact: if only one clock
>>>>> is passed from Device Tree, it will be used for both purposes as before.
>>>>>
>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>> ---
>>>>> Changes in v2:
>>>>>     - Reworded commit message to be more formal
>>>>>     - Used separate "has_src_clk" trait to tell if source clock is present
>>>>>     - Renamed clock variables to match their purpose
>>>>>     - Removed caching source clock rate, obtaining it in place each time instead
>>>>>     - Renamed err labels for more consistency
>>>>>
>>>>>    drivers/watchdog/s3c2410_wdt.c | 52 +++++++++++++++++++++++++---------
>>>>>    1 file changed, 39 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>>>> index fdb1a1e9bd04..c733917c5470 100644
>>>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>>>> @@ -118,7 +118,9 @@ struct s3c2410_wdt_variant {
>>>>>
>>>>>    struct s3c2410_wdt {
>>>>>         struct device           *dev;
>>>>> -     struct clk              *clock;
>>>>> +     struct clk              *bus_clk; /* for register interface (PCLK) */
>>>>> +     struct clk              *src_clk; /* for WDT counter */
>>>>> +     bool                    has_src_clk;
>>>>
>>>> Why do you need the has_src_clk value? If clk_get() fails, just store
>>>> there NULL and clk API will handle it.
>>>>
>>>
>>> I've added that 'has_src_clk' field for somewhat different reason.
>>>
>>> 1. As we discussed earlier, in case when src_clk is not present, I do
>>> 'src_clk = bus_clk' in v2. This way I don't have to check if src_clk
>>> is NULL every time and use bus_clk to get rate. If I set src_clk =
>>> NULL, I'll have to add selector code, which wouldn't be so elegant,
>>> and contradicts what we've discussed.
>>> 2. On the other hand, I don't want to enable bus_clk twice in case
>>> when src_clk is not present, that just doesn't feel right (user would
>>> see incorrect refcount value in DebugFS, etc). And if "clk_src =
>>> bus_clk', and I haven't enabled it second time, then I shouldn't try
>>> to disable it second time, right?
>>>
>>> The only way I can see to accomplish (1) and (2) together, is to use
>>> that 'has_src_clk' flag. For me it still looks better than enabling
>>> bus_clk twice, or checking if clk_src is NULL every time we need to
>>> get clock rate. Please let me know if you still have a strong opinion
>>> on this one.
>>>
>>
>> This is odd. Why do you need to get the clock rate more than once,
>> instead of getting it once and storing it locally ? If the clock rate
>> can change, the watchdog timeout would be unpredictable.
>>
> 
> For this particular driver it seems to be needed though. The driver
> tracks CPU freq change and tries to adjust timeout w.r.t. new clock
> frequency, as implemented in s3c2410wdt_cpufreq_*() functions. I don't
> really want to touch that functionality in my series, my goal here is
> to add Exynos850 support in the first place. But yeah, I did some
> analysis, and it seems like 25 out of 35 watchdog drivers (that call
> clk_get_rate()) just store the rate in probe.
> 
... and (hopefully) most of the others don't really need to call
clk_get_rate()) more than once either. Looks like the watchdog in
s3c2410 is using the wrong clock. That makes me wonder if it even
really works reliably, given that it turns itself off for a brief
period of time at each CPU frequency change. Oh well, it is what it is.

Guenter
