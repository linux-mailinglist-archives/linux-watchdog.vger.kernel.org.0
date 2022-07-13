Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79D4573E27
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Jul 2022 22:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237147AbiGMUuT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Jul 2022 16:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbiGMUuS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Jul 2022 16:50:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5242B61C
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Jul 2022 13:50:17 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x18-20020a17090a8a9200b001ef83b332f5so5785665pjn.0
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Jul 2022 13:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hp79+i9S1PuvzV/quTgH0L3QAjXtGOEONLRTvlWJtkA=;
        b=Z1Xfku+88HTac3aJE8OoOiLLWOU/UhfpU5AI/Iedp0WMAnFBUYp7fC3JSUdQbL3s+s
         9EGTG2qb0ogQANFLKJesRrfhLyktnXDFhshXeP5/MjQevU5mT+T4URdHIVtdBCmRWCmr
         nSHyslqoJi47lymUrzHbtYKoC4YyMcJRmXnKk6OaOj+aySGFLj3WC6NZkOyyoScySBuS
         QX64FDXoTluk3nr63d+rj1+K1J8TEZ5CWI1uIpAOfJUFQqy6OrGTb+pmg9pnU5XM7Lb1
         Ob+Kdaqw1G49Ip8YpCex1x0ymZ9FM8r9j1WZMYimvYjTcHumhJSbjw9xVL4Nok7cDweq
         oWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hp79+i9S1PuvzV/quTgH0L3QAjXtGOEONLRTvlWJtkA=;
        b=fjq8GhpEujrMWdF4LcKw4NvquYiBtjfW9cJe1SY5GRepCW1JFVp0y+CzzT5x+Gj44k
         47taOiGVEsI9ARkvka6bGhrz2XM1fMWHLzaV8VHKJQ/dC+CWJfjg3aqpNCQ9H+mdj/Fg
         F2dNjSzreFCQ2xIXPX3s7mL+aIj7XNQ4fME6kFMmOUhplmA5AqqyWu+FRkXpBWrQYtUr
         Ns8KYszYkdi+o2eXka3COUYHMRPr0VV2PZiS0aeCcqC/SQPDd9z7pgCmw1zd10EM/aF6
         6iw02+GCJfLrrZWb0ucbQ1xiNRt7CSBZXARr1Y0ExJJ5AVgWeW1VI/6+kmUsm1rriZcS
         MdvA==
X-Gm-Message-State: AJIora+l4n/cRJKPlLtykttb4dhEbJhxqMNVqIe/QEDDMeoEHEiGOcOS
        UrPr75QiUxjt+xf6ThcVQ4M=
X-Google-Smtp-Source: AGRyM1ucCqVI4rpErGcps+HzRZBrppfwvwuy9+xlGNmMjmVqop9tkI6lgCKYOCmNhD4S0An3zjMKjA==
X-Received: by 2002:a17:902:e54e:b0:16c:33f7:55f7 with SMTP id n14-20020a170902e54e00b0016c33f755f7mr4868611plf.111.1657745417339;
        Wed, 13 Jul 2022 13:50:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902da8c00b0016bd67bc868sm9325348plx.210.2022.07.13.13.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 13:50:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
Date:   Wed, 13 Jul 2022 13:50:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Content-Language: en-US
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     tzungbi@kernel.org, brking@linux.ibm.com, nathanl@linux.ibm.com,
        aik@ozlabs.ru, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
 <20220713202335.1217647-5-cheloha@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220713202335.1217647-5-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/13/22 13:23, Scott Cheloha wrote:
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

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../watchdog/watchdog-parameters.rst          |  12 +
>   drivers/watchdog/Kconfig                      |   8 +
>   drivers/watchdog/Makefile                     |   1 +
>   drivers/watchdog/pseries-wdt.c                | 239 ++++++++++++++++++
>   4 files changed, 260 insertions(+)
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
> index 32fd37698932..a2429604a4ab 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1962,6 +1962,14 @@ config MEN_A21_WDT
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
> index c324e9d820e9..cdeb119e6e61 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -187,6 +187,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
>   obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
>   
>   # PPC64 Architecture
> +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
>   obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
>   
>   # S390 Architecture
> diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> new file mode 100644
> index 000000000000..7f53b5293409
> --- /dev/null
> +++ b/drivers/watchdog/pseries-wdt.c
> @@ -0,0 +1,239 @@
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
> +#include <linux/time64.h>
> +#include <linux/watchdog.h>
> +
> +#define DRV_NAME "pseries-wdt"
> +
> +/*
> + * H_WATCHDOG Input
> + *
> + * R4: "flags":
> + *
> + *         Bits 48-55: "operation"
> + */
> +#define PSERIES_WDTF_OP_START	0x100UL		/* start timer */
> +#define PSERIES_WDTF_OP_STOP	0x200UL		/* stop timer */
> +#define PSERIES_WDTF_OP_QUERY	0x300UL		/* query timer capabilities */
> +
> +/*
> + *         Bits 56-63: "timeoutAction" (for "Start Watchdog" only)
> + */
> +#define PSERIES_WDTF_ACTION_HARD_POWEROFF	0x1UL	/* poweroff */
> +#define PSERIES_WDTF_ACTION_HARD_RESTART	0x2UL	/* restart */
> +#define PSERIES_WDTF_ACTION_DUMP_RESTART	0x3UL	/* dump + restart */
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
> + *   structure:
> + */
> +#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	(((cap) >> 48) & 0xffff)
> +#define PSERIES_WDTQ_MAX_NUMBER(cap)	(((cap) >> 32) & 0xffff)
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
> +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> +	struct device *dev = wdd->parent;
> +	unsigned long flags, msecs;
> +	long rc;
> +
> +	flags = pw->action | PSERIES_WDTF_OP_START;
> +	msecs = wdd->timeout * MSEC_PER_SEC;
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
> +	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
> +	struct device *dev = wdd->parent;
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
> +	struct pseries_wdt *pw;
> +	unsigned long cap;
> +	long msecs, rc;
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
> +	if (PSERIES_WDTQ_MAX_NUMBER(cap) < pw->num)
> +		return -ENODEV;
> +
> +	if (action >= ARRAY_SIZE(pseries_wdt_action))
> +		return -EINVAL;
> +	pw->action = pseries_wdt_action[action];
> +
> +	pw->wd.parent = &pdev->dev;
> +	pw->wd.info = &pseries_wdt_info;
> +	pw->wd.ops = &pseries_wdt_ops;
> +	msecs = PSERIES_WDTQ_MIN_TIMEOUT(cap);
> +	pw->wd.min_timeout = DIV_ROUND_UP(msecs, MSEC_PER_SEC);
> +	pw->wd.max_timeout = UINT_MAX / 1000;	/* from linux/watchdog.h */
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
> +	},
> +	.id_table = pseries_wdt_id,
> +	.probe = pseries_wdt_probe,
> +	.resume = pseries_wdt_resume,
> +	.suspend = pseries_wdt_suspend,
> +};
> +module_platform_driver(pseries_wdt_driver);
> +
> +MODULE_AUTHOR("Alexey Kardashevskiy");
> +MODULE_AUTHOR("Scott Cheloha");
> +MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
> +MODULE_LICENSE("GPL");

