Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D8C63F491
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Dec 2022 16:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbiLAP4i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Dec 2022 10:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiLAP4h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Dec 2022 10:56:37 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04BFA896F;
        Thu,  1 Dec 2022 07:56:35 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id g51-20020a9d12b6000000b0066dbea0d203so1214031otg.6;
        Thu, 01 Dec 2022 07:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCGjYzF2+06EInqIcZCZP7MFyaDySpfz2bo8H03l0ds=;
        b=NFGBbL+fJfqNs3PAby8Bo7Yc6LypSLHwPDYSjDrvABwSuveD4GNg+/qwqJmNVL2VGz
         w7OZ+qS4Ux06CB7aKhw7NJ+4mTTnTdi9phNJFeseFEVBHNfQs1RSqkdbNnm/FeaOMWL+
         quJkdsqxfSE0ArBkI5EHMk4VR2RdiXmb74tDfnkC/yKwsbVF4SnBrsHVckILfKqReGJk
         3TO1CaGZHk+ulQvkMHtbAD90Lg6j8OxiEoSdSkb1vku1riKucKzDY3DHF75Dq7YmiVvK
         NVUxWgGZiuNBvjaUCSoJpMoNP3zdDaqBdg7Ouhbm5CmlJwZEa4YUcbgfJJA2xDENjs2k
         GUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCGjYzF2+06EInqIcZCZP7MFyaDySpfz2bo8H03l0ds=;
        b=I1NWMlpSzhuJAfFQhxFNJ8MHmNyNXlkMK40gH7XzBIzBkyzhkMs8VjWbmrvrFIOuFC
         9B0KLU9F9SL3L0XErzRqL5cWByWCXWLP7/f/WTuuyYGz1+HKE/o42Xbz7JRxV9bceeSx
         HO+bXhpr6ujuf0rOcscYthPLZ4UmY7JqZfgYMEM0Egu79X5gAQBoROpv6Wc55wRR91KW
         17BqO806I8DA9roEFAQTrsN5qJ0DZvWUGkXODzBkJxFsHTJUfmdbIz+CXJcOA31hI3Z7
         GbrtG03NYUByp4NE2/YP/KBXwaGgj/RGCV/wUzJqG2JgvTPZU99D1jH8qDyaRpoJYJ15
         lqTQ==
X-Gm-Message-State: ANoB5pmx2ov5FojqQCQPXl3oo1KuICdcItSyu3UjkT41DabFN2gMNrWd
        ZExNRvfnpPYwEEvKbYHOS0w=
X-Google-Smtp-Source: AA0mqf6tdHKUT0Rez3bvp+l3vt+phCcuDbgASXWtiSr3yZf+5B1lVB06h3EMKkWWCUm8erCWv1G6vA==
X-Received: by 2002:a9d:2d1:0:b0:66d:c20f:2f9 with SMTP id 75-20020a9d02d1000000b0066dc20f02f9mr22993600otl.115.1669910195199;
        Thu, 01 Dec 2022 07:56:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f199-20020a4a58d0000000b004a084b7062asm800413oob.40.2022.12.01.07.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 07:56:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0fa0cce5-47b3-90f7-7936-61409aae5c7f@roeck-us.net>
Date:   Thu, 1 Dec 2022 07:56:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>,
        "Neeli, Srinivas" <srinivas.neeli@amd.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>
References: <20220927110257.41963-1-srinivas.neeli@amd.com>
 <20220927110257.41963-3-srinivas.neeli@amd.com>
 <20221002162528.GA2900147@roeck-us.net>
 <BY5PR12MB403335B81FB6DF09D65A08B593239@BY5PR12MB4033.namprd12.prod.outlook.com>
 <BY5PR12MB403330D43906BD6D617DB0DC93389@BY5PR12MB4033.namprd12.prod.outlook.com>
 <20221103172432.GB177861@roeck-us.net>
 <DM6PR12MB4044C5194CC4C70A36E2F4F9933D9@DM6PR12MB4044.namprd12.prod.outlook.com>
 <8bd8f53b-948e-637a-d692-78a7ac15c6df@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal window watchdog
 support
