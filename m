Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E1D3D381B
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Jul 2021 11:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhGWJN4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Jul 2021 05:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbhGWJN4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Jul 2021 05:13:56 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121CDC061575;
        Fri, 23 Jul 2021 02:54:29 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id a5-20020a05683012c5b029036edcf8f9a6so1535801otq.3;
        Fri, 23 Jul 2021 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5bndOuFZX3tiZBmJcO1TQjXh09mw6xwzbGzrURFBWw4=;
        b=OGfwqkbgF1tjhCLbVtickH2E5YJ3FaptPyEUgsChnGfDKEBnyvoSezdKA08OFY/F9c
         rnOABX6HJpFy1iy5XWYvOHQXHpR5S5WBN0/+oVqx35WiYg1MUFgfNk0m0D6+VIY3SSos
         kzmPvUG27pefM37stoDT3uvKdNrkiMq2WLBAu5JODSYGvvIW2k6jVEYFP4X6bI7bfjtH
         hCZota0zxq5/f74ziFvEGFvn99uZG0f/3SZxR5Km01OVzidzLKA80EPiL8uKojcbrvLr
         EdpZq2kZmtFgihZDfeqrTm17jXPJxZzxHubLCLycZFN0bz+1+19PtTzvYp7GzeqZ2OY9
         8Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5bndOuFZX3tiZBmJcO1TQjXh09mw6xwzbGzrURFBWw4=;
        b=sEsi7GM8OveFEzL63Np8+/dWXmy+tiqiJAFv3Sh8H8NqVTbbrKKLP3mDdPO/V0RZOA
         61ezZwGCUZJZbpTt2TDNtLIPVP8gXOV8RnHbn2yElvp0TcG3eaP9PqIt4cyex3McvFP7
         nPkK5TgaSoiYFxMTo3xx+hLdp9m894F1AQLQD3AQ+9YGDOlmEh4kWJ/5XT799CxsCMBp
         QzQGEIL+mnJc0eUZ8Jz1/RSlXm6UzSaBn1dhU8aukJx1xVYu2x0ZEwQOoJVYKSroczUJ
         oFWhc5xq/TuLhGjK9nVN3cP18ieb0z40O5mm4cDbf4ceXNJes1pc2Y6rpWSb1aIf+xTq
         EQqg==
X-Gm-Message-State: AOAM531O2fcFBOL1qKsdFjP24WfT8xQepjoUPIAAZyb0Qn4AIjMLWDMG
        6q+fmaOZJZUu4mtpPzhxNUblK4d80jRi03OFVDo=
X-Google-Smtp-Source: ABdhPJxyIuiIK8mtbPFlozBKzC68z5rXhaTfJeXWaPyq8oeJQuai1UiBZzvI0z3m1KDj7fGWx3TOJsb2yM7a6bwcV7U=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr2525083otb.281.1627034068504;
 Fri, 23 Jul 2021 02:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210723094138.24793-1-Christine.Zhu@mediatek.com> <20210723094138.24793-3-Christine.Zhu@mediatek.com>
In-Reply-To: <20210723094138.24793-3-Christine.Zhu@mediatek.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Fri, 23 Jul 2021 11:54:17 +0200
Message-ID: <CAFqH_539HesXQZz5F3mNXveHvHUjKTTBOkpZxmEf_BBOODHZcQ@mail.gmail.com>
Subject: Re: [v6,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 header file
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Rex-BC Chen <Rex-BC.Chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Christine,

Thank you for your patch.

Missatge de Christine Zhu <Christine.Zhu@mediatek.com> del dia dv., 23
de jul. 2021 a les 11:45:
>
> Add toprgu reset-controller header file for MT8195 platform
>
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  .../reset-controller/mt8195-resets.h          | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h
>
> diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset-controller/mt8195-resets.h

The DT binding includes for reset controllers are located in
`include/dt-bindings/reset/` Move the Mediatek reset constants there
instead of the `reset-controller`directory. We're doing this also for
current files that are there, see [1]

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid/

> new file mode 100644
> index 000000000000..8176a3e5063f
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8195-resets.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * This file is provided under a dual BSD/GPLv2 license.  When using or
> + * redistributing this file, you may do so under either licens

This is implicit in the SPDX-License-Identifier, so you can remove
these two lines.

Thanks,
  Enric

> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Christine Zhu <christine.zhu@mediatek.com>
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
> --
> 2.18.0
>
