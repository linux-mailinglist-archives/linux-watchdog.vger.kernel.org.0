Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FAB21E9CD
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jul 2020 09:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgGNHON (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jul 2020 03:14:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55744 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgGNHOM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jul 2020 03:14:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06E7DXMd020986;
        Tue, 14 Jul 2020 02:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594710813;
        bh=R7NrFqekFwNIgVZJ8oOZUWFh/jRjHZvvXOhWevCTS5A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i8MPOFbApkl1FUCOqL4tSU/X+PCQw1wg2d17CKg3WGUuWW+5zPRQNXwMuazxWkIzt
         43ppQ62NxJbmyMFnI6sncRnChdwXLb7H8WZVI+D2Ht96HfpNmycw7OMM69D028Nvn9
         Ukm5HsdJHSHkyvPui8eSLay2IxfwovxA1Zk5vLjs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06E7DWUb023783
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 14 Jul 2020 02:13:32 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 14
 Jul 2020 02:13:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 14 Jul 2020 02:13:32 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06E7DTaG127751;
        Tue, 14 Jul 2020 02:13:31 -0500
Subject: Re: [PATCHv3 3/4] watchdog: rti-wdt: attach to running watchdog
 during probe
To:     Guenter Roeck <linux@roeck-us.net>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
References: <20200713131818.825-1-t-kristo@ti.com>
 <20200713131818.825-4-t-kristo@ti.com>
 <0c69734d-b301-7762-7614-0644e2a719ba@roeck-us.net>
 <2a92083c-f8bd-7a42-25e2-ee6ae354a4de@ti.com>
 <19373936-7566-3936-428a-2f2f7f3392d4@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <350ea70f-9647-863c-a4f7-6ba7c402ccff@ti.com>
Date:   Tue, 14 Jul 2020 10:13:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <19373936-7566-3936-428a-2f2f7f3392d4@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 14/07/2020 10:06, Guenter Roeck wrote:
> On 7/13/20 11:50 PM, Tero Kristo wrote:
>> On 14/07/2020 08:15, Guenter Roeck wrote:
>>> On 7/13/20 6:18 AM, Tero Kristo wrote:
>>>> If the RTI watchdog is running already during probe, the driver must
>>>> configure itself to match the HW. Window size and timeout is probed from
>>>> hardware, and the last keepalive ping is adjusted to match it also.
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>    drivers/watchdog/rti_wdt.c | 111 +++++++++++++++++++++++++++++++++----
>>>>    1 file changed, 101 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>>> index d456dd72d99a..45dfc546e371 100644
>>>> --- a/drivers/watchdog/rti_wdt.c
>>>> +++ b/drivers/watchdog/rti_wdt.c
>>>> @@ -35,7 +35,11 @@
>>>>      #define RTIWWDRX_NMI    0xa
>>>>    -#define RTIWWDSIZE_50P    0x50
>>>> +#define RTIWWDSIZE_50P        0x50
>>>> +#define RTIWWDSIZE_25P        0x500
>>>> +#define RTIWWDSIZE_12P5        0x5000
>>>> +#define RTIWWDSIZE_6P25        0x50000
>>>> +#define RTIWWDSIZE_3P125    0x500000
>>>>      #define WDENABLE_KEY    0xa98559da
>>>>    @@ -48,7 +52,7 @@
>>>>      #define DWDST            BIT(1)
>>>>    -static int heartbeat;
>>>> +static int heartbeat = DEFAULT_HEARTBEAT;
>>>>      /*
>>>>     * struct to hold data for each WDT device
>>>> @@ -79,11 +83,9 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>>>>         * be petted during the open window; not too early or not too late.
>>>>         * The HW configuration options only allow for the open window size
>>>>         * to be 50% or less than that; we obviouly want to configure the open
>>>> -     * window as large as possible so we select the 50% option. To avoid
>>>> -     * any glitches, we accommodate 5% safety margin also, so we setup
>>>> -     * the min_hw_hearbeat at 55% of the timeout period.
>>>> +     * window as large as possible so we select the 50% option.
>>>>         */
>>>> -    wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
>>>> +    wdd->min_hw_heartbeat_ms = 500 * wdd->timeout;
>>>>          /* Generate NMI when wdt expires */
>>>>        writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>>>> @@ -110,7 +112,48 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
>>>>        return 0;
>>>>    }
>>>>    -static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
>>>> +static int rti_wdt_setup_hw_hb(struct watchdog_device *wdd, u32 wsize)
>>>> +{
>>>> +    /*
>>>> +     * RTI only supports a windowed mode, where the watchdog can only
>>>> +     * be petted during the open window; not too early or not too late.
>>>> +     * The HW configuration options only allow for the open window size
>>>> +     * to be 50% or less than that.
>>>> +     */
>>>> +    switch (wsize) {
>>>> +    case RTIWWDSIZE_50P:
>>>> +        /* 50% open window => 50% min heartbeat */
>>>> +        wdd->min_hw_heartbeat_ms = 500 * heartbeat;
>>>> +        break;
>>>> +
>>>> +    case RTIWWDSIZE_25P:
>>>> +        /* 25% open window => 75% min heartbeat */
>>>> +        wdd->min_hw_heartbeat_ms = 750 * heartbeat;
>>>> +        break;
>>>> +
>>>> +    case RTIWWDSIZE_12P5:
>>>> +        /* 12.5% open window => 87.5% min heartbeat */
>>>> +        wdd->min_hw_heartbeat_ms = 875 * heartbeat;
>>>> +        break;
>>>> +
>>>> +    case RTIWWDSIZE_6P25:
>>>> +        /* 6.5% open window => 93.5% min heartbeat */
>>>> +        wdd->min_hw_heartbeat_ms = 935 * heartbeat;
>>>> +        break;
>>>> +
>>>> +    case RTIWWDSIZE_3P125:
>>>> +        /* 3.125% open window => 96.9% min heartbeat */
>>>> +        wdd->min_hw_heartbeat_ms = 969 * heartbeat;
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static unsigned int rti_wdt_get_timeleft_ms(struct watchdog_device *wdd)
>>>>    {
>>>>        u64 timer_counter;
>>>>        u32 val;
>>>> @@ -123,11 +166,18 @@ static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
>>>>          timer_counter = readl_relaxed(wdt->base + RTIDWDCNTR);
>>>>    +    timer_counter *= 1000;
>>>> +
>>>>        do_div(timer_counter, wdt->freq);
>>>>          return timer_counter;
>>>>    }
>>>>    +static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
>>>> +{
>>>> +    return rti_wdt_get_timeleft_ms(wdd) / 1000;
>>>> +}
>>>> +
>>>>    static const struct watchdog_info rti_wdt_info = {
>>>>        .options = WDIOF_KEEPALIVEPING,
>>>>        .identity = "K3 RTI Watchdog",
>>>> @@ -148,6 +198,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>>>        struct watchdog_device *wdd;
>>>>        struct rti_wdt_device *wdt;
>>>>        struct clk *clk;
>>>> +    u32 last_ping = 0;
>>>>          wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>>>>        if (!wdt)
>>>> @@ -169,6 +220,14 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>>>            return -EINVAL;
>>>>        }
>>>>    +    /*
>>>> +     * If watchdog is running at 32k clock, it is not accurate.
>>>> +     * Adjust frequency down in this case so that we don't pet
>>>> +     * the watchdog too often.
>>>> +     */
>>>> +    if (wdt->freq < 32768)
>>>> +        wdt->freq = wdt->freq * 9 / 10;
>>>> +
>>>
>>> So this is now only a problem is the window size was set restrictively
>>> in the BOS/ROMMON. Meaning it is still a problem. How is this better than
>>> before ? Why not just always set the window size to something reasonable ?
>>
>> Re-programming of the watchdog only takes effect at the next ping, then and only then will it adjust the window size + timeout period.
>>
> 
> What a mess. I am glad this isn't hardware I have to deal with.

Hahah yeah. :)

> 
>>>
>>>
>>>>        pm_runtime_enable(dev);
>>>>        ret = pm_runtime_get_sync(dev);
>>>>        if (ret) {
>>>> @@ -185,11 +244,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>>>        wdd->min_timeout = 1;
>>>>        wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
>>>>            wdt->freq * 1000;
>>>> -    wdd->timeout = DEFAULT_HEARTBEAT;
>>>>        wdd->parent = dev;
>>>>    -    watchdog_init_timeout(wdd, heartbeat, dev);
>>>> -
>>>>        watchdog_set_drvdata(wdd, wdt);
>>>>        watchdog_set_nowayout(wdd, 1);
>>>>        watchdog_set_restart_priority(wdd, 128);
>>>> @@ -201,12 +257,47 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>>>            goto err_iomap;
>>>>        }
>>>>    +    if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
>>>> +        u32 time_left_ms;
>>>> +        u64 heartbeat_ms;
>>>> +        u32 wsize;
>>>> +
>>>> +        set_bit(WDOG_HW_RUNNING, &wdd->status);
>>>> +        time_left_ms = rti_wdt_get_timeleft_ms(wdd);
>>>> +        heartbeat_ms = readl(wdt->base + RTIDWDPRLD);
>>>> +        heartbeat_ms <<= WDT_PRELOAD_SHIFT;
>>>> +        heartbeat_ms *= 1000;
>>>> +        heartbeat_ms /= wdt->freq;
>>>
>>> Ah yes, the pitfalls of 64-bit divide operations.
>>
>> Should I convert this to use do_div? With 64bit archs this code is targeted at it runs just fine.
>>
> 
> ... and test builds on 32 bit architectures fail to compile, as reported
> by 0-day. Maybe you don't care, fine, but then please remove all use of do_div
> or other 64-bit divide functions from the driver and mark it as depending
> on 64 bit.

Let me try to fix this to compile on 32bit archs also. It probably is 
never going to be run on such setup, but should be possible to fix it.

> 
>>>
>>>> +        if (heartbeat_ms / 1000 != heartbeat)
>>>> +            dev_warn(dev, "watchdog already running, ignoring heartbeat config!\n");
>>>> +
>>>> +        heartbeat = heartbeat_ms / 1000;
>>>> +
>>>> +        wsize = readl(wdt->base + RTIWWDSIZECTRL);
>>>> +        ret = rti_wdt_setup_hw_hb(wdd, wsize);
>>>> +        if (ret) {
>>>> +            dev_err(dev, "bad window size.\n");
> 
> Maybe report what that bad window size actually is ?

Ok, will print out the register value here.

> 
>>>> +            goto err_iomap;
>>>> +        }
>>>> +
>>>> +        last_ping = heartbeat_ms - time_left_ms;
>>>> +        if (time_left_ms > heartbeat_ms) {
>>>> +            dev_warn(dev, "time_left > heartbeat? Assuming last ping just before now.\n");
>>>> +            last_ping = 0;
>>>> +        }
>>>
>>> All that complexity makes me wonder if it wouldn't be better to just reprogram
>>> the watchdog if it is already running. Any reason for not doing that ?
>>
>> Well, you can re-program it but... It does not take effect until next window starts, so basically we need to take care of the currently running window anyways after which re-programming it doesn't make much sense anymore. And handling the switch from one setup to next would add extra complexity.
>>
> 
> Seems to me that hardware team really made an effort to make the
> watchdog as difficult to program as possible :-(.

Yea, it is surprisingly difficult to program... when watchdogs in 
principle are extremely simple pieces of HW. This claims to be some 
automotive grade watchdog, which means it has the window in place.

-Tero

> 
>> -Tero
>>
>>>
>>>> +    }
>>>> +
>>>> +    watchdog_init_timeout(wdd, heartbeat, dev);
>>>> +
>>>>        ret = watchdog_register_device(wdd);
>>>>        if (ret) {
>>>>            dev_err(dev, "cannot register watchdog device\n");
>>>>            goto err_iomap;
>>>>        }
>>>>    +    if (last_ping)
>>>> +        watchdog_set_last_hw_keepalive(wdd, last_ping);
>>>> +
>>>>        return 0;
>>>>      err_iomap:
>>>>
>>>
>>
>> -- 
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
