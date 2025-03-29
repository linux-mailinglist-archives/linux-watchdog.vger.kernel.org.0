Return-Path: <linux-watchdog+bounces-3176-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E60A75434
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Mar 2025 05:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F75C16EF00
	for <lists+linux-watchdog@lfdr.de>; Sat, 29 Mar 2025 04:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7C014AA9;
	Sat, 29 Mar 2025 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2E33mOG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE75CEEAA;
	Sat, 29 Mar 2025 04:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743224119; cv=none; b=od+wLTAYMPKzp1XnODEAzz5jdlenURvrjLUT1MN+mte/LZVoreY7bXfOBVkyIWlayPLB9iP88/jTL7JezD1WEIu9tlHvEJNOX/8YbQUXsA+U5dCSvnEeI+xF/lj3KdIB+lKQWD8ra32WvCmN8QA1tvjsen0FY1WlKI3nfE3YdCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743224119; c=relaxed/simple;
	bh=La3ROFlwW/alLy+1Tob0/xhWFSxDSdq3UkrkI8KKB10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHO6dpsu13FWwdcXiruiXy/nkJ+jtjx/JUwMT2X+AucAlXk2s5R9AXsDgxD7jkFgHJwprgXp5fzcfZ4qTyD2ejGOoSwnEhnU/EANc4Ze4bikmFnId7v80JP0Brx7Q/zOehEPo6KIeT3DVg3umukVkTODivVwd+PM3QKam1INdL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2E33mOG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DABC4CEE2;
	Sat, 29 Mar 2025 04:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743224119;
	bh=La3ROFlwW/alLy+1Tob0/xhWFSxDSdq3UkrkI8KKB10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E2E33mOGhJsuleCej5oGhrxU4x7BEEOSkisoErR+/86Nl14gQYtP9t3zUJbaIlNCs
	 UbXD9l1sv2lemNOM5I7I85gLYCEn471ce+q+e2zY+DsQAHWQ3T7y5fuIVV0cPq2lBH
	 7+fCmAAQ7+afIVzx9jBUyf+foODbXoWNhL28KEk62piTOpBfCIq50mjjS8jtq3B5BH
	 wQYklE+ZcbUgU7aXXA0wyOz3Ph2YX0Xn1yAjA0346a2WIwkHPI0UFc8MM/4U/ECnTp
	 w4CO5UdJnREiADeR1sUI7a/9bB5yKhAvhS5PmqoSGMYxOMtWkJEM/9qsdPpiKyFWPE
	 cjrfSqKf2sFPg==
Message-ID: <1873723e-de75-4e9f-b61c-a22f3b85758b@kernel.org>
Date: Sat, 29 Mar 2025 05:55:13 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Add the Software Watchdog Timer for the NXP
 S32 platform
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <20250328151516.2219971-2-daniel.lezcano@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250328151516.2219971-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2025 16:15, Daniel Lezcano wrote:
> +
> +struct s32g_wdt_device {
> +	int rate;
> +	void __iomem *base;
> +	struct watchdog_device wdog;
> +};
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +static unsigned int timeout_param = S32G_WDT_DEFAULT_TIMEOUT;
> +module_param(timeout_param, uint, 0);
> +MODULE_PARM_DESC(timeout_param, "Watchdog timeout in seconds (default="
> +		 __MODULE_STRING(S32G_WDT_DEFAULT_TIMEOUT) ")");

Timeout is provided by DT.

