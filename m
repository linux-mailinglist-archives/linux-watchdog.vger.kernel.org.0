Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABFC551013
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 08:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238562AbiFTGJR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 02:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiFTGJR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 02:09:17 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907AEBCAE
        for <linux-watchdog@vger.kernel.org>; Sun, 19 Jun 2022 23:09:13 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id t21so3046953pfq.1
        for <linux-watchdog@vger.kernel.org>; Sun, 19 Jun 2022 23:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zXA2AXs0ESQoe+81cjDWMt03b4r8DHbfQH5pjoinc3k=;
        b=Sd0+tWrmdUmGNu6bsmzAkVGQR8q3+sEZiAM1nnIYqeYpTzMcFq6yxUDRyvhM9EXpDD
         VPfpiXxyXJCI4ev3T6x4xLT3+gjT/Y8shq8PIoM+kkus/sMTTZBZkl/q4yrtijQPgv9E
         ijqS36rDW/ipanOGhOvcO4q/Yv8aavKdkaV7ncUOQdDEdgajbcgaq0s7EWg3E7SIuW9t
         3nXw4ln6p65uoVIDgLs/GsrXX0PqjQgWNEQ5nba3m4lXNLIr+6jUduxSSNnfMtoHzLBE
         B8ODAeY83IMeeRala/mwDmeoNH3RbcNpROr01+wj3WgW3CerIlEO4KAY+Jvm3fGyTzUq
         RGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zXA2AXs0ESQoe+81cjDWMt03b4r8DHbfQH5pjoinc3k=;
        b=NkXPH9WL8N5jDqMIZO9KuA3Eh1wI+r3yzwS5voXU56kTG69NKrX2g0qKWfAPVkwBm4
         NRaJdhxsLAYLjNXPKGSuhaYaTAuFgmOzwTSHlcmhylmdKTHxwM7222W9AGyY3rLLjWRh
         a6ZQbnE+I0MUUdB+rlIvfFTHGBDMp8V0+MayuxM8igG6D7InhjNXk35/P4HsyLs6eHX8
         yp/GBa9kujEq3CbHtwHD6RlnjuFn/udsgEZvSe+q6pjO/pHIKijPJjWUem3u1CY9mpHA
         N5aPSzMVu809K2DndtfUZ1EOdYr4VrlNgshvqFMLw0PD2AncDG1b+I9v2zjs1h0P2YoI
         OhSQ==
X-Gm-Message-State: AJIora9GTURiEzBlpIV4Ilu3nw2Z2LMqJzKMH7sxtM9rFQAHyllOYdcp
        GqVjXkO+xJpVxiLRVt1RWamPEg==
X-Google-Smtp-Source: AGRyM1vGKcX3pbHirYvJnRNIz56ocCZsoP5iycloPyHNsNx8FYN0Kq2LuaGO8699bFS1Ady2dJ4Mdg==
X-Received: by 2002:a62:f846:0:b0:51c:17b2:60de with SMTP id c6-20020a62f846000000b0051c17b260demr23000217pfm.76.1655705352993;
        Sun, 19 Jun 2022 23:09:12 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id x9-20020a1709029a4900b00168a216f629sm7717771plv.11.2022.06.19.23.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 23:09:12 -0700 (PDT)
Message-ID: <fb7f486f-9d92-18aa-a1f2-d81f0be6313f@ozlabs.ru>
Date:   Mon, 20 Jun 2022 16:09:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v2 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com, linuxppc-dev@lists.ozlabs.org
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-5-cheloha@linux.ibm.com>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220602175353.68942-5-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 6/3/22 03:53, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> guest control of one or more virtual watchdog timers.  The timers have
> millisecond granularity.  The guest is terminated when a timer
> expires.
> 
> This patch adds a watchdog driver for these timers, "pseries-wdt".
> 
> pseries_wdt_probe() currently assumes the existence of only one
> platform device and always assigns it watchdogNumber 1.  If we ever
> expose more than one timer to userspace we will need to devise a way
> to assign a distinct watchdogNumber to each platform device at device
> registration time.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>


