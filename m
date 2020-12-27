Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE1C2E3179
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Dec 2020 15:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgL0OL5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 27 Dec 2020 09:11:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgL0OL5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 27 Dec 2020 09:11:57 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3773C061795
        for <linux-watchdog@vger.kernel.org>; Sun, 27 Dec 2020 06:11:16 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id g24so7571545edw.9
        for <linux-watchdog@vger.kernel.org>; Sun, 27 Dec 2020 06:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d8buC2n2HJrCX+cz+sXulp+feTndNkLGIjAwCJwK8WQ=;
        b=cdplkTMbZAS1RVhpArrpmAyxEIETsEqOQbY0f3NG5qgMqHRn9OS79mYQ8MP+YpaSEm
         0AO76J6FRvEzZYk9mOkd3LCmwpDgKilZnz7gMHFf6970afhCXgrfj/4XXqLkvoSAulVd
         2qXC2tLAiPszwM1HJ527jbxJiwrb99vVaTSt00ELeOuRvu2z0XNm8tWiyS6GIFjskPAw
         cQsuPr11qxRMRswHjr9D9VeqrmtXGG4tFXvZM5QI87YDC9txiOn3Ov4/lD5qF0tupV3R
         5KyTESf0FhsmLJ3yZSNABgBIXSU2qS0ZsCZA0rKFMJA5pPIwi2K5tRIcsUr9Cr8LOevK
         fCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d8buC2n2HJrCX+cz+sXulp+feTndNkLGIjAwCJwK8WQ=;
        b=lGodY5iPlhRpZX7RpgUtADaBqXv6nwmgaKHhw0xgTTNQNcAE6KEA2zxoBmBCinsXuh
         tBYrPb+toG5ZI9Exv6VxPpW2YddimKKp1m/Y1u+t59cuaNgKqM2QWdcP4bUR3kiJNOSk
         oBRdLLEm4UM9XeW5ApnS+y25vA8lGQ5XDU9yQBh6vL2ODH4poTCJe7j5rr24rP9GRZyI
         B3GU44AS0mb4VWgZyu7+vqVyEMTVFSJ/BJnp3o0/ktC/ujIMcJu/OmHf+NaukWl3IvUv
         z1svSrbYZqeagpw8v9PBVwRuZg1/7eugUHc/TxCvs1dohdqXgD13jVXRaJ2eoortVHoX
         gVzw==
X-Gm-Message-State: AOAM533UdCnjdCPSP9bmam8apOr9mN+Tv0vO9wcc76f0BPVvGg21KyQe
        EdBa7oxXmUhZshJ25q/f+MoezQ==
X-Google-Smtp-Source: ABdhPJzytDj/MfEqPDN7AY8mOtW9I53pUrkji6gbrhs+L3dA4O4e2nqU+40eSwyijGNwkPfQ+NYT7w==
X-Received: by 2002:a50:e8c4:: with SMTP id l4mr38424386edn.337.1609078275288;
        Sun, 27 Dec 2020 06:11:15 -0800 (PST)
Received: from localhost ([192.36.80.8])
        by smtp.gmail.com with ESMTPSA id s1sm16263485ejx.25.2020.12.27.06.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 06:11:14 -0800 (PST)
Date:   Sun, 27 Dec 2020 15:11:11 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] watchdog: renesas_wdt: don't sleep in atomic context
Message-ID: <X+iV/73xWvFqY57m@wyvern>
References: <20201219173415.21848-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201219173415.21848-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-12-19 18:34:15 +0100, Wolfram Sang wrote:
> In the restart handler, we hit multiple OOPSes. One because of
> usleep_range() and one because of RPM. So, instead of re-using
> rwdt_start(), we implement an atomic version of it in the restart
> handler. As a little bonus, reboot will occur sooner because we can now
> use the smallest divider in the custom restart routine.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> It is problematic to add a Fixes: tag because we would need three of
> them. So, I'd think we add a stable tag and as long as the patch
> applies, all is fine. Other opinions?
> 
>  drivers/watchdog/renesas_wdt.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 47fce4de0110..d2b5074bca65 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -50,6 +51,7 @@ struct rwdt_priv {
>  	struct watchdog_device wdev;
>  	unsigned long clk_rate;
>  	u8 cks;
> +	struct clk *clk;
>  };
>  
>  static void rwdt_write(struct rwdt_priv *priv, u32 val, unsigned int reg)
> @@ -125,13 +127,30 @@ static unsigned int rwdt_get_timeleft(struct watchdog_device *wdev)
>  	return DIV_BY_CLKS_PER_SEC(priv, 65536 - val);
>  }
>  
> +/* needs to be atomic - no RPM, no usleep_range, no scheduling! */
>  static int rwdt_restart(struct watchdog_device *wdev, unsigned long action,
>  			void *data)
>  {
>  	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u8 val;
> +
> +	clk_prepare_enable(priv->clk);
> +
> +	/* Stop the timer before we modify any register */
> +	val = readb_relaxed(priv->base + RWTCSRA) & ~RWTCSRA_TME;
> +	rwdt_write(priv, val, RWTCSRA);
> +	/* Delay 2 cycles before setting watchdog counter */
> +	udelay(DIV_ROUND_UP(2 * 1000000, priv->clk_rate));
>  
> -	rwdt_start(wdev);
>  	rwdt_write(priv, 0xffff, RWTCNT);
> +	/* smallest divider to reboot soon */
> +	rwdt_write(priv, 0, RWTCSRA);
> +
> +	readb_poll_timeout_atomic(priv->base + RWTCSRA, val,
> +				  !(val & RWTCSRA_WRFLG), 1, 100);
> +
> +	rwdt_write(priv, RWTCSRA_TME, RWTCSRA);
> +
>  	return 0;
>  }
>  
> @@ -191,7 +210,6 @@ static int rwdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct rwdt_priv *priv;
> -	struct clk *clk;
>  	unsigned long clks_per_sec;
>  	int ret, i;
>  	u8 csra;
> @@ -207,13 +225,13 @@ static int rwdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -	clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
>  
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
> -	priv->clk_rate = clk_get_rate(clk);
> +	priv->clk_rate = clk_get_rate(priv->clk);
>  	csra = readb_relaxed(priv->base + RWTCSRA);
>  	priv->wdev.bootstatus = csra & RWTCSRA_WOVF ? WDIOF_CARDRESET : 0;
>  	pm_runtime_put(dev);
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
