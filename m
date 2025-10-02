Return-Path: <linux-watchdog+bounces-4300-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16782BB25F3
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 04:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF72932726A
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 02:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98457286D52;
	Thu,  2 Oct 2025 02:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ep0zuVk5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7431285C85
	for <linux-watchdog@vger.kernel.org>; Thu,  2 Oct 2025 02:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759372266; cv=none; b=r8+k94Z52Z0cEF/zAFMP1M6LyQKogYGco4SSYKrZN4MZrlpa94g+4+D1c1SPESB3sFKqp+32r6GLwCJ65Tp/6bM5/3qmsO3K6ZRQMm2GcPEBR4kv0hoRyxgXk11YHWHFOcG3FFcAHxi6EZ1AanCFcBcS4kJl7Tu0XkhGGmrxjuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759372266; c=relaxed/simple;
	bh=2iYUjbI7WW8h1gUyUqVgFtbKR2p1Teu/z8J52VRHH9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0F/U40SJwnRrl0jr57y3JKbl89CuVsHeW75NERo8Xdrt4Evip3fAKUCma7Sn7pRVfkNVfuVa0+Cq0lvqrLntbcfqITmuTklcdBo5XXQTiOiCRKs5LccLdNl1BbuofzGAFxrPo0mFbMSq3mNUTzRlle5A+GFSCqzrpxVgJiq4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ep0zuVk5; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7835321bc98so648193b3a.2
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Oct 2025 19:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759372264; x=1759977064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Xfgqn39s6/BEF9EgTCjP8PdWeG1LzkqGUEJ5kP4XTEw=;
        b=ep0zuVk5TyqY1pQZ0adgcGrN/mm4ubhmOCJUantk8srCnkH1Usy7ts+4LOPZ7nvNcJ
         6IFpaGp2HPAzD0aYzieH4kx7HN5RUAoULcI8HbgpXJC4/rQfs+WGB9HqNuirWPSmj4OG
         1Q/nTK3cUQBK1jDIgnQjPkwGE82UC09zTPHbf8fk1mw7P+lns79e6e2Yy9AoE7Hy99y+
         LEdjd6r/nfTNNuZ1PK5Zw1J4x6EzuY21oUvzfhWKDuZEFHAfa5bByHsptuihlJtSkCpd
         Gt8iVNG2D7NrKYF5Wmakdm92AjwgyVVaOjzHQYtJXuVdsOANQFEF0/eTL9KoHO+cngdZ
         YD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759372264; x=1759977064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfgqn39s6/BEF9EgTCjP8PdWeG1LzkqGUEJ5kP4XTEw=;
        b=dF2Ck9rRhIRgahkW5k9f13mhiW1v8WqbWZFDvikunRAPJp94vCY9JhoFaT/pq7DUon
         se5lKZe/rmVvAQVp0p8AzR9R7CqUVO1KSoZcVyJ9mreyX5wGQ2eQCXk2t7GEpogQiEfg
         5gWjmwUs3tem57uluhkwKU3uFBmUOmHuOBhl1EFnafXcoDIurQEs2H6iohBt642vD96u
         TR4MdutTjhFkRQ1NFI2F7aV4Gbp11HaC8PtokwIY++eUgpWVSIXIq3D4nkg/TbbGPSYc
         04UDHRWr3HshcYs8TnwYm7UQyTriwg38md0iWZXKsHFsTKnkVoSPUkS//LtcEBteAg3r
         Nx3w==
X-Forwarded-Encrypted: i=1; AJvYcCWk/+QEivPGyZKGmjXXOo9f6/YX4Os2egvoloeaW+yMjvE52bxHCvBtbWBGUSVF4t/1kfE+HeRkC/Lw332IaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyvaya/GNKBc8zqYaDjaN1npv6crvQVMMwS8oVxhvvVDWnl4Yq
	lI+1G5BtX05ccnqSfdM9PtW/PdkzkxhkDde9rZq/kdp9z7wJLUVzB1JV
