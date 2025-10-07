Return-Path: <linux-watchdog+bounces-4343-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E7BC1D1B
	for <lists+linux-watchdog@lfdr.de>; Tue, 07 Oct 2025 16:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375C73A45E6
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Oct 2025 14:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513072E228D;
	Tue,  7 Oct 2025 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg+g94AL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE7C2DF121
	for <linux-watchdog@vger.kernel.org>; Tue,  7 Oct 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848929; cv=none; b=Zry+Hb+I425OddeJqAn+suT5fNh9FuxHFlkOdg7YcmvJlIafGoFaSLyUnVHqC53bwvau6PMUAoU5TUVERasmkY/jy8+96f21EIZAU8nhOlpu4xR/YbtY9h9LsAF7rNCI+V5nEm2Bsz7nvMWKIQufc//rZC/H1KEZVZSMV8LSu3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848929; c=relaxed/simple;
	bh=tvAznuLr1vtoeB9nB5ADN2Il6B8C0yBXOf2jBgR6d3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VnABG4YZHgtF6WaOSDoCrMkGud2uqmhqeFYrrvuYojgnbJOOTdGt5RTQBunB9AkHwO7T9FzeQUY9zY2ZWrQDGQUhc7oX5BBS3WL1QuVuj8GBMjgV9/DxZyEz8R+0KhHQBwL9m7jxvmVQIlu7eaXwCo0YQT9bmKphG0HXmTPz0D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg+g94AL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78125ed4052so6793845b3a.0
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Oct 2025 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848927; x=1760453727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HkyPx7hvenwwKOYWFdLzbbOA8b6X1wKKeSXRsPSnnBw=;
        b=Yg+g94AL6Y3SzafubEtmOF2ocuU4GfNGjizmz5Tgnonb/+rRFbyh2PnGECNGr7m91T
         GHuSBsUKlYJ7Q8IjXvfbtrJdiJWsHzVKX+xkbbk6rRemz6W9Xh79LY7rtEWRzFOjJA2f
         Hlj1e7iZ0YNfZbFfsQvl8EYPKQ1xiBNZ1Ymhg/ju5MjdWJHYTDL8cQMyRYeO98I4Kb+U
         Z3X5OHiA3WmC9KqE+cgtN7kohp359HnyCBJv2T/2SfecFXbf7yeKlva7mDr4QaKV0pl6
         g2+23dFtkZlFURyVQ+tXhlI2dpDKZkHksVfyWCirirlXqGc7Y0e76epZ4kp6mDY3xQuN
         k12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848927; x=1760453727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkyPx7hvenwwKOYWFdLzbbOA8b6X1wKKeSXRsPSnnBw=;
        b=G1BNnDLDoAEpaCM25NF1HNvi6CvQcvhnEWDzK3H1upsJWZZlzrQiDN+XaiKt2EOUx1
         TSuDdnaSWF8GAB7N4htC13+bU6qmak5NOXxc4/CcvainqqwCo4PGPxqDjJ3Ngq888X1P
         PkgvMwPfFd0QexuTs+/t4pJayzlbYGpQe0/V754oQmEm3VIT3NDiQki6gDZQtzWMuySD
         /pp3MPIhlCLXhfk9wy5g12cSXj7fv5xJyvAzJ583H+B88RNEiGXHWy4rsIZz8nW8UrjE
         F9N+QNrQogA4s9ehllNk28i65eHJ1dPdtFY1+DtbO9H3Nzp+eG5bHiVSL4OAGMiX7/gS
         GecQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuTCqFZTQL7h4YKRmWo8Nj4SXp5DTkJch1lgYV/xaLBX5vEdqWbhDXAGea17EmIwU9vD6YFBh8kQcf1U0/PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSAnxHqF6YCHCThxTnjKu7g05g2FPHDu/jA8BjcfVydmFb1twQ
	ohQQaL4sZh+sewAsfXqntnpTTOWl9LOhXV7E2IoLDn6cCO8MK6jxH1Bo
