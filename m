Return-Path: <linux-watchdog+bounces-3092-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A6A5E542
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 21:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D3D37AF3F5
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 20:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1271EB191;
	Wed, 12 Mar 2025 20:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwW7OVW3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE73D81;
	Wed, 12 Mar 2025 20:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741810899; cv=none; b=HvsLjZL7W1HqgKwNZgV0PFO5H+7mQ21t7yFlIbqjy/7bI42fTcgwGoCoM3bsKU63Qbagnc/yMRTnbRrgHmpR+Q6unD1r649SYS0w8M1AgmW6Ga7nCl02ie7qIKhbI65v4+hDpvhlykCg9UW1dj5gkUF6ds2cfri5+FOTFCF6CKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741810899; c=relaxed/simple;
	bh=eZn3M9mlWfZG7ziWvPoqQ68DoQzsS5rAy2tHFPgSILA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI5xipinBEKOAnlTtRzAvpMgIiZUDTep/7FuXeZsAOMXf0TVl2GHXwx+FQ9HtzR+7w7Eo+ok6iOZ0+6GqAy3GCBQOQ6/EUKytGdHj7quuRl3n3p5gw9Se6ypdLOTMJS7wBMvCg/qky21RxlZee4Hxn8xK/5JkZp2PCHmLL8Qrc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwW7OVW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86521C4CEDD;
	Wed, 12 Mar 2025 20:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741810898;
	bh=eZn3M9mlWfZG7ziWvPoqQ68DoQzsS5rAy2tHFPgSILA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwW7OVW36sV8XQpcekGwjWUAKZLABPhGuMylzhTZiktBd3awgZ8au4CoUwbL4uSeh
	 877BnH6qV+pN6RN6/86qYDdHcnDBMWCyNnzejm4Kw3wUmVY/M2BUmxwP8LRzLATHJO
	 Y+bD5YmoJc6/EdLNIq3s73S3xeGTdKq8ujVFjOUqJ2OIQGHxJC0MfIaxMU6w7w9MqU
	 1KAMC7c7VCOI23sJ54sOfcYN/iEqOGfFwKFdPkuQHF3cmPWynJzZj7GS3TpWfTvZuF
	 EnRmUWGp+LZAD1W2d/7xLQramMsP23g4Kqa2CCMqlCSzKCnA25vwN4tjElVTw3/ssh
	 VFuKlz/yTi6Hg==
Date: Wed, 12 Mar 2025 21:21:32 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: patrick@stwcx.xyz, andrew@codeconstruct.com.au, linux@roeck-us.net,
	wim@linux-watchdog.org, joel@jms.id.au,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Peter.Yin@quantatw.com,
	Patrick_NC_Lin@wiwynn.com, BMC-SW@aspeedtech.com,
	chnguyen@amperecomputing.com, aaron_lee@aspeedtech.com
Subject: Re: [PATCH v7 1/1] watchdog: aspeed: Update bootstatus handling
Message-ID: <20250312202132.GA1072616@ax162>
References: <20250113093737.845097-1-chin-ting_kuo@aspeedtech.com>
 <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>

On Mon, Jan 13, 2025 at 05:37:37PM +0800, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> The bootstatus can be,
> WDIOF_CARDRESET => System is reset due to WDT timeout occurs.
> Others          => Other reset events, e.g., power on reset.
> 
> On ASPEED platforms, boot status is recorded in the SCU registers.
> - AST2400: Only a bit is used to represent system reset triggered by
>            any WDT controller.
> - AST2500/AST2600: System reset triggered by different WDT controllers
>                    can be distinguished by different SCU bits.
> 
> Besides, on AST2400 and AST2500, since alternating boot event is
> also triggered by using WDT timeout mechanism, it is classified
> as WDIOF_CARDRESET.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 81 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
...
> +static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
> +					 struct aspeed_wdt *wdt)
> +{
> +	const struct resource *res;
> +	struct aspeed_wdt_scu scu = wdt->cfg->scu;
> +	struct regmap *scu_base;
> +	u32 reset_mask_width;
> +	u32 reset_mask_shift;
> +	u32 idx = 0;
> +	u32 status;
> +	int ret;
> +
> +	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);

This division breaks the build when CONFIG_ARM_LPAE is enabled, which
selects CONFIG_PHYS_ADDR_T_64BIT, turning resource_size_t into a 64-bit
type.

$ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- mrproper multi_v7_lpae_defconfig all
arm-linux-gnueabi-ld: drivers/watchdog/aspeed_wdt.o: in function `aspeed_wdt_update_bootstatus':
drivers/watchdog/aspeed_wdt.c:257:(.text+0x80c): undefined reference to `__aeabi_uldivmod'

> +	}
> +
> +	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
> +	if (IS_ERR(scu_base)) {
> +		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
> +		return;
> +	}
> +
> +	ret = regmap_read(scu_base, scu.reset_status_reg, &status);
> +	if (ret) {
> +		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
> +		return;
> +	}
> +
> +	reset_mask_width = hweight32(scu.wdt_reset_mask);
> +	reset_mask_shift = scu.wdt_reset_mask_shift +
> +			   reset_mask_width * idx;
> +
> +	if (status & (scu.wdt_reset_mask << reset_mask_shift))
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	/* clear wdt reset event flag */
> +	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt") ||
> +	    of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-wdt")) {
> +		ret = regmap_read(scu_base, scu.reset_status_reg, &status);
> +		if (!ret) {
> +			status &= ~(scu.wdt_reset_mask << reset_mask_shift);
> +			regmap_write(scu_base, scu.reset_status_reg, status);
> +		}
> +	} else {
> +		regmap_write(scu_base, scu.reset_status_reg,
> +			     scu.wdt_reset_mask << reset_mask_shift);
> +	}
> +}
> +

Cheers,
Nathan

