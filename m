Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A547E244BA5
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Aug 2020 17:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgHNPJa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Aug 2020 11:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgHNPJ1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Aug 2020 11:09:27 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D930C061384;
        Fri, 14 Aug 2020 08:09:27 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t6so4684300pgq.1;
        Fri, 14 Aug 2020 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O74o2CeF9BmakoAygKNVUbF4kexNvSnVutgrgt6zSA8=;
        b=YbAHF1rrWqufIK2/c1cW1QSxEPyRIRyDc0fmEmL/2o9JfW9T7Fs/UUVR5E2vZmNt66
         M0o2xC88G/u4zQizSg9RXsYwvPiAq+wQfsNFfIM05SrJ1yRp0ujkSFtsyNyrAn2aAZME
         vAPb/g1hNLtrcygBLu96Ew92+69mtppirYzOKO0AoDNxG3rf9GozbXVz8qPYzpA9YRUZ
         IF3/UMJJ24LEUnw2pck+qFfFcGkX+KSb78QASCN72FjkeyBDoXTojIhL6ID9+WPRF6WC
         RJshRyK1iN/9u3CCuGbA63oQi2BonfFaZkagtDd/eFcqG2qtyyOudB5pN2e/aqZDhukQ
         eOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=O74o2CeF9BmakoAygKNVUbF4kexNvSnVutgrgt6zSA8=;
        b=MYmngP55SB+KwDzIcHbS1Nnwm5V+XYKab6x81hB8gVV8mqRCK3bBJlWBB+Ko6m90oA
         Y/nxPezsjjYZKpTWeCN1OXUydo9OUGSWXt8/pZ6TLGd+oFRzJD1fydZPoWRJKxKAE3gK
         h0Hw6o6FuRjpp5TtU6szcCeh64VwzQVvWNuoumesXFK94ZVc+YGdz5V9B7yFTrlxo8Qy
         WI6YYpqYOB0Joopnp0pUvTler30V4godcdKE1y/IcsgMRuH2j7O6AsTXnlts1PuQuNO/
         qoPX9Ymzw304p7+Em6kodsmsr9GxRQ454mxag3Xz1oG3CQLwO++/ubGEbbQQgdokuaPL
         VhNw==
X-Gm-Message-State: AOAM530/6yfhVKuPojdtfhDDohCTlrvPtG1nEmcjM0pWDGnmkalPx3x0
        9OhCR1qgy0mWVGYhcXU0Ou8=
X-Google-Smtp-Source: ABdhPJxtlAfkZ1IM04n+CudW6LpO308CAYJkMzUoIjE1G1o/LkaM+di+OamfGIMNs59QYkvBAX8vag==
X-Received: by 2002:a65:6108:: with SMTP id z8mr2067642pgu.266.1597417766635;
        Fri, 14 Aug 2020 08:09:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i11sm8272957pjv.30.2020.08.14.08.09.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 08:09:25 -0700 (PDT)
