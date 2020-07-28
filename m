Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47CAB230C9B
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jul 2020 16:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730455AbgG1OmJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 10:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730391AbgG1OmJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 10:42:09 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26CD0C061794;
        Tue, 28 Jul 2020 07:42:09 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p3so11993934pgh.3;
        Tue, 28 Jul 2020 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/eHJQLNWjzIejlZ2T4kesqmM/hbY171Zx3dgWw26xXA=;
        b=sQCEwezlEx1XDt1GSk43CcwwVTvir7FU/FnVdOklhCMoxFG8VHCSml1Fxok75CFZLr
         4Xt1yVZxuYEYRA/doH/mrv81tK4PWtQojOeWWKklvMMMefpk5jX3nxi/Hz/K9fyRjM9Q
         kekg/2lw3Zn1vr8KIInOcLhB7e7mxbxU9bBubu6fYHcYQcA8OlKj67y8ylDTeBXAPDpv
         AO9YYLD6qHwVZXklTRpDc/BA+BwIL40nRaywXaqsL/HJAr5cx+jlfkqDTGmjoJ/M4JNu
         DMqRrWvc5uh2M17XYXxz4ennPjN7VBoSmG1leO+B+LE3SnagvGUS7xMVt4Xt/PVNIVoo
         FEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/eHJQLNWjzIejlZ2T4kesqmM/hbY171Zx3dgWw26xXA=;
        b=m9DgrfF28YghQWUZtGljPA205wxZXGqU2PEEhWnIw/+gT4uYFmSSE/Ag/8/WHD6OQ6
         g2HzPNgB1by72mSEopW7EyzIKr57oMx6LS2A7t5Q4K5bmlRpVMqkmteKRZKRwrx2OR2Z
         P3581hpDPR4X4lvLrCMg/TiqBil/MbXaOe9hLlpKAv03oktQl/F5ZBlVQ7RlqD9E4fnZ
         UmT5fRaQJzUVcQhTZmv0yh2YN7sEzFJnynJrQNfRSBh4zF5QqGKO0C1P0zqxfq5UgMVc
         VojkXEL74EyCvoO3mgyWU2kmqYFANF84Kg6n2OYUs3sCVpzQX559eNVU0uzFcxfFsYeI
         yaZA==
X-Gm-Message-State: AOAM530AZh3wjFCNXZMFV0rxa647zQlDT5sXpTnehcIffwT4nKzKJQIy
        hAy22N5B+72cUrcNHBBefA0o6q6k
X-Google-Smtp-Source: ABdhPJyQnyJ5RdYKOkI0HIaqRlKvRnxM9YtIC2sh7TjKK77k+YYhwcCnTycKsFjeBQgIOS7oZ7Oo8w==
X-Received: by 2002:a63:b956:: with SMTP id v22mr24644559pgo.242.1595947328460;
        Tue, 28 Jul 2020 07:42:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j4sm17697538pgk.4.2020.07.28.07.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 07:42:07 -0700 (PDT)
Subject: Re: [PATCH 1/3] watchdog: mtk_wdt: remove mt8xxx-resets.h
To:     Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
References: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <02a15f39-4b85-e450-defd-2df0e4a1ad87@roeck-us.net>
Date:   Tue, 28 Jul 2020 07:42:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/28/20 3:42 AM, Crystal Guo wrote:
> mt8xxx-resets.h actually just used to define TOPRGU_SW_RST_NUM.
> Instead of resubmit the mt8xxx-reset.h for a new IC, get the number
> of reset bits from dtsi is more easier to maintain.
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..adc88c2 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,8 +9,6 @@
>   * Based on sunxi_wdt.c
>   */
>  
> -#include <dt-bindings/reset-controller/mt2712-resets.h>
> -#include <dt-bindings/reset-controller/mt8183-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -64,18 +62,6 @@ struct mtk_wdt_dev {
>  	struct reset_controller_dev rcdev;
>  };
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
>  static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
> @@ -248,7 +234,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
> -	const struct mtk_wdt_data *wdt_data;
> +	u32 toprgu_sw_rst_num;

toprgu_sw_ is a completely unnecessary prefix for a local variable.

>  	int err;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -284,10 +270,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>  		 mtk_wdt->wdt_dev.timeout, nowayout);
>  
> -	wdt_data = of_device_get_match_data(dev);
> -	if (wdt_data) {
> -		err = toprgu_register_reset_controller(pdev,
> -						       wdt_data->toprgu_sw_rst_num);
> +	err = of_property_read_u32(pdev->dev.of_node, "rst-num",
> +				&toprgu_sw_rst_num);

There is no such property. Maybe that is added with a subsequent patch or
preceding patch, but that is not in -next. If this patch is applied without
rst-num already present in affected devicetree files, the code will no longer
work. That means this patch requires context, and can not be applied without it.
That in turn means it can not be patch 1 of 3.

Guenter

> +	if (!err) {
> +		err = toprgu_register_reset_controller(pdev, toprgu_sw_rst_num);
>  		if (err)
>  			return err;
>  	}
> @@ -319,9 +305,7 @@ static int mtk_wdt_resume(struct device *dev)
>  #endif
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> -	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
> -	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },

I don't see the point of removing the mediatek,mt2712-wdt and mediatek,mt8183-wdt
compatible lines.

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> 

