Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE8B52716F
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 May 2022 15:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbiENN5A (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 May 2022 09:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiENN46 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 May 2022 09:56:58 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2600EC21;
        Sat, 14 May 2022 06:56:57 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so13934638fac.7;
        Sat, 14 May 2022 06:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fbxlDQeg2abnk6Es2GK+XUydydPBIcTXUq14L4di8C4=;
        b=ElIpAdFLlxqhIywvVFtvK++2zhg36FtFUOWIcgZWyjFA9zBBbMp6seeBtYd0B/U9A3
         rIanjKPg5H+BKQfmNtC40aRYcd2gMl+N0ziRjka49N2/xrqnEIBEeU26ydlcJy5lPhWz
         G695G25z/Sids2MPypAQtMVxrSeTkN1JL0y1cvD/FNaDAgQHQLKyABG0GnX+oZBWwA0s
         ITzEamgOHLiHZyRnHYLNsZxeEw5RI/ek3yNSv/QvzYYLFJeRePJvLllGQnNWbFUktbCJ
         tCZnLQjlCOsd3MK74dQ/gtcMDpiQNj8ZB1MRcK3CEEJMqK5B9A2P/0xN3EIkvD2B6qkH
         08ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fbxlDQeg2abnk6Es2GK+XUydydPBIcTXUq14L4di8C4=;
        b=YHeA/ZVa8u2fdTw3Z+ZhBf4yUyyobVZ8ba5u0KUHYmo16NzEnxkAH6w1kxUTGKkCdx
         2WzS57fiKgu763R0a4l+QGoIB52IoZEB3CCuqxb12z9+5QjqU6fQ7HIOh9SGx+o1I7kA
         edHkiDCPrqnjQEclGUw4KwbE24pT9TtRLPxEpuqhkHJqCnvadSwuhTZ+IlKzQAUatYRB
         qcDh463YhViL8f8w9zhVyRtwoJqsQhfpYohFcp8N8mlNqkmeeTfNDAV3D+Kz/Z8uMeVO
         rc7NcAqYOfy2PC78VdG0iK/VPs89XjnE1D11IY4C+w1m3bKv7D2FnffbJVwnbfGv4i9U
         iNZA==
X-Gm-Message-State: AOAM533MyGVnWQxg8AQnEOWjh5Xu0m9qJw1Fk0rp21lVkoK4MrnDbK3P
        mF1jEpK5gfONI8VLM+/JTjM=
X-Google-Smtp-Source: ABdhPJyuPzV1j91r0bJ6zT+64VeO3MPWlwFo1dEgJCPxxA/PZHMclRngJUYtBMMGM5x0NSnE23JFpQ==
X-Received: by 2002:a05:6870:3913:b0:ed:2ed7:6798 with SMTP id b19-20020a056870391300b000ed2ed76798mr10634308oap.37.1652536615901;
        Sat, 14 May 2022 06:56:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b18-20020a9d6b92000000b00606b1f72fcbsm2132211otq.31.2022.05.14.06.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 06:56:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 14 May 2022 06:56:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrej Picej <andrej.picej@norik.com>, upstream@phytec.de
Subject: Re: [PATCH 2/3] watchdog: da9063: optionally disable watchdog during
 suspend
Message-ID: <20220514135654.GA1227812@roeck-us.net>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <20220422072713.3172345-2-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422072713.3172345-2-primoz.fiser@norik.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 22, 2022 at 09:27:12AM +0200, Primoz Fiser wrote:
> Optionally disable watchdog during suspend (if enabled) and re-enable
> it upon resume.
> This enables boards to sleep without being interrupted by the watchdog.
> 
> This patch is based on commit f6c98b08381c ("watchdog: da9062: add
> power management ops") and commit 8541673d2a5f ("watchdog: da9062: fix
> power management ops") and brings the same functionality to DA9063.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Reviewed-by: Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/da9063_wdt.c | 36 +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index 9adad1862bbd..09a4af4c58fc 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -18,6 +18,7 @@
>  #include <linux/delay.h>
>  #include <linux/mfd/da9063/registers.h>
>  #include <linux/mfd/da9063/core.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  
>  /*
> @@ -26,6 +27,8 @@
>   *   others: timeout = 2048 ms * 2^(TWDSCALE-1).
>   */
>  static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
> +static bool use_sw_pm;
> +
>  #define DA9063_TWDSCALE_DISABLE		0
>  #define DA9063_TWDSCALE_MIN		1
>  #define DA9063_TWDSCALE_MAX		(ARRAY_SIZE(wdt_timeout) - 1)
> @@ -218,6 +221,8 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  	if (!wdd)
>  		return -ENOMEM;
>  
> +	use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
> +
>  	wdd->info = &da9063_watchdog_info;
>  	wdd->ops = &da9063_watchdog_ops;
>  	wdd->min_timeout = DA9063_WDT_MIN_TIMEOUT;
> @@ -228,6 +233,7 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_set_restart_priority(wdd, 128);
>  	watchdog_set_drvdata(wdd, da9063);
> +	dev_set_drvdata(dev, wdd);
>  
>  	wdd->timeout = DA9063_WDG_TIMEOUT;
>  
> @@ -249,10 +255,40 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, wdd);
>  }
>  
> +static int __maybe_unused da9063_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (!use_sw_pm)
> +		return 0;
> +
> +	if (watchdog_active(wdd))
> +		return da9063_wdt_stop(wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused da9063_wdt_resume(struct device *dev)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	if (!use_sw_pm)
> +		return 0;
> +
> +	if (watchdog_active(wdd))
> +		return da9063_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(da9063_wdt_pm_ops,
> +			da9063_wdt_suspend, da9063_wdt_resume);
> +
>  static struct platform_driver da9063_wdt_driver = {
>  	.probe = da9063_wdt_probe,
>  	.driver = {
>  		.name = DA9063_DRVNAME_WATCHDOG,
> +		.pm = &da9063_wdt_pm_ops,
>  	},
>  };
>  module_platform_driver(da9063_wdt_driver);
