Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB273DB297
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 07:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhG3FJy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 01:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhG3FJy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 01:09:54 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522B8C061765;
        Thu, 29 Jul 2021 22:09:47 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so2156405ooq.9;
        Thu, 29 Jul 2021 22:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DtOXr89OzIUFPwE95nTmJSuToUjtwfHb2hL/EyTTeLc=;
        b=XY33TRonS6iaFY857RRIQ5xAHb5O7L8Jrt4fQzW+qvvevuzod7Xg8is59dM5ETkBJ4
         wYWWROpIyuB2L67wmNUMRY35h3FfSQeiVKCWaPWJcdc8/mvg4bF8W4iGiaGEvAvgKp0I
         6GjooQqaU07rJv//dEwa75a8mjLFg/xo2ybK/5lUnMfeOGAfglml4Fa2I1tQjqwc5V3B
         fUgF41r5dR96gDmnyiGArQGCFLH+dau1Dx3vHOZ4GZotNZXUDkKTs00VBtY6kKlTjavu
         Pz37oaj2IsjpSq3R9Y2i6Nwddl/6b6nu9y1QxwqYsxv1l6wRSOQzzq5400YFKQZjbsu8
         m4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=DtOXr89OzIUFPwE95nTmJSuToUjtwfHb2hL/EyTTeLc=;
        b=SJVW/Ejv3ai69Rq7D302F8uEeoGKPHfhn0dD3jPS+iY4KUuHyPH/54MuoV1rWxxpO9
         Mvyc+kDQ2Oy9tCpr2OjKz6y3D65ybnqvtA9TgkZmgiBmFIzlYfe0FCnkMYN/OojCNn4g
         oi0oTfmgDcWR+pNnkvkoTjKpycjIgeO9OVTW5Weox+rvgea5PIb7CkllK7EMiBLGgx3/
         /RSKFbIelRbR44919wVP9ggFWmdHxjTQvQqW0SlLtwTeclp6RQH0QWbVpGorpNMApKip
         p/7S8QG9BgRAqVvsbIWcqirctoOsmNT3rrZIESZD3gv3m0ptlB9i1bELGc7Jmc+AAPA8
         ZVnA==
X-Gm-Message-State: AOAM533+cAGXxbVgbdh3eUnWo/QI3LKGuJX78IzrckpujS0huE/WvSmt
        jJPLPa6tXsTkXUNu/0oPZbI=
X-Google-Smtp-Source: ABdhPJwfnmqbVIz/NnmIZ/LXSibJIG3tB+bMED54PtXcQRW60tZjj7o7wIbGMW91sxaKQT6whWsfFQ==
X-Received: by 2002:a4a:7b4b:: with SMTP id l72mr473141ooc.9.1627621786751;
        Thu, 29 Jul 2021 22:09:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q186sm127995oib.31.2021.07.29.22.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 22:09:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 29 Jul 2021 22:09:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [v5,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 head file
Message-ID: <20210730050944.GA2111694@roeck-us.net>
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-3-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628113730.26107-3-Christine.Zhu@mediatek.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jun 28, 2021 at 07:37:30PM +0800, Christine Zhu wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> 
> Add toprgu reset-controller head file for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  .../reset-controller/mt8195-resets.h          | 29 +++++++++++++++++++

There is another patch pending which moves the mtk reset controller
include files to another directory. See [1]. Maybe it would make
sense to use the same directory for this file ?

Thanks,
Guenter

>  1 file changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset-controller/mt8195-resets.h
> new file mode 100644
> index 000000000000..7ec27a64afc7
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8195-resets.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Crystal Guo <crystal.guo@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +
> +#define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> +#define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> +#define MT8195_TOPRGU_APU_SW_RST               2
> +#define MT8195_TOPRGU_INFRA_AO_GRST_SW_RST     6
> +#define MT8195_TOPRGU_MMSYS_SW_RST             7
> +#define MT8195_TOPRGU_MFG_SW_RST               8
> +#define MT8195_TOPRGU_VENC_SW_RST              9
> +#define MT8195_TOPRGU_VDEC_SW_RST              10
> +#define MT8195_TOPRGU_IMG_SW_RST               11
> +#define MT8195_TOPRGU_APMIXEDSYS_SW_RST        13
> +#define MT8195_TOPRGU_AUDIO_SW_RST             14
> +#define MT8195_TOPRGU_CAMSYS_SW_RST            15
> +#define MT8195_TOPRGU_EDPTX_SW_RST             16
> +#define MT8195_TOPRGU_ADSPSYS_SW_RST           21
> +#define MT8195_TOPRGU_DPTX_SW_RST              22
> +#define MT8195_TOPRGU_SPMI_MST_SW_RST          23
> +
> +#define MT8195_TOPRGU_SW_RST_NUM               16
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */

[1] https://patchwork.kernel.org/project/linux-watchdog/patch/20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid/

