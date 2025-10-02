Return-Path: <linux-watchdog+bounces-4298-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2990EBB25E4
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 04:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C343AAFEB
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 02:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBB225D1E6;
	Thu,  2 Oct 2025 02:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK5ZYLIJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1C25A334
	for <linux-watchdog@vger.kernel.org>; Thu,  2 Oct 2025 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759372228; cv=none; b=ZbwUWwjNPF5MmgT3SKGjnxtcHd4eB9wd/NIr2N9n2c8X3w75ZSwRBKscW4uWv3MhL7nTfidz1IsRVwhRsVOkII6v+ePaCbvMWU6EEnSSvEm7un2gcqVc/cjls4E2ZaMCSA0eHhMVHxGH5nR2Mkj21sZpEalRvfK5+K0Byinp2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759372228; c=relaxed/simple;
	bh=LLzhBTzcyS3kOWOJM6miAduYo/YM0MXvwu19ejT4p4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojVqn6bSqqEmkOszRPTXyPi3ZbhNkId9KJu2NCz9ejXnsljYEGSosYyq1Mjn3x7NarRdK/Xo+onXizIUt4QShsvtKXK5mrruTg7460uHvXN5Cv4O4eb8pPXTyiA+wAUBoIOxrI5FDVRUlcFrS1Mj+IbyQboGCvBxDa/OumD0PaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JK5ZYLIJ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso346323a12.0
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Oct 2025 19:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759372225; x=1759977025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bprskbNEvwD+R95V+bfhVrlJDqn7JuRVDyNOXIaEPg8=;
        b=JK5ZYLIJYwScMTr6x00FbRcDbLrnK9ZS7u9n8LRKGhkA8VLC/aNfy5E2ZxhgaFWIVx
         RKTxzPr+RQqqsRlvxOBisW28iq5nmoQEkoYqpGtHjOclc7nEg4+dzx76rALAYtVV6/q4
         iONt5SPr1mbJ6SVybANDQVbJkse6JOlCuju2IZZ3aCHlBp2NYhjkbrSpLsRbyEkEiRcn
         KmYB5lKmboMhE+HMsc2Yp6gMnKCbmWW53KHlMxOAzUUK9FgSasVCN48F0xlbb+HSaEUo
         P6JY/tbckKQ6XBa6W+JuJK6TodOZxoy8X+K5uDtnQLq+1i0+qMcslOKiE2kDXQgeGQm7
         Hheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759372225; x=1759977025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bprskbNEvwD+R95V+bfhVrlJDqn7JuRVDyNOXIaEPg8=;
        b=vMApGWoeROwjo4pztFfipObdTZ1ewV20E7rrczHk+TDo4kQofwSRyjbwvO0FYvecR5
         kpu4r+AtGwTKhqXJkjM6WCqJ6f7fzV09ivyyp0V16uecXjUFMWozat+ZRGmvLB8TutlB
         nPniDcxSZh7Hllbfbf/rpTMotg3uoY+qMjjXED0szmGKiYe7JW85LBkWzd+hSEOX8qGF
         xP5z1Lj1l8SVp0J9qbhk2iol14vwWkiJL5MrJKFlo4QBNr2J+5yUD5CRqevnpY3tv50r
         5//24uYGvUGv8uq03Be4Xc9lCGT0TwZID66/mvXynVHUF2oxegtoGfxsiKS3N2VpjeSL
         NFEA==
X-Forwarded-Encrypted: i=1; AJvYcCVyzpf+6hqIUNyHVMkkKBeU3PQQoXwXscEI3Hfzf82qobgzKYZHbJVFNDvQSsAsWBNdtIxHs6vX82WQktVm0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GnzGSZaWYAnyRMrBCVJZkCIoBIBzfArzWlfVnYTB2SOmH7KM
	dwVZiW+DPsQ9acOtPreHQMSUPrbCYZSOev1RPlPphX0o9IYpFIKcgAUd
X-Gm-Gg: ASbGnctPYLPOP3Qu4zyNE27TgRvfoxQRGose+hya9HN0SWWhMmBQWhhlqZjPQjsopzY
	k+f0stGDVSQUCweIypcsD72dPr2LrXOJy4X8oRK269Td7vyPHVn5elDS6S63whCJo1A0ee/jaw7
	25AvYpgkV0Jd1CeINLy2hA+k/bPuyBvF9IhZhjMXvbJO8IraEN9CS/ck8O5z3zwAbB9QAJc/pDD
	JFK0xg+sij3l67sPCC9LXzjE8ZF7mxhGbXtTcn6U771Jv9ZykLKYsYK2lRH3Ks0ALevjnXN2alk
	1KyosJWmfVQihUoY+Bb1mxCTgtg3OFoQ8K/bq1mSyFU37CWEb1vxxMPoXC7cylylZLJenFKENUe
	FmISwLOG7JuT8k6SkVJGZ9lTusHnfDc2+D0FS+B8yW/3dHMdjRZHi2glNCYeqaP1ZPutUZRKZG5
	j3HOiOMgjxlb+kLuZNoBA=
X-Google-Smtp-Source: AGHT+IFQOwqxoZgZqzT62Z7m6j+AMTxdcdPpke/cMMzmYklpJXFjJlxF3YX7bAspXSjW/JjCvDyctQ==
X-Received: by 2002:a17:903:15c7:b0:25c:e2c:6653 with SMTP id d9443c01a7336-28e7f3199fdmr59078055ad.48.1759372225116;
        Wed, 01 Oct 2025 19:30:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1ba322sm9879545ad.72.2025.10.01.19.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 19:30:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5c507c8e-f66e-47eb-aefe-404d22ee81f9@roeck-us.net>
Date: Wed, 1 Oct 2025 19:30:22 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: factor out RZ/A watchdog
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
 <20250926112218.28723-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250926112218.28723-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 04:22, Wolfram Sang wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/A
> watchdog to make handling easier.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../bindings/watchdog/renesas,rza-wdt.yaml    | 51 +++++++++++++++++++
>   .../bindings/watchdog/renesas,wdt.yaml        |  7 ---
>   2 files changed, 51 insertions(+), 7 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
> new file mode 100644
> index 000000000000..7078218e0759
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,rza-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/A Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r7s72100-wdt     # RZ/A1
> +          - renesas,r7s9210-wdt      # RZ/A2
> +      - const: renesas,rza-wdt       # RZ/A
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r7s72100-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    wdt: watchdog@fcfe0000 {
> +            compatible = "renesas,r7s72100-wdt", "renesas,rza-wdt";
> +            reg = <0xfcfe0000 0x6>;
> +            interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&p0_clk>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index b6e60162c263..8a25e0c6271f 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -13,12 +13,6 @@ maintainers:
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - enum:
> -              - renesas,r7s72100-wdt     # RZ/A1
> -              - renesas,r7s9210-wdt      # RZ/A2
> -          - const: renesas,rza-wdt       # RZ/A
> -
>         - items:
>             - enum:
>                 - renesas,r9a06g032-wdt    # RZ/N1D
> @@ -140,7 +134,6 @@ allOf:
>               contains:
>                 enum:
>                   - renesas,r9a09g077-wdt
> -                - renesas,rza-wdt
>                   - renesas,rzn1-wdt
>       then:
>         required:


