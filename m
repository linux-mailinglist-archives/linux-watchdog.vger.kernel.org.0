Return-Path: <linux-watchdog+bounces-3992-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF7B23A65
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Aug 2025 23:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524CE1B6484B
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Aug 2025 21:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FA4274B4D;
	Tue, 12 Aug 2025 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMsbccOy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8012820C469;
	Tue, 12 Aug 2025 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033120; cv=none; b=LhbDLBujxfPXwIQ1FgBgN1oS5/k6swxWgL6iXDgdAqiIkToJHxiNHjI3G0s7HMhoOEVKbTwRGDkpZtr5qJEAAPmUOVocw/Zp/pVvUfVfxZpmNOhHMuQGhz6HOwP6UPknpNnmN7AOjBnzMSX+6nZi5a1cGBxn2LGpsWsH5+7BqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033120; c=relaxed/simple;
	bh=9zfvWpZEM2XAGkCCyDIbjdSYPXy3Tg4rm16DV6rO+JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUpSuOWzHdqtoRdtROz3E6F85qgKr4O+H2lrigj+gu6mhh45TDgRp5FwOtOzeAV+fOPSEfECLxTlX571du5OMBq4kvyfs2x9HZSqFAirElPr6dh49xZfabG0zaBWuuiY/zDJnO2cTZdCLDzd7fN8G0vNVJeu1aTnGOAB/779LAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMsbccOy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76b77a97a04so5491418b3a.1;
        Tue, 12 Aug 2025 14:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755033118; x=1755637918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/8CKWMTt/DV/OQ5bHF+nqs0YqnwOptsMYAr6PeRa51Y=;
        b=FMsbccOyUs5jbmZ35mwaQACCwuxRGGSp6MFrJ6UyKgftCYRODBrRS5zMOkuGbQAT5L
         VwlvRnZOmp/ybUjbxsfEjvOyZ7uO+MGHmxVhWWi4wTDygQ/0KqRWBOF5c3xjh/hCBSp+
         V0xK5OgG4n/48bHMUcsBymqMZ1lQpYxy2N/E8eXclCuS+habTshF7ew4Ce4PSp77gpAD
         E6QvhZfPixAougy6we+z1q7jz1i30KAyuhi5KdbgoNWtHuWwCq6nJyjfILp1tWo5DoXl
         JcYMtHG4544bIne7PtZsqSueDBU61oB62ztuyidPTyMOnEy+n9cPydsOgU8qqAhAAfCU
         h3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755033118; x=1755637918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8CKWMTt/DV/OQ5bHF+nqs0YqnwOptsMYAr6PeRa51Y=;
        b=tF7aP00dNM9QmvNMa4aXtQljj4cVawZpf9bsdnaSmUGY8l/O2rL5YyVHmLKO0/yLyM
         pqEqlXWFZ1ZfuW5pf1c3Qn2Q6PxZSdS19dFwZOaS//GO8SEyTbbRlXToX8fwqkwDGIWU
         f+346w0iH0Zpm3WLjGOGET18d1DRzCYglifvCPPzqmjpLxHvspXA/YgGbOOeFH9voyll
         4cELoPrB8yz5yHMxZozjKERCbHbyy5K3oG0UeQQdterODhnTOBt78G/L3179IueMQoYt
         mXOEjPYMz/I0Up5C8jOSZum/yIYv+3N52+pKxHcREJWXmEIje1RTGA/abV0BKPz3SYol
         i4NA==
X-Forwarded-Encrypted: i=1; AJvYcCWOaO+3KmYOyoYX0NSGNkkzaCGfMf1E7OiNbybF7m2UQX0g6IUNegvBJKRlOFdIjARBxKd4lT//UN8/@vger.kernel.org, AJvYcCXWbeOf8wYJL6vHs+wX1GcI3S3RRREMV5HS+HAmqbWIJXgi75cfX55rUDSDIqd9v/OPN2tJdSMUF9YGgsZo@vger.kernel.org
X-Gm-Message-State: AOJu0YwGr3zx1HxHFA90WQyFzAo8+Y5b9RZlNq/ELbDnA/ZJUZTCXONO
	+XGzUkcX6mXuf/XzOwRPHFArDRQ5sGwfF807X053dDgHwbjqDX/d66hY
X-Gm-Gg: ASbGnctDzTM+lvS3RnsUONePYTS6Tls50I5C/KwNs7F6lwE3U99PiKa2gHXYqDTII/H
	0OGJDuPall5WHK5/K8X0DhJlyb/ooAQVT3Z3xrPreuB4IpD+T+glsZIGdhVe3SktrEcdxwcCa0D
	Gfi0tc+AjY0edQ0Pu5Xv9gaLbUhGAXOroRDwmPQu9xyk4O0K6OpB3DcF+WAzIh/dnLk5Wv3gwoP
	nljfBgO3ANiGYIVV/FZwJgWRd37s8RzmmPzAj+ypc9cPSr31JHvo0uIW+OqpXpw1+RPfkMxeJZ/
	3kaTW5iIoIviq+D5XxsJc7Bs0zcVARjIxtPVr2OZ5LdQkTHjWXP83tfdPCijyRjzg/TR9jdQe4e
	m4sNkwyrw+X667wkypXwf9BVeQrAjgHpcHMGtmznGHS7dN7cciv56rKaw9uP7zSasqfsA2B8=
X-Google-Smtp-Source: AGHT+IFvvhjVmKdZXod7Hh36TEi6nqqSxuecyD4zv2sW1If4mbQvNitzsR79DuO5PV3wbjxuiUxITA==
X-Received: by 2002:a17:902:f64c:b0:234:ef42:5d65 with SMTP id d9443c01a7336-2430d227ad9mr8837055ad.52.1755033117658;
        Tue, 12 Aug 2025 14:11:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21b69sm310751565ad.71.2025.08.12.14.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 14:11:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <14ed9b3b-92a7-453f-a585-858e9f2ea37a@roeck-us.net>
Date: Tue, 12 Aug 2025 14:11:55 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: Convert marvell,armada-3700-wdt to
 DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250812203301.726374-1-robh@kernel.org>
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
In-Reply-To: <20250812203301.726374-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/25 13:32, Rob Herring (Arm) wrote:
> Convert the Marvell Armada 3700 watchdog binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../bindings/watchdog/armada-37xx-wdt.txt     | 23 -----------
>   .../watchdog/marvell,armada-3700-wdt.yaml     | 41 +++++++++++++++++++
>   MAINTAINERS                                   |  2 +-
>   3 files changed, 42 insertions(+), 24 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
>   create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt b/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
> deleted file mode 100644
> index a8d00c31a1d8..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -* Armada 37xx CPU Watchdog Timer Controller
> -
> -Required properties:
> -- compatible : must be "marvell,armada-3700-wdt"
> -- reg : base physical address of the controller and length of memory mapped
> -	region.
> -- clocks : the clock feeding the watchdog timer. See clock-bindings.txt
> -- marvell,system-controller : reference to syscon node for the CPU Miscellaneous
> -	Registers
> -
> -Example:
> -
> -	cpu_misc: system-controller@d000 {
> -		compatible = "marvell,armada-3700-cpu-misc", "syscon";
> -		reg = <0xd000 0x1000>;
> -	};
> -
> -	wdt: watchdog@8300 {
> -		compatible = "marvell,armada-3700-wdt";
> -		reg = <0x8300 0x40>;
> -		marvell,system-controller = <&cpu_misc>;
> -		clocks = <&xtalclk>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml b/Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
> new file mode 100644
> index 000000000000..60d44d642fb5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/marvell,armada-3700-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Armada 37xx CPU Watchdog Timer Controller
> +
> +maintainers:
> +  - Marek Behún <kabel@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: marvell,armada-3700-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  marvell,system-controller:
> +    description: Reference to syscon node for the CPU Miscellaneous Registers
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - marvell,system-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    watchdog@8300 {
> +        compatible = "marvell,armada-3700-wdt";
> +        reg = <0x8300 0x40>;
> +        marvell,system-controller = <&cpu_misc>;
> +        clocks = <&xtalclk>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 06a4cde222bd..6a2de9638c08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2623,7 +2623,7 @@ F:	Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
>   F:	Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml
>   F:	Documentation/devicetree/bindings/interrupt-controller/marvell,mpic.yaml
>   F:	Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> -F:	Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
> +F:	Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
>   F:	drivers/bus/moxtet.c
>   F:	drivers/firmware/turris-mox-rwtm.c
>   F:	drivers/gpio/gpio-moxtet.c


