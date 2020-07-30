Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E13E233730
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 18:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbgG3Qwn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 12:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG3Qwn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 12:52:43 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ED0C061574;
        Thu, 30 Jul 2020 09:52:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id lx9so5068149pjb.2;
        Thu, 30 Jul 2020 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qFE0XeJGgllQOqmJMVI/VEoGcArgmrs/KxS99XP28kA=;
        b=akm5AeGjw5OQfVkvkl3ovOIJ3Ucm7aab9/XyZAjBCAeH4ElndsDYoJkNL+HNAMrzTB
         Pq0eyAJvAFKLTWvw1Nzdtr5OZbtNI1VZhRYOXbjF9itGIYyUGiH7FkT8TiiEXbHMGvfI
         BN5FTad39w3ZvOMubzszHdnJNNhRuDvczen4tTcYZY8NNvEMGug5h/y+ahWQ3EO/UsoD
         Uv+QMo+JUNSBIAD8bwYHQjBhJTb/HTzCl31euKxJnjuqljv3MaejJDLXmzkAXlwZdALo
         BkMozn0Gd/ERN1zP5X5aiWc0aVuDnVeQNjpcZ/uabg8myCn/v6/U2nyABD30mVeJ4zgD
         TQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qFE0XeJGgllQOqmJMVI/VEoGcArgmrs/KxS99XP28kA=;
        b=D8RL0EhFkpjn2j2gPnJzepaJhHpK3Gv3rtenVIDggbLJmjTcZ2YyNbkOwxdGCns9FX
         dKLa9ggbV5j8zEK+UQOIXhnT7EC/2/Hg/h8QPjuyki6wMlSRGTg7a7ImNX8LN0tRJwkE
         IiOKZzwW5CgaQNPMeK7kHbFsJteJpIP1y6PvEsvkv5z8MWMQsZMuintsiXxbXZJR5/4G
         3R408jE3Af0D/X/gwW8X8HWpaPJTptwHrHko01ipuSOxYNtoW3bHof/mWKubB9wO84zh
         QqlTbRO3CNkcebrmJO5Rs9EvoXsg86Pen+AyIyIvukaMGdMoDPToeIWwQqJYubs9PoE9
         VC8Q==
X-Gm-Message-State: AOAM5317HIAwmi5fOfK0xw4+dKn5PhJVYBaY7glfdbjXUyvyQc8bZ2jj
        oAOK60ws1ie1fkfjeHRAGRs=
X-Google-Smtp-Source: ABdhPJyuGMv71N2eM+4T6ZLGZkSIN/b1RgnXAa2BWRnck6Kp0YmR7jWlBP0OaLJnHPfOuwqICWnKXw==
X-Received: by 2002:a17:90b:f94:: with SMTP id ft20mr8438223pjb.69.1596127962446;
        Thu, 30 Jul 2020 09:52:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g28sm6689444pfr.70.2020.07.30.09.52.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 09:52:41 -0700 (PDT)
Date:   Thu, 30 Jul 2020 09:52:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V3 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Message-ID: <20200730165240.GA178323@roeck-us.net>
References: <1596074591-4207-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596074591-4207-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 30, 2020 at 10:03:10AM +0800, Anson Huang wrote:
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
> ---
> changes since V2:
> 	- change the wait timeout to 20us according to experiment;
> 	- drop WARN_ON when timeout, and check its return value in each caller for
> 	  unlock wait, no need to handle the return value for reconfiguration.
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 74 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 61 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 7993c8c..010ddd1 100644
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
> +
> +timeout_out:
> +	local_irq_enable();
>  
>  	wdog->timeout = timeout;

This needs to be moved up - the timeout did not get changed on error.

Guenter

>  
> -	return 0;
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
> -- 
> 2.7.4
> 
