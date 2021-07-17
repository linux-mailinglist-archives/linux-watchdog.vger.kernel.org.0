Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589AA3CC3C1
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 Jul 2021 16:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbhGQOLr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 17 Jul 2021 10:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbhGQOLr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 17 Jul 2021 10:11:47 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50EEC061762
        for <linux-watchdog@vger.kernel.org>; Sat, 17 Jul 2021 07:08:50 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id w26so9373186qto.9
        for <linux-watchdog@vger.kernel.org>; Sat, 17 Jul 2021 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HAI05KINAEoqD0ej26FB84p+vho67dxYiisv+SYU5zY=;
        b=UcFGGrL8a+YZuUgtmhGBD7Uqxfa1ehFvAMoUfaR5Mt7fiqMBX18sjC55JV1JI9m2di
         WuvdzZkWG0g2rY3MnTp5qd1tSKjCheCXOdOGu5Boy6+aPvhyWIWDVkwqK18zKoSqoDNk
         8xq+CIQE6bapV6Z0oqTdizZ91H1S38+geFf5fKctv2NKWbGTJXs+ukVXG9r0BUkkuJCK
         2+JY1ABESYeGHIXzKXZ6iZuwPh/tghnu+wgn0UTnKp5B1NDoQc/zhwMHhjXAnkfHnZ87
         8NTFHJwcO/Hs9cCdRDuS8qsxvf/Y2Qp2bJcQNSkRhyfMUlsLAhsAlrzBLEiI6asS9T+m
         Y8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=HAI05KINAEoqD0ej26FB84p+vho67dxYiisv+SYU5zY=;
        b=epER4pRti+ZGLIZGvcohybnwjCCVcIpX47gLaZESrHYGbpll3kbFeCjFdBEH9MCew5
         ch/YN9/NAg3LGoLJgUtvijl+6hHzYkhjNzj+2xLlpgoYYovpMTlVr2+HwnGcCMbHQZbd
         0XPeXWwo9cnPVOvo41YURfLYPd0Sp5k4bC5H/yEPAKjg+JtKR0XmijLv6y7XylVRDv2g
         aSPmm728ImNMYKjmJut46jXejY5/OZXCoXmBrVXgUVwarWmOi6fsAH27jAgUx4+dyiOc
         CqTJF/XqWi+F5c3NzwceeuxcuBORmOjMIN/k5DaY/wj9jI/gjs4H4mIcp48AokNFwzSk
         RI3w==
X-Gm-Message-State: AOAM533ksqUIxcncO4VFnrcI51pc4CZKZz56wPFTT2g0SV/KFyzL+2BW
        evb2KOBo2SEV/Bn30Esbr78=
X-Google-Smtp-Source: ABdhPJz98MdYPZOnkSV868Szp3ymuv7sKr+Couk6nzkZM/4cTuFmT6kNYsBaeewjzHynUQjRzhyLow==
X-Received: by 2002:ac8:5944:: with SMTP id 4mr14397542qtz.312.1626530929812;
        Sat, 17 Jul 2021 07:08:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h8sm4362785qtj.57.2021.07.17.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:08:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 17 Jul 2021 07:08:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 2/2] watchdog: max63xx_wdt: Add device tree probing
Message-ID: <20210717140848.GB857728@roeck-us.net>
References: <20210714153314.1004147-1-linus.walleij@linaro.org>
 <20210714153314.1004147-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714153314.1004147-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 14, 2021 at 05:33:14PM +0200, Linus Walleij wrote:
> This adds device tree probing to the MAX63xx driver so it can be
> instantiated from the device tree. We use the generic fwnode-based
> method to get to the match data and clean up by constifying the
> functions as the match is indeed a const.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/max63xx_wdt.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
> index 3a899628a834..9e1541cfae0d 100644
> --- a/drivers/watchdog/max63xx_wdt.c
> +++ b/drivers/watchdog/max63xx_wdt.c
> @@ -26,6 +26,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
> +#include <linux/property.h>
>  
>  #define DEFAULT_HEARTBEAT 60
>  #define MAX_HEARTBEAT     60
> @@ -99,8 +100,8 @@ static const struct max63xx_timeout max6373_table[] = {
>  	{ },
>  };
>  
> -static struct max63xx_timeout *
> -max63xx_select_timeout(struct max63xx_timeout *table, int value)
> +static const struct max63xx_timeout *
> +max63xx_select_timeout(const struct max63xx_timeout *table, int value)
>  {
>  	while (table->twd) {
>  		if (value <= table->twd) {
> @@ -202,14 +203,17 @@ static int max63xx_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct max63xx_wdt *wdt;
> -	struct max63xx_timeout *table;
> +	const struct max63xx_timeout *table;
>  	int err;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
>  		return -ENOMEM;
>  
> -	table = (struct max63xx_timeout *)pdev->id_entry->driver_data;
> +	/* Attempt to use fwnode first */
> +	table = device_get_match_data(dev);
> +	if (!table)
> +		table = (struct max63xx_timeout *)pdev->id_entry->driver_data;
>  
>  	if (heartbeat < 1 || heartbeat > MAX_HEARTBEAT)
>  		heartbeat = DEFAULT_HEARTBEAT;
> @@ -255,11 +259,23 @@ static const struct platform_device_id max63xx_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, max63xx_id_table);
>  
> +static const struct of_device_id max63xx_dt_id_table[] = {
> +	{ .compatible = "maxim,max6369", .data = max6369_table, },
> +	{ .compatible = "maxim,max6370", .data = max6369_table, },
> +	{ .compatible = "maxim,max6371", .data = max6371_table, },
> +	{ .compatible = "maxim,max6372", .data = max6371_table, },
> +	{ .compatible = "maxim,max6373", .data = max6373_table, },
> +	{ .compatible = "maxim,max6374", .data = max6373_table, },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max63xx_dt_id_table);
> +
>  static struct platform_driver max63xx_wdt_driver = {
>  	.probe		= max63xx_wdt_probe,
>  	.id_table	= max63xx_id_table,
>  	.driver		= {
>  		.name	= "max63xx_wdt",
> +		.of_match_table = max63xx_dt_id_table,
>  	},
>  };
>  
> -- 
> 2.31.1
> 
