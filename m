Return-Path: <linux-watchdog+bounces-4203-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF23B45BBF
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 17:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6B455E20F1
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 15:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16DA31B82A;
	Fri,  5 Sep 2025 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq75J1iF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC431B827;
	Fri,  5 Sep 2025 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084452; cv=none; b=LaTKnWFbk1jMlJ4UZS/M60DoXMci3xew+pPsUfhUPlD9rHxM+Oe0GHqRxesz+frOQyl5eToNQsX2so/RWwUBliZZiKNvmhKh87FaAND9nDbZDwhBB0iUNcc7X63WR1dSqKL97mzkkGztQeF2joyFtlT9JuIuUBUDngnPNZ1t+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084452; c=relaxed/simple;
	bh=pPa8GI1BPK0/ZsyGCTrFWYht/yrjF49fQ/mrha96FO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PW+yMyhnqZ2QKKM2J6EzCjzSZdEUjw9R6x9jsWw/J0cvo0wSOSwamE4yyz9fBs7sJijxlfqrMqewAmaEv6Y8iOJ+M3P3rL0uOR8uSL1fjNNLzqszECXaAnEdQOjDtPHd03d596Cflj+wnYWTBSZ6+NJImEWUARl8254L7/FIQbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq75J1iF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24c8ef94e5dso19251265ad.1;
        Fri, 05 Sep 2025 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757084450; x=1757689250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o/AsI+NBQt/+9Wqt4nV0Z/+KcJv0R7gvuVf19MD8MEE=;
        b=Aq75J1iFm2+/EdVdrV8oe/dAzm0sJggizsCpTZctzXyIfYCPaM6o4t8fHjf93yCrtz
         FHyhmxL28bKn4vzP0qGN9aH6UBFPiV7+D7tz4XCtsRnzh4MuBI+warwWPg5hc6tcBH/2
         jCuUhCLYYJOrl+JXi5hlXU2QoVqvuOEAi3ymsCaW7u5pHQHXMyRddZcbuQID1e+qEiEC
         hKnCWSjruxa8qzsGgUnJHDmy6go3VUsMNp+mTscopU+QOOTZ7a6olD7us6OezZ+r+61Z
         QyTNO+VYNcdraXIPS7PiPnvboHQSfKwhUaPKPz5CCwgLpNmdJE8LtvwU+ixFDmGSesIO
         guLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084450; x=1757689250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/AsI+NBQt/+9Wqt4nV0Z/+KcJv0R7gvuVf19MD8MEE=;
        b=Mi5MHAu++CrJbFSmVPYPOp+vuJh6+oE0X7rJcI8tCrd8+nUOI23J32ScCo+qQN/2nb
         FPzY0DMgW9xum/siMoGWUSO2r4ibE2VavjxGssgxFHkj65byBmKU+JAtkgH9/hG91pmD
         QbxtWmq0SRA0nWbZ+7YNQrb6TtvJwl5ny5PBwjQDsClMWesvnNYet4IfGhIgLCcI/Oda
         rCZf3cemnfAFp1vQgDYgQzp9bXSLJRVoUYlichxX1iBf6hvn6Iyg1h5f/7ziD1gzCMVH
         htBz4j6Nk1NeyyAuoBW6WdUaXQhFn/eAXlOB6rcXatD36bY+KckeLND7QQ+nUWGaqKlT
         v2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUU6SHFZBTgSuUZS3ewp0dqn0CIz2Vv2dN9ufnMddTiqlFeF0xJqJ9kJfYmr9fb//DCwTEgTVjw9Fnx@vger.kernel.org, AJvYcCWsPyr0phz44TUdu7eiTuDXAv5ehOARpQW2t/VDcxgClbhq6qsICdVZFfoc87//4koESb3EI2KrzByN1AX/DPLIaqs=@vger.kernel.org, AJvYcCXZBPghKrcE72E4c+cxA8I3rbLHWHqOlqFOV5J4avRvjtzcccqEG3MeiO8HzalEVecbaaQPPFQdvOL9vRb9@vger.kernel.org
X-Gm-Message-State: AOJu0YyaBIKTCRwDU8tHkI/xdhRsWch/WQCy4DXWNWm/n7vFVBP2g8CP
	GsDa4yzpqAA0nwEIGRHXqKaYCMtxJo0VUs11ry4k1te4dQNcSe0qgkJR
X-Gm-Gg: ASbGncsUozVTS9h8dC8tCCjS3Wg2Wr913sFBPNjqEs/8DoolJZysKhOsy9qHl2hkCZt
	lwe2tpXh59uqNbpFXMDtIFKzVfxAYKAPeXDu2sn9PK/GUnqeCSA4ly7/XlBghHNM65Fn87IhRSn
	VWlGFYRlpHKwgyCP0OW3tPCSyMGdQhWOyw8S2UY+Px0pRZnxTWxq3ljb9LQ1meTNHTOVEQ7nvZN
	AwP/PRlH75PVitjm5iFxkMe6JazikXxIB2bu3oiEzxyx0jt4MGi5T1LKL6s9hgIV3w6bqiNxnrZ
	fxYIuSVW8SMTgC1P48VeD3Jpb0gyVN+4AhLT5FM09LOfQvtantky/dwWtgraxTi8ovyOTlGxzk+
	1JsYoUKxZOK7vQPaAAETGPrYSCXxBWtMvZdmwlQo450zSbT2rgxbUyiDLhJaHQKgu51lR7OY=
X-Google-Smtp-Source: AGHT+IGpH1W7fxPEciHTzmV4UvtJf8FucV9EdE/4lW4ylonEL70QhTMT5HyjlyGgdcY2xJaGdHLIaA==
X-Received: by 2002:a17:902:e751:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-24cedc6f407mr51172335ad.1.1757084449791;
        Fri, 05 Sep 2025 08:00:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9e39094dsm69772475ad.84.2025.09.05.08.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 08:00:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9bfbc2f3-763e-405d-985e-6cdfebff7b17@roeck-us.net>
Date: Fri, 5 Sep 2025 08:00:47 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: watchdog: renesas,wdt: Add support
 for RZ/T2H and RZ/N2H
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
 <20250804195723.3963524-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250804195723.3963524-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/25 12:57, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Extend the Renesas WDT device tree bindings to support the watchdog timer
> found on the RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> 
> The RZ/T2H WDT is mostly compatible with the one found on the RZ/V2H(P),
> but includes an additional register and differs in the clock division
> ratio settings for the WDTCR[CKS] field. To reflect these differences,
> introduce a new compatible string, "renesas,r9a09g077-wdt".
> 
> The binding schema is updated accordingly. On RZ/T2H, the WDT does not
> require the "resets" property. It also requires two register regions and
> the presence of a "power-domains" property. The "clock-names" property is
> limited to a single entry, "pclk", for this SoC.
> 
> The RZ/N2H SoC uses the same WDT IP as the RZ/T2H. It is supported by
> using "renesas,r9a09g087-wdt" as the primary compatible string, with
> "renesas,r9a09g077-wdt" listed as a fallback to describe the shared
> hardware features.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


