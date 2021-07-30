Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B3A3DB291
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 07:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbhG3FE3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 01:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhG3FE2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 01:04:28 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8782BC061765;
        Thu, 29 Jul 2021 22:04:23 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 19-20020a9d08930000b02904b98d90c82cso8279147otf.5;
        Thu, 29 Jul 2021 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QTrn0BTsXb5eMFLfisWRaOsNj5krMHUX7c9uHRc9jpw=;
        b=aAxaP/IViquA7ehrAhDav0tANk4uxVifNZ+P8UqFltP6SsIESy5EISKdgqc3k6dv4g
         /pVU3Gn6+z7exw5GBFxglMt7KlC6d6f643qXBC2CYA8/+YyBHMPveSEGDg+9y0qZaDsy
         rkYs0+PxPVW9/6ahlvYFUouz9CvFe6zJI+BuYoEF0nNEj46STvsHCpSCdkA4Wg+kdgvd
         gJLHYMXgULbVTB0LJQupw+jxQkhP+ZebH1iBda0sCkIb3oL4MO1Ef8Ogbt9m+jA3RQo1
         weMbiYxIzqrNE9SYbARDh+lKHTyz7vRt7J+kxrqm05VPKA53cVKiUWTFAn8VKjBMqCJA
         o/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=QTrn0BTsXb5eMFLfisWRaOsNj5krMHUX7c9uHRc9jpw=;
        b=QRdWyGsIz4K4r5f/AJm2Y10H7rUMkWfVwnoRn3z/SQGEe8kSM5ZrjUpIPX6ZtHUdt3
         otJcjBJQkAy6fTsmJJd2vlygCLkxl6AnNp2f/kiDByRGppx1ovWYqqkqEkQdYtdDojYM
         xiKFVpiEBdy/XIU4XJVZhhh8APG8Is5mzlMa+/n5ZWr1XDYeyzdjd/ASZ0st8r24dGPk
         it6gXfpjQZheN2vkd1/7suCqa0ID1VoV6ohdG+oVWwSF+zZS4yCpkewoRMhrHmTFGHsI
         HEpbrqpHCKF7Hm1eX8HsAEKbMq5vCow9wxiZUbMNf+h9wfkQopZ9iorY2hYYax+Ohn+P
         3xxw==
X-Gm-Message-State: AOAM5319r96lXG1N8oY5Erm5AplcdXlxlb/OWcDcZ3m7MYdCWiAuDdxU
        rb3bjx8YeV2rNtBrRFFzbaD66DybIPs=
X-Google-Smtp-Source: ABdhPJxtkR1AJp0+RjTnXagyAGwmGRYMZKxnIR6Nd/brnDD+iRSYcNYylRu/2ugWeLTWy9Nnh1lrtQ==
X-Received: by 2002:a05:6830:4b0:: with SMTP id l16mr686993otd.97.1627621462965;
        Thu, 29 Jul 2021 22:04:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w190sm126274oif.17.2021.07.29.22.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 22:04:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 29 Jul 2021 22:04:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org,
        hsinyi@chromium.org, kernel@collabora.com, drinkcat@chromium.org,
        eizan@chromium.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, jitao.shi@mediatek.com,
        Crystal Guo <crystal.guo@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/7] arm64: dts: mediatek: Move reset controller
 constants into common location
Message-ID: <20210730050421.GA2111504@roeck-us.net>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 14, 2021 at 12:11:35PM +0200, Enric Balletbo i Serra wrote:
> The DT binding includes for reset controllers are located in
> include/dt-bindings/reset/. Move the Mediatek reset constants in there.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

For the watchdog part:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v2:
> - Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi                    | 2 +-
>  drivers/watchdog/mtk_wdt.c                                  | 6 +++---
>  .../dt-bindings/{reset-controller => reset}/mt2712-resets.h | 0
>  .../dt-bindings/{reset-controller => reset}/mt8183-resets.h | 0
>  .../dt-bindings/{reset-controller => reset}/mt8192-resets.h | 0
>  5 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
>  rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (100%)
>  rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 96473d88f391..4ef0b5b23047 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -11,7 +11,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/memory/mt8183-larb-port.h>
>  #include <dt-bindings/power/mt8183-power.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/reset/mt8183-resets.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/thermal/thermal.h>
>  #include "mt8183-pinfunc.h"
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 16b6aff324a7..6986bc740465 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,9 +9,9 @@
>   * Based on sunxi_wdt.c
>   */
>  
> -#include <dt-bindings/reset-controller/mt2712-resets.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
> -#include <dt-bindings/reset-controller/mt8192-resets.h>
> +#include <dt-bindings/reset/mt2712-resets.h>
> +#include <dt-bindings/reset/mt8183-resets.h>
> +#include <dt-bindings/reset/mt8192-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset/mt2712-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt2712-resets.h
> rename to include/dt-bindings/reset/mt2712-resets.h
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8183-resets.h
> rename to include/dt-bindings/reset/mt8183-resets.h
> diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8192-resets.h
> rename to include/dt-bindings/reset/mt8192-resets.h
