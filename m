Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3551B1F368C
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jun 2020 10:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgFII55 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jun 2020 04:57:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:63575 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbgFII5z (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jun 2020 04:57:55 -0400
IronPort-SDR: 0Apht4sP8kgflqzjtPyiAoaXc1Mi3vZbnGPt+3TtLidOpeF8AEVO00aDW349tWK38/Mf6KfXDV
 6qz2XroOoOzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 01:57:54 -0700
IronPort-SDR: 29e8Ey9G7kNr+oenwBfl0xYeoEgWRj39Uu/pDoiG2r9Lam3mTYwsWYvexTIF9/wgnQEgB2n5Si
 CQ8aAYqztmWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; 
   d="scan'208";a="418340444"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP; 09 Jun 2020 01:57:54 -0700
Received: from [10.215.166.141] (ekotax-mobl.gar.corp.intel.com [10.215.166.141])
        by linux.intel.com (Postfix) with ESMTP id 50BC35805B5;
        Tue,  9 Jun 2020 01:57:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: intel: Watchdog timer support on Lightning
 Mountain
To:     Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com, yixin.zhu@intel.com
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
 <220609c6aec3dbd06585897ddcfdde277c823cac.1591584255.git.eswara.kota@linux.intel.com>
 <61d256e7-88ca-ac89-9c80-132c0d2de4a8@roeck-us.net>
From:   Dilip Kota <eswara.kota@linux.intel.com>
Message-ID: <af453186-8017-31de-f6b3-f39f0c3704b8@linux.intel.com>
Date:   Tue, 9 Jun 2020 16:57:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <61d256e7-88ca-ac89-9c80-132c0d2de4a8@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 6/8/2020 9:36 PM, Guenter Roeck wrote:
> On 6/7/20 10:49 PM, Dilip Kota wrote:
>> On Intel Lightning Mountain SoC, General Purpose Timer Counter(GPTC)
>> programmable as clocksource, real time clock or watchdog timer.
>>
>> This driver configures GPTC as Watchdog timer and triggers reset signal
>> to CPU on timeout.
>>
>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>> ---
>>   drivers/watchdog/Kconfig              |  13 ++
>>   drivers/watchdog/Makefile             |   1 +
>>   drivers/watchdog/intel_lgm_gptc_wdt.c | 420 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 434 insertions(+)
>>   create mode 100644 drivers/watchdog/intel_lgm_gptc_wdt.c
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 0663c604bd642..8009c11e75dda 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1789,6 +1789,19 @@ config IMGPDC_WDT
>>   	  To compile this driver as a loadable module, choose M here.
>>   	  The module will be called imgpdc_wdt.
>>   
>> +config INTEL_LGM_GPTC_WDT
>> +	tristate "INTEL LGM SoC Watchdog"
>> +	depends on X86 || COMPILE_TEST
>> +	depends on OF && HAS_IOMEM
>> +	select REGMAP
>> +	select MFD_SYSCON
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Driver for Watchdog Timer on Intel Lightning Mountain SoC.
>> +
>> +	  To compile this driver as a loadable module, choose M here.
>> +	  The module will be called intel_lgm_gptc_wdt.
>> +
>>   config LANTIQ_WDT
>>   	tristate "Lantiq SoC watchdog"
>>   	depends on LANTIQ
>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>> index 6de2e4ceef190..92c99e4c46eb7 100644
>> --- a/drivers/watchdog/Makefile
>> +++ b/drivers/watchdog/Makefile
>> @@ -166,6 +166,7 @@ obj-$(CONFIG_TXX9_WDT) += txx9wdt.o
>>   obj-$(CONFIG_OCTEON_WDT) += octeon-wdt.o
>>   octeon-wdt-y := octeon-wdt-main.o octeon-wdt-nmi.o
>>   obj-$(CONFIG_LANTIQ_WDT) += lantiq_wdt.o
>> +obj-$(CONFIG_INTEL_LGM_GPTC_WDT) += intel_lgm_gptc_wdt.o
>>   obj-$(CONFIG_LOONGSON1_WDT) += loongson1_wdt.o
>>   obj-$(CONFIG_RALINK_WDT) += rt2880_wdt.o
>>   obj-$(CONFIG_IMGPDC_WDT) += imgpdc_wdt.o
>> diff --git a/drivers/watchdog/intel_lgm_gptc_wdt.c b/drivers/watchdog/intel_lgm_gptc_wdt.c
>> new file mode 100644
>> index 0000000000000..52be7cc194f8f
>> --- /dev/null
>> +++ b/drivers/watchdog/intel_lgm_gptc_wdt.c
>> @@ -0,0 +1,420 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2020 Intel Corporation.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/cpu.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/watchdog.h>
>> +
>> +#define GPTC_CLC		0x00
>> +#define GPTC_CLC_SUSPEND	BIT(4)
>> +#define GPTC_CLC_RMC		GENMASK(15, 8)
>> +
>> +/* divider 10 to produce 200 / 10 = 20 MHz clock */
>> +#define CLC_RMC_DIV		10
>> +
>> +#define GPTC_CON(X)		(0x10 + (X) * 0x20)
>> +#define GPTC_CON_CNT_UP		BIT(1)
>> +#define GPTC_CON_ONESHOT	BIT(3)
>> +#define GPTC_CON_EXT		BIT(4)
>> +
>> +#define GPTC_RUN(X)		(0x18 + (X) * 0x20)
>> +#define GPTC_RUN_EN		BIT(0)
>> +#define GPTC_RUN_STOP		BIT(1)
>> +#define GPTC_RUN_RELOAD		BIT(2)
>> +
>> +#define GPTC_RLD(X)		(0x20 + (X) * 0x20)
>> +#define GPTC_CNT(X)		(0x28 + (X) * 0x20)
>> +
>> +#define GPTC_IRNENCLR		0xF0
>> +#define GPTC_IRNEN		0xF4
>> +#define GPTC_IRNCR		0xFC
>> +
>> +/* Watchdog Timeout Reset register offset and bitfeilds */
>> +#define BIA_WDT_RST_EN		0x1E0
>> +#define BIA_WDT			BIT(6)
>> +
>> +#define MAX_TIMERID		2
>> +#define MAX_CPUID		3
>> +#define TIMER_MARGIN_SEC	300
>> +
>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>> +module_param(nowayout, bool, 0);
>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started\n"
>> +	" (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>> +
>> +struct lgm_gptc_timer {
>> +	struct lgm_gptc_wdt	*wdt_node;
>> +	struct watchdog_device	wdd;
>> +	unsigned int		tid;
>> +	unsigned int		cpuid;
>> +	unsigned int		frequency;
>> +	unsigned int		cycles;
>> +	bool			enable;
>> +};
>> +
>> +struct lgm_gptc_wdt {
>> +	struct device		*dev;
>> +	void __iomem		*gptc_base;
>> +	struct regmap		*rst_hndl;
>> +	struct clk		*freqclk;
>> +	struct clk		*gateclk;
>> +	unsigned int		fpifreq;
>> +	enum cpuhp_state	state;
>> +};
>> +
>> +DEFINE_PER_CPU(struct lgm_gptc_timer, lgm_timer_per_cpu);
>> +
> This is unusual. You'll have to provide a very detailed explanation
> why this is needed.
Sure will add it.
It is required for the hotplug cpu support, and hotplug cpu is added 
because, the cpus on Lightning Mountain SoC can be online and offline 
dynamically.
If CPUs come to online after the watchdog driver probe, hotplug CPU 
support helps to configure watchdog timer once CPU is online.

Regards,
-Dilip
>
> Guenter
>
>
