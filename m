Return-Path: <linux-watchdog+bounces-3292-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D78A86A8C
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Apr 2025 05:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 372967A3F34
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Apr 2025 03:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF48C13D53B;
	Sat, 12 Apr 2025 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpFW3Tcf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E3C153598;
	Sat, 12 Apr 2025 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744428190; cv=none; b=Gn4EzOCEO7Bfdt5UX66WQvzU9P5I7sufFN9yugSE7ITSQ1xz+dfwAIzCoiXapmFcafHbJpsxQxR1MrVAO5yj+mvBzfJEsIhF53ikAbtovib96I/bKcoQDNnYHktlhOWy46gUrUAanxkylNTgqUpZblCWG2SU788IF/y/ffLawLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744428190; c=relaxed/simple;
	bh=15mC8N/IVOI/DJJEiVb9JnPFb5VlGOkpZqpGnbha37Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raWyJ1smOyCz5zBxmEINWWXGb7FcQT5HBHaK3zBb4pJdQDXG7Eede9EeZnWqV8ap4C7BV77636q0Euj25ofBE4LxznNzF8/vcZut5GsvigXiCT+qaBBYsmDSKGZxb3WABMiVP7sRGT7geRHt8806AOX8O8tvU0tXUF6lgFUWLSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpFW3Tcf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2264aefc45dso39043285ad.0;
        Fri, 11 Apr 2025 20:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744428188; x=1745032988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qzdL81Jyh3UxGHmety0a5OygH9kp/fKWifGpubcZjhA=;
        b=FpFW3TcfyrENZbRz2HFVO5Ulawe1Xw5VoJmWiLrGw31CKBQDj+8qLFIDuJcWbyYUYy
         JxSrTmeKqFx9maRz60bBNsE2W45rzu/WxUvQtkh/lKDKIoY2V5I8qPPlZoZvgqsj8xHh
         k50dw7wb7PcRwaWWWd9Hiwx4VjPEFF5v7GvEq2y0IolJZC5UcgC3gEaDw7mqfvdq4k/J
         5s7AARpqI4tYSlGAZPBe4Cki/Kkupkq3EzQHdIpJBOkdPb/+liPF03XVjo/EmOY7TtH2
         dEXDHuMQSPoziS+tEUfR8npkzy/KXCle16jvLEta9vIQrrfyonq/UtK6TGgWbobxIntO
         uF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744428188; x=1745032988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzdL81Jyh3UxGHmety0a5OygH9kp/fKWifGpubcZjhA=;
        b=juO9cIhYmjwrLYCHMiLkCzdBYlZoAgi7n4odVCuJGlxfumiINv4Th8zgNuOp59GxGm
         mzbOPk2mLNGqmzJ3suYl4dAYz+cPjglGB3GBQnrrggc/vwvi0ecRIUOdzZMEYhZ+DMEJ
         4iWQw+i/L/+DufDBV4+aRh1F4tv+xIzQWPAD0iD+dFJRazoz/cC1otxs8JMtl+CuZ9M3
         TUNoMq5XhnMjjv7/Gb2iWbiKtHSFxR5PPXlfNqPmiRtEKQ8QaExv/c2FVeEyAvtKSoqd
         ytw/3TJP92Lmove2ucF0Sb1z0wu0AzdozCXYWkig4t7wQ5Ss5lWKknVtoxeO6s/YLEaf
         xJSg==
X-Forwarded-Encrypted: i=1; AJvYcCV204r3g5+MIGYpW4HL/6F5qdoPI/AnILWNDzyfUrMMeDOtvE1fYFfKSYAvhatzoggWaVe7MAOhwqLIo8Tk@vger.kernel.org, AJvYcCVyU8Q2Kx21i8nUZ2w2u8qXITpHFvVBxDh6GwGqkbYYRgO/VF2wBeGb/1/n4diXInlz4Rm67b+QYziM@vger.kernel.org
X-Gm-Message-State: AOJu0YxdqAehsNczH2kLSORc3PaXf7c8ReJbOwdSqYl91KRntMKcDEkA
	pmGZblJjlq7a9YOnoA+Z5ATYbIZ+eMU5LusIpmd1G2GgLqlIJfYP
X-Gm-Gg: ASbGncsEs7VHaezaih6iS9/uM8xf1tWf7a9TG8WK8VPpsFacmS3kERh0tPmXaBEH3Nf
	VyIlngro/UMpD8KkuhABhIP3Ifg0PVrNEPoQYxgKx3Pd/PO0m8KwapQFwhU0mGGkILGMrpwC5Nw
	KOdxkjDVPUWmEV9FI15wfoZ+si/YvkHnjCb+PvOc1Rlr+WTkX50+QAQm3B+eJzEnLtuiuMlhH3j
	+6g55dY5vhenGqSYEzYe+x46vBq9Yhd5Yvc/tYJoKkn5N0BSe4AgRjmYEIXQM5ofCB2jdOwZDx7
	Ngbx2LHPXn2VcEpcP6OxO8LFA6ZoVWu3me91dVJzE3MGkYw9VasGaMRGDBk07n6ZgN8m9BgUgkc
	SCnpTMLzN7/c5+da378KLw+NU
X-Google-Smtp-Source: AGHT+IEVTMy3h3SG1oqoxklB0Ybn6ixnKcqGyxV/XkXR6HugTs+1D6ktDrP6Y4SA8MALsdmp4uaRkg==
X-Received: by 2002:a17:903:3d05:b0:220:e655:d77 with SMTP id d9443c01a7336-22bea4f1825mr72911955ad.36.1744428187598;
        Fri, 11 Apr 2025 20:23:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93b2esm58569695ad.137.2025.04.11.20.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 20:23:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <485cec53-4e98-4abc-8e5f-96a8a0efb563@roeck-us.net>
Date: Fri, 11 Apr 2025 20:23:05 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, ghennadi.procopciuc@nxp.com, thomas.fossati@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <20250410082616.1855860-2-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250410082616.1855860-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 01:26, Daniel Lezcano wrote:
> Describe the Software Watchdog Timer available on the S32G platforms.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../bindings/watchdog/nxp,s32g2-swt.yaml      | 54 +++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
> new file mode 100644
> index 000000000000..8f168a05b50c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/nxp,s32g2-swt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Software Watchdog Timer (SWT)
> +
> +maintainers:
> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-swt
> +      - items:
> +          - const: nxp,s32g3-swt
> +          - const: nxp,s32g2-swt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Counter clock
> +      - description: Module clock
> +      - description: Register clock
> +
> +  clock-names:
> +    items:
> +      - const: counter
> +      - const: module
> +      - const: register
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog@40100000 {
> +        compatible = "nxp,s32g2-swt";
> +        reg = <0x40100000 0x1000>;
> +        clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3c>;
> +        clock-names = "counter", "module", "register";
> +        timeout-sec = <10>;
> +    };


