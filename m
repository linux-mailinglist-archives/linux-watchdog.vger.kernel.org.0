Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E6232C8A2
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 02:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241811AbhCDAvj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Mar 2021 19:51:39 -0500
Received: from lizzard.sbs.de ([194.138.37.39]:36722 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245013AbhCCPOE (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Mar 2021 10:14:04 -0500
X-Greylist: delayed 873 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Mar 2021 10:13:43 EST
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 123EsV4n012168
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 3 Mar 2021 15:54:31 +0100
Received: from [139.22.114.127] ([139.22.114.127])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 123EnUe4025084;
        Wed, 3 Mar 2021 15:49:31 +0100
Subject: Re: [PATCH 3/4] watchdog: simatic-ipc-wdt: add new driver for Siemens
 Industrial PCs
To:     Henning Schild <henning.schild@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-4-henning.schild@siemens.com>
 <fa73ed42-dcbc-26c8-f119-244d4f4eea03@roeck-us.net>
 <20210303152105.1ca683eb@md1za8fc.ad001.siemens.net>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c499838a-1a1b-0190-d818-b622af7cc03f@siemens.com>
Date:   Wed, 3 Mar 2021 15:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303152105.1ca683eb@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 03.03.21 15:21, Henning Schild wrote:
> Hi, 
> 
> thanks for the fast and thorough review!
> 
> Am Tue, 2 Mar 2021 10:38:19 -0800
> schrieb Guenter Roeck <linux@roeck-us.net>:
> 
>> On 3/2/21 8:33 AM, Henning Schild wrote:
>>> From: Henning Schild <henning.schild@siemens.com>
>>>
>>> This driver adds initial support for several devices from Siemens.
>>> It is based on a platform driver introduced in an earlier commit.
>>>
>>> Signed-off-by: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
>>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
>>> ---
>>>  drivers/watchdog/Kconfig           |  11 ++
>>>  drivers/watchdog/Makefile          |   1 +
>>>  drivers/watchdog/simatic-ipc-wdt.c | 305
>>> +++++++++++++++++++++++++++++ 3 files changed, 317 insertions(+)
>>>  create mode 100644 drivers/watchdog/simatic-ipc-wdt.c
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 1fe0042a48d2..948497eb4bef 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -1575,6 +1575,17 @@ config NIC7018_WDT
>>>  	  To compile this driver as a module, choose M here: the
>>> module will be called nic7018_wdt.
>>>  
>>> +config SIEMENS_SIMATIC_IPC_WDT
>>> +	tristate "Siemens Simatic IPC Watchdog"
>>> +	depends on SIEMENS_SIMATIC_IPC
>>> +	select WATCHDOG_CORE
>>> +	help
>>> +	  This driver adds support for several watchdogs found in
>>> Industrial
>>> +	  PCs from Siemens.
>>> +
>>> +	  To compile this driver as a module, choose M here: the
>>> module will be
>>> +	  called simatic-ipc-wdt.
>>> +
>>>  # M68K Architecture
>>>  
>>>  config M54xx_WATCHDOG
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index f3a6540e725e..7f5c73ec058c 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -142,6 +142,7 @@ obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
>>>  obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
>>>  obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
>>>  obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
>>> +obj-$(CONFIG_SIEMENS_SIMATIC_IPC_WDT) += simatic-ipc-wdt.o
>>>  
>>>  # M68K Architecture
>>>  obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
>>> diff --git a/drivers/watchdog/simatic-ipc-wdt.c
>>> b/drivers/watchdog/simatic-ipc-wdt.c new file mode 100644
>>> index 000000000000..b5c8b7ceb404
>>> --- /dev/null
>>> +++ b/drivers/watchdog/simatic-ipc-wdt.c
>>> @@ -0,0 +1,305 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Siemens SIMATIC IPC driver for Watchdogs
>>> + *
>>> + * Copyright (c) Siemens AG, 2020-2021
>>> + *
>>> + * Authors:
>>> + *  Gerd Haeussler <gerd.haeussler.ext@siemens.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> modify
>>> + * it under the terms of the GNU General Public License version 2
>>> as
>>> + * published by the Free Software Foundation.  
>>
>> Covered by SPDX-License-Identifier
>>
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/watchdog.h>
>>> +#include <linux/ioport.h>
>>> +#include <linux/sizes.h>> +#include <linux/io.h>
>>> +#include <linux/platform_data/x86/simatic-ipc-base.h>  
>>
>> Alphabetic order please
>>
>>> +
>>> +#define WD_ENABLE_IOADR		0x62
>>> +#define WD_TRIGGER_IOADR	0x66
>>> +#define GPIO_COMMUNITY0_PORT_ID 0xaf
>>> +#define PAD_CFG_DW0_GPP_A_23	0x4b8  
>>
>> Please increase indentation and spare another tab
>>
>>> +#define SAFE_EN_N_427E		0x01
>>> +#define SAFE_EN_N_227E		0x04
>>> +#define WD_ENABLED		0x01
>>> +
>>> +#define TIMEOUT_MIN	2
>>> +#define TIMEOUT_DEF	64
>>> +#define TIMEOUT_MAX	64
>>> +
>>> +#define GP_STATUS_REG_227E	0x404D	/* IO PORT for
>>> SAFE_EN_N on 227E */ +
>>> +static bool nowayout = WATCHDOG_NOWAYOUT;
>>> +module_param(nowayout, bool, 0000);
>>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once
>>> started (default="
>>> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>>> +
>>> +static DEFINE_SPINLOCK(io_lock);	/* the lock for io
>>> operations */ +static struct watchdog_device wdd;
>>> +  
>>
>> Having two variables named 'wdd' is confusing. Please chose another
>> name.
>>
>>> +static struct resource gp_status_reg_227e_res =
>>> +	DEFINE_RES_IO_NAMED(GP_STATUS_REG_227E, SZ_1,
>>> KBUILD_MODNAME); +
>>> +static struct resource io_resource =
>>> +	DEFINE_RES_IO_NAMED(WD_ENABLE_IOADR, SZ_1,
>>> +			    KBUILD_MODNAME " WD_ENABLE_IOADR");
>>> +
>>> +/* the actual start will be discovered with pci, 0 is a
>>> placeholder */ +static struct resource mem_resource =
>>> +	DEFINE_RES_MEM_NAMED(0, SZ_4, "WD_RESET_BASE_ADR");
>>> +
>>> +static u32 wd_timeout_table[] = {2, 4, 6, 8, 16, 32, 48, 64 };
>>> +static void __iomem *wd_reset_base_addr;
>>> +
>>> +static int get_timeout_idx(u32 timeout)
>>> +{
>>> +	int i;
>>> +
>>> +	i = ARRAY_SIZE(wd_timeout_table) - 1;
>>> +	for (; i >= 0; i--) {
>>> +		if (timeout >= wd_timeout_table[i])
>>> +			break;
>>> +	}
>>> +
>>> +	return i;
>>> +}  
>>
>> Please add a comment explaining why you don't use find_closest().
> 
> Will not be a comment but we will switch to using this, thanks for
> pointing it out.
> 
>>> +
>>> +static int wd_start(struct watchdog_device *wdd)
>>> +{
>>> +	u8 regval;
>>> +
>>> +	spin_lock(&io_lock);
>>> +  
>> The watchdog subsystem already provides locking
>> since the watchdog device can only be opened once.
>>
>> Why is the additional lock needed ?
> 
> We had this under internal review and somehow came to the conclusion
> that we "might" need it. I think we will remove it or come back with
> reasons.

Probably my fault. I quickly scanned for locking usage in other watchdog
drivers and found plenty of those RMW-protecting locks. I didn't check
then what the actual locking model of the watchdog core is, and possibly
some of the other use cases need to protect register against other users
or multiple watchdog instances. But if the core locks
start/stop/set_timeout internally against each other, this is obviously
pointless without out inherently single-instance use case here.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
