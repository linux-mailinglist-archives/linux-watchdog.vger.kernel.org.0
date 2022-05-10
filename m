Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5579520B52
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 May 2022 04:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbiEJCji (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 22:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbiEJCjg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 22:39:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C158E11
        for <linux-watchdog@vger.kernel.org>; Mon,  9 May 2022 19:35:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC4C36162D
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 02:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7659DC385C2;
        Tue, 10 May 2022 02:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652150138;
        bh=wpVf/RsE4IJxZ9fqkIMKoDFsQM186Oa2ZnLuO2Xaxpg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qXHZPcI+QAdJMaWY1QgQZuZhvXUmpxRX7RQC3QH5mfC8SRlnMHiyzM9ewzjUk+pD2
         qbsH1BRMfetC7pgJc0YtNuCohj6ro5XkYNuFJsjE+NgsQXChRqn0SLhXdGb7YP6cYN
         NZBDpvQm5L4JPesogbAwGPgy1s/+lrt7rs880b3XWlMeuf2j9dcnaLbmsAGek/N+6T
         DGaPwrMmY5RtdX+PAnn9D8Q9Hx+WNyPIEpb//5DsK5xzatJ8KZIoiovXQv5WoW8mim
         p6xCelaIs0ukfVBvRkUcryV2bLGaOy5mYd6zV3F6vptosfD4J65BmZ8EJGd6qt6/j3
         3GiLIsR45sJvg==
Date:   Tue, 10 May 2022 10:35:34 +0800
From:   Tzung-Bi Shih <tzungbi@kernel.org>
To:     Scott Cheloha <cheloha@linux.ibm.com>
Cc:     linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        brking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
Message-ID: <YnnPdv+Hh9UEHMu/@google.com>
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509174357.5448-3-cheloha@linux.ibm.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
> +#define SETFIELD(_v, _b, _e)	\
> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
> +#define GETFIELD(_v, _b, _e)	\
> +    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))

From `./scripts/checkpatch.pl --strict`:
WARNING: please, no spaces at the start of a line

> +#define PSERIES_WDTQL_MUST_STOP       	1

From `./scripts/checkpatch.pl --strict`:
WARNING: please, no space before tabs

> +static const struct kernel_param_ops action_ops = { .set = action_set };
> +module_param_cb(action, &action_ops, NULL, S_IRUGO);

From `./scripts/checkpatch.pl --strict`:
WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
octal permissions '0444'.

> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: \"hard-poweroff\", \"hard-restart\", or \"dump-restart\" (default=\"hard-restart\")");

The line exceeds 100 columns.

> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, S_IRUGO);

From `./scripts/checkpatch.pl --strict`:
WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
octal permissions '0444'.

> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");

From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.

> +#define WATCHDOG_TIMEOUT 60
> +static unsigned int timeout = WATCHDOG_TIMEOUT;
> +module_param(timeout, uint, S_IRUGO);

From `./scripts/checkpatch.pl --strict`:
WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
octal permissions '0444'.

> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");

From `./scripts/checkpatch.pl --strict`, the line exceeds 100 columns.

> +struct pseries_wdt {
> +	struct watchdog_device wd;
> +	unsigned long num;		/* NB: Watchdog numbers are 1-based */

What does NB stand for?  Could it be removed from the comment?

Does `timer_id` or some other equivalent names make more sense for the
variable?

> +static int pseries_wdt_start(struct watchdog_device *wdd)
> +{
[...]
> +	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
> +	if (rc != H_SUCCESS) {
> +		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
> +			 rc, pw->num);
> +	       	return -EIO;

From `./scripts/checkpatch.pl --strict`:
ERROR: code indent should use tabs where possible
WARNING: please, no space before tabs

> +static struct watchdog_info pseries_wdt_info = {
> +	.identity = DRV_NAME,
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT \
> +	    | WDIOF_PRETIMEOUT,

From `./scripts/checkpatch.pl --strict`:
WARNING: Avoid unnecessary line continuations

> +static const struct watchdog_ops pseries_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.ping = pseries_wdt_start,

Does this mean: it needs hard restart for every ping?

> +static int pseries_wdt_probe(struct platform_device *pdev)
> +{
[...]
> +	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
> +	if (rc != H_SUCCESS)
> +		return (rc == H_FUNCTION) ? -ENODEV : -EIO;

The parentheses can be dropped.

> +	pw = devm_kzalloc(&pdev->dev, sizeof *pw, GFP_KERNEL);
> +	if (pw == NULL)

From `./scripts/checkpatch.pl --strict`:
CHECK: Comparison to NULL could be written "!pw"

> +	pw->num = pdev->id + 1;		/* 0-based -> 1-based */

Didn't see where the platform device was registered but using the pdev->id as
the timer id could be unreliable (e.g. from auto increment).
