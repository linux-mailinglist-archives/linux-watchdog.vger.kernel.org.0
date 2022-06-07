Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F6053B2B9
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jun 2022 06:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiFBE1M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Jun 2022 00:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiFBE1M (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Jun 2022 00:27:12 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FE02293AB
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jun 2022 21:27:07 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c2so3545672plh.2
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Jun 2022 21:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vHmChKavm1p/nSaJkER/ldmkeQxkuFGCFwSsH6fcxnA=;
        b=MNWTl4nTaLObQ/XS7bQFPRlnIn2Lpswe3ZM2M3HdzXya3DUJ7n9JQ3RdWkgAn0n4k8
         77pe6wzuUDyv8unJhZ1GGj8DY6y0bwp0iKzJ3bO0/1veieR8TC++PvECrsbVtE2zmt09
         ng2oGNdhbw9jfKBbUMdhhvESlg8VEep2ShxjCqlCjpuQPpNNPnMQz7IFKRjrUCvB9Gm2
         uf3jum8+GnERnBzYP+AN4TQom24AZsSeWPCCmnxtE6B3p79FYDfVGMbUjw/l8l4d440S
         d4WjdeTLedPfL3fD0uHae6J2he6HDPCBgOY2gzMAStz2wPZ0qxxqn+ND9qvnZfOvUmQ8
         hzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vHmChKavm1p/nSaJkER/ldmkeQxkuFGCFwSsH6fcxnA=;
        b=Pe7/6bIlJFXKFEZFViMAcJmN1nXeg7s6fFPFUvJFQISel6BFfbQP52QnzlZEhjk/ix
         wq7TqQcbYak+6o+jCyFqx6J0phLJLlZxpbt52gut7pyWan49Vky3B5PlPSeHRZBvhQ1v
         nQ64mMBPFJ8Pvjxin2zlI7OSwbjSUlxTBg49CzJjasLDtJS6PGDkV9LD6fsPUOqisgDf
         n5wr8OH5hFAu5sgw98UT0zESZ/6g7WTp+6/TTm6crvKJACn+ogm0KS2zErtaNEpUNnHJ
         xuiBzI4NGy+BFxJ+Zg4b53qoF8O/DhREpkisjiCoff68njZvl2oTNRYpwm4suoMMxYp3
         hp8A==
X-Gm-Message-State: AOAM530OMAUfWlTlhj9MvNfJtb4ydTRPkZA2i0SXzeK1fhHoKqpNCpsh
        wiwfHBphA9g81g3lklC3JXOifg==
X-Google-Smtp-Source: ABdhPJxKwTRASU2yTEK8qB92H0EGvDPDLSiYUmrDaBk+fs5gQBo0Kp/8OOTCSCCc51dmuMuO2wTVgg==
X-Received: by 2002:a17:90b:4a8e:b0:1e4:e2bd:7ff1 with SMTP id lp14-20020a17090b4a8e00b001e4e2bd7ff1mr6848590pjb.58.1654144026533;
        Wed, 01 Jun 2022 21:27:06 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id l187-20020a6225c4000000b0051b97714703sm2250635pfl.187.2022.06.01.21.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 21:27:05 -0700 (PDT)
Message-ID: <c5dfebba-4252-3d7f-7a6a-533c846c3034@ozlabs.ru>
Date:   Thu, 2 Jun 2022 14:27:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:101.0) Gecko/20100101
 Thunderbird/101.0
Subject: Re: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        tzungbi@kernel.org, brking@linux.ibm.com, nathanl@linux.ibm.com,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
 <20220520183552.33426-5-cheloha@linux.ibm.com>
 <74498c4b-7b6a-3864-1ae8-57e848a1254c@ozlabs.ru>
 <Ypd8VFZhgEIWbv1P@rascal-austin-ibm-com>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <Ypd8VFZhgEIWbv1P@rascal-austin-ibm-com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 6/2/22 00:48, Scott Cheloha wrote:
