Return-Path: <linux-watchdog+bounces-4767-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B738ECFEC44
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 17:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF8713155E4A
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD8A38E125;
	Wed,  7 Jan 2026 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyGN+sHp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1938E10F;
	Wed,  7 Jan 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800784; cv=none; b=M6ymuwbK7ullSh/QN2MLe17Fi8/2jSUffLSNfs8ngnGt2F8wBZg5dtv2pylV3ptIKZ7kTuDMbCEcEIN2LHhdXfwwWnnhNZlrFMU7v8CtXg7SzF6rAK3VUEME/omNlEdG02HWIWt3lYvP/zGHxo7Uo24CwSDwl9aZOJbfbHAQQ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800784; c=relaxed/simple;
	bh=8wdUCNJatHyfAYeD8UVlkIkMO60J2rFkEA2xK/Lz7ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWCRNBkz/k7ZgChprKfDewxz+lkwcSGjgOXK3CWT2hcgwl9EyW1LmXsKr1kGZpy/JWSCHGX0auQjyn+JxeuYQ/F1iQnsR9+M7RF/FArSlkbAKA4fOvFdPVGN7+fjJDCHSKPbkOTJbNwaPMQKeJ6r2pxPwPkHHS+QjA1UoVUX43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyGN+sHp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91912C4CEF1;
	Wed,  7 Jan 2026 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767800782;
	bh=8wdUCNJatHyfAYeD8UVlkIkMO60J2rFkEA2xK/Lz7ug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jyGN+sHplI8A2IL1DbjvgggmKgWe8nq+HlLmCcifk29QZPIsV2C2t+f89HhtyxJwH
	 OyEb03xy5OQ1J0mPUSEhv+KSW5elAcQCDQS6O5RCj2FKslQU0AzsMVrvd7AwDX1DeI
	 lGBodHRqPRTtI1YV6Cs8oteOfrRQ2bTxZBcY5Mjz8E/okCIa0aR4Nfsf0LzvFB/isv
	 V1pk43HPJmD3rC4sr6uehXCPOgu1zWSC7586Gcn2G1DaZyTL9U82bdGSzIf6dDec3l
	 ONoIQWm/1cjV6cMpPIZqQHP9Xt4TewLSa1F2noEacX0RE2wW23jklG4eAREkIY2w3o
	 f2l2BhXqaLzZw==
Message-ID: <f6499c9a-4ec8-4c9e-b9b5-e679e0f913a4@kernel.org>
Date: Wed, 7 Jan 2026 16:46:18 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: atcwdt200: Add driver for Andes ATCWDT200
To: CL Wang <cl634@andestech.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, tim609@andestech.com
References: <20260107145058.213334-1-cl634@andestech.com>
 <20260107145058.213334-3-cl634@andestech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260107145058.213334-3-cl634@andestech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2026 15:50, CL Wang wrote:
