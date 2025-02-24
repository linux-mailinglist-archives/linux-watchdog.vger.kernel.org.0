Return-Path: <linux-watchdog+bounces-2990-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE8A41E28
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2025 13:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E75A4425C3
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2025 11:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A127233728;
	Mon, 24 Feb 2025 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z2iuPqeS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA1233722
	for <linux-watchdog@vger.kernel.org>; Mon, 24 Feb 2025 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740397421; cv=none; b=Y0ckmy3wkkegcCwptn/Z8xzUkhK1yMA24/pCdiCJI8BaI2KTDhhay76/MVOsjBgRUQVvU3cixEj7iIFB2rAiYz4wucq7BZSmw30eI2xE3Mj8HfUmWKvV16wfCk5boVpTL8qqy7yYKuxL/mjHeBXHv1g0nT9peF+yeGrImDysrm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740397421; c=relaxed/simple;
	bh=zJgi9c8h4NJMSk2MLLGhWM7ccjAIjfSWRwcx5sglEFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wco8mjkhq+e7E0Capd4V8zFPkyjUP28vCU23FzDZTmXB7eYK/gY2WCLtdQFuDGG9NIxo8Nb/Ol/HgYxgjQTq5yMSKmCZI8q0GgqLS4tlWWgJV0GGz/gR8jUhcB9etfaXuy0xCKMaPvd9Xn8GHhIn9GTztEZmNLKYeVIofsmz4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z2iuPqeS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7430e27b2so677351266b.3
        for <linux-watchdog@vger.kernel.org>; Mon, 24 Feb 2025 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740397418; x=1741002218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6Mlr0wbAMCOEN0+YLkpDA5vstdeAdhSzTHRytWnpTE=;
        b=Z2iuPqeSdG/EFquWVQGLu+nIJnwgwVJQRoUy5COipibk12la2JwLuaiH0bLUqlp/8U
         Cljlqk6JAnzECRIX1ZGt0aaucvHzP+TJQCTGlGvTi+XOi+EFXTo/jspv0d70HdWokGCb
         zyrPz8dOf1IWXfcKIgkLu3O4voiEOJoUUzezt+wmgTdn3GkQ2zAM+uSAX3dBzrXTaHJZ
         Vp/9G4LoNx67BSEH8lolHUvmExhyflslVs+uzCEgBp9/ighGuolzRoVwfPOtzVbZ+udd
         RmUrm0VYLG6jGvqCRcBaw/71DJTSkm9F5avErSmSktWmnrJkQlS+sfM+E1Bg8jG/oL33
         Jizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740397418; x=1741002218;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6Mlr0wbAMCOEN0+YLkpDA5vstdeAdhSzTHRytWnpTE=;
        b=PhiR9yVDH1Tir/c6i3Q9ViSujm36QW2q5RYdwNr6O9QnMoeqWKy46Xb/f5RGrTplxz
         UnvxNJkiD0HYnrzInyiToj1zmfu7n8HikmUIeo1IllLPBzjpzVj0bHEOUjjFqVO7Quck
         FmaluMwCbVe+vF/E94DUzcCqCTDDB+eNDdrFiwqu4BIrxj+r63iDZAnVl6tJXtnvPd/h
         GngE6eALaWSADYzrLlMXCh2gdRHMLe6vO7CV1U10EdBUE0grl5gtNHgo3HJpw9y2Z2F6
         DH7ndG1HdrBCKuAgwkkQyc8z8wjdWdSvrRWe887586f9liyazwHiKSH5i94rzj0i9Gwe
         pXXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZd38l9IpHdZnlk44pgrz7JiIf9i3ta2ThHXaltFgSWqCwuwtaMaVFjdV5BPgw0kv8Cs5QwvSnH9wvWdiL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNlUDXKkNz3pUtzXedM0i0rQLoBqxyXM4PNzu251llwxsxKy3/
	814iv2RrgD/cER5UDOyeemaVXAx1UNYC5Dckm1QOWdeViktGoYrEb9cMMlMuzzc=
X-Gm-Gg: ASbGncuaOVW8eo5zAEh2tdgoDiVqoxAd2OLqO6EiHhRQUB53o+04k7rS1ewsUSIIaeL
	74y79U0LNskA96VWKDbaVSowISVipxCmVUp1M5/gObNz1AES4knSmUlfpF0xnHVPqxVnUGkNGQp
	+F7WX+7GuKUHYooxC6NG8cBHnHfTrqIFVIMZ0r7GuXP8bpNcXFEzedKsk+1GwpWW3n3GOsC8X9K
	z09IZVgeyam321YS2GmSHgjK5fA8iIFzNQsWNyIA0U4bcjXOVNI3DCRPa3K9+iO6waY7XuWpVnE
	2ihmrRxJhNVSXdmFYGEsfvKITC6YlCW9Vw==
X-Google-Smtp-Source: AGHT+IF5iaBYNZgpTldExBVQhpm8bwV77vFMEYcbfb9p2terRRNut6cbNBxpAfkhBHP6mSJK7U7EiQ==
X-Received: by 2002:a17:907:7e93:b0:abb:6b1a:7b22 with SMTP id a640c23a62f3a-abc0da3b46fmr1334031166b.29.1740397417602;
        Mon, 24 Feb 2025 03:43:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8ab30726sm1658222166b.153.2025.02.24.03.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 03:43:37 -0800 (PST)
Message-ID: <2ef91384-53a0-4eeb-8eee-3f704416f299@tuxon.dev>
Date: Mon, 24 Feb 2025 13:43:34 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] ARM: dts: microchip: sama7d65: Add watchdog for
 sama7d65
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <05431cf86beb742a9a53336c4ec792be8bde14e2.1739555984.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <05431cf86beb742a9a53336c4ec792be8bde14e2.1739555984.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> +		ps_wdt: watchdog@e001d180 {
> +			compatible = "microchip,sama7d65-wdt", "microchip,sama7g5-wdt";
> +			reg = <0xe001d000 0x30>;

The node address and the one specified in reg don't match.
I will skip applying this.

Also, please sort the nodes by their addresses.

Thank you,
Claudiu

> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +


