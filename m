Return-Path: <linux-watchdog+bounces-2662-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBFCA035BE
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jan 2025 04:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660B53A27C2
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jan 2025 03:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04061531DB;
	Tue,  7 Jan 2025 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7XOaYwh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472902594B1;
	Tue,  7 Jan 2025 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736219642; cv=none; b=b88l27KKRsULslk8qlya+X9xwmvscXKvwkMLJY0ZRr9f0etU4UhPefaVsN6BBv4KExJEZuH5OVn3/FtE2XxShCOTxRmSvynk+WkpICqK5Yp2aPmtACsHW+V1h/UuPUrw46b6tYoQa6S1SlD3YIkyxdZ/9zEREHHMJcADpuVDuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736219642; c=relaxed/simple;
	bh=tM2nkBc4uNl37Tikjz0T0SL8dIkFU1/GOV63eXKgG14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOjnrTCSdnmuqONnuYpR0Jqt0uXVOr2hT7rZ9DD8p841Rre5HUP0Aj/1c3ylm2EfQNYFw8kJXQzo8YYRCWI9ed2/NDeNTPhqeTa5PWHWdxQsbBeBC2cnuNCWl+8p5iX2Y7WXYsTCsenpZBbeQtoAsXEQvqz5NNvTCPI/iRmNyEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7XOaYwh; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso18772848a91.1;
        Mon, 06 Jan 2025 19:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736219638; x=1736824438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=i51dHw5mNIoRaqgYOtjuCasI+NG6Y61PinKIFAENVu0=;
        b=k7XOaYwhHDqtdRRawPUruHFJq6vmXMnGKMBibRFb6RacU0CnNEmFJc3nO1U8a7jq4z
         8xZHeEgJwSBP9Zxc80EfGHSBHQtZbOUQxA7hZqbLwlLHGUetIxDWvtOzu2CuL6ACrAVW
         FZ3QbUj72juy+aWp0V+at4X+lUetNA1IC5r4tpwMeqPF+QaDT3Xa+PnIE4U4FGtcQal/
         MTXR6z0jFVfyNUnfYawPb4jpTBYngvtM9mxXPn53ZswKMUa39etbVsQDGV3RsTvwkivf
         vFJMFsr8PkW78zHPeOx6F6kDdaFYcBaZ/2yOit8ZId8jP1v1RtNl0HqmDZDe8VErgrR0
         X/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736219638; x=1736824438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i51dHw5mNIoRaqgYOtjuCasI+NG6Y61PinKIFAENVu0=;
        b=QjR7V6QT3o61J1Ys5J5H1+XZ9zVMNyYy6M6fJ1iSWWvh/k/yyyXsWcUtKGqN9ZxSOk
         aoRerHf4spHD2geOlOolsclCI2Dcj8wumCzDAjn5O5TiIDI+8OhSR8VUbsH2XjmAJtOf
         w+ZWPr+XHdxT8f+6q7b92u7LXCj09s6iCqjx/LHAQGHNWOk8doh+tixlMm8gKtyrxqFE
         uS4ZvRDXWutUix4Jrjj6Ec+Au+CHCK9sRBfFFY6T/h/j2wJ/40RUDq09eO0JeTDMmcXk
         OU04ePqPYL/Q0sfqRqj9QGzT3ayREySZ4DMGpz57Ka7tT8jPN96+QJg+ba4cYBLctKYB
         40DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUINF5IPA3x7FufMu+PnDwg77ZUcerMPmOt3LxsZ41m7i8Ltg4mg+3eO4EGvPs8CtrJuLXKW8c29kfdd09Pj9o=@vger.kernel.org, AJvYcCWrOvZCqDM1z+nk5676SFBkyD2cvKpX2ajwIxPYhD7/04beu0Hv08NWcEDMr126cJxx3DtvuoxQTbhMdwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo31+SBHXBk6quPuaetB5xO+0Xjvd/yof6BHwyLcoUB+E1PahT
	HywG5/7bZt/uBo/vzoyEiopTReOMff+AfR2T2KdMGtCcgUnx49L+
X-Gm-Gg: ASbGncstCSuFgBpjxUjqzqeV1Om2g3uidmXDiM33Hu56CPE3vzXaQeuIfQwOQFS2cB1
	j0e/PD0MMjZKLhRgVxa4wxoVvnXqRZZvc0leGs36EeVttRZDsTex2T7NHRd97mUHFerW1+f9p7X
	ueb+9DOb9lzMQ7LGvFpJVcC9CVEE5OKzONGtRD5NJcwdW6hXQsOGUz9Nv94sy4BDBGkZTVs62bA
	D2uuqQv7Wzxy227Kf68wA+b/PpQUQpoAvy1dPoNcqjB583V3uAHqBYFSOcp4AwRwtrT9XFlYCPN
	QWC5NGAg03Ep3xyHb//dXjxDuaM5aw==
X-Google-Smtp-Source: AGHT+IEqYTX48WWwIQGYBpAj2HUYugaKpRU3ZceIzqDXA+cx39JjALuCANuONI/3tuRP80rX6if6iQ==
X-Received: by 2002:a17:90b:4ecb:b0:2ee:94a0:255c with SMTP id 98e67ed59e1d1-2f53cc20b46mr2398211a91.13.1736219638490;
        Mon, 06 Jan 2025 19:13:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882ad8sm34534574a91.35.2025.01.06.19.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 19:13:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <80b400b5-0dec-4643-9503-a21a35af5bcb@roeck-us.net>
Date: Mon, 6 Jan 2025 19:13:55 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] watchdog: aspeed: Update bootstatus handling
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz,
 andrew@codeconstruct.com.au, wim@linux-watchdog.org, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, BMC-SW@aspeedtech.com,
 chnguyen@amperecomputing.com, aaron_lee@aspeedtech.com
References: <20250101070116.2287171-1-chin-ting_kuo@aspeedtech.com>
 <20250101070116.2287171-2-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250101070116.2287171-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/24 23:01, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> The bootstatus can be,
> WDIOF_CARDRESET => the system is reset by WDT SoC reset.
> Others          => other reset events, e.g., power on reset.
> 
> On ASPEED platform, the boot status is recorded in the SCU registers.
> - AST2400: Only a bit represents for any WDT reset.
> - AST2500/AST2600: The reset triggered by different WDT controllers
>                     can be distinguished by different SCU bits.
> 
> Besides, on AST2400 and AST2500, since alternating boot event is
> triggered by WDT SoC reset, it is classified as WDIOF_CARDRESET.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 85 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 83 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..1fae70b2fa6b 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -11,21 +11,30 @@
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
> @@ -39,18 +48,36 @@ static const struct aspeed_wdt_config ast2400_config = {
>   	.ext_pulse_width_mask = 0xff,
>   	.irq_shift = 0,
>   	.irq_mask = 0,
> +	.scu = {
> +		.compatible = "aspeed,ast2400-scu",
> +		.reset_status_reg = 0x3c,
> +		.wdt_reset_mask = 0x1,
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
> +		.wdt_reset_mask_shift = 16,
> +	},
>   };
>   
>   static const struct of_device_id aspeed_wdt_of_table[] = {
> @@ -213,6 +240,60 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
> +					 struct aspeed_wdt *wdt)
> +{
> +	struct resource *res;
> +	struct aspeed_wdt_scu scu = wdt->cfg->scu;
> +	struct regmap *scu_base;
> +	u32 reset_mask_width;
> +	u32 reset_mask_shift;
> +	u32 reg_size;
> +	u32 idx = 0;
> +	u32 status;
> +	int ret;
> +
> +	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (res) {
> +			reg_size = res->end - res->start;

Is this correct ? Normally one would use resource_size() which is
res->end - res->start + 1.

> +			if (reg_size)

... and then this if() would not be needed. Either case, if res->end - res->start
is 1, there are actually 2 registers, so the calculation seems off.

> +				idx = ((intptr_t)wdt->base & 0x00000fff) / reg_size;
> +		}
> +	}
> +
> +	wdt->wdd.bootstatus = WDIOS_UNKNOWN;
> +	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
> +	if (IS_ERR(scu_base))
> +		return;

This should be
	if (IS_ERR(scu_base)) {
		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
		return;
	}

to avoid having to clear it below.

> +
> +	ret = regmap_read(scu_base, scu.reset_status_reg, &status);
> +	if (ret)
> +		return;
> +
> +	reset_mask_width = hweight32(scu.wdt_reset_mask);
> +	reset_mask_shift = scu.wdt_reset_mask_shift +
> +			   reset_mask_width * idx;
> +
> +	if (status & (scu.wdt_reset_mask << reset_mask_shift))
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	else
> +		wdt->wdd.bootstatus = 0;
> +
> +	/* clear wdt reset event flag */
> +	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt") ||
> +	    of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-wdt")) {
> +		ret = regmap_read(scu_base, scu.reset_status_reg, &status);
> +		if (!ret) {
> +			status &= ~(scu.wdt_reset_mask << reset_mask_shift);
> +			regmap_write(scu_base, scu.reset_status_reg, status);
> +		}
> +	} else {
> +		regmap_write(scu_base, scu.reset_status_reg,
> +			     scu.wdt_reset_mask << reset_mask_shift);
> +	}
> +}
> +
>   /* access_cs0 shows if cs0 is accessible, hence the reverted bit */
>   static ssize_t access_cs0_show(struct device *dev,
>   			       struct device_attribute *attr, char *buf)
> @@ -458,10 +539,10 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
>   	}
>   
> +	aspeed_wdt_update_bootstatus(pdev, wdt);
> +
>   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
>   	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> -
>   		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
>   		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
>   			wdt->wdd.groups = bswitch_groups;


