Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BA31F3CED
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jun 2020 15:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbgFINnL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jun 2020 09:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbgFINmx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jun 2020 09:42:53 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9085DC05BD1E;
        Tue,  9 Jun 2020 06:42:53 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 64so3232427pfv.11;
        Tue, 09 Jun 2020 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hg4XbzMRc321/FqU3t3M6QC5gbPOsmfWjnt4iHQGCLw=;
        b=a9Eum29nPInujHeR5P6iDGSrhM0p9UGTvj4xwKlt8D6T2QDBM8GufDS+ehLt7sYC0w
         BOWq2gpfJUNiqk+7UcARmryq1ilYPb6rn/Z64kd6Ln8hmTX14lM2KGeRq631IERgxSYm
         A2jK2mcxeoyICsAnwO3mlou9B9a4uuEnCQ36PjBJeFAsip8fptMOOYgsPQKU+ysXnHTz
         FYaL9+pypK70M+rfCLWCud8tXJhIctZeSPnO2qQ3cqPcTTtD6ya+DXngD9MehY1c89pH
         KOEDvyDM3/FW3eAB10dSILFsygafe55txNk4zCVhnAHPajcOsmIl4WWzwFj1j/ygwH0j
         U5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hg4XbzMRc321/FqU3t3M6QC5gbPOsmfWjnt4iHQGCLw=;
        b=gquFZNZZjTI6vDLIvCG5TMe+SyFeKaIoaLIk4KM3TRuit4AupUhR1eooRFJeBQSKg7
         HYYQpy1hMUCA85k5OWftduRx6okzyTdx7QWF6CgpLTokxjkW1RO2kaMo8awVmevTa7bz
         eP0WRtNtO1rsErGYVZecCbDA8jlozche7fv4pB8rM+f8dlvR1fPeGC6X1VdbBq1NXRAA
         Oq9O0ecjOFsvanOAuFcYP0kN9Mx5kFzBKa04yPx+V8+m3YIDNvWFtNPw5ifAiWlC5Gha
         YnoNZQldmUUCY45zV7zD15ZZr80IhlhC/sOAg7fQDjkqyDDvLOsMGfu5iKQCb5Bsp/M1
         3YSA==
X-Gm-Message-State: AOAM531AWkFMBsvC39V5QBj7Fa2Wh+wB5db9DnZgIoLpj8WrDErtOsUw
        PZKEZGPpdJY53FnZdIhP4LpEIird
X-Google-Smtp-Source: ABdhPJwbZzZN13Qcr04DuYwIkR/p5HLAjHDsZbkX9yH23XCXyBbAZdWP+TXlPd1iA1V5a0G1gVwl5Q==
X-Received: by 2002:a62:7610:: with SMTP id r16mr25351796pfc.70.1591710172970;
        Tue, 09 Jun 2020 06:42:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ev20sm2629731pjb.8.2020.06.09.06.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:42:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: intel: Watchdog timer support on Lightning
 Mountain
To:     Dilip Kota <eswara.kota@linux.intel.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com, yixin.zhu@intel.com
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
 <220609c6aec3dbd06585897ddcfdde277c823cac.1591584255.git.eswara.kota@linux.intel.com>
 <61d256e7-88ca-ac89-9c80-132c0d2de4a8@roeck-us.net>
 <af453186-8017-31de-f6b3-f39f0c3704b8@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8cb36dce-bd2e-2581-5644-fc73e4d94316@roeck-us.net>
