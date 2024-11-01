Return-Path: <linux-watchdog+bounces-2407-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B39B9AB4
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 23:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9371F2135D
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 22:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D773157E78;
	Fri,  1 Nov 2024 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEWFwShA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D371BDC3;
	Fri,  1 Nov 2024 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730499405; cv=none; b=Ahjn4OISdi7D0cIhuccA7yH2A2ia0L4APf8cLTKI6caV8wWc1C3rbPE51f+6fg4xptjIOb3RDCxoLDPykWOD/NKhBUUOeZA2MTMdLQznitspOUwi6JdnNbZVxplI9wOZxGX8I/xbgKcrpneXdfjX/mcxsdgqOu7TrDyVxK5lJy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730499405; c=relaxed/simple;
	bh=uZ5dPDGpE0eiP8j9ElLlKmGq5FqeHBMo5AS3riI6HLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6jmJFi1c159KQNA21yv7a9eS2ooDvcbe6K5dqPknRWRIlLmE0nDqbfCl619fgo2+PHc4NGS5n+eFuIwRsbr9OGcWuZF2aRNQWRuQcvh8ENP1IkOADbeYK1SOqbCQEXEbHoRdn7dMyzzWHrzeTpxcIromhUrkA+Z5VUENlDv5no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEWFwShA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c803787abso19523945ad.0;
        Fri, 01 Nov 2024 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730499402; x=1731104202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oVssyuWMC9NgATc0QPLGb+0NJAZIL3+HDWYCveIr8Uk=;
        b=aEWFwShALAEWcWFfQr+VWDNAbkxkBrTeB89oirMNZbpp9BbaloRf5l8llwRjjlSddD
         JApCvQmTD/kzIvrXoc3gQQH19ctdrIJSWnS8Bw8XzY9bg5X/f8Jz45p/ntmH4MtSB7IO
         Tn18kKk4A1GtqvcbNEjygr3W0YOhFKjfnEpnHLqZJ9zeamavpCief+60hQi4Anhetzhi
         bNHbmgvKtcEYimPAuPcNR+DxMy4UmrzPGls8PCV3NVd11zhM+aME4QBH+R9oAQjANSt8
         DChh5h6yLP8u/LTf709tWct/N46ciel2ci/U+MMMc6MsC9SjWGP/SIzOUiCWXzwmfT09
         bdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730499402; x=1731104202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVssyuWMC9NgATc0QPLGb+0NJAZIL3+HDWYCveIr8Uk=;
        b=Yn6quMwFe992CY/wECcRO+65/oPHiybx8nvQjKnIBbfMt2Zz75pIJ9Ju1rFFrTMvMw
         bHUc30TZKz/CC1hiem5POGWwNdg95CB4dpVR/vQ9UxPa0wzTiQnnded9FG6yO99gzq/V
         dijEF+1Y+/2ixKPYuG+KAHJGICUq+QBFtWuk8hZoH43vXTRXwEyb2W7m1zCf/5EsQXPS
         ijgQ8KOmWrku+pmwigy8s6Rjit9nUVfC3ls5nIghIy9tfOHoi+39xxgz/4eC2GqOHFcS
         gpks/yeRrg9VkedgXjgd2nwhSrynW8TzegLOMBgZ1YVAkouMparyTgXaZXRBTqTrrqZ4
         SE/g==
X-Forwarded-Encrypted: i=1; AJvYcCW4Vd3Kk+WlzdYcRaWY+4DfnyRQVsCw3RTR1NShB2qkxgzQZ2uiBt7mOKco3gEpYT/TxHHZSnilmf2DclW4IAg=@vger.kernel.org, AJvYcCWUiSvoOuZdcgT/EiHAeMsqs24OWZ1+T2IvtBDpZ6mSp0F+4XictQqru0a3beTVtaIGKamaBADnKfh112A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKuESVnn0EBs/G2mvZ8CiSA6SBx8BugjTDX3Tvf0lmEDgVL9y+
	zNamU4NI8Gwwf2kZREhIWsyBj/YNW07XOZIEsNiFU8jl/4DQdqJG
X-Google-Smtp-Source: AGHT+IGGxzxBg3TMMhNZ6zH3wiG+bSdfe1EX9LN1h70yeyUfvlvrjw3I/QyBdD//3HGtM/YIKK7dew==
X-Received: by 2002:a17:902:e74e:b0:20c:76a1:604b with SMTP id d9443c01a7336-211056ee4a3mr122555475ad.12.1730499402353;
        Fri, 01 Nov 2024 15:16:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d9750sm25573205ad.280.2024.11.01.15.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:16:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <787d7a81-0f53-4dbb-b8d6-f7b00e9cf837@roeck-us.net>
Date: Fri, 1 Nov 2024 15:16:39 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz,
 joel@jms.id.au, andrew@codeconstruct.com.au, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com,
 DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com, chnguyen@amperecomputing.com
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/24 05:11, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> 
> The boot status mapping rule follows the latest design guide from
> the OpenBMC shown as below.
> https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-update.md#proposed-design
> - WDIOF_EXTERN1   => system is reset by Software
> - WDIOF_CARDRESET => system is reset by WDT SoC reset
> - Others          => other reset events, e.g., power on reset.
> 
> On ASPEED platform, the boot status is recorded in the SCU registers.
> - AST2400: Only a bit represents for any WDT reset.
> - AST2500: The reset triggered by different WDT controllers can be
>             distinguished by different SCU bits. But, WDIOF_EXTERN1 or
>             WDIOF_CARDRESET still cannot be identified due to
>             HW limitation.
> - AST2600: Different from AST2500, additional HW bits are added for
>             distinguishing WDIOF_EXTERN1 and WDIOF_CARDRESET.
> 
> Besides, since alternating boot event is triggered by WDT SoC reset,
> it is classified as WDIOF_CARDRESET.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 83 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 81 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..4ad6335ff25b 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -11,21 +11,31 @@
>   #include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/kstrtox.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/watchdog.h>
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
>   module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +struct aspeed_wdt_scu {
> +	const char *compatible;
> +	u32 reset_status_reg;
> +	u32 wdt_reset_mask;
> +	u32 wdt_sw_reset_mask;
> +	u32 wdt_reset_mask_shift;
> +};
>   
>   struct aspeed_wdt_config {
>   	u32 ext_pulse_width_mask;
>   	u32 irq_shift;
>   	u32 irq_mask;
> +	struct aspeed_wdt_scu scu;
>   };
>   
>   struct aspeed_wdt {
> @@ -39,18 +49,39 @@ static const struct aspeed_wdt_config ast2400_config = {
>   	.ext_pulse_width_mask = 0xff,
>   	.irq_shift = 0,
>   	.irq_mask = 0,
> +	.scu = {
> +		.compatible = "aspeed,ast2400-scu",
> +		.reset_status_reg = 0x3c,
> +		.wdt_reset_mask = 0x1,
> +		.wdt_sw_reset_mask = 0,
> +		.wdt_reset_mask_shift = 1,
> +	},
>   };
>   
>   static const struct aspeed_wdt_config ast2500_config = {
>   	.ext_pulse_width_mask = 0xfffff,
>   	.irq_shift = 12,
>   	.irq_mask = GENMASK(31, 12),
> +	.scu = {
> +		.compatible = "aspeed,ast2500-scu",
> +		.reset_status_reg = 0x3c,
> +		.wdt_reset_mask = 0x1,
> +		.wdt_sw_reset_mask = 0,
> +		.wdt_reset_mask_shift = 2,
> +	},
>   };
>   
>   static const struct aspeed_wdt_config ast2600_config = {
>   	.ext_pulse_width_mask = 0xfffff,
>   	.irq_shift = 0,
>   	.irq_mask = GENMASK(31, 10),
> +	.scu = {
> +		.compatible = "aspeed,ast2600-scu",
> +		.reset_status_reg = 0x74,
> +		.wdt_reset_mask = 0xf,
> +		.wdt_sw_reset_mask = 0x8,
> +		.wdt_reset_mask_shift = 16,
> +	},
>   };
>   
>   static const struct of_device_id aspeed_wdt_of_table[] = {
> @@ -213,6 +244,52 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +static int aspeed_wdt_update_bootstatus(struct platform_device *pdev,
> +					struct aspeed_wdt *wdt)
> +{
> +	struct resource *res;
> +	struct aspeed_wdt_scu scu = wdt->cfg->scu;
> +	struct regmap *scu_base;
> +	u32 reset_mask_width;
> +	u32 reset_mask_shift;
> +	u32 reg_size = 0;

Please no unnecesary initializations.

> +	u32 idx = 0;
> +	u32 status;
> +	int ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reg_size = res->end - res->start;
> +
> +	if (reg_size != 0)
> +		idx = ((intptr_t)wdt->base & 0x00000fff) / reg_size;
> +
> +	/* On ast2400, only a bit is used to represent WDT reset */
> +	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt"))
> +		idx = 0;
> +

There is some redundancy in the above code, and platform_get_resource()
can return NULL. If idx==0 for aspeed,ast2400-wdt anyway, the code can be
rewritten as

	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
		if (res) {
			reg_size = res->end - res->start;
			if (reg_size)
				idx = ((intptr_t)wdt->base & 0x00000fff) / reg_size;
		}
	}

> +	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
> +	if (IS_ERR(scu_base))
> +		return PTR_ERR(scu_base);
> +
> +	ret = regmap_read(scu_base, scu.reset_status_reg, &status);
> +	if (ret)
> +		return ret;

The above only affects bootstatus. Why fail to load the driver just because
bootstatus can not be read ?

> +
> +	reset_mask_width = hweight32(scu.wdt_reset_mask);
> +	reset_mask_shift = scu.wdt_reset_mask_shift +
> +			   reset_mask_width * idx;
> +
> +	if (status & (scu.wdt_sw_reset_mask << reset_mask_shift))
> +		wdt->wdd.bootstatus = WDIOF_EXTERN1;
> +	else if (status & (scu.wdt_reset_mask << reset_mask_shift))
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	else
> +		wdt->wdd.bootstatus = 0;

That is already 0.

> +
> +	return regmap_write(scu_base, scu.reset_status_reg,
> +			    scu.wdt_reset_mask << reset_mask_shift);
> +}
> +
>   /* access_cs0 shows if cs0 is accessible, hence the reverted bit */
>   static ssize_t access_cs0_show(struct device *dev,
>   			       struct device_attribute *attr, char *buf)
> @@ -458,10 +535,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
>   	}
>   
> +	ret = aspeed_wdt_update_bootstatus(pdev, wdt);
> +	if (ret)
> +		return ret;
> +
>   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
>   	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> -
>   		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
>   		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
>   			wdt->wdd.groups = bswitch_groups;