Date:   Fri, 14 Aug 2020 08:09:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Message-ID: <20200814150924.GA255699@roeck-us.net>
References: <1596150213-31638-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596150213-31638-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 31, 2020 at 07:03:32AM +0800, Anson Huang wrote:
> According to reference manual, the i.MX7ULP WDOG's operations except
> refresh should follow below sequence:
> 
> 1. disable global interrupts;
> 2. unlock the wdog and wait unlock bit set;
> 3. reconfigure the wdog and wait for reconfiguration bit set;
> 4. enabel global interrupts.
> 
> Strictly follow the recommended sequence can make it more robust.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> changes since V3:
> 	- wdog timeout should NOT update when setting timeout register failed.
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 74 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 61 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 7993c8c..badfc0b 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -36,6 +37,7 @@
>  #define DEFAULT_TIMEOUT	60
>  #define MAX_TIMEOUT	128
>  #define WDOG_CLOCK_RATE	1000
> +#define WDOG_WAIT_TIMEOUT	20
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  module_param(nowayout, bool, 0000);
> @@ -48,17 +50,40 @@ struct imx7ulp_wdt_device {
>  	struct clk *clk;
>  };
>  
> -static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
> +static int imx7ulp_wdt_wait(void __iomem *base, u32 mask)
> +{
> +	u32 val = readl(base + WDOG_CS);
> +
> +	if (!(val & mask) && readl_poll_timeout_atomic(base + WDOG_CS, val,
> +						       val & mask, 0,
> +						       WDOG_WAIT_TIMEOUT))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +static int imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
>  {
>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>  
>  	u32 val = readl(wdt->base + WDOG_CS);
> +	int ret;
>  
> +	local_irq_disable();
>  	writel(UNLOCK, wdt->base + WDOG_CNT);
> +	ret = imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
> +	if (ret)
> +		goto enable_out;
>  	if (enable)
>  		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
>  	else
>  		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
> +
> +enable_out:
> +	local_irq_enable();
> +
> +	return ret;
>  }
>  
>  static bool imx7ulp_wdt_is_enabled(void __iomem *base)
> @@ -79,17 +104,12 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
>  
>  static int imx7ulp_wdt_start(struct watchdog_device *wdog)
>  {
> -
> -	imx7ulp_wdt_enable(wdog, true);
> -
> -	return 0;
> +	return imx7ulp_wdt_enable(wdog, true);
>  }
>  
>  static int imx7ulp_wdt_stop(struct watchdog_device *wdog)
>  {
> -	imx7ulp_wdt_enable(wdog, false);
> -
> -	return 0;
> +	return imx7ulp_wdt_enable(wdog, false);
>  }
>  
>  static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
> @@ -97,22 +117,37 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
>  {
>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>  	u32 val = WDOG_CLOCK_RATE * timeout;
> +	int ret;
>  
> +	local_irq_disable();
>  	writel(UNLOCK, wdt->base + WDOG_CNT);
> +	ret = imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
> +	if (ret)
> +		goto timeout_out;
>  	writel(val, wdt->base + WDOG_TOVAL);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
>  
>  	wdog->timeout = timeout;
>  
> -	return 0;
> +timeout_out:
> +	local_irq_enable();
> +
> +	return ret;
>  }
>  
>  static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
>  			       unsigned long action, void *data)
>  {
>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
> +	int ret;
> +
> +	ret = imx7ulp_wdt_enable(wdog, true);
> +	if (ret)
> +		return ret;
>  
> -	imx7ulp_wdt_enable(wdog, true);
> -	imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
> +	ret = imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
> +	if (ret)
> +		return ret;
>  
>  	/* wait for wdog to fire */
>  	while (true)
> @@ -136,19 +171,30 @@ static const struct watchdog_info imx7ulp_wdt_info = {
>  		    WDIOF_MAGICCLOSE,
>  };
>  
> -static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
> +static int imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
>  {
>  	u32 val;
> +	int ret;
>  
> +	local_irq_disable();
>  	/* unlock the wdog for reconfiguration */
>  	writel_relaxed(UNLOCK_SEQ0, base + WDOG_CNT);
>  	writel_relaxed(UNLOCK_SEQ1, base + WDOG_CNT);
> +	ret = imx7ulp_wdt_wait(base, WDOG_CS_ULK);
> +	if (ret)
> +		goto init_out;
>  
>  	/* set an initial timeout value in TOVAL */
>  	writel(timeout, base + WDOG_TOVAL);
>  	/* enable 32bit command sequence and reconfigure */
>  	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
>  	writel(val, base + WDOG_CS);
> +	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
> +
> +init_out:
> +	local_irq_enable();
> +
> +	return ret;
>  }
>  
>  static void imx7ulp_wdt_action(void *data)
> @@ -199,7 +245,9 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(wdog);
>  	watchdog_stop_on_unregister(wdog);
>  	watchdog_set_drvdata(wdog, imx7ulp_wdt);
> -	imx7ulp_wdt_init(imx7ulp_wdt->base, wdog->timeout * WDOG_CLOCK_RATE);
> +	ret = imx7ulp_wdt_init(imx7ulp_wdt->base, wdog->timeout * WDOG_CLOCK_RATE);
> +	if (ret)
> +		return ret;
>  
>  	return devm_watchdog_register_device(dev, wdog);
>  }
