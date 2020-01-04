Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BED01303AD
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Jan 2020 17:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgADQ4w (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Jan 2020 11:56:52 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37632 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgADQ4w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Jan 2020 11:56:52 -0500
Received: by mail-pj1-f65.google.com with SMTP id m13so5963796pjb.2;
        Sat, 04 Jan 2020 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9Y8nVeWGgj2uUKifSXncV7kkGBqBgYJeiJmGWBRSYbQ=;
        b=cfPnMBLK1wOt5+DsZJASYMhu232nGiIYRrX75rh23EBpvzERRLn3ouMulKdjJmpot5
         0H2a/saVe4VJ7vfWY80ApCYpAPAxpbmi4LqKRbUYtb71dvJxtRIHCNWLnFQzKvGNdF8l
         7h9F7rN506+wtIBOOA8UtR78HufdklH7n3vMV7Vy2s++qFZlF9KJQHtu9TLMkKvOdpsW
         6pvTFwQgHFHv0EfPKnUa/4O3sY7CRPmFVU3BGXtyChDgkLTZbwKvhCsF2hegr+H3lIez
         yg9AnPQz0BL4DuyulOYIV5DBRXyKj3rdkkANCFO7IyBT0BQbXTMYYShc0hr3/o4+hhpf
         2MHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9Y8nVeWGgj2uUKifSXncV7kkGBqBgYJeiJmGWBRSYbQ=;
        b=V4TjDpdguy1caXThk3ycb4qiRdQZHDwkhA+IP4g+nPI30AZPaELJzflvP8A2EP20Vt
         xiGr4CJOsLtNJLOOcZwD1xrLg1eBQh/XjP1nlAmfShdOPM91KI6pHW7CiGCmwVW6rChv
         0UeBVCATJiGcXnqubXjVydmdpd7d3ir2Hwsx5yLz4urOy2hCXB1pe47Uon4uwvqitMoT
         UTg4XF2VLLVB1lPDnc9XER8GQZWVafPJMygz1y4dx7cVg9MKrp+Y+q/xxbsa01V+c5eE
         tYgf3+1bgVB6EEg+IVhGhFcxrlpu78OXsZuqBDXUacYlrlW/19oJzf50HWmHC1OSpmHj
         o+8A==
X-Gm-Message-State: APjAAAVqLxoyzFFyoxbuuWi35rT7SQWyUKeN2pyeRN4LSBLt34SUniUj
        vzsUz/JQu7SWPQkQh84NKIw=
X-Google-Smtp-Source: APXvYqypji4ySRrO2P1UJKiwiNe24+N7reVangsvdU/0ECpr7r7RQGeh7TYaOphnoWP5PiBsEp8cjQ==
X-Received: by 2002:a17:90a:26ab:: with SMTP id m40mr34056119pje.42.1578157012007;
        Sat, 04 Jan 2020 08:56:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g67sm70518134pfb.66.2020.01.04.08.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2020 08:56:51 -0800 (PST)
Subject: Re: [PATCH 1/2] [PATCH v8 1/2] dt-bindings: mediatek: mt8183: Add
 #reset-cells
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>, yong.liang@mediatek.com,
        wim@linux-watchdog.org, p.zabel@pengutronix.de,
        matthias.bgg@gmail.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com
Cc:     yingjoe.chen@mediatek.com, sboyd@kernel.org
References: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8bed8f3e-7a20-2d34-9a33-805c707ff410@roeck-us.net>
Date:   Sat, 4 Jan 2020 08:56:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/3/20 1:37 AM, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Change-Id: If3f4f0170d417819facff1fd0a0e5e3c6cc9944d

No Change-Id in upstream kernel code, please.

Guenter

> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>   .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>   2 files changed, 39 insertions(+)
>   create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset-controller/mt2712-resets.h
> new file mode 100644
> index 000000000000..9e7ee762f076
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt2712-resets.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Yong Liang <yong.liang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +
> +#define MT2712_TOPRGU_INFRA_SW_RST				0
> +#define MT2712_TOPRGU_MM_SW_RST					1
> +#define MT2712_TOPRGU_MFG_SW_RST				2
> +#define MT2712_TOPRGU_VENC_SW_RST				3
> +#define MT2712_TOPRGU_VDEC_SW_RST				4
> +#define MT2712_TOPRGU_IMG_SW_RST				5
> +#define MT2712_TOPRGU_INFRA_AO_SW_RST				8
> +#define MT2712_TOPRGU_USB_SW_RST				9
> +#define MT2712_TOPRGU_APMIXED_SW_RST				10
> +
> +#define MT2712_TOPRGU_SW_RST_NUM				11
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> index 8804e34ebdd4..a1bbd41e0d12 100644
> --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -78,4 +78,21 @@
>   #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
>   #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
>   
> +#define MT8183_INFRACFG_SW_RST_NUM				128
> +
> +#define MT8183_TOPRGU_MM_SW_RST					1
> +#define MT8183_TOPRGU_MFG_SW_RST				2
> +#define MT8183_TOPRGU_VENC_SW_RST				3
> +#define MT8183_TOPRGU_VDEC_SW_RST				4
> +#define MT8183_TOPRGU_IMG_SW_RST				5
> +#define MT8183_TOPRGU_MD_SW_RST					7
> +#define MT8183_TOPRGU_CONN_SW_RST				9
> +#define MT8183_TOPRGU_CONN_MCU_SW_RST				12
> +#define MT8183_TOPRGU_IPU0_SW_RST				14
> +#define MT8183_TOPRGU_IPU1_SW_RST				15
> +#define MT8183_TOPRGU_AUDIO_SW_RST				17
> +#define MT8183_TOPRGU_CAMSYS_SW_RST				18
> +
> +#define MT8183_TOPRGU_SW_RST_NUM				19
> +
>   #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> 

