Return-Path: <linux-watchdog+bounces-4204-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD80B45BC6
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 17:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C021172FC5
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 15:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853382F7ACC;
	Fri,  5 Sep 2025 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn8eV9d3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39A72F7AB0;
	Fri,  5 Sep 2025 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084484; cv=none; b=MtZTFZoPaamnTsQkoYGCaIL573VBHBXRhdJZJ2M39lcfUtS+gDJpTjC5Ul6cHsPdZ3AYZviYhtIPVL4BEuA2XqIRwqiSBjXz3SFOs4364fpz6MndCUG8vfojLQrK4vhLSsT1Ird74gaogHB6D1TlmQ3xxvbIcJQQMee3NnplQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084484; c=relaxed/simple;
	bh=LkljqLTWDWJEUUvuBjtKxp9W69o+LvQ+iAxXrmj+h64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDDvvpSP1Rod4YLoRF/ueauswzZ5VNZQgtN8D9G9mRx2xZ3N5Oj/OmfPh1pkadAIKgqJyVzoFlFjfNHftZfmy4pkNpPNDFXAT84EB1vAex+m7l1Lt+zlmqieCz+Zp0l1+FpHxRAPir580+x+ieW3iFjtO81YOa/fnxti7kVTdpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn8eV9d3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-248df8d82e2so24118075ad.3;
        Fri, 05 Sep 2025 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757084482; x=1757689282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mom61fDhsOKnW8t/x8WbAbFG3DrzNGWZPGzgPg5epAE=;
        b=Vn8eV9d3OXJNPX7Livj1a6L2jUQRFHRp/80WGuD16CbMOjWyXrn9+MICG5jTUIMFnD
         AOO/YA3ITW1YUaZTvzDUiF9yCHWnyOd6ItXkrW+UAzkSaINeOPLWTXUOVpX0xuuQxY4F
         JjwU8Yfmv2V1/xOgI+L0wKjo9qTZJZokLzKUvDYg1K/IN4j/wXWDs+sVgPHNtog6dCrZ
         Xft9HcmwQXz821PdIImj7ksb/pCaS+5K2HB7ppH84jzPLrvNLrUvv6fzcVrNC9dS1N7m
         HNUa+f2WSnRb6Gz6Ez3xVMJujYVYKDXwHe35mKJH+1GpFLY8ozmEAkj1HAopQYdFEYXJ
         7C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084482; x=1757689282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mom61fDhsOKnW8t/x8WbAbFG3DrzNGWZPGzgPg5epAE=;
        b=npmf87CWUQs+722hIVZci/S4r/g9BHPHdrGGq32tK+q9t0ugLJj/69b7y9mKyJ6Kr0
         hO9HMYq4dPogWG71Aq4VHLpSmtPjXiDeGeJ/1esw0UEH+m3Tyt9IAaePYapyR0S/BxxZ
         sDYhRTzwktuy9uqhNO/vHO6MTk1v9KgRMPw9GS0Uy1ADsDe2QFxPNbA0Kh9lp0gb0FDj
         4x4odqDY4uMk1sbB/9zSdDwL1AIYIxOb+jnEizzabxvYlbTvzFda0fNJTGvEcpzxZGaX
         NWNVIH+tcJLpoqXzgytEy2V4no527UTAqAIvlOYRARaos39a4sV/I+lEl0sQq3Xc+Zzy
         Sx6w==
X-Forwarded-Encrypted: i=1; AJvYcCU8yf8nVfyIOmtJJHVMw3iyigcWtQpd7buzPqt5mqQYXWbaojkWKj2X/nr+EZuLV7iXqRf2fZoXEmCGqqiiEtey5Fk=@vger.kernel.org, AJvYcCVxAz0IfzuoOe1f6tGibg/P7yG5skcKwEBvWy2/YEvEMeSGBNTmyw0O9eeDQEu/HYOhs/Aefp0dhih5S5+2@vger.kernel.org, AJvYcCXtXEqbFPDgHrLv87jhuCh2TjEZblMuAkw9ILIT9l+UG1CGsk8rFr9MSHh9bjhjBI1Qk5GJeTCyk/ml@vger.kernel.org
X-Gm-Message-State: AOJu0YxhiJZPRYYU60HmCA3iVMS+Jajsh6K712yqhicJhsOYfNhS4bx5
	zwv/6/6wdF0HKih1r2i81VHDNwtHqsL5KRoWTSgyWPBF6eaUkviyNMiP
X-Gm-Gg: ASbGnct8cWSnRjsxn9CyD2GJLfR2GEHYW37DI71OFwdBdeC81lnvD2FFry8OilgV7D0
	7IbxUMafg8V0ESVqwITuUTz7x6pMVbberU/EupO9KiGa0/Px/OBXWmgPH8WSHClLBpJGhoLB8ql
	YOsCfY5RP3Zs39xCLcI0JI9mbLOva5X4DG6g8GbGgJqbDTyg+M+qwsZwgtoKa65sEvC2Ym2Csc+
	1utU0WZGYuzyvvYSmUpgpvIMqa9kWTaIm/QH6Hp91y64WCT6JmVcy4bHL3OSUzYLi2towaw16b5
	+pnxV7BcUkR74ZIQPCqby3R4ifvCpvhBG4sgGZzbrApqOYG0ZzBVA1pKu9+BtiBS+J+/BUHLDXQ
	g9ff13Ec/lPDzc8BuvYggpBgAExtyasPW9Ni5qGMH3jUV4KshuvRjvvjqPaSbGw4nCI0ilRComV
	QbZyM4RQ==
X-Google-Smtp-Source: AGHT+IHjy5xX4VHHPBuN7a3wEXT7n6w+cQznCC6Xq/3UBBJlok5nVHpAoJMnTlxNimKAD03Jq6RVmw==
X-Received: by 2002:a17:903:17c4:b0:240:6aad:1c43 with SMTP id d9443c01a7336-24944b0411emr334658175ad.48.1757084481386;
        Fri, 05 Sep 2025 08:01:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24af773c181sm118199865ad.119.2025.09.05.08.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 08:01:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ddf53f4e-98d9-4f3b-b80b-715361a4cb42@roeck-us.net>
Date: Fri, 5 Sep 2025 08:01:19 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] watchdog: rzv2h: Add support for configurable
 count clock source
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250804195723.3963524-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250804195723.3963524-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/25 12:57, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for selecting the count clock source used by the watchdog
> timer. The RZ/V2H(P) SoC uses the LOCO as the count source, whereas on
> RZ/T2H and RZ/N2H SoCs, the count source is the peripheral clock (PCLKL).
> 
> Introduce a `count_source` field in the SoC-specific data structure and
> refactor the clock rate selection logic accordingly. This prepares the
> driver for supporting the RZ/T2H and RZ/N2H SoCs, which differ in their
> watchdog clocking architecture from RZ/V2H(P).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

