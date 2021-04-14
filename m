Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478A335F33D
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Apr 2021 14:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350709AbhDNMN3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Apr 2021 08:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350705AbhDNMN1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Apr 2021 08:13:27 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36E7C061574;
        Wed, 14 Apr 2021 05:13:05 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id h19-20020a9d64130000b02902875a567768so8121755otl.0;
        Wed, 14 Apr 2021 05:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BJCIiw4lvDY8QcfmAqos4Br1GHRmqU8+KnDAmYMsa0Y=;
        b=Ktg2QsirKgHi58sYbj2DJJstMd8yO5miMDpeCz3quI0+jrTxqzObGuroj0qWlA0sgz
         hwo91nEQwHCMl/LBswlqcI3GTfi6g+dJMyUfWI3pessxplmRkH/FTewkHHQCy1xHA/hd
         PQ6oerKvYWbz+5ZlC7enOfMCE89r8ak/JgoycCvILsSSzwaS5EuI/fsgwx7ORvVnPhkE
         0tTCt+OsHFKUlKZuuZFoCJfGpAPE348uok4JiiC2muFoBn6I8OhNBfxzTCGPFLEtWglY
         phZO3BpuihlJqxOmia8QiCO7Iy0pF+kk4QgMHA788JMSTMlblJD1c4jS36zJRMpp7AIT
         8Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BJCIiw4lvDY8QcfmAqos4Br1GHRmqU8+KnDAmYMsa0Y=;
        b=fxUf6vblIMmqw3otKerH71bHW/B5DBaUqO7CxnGa+FpTwmSwAfenuSWI/qvIQwmakN
         RqnB529j3dM9SlWUoPYCIOQSNbQB8owefYvfaL/JPoez4jwU63GSp/LtQvWpI0SKpihU
         HgKtVtFgeZszYLATh1iNKQ9LXKkeL/IMQDMTMKNdudf/lUXVmqQS4Mci2TaKw9FKht1+
         MqEZ9FLbp25bU9qygArwp/z5rIBWeHTGT/8QnUP0NK3YbR37k4qDE0E7bxB8anPdNZvh
         sDlwtcqvhRfeWv811nkXPQ0Y9ypfMv2RRklkE3mVlpT9uNY9FX5vfS6JPCOr29o/F744
         q31A==
X-Gm-Message-State: AOAM531ItH68sKADyisnNgMIQjLZubwfngIP81E8YelwbENQM1wHlZIq
        AFq34Dc30l+DIMGCImJtH0mXxJw0ESU=
X-Google-Smtp-Source: ABdhPJxJSHIiJ+QR0vrNldKM4BXT9QZPa73m+YjRSzS373vnRmswr9RIejc8dCuCYeMqf207N0CDbw==
X-Received: by 2002:a9d:2929:: with SMTP id d38mr25180646otb.121.1618402384127;
        Wed, 14 Apr 2021 05:13:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2sm4195303otl.48.2021.04.14.05.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 05:13:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V3] watchdog: mtk: support pre-timeout when the bark irq
 is available
