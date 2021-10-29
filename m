Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A8643F3C8
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 02:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhJ2ASs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 20:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhJ2ASr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 20:18:47 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A778C061570;
        Thu, 28 Oct 2021 17:16:19 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so11071320ote.13;
        Thu, 28 Oct 2021 17:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Reu5vQu5v3G9uPqc84yT+tJo+nsIepqdx+3dq6lKe/k=;
        b=FOSO/DefGNdI0WqQIV/fCwCqtcnI931tQ5emh6UmChRUjVUmkCwtD+/dqyow7tkzGK
         tY13lrRWsxV8qwX2TMExn+w7/eBaDwbDtQK8ELV/0D3OmNWmlMH8t0T9A9KT2g5Zibuk
         xoARkEmbnHgmjtZMbUTBqwexcxpIEqTH0P9nsrnTXQUw9c82U37vtDuNi54WXkjrKnfN
         RH4932jljEQ9Y9zm8uO4OhhDtZNyvkhxuTMQY107zSjjJRuvz5VERBPJvpeslID0LfRW
         JBiHS1bKLOnSyuUk1h6LexZ+fpMx3zijSMGJJaPXvVABuqQqO7hi9S5vpZCa8ely/cL0
         +LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Reu5vQu5v3G9uPqc84yT+tJo+nsIepqdx+3dq6lKe/k=;
        b=Ut3v1KCY8hzkoJnHiN62KwZiwwTrTJkMppLEoUR8Ckh/jdgUuCrqo92ImsOLZVxZ1u
         0XJMg78mgIgs3DbPjOIy0vqsbvgpaoEs1K4VHIv8vfzddSQ4CvwDFi/vLUh6eW3faNfk
         j/3W0v62Pvv5Yk2CTQir4SqE+8O32ROjO5hfbnl6ZBulUreCNuRdXq8HPcGpcRZLbGzj
         oyYgGT2qGk6bKmGhj3R1xcgPDEoOZ+5G+LV23RQBwtWihyDIhFZgsab28Un7bC+bzlsi
         rVWQao4cQ30uBfsiMS1s9W+ve1A4EriAcX1DQSMs/g5m7M4Z977dM4G7gqEs+RDHXWwa
         5c4g==
X-Gm-Message-State: AOAM530dxfh0XGtmrcFh3carRV9yAa8wvbzmwJI2302XQsDxvlMqnYHe
        aSRWO+7Jm6S7NAxDpCIbBSxG3xHAcSQ=
X-Google-Smtp-Source: ABdhPJzVmZ/8NAXNn6L3UlD6/f6IggRDiQKoQ7nWlvttlEsakoyBg5VgswAXHiyjLVW0a3EgFGmwZA==
X-Received: by 2002:a9d:764c:: with SMTP id o12mr6202890otl.129.1635466578419;
        Thu, 28 Oct 2021 17:16:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bn13sm1374454oib.37.2021.10.28.17.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 17:16:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/7] watchdog: s3c2410: Make reset disable optional
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-4-semen.protsenko@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b9c33def-6b12-1e5a-4449-b1e0869a0e3a@roeck-us.net>
Date:   Thu, 28 Oct 2021 17:16:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/28/21 11:35 AM, Sam Protsenko wrote:
> Not all SoCs have AUTOMATIC_WDT_RESET_DISABLE register, examples are
> Exynos850 and Exynos9. On such chips reset disable register shouldn't be
> accessed. Provide a way to avoid handling that register. This is done by
> introducing separate callbacks to driver data structure: one for reset
> disable register, and one for mask reset register. Now those callbacks
> can be checked and called only when those were set in driver data.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 

That doesn't explain why the callbacks are needed instead of additional
feature flags.

Guenter

> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   drivers/watchdog/s3c2410_wdt.c | 81 ++++++++++++++++++++++++----------
>   1 file changed, 58 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 2395f353e52d..7c163a257d3c 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -83,6 +83,8 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>   MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to reboot (default 0)");
>   
> +struct s3c2410_wdt;
> +
>   /**
>    * struct s3c2410_wdt_variant - Per-variant config data
>    *
> @@ -96,6 +98,11 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
>    * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
>    * reset.
>    * @quirks: A bitfield of quirks.
> + * @disable_auto_reset: If set, this function will be called to disable
> + * automatic setting the WDT as a reset reason in RST_STAT on CPU reset; uses
> + * disable_reg field.
> + * @mask_reset: If set, this function will be called to mask WDT reset request;
> + * uses mask_reset_reg and mask_bit fields.
>    */
>   
>   struct s3c2410_wdt_variant {
> @@ -105,6 +112,8 @@ struct s3c2410_wdt_variant {
>   	int rst_stat_reg;
>   	int rst_stat_bit;
>   	u32 quirks;
> +	int (*disable_auto_reset)(struct s3c2410_wdt *wdt, bool mask);
> +	int (*mask_reset)(struct s3c2410_wdt *wdt, bool mask);
>   };
>   
>   struct s3c2410_wdt {
> @@ -121,6 +130,9 @@ struct s3c2410_wdt {
>   	struct regmap *pmureg;
>   };
>   
> +static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
> +static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
> +
>   static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
>   	.quirks = 0
>   };
> @@ -138,6 +150,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
>   	.rst_stat_bit = 20,
>   	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
>   		  | QUIRK_HAS_WTCLRINT_REG,
> +	.disable_auto_reset = s3c2410wdt_disable_wdt_reset,
> +	.mask_reset = s3c2410wdt_mask_wdt_reset,
>   };
>   
>   static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
> @@ -148,6 +162,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>   	.rst_stat_bit = 9,
>   	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
>   		  | QUIRK_HAS_WTCLRINT_REG,
> +	.disable_auto_reset = s3c2410wdt_disable_wdt_reset,
> +	.mask_reset = s3c2410wdt_mask_wdt_reset,
>   };
>   
>   static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> @@ -158,6 +174,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>   	.rst_stat_bit = 23,	/* A57 WDTRESET */
>   	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
>   		  | QUIRK_HAS_WTCLRINT_REG,
> +	.disable_auto_reset = s3c2410wdt_disable_wdt_reset,
> +	.mask_reset = s3c2410wdt_mask_wdt_reset,
>   };
>   
>   static const struct of_device_id s3c2410_wdt_match[] = {
> @@ -200,35 +218,53 @@ static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
>   	return container_of(nb, struct s3c2410_wdt, freq_transition);
>   }
>   
> -static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
> +static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
>   {
> +	const u32 mask_val = 1 << wdt->drv_data->mask_bit;
> +	const u32 val = mask ? mask_val : 0;
>   	int ret;
> -	u32 mask_val = 1 << wdt->drv_data->mask_bit;
> -	u32 val = 0;
>   
> -	/* No need to do anything if no PMU CONFIG needed */
> -	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG))
> -		return 0;
> +	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->disable_reg,
> +				 mask_val, val);
> +	if (ret < 0)
> +		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
>   
> -	if (mask)
> -		val = mask_val;
> +	return ret;
> +}
>   
> -	ret = regmap_update_bits(wdt->pmureg,
> -			wdt->drv_data->disable_reg,
> -			mask_val, val);
> -	if (ret < 0)
> -		goto error;
> +static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> +{
> +	const u32 mask_val = 1 << wdt->drv_data->mask_bit;
> +	const u32 val = mask ? mask_val : 0;
> +	int ret;
>   
> -	ret = regmap_update_bits(wdt->pmureg,
> -			wdt->drv_data->mask_reset_reg,
> -			mask_val, val);
> - error:
> +	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
> +				 mask_val, val);
>   	if (ret < 0)
>   		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
>   
>   	return ret;
>   }
>   
> +static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
> +{
> +	int ret;
> +
> +	if (wdt->drv_data->disable_auto_reset) {
> +		ret = wdt->drv_data->disable_auto_reset(wdt, !en);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (wdt->drv_data->mask_reset) {
> +		ret = wdt->drv_data->mask_reset(wdt, !en);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>   {
>   	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> @@ -609,7 +645,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_cpufreq;
>   
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> +	ret = s3c2410wdt_enable(wdt, true);
>   	if (ret < 0)
>   		goto err_unregister;
>   
> @@ -655,7 +691,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>   	int ret;
>   	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
>   
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> +	ret = s3c2410wdt_enable(wdt, false);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -672,8 +708,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
>   {
>   	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
>   
> -	s3c2410wdt_mask_and_disable_reset(wdt, true);
> -
> +	s3c2410wdt_enable(wdt, false);
>   	s3c2410wdt_stop(&wdt->wdt_device);
>   }
>   
> @@ -688,7 +723,7 @@ static int s3c2410wdt_suspend(struct device *dev)
>   	wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
>   	wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
>   
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
> +	ret = s3c2410wdt_enable(wdt, false);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -708,7 +743,7 @@ static int s3c2410wdt_resume(struct device *dev)
>   	writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
>   	writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
>   
> -	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
> +	ret = s3c2410wdt_enable(wdt, true);
>   	if (ret < 0)
>   		return ret;
>   
> 

