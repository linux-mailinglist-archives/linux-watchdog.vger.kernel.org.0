Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39DD3E2206
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Aug 2021 05:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbhHFDCu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Aug 2021 23:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhHFDCt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Aug 2021 23:02:49 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4F1C061798;
        Thu,  5 Aug 2021 20:02:34 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id o2-20020a9d22020000b0290462f0ab0800so7410356ota.11;
        Thu, 05 Aug 2021 20:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EA05tSQWqSs4HKkvaMBpD7HoBLTyMYIgWdky50GfsB8=;
        b=kNMZYDjdidsmhRJ6GOD0Zi5nQ4FaLJMbn2MkdS+1DNbUOc55MxRWQ9qIrM5W1uALWP
         xYXviusk0sFAGolTJWPQJ3+W39fG6zC/UfjqbEoEdGK92et4yLNULkjl80IWx2VYa/Hf
         nvxmHxpszIbY9rwXIR9PRv+WmsnEDZbuUFihGYdeO84W4mo4BPxYQEwwfq7bOLdjL1QW
         YqTC01gcxvzSEaZ/vMO9/+XKMdwD+LJjNuIkZGAaIke0CBBh3M8FiPhZq8jrGaX+klUm
         UXRacezk+Yfk62zKpgeyYpjUZ4bMfTBLtvsgqmIdm2tAONCFATtLMxyzmoFiqXjx+UEy
         /Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EA05tSQWqSs4HKkvaMBpD7HoBLTyMYIgWdky50GfsB8=;
        b=Qu8B/PdbkTBYcLHAyX1WrRlFS2WGgU/wGiy1g/4tmn0KcP8NmcK1qyy9hcdKLoTTjB
         m1656+IEYevBgCxOgHjTNwlOBVezC4jfW2SWtcXzOSNMDl0bsZQPPp1p1rpLC4aPuUfT
         g/xBHVtowPdfZYEr2Q61aOGY4zd4A9hM5JufsfR3HoM408K32FAwKCEJtoBvi7SZaH8A
         ipOgdNc4305sC4yW75lV3x7a+QjpRUQrHXUt5v9PXewu9wAXomMm1SC4XFLqgipuRt07
         gBnr4cygffiDRXR1JteJfWBqGRNXycbptIJfdnN6TY2DrbLKYsD0niOvsHJXqbsgItsX
         lBtg==
X-Gm-Message-State: AOAM532wFRC5vGfZS+iW/ZXVx5FjON2JiMjq1cKhVR6DwI2DaF3TDG8J
        0pGfQ5VAeMtnoLjPu1bqlHs=
X-Google-Smtp-Source: ABdhPJwfYB6fS6GG/E20fTPdKfxYyTtuw5Bp2moupTwoHqmOheH4cOjZnRCFfpzfeqFM0ebpRwr7Dw==
X-Received: by 2002:a05:6830:144f:: with SMTP id w15mr2065560otp.161.1628218953849;
        Thu, 05 Aug 2021 20:02:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bc42sm1101795oob.39.2021.08.05.20.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 20:02:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [v8,1/2] dt-bindings: reset: mt8195: add toprgu reset-controller
 header file
To:     Christine Zhu <Christine.Zhu@mediatek.com>, wim@linux-watchdog.org,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
References: <20210806023606.16867-1-Christine.Zhu@mediatek.com>
 <20210806023606.16867-2-Christine.Zhu@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <daa97d7e-2184-0b1e-3afd-c357b022c966@roeck-us.net>
Date:   Thu, 5 Aug 2021 20:02:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806023606.16867-2-Christine.Zhu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/5/21 7:36 PM, Christine Zhu wrote:
> Add toprgu reset-controller header file for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   include/dt-bindings/reset/mt8195-resets.h | 29 +++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mt8195-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
> new file mode 100644
> index 000000000000..a26bccc8b957
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt8195-resets.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)*/
> +/*
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
> 

