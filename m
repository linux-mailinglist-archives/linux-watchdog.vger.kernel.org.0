Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C237C130C08
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2020 03:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgAFCWj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Jan 2020 21:22:39 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32884 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgAFCWi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Jan 2020 21:22:38 -0500
Received: by mail-pf1-f194.google.com with SMTP id z16so26256055pfk.0;
        Sun, 05 Jan 2020 18:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ipcsI+jZ4hrMnV7t9N2jVs66amx0u2G0uIwSlpjDd4Y=;
        b=lPDci3wOl0yBaSZhnSt8JF1e1tCFoPAb4SE1gSvn6yb8TH4Qf2eBJIevhzA4jJ9kQT
         jXw8T+0T3DMv9vCc2d3KtMCh0cO0Fh3AtQ1mQp9HnN/WUU9k/IdOqfebWK3ki2Q8kU9A
         0vSiiZnGpAU22FAwvbSz30yaL+XhXV/sC2lPOgMXd/5FUrKk2Rv2WM/IE6luBBwj6F/Z
         7T7Q8MrIX9nWS6DUTuRfhnWMeVdWUdb8jFSOYhvdy+lFddRukrLhwFNVoj+Cbm+s5OSp
         8RzUEI23DO/jQmdHBuFs7xSyPCkTupn1Z1TeuBWqkz7VO3ghWsUkOECPzQHZlnUQi9cb
         Ar6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ipcsI+jZ4hrMnV7t9N2jVs66amx0u2G0uIwSlpjDd4Y=;
        b=HYv1hBLq10RYm2LWE5rZh2CihTyn0dCuifN/4m5rriCzvsdPs1eRK1yF6jAbEZipeb
         J35sXVaggq6/6xxE57zbkveSU/HrLDbiL2ybwyda4DfdiqbMoYSTg0hW5ibTq/vUJKjC
         0qhm5on26KYeiywb02pLa5vyQ8Eav059sCTJQaxN8j+9SJBy87VEgYIK35L4u4cfUPZW
         DWcHbZy6nHjXGRzI3Crx9F3R93HXCwhEEcpx5G230ugIuXlM0Yo1Nx+G6FjPpRcwaqtx
         MK4GD13UflYdNBUnNiV0YRYnAAwS1OqTlu7bLmGNhPpKgm9sijmFtRnVolh2BpOsGN31
         kDGg==
X-Gm-Message-State: APjAAAU5hNmAx2PiOr+GerKwvz10AvPG7/ELu7unEdi9YKAQLeBDZeac
        K1IyAA7cZ+IUabnUfve/BtQ=
X-Google-Smtp-Source: APXvYqz1BDCSkSXVrUu4zC2a82wSvLK/YKFS/9RPAe5p+u2Z0wTdw9lddOQIFWy8lwM33vK+qK2FoA==
X-Received: by 2002:a62:e509:: with SMTP id n9mr4122196pff.159.1578277358154;
        Sun, 05 Jan 2020 18:22:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q22sm77320323pfg.170.2020.01.05.18.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2020 18:22:37 -0800 (PST)
Subject: Re: [PATCH v9 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>, yong.liang@mediatek.com,
        wim@linux-watchdog.org, p.zabel@pengutronix.de,
        matthias.bgg@gmail.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com
Cc:     yingjoe.chen@mediatek.com, sboyd@kernel.org
References: <1578241301-14618-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578241301-14618-2-git-send-email-jiaxin.yu@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <04f9dbd7-4d96-cdbf-0bb2-9c34e8d84dc9@roeck-us.net>
Date:   Sun, 5 Jan 2020 18:22:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578241301-14618-2-git-send-email-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/5/20 8:21 AM, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
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

Repeating Rob's question from v8: What happened to the bindings document ?

Guenter

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