> On Wed, May 25, 2022 at 04:35:11PM +1000, Alexey Kardashevskiy wrote:
>>
>> On 5/21/22 04:35, Scott Cheloha wrote:
>>> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
>>> guest control of one or more virtual watchdog timers.  The timers have
>>> millisecond granularity.  The guest is terminated when a timer
>>> expires.
>>>
>>> This patch adds a watchdog driver for these timers, "pseries-wdt".
>>>
>>> pseries_wdt_probe() currently assumes the existence of only one
>>> platform device and always assigns it watchdogNumber 1.  If we ever
>>> expose more than one timer to userspace we will need to devise a way
>>> to assign a distinct watchdogNumber to each platform device at device
>>> registration time.
>>
>> This one should go before 4/4 in the series for bisectability.
>>
>> What is platform_device_register_simple("pseries-wdt",...) going to do
>> without the driver?
> 
> This is a chicken-and-egg problem without an obvious solution.  A
> device without a driver is a body without a soul.  A driver without a
> device is a ghost without a machine.
> 
> ... or something like that, don't quote me :)
> 
> Absent some very compelling reasoning, I would like to keep the
> current order.  It feels logical to me to keep the powerpc/pseries
> patches adjacent and prior to the watchdog driver patch.
> 
>>> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>>> ---
>>>    .../watchdog/watchdog-parameters.rst          |  12 +
>>>    drivers/watchdog/Kconfig                      |   8 +
>>>    drivers/watchdog/Makefile                     |   1 +
>>>    drivers/watchdog/pseries-wdt.c                | 337 ++++++++++++++++++
>>>    4 files changed, 358 insertions(+)
>>>    create mode 100644 drivers/watchdog/pseries-wdt.c
>>>
>>> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
>>> index 223c99361a30..4ffe725e796c 100644
>>> --- a/Documentation/watchdog/watchdog-parameters.rst
>>> +++ b/Documentation/watchdog/watchdog-parameters.rst
>>> @@ -425,6 +425,18 @@ pnx833x_wdt:
>>>    -------------------------------------------------
>>> +pseries-wdt:
>>> +    action:
>>> +	Action taken when watchdog expires: 1 (power off), 2 (restart),
>>> +	3 (dump and restart). (default=2)
>>> +    timeout:
>>> +	Initial watchdog timeout in seconds. (default=60)
>>> +    nowayout:
>>> +	Watchdog cannot be stopped once started.
>>> +	(default=kernel config parameter)
>>> +
>>> +-------------------------------------------------
>>> +
>>>    rc32434_wdt:
>>>        timeout:
>>>    	Watchdog timeout value, in seconds (default=20)
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index c4e82a8d863f..06b412603f3e 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -1932,6 +1932,14 @@ config MEN_A21_WDT
>>>    # PPC64 Architecture
>>> +config PSERIES_WDT
>>> +	tristate "POWER Architecture Platform Watchdog Timer"
>>> +	depends on PPC_PSERIES
>>> +	select WATCHDOG_CORE
>>> +	help
>>> +	  Driver for virtual watchdog timers provided by PAPR
>>> +	  hypervisors (e.g. PowerVM, KVM).
>>> +
>>>    config WATCHDOG_RTAS
>>>    	tristate "RTAS watchdog"
>>>    	depends on PPC_RTAS
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index f7da867e8782..f35660409f17 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -184,6 +184,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
>>>    obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
>>>    # PPC64 Architecture
>>> +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
>>>    obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
>>>    # S390 Architecture
>>> diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
>>> new file mode 100644
>>> index 000000000000..f41bc4d3b7a2
>>> --- /dev/null
>>> +++ b/drivers/watchdog/pseries-wdt.c
>>> @@ -0,0 +1,337 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Copyright (c) 2022 International Business Machines, Inc.
>>> + */
>>> +
>>> +#include <linux/bitops.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/limits.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/moduleparam.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/watchdog.h>
>>> +
>>> +#define DRV_NAME "pseries-wdt"
>>> +
>>> +/*
>>> + * The PAPR's MSB->LSB bit ordering is 0->63.  These macros simplify
>>> + * defining bitfields as described in the PAPR without needing to
>>> + * transpose values to the more C-like 63->0 ordering.
>>> + */
>>> +#define SETFIELD(_v, _b, _e)	\
>>> +	(((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
>>> +#define GETFIELD(_v, _b, _e)	\
>>> +	(((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
>>> +
>>> +/*
>>> + * H_WATCHDOG Hypercall Input
>>> + *
>>> + * R4: "flags":
>>> + *
>>> + *     A 64-bit value structured as follows:
>>> + *
>>> + *         Bits 0-46: Reserved (must be zero).
>>> + */
>>> +#define PSERIES_WDTF_RESERVED	PPC_BITMASK(0, 46)
>>> +
>>> +/*
>>> + *         Bit 47: "leaveOtherWatchdogsRunningOnTimeout"
>>> + *
>>> + *             0  Stop outstanding watchdogs on timeout.
>>> + *             1  Leave outstanding watchdogs running on timeout.
>>> + */
>>> +#define PSERIES_WDTF_LEAVE_OTHER	PPC_BIT(47)
>>> +
>>> +/*
>>> + *         Bits 48-55: "operation"
>>> + *
>>> + *             0x01  Start Watchdog
>>> + *             0x02  Stop Watchdog
>>> + *             0x03  Query Watchdog Capabilities
>>> + *             0x04  Query Watchdog LPM Requirement
>>> + */
>>> +#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
>>> +#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
>>> +#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
>>> +#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
>>> +#define PSERIES_WDTF_OP_QUERY_LPM	PSERIES_WDTF_OP(0x4)
>>> +
>>> +/*
>>> + *         Bits 56-63: "timeoutAction"
>>> + *
>>> + *             0x01  Hard poweroff
>>> + *             0x02  Hard restart
>>> + *             0x03  Dump restart
>>> + */
>>> +#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
>>> +#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
>>> +#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
>>> +#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)
>>
>>> +
>>> +/*
>>> + * R5: "watchdogNumber":
>>> + *
>>> + *     The target watchdog.  Watchdog numbers are 1-based.  The
>>> + *     maximum supported watchdog number may be obtained via the
>>> + *     "Query Watchdog Capabilities" operation.
>>> + *
>>> + *     This input is ignored for the "Query Watchdog Capabilities"
>>> + *     operation.
>>> + *
>>> + * R6: "timeoutInMs":
>>> + *
>>> + *     The timeout in milliseconds.  The minimum supported timeout may
>>> + *     be obtained via the "Query Watchdog Capabilities" operation.
>>> + *
>>> + *     This input is ignored for the "Stop Watchdog", "Query Watchdog
>>> + *     Capabilities", and "Query Watchdog LPM Requirement" operations.
>>> + */
>>> +
>>> +/*
>>> + * H_WATCHDOG Hypercall Output
>>> + *
>>> + * R3: Return code
>>> + *
>>> + *     H_SUCCESS    The operation completed.
>>> + *
>>> + *     H_BUSY	    The hypervisor is too busy; retry the operation.
>>> + *
>>> + *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
>>> + *                  "operation" or "timeoutAction" is invalid, or a
>>> + *                  reserved bit is set.
>>> + *
>>> + *     H_P2         The given "watchdogNumber" is zero or exceeds the
>>> + *                  supported maximum value.
>>> + *
>>> + *     H_P3         The given "timeoutInMs" is below the supported
>>> + *                  minimum value.
>>> + *
>>> + *     H_NOOP       The given "watchdogNumber" is already stopped.
>>> + *
>>> + *     H_HARDWARE   The operation failed for ineffable reasons.
>>> + *
>>> + *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
>>> + *                  hypervisor.
>>> + *
>>> + * R4:
>>> + *
>>> + * - For the "Query Watchdog Capabilities" operation, a 64-bit
>>> + *   value structured as follows:
>>> + *
>>> + *       Bits  0-15: The minimum supported timeout in milliseconds.
>>> + *       Bits 16-31: The number of watchdogs supported.
>>> + *       Bits 32-63: Reserved.
>>> + */
>>> +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
>>> +#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)
>>> +#define PSERIES_WDTQ_RESERVED		PPC_BITMASK(32, 63)
>>
>> PSERIES_WDTQ_RESERVED is not needed as there is a comment above.
> 
> The *_RESERVED macros are from your draft patch.  I will remove them,
> though, we aren't actually using them.


Well, I was thinking of testing the reserved bits to be all zero but the 
interface may grow so yeah, drop it.


> I will trim up the big comment for v2, too.  It's just going to rot
> otherwise.  You need to read the PAPR to review the hypercalls,
> anyway.
> 
>>> +
>>> +/*
>>> + * - For the "Query Watchdog LPM Requirement" operation:
>>> + *
>>> + *       1  The given "watchdogNumber" must be stopped prior to
>>> + *          suspending.
>>> + *
>>> + *       2  The given "watchdogNumber" does not have to be stopped
>>> + *          prior to suspending.
>>> + */
>>> +#define PSERIES_WDTQL_MUST_STOP		1
>>> +#define PSERIES_WDTQL_NEED_NOT_STOP	2
>>> +
>>> +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
>>> +
>>> +static int action_get(char *buf, const struct kernel_param *kp)
>>> +{
>>> +	int val;
>>> +
>>> +	switch (action) {
>>> +	case PSERIES_WDTF_ACTION_HARD_POWEROFF:
>>> +		val = 1;
>>> +		break;
>>> +	case PSERIES_WDTF_ACTION_HARD_RESTART:
>>> +		val = 2;
>>> +		break;
>>> +	case PSERIES_WDTF_ACTION_DUMP_RESTART:
>>> +		val = 3;
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +	return sprintf(buf, "%d\n", val);
>>> +}
>>> +
>>> +static int action_set(const char *val, const struct kernel_param *kp)
>>> +{
>>> +	int choice;
>>> +
>>> +	if (kstrtoint(val, 10, &choice))
>>> +		return -EINVAL;
>>> +	switch (choice) {
>>> +	case 1:
>>> +		action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
>>> +		return 0;
>>> +	case 2:
>>> +		action = PSERIES_WDTF_ACTION_HARD_RESTART;
>>> +		return 0;
>>> +	case 3:
>>> +		action = PSERIES_WDTF_ACTION_DUMP_RESTART;
>>> +		return 0;
>>> +	}
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static const struct kernel_param_ops action_ops = {
>>> +	.get = action_get,
>>> +	.set = action_set,
>>> +};
>>> +module_param_cb(action, &action_ops, NULL, 0444);
>>
>> 0644 here and below?
> 
> I do not want these changing at runtime.  0444 is the right thing.


If the driver is compiled into vmlinux, then I'll have to have stuff in 
/etc/modprobe.d (or kernel cmdline) and reboot the kernel, annoying for 
testing/debugging. Not a big deal but I just do not see what 0444 buys 
compared to 0644 or (mostly used for watchdogs) 0.



-- 
Alexey
