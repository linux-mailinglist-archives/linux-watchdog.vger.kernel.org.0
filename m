Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F78012FE9D
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jan 2020 23:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgACWM7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jan 2020 17:12:59 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:41935 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728549AbgACWM7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jan 2020 17:12:59 -0500
Received: by mail-io1-f65.google.com with SMTP id c16so39281649ioo.8
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Jan 2020 14:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DgfHDc2ugqDl3Ojv+ZQfPSfnGXvjjxOAehbizu1AkF0=;
        b=lq/3qZ/ef5Jrlevp6mX3ggW/4zazd3xQ87np0J8eDrYdW70gVUoHPHhcp0/aohQoQ8
         kcPn2uSGsgF0jS1DzA8y7icQHe8jzBYiOHbqJWd1vOMykOOGtXxh54YTEy6C+rqljb4T
         5vhqlnXoq/2sLODvcVlhtj+Pv1Pvt3OlK/XEZi4W1eI7LXas+5iHkv1AZ9xqI3UceNWJ
         1c2l7Aotd0MYbJmlCuyeolGxdFCW33JtMWvdhbUuRQvGC6Rfbc5qvdfXAW32Uzlz2IJ4
         /q6dZoZENzkcxBB5324pMfMPAxJCWliRVg0hd6IjbE66TMVn4VFTuP1AZ/kNtUgU8Szq
         BjMw==
X-Gm-Message-State: APjAAAX35y+QQJEBBBZ0Xt1q4cH+A3S7A/VFFkDjyQVTHmrQOP70jdd3
        TnezjKIQMNlJ2QLqnzYwGYFPwh8=
X-Google-Smtp-Source: APXvYqzpVxR/TsEnyariwF+GMiZjzTs/hA2z/JGF1jw1TbMgii/5P2YttHJ0lgSPD5eu9RYeCYtzUw==
X-Received: by 2002:a5d:964e:: with SMTP id d14mr58961614ios.193.1578089578011;
        Fri, 03 Jan 2020 14:12:58 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id f7sm15086421ioo.27.2020.01.03.14.12.55
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:12:56 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:12:55 -0700
Date:   Fri, 3 Jan 2020 15:12:55 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     yong.liang@mediatek.com, wim@linux-watchdog.org,
        linux@roeck-us.net, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        yingjoe.chen@mediatek.com, sboyd@kernel.org
Subject: Re: [PATCH 1/2] [PATCH v8 1/2] dt-bindings: mediatek: mt8183: Add
 #reset-cells
Message-ID: <20200103221255.GA1427@bogus>
References: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jan 03, 2020 at 05:37:24PM +0800, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Change-Id: If3f4f0170d417819facff1fd0a0e5e3c6cc9944d

Drop this.

> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h

What happened to the binding doc change?

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
>  #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
>  #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
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
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> -- 
> 2.18.0
