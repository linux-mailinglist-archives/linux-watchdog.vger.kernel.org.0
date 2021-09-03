Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980E74000F5
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 16:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243643AbhICOGG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 10:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235414AbhICOGF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 10:06:05 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E07C061575;
        Fri,  3 Sep 2021 07:05:05 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id c79so6981997oib.11;
        Fri, 03 Sep 2021 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=keqb0lLG5bXN4lNVT0FHbMoFuC2nxIHsD31TOnQa8pE=;
        b=D/exd8GSx7b96axCyEL+kndKDPAoWoF2EW7JzlK3Kwaq5cV9LvGcjUVLzcL0Nbk3TL
         Gf0mbr8DlQzVlErDpV+Jbv7NAY/w5hnIb+co+MmIALkL9p1v8X/Nai79r7lfzq/q9SEz
         WW0U/cWl43Rwyu4zWx2eR1rLTz8DJDUyk2eqDEmwK1K7IfYvPl9JXYFPWDUE1z00i4Mq
         JMIkIfbndXmnFX5U+Oml9LDbU0UUj4HFZ8uHdjxf1ABGJ1CEisK7huMqmwcClHLX3wFC
         xr2cFtE6BKWJbQYxrDLm6frklIff40brosW1o33eoX21zG3pLRygcOtmhCw3RVqu/ZMX
         JEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=keqb0lLG5bXN4lNVT0FHbMoFuC2nxIHsD31TOnQa8pE=;
        b=Y3aYoXgU+4YpOO7B5sUKFEcb1wDY08DS1yl6Dav3PUwWBHxhR1NuUA24xv1sNAVOxZ
         if1zcrSANnCX8WBvyQ5AxvejbBT/rTfXJqiHD29SneWbNnmZ5QiVDbqOY4x425ziEaON
         FXx6A7zN0MCp8MuFZ7/UuD4hRXRiVBVaYjXGu/d5QGNA4EY9jh/c4TglviAiB4HyGopf
         bD8U0uP5ZeYcCXgEDdxaouCWXbgd8RV+0zwEW4IZKdapgFSElCH2r6xRFhdwqPGau7K2
         pkQ8JVlRzBgYObJU8pUhcKmplqS/G7lCL0WmodcotB90oruwrJ4lj+BvaoJMKoP7dYZO
         Z3rw==
X-Gm-Message-State: AOAM531QFiP/JB6AT7APRi/fQoaaftXGfAf+qYeXsbWvOeyP+i7rzjbM
        /eAdyToSI+Osn1EKyU5/kXM=
X-Google-Smtp-Source: ABdhPJx+IRaT9B0hadGHsVNpszS4tQ96KiHprfMCwOHX8K8ad0EU8MWknjv6YjI6IB5Pay70Mpr8CQ==
X-Received: by 2002:aca:aa88:: with SMTP id t130mr2885592oie.3.1630677905257;
        Fri, 03 Sep 2021 07:05:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f126sm1063872oob.9.2021.09.03.07.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 07:05:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [v2,1/2] watchdog: mtk: add disable_wdt_extrst support
To:     Fengquan Chen <Fengquan.Chen@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     tinghan.shen@mediatek.com, randy.wu@mediatek.com,
        rex-bc.chen@mediatek.com, christine.zhu@mediatek.com,
        joe.yang@mediatek.com, zhishuang.zhang@mediatek.com
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
 <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <65cc931f-ba49-19b5-ce25-c49f7b984cec@roeck-us.net>
Date:   Fri, 3 Sep 2021 07:05:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/2/21 11:16 PM, Fengquan Chen wrote:
> In some cases, we may need watchdog just to trigger an
> internal soc reset without sending any output signal.
> 
> Provide a disable_wdt_extrst parameter for configuration.
> We can disable or enable it just by configuring dts.
> 
> Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>

Nit: You should set up git such that it uses "Fengquan Chen", not
"fengquan.chen".

Other than that, for my reference,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

We'll have to wait for dt property approval before we can apply the patch.

Thanks,
Guenter

> ---
>   drivers/watchdog/mtk_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993bd009..276b6cb7d225 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -63,6 +63,7 @@ struct mtk_wdt_dev {
>   	void __iomem *wdt_base;
>   	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>   	struct reset_controller_dev rcdev;
> +	bool disable_wdt_extrst;
>   };
>   
>   struct mtk_wdt_data {
> @@ -240,6 +241,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>   
>   	reg = ioread32(wdt_base + WDT_MODE);
>   	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	if (mtk_wdt->disable_wdt_extrst)
> +		reg &= ~WDT_MODE_EXRST_EN;
>   	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>   	iowrite32(reg, wdt_base + WDT_MODE);
>   
> @@ -309,6 +312,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   		if (err)
>   			return err;
>   	}
> +
> +	mtk_wdt->disable_wdt_extrst =
> +		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
> +
>   	return 0;
>   }
>   
> 

