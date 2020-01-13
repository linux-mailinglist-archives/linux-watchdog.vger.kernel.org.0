Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4579138BA8
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2020 07:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgAMGKj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jan 2020 01:10:39 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:43016 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgAMGKj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jan 2020 01:10:39 -0500
Received: by mail-qv1-f66.google.com with SMTP id p2so3528110qvo.10
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Jan 2020 22:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7DfRwJTOPvTtWVkT74WE0+0Wv9fnsKAGouTb1Izq89A=;
        b=Qatwxt+OoQ71OqIjEakHG18BOGUTpja+9P/RSKDnHwYK9mlMKhnsjaJ4Qe78pwcKjA
         EUHvEFOX4TtEYQGZXQ0Nrtq2IaqhIOos4xgXVC9FNe4Vmd1R/eL/TNIr1ZBdkzqw+QC4
         hkfY5cWW6CUPnnIq7Y57SsJYESMlI6UHhEQ5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DfRwJTOPvTtWVkT74WE0+0Wv9fnsKAGouTb1Izq89A=;
        b=RXiMxIPeCLmohWY66bxyDmKeyxxs3rCwCfc3N9aAg4UBAPq/wjbGrdguoVCWmrzo/7
         BDxyPw8hyh0OGYA7N6G/wA02Pdghz/698Lrjlqy2WmdALWAMa3NWRtbWlcNKyZp0bJ2r
         oJaSbdH3BxWrVq1AyEmU7kBXsjifl/AAnyWB5cVEDQsOZ0Ky1uqu44pasJvt/oSe1nvJ
         QlYRRTYce5uOMIA/N+rXSda8RQBFOAsHudonbCuNmT+00f3mX9Th+AWGkuR3iuZBhfCq
         F/qAtUvb+D0rOGNVSk3PKYw2PM4EnlDUEpIhN+2JaCHa0m8lLFvZJHowZo7DYKkU3ZGb
         +UKw==
X-Gm-Message-State: APjAAAUjEMgo2AwEwLJ0c3ALH4mdZnSZG4hcKvTT6eZkBkASqf7/WdX5
        tQu6/b6NLXJTYkUoGYtZsuep8R9jNPJHqva0mSyh6A==
X-Google-Smtp-Source: APXvYqzNnf0+5zf15VXfHELZbqC0F4Qy+EwQSLKu7IESG3soghZ70PDiWBmTa+q/Q8H2Xj5h4riou90hhvsdIXG1nTo=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr14287635qvn.6.1578895837978;
 Sun, 12 Jan 2020 22:10:37 -0800 (PST)
MIME-Version: 1.0
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com> <1578639862-14480-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1578639862-14480-2-git-send-email-jiaxin.yu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 13 Jan 2020 14:10:27 +0800
Message-ID: <CANMq1KBNuJDEn57d0ysc2XG0ezWEvJ2Pm88YihDiSZJ=-E=W9g@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: mediatek: mt8183: Add #reset-cells
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     Yong Liang <yong.liang@mediatek.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Jiaxin,

On Fri, Jan 10, 2020 at 3:04 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add #reset-cells property and update example
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <groeck7@gmail.com>

From previous feedback
(https://patchwork.kernel.org/patch/11318687/#23086211), it seems like
we lost track of which exact version had the Reviewed-By, so I'd just
drop all those tags and let people review again.

> ---

It would have been nice to mention that this patch depends on
https://patchwork.kernel.org/patch/11311241/ (as your example makes
use of it below).

>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
>
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 92181b648f52..5a76ac262f8d 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,6 +4,7 @@ Required properties:
>
>  - compatible should contain:
>         "mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> +       "mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712

Please separate this as another patch.

>         "mediatek,mt6589-wdt": for MT6589
>         "mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>         "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> @@ -14,11 +15,14 @@ Required properties:
>
>  Optional properties:
>  - timeout-sec: contains the watchdog timeout in seconds.
> +- #reset-cells: Should be 1.
>
>  Example:
>
> -wdt: watchdog@10000000 {
> -       compatible = "mediatek,mt6589-wdt";
> -       reg = <0x10000000 0x18>;
> +watchdog: watchdog@10007000 {
> +       compatible = "mediatek,mt8183-wdt",
> +                    "mediatek,mt6589-wdt";
> +       reg = <0 0x10007000 0 0x100>;
>         timeout-sec = <10>;
> +       #reset-cells = <1>;
>  };
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
> +#define MT2712_TOPRGU_INFRA_SW_RST                             0
> +#define MT2712_TOPRGU_MM_SW_RST                                        1
> +#define MT2712_TOPRGU_MFG_SW_RST                               2
> +#define MT2712_TOPRGU_VENC_SW_RST                              3
> +#define MT2712_TOPRGU_VDEC_SW_RST                              4
> +#define MT2712_TOPRGU_IMG_SW_RST                               5
> +#define MT2712_TOPRGU_INFRA_AO_SW_RST                          8
> +#define MT2712_TOPRGU_USB_SW_RST                               9
> +#define MT2712_TOPRGU_APMIXED_SW_RST                           10
> +
> +#define MT2712_TOPRGU_SW_RST_NUM                               11
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> index 8804e34ebdd4..a1bbd41e0d12 100644
> --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -78,4 +78,21 @@
>  #define MT8183_INFRACFG_AO_I2C7_SW_RST                         126
>  #define MT8183_INFRACFG_AO_I2C8_SW_RST                         127
>
> +#define MT8183_INFRACFG_SW_RST_NUM                             128
> +
> +#define MT8183_TOPRGU_MM_SW_RST                                        1
> +#define MT8183_TOPRGU_MFG_SW_RST                               2
> +#define MT8183_TOPRGU_VENC_SW_RST                              3
> +#define MT8183_TOPRGU_VDEC_SW_RST                              4
> +#define MT8183_TOPRGU_IMG_SW_RST                               5
> +#define MT8183_TOPRGU_MD_SW_RST                                        7
> +#define MT8183_TOPRGU_CONN_SW_RST                              9
> +#define MT8183_TOPRGU_CONN_MCU_SW_RST                          12
> +#define MT8183_TOPRGU_IPU0_SW_RST                              14
> +#define MT8183_TOPRGU_IPU1_SW_RST                              15
> +#define MT8183_TOPRGU_AUDIO_SW_RST                             17
> +#define MT8183_TOPRGU_CAMSYS_SW_RST                            18
> +
> +#define MT8183_TOPRGU_SW_RST_NUM                               19
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> --
> 2.18.0
