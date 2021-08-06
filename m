Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AD23E2DE0
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Aug 2021 17:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244725AbhHFPoT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Aug 2021 11:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238790AbhHFPoR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Aug 2021 11:44:17 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26309C0613CF;
        Fri,  6 Aug 2021 08:44:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j2so11597221wrx.9;
        Fri, 06 Aug 2021 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lkzuyoF6aGI8g1BoWufFJUHe7Pqn5XucH2j121GW1Yg=;
        b=Bj9YVQtN35HUg6TZ+1yrDwAgRyR0bn6f9bgwu/c4EVWuQqf54iTZV9WvUx+4cbbbzz
         7vq90gXXqhbQUPEJGROfHymNKJDxjaXC/rRem6FuE9R1MtWZ2DT1huf4h47BjQprlcEm
         2n2yaVvt70bcc8QSY5VKQDEYFdd7YtP4Iin2/xQrQschAXerSZ+iBUY/pYLf8o5gwuwY
         WFm/zzqIbcUr96VCneFwru8v+5gs2EOSg6cI8uD9znyYU04JDB9112HfZN0/PU5LBXwW
         xuO15kq7FS3NuEZkKCPaEn6Dzr4uRdN2jPtJZLSdgZAV5+ZuVXcwn2xwyJlcNcpb9e92
         jJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lkzuyoF6aGI8g1BoWufFJUHe7Pqn5XucH2j121GW1Yg=;
        b=NhXvt+tYn0N1bzEoDXFz91Msav0zHyNiDyAkkPf7gaqu2Tlb0LM+/NYnr1yqyvLZrH
         FcslJ0SLMPl0CjLvcK13v3UNKe+90aQiwZbuxxKDdCpzzGBEU7pJx2U5Cc/+u4Y6i7Wo
         Bj2Xvf0qX28bmQlpu9ZFXKED11bEriMkC2XwOAbj2JOlGbhWvmD01/dVAusY+ipvVikn
         quzSfnjHKt877Ey7z8Ah2dKX7MRGw5pkpTI/VntcqVoA4gNhAHQGOMOkP++7hQ1nRCVP
         mYlCKAFynLq0oRsC+KCTEvyK1j+t8I6eZfle+sZ8zbMLqLD/dbgIfYaorY1t5BpeKpQ3
         4xAQ==
X-Gm-Message-State: AOAM530IvLLBskXaWMF3b/XGfN+VxgfYprtHciJIPTA3ud6YmYXT0kJ/
        xNGC52THR1lzTGobsxJIHzHRGXSeNqddng==
X-Google-Smtp-Source: ABdhPJwRsfyU547wFy5xYaSGn+gLcZuco/fmozMzfLLFtstM87IX9OcGkO1bFKMQdn1V15THbr2FGQ==
X-Received: by 2002:a05:6000:2c6:: with SMTP id o6mr11468990wry.241.1628264638788;
        Fri, 06 Aug 2021 08:43:58 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net. [89.6.132.55])
        by smtp.gmail.com with ESMTPSA id i5sm9887467wrs.85.2021.08.06.08.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 08:43:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] arm64: dts: mediatek: Move reset controller
 constants into common location
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org
Cc:     chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
        drinkcat@chromium.org, eizan@chromium.org,
        linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
        Crystal Guo <crystal.guo@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1127dad2-4ee9-4e22-fb15-8412ac59a394@gmail.com>
Date:   Fri, 6 Aug 2021 17:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 14/07/2021 12:11, Enric Balletbo i Serra wrote:
> The DT binding includes for reset controllers are located in
> include/dt-bindings/reset/. Move the Mediatek reset constants in there.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

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
> 
