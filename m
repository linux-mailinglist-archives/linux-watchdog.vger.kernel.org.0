Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE163B66D1
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jun 2021 18:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbhF1Qf7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Jun 2021 12:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbhF1Qf6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Jun 2021 12:35:58 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B62C061574;
        Mon, 28 Jun 2021 09:33:30 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so19386916oti.2;
        Mon, 28 Jun 2021 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UtUgHWKrOAfPi99gDumnR8kkJQNQB4a0Hv1A5Aua2sk=;
        b=AXTGCRSqy7PntAOyr4KiYlK8XRbFGNEtx/8y6SZNAt7pkc345ONCgExYRM6rgy7NC3
         Su3L7D0E/A/zMDcZndlEgTGFMF2qtIbgE4dFtKNovGXAgeUjW3bBdldb7xsXtcgGbPWt
         sSKBf6oGbU0JL7Cq42kX6lCmW/jtkHKOx1lk7GtSuQSSt0aKY9wuyerVxn7iUlNnWm06
         OSomIbRQWB78b4VNdXAYOWinRUYh2nrOzTP80tvcn6PbcDQDvAdlbp7dqgyIUTp43iym
         GWLBQt71xnOkCdCjf3by3m/BFMNhCl5nMJFmJ5Cu/EI2AJAcbLznYHOXj76vUlZ0kADr
         iAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=UtUgHWKrOAfPi99gDumnR8kkJQNQB4a0Hv1A5Aua2sk=;
        b=NAIGX18bVEZH2rmIcJ0bjCMiHfmGetO93+UqHmekJZbSAnuevtzV07i1iJcr5FfChx
         9CAv3uMYk9uIYbFRimFxGp8J54i2hBJq0czoNVtt5lNpOatTcl/QHTjcC+vkAbSyBsCW
         H25umhrvfwIx15L/XNJSE/R6zLoe4h5SkL2x+i9kuCrhwT9SaKG4rzvBsXqCDHAe+1aj
         a19yuiE4V6rrIRXDY6TV2vYGs+A6FKIsElgTu1bTR2iHMTzWy3ocQbWsSwUTsvDMg7AM
         uzLzkGYp/haYixrGu8ICDS5ZSMVNfJWeeiDU1UO5dS6kdwTs61/hCznXsrW/Q3dOd3h7
         9BEQ==
X-Gm-Message-State: AOAM530S/ZNGzJNc1EaHO4Y2vBD2M1wIyfnrsuLEJXdiUUUM0qpuSSTR
        l6Ts7Lluh5C6+puigp8pUBQ=
X-Google-Smtp-Source: ABdhPJxBa2zVVcTFLRh1nBlV4u/4joB4a7hqMKIshTrYw4hi2/9W+n0K1e3JQo0OAmuNc+k2gHrU3A==
X-Received: by 2002:a05:6830:3190:: with SMTP id p16mr420934ots.42.1624898010388;
        Mon, 28 Jun 2021 09:33:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a22sm3589372otq.10.2021.06.28.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 09:33:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Jun 2021 09:33:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
Subject: Re: [v5,3/3] watchdog: mediatek: mt8195: add wdt support
Message-ID: <20210628163328.GA445250@roeck-us.net>
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-4-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628113730.26107-4-Christine.Zhu@mediatek.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jun 28, 2021 at 07:37:31PM +0800, Christine Zhu wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> 
> Support MT8195 watchdog device.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993bd009..8231cb9cf5f9 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
>  #include <dt-bindings/reset-controller/mt8192-resets.h>
> +#include <dt-bindings/reset-controller/mt8195-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -81,6 +82,10 @@ static const struct mtk_wdt_data mt8192_data = {
>  	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
>  };
>  
> +static const struct mtk_wdt_data mt8195_data = {
> +	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
> +};
> +
>  static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
> @@ -341,6 +346,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt6589-wdt" },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
> +	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> -- 
> 2.18.0
> 
