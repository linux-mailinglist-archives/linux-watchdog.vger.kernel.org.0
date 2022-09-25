Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4840C5E93B4
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Sep 2022 16:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbiIYOmp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Sep 2022 10:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbiIYOmU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Sep 2022 10:42:20 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26202E9E3;
        Sun, 25 Sep 2022 07:41:48 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id u69so4471359pgd.2;
        Sun, 25 Sep 2022 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=LAzI9tMtgmpX2D5jv8c+9WU57Tw/1NaHeJrErv3w++w=;
        b=iMFJrMANr4xZJHrVIjAwsz4nfVRFdWHoGgeFbuGhMK5GBNN7dEM0KXy7lBkGdTnQzM
         09Fw1qv74R5n2cDGfVHCYay/ypn+/edc4YYXRphJZt4Zp2QkD/FtaLbesEpn02X1wqSD
         3t7DO4dO1RtZ8Xt661CLUaX3CDmtHOGb/m8uS1S+7Fro4ZTfAtZS0QH9U2hHJjzZMjPy
         2pgULlIK5vh/H7n9cq2TwszdnT2PzAlm3KrVMuN8UpxcuMlo5mOdYzEqVW84OURCQTeh
         iiRHdM74zQCeDr2NMddFGHNlUmPZmpOiI4gYBdXyf9YxM8aR5mqtYPjvXxERm3IM7Opx
         Ko/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LAzI9tMtgmpX2D5jv8c+9WU57Tw/1NaHeJrErv3w++w=;
        b=AUEyJeme1jAvTdOtdt1CXHe0S2YTd8bgqsPEZEEtR6jLeFisIMV9aEm4nQugS8aFc1
         /Re2LuCQR/Pl/V4k64Q1zfpriZ0KtHwIj3ekCSbZbSVMWZeOeKD9XPrbcj2Y94C7cRja
         VDrCKzn8Fx7TI6F8opNnsOkweY44EscUmArXFdtzTp7DbIm/hAW6IqUqXujpIgMmVarg
         9aSs6h+aNevAOs7NzIrt8gc+VVeBG77o14VEy8Jr6ebVliz64orzBoWh8ozLkHiu/U10
         TIrFqpIvTJMHG9QH+tUC6DPd5E660yJQYXc137dPfgyvzEKBwugnvyH3JWm6Ewtj1guk
         G49g==
X-Gm-Message-State: ACrzQf1MfUrtz7G/XE9k4lJeWV/pVWpN0ASAKgqneGtVHy1w+dNboi/2
        ZqqrWYRqlWhs9PX1QUfYj0WE6ycQoS+fmA==
X-Google-Smtp-Source: AMsMyM4d/+sFWw2FoUr5jL1Q0zKjEb9H5TE0VcpcinORITOnjVqeKdvcRsWJoBJhc9J+R2kqP2P50g==
X-Received: by 2002:a05:6a00:3:b0:53e:5edd:116a with SMTP id h3-20020a056a00000300b0053e5edd116amr19220767pfk.7.1664116907619;
        Sun, 25 Sep 2022 07:41:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001745662d568sm9357271plx.278.2022.09.25.07.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 07:41:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Sep 2022 07:41:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Message-ID: <20220925144145.GA1753542@roeck-us.net>
References: <20220823093233.8577-1-phil.edworthy@renesas.com>
 <20220823093233.8577-3-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823093233.8577-3-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 23, 2022 at 10:32:33AM +0100, Phil Edworthy wrote:
> The WDT on RZ/V2M devices is basically the same as RZ/G2L, but without
> the parity error registers. This means the driver has to reset the
> hardware plus set the minimum timeout in order to do a restart and has
> a single interrupt.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v4:
>  - Fix enum names from I2C_* to WDT_*
>  - Change cast from of_device_get_match_data() to avoid clang warning
> v3:
>  - Don't call pm_runtime_get_sync() in restart()
>  - Use mdelay instead of udelay, avoids DIV64_U64_ROUND_UP
> v2:
>  - Replace use of parity error registers in restart
>  - Commit msg modified to reflect different contents
> ---
>  drivers/watchdog/rzg2l_wdt.c | 39 ++++++++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 6eea0ee4af49..974a4194a8fd 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -10,7 +10,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> @@ -40,6 +40,11 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +enum rz_wdt_type {
> +	WDT_RZG2L,
> +	WDT_RZV2M,
> +};
> +
>  struct rzg2l_wdt_priv {
>  	void __iomem *base;
>  	struct watchdog_device wdev;
> @@ -48,6 +53,7 @@ struct rzg2l_wdt_priv {
>  	unsigned long delay;
>  	struct clk *pclk;
>  	struct clk *osc_clk;
> +	enum rz_wdt_type devtype;
>  };
>  
>  static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
> @@ -142,11 +148,29 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>  	clk_prepare_enable(priv->pclk);
>  	clk_prepare_enable(priv->osc_clk);
>  
> -	/* Generate Reset (WDTRSTB) Signal on parity error */
> -	rzg2l_wdt_write(priv, 0, PECR);
> +	if (priv->devtype == WDT_RZG2L) {
> +		/* Generate Reset (WDTRSTB) Signal on parity error */
> +		rzg2l_wdt_write(priv, 0, PECR);
> +
> +		/* Force parity error */
> +		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> +	} else {
> +		/* RZ/V2M doesn't have parity error registers */
> +
> +		wdev->timeout = 0;
> +
> +		/* Initialize time out */
> +		rzg2l_wdt_init_timeout(wdev);
>  
> -	/* Force parity error */
> -	rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> +		/* Initialize watchdog counter register */
> +		rzg2l_wdt_write(priv, 0, WDTTIM);
> +
> +		/* Enable watchdog timer*/
> +		rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +
> +		/* Wait 2 consecutive overflow cycles for reset */
> +		mdelay(DIV_ROUND_UP(2 * 0xFFFFF * 1000, priv->osc_clk_rate));
> +	}
>  
>  	return 0;
>  }
> @@ -227,6 +251,8 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to deassert");
>  
> +	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	priv->wdev.info = &rzg2l_wdt_ident;
> @@ -255,7 +281,8 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id rzg2l_wdt_ids[] = {
> -	{ .compatible = "renesas,rzg2l-wdt", },
> +	{ .compatible = "renesas,rzg2l-wdt", .data = (void *)WDT_RZG2L },
> +	{ .compatible = "renesas,rzv2m-wdt", .data = (void *)WDT_RZV2M },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
