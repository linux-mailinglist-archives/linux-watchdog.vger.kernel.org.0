Return-Path: <linux-watchdog+bounces-2720-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941FA12698
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 15:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A277B1883774
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 14:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F504594D;
	Wed, 15 Jan 2025 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cskYxayR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90324A7DE;
	Wed, 15 Jan 2025 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736952923; cv=none; b=fct3h2WJS61kLPGFxUKHnEZuu/D2qQ0a0DpLs4YCMcPu+SsQ+lNvCBJ23apfcszecIpeQ4KPiYCf83e4tl9OOlp6VpqXSyrwb9E4OuNNadhaA3haf/kaLFmDY4bImu9TmZ5RWlVSloBKf8yTVentdsL7z2V000SZSqLiXdzt0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736952923; c=relaxed/simple;
	bh=venimGddFYqBMcbuAAxHAohqE70SaUzf6mXHfmKQtzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kB+AGKwdPnKtX521lt01TkavkQPfL0gCvN6Ey6yZq+bJPTSzXnxHWnhTY3gCGbtyPCEe17On9LXl+G/sLsfUOcWejSLvlDh9Q8TXyn8PVZ1BcK+ZLQfaoLPUVNKYpTEpBhLWBXczC6xB3S2CTpU2zu5M96wFElioelBASpnaafw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cskYxayR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165448243fso151712025ad.1;
        Wed, 15 Jan 2025 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736952921; x=1737557721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Vfvco4iDzDfsHFujW0IxLGe2dZEzR1ia4gvNFYBnFhE=;
        b=cskYxayRtyL5V1hJ0k9Vq/OAI96VDSY/YANNL86MteQ5ii53umvmm+v3IxxZNcm+Kf
         fnTqoJGgySex4yxFYP/l6vRYs0vXRWZ64jtIgXi/rKXqbRYBCTwE0Ji7QogiAWRKuNLg
         Nf5SXb1t8xp6bRuyBdmC+5cDbvK/eQ6gIRQEF5WcyHgU1aLCpd2w/G0CEjJzrWoi1ALc
         IFZO34sFnd7K0r44FFwdQkaXLRGa1mXSqdt4Jmn9EYRnCvCqNtc/IR5l71fw/F2ZcOq4
         Gwsnc7D5veJXtLL9NZhnzDRtesGHPDa+90lhbiAzRG6xQS/wGVYvofIMSS0qB4xD4x3U
         FMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736952921; x=1737557721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vfvco4iDzDfsHFujW0IxLGe2dZEzR1ia4gvNFYBnFhE=;
        b=R3Re0rjjlMwNUamdKkFlrEOpRExNNuOaafShO1nMx/wevjzKsW9FpHE62JxmfNqwqW
         cXjPxUndrf8XoluacgeJrIKiqQgFjRHioy3hWoKG85HBa3RY2wH95TFnsCCZm1Dd/zWb
         kHGI+LGW3nzvjccEgqwOgHYNpW/q/hGkopFssZplGX61A/rVLlsvQRHwAKM78thkTiBX
         VeG2cy86kQzoVPFuCAmwNLIHZUNiA8ftqMnbC9RrMzc0Fm7EszOrLFDy3Q6q1Gg7TPop
         ng9pvmytv/ZUdbiKPY0cVyIb9+BHuh9+9UNBHwpBmVQU+OSTmrvaB9BgSgsUA6n5o4Ow
         ZCbw==
X-Forwarded-Encrypted: i=1; AJvYcCXhyBDEcmgD5zimZTJvPy4SfReGHbcIUQSN1GHEHF9zjOVysjlGSW/JDsnlR41Ymnie4e0E7N9teh+vXyQGTlWeow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZZd5yJ6MRvDfMSxh0ZyFRhJEdaH5Le2GlpGZfPELFw00wO08
	JNCqw/gxfz2TxnHB74vVwI8JB+Ug2cwPxAUkiF8b9/dI9WF1cuzq
X-Gm-Gg: ASbGncvQld87IFH0WVj6GvkcBAddGGWZnOjKBXGYUhDzuQHBaShBKaCsrqID6YgpUbj
	N3AkDSNIEqSlkUcTNbLcziu9Uu1l+5CPF7oklJm7xXR/2Pk5lEm07su/QUTX13IlwGUN4YWZXZm
	hnhf4Qr91kRYwJjBFJRiS5wZM9thp44pju0qzzteCDpLxKHGp4UX+QxOURo3Z8ML6m1pCevadl+
	JWsYUGk/zc1O2Q2rTMmePu9ZRNCtfnOslsqKDHH0HmPya8zzwNImuzSUFMPGC4SqufNNiFLfSId
	5LBWzyqIr5fsHFKyAIp1wnHujr4ugA==
X-Google-Smtp-Source: AGHT+IF/U1pFlmEnqNTmFbB4P0j7UYiPFa2todVxgtKIEIjdREuQsrj9EYjlWKUKA8ISoCeOKb7h8Q==
X-Received: by 2002:a17:902:e746:b0:216:3633:36e7 with SMTP id d9443c01a7336-21a83f7103bmr190872415ad.26.1736952921380;
        Wed, 15 Jan 2025 06:55:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219324sm83919315ad.127.2025.01.15.06.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:55:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <de74406e-8554-4179-9d1c-4467d8c92645@roeck-us.net>
Date: Wed, 15 Jan 2025 06:55:19 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/25 02:38, Biju Das wrote:
> RZ/G3E watchdog timer IP is similar to the one found on RZ/V2H.
> Add Kconfig dependency for RZV2HWDT driver with ARCH_R9A09G47 and
> update the help description.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

The subject is a bit misleading. It would be better named
"Enable the RZV2HWDT driver for ARCH_R9A09G47" or similar.

Guenter

> ---
>   drivers/watchdog/Kconfig | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f81705f8539a..646a84cc03e3 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -963,13 +963,14 @@ config RENESAS_RZG2LWDT
>   	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
>   
>   config RENESAS_RZV2HWDT
> -	tristate "Renesas RZ/V2H(P) WDT Watchdog"
> -	depends on ARCH_R9A09G057 || COMPILE_TEST
> +	tristate "Renesas RZ/{G3E,V2H(P)} WDT Watchdog"
> +	depends on ARCH_R9A09G047 || ARCH_R9A09G057 || COMPILE_TEST
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


