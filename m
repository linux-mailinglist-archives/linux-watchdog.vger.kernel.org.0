Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFE3255C5F
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 16:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgH1O07 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 10:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgH1O0y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 10:26:54 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5B2C061264;
        Fri, 28 Aug 2020 07:26:53 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id z18so570007pjr.2;
        Fri, 28 Aug 2020 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Njx4yGGdSjtlv4/kUFdctE8YgPuI0pFS31rZi946uIQ=;
        b=nA+oGgFEUKP7HuALh5OPPl9Z0m9rOwmP1CZHygF6jpe9k/E76nEAwYWVneVkXFBvL2
         zx2vSaknMZ7Wrhidd/xVhRCoMxQhkYvxCqbV0gbMQxG7CXO2U/DxOYfW9QbTNVJs0tsf
         RU0vmGrag5gZdm3XB21qMfD+hRUImzpvbw6uTb88awkUFlSIHPlfL+sn2292SJuy1U9o
         jTsC78H/YD1ZUjRzbH8uKdFcZzlfTsI2fb6dXI4L86vJ7zjB/j8Us/X/6ZsQJMOg81JH
         o5XoUandHSC+4TB2Lnownu3zMIWqTb9QaVWjTn77z4Pl1xBlHKnyQsKXOsY3EsKhF5aZ
         Ez6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Njx4yGGdSjtlv4/kUFdctE8YgPuI0pFS31rZi946uIQ=;
        b=nZy3wYjgZ+4Jogp3qF0RVXO9QdIP8jdJTkMIXEGj6HcNydA8t028sxCkXYoVC3GN1Q
         XEuZpKA89Fqd1Dwtc3Sj908u4QHz7t9mCh017EwzpI/VkihZsELElvmLaeWb80G47eeq
         e6MgBsYXV7J8TQDZMRF44UXDPYEtxYWq6ikrtXURZJislj3waYa9ALSOMhEe5r+lzaON
         fvB7SgCigXywLRcYGO0M2xbeTinhTDjn1D69b2eG9Pney45zDeVaqbhplDO9lpTb7P/8
         gBCbxVbQHdZZZQ5nJsI9sKeH3xgMYROFsOlmkFJ5WOH2uTJAhc84HgFhKCwjDFXO1KI9
         PYUg==
X-Gm-Message-State: AOAM531mq7KjmEQvZJTLP21E5RAl7T71kwh5TwuSim4kvwgzTge7q/eT
        NJOvdGERyxxe1zIF3yvoDt/cEx+8CT0=
X-Google-Smtp-Source: ABdhPJxoosLROmWIIrrYR/FJQR390fu7JN0qXevCw6ceRYDRQ2GyCKRF3czbcTsGLkPuMfS0dExw9w==
X-Received: by 2002:a17:90b:4ad1:: with SMTP id mh17mr1475021pjb.54.1598624811264;
        Fri, 28 Aug 2020 07:26:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w82sm1938404pfc.183.2020.08.28.07.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 07:26:50 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] driver: watchdog: Add mtk_wdt_init for mediatek
 watchdog hw init
To:     Freddy Hsin <freddy.hsin@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     wsd_upstream@mediatek.com, chang-an.chen@mediatek.com,
        kuohong.wang@mediatek.com, chun-hung.wu@mediatek.com
References: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
 <1598600968-28498-2-git-send-email-freddy.hsin@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a63e9613-d448-d784-0c60-0fd8d1b9b937@roeck-us.net>
Date:   Fri, 28 Aug 2020 07:26:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598600968-28498-2-git-send-email-freddy.hsin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/28/20 12:49 AM, Freddy Hsin wrote:
> 1. add a hw initialization function
> 2. enable/disable the watchdog depends on the original hw setting
> 3. set WDOD_HW_RUNNING in start function in order to start
>    kicker after driver probe and clear the bit in stop function
> 
> Change-Id: I25aa797f3b88288f26984455e499e599e27f09fa
> Signed-off-by: Freddy Hsin <freddy.hsin@mediatek.com>

The subject is misleading - what this really does it to honor
that/if a watchdog is already running. However, WDOG_HW_RUNNING
should not generally be set/cleared in the start/stop function.
Also, calling mtk_wdt_stop is pointless if WDT_MODE_EN is not set,
since clearing WDT_MODE_EN is all it does. On top of that,
setting WDOG_HW_RUNNING in the probe function requires that
max_hw_heartbeat_ms is set (instead of max_timeout).

So if you really want to honor that the watchdog is already running
at boot, you would have to initialize max_hw_heartbeat_ms, set
WDOG_HW_RUNNING explicitly, and possibly call the ping function
before changing the timeout.

Thanks,
Guenter

> ---
>  drivers/watchdog/mtk_wdt.c |   22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..59b5061 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -57,6 +57,9 @@
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  static unsigned int timeout;
>  
> +static int mtk_wdt_start(struct watchdog_device *wdt_dev);
> +static int mtk_wdt_stop(struct watchdog_device *wdt_dev);
> +
>  struct mtk_wdt_dev {
>  	struct watchdog_device wdt_dev;
>  	void __iomem *wdt_base;
> @@ -148,6 +151,19 @@ static int toprgu_register_reset_controller(struct platform_device *pdev,
>  	return ret;
>  }
>  
> +static int mtk_wdt_init(struct watchdog_device *wdt_dev)
> +{
> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> +	void __iomem *wdt_base;
> +
> +	wdt_base = mtk_wdt->wdt_base;
> +
> +	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN)
> +		mtk_wdt_start(wdt_dev);
> +	else
> +		mtk_wdt_stop(wdt_dev);
> +}
> +
>  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>  			   unsigned long action, void *data)
>  {
> @@ -206,6 +222,8 @@ static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
>  	reg |= WDT_MODE_KEY;
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
> +	clear_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> +
>  	return 0;
>  }
>  
> @@ -225,6 +243,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
> +	set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> +
>  	return 0;
>  }
>  
> @@ -274,7 +294,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
>  
> -	mtk_wdt_stop(&mtk_wdt->wdt_dev);
> +	mtk_wdt_init(&mtk_wdt->wdt_dev);
>  
>  	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
>  	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
> 

