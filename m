Return-Path: <linux-watchdog+bounces-363-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0142816862
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Dec 2023 09:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4F81F217E2
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Dec 2023 08:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFD01079C;
	Mon, 18 Dec 2023 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZnGe0fe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1710941
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Dec 2023 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1f33c13ff2so214022866b.3
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Dec 2023 00:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702888871; x=1703493671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bl+kKSJu9of8oa/V11ndPa3318SPYcWjIkohH3wNI6Q=;
        b=vZnGe0feZTSOFpZIdDWQZAdiBLiPo1jasVEnVXi1Xi8VAg6FgHZz2RM90asV8xhWsF
         JUmJcMMK1F7bsQaTovKWZnRCsicuxLcPszif8HHYQtM1LKghpMp9eohXBtl/uWkXxjGy
         yAgFp9lJ2GQ1WSei6kP7+6vPnNPaADQPEUOOSI4mM+qzezTezjFJN5K9XUKAAVCpAEIn
         xgcbVLVgBIXBSSaQJQFVLMQ8LPewHxEXkNg25A9UFgcDKPwPSZ6HYqel+gQ/cEShLCCC
         gFZH5V/fs3l/NqYO26bQ4P6wuPbWMeMTtPseVgPChaGznfTtgJlsxfExDYIuLNL6WEeL
         RrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702888871; x=1703493671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl+kKSJu9of8oa/V11ndPa3318SPYcWjIkohH3wNI6Q=;
        b=KjAALZjSA3bfZkRGmetnriM39ZffIxZ9MgEA/NfjE422Rw+2dGkhf1EWeFSuQi8qTI
         p0XYOraVEiJsreuSKp9HNgoc3BliX1npob2IxJWo7xNO2BPnEHmdZ3PMdmjkEmsyyj/r
         cpryUduodEvFb6cbNmfsJEI+3VegW4uY0YHL/ha6fdU22+5x0hlmwufS808pIsqhKtbY
         sYQgJ2mYCDARc322IO15PUrW1095FYaq4AmlPvuB06Mt6BF+ukfR8NBOmrzbfr5wtmB6
         Me3VQ53RiI69tsPGEInXdgGpeqwPiQmyFa/WGuilPnTjvOMXhRG2pwPAR1ACPo4zf8Yi
         zUNg==
X-Gm-Message-State: AOJu0YwgJRa/7XysTR1a3gxXmfKvayrCRka9f0oEKsvXFNU5KAcpWKgU
	RjALvtcvbkgx8bAnCwu4GoX8hAN6eJQxnz4DSkXlPg==
X-Google-Smtp-Source: AGHT+IF+OtXKIuxHzXPYSNitBAM8HSG24uktSZCPX06OMGiKSSFQ0oGTotTAHOrlPVEIxL6CsAQWQA==
X-Received: by 2002:a17:907:a181:b0:a23:5777:bacb with SMTP id om1-20020a170907a18100b00a235777bacbmr584227ejc.54.1702888871006;
        Mon, 18 Dec 2023 00:41:11 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id jw11-20020a17090776ab00b00a2358b0fa03sm934161ejc.194.2023.12.18.00.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 00:41:10 -0800 (PST)
Message-ID: <cb16753d-ebec-4342-bed7-ee9a895c8547@linaro.org>
Date: Mon, 18 Dec 2023 09:41:07 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Content-Language: en-US
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231216014850.1011344-1-jisheng.teoh@starfivetech.com>
 <20231216014850.1011344-2-jisheng.teoh@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231216014850.1011344-2-jisheng.teoh@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/12/2023 02:48, Ji Sheng Teoh wrote:
> Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> watchdog.
> Since JH8100 watchdog only has 1 reset signal, update binding
> document to support one reset for "starfive,jh8100-wdt" compatible.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> ---
>  .../watchdog/starfive,jh7100-wdt.yaml         | 29 +++++++++++++++----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> index 68f3f6fd08a6..ab077f64a83e 100644
> --- a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> @@ -19,14 +19,12 @@ description:
>    isn't cleared, the watchdog will reset the system unless the watchdog
>    reset is disabled.
>  
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>  properties:
>    compatible:
>      enum:
>        - starfive,jh7100-wdt
>        - starfive,jh7110-wdt
> +      - starfive,jh8100-wdt

What is happening with this patchset? I asked about one specific items.
you know - comment is written under specific inline quopte.
You wrote in changelog "Drop items in compatible field.", but I see
oneOf gone!

I have real doubts that you ever tested your entire solution with this
binding. Where is the DTS?

Best regards,
Krzysztof