Besides the patch ordering and 0444 vs. 0644 (which is up to the PPC 
maintainer to decide anyway :) ), looks good to me.


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> ---
>   .../watchdog/watchdog-parameters.rst          |  12 +
>   drivers/watchdog/Kconfig                      |   8 +
>   drivers/watchdog/Makefile                     |   1 +
>   drivers/watchdog/pseries-wdt.c                | 264 ++++++++++++++++++
>   4 files changed, 285 insertions(+)
>   create mode 100644 drivers/watchdog/pseries-wdt.c
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 223c99361a30..29153eed6689 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -425,6 +425,18 @@ pnx833x_wdt:
>   
>   -------------------------------------------------
>   
> +pseries-wdt:
> +    action:
> +	Action taken when watchdog expires: 0 (power off), 1 (restart),
> +	2 (dump and restart). (default=1)
> +    timeout:
> +	Initial watchdog timeout in seconds. (default=60)
> +    nowayout:
> +	Watchdog cannot be stopped once started.
> +	(default=kernel config parameter)
> +
> +-------------------------------------------------
> +
>   rc32434_wdt:
>       timeout:
>   	Watchdog timeout value, in seconds (default=20)
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c4e82a8d863f..06b412603f3e 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1932,6 +1932,14 @@ config MEN_A21_WDT
>   
>   # PPC64 Architecture
>   
> +config PSERIES_WDT
> +	tristate "POWER Architecture Platform Watchdog Timer"
> +	depends on PPC_PSERIES
> +	select WATCHDOG_CORE
> +	help
> +	  Driver for virtual watchdog timers provided by PAPR
> +	  hypervisors (e.g. PowerVM, KVM).
> +
>   config WATCHDOG_RTAS
>   	tristate "RTAS watchdog"
>   	depends on PPC_RTAS
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index f7da867e8782..f35660409f17 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -184,6 +184,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
>   obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
>   
>   # PPC64 Architecture
> +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
>   obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
>   
>   # S390 Architecture
> diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> new file mode 100644
> index 000000000000..cfe53587457d
> --- /dev/null
> +++ b/drivers/watchdog/pseries-wdt.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2022 International Business Machines, Inc.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define DRV_NAME "pseries-wdt"
> +
> +/*
> + * The PAPR's MSB->LSB bit ordering is 0->63.  These macros simplify
> + * defining bitfields as described in the PAPR without needing to
> + * transpose values to the more C-like 63->0 ordering.
> + */
> +#define SETFIELD(_v, _b, _e)	\
> +	(((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
> +#define GETFIELD(_v, _b, _e)	\
> +	(((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
> +
> +/*
> + * The H_WATCHDOG hypercall first appears in PAPR v2.12 and is
> + * described fully in sections 14.5 and 14.15.6.
> + *
> + *
> + * H_WATCHDOG Input
> + *
> + * R4: "flags":
> + *
> + *         Bits 48-55: "operation"
> + *
> + *             0x01  Start Watchdog
> + *             0x02  Stop Watchdog
> + *             0x03  Query Watchdog Capabilities
> + */
> +#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
> +#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
> +#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
> +#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
> +
> +/*
> + *         Bits 56-63: "timeoutAction" (for "Start Watchdog" only)
> + *
> + *             0x01  Hard poweroff
> + *             0x02  Hard restart
> + *             0x03  Dump restart
> + */
> +#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
> +#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
> +#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
> +#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)
> +
> +/*
> + * H_WATCHDOG Output
> + *
> + * R3: Return code
> + *
> + *     H_SUCCESS    The operation completed.
> + *
> + *     H_BUSY	    The hypervisor is too busy; retry the operation.
> + *
> + *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
> + *                  "operation" or "timeoutAction" is invalid, or a
> + *                  reserved bit is set.
> + *
> + *     H_P2         The given "watchdogNumber" is zero or exceeds the
> + *                  supported maximum value.
> + *
> + *     H_P3         The given "timeoutInMs" is below the supported
> + *                  minimum value.
> + *
> + *     H_NOOP       The given "watchdogNumber" is already stopped.
> + *
> + *     H_HARDWARE   The operation failed for ineffable reasons.
> + *
> + *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
> + *                  hypervisor.
> + *
> + * R4:
> + *
> + * - For the "Query Watchdog Capabilities" operation, a 64-bit
> + *   value structured as follows:
> + *
> + *       Bits  0-15: The minimum supported timeout in milliseconds.
> + *       Bits 16-31: The number of watchdogs supported.
> + *       Bits 32-63: Reserved.
> + */
> +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
> +#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)
> +
> +static const unsigned long pseries_wdt_action[] = {
> +	[0] = PSERIES_WDTF_ACTION_HARD_POWEROFF,
> +	[1] = PSERIES_WDTF_ACTION_HARD_RESTART,
> +	[2] = PSERIES_WDTF_ACTION_DUMP_RESTART,
> +};
> +
> +#define WATCHDOG_ACTION 1
> +static unsigned int action = WATCHDOG_ACTION;
> +module_param(action, uint, 0444);
> +MODULE_PARM_DESC(action, "Action taken when watchdog expires (default="
> +		 __MODULE_STRING(WATCHDOG_ACTION) ")");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0444);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +#define WATCHDOG_TIMEOUT 60
> +static unsigned int timeout = WATCHDOG_TIMEOUT;
> +module_param(timeout, uint, 0444);
> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default="
> +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
> +
> +struct pseries_wdt {
> +	struct watchdog_device wd;
> +	unsigned long action;
> +	unsigned long num;		/* Watchdog numbers are 1-based */
> +};
> +
> +static int pseries_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct device *dev = wdd->parent;
> +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> +	unsigned long flags, msecs;
> +	long rc;
> +
> +	flags = pw->action | PSERIES_WDTF_OP_START;
> +	msecs = wdd->timeout * 1000UL;
> +	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
> +	if (rc != H_SUCCESS) {
> +		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
> +			 rc, pw->num);
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +static int pseries_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct device *dev = wdd->parent;
> +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> +	long rc;
> +
> +	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
> +	if (rc != H_SUCCESS && rc != H_NOOP) {
> +		dev_crit(dev, "H_WATCHDOG: %ld: failed to stop timer %lu",
> +			 rc, pw->num);
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +static struct watchdog_info pseries_wdt_info = {
> +	.identity = DRV_NAME,
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
> +	    | WDIOF_PRETIMEOUT,
> +};
> +
> +static const struct watchdog_ops pseries_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pseries_wdt_start,
> +	.stop = pseries_wdt_stop,
> +};
> +
> +static int pseries_wdt_probe(struct platform_device *pdev)
> +{
> +	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	unsigned long cap;
> +	long rc;
> +	struct pseries_wdt *pw;
> +	int err;
> +
> +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> +	if (rc == H_FUNCTION)
> +		return -ENODEV;
> +	if (rc != H_SUCCESS)
> +		return -EIO;
> +	cap = ret[0];
> +
> +	pw = devm_kzalloc(&pdev->dev, sizeof(*pw), GFP_KERNEL);
> +	if (!pw)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Assume watchdogNumber 1 for now.  If we ever support
> +	 * multiple timers we will need to devise a way to choose a
> +	 * distinct watchdogNumber for each platform device at device
> +	 * registration time.
> +	 */
> +	pw->num = 1;
> +
> +	if (action >= ARRAY_SIZE(pseries_wdt_action))
> +		return -EINVAL;
> +	pw->action = pseries_wdt_action[action];
> +
> +	pw->wd.parent = &pdev->dev;
> +	pw->wd.info = &pseries_wdt_info;
> +	pw->wd.ops = &pseries_wdt_ops;
> +	pw->wd.min_timeout = DIV_ROUND_UP(PSERIES_WDTQ_MIN_TIMEOUT(cap), 1000);
> +	pw->wd.max_timeout = UINT_MAX / 1000;
> +	pw->wd.timeout = timeout;
> +	if (watchdog_init_timeout(&pw->wd, 0, NULL))
> +		return -EINVAL;
> +	watchdog_set_nowayout(&pw->wd, nowayout);
> +	watchdog_stop_on_reboot(&pw->wd);
> +	watchdog_stop_on_unregister(&pw->wd);
> +	watchdog_set_drvdata(&pw->wd, pw);
> +
> +	err = devm_watchdog_register_device(&pdev->dev, &pw->wd);
> +	if (err)
> +		return err;
> +
> +	platform_set_drvdata(pdev, &pw->wd);
> +
> +	return 0;
> +}
> +
> +static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct watchdog_device *wd = platform_get_drvdata(pdev);
> +
> +	if (watchdog_active(wd))
> +		return pseries_wdt_stop(wd);
> +	return 0;
> +}
> +
> +static int pseries_wdt_resume(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wd = platform_get_drvdata(pdev);
> +
> +	if (watchdog_active(wd))
> +		return pseries_wdt_start(wd);
> +	return 0;
> +}
> +
> +static const struct platform_device_id pseries_wdt_id[] = {
> +	{ .name = "pseries-wdt" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, pseries_wdt_id);
> +
> +static struct platform_driver pseries_wdt_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +		.owner = THIS_MODULE,
> +	},
> +	.id_table = pseries_wdt_id,
> +	.probe = pseries_wdt_probe,
> +	.resume = pseries_wdt_resume,
> +	.suspend = pseries_wdt_suspend,
> +};
> +module_platform_driver(pseries_wdt_driver);
> +
> +MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
> +MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");
> +MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
> +MODULE_LICENSE("GPL");

-- 
Alexey
