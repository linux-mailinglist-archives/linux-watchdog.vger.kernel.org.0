Return-Path: <linux-watchdog+bounces-2959-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C098A3960B
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 09:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9B8A178B1D
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Feb 2025 08:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F1514C5AA;
	Tue, 18 Feb 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oNuJQk6S"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7F23236C
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Feb 2025 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739868164; cv=none; b=u7nYzYXKwvUWVliJu4LMZ8D1ZK7agkCMlU9AwdQY/DqNou1MMCBzrIFG9SeQH6ydKAzgui5GMv4EawbnMdVLlXuodlC2IVVVIvLg1/VnH9hv/9FiTcYoe/vJemS+2v6ffa4BJcceuF/5r9RUv77kvvR4lriI91BLlLjpzePy5Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739868164; c=relaxed/simple;
	bh=saVAfgYPKRn89eU0vt0BwT0rMzRndUiMwLipr4oYYbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmB+Xi0ANEYeviM35vHsFWSHDYa84eEtrnnbHCJYFxqrc9qjhRhY1w6r5P8k9DJ2wXhwhn120hWsuJ4AB5y/NJcwgNMD/1HccdkRi2wPKwG6u6EfE9DWULO4rxxoaoqMK3V6p70y4B4wEw7wGKX1Xg3JhmyDNRGSWSEfwf8CwW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oNuJQk6S; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab744d5e567so962560966b.1
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Feb 2025 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739868160; x=1740472960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ch9WkK3xb+NyXSKj+cn4pbQshkuRqJJ8wERBuOfV3A=;
        b=oNuJQk6Sl0q48eVebF0AmRaNcv32iaaCQ8zKe1AJfxWjlB5caD4iZaiNCtJxGZ7wEa
         vHceWLiKcbOj9TigbC3T/ihrTrQZfu/X4H0+S5a0yQegbaOeb+Sb52JVcdkCsFC8AzOd
         URxIw3srH+0d6DNQMXnRhkJppLNiCiQROIr7if1pfMSqpC3cf0FeTAnnYqGqEHfBkAne
         OElpSvtJqFG4dqMP/4R38+h6sN0gdfUjcfidc7aQgskEhezRFsPDfFlM3+LK33ZAWsbu
         dA0mh/Yy0rlNpH95joK7zWflep7Ggb+rSxCJ3AZypGYijwA8CHD7IO8FLz29NMHRzoWT
         7Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868160; x=1740472960;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ch9WkK3xb+NyXSKj+cn4pbQshkuRqJJ8wERBuOfV3A=;
        b=oTYlfM0wfgISvP2D8CoXLkFouWV57Q4dnn8FtlfFWlv2dyOeFR+GPkPCCSvCrHsG3o
         0FPdZR4Wtca2nencod1JoauGwq4kmH7GkhUlLnXx6EeRoY3vIpWJkm3G0V+8sURbxuu1
         hzeAAWXdWepQMBCr5GX+97skY7WMBc8uCMHwDnkSV2k97C4d9FnqGQ0HcD3Y1VJFzoTf
         +j3Eq6b+X1R0PVSW2MzDVfTDhGvfB5Cea9qbnbsQ8zFSdN7e6FaM4fFnDGQJH/E+HObQ
         UErAUkj6CE28b4vLGpcEX5InN7ql5BwE96XYfaL1FEiR8Tm+sNGvEyJLp7td683+bdy6
         Ek+A==
X-Forwarded-Encrypted: i=1; AJvYcCXOiEReZEdbrh6cFeDtrjWHqhdFQ8YfxY0RIzo6/sKcE1K4I8GoS6CQotTemOwaikh5M62BsJUcsAdR1XtYsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LIa4T0wolScrIJdXGb5gNr+THDlc/Ptnfbzjrr//nWW4blCd
	hsDLBBe3XQ/5KNZGGJWr1pf94089zxdSGJJERVlfFsWB6yTwU9mmeE1/vfk4P7TT6tFvtkJpGRZ
	J
X-Gm-Gg: ASbGncue0ICthROMBr0cp1i0XL1FsQaBFQf0qdtDIebLJYL7Hc5Ja7r/TR0w1hbUwhk
	6PeSES5t03cYJ3jO+CpIwtTTy92eBtp/cFU8ilju7/nrCpaDhh6oxI+rvN1vu/gFK/Sw69f1iLK
	5cdjC/7FX4spTEgkPCwT4XMR+GXn5Zp7fiafkW3VqEOS/zCGrzUc0BF1tYxIDi1w/kzmUEWHJDq
	L2NE+4vrocGbInADkfVtXJm6SISWBYTVm0Rl8Y8NS5a+vBgKPLWOBxibeCh4PT9PB5UCKXzWo7R
	WTq6nCyZr+/e0dnhFdQ6ycY=
X-Google-Smtp-Source: AGHT+IGhI03tdLg5oc0plVNCSO2LiVnGx57Sn+cYCVSUBsfb7XkEiF5iSWvlCx7bfmCKQKm3J+y6hw==
X-Received: by 2002:a17:906:308f:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abb70c7a410mr933973166b.24.1739868159537;
        Tue, 18 Feb 2025 00:42:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5337673dsm1007937966b.89.2025.02.18.00.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 00:42:39 -0800 (PST)
Message-ID: <a1ebb518-ff69-4dff-a8b4-7c3b716450a5@tuxon.dev>
Date: Tue, 18 Feb 2025 10:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <3c55e634f2993ac5a49e1b8bfceb2333e175d376.1739555984.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <3c55e634f2993ac5a49e1b8bfceb2333e175d376.1739555984.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add microchip,sama7d65-wdt compatible string to the dt-binding documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> index cdf87db361837..e9c026194d403 100644
> --- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> @@ -23,6 +23,9 @@ properties:
>            - const: microchip,sam9x7-wdt
>            - const: microchip,sam9x60-wdt
>

You could have keep this new line after the items section that you've added.

> +      - items:
> +          - const: microchip,sama7d65-wdt
> +          - const: microchip,sama7g5-wdt

here.

>    reg:
>      maxItems: 1
>  


