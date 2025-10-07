Return-Path: <linux-watchdog+bounces-4342-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F21BC1CA6
	for <lists+linux-watchdog@lfdr.de>; Tue, 07 Oct 2025 16:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580ED188C90A
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Oct 2025 14:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76F72E267D;
	Tue,  7 Oct 2025 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJRzAuWj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C192E22B4
	for <linux-watchdog@vger.kernel.org>; Tue,  7 Oct 2025 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848383; cv=none; b=SUQF3BIrpAAAPLzEp/d3pbosNlG/F6iZRN4uO9eklMY6IpQkbMMCTQqlD1VJ9wyiBOonaCO3/Yt2Qebs0zDeuAdrUYnoDICM4xQJLGAAOA+oqx5AbBnUIoQMlpS1xYbASI6g4Q4zK0n6eC/hHswyCvnKmySdjsTGpzp62HdDdsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848383; c=relaxed/simple;
	bh=hN2prB9LUKJ+cS3hM4Hb3e6Lx7vIkqmVkLn74pdKqUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eXb+UXy8wHU/xDO6tF01D+NHyy+1ZtleqPTa/smam2kheH0ZGEaKCU48hPRlWQsqKNt7jQW8QDcCA0l5FZX7WNhCJqePjthj9STNiIDtLf3K/N86V4maRvQsKodzXJ4V8H+oL/srq3YRfDJjUSqR1Rm87/DZnWGaN2UWZ7l4TY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJRzAuWj; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b555ab7fabaso6284894a12.0
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Oct 2025 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848381; x=1760453181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x7a7yYa2BC6M94EJB0V15A3UsNpa5OhhLhNC4izb/8o=;
        b=cJRzAuWjzHxR2z0x3ir7nncBb6UBJZ9LRoXArPtRHdJ7FHUBqsbaYfZr9ZFu2j3Y8D
         0tlK4S/yfewOFv171y0r5dCI+Gm7RmbIhvjCQVFXKrNhom6MYkTwTl3Va3OW6+6wOteX
         5wKn+nVDMc4T9YjNs1L3420oKLCNgDA35U+O6uXRA/Oa0fc4K0CTuSyBXGte9pvSfxkO
         JM12VReOW48nSxnjmnkKs1JZp12idGY55H80XKgVN17v6UHOMR+lFx4+zygm946d7OUB
         DJkG+/UC5O1l1uBiZNZucufyHarm9j5w0aDyy5s8XYMgeGDLqBYlq6pW/0CfaTpctzCF
         LDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848381; x=1760453181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7a7yYa2BC6M94EJB0V15A3UsNpa5OhhLhNC4izb/8o=;
        b=fcZVAYB+77P7Buabyn0tvYsYQhGnj6g//UkoDRaJ3BWBr0fgmiFj/G2E9ZWTnTthGq
         AmowtmXihoT1o9SPAi/Hr5vcH7v8iFs9Z51rKObCqryK5tD8dl7wEbZfQnD7meWbuOSM
         ncMHUyUdBD7Eif0lH5CwBBrBi1033R3QhSBUriWeeCLvQsnb1sMq5aoJNZPNfk8d33tw
         FlC/hQ0sEjlXGyAo3u56dAJIK61IoGydH7o/4MQ2kFRefs0OBo5+Tbv1P0zyV2vxVJ/E
         wgwTkivU3gZK10qkhCbtBOVMB4b7+4ZskmgndJWxQxBV6m6gfM8bSj5D+4lhFKfX83yu
         hbQw==
X-Forwarded-Encrypted: i=1; AJvYcCVdhEH0XSoUAvlSVcDuz/Zgj07cW2pTlGtQlI3Cj3rthMiiVY8FGBCVUGM3/58ZzrvQIhZzKPUBEVev56wCDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgpfaeAoLezz52MiZku3JFkz4Cf3Lq89OhAHG6gnTfPwOdwxVt
	uIAhhwPZ4f116pmZSQajgbRdzBYztdSrOfYYsefTkqr4KapJgi824vfX
X-Gm-Gg: ASbGncuqKscEvfxjXvHjzT0XQ8zjSCI8iOgZfIweje6tXqc3fXz0wvjZZzblLHz0skW
	MnbmQ6FCLlOu+YXj2e6weHCAzg5AhITdgz2SuFB8eYEfwHFVjiA/stYPXl+cNWhc/4KnWrFV6+X
	N75V5w/mDrZhNddf1c2lIh3nZXBUfDtlsxnOEFv0aVr5YfKn/46p74Irm5+Wpffl7f5VXqlSlV9
	dMYzDq1fhvFKx8CizVIvxu5kWwsRdmz7n6IokZEVfs36ofcystP+0h/FCQ8LxJzMFyhoNcTnQVx
	wxkdoAhwhz52LUH+POdH6TMvO5W7XU6ebQNkJWe5zwVjxhfPPjq/e0hJ4IHL6McMDmYITxZNFe2
	Gi01J+pXSiSUX32F0IKZhilcD96fV2zShFBOZ98nB1H9+6Et/tRP1YSYEFQ2nAjXOUu9n0dBajH
	thbjqRrCqcN8Xik5aiBaM=
X-Google-Smtp-Source: AGHT+IHkTsFD9LWAFhO0iOSkzrJT/uIU3911ebutolUwZI//wZBM03f90uGhttRLUzWdNvxdYPBNOw==
X-Received: by 2002:a17:90b:180d:b0:338:26e3:ffb6 with SMTP id 98e67ed59e1d1-339c27b82c3mr23254788a91.26.1759848380860;
        Tue, 07 Oct 2025 07:46:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebdac1sm20685978a91.9.2025.10.07.07.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:46:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <97b3872b-7f4f-482a-ab89-5b345ea0ffb2@roeck-us.net>
Date: Tue, 7 Oct 2025 07:46:10 -0700
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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


