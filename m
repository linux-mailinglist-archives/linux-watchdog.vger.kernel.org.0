Return-Path: <linux-watchdog+bounces-2958-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D6A3960C
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 09:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E89E63BA533
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 08:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E032622DFAC;
	Tue, 18 Feb 2025 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="D1gbhU93"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB9522B8D5
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Feb 2025 08:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739868069; cv=none; b=sAmM4HzUjJq4yTFPgo6599J7oLLkc4xJw1kh1hnrBuZ92wL+tCH/zNRTbKJMeAZXeVKSYhIcfR5tCa6mmP+I6tU1vf1BKvYJr4GobvLlPxKs6FQ6GbslnPtmnmeVpRlSmXylKXBcMInxp0vM79RyDmIkoRhyaf03HPT4b3gWYLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739868069; c=relaxed/simple;
	bh=aIQB0ryPbjTFqrvujq0NG69gPIMMvN6Asu30Bhr0HOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lyk/uEN051XhHwQu6ddVcyTDZ2IW+VxouuEuRopAPPTdLn6cJ88jOI0iMNCSsCl6m/dpIBRB+A0tiN4r+Tj7tYRB3rHEW/SCGY34U1fh/5JaGtdkqcORh/hPwte7PsswayRi9z12TZr7yc7g9PkLWftsQebALPj8mZ6FAdCmy3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=D1gbhU93; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso3285676a12.2
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Feb 2025 00:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739868066; x=1740472866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lv/mXKWMKUfLoohDMfoS7J+NTI2dz/TZ4RnHEggjlBE=;
        b=D1gbhU935judHdBWDbwuW8fW+XmPdtaPY4HvwQTbn41XKcOwcdhq21Jx2BHQXkm/vx
         BqNBWhm2fttNTS1+gadmo7Yyu9K0BvUjnVM+Ky36iClbstdBORZ903i1iZpPpAEIe6lI
         Pz+dkb8mGf2lG56JIPr+7oJ0oRSMpjRG2eb5+bgTP6TatEeaPz/Zh+5K9JsQqz/y6gmg
         Tyb9heyKIwEV9kIvna8MNHNN0GnmM0XWmgd8xejPWwbilAIUgXyHhAc8mW/cdHIgUrFe
         KX/8ZUIuV9n7cF7Yd2hd5IWWNuvKUbpb2uJDrTB+wCc42G+XzYTfqZftj/nkFq+Got/D
         dmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868066; x=1740472866;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lv/mXKWMKUfLoohDMfoS7J+NTI2dz/TZ4RnHEggjlBE=;
        b=EYu3w9kuxSMCeL1O3XRYESzXSFoPKtAal0b6KkIfPCGiB2cZ6vbeHG9sAw3UiN8ksV
         WuL3i4TgHc5ySw9nWNebnrO8q+rrI5wpbIsl9QUemr2DU9XSmXaMCwDNVRKiuUgQs9XM
         xcmRH1cgUj0TuXBldQs4MI5WUG1m0bFE5tpzV0qroUiXuDyuo27vlq7uFPgKaW5H7y24
         C+FV+gTPhhRECC8kBtQ0eOTVsQLW7xzGDlA6cb4IfLtqgmHlh8HNL22SprrlA0+n616k
         QKimFyROhnVlDquRxezhMSwvCsuagmcRmZNoAjeuWkE29SG+GpsWkCt+7MQ5cqwO3UpW
         cO/g==
X-Forwarded-Encrypted: i=1; AJvYcCVtmXDlimVa/zvaTXt1fv3bBttSx97qo1Ocnn5DM8N65eZINWbmutxbM8ftl4NdbUfEwNllSEH1q8PYs2sEbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZE5oYoIm50kOUR0nd20zcGrwHoaC85HSG1KcfAiIPLvr5F3O
	Yhwz38Jy1IgKnm7gttmNjucREeS0AXm6WinvwhEQab+ppQ7n6EcIRgf2dJDQn80=
X-Gm-Gg: ASbGnct52QdfdX20QWpT8JJlZX6hoYVsz72Md+uVclBO8mDsdPbcz0W3KBZ3vdE6SQm
	/+Cv5DrClj6AZT1UdHK0EHkBoYa3fQN4DDDhxsV2dhg/Kygd5tpgJduB/R7B5fFYaaGp0/8TAUr
	eSAskKb8Ni9LemIDqSY0pblp27uDbyizGxHVRVI7JAcZmANcYa56nDfAOcUIrB0YsZoCYDMOMwD
	/TfR6mscqJ2ea51c8rQUVImdVZ2EXLZpw3mKZRGY++WAkoOcmTge0tGEPROn8Cwd5wp/xNEFajX
	CmryEY+XmUIWRXS1zbing0c=
X-Google-Smtp-Source: AGHT+IESJYF9ZfQnOU6rdJpLeVFJ0jmKCKyIk4s175nUK6ewa/oKH2Y+cggyLDQb+JelZTRVjqvbag==
X-Received: by 2002:a17:907:d204:b0:abb:b249:4410 with SMTP id a640c23a62f3a-abbb249464amr346278966b.39.1739868064851;
        Tue, 18 Feb 2025 00:41:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm384261766b.111.2025.02.18.00.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 00:41:04 -0800 (PST)
Message-ID: <05f1e875-0068-4b3a-a400-e906605a3cda@tuxon.dev>
Date: Tue, 18 Feb 2025 10:41:01 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] ARM: dts: microchip: sama7d65: Add DMAs to sama7d65
 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <78da4125a991c6f4081fce78825f1f983091e0f5.1739555984.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <78da4125a991c6f4081fce78825f1f983091e0f5.1739555984.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DMAs to the SAMA7D65 SoC device tree.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index d06a51972d363..b472a7d929ee4 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <dt-bindings/clock/at91.h>
> +#include <dt-bindings/dma/at91.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -95,6 +96,17 @@ chipid@e0020000 {
>  			reg = <0xe0020000 0x8>;
>  		};
>  
> +		dma2: dma-controller@e1200000 {
> +			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
> +			reg = <0xe1200000 0x1000>;
> +			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>;
> +			clock-names = "dma_clk";
> +			dma-requests = <0>;
> +			status = "disabled";
> +		};
> +
>  		sdmmc1: mmc@e1208000 {
>  			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
>  			reg = <0xe1208000 0x400>;
> @@ -107,6 +119,26 @@ sdmmc1: mmc@e1208000 {
>  			status = "disabled";
>  		};
>  
> +		dma0: dma-controller@e1610000 {
> +			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
> +			reg = < 0xe1610000 0x1000>;

There is an extra space b/w < and 0x. I can adjust while applying.

> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 21>;
> +			clock-names = "dma_clk";
> +			status = "disabled";
> +		};
> +
> +		dma1: dma-controller@e1614000 {
> +			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
> +			reg = <0xe1614000 0x1000>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 22>;
> +			clock-names = "dma_clk";
> +			status = "disabled";
> +		};
> +
>  		pit64b0: timer@e1800000 {
>  			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
>  			reg = <0xe1800000 0x100>;


