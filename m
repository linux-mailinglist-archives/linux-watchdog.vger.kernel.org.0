Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D4822B913
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jul 2020 00:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGWWAO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 18:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgGWWAO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 18:00:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F67C0619D3;
        Thu, 23 Jul 2020 15:00:14 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t142so162249wmt.4;
        Thu, 23 Jul 2020 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u4N8EQ4xAO0j5YF801GNNXppFCnjV9JwTLYq/iG9D9Q=;
        b=Zxz2qd1Y5ni/7O1JAsWNS7sa8VEt09eyzu/HTRZM+JnycaMWDdMaj0V59s/RL8dopZ
         +b7NvViEV+z7+gqWq8SS+QVWqJOCSsxIFGCQaAJhJ4rcCVhXMawBjP0VIAVatFLhEHvi
         p1PtNbmNk8tHeMt1knN12aiudumMEWQK7Tyiq4aV9AZnBJw6B+JCQNfTWK1jdHgF+duc
         p+xbvimvjNIp9SC5bNm37q6lrgHjYKTK9Ukz57ugCEEd7QknAqLCB9I2URJFjOzEeeGO
         niFbRrrPlE3NDNbobISH8X3dgOUeJnm5qK6odeCtH/HPvGHH9WqhV2FZdz1VGYyhzswl
         YfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u4N8EQ4xAO0j5YF801GNNXppFCnjV9JwTLYq/iG9D9Q=;
        b=tvhfTKm7/a0bs11s63ItUhzeatBrPPMXq7ImS/ftfP41mQrpPpaUzlb4BVBT90rxb4
         QL5UK/c5cQXjfqMhOeskgiQFLnfp6SmkEmz9h5whUNNCHiE3hGIGenFEZmbsPuQc89x9
         kTr+Pv2Ia48eMqAcQJUK7/rwMGMGI+M7gWs1I8ZBbdWGP4cVnNCzMIcqxUQrvjIv68lH
         PmPBX+sG9OfrVc139jrGlUxLqdQAvZx49UA3YotsncdbW/HEHSnjw7tgK2Z8IGG9pzxI
         KBuN6pKNad47QToIEkaD9JskwNvakHsfH6vJgzsWhybvx+WP1OZFO6wBfLHHYfGWCc8r
         um7A==
X-Gm-Message-State: AOAM530EXgvlWoEnyfiMiEQ05XBdOzw3Phfcuv7zP+27SLL46oxOpLrY
        fDYoOLsiUiRhdIeQX5oA45M=
X-Google-Smtp-Source: ABdhPJwNOvh9946MEw9EMO/orazFx6cCk/g8QgOoofUmSHdVRjPCLotEIurIVpqitAd7n8iySwVIEA==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr6110703wmb.134.1595541612792;
        Thu, 23 Jul 2020 15:00:12 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id t14sm5171171wrv.14.2020.07.23.15.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 15:00:12 -0700 (PDT)
Subject: Re: [PATCH 3/4] watchdog: mt8192: add wdt support
To:     Seiya Wang <seiya.wang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
        Crystal Guo <crystal.guo@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-4-seiya.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <bdd9f543-0fe0-af25-1843-aae95fcd4230@gmail.com>
Date:   Fri, 24 Jul 2020 00:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723090731.4482-4-seiya.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 23/07/2020 11:07, Seiya Wang wrote:
> From: Crystal Guo <crystal.guo@mediatek.com>
> 
> add driver setting to support mt8192 wdt
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   drivers/watchdog/mtk_wdt.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393f609d..ad23596170af 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -76,6 +76,10 @@ static const struct mtk_wdt_data mt8183_data = {
>   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>   };
>   
> +static const struct mtk_wdt_data mt8192_data = {
> +	.toprgu_sw_rst_num = 23,

Should be defined in include/dt-bindings/reset-controller/mt8192-resets.h

> +};
> +
>   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>   			       unsigned long id, bool assert)
>   {
> @@ -322,6 +326,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
>   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> +	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> 