X-Gm-Gg: ASbGncv30qXf1EG1s9d1ZRXJt4L+l0kvZ/RChXrYd/NnhJ429eC4ceAtg+hQnVbJuYH
	X+bBun1d2cHcuGAqWOESQ+G1nQ+w1vp2c/jx3u7jdPFq2AnZE7oRTaJowAs6SPqWMLg4XfMYybJ
	tFhwHDJHI5HeAt5qcaGwYRvvs3hxyEeZEN4NK2TcX9sLqDc3R15r68Nu3Gl+P2w9l0WEdPqlHGw
	mfvKHrSlNtQ0NHzOBuFiL+ouqwTC3WRM1SWMOdYEW6E2QeuCvIxDyBBRHyY+vLVJpFZ1SinhHMl
	CkxCJbL29vIozBn5qSybSdakIwxDo4H0kE+rNe2Vmgn53WylUDnGBp2Ba1uxcU6vYDKw9+2iRG+
	pnMnFOuX6nzVz3XjCv4RaUQ9qtFEoeHdFfArsItRCvF0ou/z9l3C4SiyKiyWhWog0yLiW36Ui2/
	YKm3kgBDEKmpt5uQ68L/+0Fs8ghjljVg==
X-Google-Smtp-Source: AGHT+IGorENcdOGe8zuk7KjvdCcMClXU0QhgXv3FpUcvJWbaYf9g1TRN964d9BgMDoHJ7uAKv4Fb9A==
X-Received: by 2002:a05:6a00:2e04:b0:781:9a6:1175 with SMTP id d2e1a72fcca58-78af417a351mr6495179b3a.25.1759372264118;
        Wed, 01 Oct 2025 19:31:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a364sm1042251b3a.6.2025.10.01.19.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 19:31:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e6135fff-c7d5-403d-8818-57220348ca7d@roeck-us.net>
Date: Wed, 1 Oct 2025 19:31:02 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: watchdog: factor out RZ/G2L watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
 <20250926112218.28723-4-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250926112218.28723-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 04:22, Wolfram Sang wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/G2L watchdog to make handling easier.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 111 ++++++++++++++++++
>   .../bindings/watchdog/renesas,wdt.yaml        |  45 +------
>   2 files changed, 112 insertions(+), 44 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> new file mode 100644
> index 000000000000..77d325415280
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,rzg2l-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> +              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> +              - renesas,r9a07g054-wdt    # RZ/V2L
> +              - renesas,r9a08g045-wdt    # RZ/G3S
> +          - const: renesas,rzg2l-wdt
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-wdt    # RZ/V2M
> +          - const: renesas,rzv2m-wdt     # RZ/V2M
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Timeout
> +      - description: Parity error
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: wdt
> +      - const: perrout
> +
> +  clocks:
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: oscclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzg2l-wdt
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
> +        - interrupt-names
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    wdt0: watchdog@12800800 {
> +            compatible = "renesas,r9a07g044-wdt",
> +                         "renesas,rzg2l-wdt";
> +            reg = <0x12800800 0x400>;
> +            clocks = <&cpg CPG_MOD R9A07G044_WDT0_PCLK>,
> +                     <&cpg CPG_MOD R9A07G044_WDT0_CLK>;
> +            clock-names = "pclk", "oscclk";
> +            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "wdt", "perrout";
> +            resets = <&cpg R9A07G044_WDT0_PRESETN>;
> +            power-domains = <&cpg>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 12ba07781763..2a15c012fd67 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -13,19 +13,6 @@ maintainers:
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - enum:
> -              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
> -              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
> -              - renesas,r9a07g054-wdt    # RZ/V2L
> -              - renesas,r9a08g045-wdt    # RZ/G3S
> -          - const: renesas,rzg2l-wdt
> -
> -      - items:
> -          - enum:
> -              - renesas,r9a09g011-wdt    # RZ/V2M
> -          - const: renesas,rzv2m-wdt     # RZ/V2M
> -
>         - items:
>             - enum:
>                 - renesas,r8a7742-wdt      # RZ/G1H
> @@ -83,16 +70,7 @@ properties:
>       maxItems: 2
>   
>     interrupts:
> -    minItems: 1
> -    items:
> -      - description: Timeout
> -      - description: Parity error
> -
> -  interrupt-names:
> -    minItems: 1
> -    items:
> -      - const: wdt
> -      - const: perrout
> +    maxItems: 1
>   
>     clocks:
>       minItems: 1
> @@ -140,8 +118,6 @@ allOf:
>             contains:
>               enum:
>                 - renesas,r9a09g057-wdt
> -              - renesas,rzg2l-wdt
> -              - renesas,rzv2m-wdt
>       then:
>         properties:
>           clocks:
> @@ -155,25 +131,6 @@ allOf:
>           clocks:
>             maxItems: 1
>   
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,rzg2l-wdt
> -    then:
> -      properties:
> -        interrupts:
> -          minItems: 2
> -        interrupt-names:
> -          minItems: 2
> -      required:
> -        - interrupt-names
> -    else:
> -      properties:
> -        interrupts:
> -          maxItems: 1
> -
>     - if:
>         properties:
>           compatible:


