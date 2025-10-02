Return-Path: <linux-watchdog+bounces-4301-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B0BB25FF
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 04:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C93232725E
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 02:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF408286421;
	Thu,  2 Oct 2025 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1YVZffe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D520528312D
	for <linux-watchdog@vger.kernel.org>; Thu,  2 Oct 2025 02:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759372285; cv=none; b=EmM/pDiFgOCuxWw71zpPILBrI2MiMzTEdGpezHl+bWSTOPLgP1f0HfORmakiDJHW1XqV6qA7GQuCQiRKlogsfrQT8JJsBa38c8r+oeukCUS0iwXGzZlCB9a0p555IsG4EfIlooNyaKLdTcQloAs3ZWZc0MzOQN4Ed8o3e5NXxso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759372285; c=relaxed/simple;
	bh=O1PNQ+4acklfTbwH1atUlrG2uOWiRmBFCx9O7NU0T+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyvtvRSDCNB0cGUngq0nk89SPGxo12hvIKfQKIllbObljK4iRww3Et3cA4NMo4jmVSeACZQugQklG2BDZfPlRZoprzQGx4ogh4pZqrczyBb1p9RpEZGzwnpWgKPLs2XadYJ4XX3BPa2r6ixqjWRxVbfDqNFzR+ZiVvQMf3iCrNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1YVZffe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27edcbbe7bfso6451715ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Oct 2025 19:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759372283; x=1759977083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5I4ECdFRXnYjBd0EQd1ZXxpsaFt2QIgeIetEhOiNxIc=;
        b=P1YVZffenugXRm+gKkZQQ2Y/kpWT8Ps2g2ElgJZCMmZ20AMALJAvAOMkUb1eDX/zsg
         QxIjVtnvKRR4+SPThYPO9vszwjXZFLPf6LaAhiE4Fv22jghvWhKBb4J6blSNUb9+sXyp
         souR+f946gIPA000phb+0jwrq7FmQ7t/E4Nv07Rdy86MKXwtZkSBoqjNXyA0Tns5iV58
         fsWXJR0k5Y9QycwrUB88+uMs/yj/D2eXuYgRNm1zcIUoCKJACaEJKBlD+ckmKa63RzpO
         Tm7zys5QKkq3a6YJ6oqd2gurxrV2BHB5F3GZvC5RhD5JdUM730Q2BzdzrK7JajMfo6NR
         v9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759372283; x=1759977083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5I4ECdFRXnYjBd0EQd1ZXxpsaFt2QIgeIetEhOiNxIc=;
        b=kXO5oqOo87fN82YO0ofx6ZgAWUem+uLLxBQPqkIbwYhhvwXeKlcMtClaFQDRGBZTor
         4SV8SSknPU453Y+a6kqca67YYaZjOIT9AUoI/6f88hMTJ5lhSIYG4DOV2QirGj0brtw8
         r4CRbJCVQ2Sej/f5qsKcr4z58Nvcf2NGBUlJ3+rGiHZi5hjXubAYDa7xkkmd6qy5BFxi
         mn4SqPQBHwmAI1YXJEpJkmlX/X1phddDc3OjuKIckkxTBSFtJXv4A80wx5TZOLz/0jJW
         EGqSjr0QgbRZtq81q41mxmw3Tl6SDNTj6ftOG9VC7Vc/rLDStVCT5tBJ/w7GI75YKqgm
         JIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdJ612zc5RnJ9sHQMWrnLbJiRIflLrw/TY7U/Gb+BxZOCT9Qn2cuAc/trBmzA+qR2GQ4y1l8av989QP2bxuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRcT1GpBCcARqDLev6sd+hidIY384pH00+Pb68BDIFCBFxcB5x
	6RFBvxgg2dGCLXUK0oSSilBkMnavsHn/G6ATmBD2ZGGZnHTjvs1PQZLP
X-Gm-Gg: ASbGncvJ59CCYZABEUF5Ay1DO4GSaE+vxMQFWLfSZUrRDpt8Q7nS32NCvZJHENRwR0X
	c++qYXqgD6GlQVYWlMHYsKsc+IaPC0sL4B+hAi+nr+B1tOv5/CcTDSTiJA0w6qK9OmbsGtsxAJn
	/yCBUq3qb66XXk2NCo/sRFU+bLxSjYDPKoYwi40AwkHa328ljsj6b7DleniO+TXf/C76s67YOPt
	v3GHnym48SreQfMHS4M8bc3QeyMa+Cdeh2v1rBxnRnk2wVIF1nGJmL404rwusO++Ra00qy6XAro
	6716TcrPQCo+c94oXsQBfoLOES7kUyi+BJVcle2rurzbinjOuk191kRRIW/EXq/ah4WSBgstXoJ
	3ewGlPR0iwRbdDWHd6sjkERAwytMTntlUjzGTdiT81ffH5ClTsfg8VE6Ay6F+6pTE6AEerHp+OT
	K79tS5r5mXZsQdcgq55tD+1wjk2K3Sfw==
X-Google-Smtp-Source: AGHT+IFjRAFPZ7mBP9i+FyPZlW2baSflCyUt4AMF1Dr5WIn8lEaNfF3VUH66AX9uSIeTuN2+iZwSOA==
X-Received: by 2002:a17:902:e74a:b0:264:f3ed:ee10 with SMTP id d9443c01a7336-28e7f2a1202mr72237395ad.11.1759372283155;
        Wed, 01 Oct 2025 19:31:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b9e5asm9950555ad.74.2025.10.01.19.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 19:31:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fc9ef023-4420-4e43-b2a4-35d42184c0c7@roeck-us.net>
Date: Wed, 1 Oct 2025 19:31:21 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
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
 <20250926112218.28723-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250926112218.28723-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/25 04:22, Wolfram Sang wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/V2H(P) watchdog to make handling easier.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../watchdog/renesas,r9a09g057-wdt.yaml       | 113 ++++++++++++++++++
>   .../bindings/watchdog/renesas,wdt.yaml        |  97 +--------------
>   2 files changed, 118 insertions(+), 92 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> new file mode 100644
> index 000000000000..2450ac856783
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,r9a09g057-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-wdt # RZ/G3E
> +              - renesas,r9a09g056-wdt # RZ/V2N
> +          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> +
> +      - enum:
> +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> +          - renesas,r9a09g077-wdt    # RZ/T2H
> +
> +      - items:
> +          - const: renesas,r9a09g087-wdt # RZ/N2H
> +          - const: renesas,r9a09g077-wdt # RZ/T2H
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    minItems: 1
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
> +  - clocks
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g057-wdt
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-wdt
> +    then:
> +      properties:
> +        resets: false
> +        clock-names:
> +          maxItems: 1
> +        reg:
> +          minItems: 2
> +      required:
> +        - clock-names
> +        - power-domains
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +
> +    wdt0: watchdog@11c00400 {
> +            compatible = "renesas,r9a09g057-wdt";
> +            reg = <0x11c00400 0x400>;
> +            clocks = <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
> +            clock-names = "pclk", "oscclk";
> +            resets = <&cpg 0x75>;
> +            power-domains = <&cpg>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 2a15c012fd67..08ba128bf442 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -51,38 +51,14 @@ properties:
>                 - renesas,r8a779h0-wdt     # R-Car V4M
>             - const: renesas,rcar-gen4-wdt # R-Car Gen4
>   
> -      - items:
> -          - enum:
> -              - renesas,r9a09g047-wdt # RZ/G3E
> -              - renesas,r9a09g056-wdt # RZ/V2N
> -          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> -
> -      - enum:
> -          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> -          - renesas,r9a09g077-wdt    # RZ/T2H
> -
> -      - items:
> -          - const: renesas,r9a09g087-wdt # RZ/N2H
> -          - const: renesas,r9a09g077-wdt # RZ/T2H
> -
>     reg:
> -    minItems: 1
> -    maxItems: 2
> +    maxItems: 1
>   
>     interrupts:
>       maxItems: 1
>   
>     clocks:
> -    minItems: 1
> -    items:
> -      - description: Register access clock
> -      - description: Main clock
> -
> -  clock-names:
> -    minItems: 1
> -    items:
> -      - const: pclk
> -      - const: oscclk
> +    maxItems: 1
>   
>     power-domains:
>       maxItems: 1
> @@ -96,76 +72,13 @@ required:
>     - compatible
>     - reg
>     - clocks
> +  - interrupts
> +  - power-domains
> +  - resets
>   
>   allOf:
>     - $ref: watchdog.yaml#
>   
> -  - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              enum:
> -                - renesas,r9a09g077-wdt
> -    then:
> -      required:
> -        - power-domains
> -        - resets
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,r9a09g057-wdt
> -    then:
> -      properties:
> -        clocks:
> -          minItems: 2
> -        clock-names:
> -          minItems: 2
> -      required:
> -        - clock-names
> -    else:
> -      properties:
> -        clocks:
> -          maxItems: 1
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - renesas,r9a09g057-wdt
> -              - renesas,r9a09g077-wdt
> -    then:
> -      properties:
> -        interrupts: false
> -        interrupt-names: false
> -    else:
> -      required:
> -        - interrupts
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: renesas,r9a09g077-wdt
> -    then:
> -      properties:
> -        resets: false
> -        clock-names:
> -          maxItems: 1
> -        reg:
> -          minItems: 2
> -      required:
> -        - clock-names
> -        - power-domains
> -    else:
> -      properties:
> -        reg:
> -          maxItems: 1
> -
>   additionalProperties: false
>   
>   examples:


