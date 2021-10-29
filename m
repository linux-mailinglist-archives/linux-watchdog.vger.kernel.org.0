Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D3343F3C1
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 02:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhJ2ASp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 20:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhJ2ASo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 20:18:44 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19067C061570;
        Thu, 28 Oct 2021 17:16:17 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so11187566otg.0;
        Thu, 28 Oct 2021 17:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UDNsthRDfQMdy5Xi4IJABZmUUiTqa8/5eXuKi4F/AG0=;
        b=a7WSvFBLa2mgCXrzxhxUDHvgRfgkAhzfymRUKWtTgFGLNnXvm3HT2ay4nM2NSiB+EI
         hoSlC4xnD5eXpv55CC2RoYF3/rJuf3KFvzNtYA2rV96UjjRGIXetPOWRbnBKnj39btuR
         oOQ8xYWrEvpXXr3jGvspghinUXMkxiaznlk/yj2mexTmlNxgIkM2Q71Fe0PBG21pLo+Z
         CbJcFcI5IFvw4Z24M5IvX+Fjkls2jcU7NY9XUE14UE5fTlhE9/UP3pH9vkBatqfC/t17
         810aqmLxqi5S5LC0w9e+crNtqyXehveUIXExsA8ubPNXRx0B+BBpT77p6KkA9f1wDWog
         Hj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UDNsthRDfQMdy5Xi4IJABZmUUiTqa8/5eXuKi4F/AG0=;
        b=B5usOeSdnF94x+dvyCwU9+FoOlgXg3+iiSxUjE4z9Aog4itPQRWXSjozFg0uc64Nuj
         d0Ikp2UH07TVnlk5WLnK+NkHR8Mp9SK3BLXZ3uwEC1JfgJd+99g/BC54lry+Diz3TqMQ
         Kmd7XWEq/vwipRf+6wGUqQZJqzbUlbr09rkqZMhu5ZgYDnPLMMs7QnIFVwq0KM9wghHu
         CeErG0DcJZHPkotFTcg75qxEM6UY8CZhOfmO4MuSvw9vH1s7J1o7ApmCt1IMzR00hedo
         VMUqANZK/kQCk59W4sj4nN07x/IOI3KhGiPyoOFHpThkNK1nXIDEKX0+O8tva5fJpX8H
         kQJA==
X-Gm-Message-State: AOAM530lmKVEZ5pwT9R4gQLFJOgDcEnnVCKeWVQEjkTX/9DZQ3/Wi/Ja
        MuF+dnjg/qL0Prao4dQxb58/sWvQsoQ=
X-Google-Smtp-Source: ABdhPJwdY9EbvZtq4Rt8XxQ+XVKVZJn1nxNjBs5WqSUmWVnE4tN85eFEdcmN4KRFOrOESsKSWFtrGA==
X-Received: by 2002:a9d:5541:: with SMTP id h1mr6025457oti.229.1635466576180;
        Thu, 28 Oct 2021 17:16:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14sm1340879oop.8.2021.10.28.17.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 17:16:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/7] watchdog: s3c2410: Add support for WDT counter enable
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-5-semen.protsenko@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e69282af-738b-e56e-026a-1e3adcec6a51@roeck-us.net>
Date:   Thu, 28 Oct 2021 17:16:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/28/21 11:35 AM, Sam Protsenko wrote:
> On new Exynos chips (like Exynos850) WDT counter must be enabled to make
> WDT functional. It's done via CLUSTERx_NONCPU_OUT register, in
> CNT_EN_WDT bit. Add infrastructure needed to enable that counter.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   drivers/watchdog/s3c2410_wdt.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 7c163a257d3c..a5ef7171a90e 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -97,12 +97,16 @@ struct s3c2410_wdt;
>    * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
>    * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
>    * reset.
> + * @cnt_en_reg: Offset in pmureg for the register that enables WDT counter.
> + * @cnt_en_bit: Bit number for "watchdog counter enable" in cnt_en register.
>    * @quirks: A bitfield of quirks.
>    * @disable_auto_reset: If set, this function will be called to disable
>    * automatic setting the WDT as a reset reason in RST_STAT on CPU reset; uses
>    * disable_reg field.
>    * @mask_reset: If set, this function will be called to mask WDT reset request;
>    * uses mask_reset_reg and mask_bit fields.
> + * @enable_counter: If set, this function will be called to enable WDT counter;
> + * uses cnt_en_reg and cnt_en_bit fields.
>    */
>   
>   struct s3c2410_wdt_variant {
> @@ -111,9 +115,12 @@ struct s3c2410_wdt_variant {
>   	int mask_bit;
>   	int rst_stat_reg;
>   	int rst_stat_bit;
> +	int cnt_en_reg;
> +	int cnt_en_bit;
>   	u32 quirks;
>   	int (*disable_auto_reset)(struct s3c2410_wdt *wdt, bool mask);
>   	int (*mask_reset)(struct s3c2410_wdt *wdt, bool mask);
> +	int (*enable_counter)(struct s3c2410_wdt *wdt, bool mask);

Unless there are different enable functions in the future,
the function is unnecessary. This can be handled as feature bit.

>   };
>   
>   struct s3c2410_wdt {
> @@ -132,6 +139,7 @@ struct s3c2410_wdt {
>   
>   static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
>   static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
> +static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en);
>   
>   static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
>   	.quirks = 0
> @@ -246,6 +254,20 @@ static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
>   	return ret;
>   }
>   
> +static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
> +{
> +	const u32 mask_val = 1 << wdt->drv_data->cnt_en_bit;

BIT()

> +	const u32 val = en ? mask_val : 0;
> +	int ret;
> +
> +	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->cnt_en_reg,
> +				 mask_val, val);
> +	if (ret < 0)
> +		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
> +
> +	return ret;
> +}
> +
>   static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>   {
>   	int ret;
> @@ -262,6 +284,12 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>   			return ret;
>   	}
>   
> +	if (wdt->drv_data->enable_counter) {
> +		ret = wdt->drv_data->enable_counter(wdt, en);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	return 0;
>   }
>   
> 

