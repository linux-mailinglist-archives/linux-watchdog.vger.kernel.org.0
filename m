Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4141013CA0E
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 17:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgAOQyu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jan 2020 11:54:50 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37209 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgAOQyu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jan 2020 11:54:50 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so8788780pfn.4;
        Wed, 15 Jan 2020 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x4biuHfD3qt3U+cEUvYuc5XAFxMv7j6Z3eytJc0II1Y=;
        b=bfCcRraPut1UtBkp6mO1CihzI9YRUJa26KCh/08jw4yRys4sWs3rTpvhwCc0khFiWB
         FugeJ9vEglq+j+DCq8CqhtNd4aQ6TP2MHC+Ry98PnsxCsVEqvZEnzdF3WL6MHnljR7Cm
         IqsnBs5c6gji/PaG1YDRkcdQegf88o2oVToeXYNRH1+VsDdARd/Mg9gcEtOXPbETWMH3
         IFCijkJ1alVo0uIuRjn0m/fLCon1c2Qp61hA4C0Ko314feIUc3/4kkahpcWRDZTGlX+n
         pJLPu4fP682Ex0yntbssl5mcBsqquMLHXsTKEf7t/05grPb7obFOWVM/8j6MEd/aGp8V
         srKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=x4biuHfD3qt3U+cEUvYuc5XAFxMv7j6Z3eytJc0II1Y=;
        b=U/OrJhwyiKdnINdW2Jbxk8sUIZO+tDKgE9dYxxWiSyWn9c5gzGX7ZtkQczv0tzrZ+2
         JHL+0DiVJFDplmD4b+KFd5fGKbTf0O3LIgOs1d4/BSyQ99i3JkIGPGBuqM4j89ZNILXC
         cL7QNS/0c+y20ayaHApU8xgy77Kf7jt3IoB/khgsxA54XvVdjVOKpqdTI+hPRAcCdrg9
         85IzjJAQEfq+6Nj/VfE0pl750pO1t0C+Rbu8xQciRkNNRd2KLkSnqqVZxMp03liZENhq
         u+Tg2sxZvwbhzLp5FcMWY8IJU1MWOud0/Cco+wTdji4/A44XV2HSRywTx7cpLPJF3Dm+
         7mpw==
X-Gm-Message-State: APjAAAUmzneC4pxzdI4Tj5TMWTNvl0JmiiDdWSDFZC+zFD8EF/gEJOrW
        2Ycr/Iu0PhezY6iHvFxwvkiBdFhZ
X-Google-Smtp-Source: APXvYqzFMwW4qCkVOIV4BudBn7rrS0g2rXrBGLq1kfP81ZvGbuGNrwzm/ijmFrgQFGF9MX2DSZxpSg==
X-Received: by 2002:aa7:8749:: with SMTP id g9mr8330925pfo.40.1579107289226;
        Wed, 15 Jan 2020 08:54:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a26sm22658998pfo.27.2020.01.15.08.54.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 08:54:48 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:54:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, contact@stefanchrist.eu,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: da9062: make restart handler atomic safe
Message-ID: <20200115165447.GA13912@roeck-us.net>
References: <20200115162307.7336-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115162307.7336-1-m.felsch@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 15, 2020 at 05:23:07PM +0100, Marco Felsch wrote:
> The restart handler is executed during the shutdown phase which is
> atomic/irq-less. The i2c framework supports atomic transfers since
> commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
> transfers") to address this use case. Using regmap within an atomic
> context is allowed only if the regmap type is MMIO and the cache type
> 'flat' or no cache is used. Using the i2c_smbus_write_byte_data()
> function can be done without additional tests because:
>  1) the DA9062 is an i2c-only device and
>  2) the i2c framework emulates the smbus protocol if the host adapter
>     does not support smbus_xfer by using the master_xfer.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Hi,
> 
> This patch is based on Stefan Lengfeld's RFC Patch [1].
> 
> [1] https://patchwork.ozlabs.org/patch/1085942/
> 
> Changes:
> 
> v2:
> - adapt commit message
> - add comment
> - make use of i2c_smbus_write_byte_data()
> ---
>  drivers/watchdog/da9062_wdt.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index c9b9d6394525..77b6b5336067 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
> +#include <linux/i2c.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
>  #include <linux/mfd/da9062/registers.h>
> @@ -149,12 +150,13 @@ static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  			      void *data)
>  {
>  	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
> +	struct i2c_client *client = to_i2c_client(wdt->hw->dev);
>  	int ret;
>  
> -	ret = regmap_write(wdt->hw->regmap,
> -			   DA9062AA_CONTROL_F,
> -			   DA9062AA_SHUTDOWN_MASK);
> -	if (ret)
> +	/* Don't use regmap because it is not atomic safe */
> +	ret = i2c_smbus_write_byte_data(client, DA9062AA_CONTROL_F,
> +					DA9062AA_SHUTDOWN_MASK);
> +	if (ret < 0)
>  		dev_alert(wdt->hw->dev, "Failed to shutdown (err = %d)\n",
>  			  ret);
>  
> -- 
> 2.20.1
> 
