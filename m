Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6B5C21B1
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2019 15:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbfI3NSV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Sep 2019 09:18:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41990 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3NSU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Sep 2019 09:18:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id z12so7384549pgp.9;
        Mon, 30 Sep 2019 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IeNb76xF/iiAkmuGaqc/RgfhSXiK60RFNQ5u5Egtzwc=;
        b=i1C27JYYTT5LFyoUJ7GsRdGiD9QUCYW3q5siKm/kIrZZHgROUsZDl7rzbVuL/39rXT
         AajNTy1a7GtjOEjhtjzHUoV262m/SOR4EZyS1eAyxAgEVM0B0AeKTUqyB0OCcGs627EQ
         sh5NDAg7C4i/+gB80/Yiytp6z6CTz+TeUy7PY+KocGZVSJok3zxN29dHHzP6ysjK+qmo
         ifB0uGq1HdW1HPcUfrcMcj8zuFq7S491ZuzSlLwZuOXez2kc2ydiicfpH5m1KvpmoOcM
         Uxsyy8ovr+lMCIDUy6nqNVHzgPslsDsbcxRAdSpHTvuw+fMi8UsMyRaEzbkYeDOpYx1C
         j53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=IeNb76xF/iiAkmuGaqc/RgfhSXiK60RFNQ5u5Egtzwc=;
        b=I0W02Aeg0OxfaZAvAEtPtUnMbunyOYWYIkyJQ9UdBKcWspn3D0fcEPFZlIoBGaFHbb
         4fNOV+g0Z21tGZNAV6+eDh+fjqHCf9/aw/4MBnl00FdkzlRlqUgIz/HPyQXy+TSyO8DN
         xoKh7/hy8thIQxZpN21FgSMgS99Zo16dgtqwH9gDXWgp23sSzOcZBqmMow5YD1jIHMeN
         +uLDdBSbxG40Fz6NUBFP0Hl1QRqAWv6Rpc4ZK6LT2/HvhUre9Ku9NORQ1GrHhRtRcwdR
         V6DDaPJl25ht/cLgQ+hMZCImbpTCIQRZEAzw/l9hDz/ARwdgoosdqnOCvmaFsxIgBOWM
         Qt6g==
X-Gm-Message-State: APjAAAVP51/6/HQD+R7EF4M4HlDH/zshvv+UU0BgAqseewNvflrNiPrt
        KFY1z7GUILLy89f2wdjqClk=
X-Google-Smtp-Source: APXvYqwGkAF+kWpqAj6UpJAWdIO9jQYwc6SIZA+Pk2aEG3EO6zNRI4aw5xunqrGFbM0FEZY0RNCcdg==
X-Received: by 2002:a63:d20f:: with SMTP id a15mr24216063pgg.130.1569849499941;
        Mon, 30 Sep 2019 06:18:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i6sm19213778pfq.20.2019.09.30.06.18.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 06:18:19 -0700 (PDT)
Date:   Mon, 30 Sep 2019 06:18:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 3/3] watchdog: imx2_wdt: Use 'dev' instead of
 dereferencing it repeatedly
Message-ID: <20190930131818.GC29750@roeck-us.net>
References: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
 <1569308828-8320-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569308828-8320-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 24, 2019 at 03:07:08PM +0800, Anson Huang wrote:
> Add helper variable dev = &pdev->dev to simply the code.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx2_wdt.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index 034f32c..f8d58bf 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -246,13 +246,14 @@ static const struct regmap_config imx2_wdt_regmap_config = {
>  
>  static int __init imx2_wdt_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct imx2_wdt_device *wdev;
>  	struct watchdog_device *wdog;
>  	void __iomem *base;
>  	int ret;
>  	u32 val;
>  
> -	wdev = devm_kzalloc(&pdev->dev, sizeof(*wdev), GFP_KERNEL);
> +	wdev = devm_kzalloc(dev, sizeof(*wdev), GFP_KERNEL);
>  	if (!wdev)
>  		return -ENOMEM;
>  
> @@ -260,16 +261,16 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	wdev->regmap = devm_regmap_init_mmio_clk(&pdev->dev, NULL, base,
> +	wdev->regmap = devm_regmap_init_mmio_clk(dev, NULL, base,
>  						 &imx2_wdt_regmap_config);
>  	if (IS_ERR(wdev->regmap)) {
> -		dev_err(&pdev->dev, "regmap init failed\n");
> +		dev_err(dev, "regmap init failed\n");
>  		return PTR_ERR(wdev->regmap);
>  	}
>  
> -	wdev->clk = devm_clk_get(&pdev->dev, NULL);
> +	wdev->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(wdev->clk)) {
> -		dev_err(&pdev->dev, "can't get Watchdog clock\n");
> +		dev_err(dev, "can't get Watchdog clock\n");
>  		return PTR_ERR(wdev->clk);
>  	}
>  
> @@ -279,12 +280,12 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  	wdog->min_timeout	= 1;
>  	wdog->timeout		= IMX2_WDT_DEFAULT_TIME;
>  	wdog->max_hw_heartbeat_ms = IMX2_WDT_MAX_TIME * 1000;
> -	wdog->parent		= &pdev->dev;
> +	wdog->parent		= dev;
>  
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret > 0)
> -		if (!devm_request_irq(&pdev->dev, ret, imx2_wdt_isr, 0,
> -				      dev_name(&pdev->dev), wdog))
> +		if (!devm_request_irq(dev, ret, imx2_wdt_isr, 0,
> +				      dev_name(dev), wdog))
>  			wdog->info = &imx2_wdt_pretimeout_info;
>  
>  	ret = clk_prepare_enable(wdev->clk);
> @@ -294,13 +295,13 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
>  	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ? WDIOF_CARDRESET : 0;
>  
> -	wdev->ext_reset = of_property_read_bool(pdev->dev.of_node,
> +	wdev->ext_reset = of_property_read_bool(dev->of_node,
>  						"fsl,ext-reset-output");
>  	platform_set_drvdata(pdev, wdog);
>  	watchdog_set_drvdata(wdog, wdev);
>  	watchdog_set_nowayout(wdog, nowayout);
>  	watchdog_set_restart_priority(wdog, 128);
> -	watchdog_init_timeout(wdog, timeout, &pdev->dev);
> +	watchdog_init_timeout(wdog, timeout, dev);
>  
>  	if (imx2_wdt_is_running(wdev)) {
>  		imx2_wdt_set_timeout(wdog, wdog->timeout);
> @@ -318,7 +319,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_clk;
>  
> -	dev_info(&pdev->dev, "timeout %d sec (nowayout=%d)\n",
> +	dev_info(dev, "timeout %d sec (nowayout=%d)\n",
>  		 wdog->timeout, nowayout);
>  
>  	return 0;
> -- 
> 2.7.4
> 
