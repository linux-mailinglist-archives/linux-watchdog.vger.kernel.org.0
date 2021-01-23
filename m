Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189563017A0
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 19:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbhAWS2A (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 13:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbhAWS17 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 13:27:59 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EE3C06174A;
        Sat, 23 Jan 2021 10:27:18 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id e70so8530189ote.11;
        Sat, 23 Jan 2021 10:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fQTzxKDsTEcVh36ya/OWH5txYSAa3c+N4WKrX6+8EIA=;
        b=jCGDtniqnI556Jxy0FI9V3qO61DPYUl9b89tFBQlb6bj1x+YHEaNCWnE6jz0XX5DVz
         aDPU3Mgt1/7N05Zau8jk+rWbvq8Ef7G5m38j3tsmE+s9gtHRR6tNdas8CL7K6E7simhU
         5V3Q485rHLB1jen7ICUxDPEtHrXSYJFuTkRctGOfRFHvzw6TvglSfHl87diRwFqYT79V
         g7sEVUCtPX7ZYj2uuB1OaUt+PQjX/JjBp4HnochoWNQrnMhL8tgzEtt/KTt4ckCr6THk
         yDp2Vbd8OPEzKt5tS+RYZqdQR3zeLP04qHxXTDCqnuPq2KN5aKFdKq7k6r+n94n3TIsU
         rkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=fQTzxKDsTEcVh36ya/OWH5txYSAa3c+N4WKrX6+8EIA=;
        b=tdDelwNlXU1sKHzjmVhw534ceegT0z0LFtsaQXk5RyJff/MKkat2y7LuJFtT3azL2y
         rJpjP3jYNlypGufsQ+mKy0KikU//emduZxa5vHRrgzutld3Vk86Su8uWOFop9Frmf5Qm
         iUHjcoIhAldzvB5uRpP4UltM42VqFlH0zRAAsWP6huZ9i17kXO0h1ZCfsX9M/CLsKUgJ
         aeFgYcSlligZFNtgA/pTVwCIeZpLNw+iuGas958TmY+8/IgWkKLmoMpcZbGLB/UscMnj
         gLkyUDu3Ghl+VyawxwHoeBuVxvdjD/sQC+r8/7eIeO+bCbW8arfohsGV8dbxSVjbaPNt
         xoig==
X-Gm-Message-State: AOAM5331WLvG2b+rc3EUF+rR13a/aQxpi+Jy33y+YMj3wAnXWlXCy/bq
        iWFUQObc33OpmDACoDVssOuMm8XNe0k=
X-Google-Smtp-Source: ABdhPJxvTyMrtbCns4cqlBdF+S6GZjhzgarP3uAp+ibKh+y2LhqheqAIjQlK0A28szn9ImK/Jnoryw==
X-Received: by 2002:a9d:4005:: with SMTP id m5mr7306637ote.120.1611426438268;
        Sat, 23 Jan 2021 10:27:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n5sm2547514oif.27.2021.01.23.10.27.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 10:27:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 10:27:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Crystal Guo <crystal.guo@mediatek.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
Subject: Re: [v6,4/4] watchdog: mt8192: add wdt support
Message-ID: <20210123182716.GA59961@roeck-us.net>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-5-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014131936.20584-5-crystal.guo@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 14, 2020 at 09:19:36PM +0800, Crystal Guo wrote:
> Add support for watchdog device found in MT8192 SoC
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

FTR, I now added this series to my watchdog-next tree. Hopefully
Wim will pick it up from there.

Ultimately the bindings should be updated to yaml format, but I don't see
the point of holding up the series for that, and the series has been
collecting dust for long enough.

Guenter

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393f609d..aef0c2db6a11 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -11,6 +11,7 @@
>  
>  #include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/reset-controller/mt8192-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -76,6 +77,10 @@ static const struct mtk_wdt_data mt8183_data = {
>  	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>  };
>  
> +static const struct mtk_wdt_data mt8192_data = {
> +	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
> +};
> +
>  static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
> @@ -322,6 +327,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> +	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