Date:   Tue, 9 Jun 2020 06:42:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <af453186-8017-31de-f6b3-f39f0c3704b8@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/9/20 1:57 AM, Dilip Kota wrote:
> 
> On 6/8/2020 9:36 PM, Guenter Roeck wrote:
>> On 6/7/20 10:49 PM, Dilip Kota wrote:
>>> On Intel Lightning Mountain SoC, General Purpose Timer Counter(GPTC)
>>> programmable as clocksource, real time clock or watchdog timer.
>>>
>>> This driver configures GPTC as Watchdog timer and triggers reset signal
>>> to CPU on timeout.
>>>
>>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>>> ---
>>>   drivers/watchdog/Kconfig              |  13 ++
>>>   drivers/watchdog/Makefile             |   1 +
>>>   drivers/watchdog/intel_lgm_gptc_wdt.c | 420 ++++++++++++++++++++++++++++++++++
>>>   3 files changed, 434 insertions(+)
>>>   create mode 100644 drivers/watchdog/intel_lgm_gptc_wdt.c
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 0663c604bd642..8009c11e75dda 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -1789,6 +1789,19 @@ config IMGPDC_WDT
>>>         To compile this driver as a loadable module, choose M here.
>>>         The module will be called imgpdc_wdt.
>>>   +config INTEL_LGM_GPTC_WDT
>>> +    tristate "INTEL LGM SoC Watchdog"
>>> +    depends on X86 || COMPILE_TEST
>>> +    depends on OF && HAS_IOMEM
>>> +    select REGMAP
>>> +    select MFD_SYSCON
>>> +    select WATCHDOG_CORE
>>> +    help
>>> +      Driver for Watchdog Timer on Intel Lightning Mountain SoC.
>>> +
>>> +      To compile this driver as a loadable module, choose M here.
>>> +      The module will be called intel_lgm_gptc_wdt.
>>> +
>>>   config LANTIQ_WDT
>>>       tristate "Lantiq SoC watchdog"
>>>       depends on LANTIQ
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index 6de2e4ceef190..92c99e4c46eb7 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -166,6 +166,7 @@ obj-$(CONFIG_TXX9_WDT) += txx9wdt.o
>>>   obj-$(CONFIG_OCTEON_WDT) += octeon-wdt.o
>>>   octeon-wdt-y := octeon-wdt-main.o octeon-wdt-nmi.o
>>>   obj-$(CONFIG_LANTIQ_WDT) += lantiq_wdt.o
>>> +obj-$(CONFIG_INTEL_LGM_GPTC_WDT) += intel_lgm_gptc_wdt.o
>>>   obj-$(CONFIG_LOONGSON1_WDT) += loongson1_wdt.o
>>>   obj-$(CONFIG_RALINK_WDT) += rt2880_wdt.o
>>>   obj-$(CONFIG_IMGPDC_WDT) += imgpdc_wdt.o
>>> diff --git a/drivers/watchdog/intel_lgm_gptc_wdt.c b/drivers/watchdog/intel_lgm_gptc_wdt.c
>>> new file mode 100644
>>> index 0000000000000..52be7cc194f8f
>>> --- /dev/null
>>> +++ b/drivers/watchdog/intel_lgm_gptc_wdt.c
>>> @@ -0,0 +1,420 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2020 Intel Corporation.
>>> + */
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/cpu.h>
>>> +#include <linux/io.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/watchdog.h>
>>> +
>>> +#define GPTC_CLC        0x00
>>> +#define GPTC_CLC_SUSPEND    BIT(4)
>>> +#define GPTC_CLC_RMC        GENMASK(15, 8)
>>> +
>>> +/* divider 10 to produce 200 / 10 = 20 MHz clock */
>>> +#define CLC_RMC_DIV        10
>>> +
>>> +#define GPTC_CON(X)        (0x10 + (X) * 0x20)
>>> +#define GPTC_CON_CNT_UP        BIT(1)
>>> +#define GPTC_CON_ONESHOT    BIT(3)
>>> +#define GPTC_CON_EXT        BIT(4)
>>> +
>>> +#define GPTC_RUN(X)        (0x18 + (X) * 0x20)
>>> +#define GPTC_RUN_EN        BIT(0)
>>> +#define GPTC_RUN_STOP        BIT(1)
>>> +#define GPTC_RUN_RELOAD        BIT(2)
>>> +
>>> +#define GPTC_RLD(X)        (0x20 + (X) * 0x20)
>>> +#define GPTC_CNT(X)        (0x28 + (X) * 0x20)
>>> +
>>> +#define GPTC_IRNENCLR        0xF0
>>> +#define GPTC_IRNEN        0xF4
>>> +#define GPTC_IRNCR        0xFC
>>> +
>>> +/* Watchdog Timeout Reset register offset and bitfeilds */
>>> +#define BIA_WDT_RST_EN        0x1E0
>>> +#define BIA_WDT            BIT(6)
>>> +
>>> +#define MAX_TIMERID        2
>>> +#define MAX_CPUID        3
>>> +#define TIMER_MARGIN_SEC    300
>>> +
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>> +module_param(nowayout, bool, 0);
>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started\n"
>>> +    " (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +
>>> +struct lgm_gptc_timer {
>>> +    struct lgm_gptc_wdt    *wdt_node;
>>> +    struct watchdog_device    wdd;
>>> +    unsigned int        tid;
>>> +    unsigned int        cpuid;
>>> +    unsigned int        frequency;
>>> +    unsigned int        cycles;
>>> +    bool            enable;
>>> +};
>>> +
>>> +struct lgm_gptc_wdt {
>>> +    struct device        *dev;
>>> +    void __iomem        *gptc_base;
>>> +    struct regmap        *rst_hndl;
>>> +    struct clk        *freqclk;
>>> +    struct clk        *gateclk;
>>> +    unsigned int        fpifreq;
>>> +    enum cpuhp_state    state;
>>> +};
>>> +
>>> +DEFINE_PER_CPU(struct lgm_gptc_timer, lgm_timer_per_cpu);
>>> +
>> This is unusual. You'll have to provide a very detailed explanation
>> why this is needed.
> Sure will add it.
> It is required for the hotplug cpu support, and hotplug cpu is added because, the cpus on Lightning Mountain SoC can be online and offline dynamically.
> If CPUs come to online after the watchdog driver probe, hotplug CPU support helps to configure watchdog timer once CPU is online.
> 

There is another watchdog in the system monitoring individual CPUs.
The watchdog subsystem monitors the system, not individual CPUs.
Individual CUPs are monitored with kernel/watchdog.c, and we should
keep it that way.

Guenter