X-Gm-Gg: ASbGncuLbMg4bhtJXBA5WT6yKlPUoSOgex9711UA8FG6G7IKEPyRi0EQO8qz14gYJ2n
	qXIpdJK21PpEq56LMM2z2iJEDyDURB3IvXsb1FJNNWoCgmhq77l+vuVSGjlKzaHlbFp4YO5oN8g
	m1z2LNlgCaLvLh+CPCwt1S4g/GFmjEbe9U0RadzfoOE51ntT50NZ2MxPMdZ7oIMFPQQGv1p31hR
	XgpTQGNIx0HpyJCEkF3zZgM7xvmCjsTQoemLFnb+iNUoVQEUWgxYveNsqsl1Uj/IVS4MnW0DW1n
	kbvrcHYf4aXcUlKvVStLjr/S+PGh6kxhXP/VCxthm3MDFJn2fipyXKCcqVqkdqAO/UsNC4BHFeU
	CmBpHL5kB+oaoFvdbinrcGIWuXxi9ntkeVQjnkzpk5KHXf03XsnO1+1ASKHyagB2NF0yVbkGY73
	1+85lxQYEnxgABbiZHPQg=
X-Google-Smtp-Source: AGHT+IGdyeoXpxl1XmF0tLtlO/xz3iQ1BZuV8N6S1k1HOqZoXjG87A15BN5CloCPSK/tUguPJ8dO2w==
X-Received: by 2002:a05:6a00:14d3:b0:783:cb49:c67b with SMTP id d2e1a72fcca58-78c98cf84d3mr22847057b3a.32.1759848926898;
        Tue, 07 Oct 2025 07:55:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02074663sm16035781b3a.74.2025.10.07.07.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:55:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <83a90651-0b46-4c68-ab90-361422192e90@roeck-us.net>
Date: Tue, 7 Oct 2025 07:55:23 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: aspeed: Support variable number of reset
 mask registers
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
References: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
 <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/25 01:36, Chin-Ting Kuo wrote:
> Starting from the AST2600 platform, the SoC design has become more
> complex, with an increased number of reset mask registers.
> To support this, introduce a new field 'num_reset_masks' in the
> 'aspeed_wdt_config' structure to specify the number of reset mask
> registers per platform. This change removes the need for hardcoded
> platform-specific logic and improves scalability for future SoCs.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 837e15701c0e..e15f70c5e416 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -35,6 +35,7 @@ struct aspeed_wdt_config {
>   	u32 irq_shift;
>   	u32 irq_mask;
>   	struct aspeed_wdt_scu scu;
> +	u32 num_reset_masks;
>   };
>   
>   struct aspeed_wdt {
> @@ -54,6 +55,7 @@ static const struct aspeed_wdt_config ast2400_config = {
>   		.wdt_reset_mask = 0x1,
>   		.wdt_reset_mask_shift = 1,
>   	},
> +	.num_reset_masks = 1,

Looking at this again: Why set it on ast2400 ?

>   };
>   
>   static const struct aspeed_wdt_config ast2500_config = {
> @@ -66,6 +68,7 @@ static const struct aspeed_wdt_config ast2500_config = {
>   		.wdt_reset_mask = 0x1,
>   		.wdt_reset_mask_shift = 2,
>   	},
> +	.num_reset_masks = 1,
>   };
>   
>   static const struct aspeed_wdt_config ast2600_config = {
> @@ -78,6 +81,7 @@ static const struct aspeed_wdt_config ast2600_config = {
>   		.wdt_reset_mask = 0xf,
>   		.wdt_reset_mask_shift = 16,
>   	},
> +	.num_reset_masks = 2,
>   };
>   
>   static const struct of_device_id aspeed_wdt_of_table[] = {
> @@ -482,8 +486,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
>   		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {

... because the code here only evaluates it if this is an ast2500 or ast2600.

If num_reset_masks would be set to 0 for ast2400, the value could be used here.

	if (wdt->cfg->num_reset_masks) {
		...
	}

and it would not be necessary to add of_device_is_compatible() for new chips.

Guenter

>   		u32 reset_mask[2];
> -		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
> +		size_t nrstmask = wdt->cfg->num_reset_masks;
>   		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
> +		int i;
>   
>   		reg &= wdt->cfg->ext_pulse_width_mask;
>   		if (of_property_read_bool(np, "aspeed,ext-active-high"))
> @@ -503,9 +508,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   
>   		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
>   		if (!ret) {
> -			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
> -			if (nrstmask > 1)
> -				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
> +			for (i = 0; i < nrstmask; i++)
> +				writel(reset_mask[i], wdt->base + WDT_RESET_MASK1 + i * 4);
>   		}
>   	}
>   