In-Reply-To: <8bd8f53b-948e-637a-d692-78a7ac15c6df@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/1/22 03:08, Michal Simek wrote:
> Hi Guenter,
> 
> On 11/6/22 16:16, Neeli, Srinivas wrote:
>> Hi Guenter,
>>
>>> -----Original Message-----
>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>> Sent: Thursday, November 3, 2022 10:55 PM
>>> To: Neeli, Srinivas <srinivas.neeli@amd.com>
>>> Cc: wim@linux-watchdog.org; Datta, Shubhrajyoti
>>> <shubhrajyoti.datta@amd.com>; Simek, Michal <michal.simek@amd.com>;
>>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; linux-
>>> kernel@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-arm-
>>> kernel@lists.infradead.org; devicetree@vger.kernel.org; git (AMD-Xilinx)
>>> <git@amd.com>
>>> Subject: Re: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal window
>>> watchdog support
>>>
>>> On Thu, Nov 03, 2022 at 04:51:14PM +0000, Neeli, Srinivas wrote:
>>>> HI Guenter,
>>>>
>>>>> -----Original Message-----
>>>>> From: Neeli, Srinivas <srinivas.neeli@amd.com>
>>>>> Sent: Tuesday, October 11, 2022 11:57 AM
>>>>> To: Guenter Roeck <linux@roeck-us.net>
>>>>> Cc: wim@linux-watchdog.org; Datta, Shubhrajyoti
>>>>> <shubhrajyoti.datta@amd.com>; Simek, Michal
>>> <michal.simek@amd.com>;
>>>>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; linux-
>>>>> kernel@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-arm-
>>>>> kernel@lists.infradead.org; devicetree@vger.kernel.org; git
>>>>> (AMD-Xilinx) <git@amd.com>
>>>>> Subject: RE: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal window
>>>>> watchdog support
>>>>>
>>>>> Hi,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>> Roeck
>>>>>> Sent: Sunday, October 2, 2022 9:55 PM
>>>>>> To: Neeli, Srinivas <srinivas.neeli@amd.com>
>>>>>> Cc: wim@linux-watchdog.org; Datta, Shubhrajyoti
>>>>>> <shubhrajyoti.datta@amd.com>; Simek, Michal
>>>>> <michal.simek@amd.com>;
>>>>>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; linux-
>>>>>> kernel@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-arm-
>>>>>> kernel@lists.infradead.org; devicetree@vger.kernel.org; git
>>>>>> (AMD-Xilinx) <git@amd.com>
>>>>>> Subject: Re: [PATCH 2/3] watchdog: xilinx_wwdt: Add Versal window
>>>>>> watchdog support
>>>>>>
>>>>>> On Tue, Sep 27, 2022 at 04:32:56PM +0530, Srinivas Neeli wrote:
>>>>>>> Versal watchdog driver uses window watchdog mode. Window
>>>>>>> watchdog
>>>>>>> timer(WWDT) contains closed(first) and open(second) window with
>>>>>>> 32 bit width. Write to the watchdog timer within predefined
>>>>>>> window periods of time. This means a period that is not too soon
>>>>>>> and a period that is not too late. The WWDT has to be restarted
>>>>>>> within the open window time. If software tries to restart WWDT
>>>>>>> outside of the open window time period, it generates a reset.
>>>>>>>
>>>>>>> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
>>>>>>> ---
>>>>>>>   drivers/watchdog/Kconfig       |  17 ++
>>>>>>>   drivers/watchdog/Makefile      |   1 +
>>>>>>>   drivers/watchdog/xilinx_wwdt.c | 286
>>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>>   3 files changed, 304 insertions(+)  create mode 100644
>>>>>>> drivers/watchdog/xilinx_wwdt.c
>>>>>>>
>>>>>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>>>>>> index
>>>>>>> 688922fc4edb..9822e471b9f0 100644
>>>>>>> --- a/drivers/watchdog/Kconfig
>>>>>>> +++ b/drivers/watchdog/Kconfig
>>>>>>> @@ -304,6 +304,23 @@ config XILINX_WATCHDOG
>>>>>>>         To compile this driver as a module, choose M here: the
>>>>>>>         module will be called of_xilinx_wdt.
>>>>>>>
>>>>>>> +config XILINX_WINDOW_WATCHDOG
>>>>>>> +    tristate "Xilinx window watchdog timer"
>>>>>>> +    depends on HAS_IOMEM
>>>>>>> +    select WATCHDOG_CORE
>>>>>>> +    help
>>>>>>> +      Window watchdog driver for the versal_wwdt ip core.
>>>>>>> +      Window watchdog timer(WWDT) contains closed(first) and
>>>>>>> +      open(second) window with 32 bit width. Write to the
>>> watchdog
>>>>>>> +      timer within predefined window periods of time. This
>>> means
>>>>>>> +      a period that is not too soon and a period that is not too
>>>>>>> +      late. The WWDT has to be restarted within the open
>>> window time.
>>>>>>> +      If software tries to restart WWDT outside of the open
>>> window
>>>>>>> +      time period, it generates a reset.
>>>>>>> +
>>>>>>> +      To compile this driver as a module, choose M here: the
>>>>>>> +      module will be called xilinx_wwdt.
>>>>>>> +
>>>>>>>   config ZIIRAVE_WATCHDOG
>>>>>>>       tristate "Zodiac RAVE Watchdog Timer"
>>>>>>>       depends on I2C
>>>>>>> diff --git a/drivers/watchdog/Makefile
>>>>>>> b/drivers/watchdog/Makefile index cdeb119e6e61..4ff96c517407
>>>>>>> 100644
>>>>>>> --- a/drivers/watchdog/Makefile
>>>>>>> +++ b/drivers/watchdog/Makefile
>>>>>>> @@ -155,6 +155,7 @@ obj-$(CONFIG_M54xx_WATCHDOG) +=
>>>>>> m54xx_wdt.o
>>>>>>>
>>>>>>>   # MicroBlaze Architecture
>>>>>>>   obj-$(CONFIG_XILINX_WATCHDOG) += of_xilinx_wdt.o
>>>>>>> +obj-$(CONFIG_XILINX_WINDOW_WATCHDOG) += xilinx_wwdt.o
>>>>>>>
>>>>>>>   # MIPS Architecture
>>>>>>>   obj-$(CONFIG_ATH79_WDT) += ath79_wdt.o diff --git
>>>>>>> a/drivers/watchdog/xilinx_wwdt.c
>>>>>>> b/drivers/watchdog/xilinx_wwdt.c new file mode 100644 index
>>>>>>> 000000000000..2594a01c2764
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/watchdog/xilinx_wwdt.c
>>>>>>> @@ -0,0 +1,286 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>> +/*
>>>>>>> + * Window watchdog device driver for Xilinx Versal WWDT
>>>>>>> + *
>>>>>>> + * Copyright (C) 2022, Advanced Micro Devices, Inc.
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <linux/clk.h>
>>>>>>> +#include <linux/interrupt.h>
>>>>>>> +#include <linux/io.h>
>>>>>>> +#include <linux/ioport.h>
>>>>>>> +#include <linux/module.h>
>>>>>>> +#include <linux/of_device.h>
>>>>>>> +#include <linux/of_address.h>
>>>>>>> +#include <linux/watchdog.h>
>>>>>>> +
>>>>>>> +#define XWWDT_DEFAULT_TIMEOUT    40
>>>>>>> +#define XWWDT_MIN_TIMEOUT    1
>>>>>>> +#define XWWDT_MAX_TIMEOUT    42
>>>>>>> +
>>>>>>> +/* Register offsets for the WWDT device */
>>>>>>> +#define XWWDT_MWR_OFFSET    0x00
>>>>>>> +#define XWWDT_ESR_OFFSET    0x04
>>>>>>> +#define XWWDT_FCR_OFFSET    0x08
>>>>>>> +#define XWWDT_FWR_OFFSET    0x0c
>>>>>>> +#define XWWDT_SWR_OFFSET    0x10
>>>>>>> +
>>>>>>> +/* Master Write Control Register Masks */
>>>>>>> +#define XWWDT_MWR_MASK        BIT(0)
>>>>>>> +
>>>>>>> +/* Enable and Status Register Masks */
>>>>>>> +#define XWWDT_ESR_WINT_MASK    BIT(16)
>>>>>>> +#define XWWDT_ESR_WSW_MASK    BIT(8)
>>>>>>> +#define XWWDT_ESR_WEN_MASK    BIT(0)
>>>>>>> +
>>>>>>> +#define XWWDT_PERCENT        50
>>>>>>> +
>>>>>>> +static int xwwdt_timeout;
>>>>>>> +static int xclosed_window_percent;
>>>>>>> +
>>>>>>> +module_param(xwwdt_timeout, int, 0644);
>>>>>>> +MODULE_PARM_DESC(xwwdt_timeout,
>>>>>>> +         "Watchdog time in seconds. (default="
>>>>>>> +         __MODULE_STRING(XWWDT_DEFAULT_TIMEOUT)
>>> ")");
>>>>>>
>>>>>> There is no reason to make this writeable. There are means to set
>>>>>> the timeout in runtime. Those should be used.
>>>>>
>>>>> Accepted and will update in V2.
>>>>>>
>>>>>>> +module_param(xclosed_window_percent, int, 0644);
>>>>>>> +MODULE_PARM_DESC(xclosed_window_percent,
>>>>>>> +         "Watchdog closed window percentage. (default="
>>>>>>> +         __MODULE_STRING(XWWDT_PERCENT) ")");
>>>>>>
>>>>>> The above is problematic. This should really not be set during
>>>>>> runtime, and the behavior is pretty much undefined if it is
>>>>>> changed while the watchdog is running. It should really be set
>>>>>> using devicetree and not be changed in the running system.
>>>>>
>>>>> Accepted and will update in V2.
>>>>>>
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * struct xwwdt_device - Watchdog device structure
>>>>>>> + * @base: base io address of WDT device
>>>>>>> + * @spinlock: spinlock for IO register access
>>>>>>> + * @xilinx_wwdt_wdd: watchdog device structure
>>>>>>> + * @clk: struct clk * of a clock source
>>>>>>> + * @freq: source clock frequency of WWDT  */ struct xwwdt_device {
>>>>>>> +    void __iomem *base;
>>>>>>> +    spinlock_t spinlock; /* spinlock for register handling */
>>>>>>> +    struct watchdog_device xilinx_wwdt_wdd;
>>>>>>> +    struct clk *clk;
>>>>>>> +    unsigned long    freq;
>>>>>>> +};
>>>>>>> +
>>>>>>> +static bool is_wwdt_in_closed_window(struct watchdog_device
>>> *wdd) {
>>>>>>> +    struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
>>>>>>> +    u32 csr, ret;
>>>>>>> +
>>>>>>> +    csr = ioread32(xdev->base + XWWDT_ESR_OFFSET);
>>>>>>> +
>>>>>>> +    ret = (csr & XWWDT_ESR_WEN_MASK) ? !(csr &
>>>>>> XWWDT_ESR_WSW_MASK) ? 0 :
>>>>>>> +1 : 1;
>>>>>>
>>>>>> This is confusing.
>>>>>>
>>>>>>     return !(csr & XWWDT_ESR_WEN_MASK) || ((csr &
>>>>> XWWDT_ESR_WSW_MASK);
>>>>>>
>>>>>> should do the same and would be easier to understand, though I am
>>>>>> not sure if it is correct (making the point that the expression is
>>> confusing).
>>>>>>
>>>>> Accepted and will update in V2.
>>>>>
>>>>>>> +
>>>>>>> +    return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int xilinx_wwdt_start(struct watchdog_device *wdd) {
>>>>>>> +    struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
>>>>>>> +    struct watchdog_device *xilinx_wwdt_wdd = &xdev-
>>>>>>> xilinx_wwdt_wdd;
>>>>>>> +    u64 time_out, closed_timeout, open_timeout;
>>>>>>> +    u32 control_status_reg;
>>>>>>> +
>>>>>>> +    /* Calculate timeout count */
>>>>>>> +    time_out = xdev->freq * wdd->timeout;
>>>>>>> +
>>>>>>> +    if (xclosed_window_percent) {
>>>>>>> +        closed_timeout = (time_out *
>>> xclosed_window_percent) /
>>>>>> 100;
>>>>>>> +        open_timeout = time_out - closed_timeout;
>>>>>>> +        wdd->min_hw_heartbeat_ms =
>>> xclosed_window_percent *
>>>>>> 10 * wdd->timeout;
>>>>>>> +    } else {
>>>>>>> +        /* Calculate 50% of timeout */
>>>>>>
>>>>>> Isn't that a bit random ?
>>>>>
>>>>> Versal Window watchdog IP supports below features.
>>>>>   1)Start
>>>>>   2)Stop
>>>>>   3)Configure Timeout
>>>>>   4)Refresh
>>>>>
>>>>> Planning to take closed window percentage from device tree parameter.
>>>>> If the user hasn't passed the closed window percentage from the
>>>>> device tree, by default, taking XWWDT_PERCENT value which is 50.
>>>>>
>>
>> Does above explanation looks fine to you ?
>>
>>>>>>
>>>>>>> +        time_out *= XWWDT_PERCENT;
>>>>>>> +        time_out /= 100;
>>>>>>> +        wdd->min_hw_heartbeat_ms = XWWDT_PERCENT *
>>> 10 *
>>>>>> wdd->timeout;
>>>>>>
>>>>>> min_hw_heartbeat_ms is supposed to be fixed after probe. Behavior
>>>>>> of changing it when starting the watchdog is undefined. This will
>>>>>> likely fail under some conditions.
>>>>>
>>>>> As I said in above comments versal watchdog IP supports
>>>>> reconfiguration of timeout, so every restart we are updating
>>>>> min_hw_heartbeat_ms based on timeout.
>>>>>
>>
>> After stop we are reconfiguring the min_hw_heartbeat_ms, do you think still it will fail ?.
>>
>>>>>>
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    spin_lock(&xdev->spinlock);
>>>>>>> +
>>>>>>> +    iowrite32(XWWDT_MWR_MASK, xdev->base +
>>>>>> XWWDT_MWR_OFFSET);
>>>>>>> +    iowrite32(~(u32)XWWDT_ESR_WEN_MASK, xdev->base +
>>>>>> XWWDT_ESR_OFFSET);
>>>>>>> +
>>>>>>> +    if (xclosed_window_percent) {
>>>>>>> +        iowrite32((u32)closed_timeout, xdev->base +
>>>>>> XWWDT_FWR_OFFSET);
>>>>>>> +        iowrite32((u32)open_timeout, xdev->base +
>>>>>> XWWDT_SWR_OFFSET);
>>>>>>> +    } else {
>>>>>>> +        /* Configure closed and open windows with 50% of
>>> timeout
>>>>>> */
>>>>>>> +        iowrite32((u32)time_out, xdev->base +
>>>>>> XWWDT_FWR_OFFSET);
>>>>>>> +        iowrite32((u32)time_out, xdev->base +
>>>>>> XWWDT_SWR_OFFSET);
>>>>>>> +    }
>>>>>>
>>>>>> This if/else should not be necessary by using appropriate
>>>>>> calculations
>>>>> above.
>>>>>> Anyway, this is moot - as said above, changing min_hw_heartbeat_ms
>>>>>> after probe is unexpected, and the code will have to be changed to
>>>>>> use a fixed value for the window size. With that, all calculations
>>>>>> can and should be done in the probe function.
>>>>>>
>>>>>>> +
>>>>>>> +    /* Enable the window watchdog timer */
>>>>>>> +    control_status_reg = ioread32(xdev->base +
>>> XWWDT_ESR_OFFSET);
>>>>>>> +    control_status_reg |= XWWDT_ESR_WEN_MASK;
>>>>>>> +    iowrite32(control_status_reg, xdev->base +
>>> XWWDT_ESR_OFFSET);
>>>>>>
>>>>>> Why is this enabled unconditionally ? I would assume that a user
>>>>>> specifying a 0-percentage window size doesn't want it enabled.
>>>>>
>>>>> Plan to add a check for closed window percentage. If user tries to
>>>>> configure 100% of closed window, driver configures XWWDT_PERCENT
>>> value.
>>>>> Configuring 100% of closed window not suggestible.
>>>>>
>>
>> Do you have any feedback on above explanation ?.
>>
>>>>>>
>>>>>>> +
>>>>>>> +    spin_unlock(&xdev->spinlock);
>>>>>>> +
>>>>>>> +    dev_dbg(xilinx_wwdt_wdd->parent, "Watchdog Started!\n");
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int xilinx_wwdt_keepalive(struct watchdog_device *wdd) {
>>>>>>> +    struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
>>>>>>> +    u32 control_status_reg;
>>>>>>> +
>>>>>>> +    spin_lock(&xdev->spinlock);
>>>>>>> +
>>>>>>> +    /* Enable write access control bit for the window watchdog
>>> */
>>>>>>> +    iowrite32(XWWDT_MWR_MASK, xdev->base +
>>>>>> XWWDT_MWR_OFFSET);
>>>>>>> +
>>>>>>> +    /* Trigger restart kick to watchdog */
>>>>>>> +    control_status_reg = ioread32(xdev->base +
>>> XWWDT_ESR_OFFSET);
>>>>>>> +    control_status_reg |= XWWDT_ESR_WSW_MASK;
>>>>>>> +    iowrite32(control_status_reg, xdev->base +
>>> XWWDT_ESR_OFFSET);
>>>>>>> +
>>>>>>> +    spin_unlock(&xdev->spinlock);
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int xilinx_wwdt_set_timeout(struct watchdog_device *wdd,
>>>>>>> +                   unsigned int new_time)
>>>>>>> +{
>>>>>>> +    struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
>>>>>>> +    struct watchdog_device *xilinx_wwdt_wdd = &xdev-
>>>>>>> xilinx_wwdt_wdd;
>>>>>>> +
>>>>>>> +    if (watchdog_active(xilinx_wwdt_wdd))
>>>>>>> +        return -EPERM;
>>>>>>
>>>>>> Why ? This will be the most common case and means to change the
>>>>> timeout.
>>>>>
>>>>> Versal Watchdog supports reconfiguration of timeout. If we try to
>>>>> reconfigure timeout without stopping the watchdog, driver returns
>>>>> error immediately. Reconfiguration of timeout, Stop and Refresh not
>>>>> allowed in closed window.
>>>>> User can trigger set timeout any point of time, So avoiding
>>>>> reconfiguring the timeout feature using driver API if the watchdog is
>>> active.
>>>>>
>>
>> Please share your comments on this.
>>
> 
> I see that there are still some pending questions on this thread.
> Could you please take a look at it?
> If you think that would be better to send v2 and better describe the problematic parts as the part of commit message that should be also fine.
> 

I can only decode the comment on the bottom. I think that problem needs
a better solution. Returning -EPERM is definitely wrong here. How would
you expect userspace to react on it ? Expecting userspace to stop the
watchdog before updating the timeout is not acceptable; that is not
defined in the ABI, and we can not expect watchdog daemons to know about
it.

You could, for example:
- stop the watchdog, update the timeout, and restart it. That is
   less than perfect, but other drivers with similar limitations
   do it as well.
- Mark the timeout update as pending, and update it in the permitted
   window (if that is possible; the above comment is vague on that).

Guenter

