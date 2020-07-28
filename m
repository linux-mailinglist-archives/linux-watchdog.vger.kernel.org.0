Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A95B230919
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jul 2020 13:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgG1Lnd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 07:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729036AbgG1Lnd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 07:43:33 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFC0C061794;
        Tue, 28 Jul 2020 04:43:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f7so17994041wrw.1;
        Tue, 28 Jul 2020 04:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YY8pKOcwJD4xG9W6savE5HlL+3GNu21Usj1rV1Jy7eY=;
        b=Kg5JIfjZiTwRt52ZR9xcIlzQP4dbpaiHpxjS5t2LLVa8LCc//EQJR5fWiOSbobaw6f
         RASs0aZDzmLdIg4dnHSw8nxAm38krcFW7omINEnaMSrijSz/FIc/vvRcHULAeHBI947T
         QS+pBwJZtz8QXxXoQwlR80hBAUBblDsDsnq3s66X8guNViocUqYwNW/jCq/y5ejhE7nG
         bIbLZFKYZ3966JO+y/vPaxH32Xn43fYJn7aQX6bTQkFjHwjW+LLgpK96HwD8R1+2XPP5
         9W7XF3fFInPJbl1CfptpMoGBQZLY92tpzYbRFPEllgrHJzHXQJFLD21Li2+xjMPyjext
         Zt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YY8pKOcwJD4xG9W6savE5HlL+3GNu21Usj1rV1Jy7eY=;
        b=OgqtuwQzJuLfS48T/1gdq1LLiGGB+iDR44SWR0IUBGnjs3mWNubm2AugYbtOFFr7gH
         Cfs11DmW/C6BlYuRze83iJNgPhRP7ZIjyap++e/wmkyL4WtEnN7V3baFgRxh0r3vvo0O
         DzrbexaVApb+PjxkGJDtgBfpmCVlvFc097O4Bq3lbM/PwhoxiQi3yDjU+kpbPCCr5h+Z
         RnVvlejpMDz0I816Ib+Ch0UWxcxzSlKIUStDa5sNZGlEZkz/JT6C+2GDpWvmkEKu7oNb
         Q5sTeHVsGaL1qc/Meys0K1Y+ENxm+4Ke+lIwWOfeLmDBSKN5a73tp7IjB/bKen+XnSEU
         bhPQ==
X-Gm-Message-State: AOAM530O38/sIMEIRIUp4BrOHrNUblSGKYkthK9AMg3y4LpngkC3RaPa
        GATXxbFOWNc+M8nXaCgG3QcSsPWhadQ=
X-Google-Smtp-Source: ABdhPJxwpGy1Qj5Bt8epmU8P3Lo87ZxUfc28bfCO0IJ3PP0BUP4mzW5kO1kVytYnPn6l8PXgOiuGvQ==
X-Received: by 2002:adf:9d85:: with SMTP id p5mr9624993wre.286.1595936611544;
        Tue, 28 Jul 2020 04:43:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id y17sm17639096wrh.63.2020.07.28.04.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:43:30 -0700 (PDT)
Subject: Re: [PATCH 1/3] watchdog: mtk_wdt: remove mt8xxx-resets.h
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
References: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <eb2d8f77-6e4f-9c0d-1556-3db5fa48ada7@gmail.com>
Date:   Tue, 28 Jul 2020 13:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 28/07/2020 12:42, Crystal Guo wrote:
> mt8xxx-resets.h actually just used to define TOPRGU_SW_RST_NUM.
> Instead of resubmit the mt8xxx-reset.h for a new IC, get the number
> of reset bits from dtsi is more easier to maintain.
> 

We want to have all the reset numbers in one header file. It makes no sense to 
pass the reset number in one driver via DTS and in the rest through the header file.

Sorry but from my side this is NACK.

Regards,
Matthias

> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   drivers/watchdog/mtk_wdt.c | 26 +++++---------------------
>   1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..adc88c2 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,8 +9,6 @@
>    * Based on sunxi_wdt.c
>    */
>   
> -#include <dt-bindings/reset-controller/mt2712-resets.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/init.h>
> @@ -64,18 +62,6 @@ struct mtk_wdt_dev {
>   	struct reset_controller_dev rcdev;
>   };
>   
> -struct mtk_wdt_data {
> -	int toprgu_sw_rst_num;
> -};
> -
> -static const struct mtk_wdt_data mt2712_data = {
> -	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> -};
> -
> -static const struct mtk_wdt_data mt8183_data = {
> -	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> -};
> -
>   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>   			       unsigned long id, bool assert)
>   {
> @@ -248,7 +234,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_wdt_dev *mtk_wdt;
> -	const struct mtk_wdt_data *wdt_data;
> +	u32 toprgu_sw_rst_num;
>   	int err;
>   
>   	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -284,10 +270,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>   		 mtk_wdt->wdt_dev.timeout, nowayout);
>   
> -	wdt_data = of_device_get_match_data(dev);
> -	if (wdt_data) {
> -		err = toprgu_register_reset_controller(pdev,
> -						       wdt_data->toprgu_sw_rst_num);
> +	err = of_property_read_u32(pdev->dev.of_node, "rst-num",
> +				&toprgu_sw_rst_num);
> +	if (!err) {
> +		err = toprgu_register_reset_controller(pdev, toprgu_sw_rst_num);
>   		if (err)
>   			return err;
>   	}
> @@ -319,9 +305,7 @@ static int mtk_wdt_resume(struct device *dev)
>   #endif
>   
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
> -	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>   	{ .compatible = "mediatek,mt6589-wdt" },
> -	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> 
