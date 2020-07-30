Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6FE232F27
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 11:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgG3JEZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 05:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgG3JEY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 05:04:24 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469DEC061794;
        Thu, 30 Jul 2020 02:04:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id f18so24152344wrs.0;
        Thu, 30 Jul 2020 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aKPCuC6cV43Gz6CZUTrsJDoMfLLgLsLNYcX4uUjXR/s=;
        b=Js2quz4Jzwla5NQlEGwmNRMBAtglE93LczVztFTcGQCzuwX++Gfwu6qOBu/i2U+u+6
         JlXo/o7WF57lbHeh7LgYSFQz9CRKXjyu6CuAaQ1kXqmffVrkK0a02QifXPQNZRwsAwoE
         QspVIBfwY9bk5C/OfEQAm877moMYZP7ulj5LmKUdAjurGRF7FQzLCBHzqyUjb6U9760F
         IM1rbC8VsnKd1EcRrqP/4ozGInw5dPl+md2WOpsotHAtPpcDw4syDggYRHEunPtsxDCB
         B8kYMf88n/oCLtkGaNLh2lyPgBUcZC/LBDg1AHNLhn+tLzipWL8oExLxVNhw1tR6yQf1
         UqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aKPCuC6cV43Gz6CZUTrsJDoMfLLgLsLNYcX4uUjXR/s=;
        b=sJ+BOwAZeBm5dEYUB07o3X0IUg7O9IkEVWrfl4JCBP6T+7EfEAUBhU0sLzo+ClBwZL
         58bYcvAUqfmbga73utg/mfYI4JlQQ99IzAbOFpKwvTHZTPXbVGagMI9RgrRWNAMFLCBg
         vkMfxpcT6uvS4IigkuL4nJZX5w2YcoRYqbL3ageKlo76tiM2sRr1JwfztpwLBuIJkyoa
         ktouzPLxF1yL3gyx7R70hLZn5BN7IeI9DpeqP6pYpTA/Sf2HiZwPdjrZQWLtJ8zO4mFV
         Sk3XKSW/XtNkRTF3hm6DVdJiEcK8O/Sn7VA3bPtuEWPXgo5slsaAsVNNqIxTCN1SQRXG
         WRdA==
X-Gm-Message-State: AOAM531lKZnspH2Gj1p5K3FFFgWpV6UPaEQrLVFx5iNQSVcH8CkSLDNF
        Q++mVWUk4v1qgKyM+rKJy2s=
X-Google-Smtp-Source: ABdhPJykxd8v58iQt7sdbe0FAorvbijjBBCDtdJ70BfJ8hS/Iw/2ISlMlMjYNfdai4y4V3BOKPeO6w==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr1970811wru.170.1596099863016;
        Thu, 30 Jul 2020 02:04:23 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
        by smtp.gmail.com with ESMTPSA id o126sm9515635wma.20.2020.07.30.02.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 02:04:22 -0700 (PDT)
Subject: Re: [v2,2/3] dt-binding: mt8192: add toprgu reset-controller head
 file
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        erin.lo@mediatek.com
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-3-git-send-email-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7afab63f-8cba-3043-576b-a41f3bdda3ac@gmail.com>
Date:   Thu, 30 Jul 2020 11:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596016922-13184-3-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 29/07/2020 12:02, Crystal Guo wrote:
> add toprgu reset-controller head file for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset-controller/mt8192-resets.h
> new file mode 100644
> index 0000000..be9a7ca
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8192-resets.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Yong Liang <yong.liang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8192
> +
> +#define MT8192_TOPRGU_MM_SW_RST					1
> +#define MT8192_TOPRGU_MFG_SW_RST				2
> +#define MT8192_TOPRGU_VENC_SW_RST				3
> +#define MT8192_TOPRGU_VDEC_SW_RST				4
> +#define MT8192_TOPRGU_IMG_SW_RST				5
> +#define MT8192_TOPRGU_MD_SW_RST					7
> +#define MT8192_TOPRGU_CONN_SW_RST				9
> +#define MT8192_TOPRGU_CONN_MCU_SW_RST			12
> +#define MT8192_TOPRGU_IPU0_SW_RST				14
> +#define MT8192_TOPRGU_IPU1_SW_RST				15
> +#define MT8192_TOPRGU_AUDIO_SW_RST				17
> +#define MT8192_TOPRGU_CAMSYS_SW_RST				18
> +#define MT8192_TOPRGU_MJC_SW_RST				19
> +#define MT8192_TOPRGU_C2K_S2_SW_RST				20
> +#define MT8192_TOPRGU_C2K_SW_RST				21
> +#define MT8192_TOPRGU_PERI_SW_RST				22
> +#define MT8192_TOPRGU_PERI_AO_SW_RST			23
> +
> +#define MT8192_TOPRGU_SW_RST_NUM				23
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> 
