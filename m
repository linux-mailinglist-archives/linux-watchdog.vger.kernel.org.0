Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95B3232F25
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 11:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgG3JDy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 05:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728732AbgG3JDx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 05:03:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E253C061794;
        Thu, 30 Jul 2020 02:03:53 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a5so14165101wrm.6;
        Thu, 30 Jul 2020 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SeUArJS4+sD39HCLlt6g8IUuT8R2pEK+lwZA6XLSsz4=;
        b=eMBhXmWkxmg8kJQm8Jm9Azy2o1rj87qKzFIlGdv9S9zFeAlc+PZZhZuPt1FnsQFru/
         E2NRbjGpXGR9NcmWb4OLqypJt0ZbroKgEGQw8UF9xj4Of/s3ETwrrmxCy9AOA2dvtqof
         gNzCAtV78LdThaKzcdJrTCokF54I4gNnAdsCE3Q1RR5OZU3GyBaJopRogyMJOQAx2UiD
         ss4m4HR2iasI4N7xAF4x1wdZlk68e5toSHV2R4mCUKfJdqcpzPuqRjDUmBMIslxwrJWu
         aDmkSysxYGlfNR1UTdCEvGfMHzXJHwawlbhLPdyhrqHcVt/+9b+K2uAwzDVtIvpfOz4u
         lMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SeUArJS4+sD39HCLlt6g8IUuT8R2pEK+lwZA6XLSsz4=;
        b=tYp7oCveWSVqooE/eMe/bct6+k5eeAA0H4bjbvaxuqTxG61CKsTcqmkGb6okgz4M7U
         xSFK3WaxOBEXOj+HKD03ZjFYg9rcrRFrbKAgXpXBQjV8oOLaOpevQby/t1vWO9z0NlFk
         0WiqVyS40x3DYLD9Rx9Ex/0zMTmS3ZwaqMQ9azWIPhf2Dl7a5sjtg+hMajhhpoYP1s8H
         LWLuVZC5IsScnm3SE0ssYhQUyoC+POT1sKvEQQisUZ6hPFAXjmMY9TL1jeX/TgARS7zQ
         ikmge6f2BHZb/Ha1g47lFrOFac02yt+tMQ1stWv5vdiOQqYfW7OPLo5Dj+WV+sD0kWwx
         iPhQ==
X-Gm-Message-State: AOAM532QwBSglRCU8nUJjlaBZjpAukr8mMjWZJ5k+256gpKCU7UQk5N5
        En3hnnR+NabFBLDXCsbbeGo=
X-Google-Smtp-Source: ABdhPJyNZYwhrS5KA21KNWl/AE51BzMY88ZO62K3HW+2iKld2AGa6p8xpTllJBX2+vh0jRQBiaLgvw==
X-Received: by 2002:adf:8bd3:: with SMTP id w19mr32760613wra.167.1596099831847;
        Thu, 30 Jul 2020 02:03:51 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
        by smtp.gmail.com with ESMTPSA id f12sm8492015wrj.48.2020.07.30.02.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 02:03:50 -0700 (PDT)
Subject: Re: [v2,3/3] watchdog: mt8192: add wdt support
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        erin.lo@mediatek.com
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-4-git-send-email-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8774e948-502d-8a83-6e7c-5459497c52a4@gmail.com>
Date:   Thu, 30 Jul 2020 11:03:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596016922-13184-4-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 29/07/2020 12:02, Crystal Guo wrote:
> add driver setting to support mt8192 wdt

Commit message could be better:

"Add support for watchdog device found in MT8192 SoC." for example.

> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..aef0c2d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -11,6 +11,7 @@
>   
>   #include <dt-bindings/reset-controller/mt2712-resets.h>
>   #include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/reset-controller/mt8192-resets.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/init.h>
> @@ -76,6 +77,10 @@ struct mtk_wdt_data {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt8192_data = {
> +	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
> +};
> +
>   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>   			       unsigned long id, bool assert)
>   {
> @@ -322,6 +327,7 @@ static int mtk_wdt_resume(struct device *dev)
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> +	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> 
