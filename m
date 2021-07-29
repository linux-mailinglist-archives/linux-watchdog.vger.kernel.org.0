Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5853D9C81
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 06:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhG2ELp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 00:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhG2ELo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 00:11:44 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE0BC061757;
        Wed, 28 Jul 2021 21:11:42 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id db14so2754304qvb.10;
        Wed, 28 Jul 2021 21:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q8JBpoKSfbLacvzxaTYuxQ2AtE8oD+E1IhRPRzmyjQg=;
        b=OfpIDmY6KjUEXKbk7Inhi7tTE5AQNd8M1sOVz04Igb09neupo+g8+OKBfhUEL1HBEm
         BI3HVFnavj6wg8Oc1/HAF3qh1FAxtIThs/l/1giOod40+BExY1c8JeJ2+bD/Psv9JXgc
         y85swkoAL/WI0Pfvfp013iAZsxIAoB3FBWZb17kqHiuSskl5U/fphXIu5Q1lzRwhzmat
         6WAX+R1ssELV/TVZf5eKMMWaLDAt+T/aCxzu+BkGx+MRzmEG/rtqX5HH9KOaeEZNfD3d
         1eVfjYrGkhTM+TJgEb3MsJd38dq9v3cnVS/GyLMPWhQP2chskuxwQx/T3u6hXaeL+r9T
         0hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=q8JBpoKSfbLacvzxaTYuxQ2AtE8oD+E1IhRPRzmyjQg=;
        b=N9FzL3du9VPEtkRuOuf+cE5cFUGl8i1RjD4FKhzHaSnRxK041lc0sGvjimp25gngLx
         tIbGjAHObovDqm+LnYwjYVtlEm9iM6nZnKU4sa5jQSlaQV/qXH/LrqdlxXcn6QA1HLOK
         6ktZFwo8A7S5bH5qTaBbVH0a6n3d9W6PGCBZke1MZWItfmApQ3VzrPRZkuynhDH0Aced
         Khr779CEGqjDRCwI2HrJBM6uyr01zhcPPECbZJDxXzdzNIOInJWTYIzHGg8u+dyqKmTE
         S3QJDLb2p04IcMoIMtzGoldXu0nWMtegZkWORKkMmbRaf8/zTqWZKYZblcYiUQjAF6iD
         JNNQ==
X-Gm-Message-State: AOAM5335iJ9oC3TVVHMSKgNW8NzY1nQVIQiejJDoKOUlD1s6tuZjbSox
        UxXznM1mtnsCgyQGKNy73SE=
X-Google-Smtp-Source: ABdhPJxwXJQznnVcZqVOqWAW8ZRCftuan1E7Lu26Gn6FYDcR/Vrz/fyk0FdlftS3v5jU4kB3Mz84cQ==
X-Received: by 2002:a0c:be8e:: with SMTP id n14mr903013qvi.16.1627531901320;
        Wed, 28 Jul 2021 21:11:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h10sm1096331qka.83.2021.07.28.21.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:11:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 28 Jul 2021 21:11:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: sunxi_wdt: Add support for D1
Message-ID: <20210729041139.GA1715506@roeck-us.net>
References: <20210726035143.53132-1-samuel@sholland.org>
 <20210726035143.53132-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726035143.53132-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jul 25, 2021 at 10:51:43PM -0500, Samuel Holland wrote:
> D1 adds a key field to the "CFG" and "MODE" registers, that must be set
> to change the other bits. Add logic to set the key when updating those
> registers.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b50757882a98..6cf82922d3fb 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -48,6 +48,7 @@ struct sunxi_wdt_reg {
>  	u8 wdt_timeout_shift;
>  	u8 wdt_reset_mask;
>  	u8 wdt_reset_val;
> +	u32 wdt_key_val;
>  };
>  
>  struct sunxi_wdt_dev {
> @@ -91,12 +92,14 @@ static int sunxi_wdt_restart(struct watchdog_device *wdt_dev,
>  	val = readl(wdt_base + regs->wdt_cfg);
>  	val &= ~(regs->wdt_reset_mask);
>  	val |= regs->wdt_reset_val;
> +	val |= regs->wdt_key_val;
>  	writel(val, wdt_base + regs->wdt_cfg);
>  
>  	/* Set lowest timeout and enable watchdog */
>  	val = readl(wdt_base + regs->wdt_mode);
>  	val &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
>  	val |= WDT_MODE_EN;
> +	val |= regs->wdt_key_val;
>  	writel(val, wdt_base + regs->wdt_mode);
>  
>  	/*
> @@ -109,6 +112,7 @@ static int sunxi_wdt_restart(struct watchdog_device *wdt_dev,
>  		mdelay(5);
>  		val = readl(wdt_base + regs->wdt_mode);
>  		val |= WDT_MODE_EN;
> +		val |= regs->wdt_key_val;
>  		writel(val, wdt_base + regs->wdt_mode);
>  	}
>  	return 0;
> @@ -141,6 +145,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	reg = readl(wdt_base + regs->wdt_mode);
>  	reg &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
>  	reg |= wdt_timeout_map[timeout] << regs->wdt_timeout_shift;
> +	reg |= regs->wdt_key_val;
>  	writel(reg, wdt_base + regs->wdt_mode);
>  
>  	sunxi_wdt_ping(wdt_dev);
> @@ -154,7 +159,7 @@ static int sunxi_wdt_stop(struct watchdog_device *wdt_dev)
>  	void __iomem *wdt_base = sunxi_wdt->wdt_base;
>  	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
>  
> -	writel(0, wdt_base + regs->wdt_mode);
> +	writel(regs->wdt_key_val, wdt_base + regs->wdt_mode);
>  
>  	return 0;
>  }
> @@ -176,11 +181,13 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
>  	reg = readl(wdt_base + regs->wdt_cfg);
>  	reg &= ~(regs->wdt_reset_mask);
>  	reg |= regs->wdt_reset_val;
> +	reg |= regs->wdt_key_val;
>  	writel(reg, wdt_base + regs->wdt_cfg);
>  
>  	/* Enable watchdog */
>  	reg = readl(wdt_base + regs->wdt_mode);
>  	reg |= WDT_MODE_EN;
> +	reg |= regs->wdt_key_val;
>  	writel(reg, wdt_base + regs->wdt_mode);
>  
>  	return 0;
> @@ -220,9 +227,20 @@ static const struct sunxi_wdt_reg sun6i_wdt_reg = {
>  	.wdt_reset_val = 0x01,
>  };
>  
> +static const struct sunxi_wdt_reg sun20i_wdt_reg = {
> +	.wdt_ctrl = 0x10,
> +	.wdt_cfg = 0x14,
> +	.wdt_mode = 0x18,
> +	.wdt_timeout_shift = 4,
> +	.wdt_reset_mask = 0x03,
> +	.wdt_reset_val = 0x01,
> +	.wdt_key_val = 0x16aa0000,
> +};
> +
>  static const struct of_device_id sunxi_wdt_dt_ids[] = {
>  	{ .compatible = "allwinner,sun4i-a10-wdt", .data = &sun4i_wdt_reg },
>  	{ .compatible = "allwinner,sun6i-a31-wdt", .data = &sun6i_wdt_reg },
> +	{ .compatible = "allwinner,sun20i-d1-wdt", .data = &sun20i_wdt_reg },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_wdt_dt_ids);
