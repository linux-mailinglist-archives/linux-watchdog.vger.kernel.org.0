Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36AC3231A7A
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 09:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgG2HnF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 03:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgG2HnE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 03:43:04 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30BAC061794;
        Wed, 29 Jul 2020 00:43:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g8so1793226wmk.3;
        Wed, 29 Jul 2020 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=szBubxity4186U3bdeuflQScz96ZCzKJmi9LmSH2cAg=;
        b=VIeeARmOqTNBT95O1KFhQALpovswxaeK0oTFi/+t2mEyBQ6LYcC3gpgYrI3G0EmeAz
         047ZKs6aW4pIswVaM9s9AYTv7FG6Do+Nk729Fqh5WQk0/TffbcxH6miCnceHSCRI+fVT
         3iYwMoZ7g6OsoDGKRKAs9C3XQhdTzYx0Afx5rFgfJRy3tbJ7YXRN1sJYrVZLX5iawH7t
         5sbipe9WuBnIqHitgUeVMdg2GFmkNqKRsMHY6+HJlggOmDnBW7yuAE2wR9PLer+ff84O
         m5XHKnngkTx/TN2o28AojJ1tHTQLB0E07aVbfklnFxikWDpLwDQnwv3ndzS8k9fNVpBf
         EazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=szBubxity4186U3bdeuflQScz96ZCzKJmi9LmSH2cAg=;
        b=Nf5W9/WbwkvVwjHsRFvzCW9PAgDUupTA/7E342SouBGf3DQmWwGfVYFl306mgJOODR
         ySXcRidGsVFLeSWeyvbHTSPdc7h7Bxx0Ao8/0oJ12Aq3Zyh6FTpkZMZOG4tGWs+WnYry
         nKnwbMqQLeI9OPizXn2TFI063LW/VFOUsHRRKIzCSyVbCCgeGNF1BjJIj0RiPO4qOlSv
         DcmF4xtnHrG6+Sggn06f8FStwfZPvVn0KMQxgddcmTsbxcBh11c76tYSPxovLHQEeMlA
         xxG4erhAgomqhmWvitiE/6jmxwS/LcrvmJbAOEOfvxQDSnA+qnIdav9T06gPoSCe7XAr
         kthg==
X-Gm-Message-State: AOAM532WsBlxGp6GWodo0L42WVk3yr8vLHkz3J+mH3anUEvVBVXvTesF
        DSHBXcyouySOGelwtbBvh+w=
X-Google-Smtp-Source: ABdhPJweUAeyZOUZCWitl1m8gdeOtMPiKJACXt8jbVFYXdixwyDiY+1vsMVdDmkTNtLHRwX/NsnAvQ==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr7315864wmc.109.1596008581632;
        Wed, 29 Jul 2020 00:43:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id c7sm3526265wrq.58.2020.07.29.00.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 00:43:00 -0700 (PDT)
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        erin.lo@mediatek.com
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
 <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
Date:   Wed, 29 Jul 2020 09:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Crystal,

On 29/07/2020 08:30, Crystal Guo wrote:
> merge all the reset numbers in one head file.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   include/dt-bindings/reset-controller/mtk-resets.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mtk-resets.h b/include/dt-bindings/reset-controller/mtk-resets.h
> new file mode 100644
> index 0000000..d73a4ba
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mtk-resets.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Mediatek Inc.
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MTK
> +#define _DT_BINDINGS_RESET_CONTROLLER_MTK
> +
> +#define MT2712_TOPRGU_SW_RST_NUM	11
> +#define MT8183_TOPRGU_SW_RST_NUM        19

Maybe I didn't explain myself properly. We want to have all resets in one file 
and do not want to have the resets for the watchdog in a different file. That 
means I don't thin your patch is correct and the effort should be abandoned.

Regards,
Matthias
