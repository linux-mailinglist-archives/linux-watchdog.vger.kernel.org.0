Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602F2500498
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Apr 2022 05:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239675AbiDNDWi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Apr 2022 23:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiDNDWh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Apr 2022 23:22:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702E541332
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 20:20:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5976561DA5
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Apr 2022 03:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F60C385A5;
        Thu, 14 Apr 2022 03:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649906412;
        bh=e2P6fvPnDlzkrFy5I+hB+7mW+fQdsD3bjs8RefVmOmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZBXfAGN844s/+usICEMhh0Q7R9LbqxHbAEGQxAVZ2awMl7AQrlJU1I3MRUMj16K+5
         IFyWa/whZ8ajfUj34Yb+iqM34pV53QS5fo20EU3a3JXbNWja32B8RgcJegODKwZvYt
         QkUxvG5jGNjr9sL5Q8zPd/pZ7v4uqkk1+aVfMA5g2sxjmSu2mF48WO6xfsa90udCPG
         nasZqBw4SsriqbOI/kCDMco6AIzUVVGniZzvauPnWEWftF7B9VKUExGNMunAHuaWzf
         TsLuQCMlgQLcz/RmdWPTMEjAgTuWbi81t7GDQA/+ir/LutcgMQUQ2u7kOnlUoWQFK/
         qKSYxA2lPHnpg==
Date:   Thu, 14 Apr 2022 11:20:08 +0800
From:   Tzung-Bi Shih <tzungbi@kernel.org>
To:     Scott Cheloha <cheloha@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, bjking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
Subject: Re: [RFC v1 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
Message-ID: <YleS6B3bFA0J1/b+@google.com>
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
 <20220413165104.179144-3-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413165104.179144-3-cheloha@linux.ibm.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 13, 2022 at 11:51:04AM -0500, Scott Cheloha wrote:
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c4e82a8d863f..f3e6db5bed74 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1941,6 +1941,14 @@ config WATCHDOG_RTAS
>  	  To compile this driver as a module, choose M here. The module
>  	  will be called wdrtas.
>  
> +config PSERIES_WDT
> +	tristate "POWER Architecture Platform Watchdog Timer"
> +	depends on PPC_PSERIES
> +	select WATCHDOG_CORE
> +	help
> +	  Driver for virtual watchdog timers provided by PAPR
> +	  hypervisors (e.g. pHyp, KVM).
> +

To maintain alphabetical order, the option should be prior to WATCHDOG_RTAS.

> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index f7da867e8782..3ae1f7d9f1ec 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -185,6 +185,7 @@ obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
>  
>  # PPC64 Architecture
>  obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
> +obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o

Same here.

> diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
> new file mode 100644
> index 000000000000..0d22ddf12a7f
> --- /dev/null
> +++ b/drivers/watchdog/pseries-wdt.c
> @@ -0,0 +1,337 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#define DRV_NAME "pseries-wdt"
> +#define pr_fmt(fmt) DRV_NAME ": " fmt

`pr_fmt` is unused.

> +/*
> + * The PAPR's MSB->LSB bit ordering is is 0->63.  These macros
> + * simplify defining bitfields as described in the PAPR without
> + * needing to transpose values to the more C-like 63->0 ordering.
> + */
> +#define SETFIELD(_v, _b, _e)	\
> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK(_b, _e))
> +#define GETFIELD(_v, _b, _e)	\
> +    (((unsigned long)(_v) & PPC_BITMASK(_b, _e)) >> PPC_BITLSHIFT(_e))

Would it be better to enclose parentheses for _b and _e in PPC_BITMASK()?

> +/*
> + * R5: "watchdogNumber":
> + *
> + *     The target watchdog.  Watchdog numbers are 1-based.  The
> + *     maximum supported watchdog number may be obtained via the
> + *     "Query Watchdog Capabilities" operation.
> + *
> + *     This input is ignored for the "Query Watchdog Capabilities"
> + *     operation.
> + *
> + * R6: "timeoutInMs":
> + *
> + *     The timeout in milliseconds.  The minimum supported timeout may
> + *     be obtained via the "Query Watchdog Capabilities" operation.
> + *
> + *     This input is ignored for the "Stop Watchdog", "Query Watchdog
> + *     Capabilities", and "Query LPM Requirement" operations.
> + */
> +
> +/*
> + * H_WATCHDOG Hypercall Output
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

The above registers/bits have no corresponding macros for manipulating.  Are
they constructing?

> +static struct platform_device *pseries_wdt_pdev;

I wonder if it could be dropped.  See below.

> +static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;

It looks like `action` can only be in the scope of pseries_wdt_start().

> +static unsigned int min_timeout = 0;

I wonder if it could be dropped.  See below.

> +struct pseries_wdt {
> +	struct watchdog_device wd;
> +	unsigned long num;		/* NB: Watchdog numbers are 1-based */
> +};
> +#define wd_to_pseries_wdt(ptr)	container_of(ptr, struct pseries_wdt, wd)

Given that it already calls watchdog_set_drvdata() in pseries_wdt_probe(), it
doesn't need the container_of() to get the struct pseries_wdt.

> +static int pseries_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct pseries_wdt *pw = wd_to_pseries_wdt(wdd);

Use watchdog_get_drvdata().