> +
> +static int atcwdt_enable_clk(struct atcwdt_drv *drv_data)
> +{
> +	struct device *dev = drv_data->wdt_dev.parent;
> +	unsigned int val;
> +	int ret;
> +
> +	drv_data->clk = devm_clk_get(dev, NULL);

Just use API for getting enabled clock.

> +	if (IS_ERR(drv_data->clk))
> +		return dev_err_probe(dev, PTR_ERR(drv_data->clk),
> +				     "Failed to get watchdog clock\n");
> +
> +	ret = clk_prepare_enable(drv_data->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to enable clock\n");
> +
> +	drv_data->clk_freq = clk_get_rate(drv_data->clk);
> +	if (!drv_data->clk_freq)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to get clock rate\n");
> +
> +	ret = device_property_read_u32(dev, "andestech,clock-source", &val);

No, read your binding. You said it is a list... list of phandles?

> +	drv_data->clk_src = (!ret && val != 0) ? CTRL_CLK_SEL_PCLK : 0;
> +
> +	return 0;
> +}
> +
> +static int atcwdt_init_wdt_device(struct device *dev,
> +				  struct atcwdt_drv *drv_data)
> +{
> +	struct watchdog_device *wdd = &drv_data->wdt_dev;
> +
> +	wdd->parent = dev;
> +	wdd->info = &atcwdt_info;
> +	wdd->ops = &atcwdt_ops;
> +	wdd->timeout = ATCWDT_TIMEOUT;
> +	wdd->min_timeout = 1;
> +
> +	watchdog_set_nowayout(wdd, nowayout);
> +	watchdog_set_drvdata(wdd, drv_data);
> +
> +	return 0;
> +}
> +
> +static void atcwdt_calc_max_timeout(struct atcwdt_drv *drv_data)
> +{
> +	unsigned char rst_idx = atcwdt_get_index(0xFF, TMR_RST);
> +	unsigned char int_idx = atcwdt_get_index(0xFF,
> +						 drv_data->int_timer_type);
> +
> +	drv_data->wdt_dev.max_timeout =
> +		((1U << rst_idx) + (1U << int_idx)) / drv_data->clk_freq;
> +}
> +
> +static int atcwdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct atcwdt_drv *drv_data;
> +	int ret;
> +
> +	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
> +	if (!drv_data)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, drv_data);
> +	spin_lock_init(&drv_data->lock);
> +
> +	ret = atcwdt_init_wdt_device(dev, drv_data);
> +	if (ret)
> +		return ret;
> +
> +	ret = atcwdt_init_resource(pdev, drv_data);
> +	if (ret)
> +		return ret;
> +
> +	ret = atcwdt_enable_clk(drv_data);
> +	if (ret)
> +		return ret;
> +
> +	ret = atcwdt_get_int_timer_type(drv_data);
> +	if (ret)
> +		goto disable_clk;
> +
> +	atcwdt_calc_max_timeout(drv_data);
> +
> +	ret = devm_watchdog_register_device(dev, &drv_data->wdt_dev);
> +	if (ret)
> +		goto disable_clk;
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(drv_data->clk);
> +
> +	return ret;
> +}
> +
> +static int atcwdt_suspend(struct device *dev)
> +{
> +	struct atcwdt_drv *drv_data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&drv_data->wdt_dev)) {
> +		atcwdt_stop(&drv_data->wdt_dev);
> +		clk_disable_unprepare(drv_data->clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int atcwdt_resume(struct device *dev)
> +{
> +	struct atcwdt_drv *drv_data = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	if (watchdog_active(&drv_data->wdt_dev)) {
> +		ret = clk_prepare_enable(drv_data->clk);
> +		if (ret)
> +			goto clk_prepare_err;

Just return.

> +
> +		atcwdt_start(&drv_data->wdt_dev);
> +		atcwdt_ping(&drv_data->wdt_dev);
> +	}
> +
> +clk_prepare_err:
> +	return ret;
> +}
> +
> +static const struct of_device_id atcwdt_match[] = {
> +	{ .compatible = "andestech,qilai-wdt" },

Drop, not needed.

> +	{ .compatible = "andestech,ae350-wdt" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, atcwdt_match);
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(atcwdt_pm_ops, atcwdt_suspend, atcwdt_resume);
> +
> +static struct platform_driver atcwdt_driver = {
> +	.probe		= atcwdt_probe,
> +	.driver		= {
> +		.name	= DRV_NAME,
> +		.owner	= THIS_MODULE,

From where did you get this?

> +		.of_match_table = atcwdt_match,
> +		.pm = pm_sleep_ptr(&atcwdt_pm_ops),
> +	},
> +};
> +
> +module_platform_driver(atcwdt_driver);
> +
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
> +		 __MODULE_STRING(ATCWDT_TIMEOUT) ")");
> +
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("CL Wang <cl634@andestech.com>");
> +MODULE_DESCRIPTION("Andes ATCWDT200 Watchdog timer driver");


Best regards,
Krzysztof