To:     Wang Qing <wangqing@vivo.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1618400929-17013-1-git-send-email-wangqing@vivo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1e60551b-4961-91d6-1ea8-7e3b6becd385@roeck-us.net>
Date:   Wed, 14 Apr 2021 05:13:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1618400929-17013-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/14/21 4:48 AM, Wang Qing wrote:
> Use the bark interrupt as the pretimeout notifier if available.
> 
> By default, the pretimeout notification shall occur one second earlier
> than the timeout.
> 
> V2:
> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
> 
> V3:
> - Modify the pretimeout behavior, manually reset after the pretimeout
> - is processed and wait until timeout.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 62 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993..7bef1e3
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -25,6 +25,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> +#include <linux/interrupt.h>
>  
>  #define WDT_MAX_TIMEOUT		31
>  #define WDT_MIN_TIMEOUT		1
> @@ -234,18 +235,46 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>  	int ret;
>  
> -	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> +	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout - wdt_dev->pretimeout);
>  	if (ret < 0)
>  		return ret;
>  
>  	reg = ioread32(wdt_base + WDT_MODE);
> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	reg &= ~WDT_MODE_IRQ_EN;
> +	if (wdt_dev->pretimeout)
> +		reg |= WDT_MODE_IRQ_EN;
> +	else
> +		reg &= ~WDT_MODE_IRQ_EN;
>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
>  	return 0;
>  }
>  
> +static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
> +				   unsigned int timeout)
> +{
> +	wdd->pretimeout = timeout;
> +	return mtk_wdt_start(wdd);

The watchdog is not necessarily active here.

> +}
> +
> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
> +{
> +	struct watchdog_device *wdd = arg;
> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
> +	void __iomem *wdt_base = mtk_wdt->wdt_base;
> +
> +	watchdog_notify_pretimeout(wdd);
> +	/*
> +	 * Guaranteed to be reset when the timeout
> +	 * expires under any situations
> +	 */
> +	mdelay(1000*wdd->pretimeout);

That is not how this is supposed to work. The idea with a pretimeout is that the
real watchdog reset will happen under all circumstances, and that executing
the pretimeout (and changing some hardware registers) is not a prerequisite
for the real timeout to happen. After all, the system could be stuck hard, with
interrupts disabled.

On top of that, just sleeping here while waiting for the real timeout and
then resetting the system isn't the idea either. On a single core system this
will just hang. On a multi-core system, who knows if userspace managed to ping
the watchdog in the meantime.

Unless there is a means to trigger the watchdog twice, without intervention,
the first time generating an interrupt and the second time resetting the system,
there is no way for this to work. I don't see how this chip really supports
pretimeout. It seems that it supports either a hard reset or generating an
interrupt on watchdog timeout, and there is only a single timeout.

If you have a use case for generating an interrupt and resetting the system via
software (ie panic) _instead_ of having it generate a hard reset, please feel
free to submit a patch along that line, together with a description of its use
case.

Thanks,
Guenter

> +	writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static const struct watchdog_info mtk_wdt_info = {
>  	.identity	= DRV_NAME,
>  	.options	= WDIOF_SETTIMEOUT |
> @@ -253,12 +282,21 @@ static const struct watchdog_info mtk_wdt_info = {
>  			  WDIOF_MAGICCLOSE,
>  };
>  
> +static const struct watchdog_info mtk_wdt_pt_info = {
> +	.identity	= DRV_NAME,
> +	.options	= WDIOF_SETTIMEOUT |
> +			  WDIOF_PRETIMEOUT |
> +			  WDIOF_KEEPALIVEPING |
> +			  WDIOF_MAGICCLOSE,
> +};
> +
>  static const struct watchdog_ops mtk_wdt_ops = {
>  	.owner		= THIS_MODULE,
>  	.start		= mtk_wdt_start,
>  	.stop		= mtk_wdt_stop,
>  	.ping		= mtk_wdt_ping,
>  	.set_timeout	= mtk_wdt_set_timeout,
> +	.set_pretimeout	= mtk_wdt_set_pretimeout,
>  	.restart	= mtk_wdt_restart,
>  };
>  
> @@ -267,7 +305,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
>  	const struct mtk_wdt_data *wdt_data;
> -	int err;
> +	int err, irq;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>  	if (!mtk_wdt)
> @@ -279,7 +317,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0) {
> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
> +							&mtk_wdt->wdt_dev);
> +		if (err)
> +			return err;
> +
> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
> +		mtk_wdt->wdt_dev.pretimeout = 1;
> +	} else {
> +		if (irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> +	}
> +
>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>  	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
> @@ -360,7 +413,6 @@ static struct platform_driver mtk_wdt_driver = {
>  };
>  
>  module_platform_driver(mtk_wdt_driver);
> -
>  module_param(timeout, uint, 0);
>  MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds");
>  
> 

