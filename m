Return-Path: <linux-watchdog+bounces-2772-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF0A1C832
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 14:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76C2D7A2DFC
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 13:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2161225A64C;
	Sun, 26 Jan 2025 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6CvtNa1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973C41A8F;
	Sun, 26 Jan 2025 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737899986; cv=none; b=Na0cl2K+mVuqcESra21KuQzlzM/vY+8N6xZQ3vB797WVEQnQAnvxWnLF0w3f8AdUhnLNWI/MPhcmu1OxA8Hmv+EdWQGk9kZP2W3KvoSh7Su8QGVQof23lzq8H9c5NSZ9tXOVEWhjeFVmTkNK3tO5/CDXxhHTORbXjOg+tLdoL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737899986; c=relaxed/simple;
	bh=Fn0OmVXMALHTk6tjhNnzhSN4/M2ko5luFJBqE0KDQ8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBmjJR0fkVr6bG6abfcVzdd1mH2y/2youq5njnnq0XBwOOEYgsHcDtBYLA0Y9/NPK4w5lDIu6+GxBtfucXTegZdn+W+1767zv94g21vZG7bNZWLQD3asmEjEK5tU50xzpqecZUzaR/q5ioDX2utHQE9mJHYmrL4mMiT4btkXedI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6CvtNa1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so4760389a91.3;
        Sun, 26 Jan 2025 05:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737899983; x=1738504783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BOKiOqsIEcXOwR3NL5Px+RblquN+YIhEMN/p73hwo+U=;
        b=U6CvtNa1yOSjxi2fqzw/QxeCSTuyg5YLROsp0O6BUT9jZ98HVyPhOqRK7snhzi4G3L
         apvvcZ+R5s0u81baQhieEnA+OMl9qD2vAH5kxoUgE7g4G7Vuj2laichR+5B++8fNlbxO
         aHAmVAEUbH0/TGS0GNVFvmELyMQMmpPT7VW69eimelGXh8+zD/EEpXuY/z+RAjSXQ20m
         yLFsJypgJuYSkcbALAEO/lflBtQDNRkbfXKABCgD7qLDP9b43g+taDH/R64e41XVyl+6
         I2ucdcseCrMHP+ZouVplxijCmVaachdRCQ4kBDLedvkPlFBzQrAWQFLxwz956x8RCplq
         QtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737899983; x=1738504783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOKiOqsIEcXOwR3NL5Px+RblquN+YIhEMN/p73hwo+U=;
        b=duHBapBVKiQWzhINccg3mtDHLyC4ShA9JyDxdeToffa4/UHy7fgS+38BIoasHrkuaX
         BsYINOVbk4xpnKmeR65d5DPDtV1Z2+XZxnL01OEWEzm3EyC33jBovckNHWl8w/k5fsXe
         R8RvJAz8hpGEmpTcK1BhIZDIm6f16wAx7+zAWKibCeL63vA6I5R3DSNYDksd7Cay/JVv
         bVWzwXfm5t8UJfJzzSClv2oxgh4MbruamAIrXVz/FQUpNCc+6WPsAwo9350n8IsNe8rQ
         X00/zqxHVYhjSBQbe1jrjXX74FGjdDGd9WrEiuCD2dUQAhtG0QsHLBjfOoMk3qdFpl8S
         DCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEU1o0GsmvzVwgKAbv7hzKJnAk0GgAmz7hdz/56R58CF+RTdp79O2Fj8rSsKzecpOX7m31qPfJgDODfJtUTyQjxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHjsIJpCm+QQ6bN9fd5ewZWjCj0Wc9qM27M4AfF8oiXiD68mU
	KZGYtFnb5PYwXzUaNuM19wcypHxs3AruvDNQn1bFZzJE6t0e+k1v
X-Gm-Gg: ASbGnctMiaNezWto7nPUkbm5wCO3o9HHbK9/y8O78YdsoDgePwE2v+B5reHPqwL1FYE
	G2VEIkdHGlNNYbAZD8vRG/CZuX1SIl0ZnaS4Gt/xptVNuUOXGMwtZCe4HN8l8wmjjhUrZOE/L26
	eu+JBNbreShjaYkm4fUnKFOY5DoEGkhjn8sQqIeeBNK0w/uD/mjw4R7mPA6atGczONHb+WukIEI
	8OYjs5rxXFpNMjf13JxL4Z/TnDiN44pnpcgU0MfbPPNSb0s2DNMxHU1trasU8hfQxwUEe0qXen/
	mvj4EY22zGKQtBwSrPbhA8X16rCyuRU0lTzY+wn5dAg0US0lcho0pA==
X-Google-Smtp-Source: AGHT+IFT8AZktuwF9YcKkIUSs7S2B7ukR3nHzpM/lOfujgqI8GPnC18aIABRUqg4wo1uFprNuN9yMw==
X-Received: by 2002:a17:90b:2d4b:b0:2ee:96a5:721c with SMTP id 98e67ed59e1d1-2f782c997e4mr49624694a91.21.1737899983397;
        Sun, 26 Jan 2025 05:59:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa82f74sm5224361a91.45.2025.01.26.05.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 05:59:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <de718fb2-0263-4354-85c0-f39b1b3dc36c@roeck-us.net>
Date: Sun, 26 Jan 2025 05:59:40 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: Enable RZV2HWDT driver depend on
 ARCH_RENESAS
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
 <20250126132633.31956-3-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250126132633.31956-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/25 05:26, Biju Das wrote:
> RZ/G3E watchdog timer IP is similar to the one found on RZ/V2H. Both these
> SoCs belong to the ARCH_RENESAS family. So, it makes sense to use
> ARCH_RENESAS rather than ARCH_R9A09G057 to enable the RZV2HWDT driver.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1->v2:
>   * Updated commit header and description.
>   * Replaced ARCH_R9A09G047->ARCH_RENESAS as both RZ/V2H and RZ/G3E belongs
>     to ARCH_RENESAS family.
> ---
>   drivers/watchdog/Kconfig | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f81705f8539a..b9d23f98a436 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -963,13 +963,14 @@ config RENESAS_RZG2LWDT
>   	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
>   
>   config RENESAS_RZV2HWDT
> -	tristate "Renesas RZ/V2H(P) WDT Watchdog"
> -	depends on ARCH_R9A09G057 || COMPILE_TEST
> +	tristate "Renesas RZ/{G3E,V2H(P)} WDT Watchdog"
> +	depends on ARCH_RENESAS || COMPILE_TEST
>   	depends on PM || COMPILE_TEST
>   	select WATCHDOG_CORE
>   	help
>   	  This driver adds watchdog support for the integrated watchdogs in the
> -	  Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a system.
> +	  Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to reset a
> +	  system.
>   
>   config ASPEED_WATCHDOG
>   	tristate "Aspeed BMC watchdog support"


