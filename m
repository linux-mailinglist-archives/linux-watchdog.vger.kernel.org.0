Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F33145477D
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237694AbhKQNi4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237743AbhKQNiz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:38:55 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC65C061766;
        Wed, 17 Nov 2021 05:35:57 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id be32so6373912oib.11;
        Wed, 17 Nov 2021 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+KIhBpKy+ZAs3YvI01VslPu7bBqqo6rdA+j0zo6Ma3Q=;
        b=iA3hbga31ZKBibwtukuicP8J87seYFFHkr5nN0esWN7Em1f6lh/YATNGFPWTVyxBMI
         lISGYAlr5zSACn8aijsTM10VfOnsVq7JHxUZiZw8EOjYl3/GqnGejMenuLzSZs6Wdy09
         Wf/k93TFY2ZDg6B7VE/xuhcTzcI15S0iT5DjFPx8Bo/YIFTJbZBKAfFpOUnWfuMt3V9p
         b86AimlhQhQrzPzhGmZBeyS+Wd1VAAgkBaT6+NtDr5H69x4+CArpNFLgIFRX/Fyzcny0
         p1MQqfW349DvtaKN2tAKMlUHz4KxVvtRxw2TGKOrHHxJZtQ8QmwgK+g8l/jRYzI8/iAp
         wL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+KIhBpKy+ZAs3YvI01VslPu7bBqqo6rdA+j0zo6Ma3Q=;
        b=Z51MNFgeyAWsbGnvi8WEoZg/xksztnMBaS+FSZm2OPds/MrFY7CbCZBgJgVFTLrwhs
         R7FKxTJFlq1rpgYgst7gEA6LMhRXEawrYdptfY8VeCdGyGItM4ixAByBN0gitZNBOjv+
         WT4/i/u22Q6sCce26Fc803BNv98C5vd3L4F6ceyd1tjsCqVdnE658JStfdpCl/CO21g1
         MXJYUDUm1nFEcqjuE/VfUSJ5+PJcj/QZN80k9kUmUM4PDhAMD9fLD7YSlys5K4d6yoTX
         kR8ZfSUnbBXZ/dqRq1plkPmVpedYeWMw34eyH7zhAfRarvI9/Ny+oTPbUyO77AmUdDyD
         LiOA==
X-Gm-Message-State: AOAM533N3HqSGcsY0F0h+akcCZM7Q7Gb9nWMk4VfiLBpt/wJqI+ExH8B
        7b1AVocGS8WMZxM7nt7Nfc4=
X-Google-Smtp-Source: ABdhPJyq+lX2+G9KEgJwfFa1sOmKxo+cYRDraK087q0YInqicjNa7D+z0kNr47zlQORI//z2Y1V2vg==
X-Received: by 2002:a05:6808:120a:: with SMTP id a10mr61748278oil.156.1637156156545;
        Wed, 17 Nov 2021 05:35:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l27sm1149741ota.26.2021.11.17.05.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:35:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:35:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 07/12] watchdog: s3c2410: Implement a way to invert
 mask reg value
Message-ID: <20211117133551.GG2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-8-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-8-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:38PM +0200, Sam Protsenko wrote:
> On new Exynos chips (like Exynos850) the MASK_WDT_RESET_REQUEST register
> is replaced with CLUSTERx_NONCPU_INT_EN, and its mask bit value meaning
> was reversed: for new register the bit value "1" means "Interrupt
> enabled", while for MASK_WDT_RESET_REQUEST register "1" means "Mask the
> interrupt" (i.e. "Interrupt disabled").
> 
> Introduce "mask_reset_inv" boolean field in driver data structure; when
> that field is "true", mask register handling function will invert the
> value before setting it to the register.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 4ac0a30e835e..2a61b6ea5602 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -92,6 +92,7 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
>   * timer reset functionality.
>   * @mask_reset_reg: Offset in pmureg for the register that masks the watchdog
>   * timer reset functionality.
> + * @mask_reset_inv: If set, mask_reset_reg value will have inverted meaning.
>   * @mask_bit: Bit number for the watchdog timer in the disable register and the
>   * mask reset register.
>   * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
> @@ -103,6 +104,7 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
>  struct s3c2410_wdt_variant {
>  	int disable_reg;
>  	int mask_reset_reg;
> +	bool mask_reset_inv;
>  	int mask_bit;
>  	int rst_stat_reg;
>  	int rst_stat_bit;
> @@ -219,7 +221,8 @@ static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
>  static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
>  {
>  	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
> -	const u32 val = mask ? mask_val : 0;
> +	const bool val_inv = wdt->drv_data->mask_reset_inv;
> +	const u32 val = (mask ^ val_inv) ? mask_val : 0;
>  	int ret;
>  
>  	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
> -- 
> 2.30.2
> 
