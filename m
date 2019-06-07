Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6569439392
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 19:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730621AbfFGRoN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 13:44:13 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44061 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbfFGRoN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 13:44:13 -0400
Received: by mail-pl1-f195.google.com with SMTP id c5so1084563pll.11;
        Fri, 07 Jun 2019 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4E03mAzQfNqc0pPGLByMvSZpXTBKFf+7RsSni1xm2BE=;
        b=FL+wXVuVNwgC9WPZQ+nN8qr6PI1YAbPYOlgpiTVRmbrPxPpCnHWG+xjIm/rZUqh+RN
         Wtgcs9FIJtZ0kOlyNNQL4cBdVPo7JiUz2d7Se3WuGSq+8w0iDNeDP/Tq/32yuMX9B/Ee
         p7Nm1i3df5yhnvgEjT/EQL43SZU1lZg7xCPA00Xmj2Bmbfgfr1hvd+R4iR2gyUDZdsp2
         fmk2tFOsArn/SJFO1upSu+Nsy7q78o5fr/yJyEfM6x7HBKypw6lonFcA4gH5A5GaE+nT
         hNRQPfblpsES42hmgeti+rJty+yS9/zqWcbLQ9YEm2fScTNiZr4FVKqD+R/kVZ3ZMiBI
         yZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=4E03mAzQfNqc0pPGLByMvSZpXTBKFf+7RsSni1xm2BE=;
        b=oDDfuY1xgO6M6F10CqPmA6MbOBVl29f3V4BAZRiOHPrHIoFZy2lx2XI+kqQacULUKZ
         7y99DfGoo4RZFy7tgyjgwTu52eGU4OQ9zmxdkVSWnjPOv1G4SJXvaYL7Q/4tNb8LYwoy
         Qw65jtw9363+NPN9Dq3ZOgUw9MXXiOXDb3DPQ14zjd2YHs1oZvqbhK/BD85YD9X/GEfI
         UbJNnSIZOiaH2iU4OQPeTjAxo0wpIG1To3SJI/rjbtFPVqhUFkEhjwco/JsFa7P5Tisi
         tPbmgDJuOV/taO3cDuQl6tqaXU2ONJUQkSBDPoSAKMJHVNTKLagmwK57IYaCespQ0IKd
         uHKA==
X-Gm-Message-State: APjAAAW+zv5cF4dgk5k8ehAedm0qeu1vit6A1SyN2mL9XMdr3s+OMtso
        PO/phSARNxTrINallZG0qAQ=
X-Google-Smtp-Source: APXvYqxGITnJ8Rl8lNzz7neWI+mEmJs71L5mgwqdzEjWR0p5PAS7nOERdRKOqxB1v94jIc1cv5r4Jg==
X-Received: by 2002:a17:902:a81:: with SMTP id 1mr56630045plp.287.1559929452806;
        Fri, 07 Jun 2019 10:44:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a11sm2816983pff.128.2019.06.07.10.44.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:44:12 -0700 (PDT)
Date:   Fri, 7 Jun 2019 10:44:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: renesas_wdt: Add a few cycles delay
Message-ID: <20190607174411.GA15497@roeck-us.net>
References: <1559711040-29779-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1559711040-29779-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

[Note: I updated the subject to "PATCH v3"]

On Wed, Jun 05, 2019 at 02:04:00PM +0900, Yoshihiro Shimoda wrote:
> According to the hardware manual of R-Car Gen2 and Gen3,
> software should wait a few RLCK cycles as following:
>  - Delay 2 cycles before setting watchdog counter.
>  - Delay 3 cycles before disabling module clock.
> 
> So, this patch adds such delays.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Changes from v2 (https://patchwork.kernel.org/patch/10972721/):
>  - Rename the wait function name.
>  - Rename the variable name in the wait function.
>  - Change variable type.
>  - Add Wolfram-san and Niklas-san's Reviewed-by.
> 
>  Changes from v1 (https://patchwork.kernel.org/patch/10972641/):
>  - Change formula to improve accuracy.
>  - Add Geert-san's Reviewed-by.
> 
>  drivers/watchdog/renesas_wdt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 565dbc1..0cfc0e9 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -7,6 +7,7 @@
>   */
>  #include <linux/bitops.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -70,6 +71,15 @@ static int rwdt_init_timeout(struct watchdog_device *wdev)
>  	return 0;
>  }
>  
> +static void rwdt_wait_cycles(struct rwdt_priv *priv, unsigned int cycles)
> +{
> +	unsigned int delay;
> +
> +	delay = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);
> +
> +	usleep_range(delay, 2 * delay);
> +}
> +
>  static int rwdt_start(struct watchdog_device *wdev)
>  {
>  	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
> @@ -80,6 +90,8 @@ static int rwdt_start(struct watchdog_device *wdev)
>  	/* Stop the timer before we modify any register */
>  	val = readb_relaxed(priv->base + RWTCSRA) & ~RWTCSRA_TME;
>  	rwdt_write(priv, val, RWTCSRA);
> +	/* Delay 2 cycles before setting watchdog counter */
> +	rwdt_wait_cycles(priv, 2);
>  
>  	rwdt_init_timeout(wdev);
>  	rwdt_write(priv, priv->cks, RWTCSRA);
> @@ -98,6 +110,8 @@ static int rwdt_stop(struct watchdog_device *wdev)
>  	struct rwdt_priv *priv = watchdog_get_drvdata(wdev);
>  
>  	rwdt_write(priv, priv->cks, RWTCSRA);
> +	/* Delay 3 cycles before disabling module clock */
> +	rwdt_wait_cycles(priv, 3);
>  	pm_runtime_put(wdev->parent);
>  
>  	return 0;
