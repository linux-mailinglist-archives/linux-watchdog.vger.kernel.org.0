Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33192E7B22
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Dec 2020 17:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL3Qv0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 30 Dec 2020 11:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgL3QvZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 30 Dec 2020 11:51:25 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7183AC061799;
        Wed, 30 Dec 2020 08:50:45 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id w124so19218072oia.6;
        Wed, 30 Dec 2020 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t6P2ZmqFtyuJnEdPK04I8RYAnBRXAqg/IepNl21Cbws=;
        b=oudrF+mjQm9CIsSNXF3AG95P6M7J3xuiQ9Zl3dy+TUGsU1E16HqeEtl6S/qjJvUtUE
         qb40sKxIYScmsFud9oAP9wDI55/lDc8cV9JhZ4MfYTy3WI7o8/1TYfdfSsW4Z0GxxYI6
         qeIUqDB2npCwwT7Om8TWrFR8qdARWvN7RVchzHQ6uNx4pWX0gGZxkA6jY8PTqse0ISMg
         iXAUM2A5mENAR+ZKparAPY8kE1fKxIt0tGleS0vVFDlblWF0kYvqUgrMso1k5QC0R/fI
         mXZnuzmbNzGb9ru3RxIRmKTXn3bYY1AcRs5mqj5pl7JxIYZS3CqXe+PNdBk6686NVK5+
         7R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=t6P2ZmqFtyuJnEdPK04I8RYAnBRXAqg/IepNl21Cbws=;
        b=Y7rL78MGVW7+WHGJI7DRiszAwlbuXD6lfGo321rPwGPFNhRISSt2LfonoOhzs/O6AN
         2sYPypUL6M6vSE+u31e7iYOJTOLWM+y0SV9elyWsMaFNSX5H3PkQgYwM8WSAGN77+acq
         JcosA48GdIcMcrBMHrkUE9tIKNfiHf1HzFZ40gMRQIWpHxA56JnVqEq+9gJNhOITNtxC
         4CbgqWHpZszaOeFQUFkYsJ8w3alGBgBX0nemyVQgBiVU1xEKNuZFAwpwpqPhpDfKF+QN
         eaHzpYLUsI/MBnBFQa7Uwk4uk3N05eOQUk7vjqMKwlfNQiIufmdUZn07dEnOLJ+Br6t1
         4EQQ==
X-Gm-Message-State: AOAM531JGHaW7D9obQ9i8vIbTW8rPjoveAMUGLVvt/e/PpM5K8suQgW1
        usirmApvtbnpogABe1GRkrg=
X-Google-Smtp-Source: ABdhPJyrSf9VRgu9BaXlpvk7YtjB4Ru5An5wu1Bknd9ykdUrZ+fbLhApJdre3ait5CwY9bQ11zhfGw==
X-Received: by 2002:aca:1b04:: with SMTP id b4mr5724082oib.3.1609347044677;
        Wed, 30 Dec 2020 08:50:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z9sm10727970otj.67.2020.12.30.08.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 08:50:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 1/1] watchdog: mtk_wdt: Remove mtk_wdt_stop() in
 probe() to prevent the system freeze and it doesn't reboot by watchdog
 problem
To:     Freddy Hsin <freddy.hsin@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     wsd_upstream@mediatek.com, chang-an.chen@mediatek.com,
        kuohong.wang@mediatek.com
References: <1609316157-3748-1-git-send-email-freddy.hsin@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6ce2a1f6-9385-8004-5227-88bb5cdba5e2@roeck-us.net>
Date:   Wed, 30 Dec 2020 08:50:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609316157-3748-1-git-send-email-freddy.hsin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/30/20 12:15 AM, Freddy Hsin wrote:
> From: "freddy.hsin" <freddy.hsin@mediatek.com>
> 
> Before user space daemon start to access the watchdog device,
> there is a time interval that watchdog is disabled in the
> original flow. If the system freezing at this interval, it
> cannot be rebooted by watchdog hardware automatically.
> 
> In order to solve this problem, the watchdog hardware should be
> kept working, and start hrtimer in framework to ping it by
> setting max_hw_heartbeat_ms and HW_RUNNING used in
> watchdog_need_worker to determine whether the worker should be
> started or not. Besides the redundant setting of max_timeout is
> also removed.
> 
> Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>
> ---

Change log goes here.

Looks good though.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

>  drivers/watchdog/mtk_wdt.c |   17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..0c869b7 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -195,6 +195,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	return 0;
>  }
>  
> +static void mtk_wdt_init(struct watchdog_device *wdt_dev)
> +{
> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> +	void __iomem *wdt_base;
> +
> +	wdt_base = mtk_wdt->wdt_base;
> +
> +	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
> +		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> +		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> +	}
> +}
> +
>  static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> @@ -264,7 +277,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
> -	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
> +	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
>  	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
>  	mtk_wdt->wdt_dev.parent = dev;
>  
> @@ -274,7 +287,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
>  
> -	mtk_wdt_stop(&mtk_wdt->wdt_dev);
> +	mtk_wdt_init(&mtk_wdt->wdt_dev);
>  
>  	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
>  	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
> 