> +	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
> +	if (rc != H_SUCCESS) {
> +		pr_crit("H_WATCHDOG: %ld: failed to start timer %lu",
> +			rc, pw->num);

If it really needs to print something, save &pdev->dev in struct pseries_wdt
in pseries_wdt_probe() and use dev_err() here.

> +		return -EIO;	/* XXX What is the right errno here? */

I think it is fine as long as the errno makes sense for the context.  Watchdog
framework doesn't propagate the errno[1].

[1]: https://elixir.bootlin.com/linux/v5.18-rc2/source/drivers/watchdog/watchdog_core.c#L166

> +static int pseries_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct pseries_wdt *pw = wd_to_pseries_wdt(wdd);

Use watchdog_get_drvdata().

> +	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
> +	if (rc != H_SUCCESS) {
> +		pr_crit("H_WATCHDOG: %ld: failed to stop timer %lu",
> +			rc, pw->num);

Ditto.

> +static int pseries_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pseries_wdt *pw;
> +	int err = 0;

The initialization is pointless.  `err` is going to be overriden soon.

> +	pw = devm_kzalloc(dev, sizeof *pw, GFP_KERNEL);
> +	if (pw == NULL)

To be concise, use !pw.

> +	/* XXX Is it appropriate to call devm_kfree() on registration error? */
> +	err = devm_watchdog_register_device(dev, &pw->wd);
> +	if (err) {
> +		devm_kfree(dev, pw);

No.  devm_* delegate the responsibility to device.  It doesn't need to call
devm_kfree().

> +	/*
> +	 * XXX Should we print something to the console about the new
> +	 * pseudo-device?  If so, what?
> +	 */
> +	pr_info("watchdog%d probed\n", pw->wd.id);

Up to it.  Use dev_info() or dev_dbg() here if it really needs to print
something.

> +static int pseries_wdt_remove(struct platform_device *pdev)
> +{
> +	struct pseries_wdt *pw = platform_get_drvdata(pdev);
> +
> +	/* XXX Should we say something about removing the pseudo-device? */
> +	pr_info("watchdog%d removed\n", pw->wd.id);

Ditto.

> +	/*
> +	 * XXX Calling watchdog_unregister_device() here causes the kernel
> +	 * to panic later.  What is the proper way to clean up a watchdog
> +	 * device at module unload time?
> +	 */
> +#if 0
> +	watchdog_unregister_device(&pw->wd);
> +#endif

It doesn't need to call watchdog_unregister_device().  The life cycle is
already delegated to the device if it calls devm_watchdog_register_device().

> +static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct pseries_wdt *w;
> +
> +	w = platform_get_drvdata(pdev);

To be concise, inline the assignment.  I.e.
struct pseries_wdt *w = platform_get_drvdata(pdev);

> +	return pseries_wdt_stop(&w->wd);

Taking other watchdog drivers as examples[2][3], doesn't it need to check by
watchdog_active()?

[2]: https://elixir.bootlin.com/linux/v5.18-rc2/source/drivers/watchdog/mtk_wdt.c#L399
[3]: https://elixir.bootlin.com/linux/v5.18-rc2/source/drivers/watchdog/imx_sc_wdt.c#L220

> +static int pseries_wdt_resume(struct platform_device *pdev)
> +{
> +	struct pseries_wdt *w;
> +
> +	w = platform_get_drvdata(pdev);

Ditto.

> +	return pseries_wdt_start(&w->wd);

Share the same concern for pseries_wdt_suspend().

> +static struct platform_driver pseries_wdt_driver = {
> +	.probe = pseries_wdt_probe,
> +	.remove	= pseries_wdt_remove,
> +	.suspend = pseries_wdt_suspend,
> +	.resume = pseries_wdt_resume,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.owner = THIS_MODULE,
> +	},
> +};

Taking other watchdog drivers as examples[4][5], their .suspend and .resume ops
bound to the struct device_driver instead of struct platform_driver.

I have no idea what could be the difference.  Maybe others on the mailing list
could help to answer.

[4]: https://elixir.bootlin.com/linux/v5.18-rc2/source/drivers/watchdog/mtk_wdt.c#L437
[5]: https://elixir.bootlin.com/linux/v5.18-rc2/source/drivers/watchdog/imx_sc_wdt.c#L250

> +static int __init pseries_wdt_init_module(void)
> +{
> +	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	unsigned long cap;
> +	long rc;
> +	int err;
> +
> +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> +	if (rc != H_SUCCESS) {
> +		if (rc == H_FUNCTION) {
> +			pr_info("hypervisor does not support H_WATCHDOG");
> +			return -ENODEV;
> +		}
> +		pr_err("H_WATCHDOG: %ld: capability query failed", rc);
> +		return -EIO;
> +	}
> +	cap = ret[0];
> +	min_timeout = roundup(PSERIES_WDTQ_MIN_TIMEOUT(cap), 1000) / 1000;
> +	pr_info("hypervisor supports %lu timer(s), %lums minimum timeout",
> +		PSERIES_WDTQ_MAX_NUMBER(cap), PSERIES_WDTQ_MIN_TIMEOUT(cap));

Could these bits be in pseries_wdt_probe()?

> +
> +	err = platform_driver_register(&pseries_wdt_driver);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * For the moment we only expose the first timer to userspace.
> +	 * In the future we could expose more.
> +	 */
> +	pseries_wdt_pdev = platform_device_register_simple(DRV_NAME,
> +							   -1, NULL, 0);
> +	if (IS_ERR(pseries_wdt_pdev)) {
> +		platform_driver_unregister(&pseries_wdt_driver);
> +		return PTR_ERR(pseries_wdt_pdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit pseries_wdt_cleanup_module(void)
> +{
> +	platform_device_unregister(pseries_wdt_pdev);
> +	platform_driver_unregister(&pseries_wdt_driver);
> +}
> +
> +module_init(pseries_wdt_init_module);
> +module_exit(pseries_wdt_cleanup_module);

If the plpar_hcall() check and `min_timeout` initialzation could be in
pseries_wdt_probe(), the whole blocks can be replaced by
module_platform_driver().
