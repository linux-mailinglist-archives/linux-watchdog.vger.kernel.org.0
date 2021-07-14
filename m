Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E5C3C7B3D
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jul 2021 03:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237384AbhGNCBp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Jul 2021 22:01:45 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:35616 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237371AbhGNCBo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Jul 2021 22:01:44 -0400
Received: by mail-io1-f45.google.com with SMTP id d9so141680ioo.2;
        Tue, 13 Jul 2021 18:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uOqifUzkRaN6450fZqsUf49bx6RwvzQf56ULmH/5myE=;
        b=YtiwivXmMbHBdnuJMfDV5rbcChzYBxr3zNvM2qFuUwQ86Ff7ceTwCi9MaSf4MKuyFF
         xmUyglnrfJuK2RQh46FDHhcp46uN6+uv0eT3F0FMbrgoXSahbLqYtdYFOldsBESVtIlt
         4c9z+0W9/7v4wBz8eZgcsSk12OUuNymV8AbPvVWXYWL+aKydOXhN5MfSmNaOMDnihGRf
         uHlM79njxk77c+shJsysaZBnXeX932BIlTMZkXrNiu8qv9K+63EFFxN2VUZgQ6huJlJ8
         1GRNu6ipTUN4iKbpiQ4V6d3oxlo4WTNGOPTRpKSDxuBQqSYDUK7nTalI8UhbBsFPP1g1
         QZNA==
X-Gm-Message-State: AOAM533Np/aWeEAWpKanDUvAOQSjxQSIPmszZ4mRSw1pxDrcbqD+5ZVy
        duULHgOUbUK6pP+RoHN5YA==
X-Google-Smtp-Source: ABdhPJyT8TYsSlaL+L00/kHbPjyHO8V/A9ECsVjD8XtNKMYIt96lMs9INqqlpooOnhrZOVYrOX4MKA==
X-Received: by 2002:a05:6602:25da:: with SMTP id d26mr5426788iop.106.1626227933715;
        Tue, 13 Jul 2021 18:58:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r6sm443341ilh.35.2021.07.13.18.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 18:58:53 -0700 (PDT)
Received: (nullmailer pid 1286017 invoked by uid 1000);
        Wed, 14 Jul 2021 01:58:49 -0000
Date:   Tue, 13 Jul 2021 19:58:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, matthias.bgg@gmail.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
Subject: Re: [v5,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 head file
Message-ID: <20210714015849.GA1283155@robh.at.kernel.org>
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

s/head/header/

And the subject too.

> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  .../reset-controller/mt8195-resets.h          | 29 +++++++++++++++++++
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

Dual license please.

> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Crystal Guo <crystal.guo@mediatek.com>

According to the S-o-b and patch author, you are the author.

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
> 
