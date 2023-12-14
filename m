Return-Path: <linux-watchdog+bounces-348-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F2813466
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 16:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 181B21F2223E
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 15:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6B55C8F4;
	Thu, 14 Dec 2023 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHIIzRMV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA3410E9
	for <linux-watchdog@vger.kernel.org>; Thu, 14 Dec 2023 07:15:11 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50be3611794so9659029e87.0
        for <linux-watchdog@vger.kernel.org>; Thu, 14 Dec 2023 07:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702566909; x=1703171709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjygnYLv9wPWREwrNBcftV6uG5X/vCKXcTO+yxGG9tI=;
        b=EHIIzRMVK9mQN2DQR2HLh5gwr2aLytRHR0/cp7SB3hTB5RiQa3RN4YJRx6UjGR5KyN
         bWidQlv+oRopXBWaWdS/YVADK/FVZeMDCMVHlYFceUQ+n8wnThzEU8nB/IxhkPfGVKyT
         ie4mv5YeozybAIiCO3p4KnjeGO47uND11grCrOVsaoMebuMIkYIAPCM5qj0QaHIpoEX5
         mmXGzw9PIQj+7ldihuP8HH9eErg7jqkpFRVs5R4sJ57Hmi/HSsJ3gUSzH52jN9yRsoBV
         xoUnuKSlc5kHAgTvpiBFUIFulpXh3Dn0EcybTEpN/W0DRBI6tuvH8NFwbjVmnP/cR+25
         AtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566909; x=1703171709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjygnYLv9wPWREwrNBcftV6uG5X/vCKXcTO+yxGG9tI=;
        b=PdD9UNjt/axoeEw3xaCdNJsPhrdfkkTC5tILtpT0OOJiObIuni9Wwz/MtaiNjxA3zr
         enUSmiaitBMQnHt6lIbDwLAUhX9mSwJPG628qVBL0iW73PbOxOZ/AqRGklK99Ejn/w2J
         noJnEKpT31+mfDL+iHlLba4yHgxd/q04zdbjGLuc9DfvNV4+8NRuATOrxzI661BfD6SM
         uIsUoVSlIHtSUuXWYm2n0jojr+/4drw1kgQ+qo6kqBdvhA+8dbfvVNhh8+1EjG/dmfX9
         E2aekBNpB4pzhvKhoI+bG2/sw2a82mTGrUzIwngtn+RcohAWEl4sGbj0OeVPnOZPJMWb
         Ewpg==
X-Gm-Message-State: AOJu0YxxgQFbVF0B3mTMh5qA/cKZuMO+q0VI7XIbf/05o0cjAPwBfL8H
	azAtq8MW+3ebg+ReYYSC6EYCng==
X-Google-Smtp-Source: AGHT+IFmF2d1GfyhDY7+ubTis/rqA0ZTNlxWngYJM1dyNZjeauBRktJr8J6Kn59wuDXnygSZLbuNcQ==
X-Received: by 2002:a05:6512:314d:b0:50b:fd4a:f788 with SMTP id s13-20020a056512314d00b0050bfd4af788mr2709089lfi.33.1702566909420;
        Thu, 14 Dec 2023 07:15:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tp25-20020a170907c49900b00a1f7c502736sm8235915ejc.164.2023.12.14.07.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 07:15:09 -0800 (PST)
Message-ID: <d647ca03-3f28-4c94-a86b-c191ed801e4f@linaro.org>
Date: Thu, 14 Dec 2023 16:15:07 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: ac5: add watchdog nodes
Content-Language: en-US
To: Elad Nachman <enachman@marvell.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, gregory.clement@bootlin.com,
 chris.packham@alliedtelesis.co.nz, andrew@lunn.ch, fu.wei@linaro.org,
 Suravee.Suthikulpanit@amd.com, al.stone@linaro.org, timur@codeaurora.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: cyuval@marvell.com
References: <20231214150414.1849058-1-enachman@marvell.com>
 <20231214150414.1849058-3-enachman@marvell.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231214150414.1849058-3-enachman@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2023 16:04, Elad Nachman wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> Add watchdog nodes to ac5 and ac5x device tree files
> 
> Signed-off-by: Elad Nachman <enachman@marvell.com>
> ---
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi |  8 ++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> index b5e042b8e929..e898c6bd31f0 100644
> --- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> @@ -307,6 +307,20 @@ nand: nand-controller@805b0000 {
>  			status = "disabled";
>  		};
>  
> +/*
> + * Global Watchdog:
> + */

Messed indentation. Also unnecessary line breaks around comment, unless
you have some KPI per lines of code. If it is the only watchdog, why
even commenting on it?

> +		watchdog: watchdog@80216000 {
> +			compatible = "marvell,ac5-wd";
> +			reg = <0x0 0x80216000 0 0x1000>,
> +			      <0x0 0x80215000 0 0x1000>,
> +			      <0x0 0x80210000 0 0x1000>,
> +			      <0x0 0x7f900000 0 0x1000>,
> +			      <0x0 0x840F8000 0 0x1000>;

Lowercase hex.



Best regards,
Krzysztof


