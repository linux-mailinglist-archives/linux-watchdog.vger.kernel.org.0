Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3192DFF8A
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Dec 2020 19:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgLUSS6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Dec 2020 13:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgLUSS5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Dec 2020 13:18:57 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19455C061248;
        Mon, 21 Dec 2020 10:18:10 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 9so12185497oiq.3;
        Mon, 21 Dec 2020 10:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bjt7t0lHiDb8iNwGakGpRsBr5h+nuMVmrC8IPWSsSh8=;
        b=QZQ6RZhpSFsc51rxiAvqFSG6kWQFjA/OHI+jdyTF2vmOPECGpU39poJD06q7Tz/iWM
         jzGgeVgcwjYug2F7Yqo2yRbj7QwQrxrHK7diwmW8yQi1yKd4jAR0ruP/LoGUzSwFdQvR
         zM0AD29KiSd/IIYyko5ERaa4i8Yk0M3DG7OzCTJIeOPgLtkLr1Icn6aGjuyGCx/xnnou
         FTRJdLqGGtTpz45rXlJJ/qNgBPZuE20IkMSofeWcQsOCk1lAvf82B1eqFce1Vj8tBYb+
         pb30OaAwgfGPABkCSYIQC8pqYfTGzlsMW+o3sW1AxNtcGS1GO/b351VAEZ/pTOonEMTR
         f+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bjt7t0lHiDb8iNwGakGpRsBr5h+nuMVmrC8IPWSsSh8=;
        b=P/et0dE9SolK4Ukk7cepElcefTDZw7LONnYFGhOuEx/ecrQSR74EsK4qH7h5KdcXll
         QArPFHDH7Aigy6ZCcUQr6rd0U48kSTE6HRw/R/Xg6rhkoxZqgH/EIahLQLVVPk7qrF7u
         S4k3JEvvMDgQwwsQj9JqtSkcYVR2EvbMGXfKIxKmcjrNkd5AHle9OIILUqt1RBw0bBbq
         Tna226SmUVSXdXpySpvthmhE5oOfaH1w4y1A6Zr/8NNgNqNW+LcG1GzH1GgtRULy/bCt
         I2cRm4kDna08zUfKs45LeGKiZsT42EsYI1hZA9/IOXKTV/cqBMKCglXMPVqrBDybGhTl
         ixCw==
X-Gm-Message-State: AOAM532In1N/4ep27YrYfZLTL/1xQoqcIrE/t6DpmBBLzAJQLQKaUSNU
        C5ojBHsZnTAUszjzxe6EVmHxL3R7nVY=
X-Google-Smtp-Source: ABdhPJzmgZadZ5X1o8itu+4Nry3pqWgeEu7wTNVqpBeXYOkpVRZRTnwLS6stIZVFT6sW1U1UpLnteQ==
X-Received: by 2002:aca:5204:: with SMTP id g4mr11655218oib.91.1608568022724;
        Mon, 21 Dec 2020 08:27:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a52sm2605992otc.46.2020.12.21.08.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Dec 2020 08:27:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: renesas_wdt: don't sleep in atomic context
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201219173415.21848-1-wsa+renesas@sang-engineering.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <63c0b5ba-fe18-b667-d346-880287061c46@roeck-us.net>
Date:   Mon, 21 Dec 2020 08:27:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201219173415.21848-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/19/20 9:34 AM, Wolfram Sang wrote:
> In the restart handler, we hit multiple OOPSes. One because of
> usleep_range() and one because of RPM. So, instead of re-using
> rwdt_start(), we implement an atomic version of it in the restart
> handler. As a little bonus, reboot will occur sooner because we can now
> use the smallest divider in the custom restart routine.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
> 

