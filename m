Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981712E2BBD
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Dec 2020 15:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgLYO2J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Dec 2020 09:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgLYO2I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Dec 2020 09:28:08 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA695C061573;
        Fri, 25 Dec 2020 06:27:27 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 11so3914386oty.9;
        Fri, 25 Dec 2020 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oZZqS652feFDi+rDpYp850LeakI/uYF7nzQQb/ytiY4=;
        b=tKOA3jN9ygj2IK5lvshj2chue+gRtH7ZpWpoH1uLlUjOsKt/fKjRu/FzANZbirdtOb
         83/U7BjM543o//tQCca4X/MN9UuGDwr4ft1sOpd70UaGRlow1wIPXgXCx0XhnSM92jPm
         cmsbcf3Sc34lBNlEygt0zZ4nGpSpsgTCd7HHoqDXOou7EXPhFKJZLBEMuggDTFCOknsI
         O6X4zojtLW1JLNFqlKpWyHoxpnchc1KARLceSSHpx7YB6yvVv8csGWp8iz0nrPE12t+K
         E8un8QA40Tnf9+HVV/32o90k8RIJLX2Gw2rjbZufd6VivX3KcOC9ikqHOwGfZnCWu/2p
         MXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oZZqS652feFDi+rDpYp850LeakI/uYF7nzQQb/ytiY4=;
        b=sgkupXXABigtbPwQ8SyvWmT1T/O3MrYW0xN0dxt8p79RVEo63s5YQrCCoDdMVJAgyI
         3ZNmEaDtj4oFHF0AlvhSSHxjVbWbeiqyKNyM86kKA2NgosvGfi9+Na2j11lgZBml9/Uh
         /WclewkfBKuCFLt7Unnimfm8jLfYNn4vVXU1wugz2O720k02AJ6cklJc4IuTXNH7LNBO
         6Fz/wBCnXg0Sb3RUqM08tpDtBcvgNbJLc6VXfj7qCPmbA3sNIEnL6xpwXKhNHQ+/jeMD
         pYM25vNiZ6MqqUWW4HVhn4YUxS4fwW9AgIYnUOK/xR3p/PJBBQJ4CgpAyCE8kKBp6kjJ
         9D8Q==
X-Gm-Message-State: AOAM530eDDbstxJOmObH+3rWSJn/eVfK4/Xm2odAZsuXWExheKjLCqZD
        hRBjy64F2HTU2i584V4YMLE=
X-Google-Smtp-Source: ABdhPJx+pPHZ/3fpiVHbPVHaJVZxmxdJIdS2DFc3rym4Y4YIe0Zb6yX28+8oVcrjGJ+8+OvO8o40DA==
X-Received: by 2002:a9d:650e:: with SMTP id i14mr24447576otl.19.1608906446984;
        Fri, 25 Dec 2020 06:27:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 31sm7446010otd.24.2020.12.25.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 06:27:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 1/1] driver: watchdog: Remove mtk_wdt_stop() in probe()
 to prevent the system freeze and it doesn't reboot by watchdog problem
To:     Freddy Hsin <freddy.hsin@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     wsd_upstream@mediatek.com, chang-an.chen@mediatek.com,
        kuohong.wang@mediatek.com
References: <1608881450-11081-1-git-send-email-freddy.hsin@mediatek.com>
 <1608881450-11081-2-git-send-email-freddy.hsin@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a3851099-128a-1305-0f76-66af3c9c6e63@roeck-us.net>
Date:   Fri, 25 Dec 2020 06:27:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608881450-11081-2-git-send-email-freddy.hsin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/24/20 11:30 PM, Freddy Hsin wrote:
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
> started or not
> 
> Change-Id: I6a041b0922888a90011d7538ee804d80bc8d15ea
> Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>
> ---
>  drivers/watchdog/mtk_wdt.c |   22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..62f08cd 100644
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
> @@ -266,16 +279,17 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>  	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;

No longer needed if max_hw_heartbeat_ms is set.

>  	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
> +	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = (WDT_MAX_TIMEOUT - 1) * 1000;

This needs explanation. Why WDT_MAX_TIMEOUT - 1 ?

>  	mtk_wdt->wdt_dev.parent = dev;
>  
> +	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
> +
> +	mtk_wdt_init(&mtk_wdt->wdt_dev);
> +

Setting the chip (with the maximum timeout) ...

>  	watchdog_init_timeout(&mtk_wdt->wdt_dev, timeout, dev);

just before initializing/setting the real timeout doesn't really make sense.

>  	watchdog_set_nowayout(&mtk_wdt->wdt_dev, nowayout);
>  	watchdog_set_restart_priority(&mtk_wdt->wdt_dev, 128);
>  
> -	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
> -
> -	mtk_wdt_stop(&mtk_wdt->wdt_dev);
> -
>  	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
>  	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
>  	if (unlikely(err))
> 