> +
> +static bool early_enable = false;
> +module_param(early_enable, bool, 0);
> +MODULE_PARM_DESC(early_enable,
> +		 "Watchdog is started on module insertion (default=false)");
> +
> +static const struct watchdog_info s32g_wdt_info = {
> +	.identity = "s32g watchdog",
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE |
> +	WDIOC_GETTIMEOUT | WDIOC_GETTIMELEFT,
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +#define S32G_WDT_DEBUG_FS_REGS(__reg)		\
> +{						\
> +	.name = __stringify(__reg),		\
> +	.offset = __reg(0),			\
> +}
> +
> +static const struct debugfs_reg32 wdt_regs[] = {
> +	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_CR),
> +	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_TO),
> +	S32G_WDT_DEBUG_FS_REGS(S32G_SWT_CO),
> +};
> +
> +static void s32g_wdt_debugfs_init(struct device *dev, struct s32g_wdt_device *wdev)
> +{
> +	struct debugfs_regset32 *regset;
> +	static struct dentry *dentry = NULL;
> +
> +	if (!dentry)
> +		dentry = debugfs_create_dir("watchdog", NULL);
> +
> +	dentry = debugfs_create_dir(dev_name(dev), dentry);
> +
> +	regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
> +	if (!regset)
> +		return;
> +
> +	regset->base = wdev->base;
> +	regset->regs = wdt_regs;
> +	regset->nregs = ARRAY_SIZE(wdt_regs);
> +
> +	debugfs_create_regset32("registers", 0400, dentry, regset);
> +}
> +#else
> +static inline void s32g_wdt_debugfs_init(struct device *dev, struct s32g_wdt_device *wdev)
> +{
> +}
> +#endif
> +
> +static struct s32g_wdt_device *wdd_to_s32g_wdt(struct watchdog_device *wdd)
> +{
> +	return container_of(wdd, struct s32g_wdt_device, wdog);
> +}
> +
> +static unsigned int wdog_sec_to_count(struct s32g_wdt_device *wdev, unsigned int timeout)
> +{
> +	return wdev->rate * timeout;
> +}
> +
> +static int s32g_wdt_ping(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +
> +	__raw_writel(S32G_WDT_SEQ1, S32G_SWT_SR(wdev->base));
> +	__raw_writel(S32G_WDT_SEQ2, S32G_SWT_SR(wdev->base));

I am confused why you do not use standard writel or don't have any
barriers here. I think this is very error prone and in general
discouraged practice (was for example raised by Arnd multiple times on
the lists).

> +
> +	return 0;
> +}
> +
> +static int s32g_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
> +	unsigned long val;
> +
> +	val = __raw_readl(S32G_SWT_CR(wdev->base));
> +
> +	val |= S32G_SWT_CR_WEN;
> +
> +	__raw_writel(val, S32G_SWT_CR(wdev->base));
> +
> +	return 0;
> +}
> +

...

> +
> +static int s32g_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct clk *clk;
> +	struct s32g_wdt_device *wdev;
> +	struct watchdog_device *wdog;
> +	int ret;
> +
> +	wdev = devm_kzalloc(dev, sizeof(struct s32g_wdt_device), GFP_KERNEL);

sizeof(*)

> +	if (!wdev)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	wdev->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(wdev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdev->base), "Can not get resource\n");
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "Can't get Watchdog clock\n");
> +
> +	wdev->rate = clk_get_rate(clk);
> +	if (!wdev->rate) {
> +		dev_err(dev, "Input clock rate is not valid\n");
> +		return -EINVAL;
> +	}
> +
> +	wdog = &wdev->wdog;
> +	wdog->info = &s32g_wdt_info;
> +	wdog->ops = &s32g_wdt_ops;
> +
> +	/*
> +	 * The code converts the timeout into a counter a value, if
> +	 * the value is less than 0x100, then it is clamped by the SWT
> +	 * module, so it is safe to specify a zero value as the
> +	 * minimum timeout.
> +	 */
> +	wdog->min_timeout = 0;
> +
> +	/*
> +	 * The counter register is a 32 bits long, so the maximum
> +	 * counter value is UINT_MAX and the timeout in second is the
> +	 * value divided by the rate.
> +	 *
> +	 * For instance, a rate of 51MHz lead to 84 seconds maximum
> +	 * timeout.
> +	 */
> +	wdog->max_timeout = UINT_MAX / wdev->rate;
> +
> +	/*
> +	 * The module param and the DT 'timeout-sec' property will
> +	 * override the default value if they are specified.
> +	 */
> +	ret = watchdog_init_timeout(wdog, timeout_param, dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * As soon as the watchdog is started, there is no way to stop
> +	 * it if the 'nowayout' option is set at boot time
> +	 */
> +	watchdog_set_nowayout(wdog, nowayout);
> +
> +	/*
> +	 * The devm_ version of the watchdog_register_device()
> +	 * function will call watchdog_unregister_device() when the
> +	 * device is removed.
> +	 */
> +	watchdog_stop_on_unregister(wdog);
> +
> +	s32g_wdt_init(wdev);
> +
> +	/*
> +	 * The debugfs will create a directory with the configured
> +	 * watchdogs on the platform and a register file to give some
> +	 * register content.
> +	 */
> +	s32g_wdt_debugfs_init(dev, wdev);
> +
> +	ret = devm_watchdog_register_device(dev, wdog);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register watchdog device\n");
> +
> +	dev_info(dev, "S32G Watchdog Timer Registered. "
> +		 "timeout=%ds, nowayout=%d, early_enable=%d\n",
> +		 wdog->timeout, nowayout, early_enable);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id s32g_wdt_dt_ids[] = {
> +	{ .compatible = "nxp,s32g-wdt" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver s32g_wdt_driver = {
> +	.probe = s32g_wdt_probe,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.owner = THIS_MODULE,

Drop, that's some ancient downstream code.

> +		.of_match_table = s32g_wdt_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(s32g_wdt_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("Watchdog driver for S32G SoC");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRIVER_NAME);

Drop, not needed. Fix your table module device Id instead... or start
from other recent driver as a skeleton to avoid repeating the same
issues we already fixed.

Best regards,
Krzysztof

