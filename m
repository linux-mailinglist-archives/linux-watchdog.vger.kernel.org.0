Return-Path: <linux-watchdog+bounces-4026-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9AB2EC64
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 05:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 279107BE22A
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 03:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5382B2E7F2D;
	Thu, 21 Aug 2025 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcpDCJJi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF90A2E7F2C;
	Thu, 21 Aug 2025 03:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748294; cv=none; b=VH21SfG7AGkNkojvb/vDWsLeffvrsviy9DK5bWdMajoh0yj3Yp6m8Rj2JEG1SiIzIVQVLzdpWw+y7rP0i6Fq4qCj8G7sQWWz7LledLhkzzcYEeGfoWrSS1ZYNBebRoqGTKMuespNxvW/5rDnAdfRmoOOy+jR/d94tm2Vh+NbzQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748294; c=relaxed/simple;
	bh=6H1LfiSjKuzeFAhuPE2h21cP/IGqVgBajhrQLdEXGCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZn92N7ISRrNelC8cHdpkC+H425HwfdRAVQbbNvXiwIRPlAI5T1/0VwDAK/UrOpPZZAeNDwAeH58n3y/vPKwu2LsdguaiY5EewBir5voEq+6MyHXT7DIQxxOnhEQgauzGJM8KGVoBtbKJUsuVOGWr+VjSrlZXvtNx+Ab4wl+hgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcpDCJJi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-323266b1d1aso428088a91.0;
        Wed, 20 Aug 2025 20:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755748292; x=1756353092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xohWFEt7IVGZCVC5pDZ611ui+ssCpcRoSOloGiU4kZ4=;
        b=PcpDCJJitiAkbA6/sjeO4kIQGnNdAOO7GHN+syWw/9yZ6Wkspe9g5oprdpwDOHtavP
         fsYAXtshr4IqcNsqYOX/4u5SUAM6WsxIT+IB070YBp8voReIBwbES8hkSto6HGabfQ3h
         NNAhKv9e9RnzikH1PQkGW6cLrii/4kB+ZO+nrPmDC+ttHb3Lbjgzy8mMzs3lFqsk6uzW
         CzWJtwX+ydSfuyxkys8OVhJ23YoIop5S8F76dmSVxmIU2yCeXPTsKiU0Z/8PDl4J3nNS
         qn0deipCJm8h0MwSvhYFbh7eBdUjdAOb9OUSQ6ASswEXV9Z/hrGLwltWITRRgKiYdjg8
         RNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755748292; x=1756353092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xohWFEt7IVGZCVC5pDZ611ui+ssCpcRoSOloGiU4kZ4=;
        b=Vce314kt8fYknTfdYS8DsLKSwfhqyKashT7qP094yDilSOJwLuyyVbm+PnwqAm9RCA
         4WeU8l+BaYbbJyXZRiED05zlNXPsnIvYeYBZwGv/Wz1CxEeulQGDOZgtpuwP+aIG/v13
         rLXkbC1nfMueCRt1WGfi7lM8qWqh3P94e0eH8VRWS6JS248Z00pp1P7u7IXpBzWfG/+X
         g1lFYZgG/glyNdXXr/VEJLLaTuC5Z3FkxEBFU5zp7sb2HlD9Af5xIAv5JMm2TXInsPyh
         jg7u9PkwdOAS8joPx1zQ0S2JblaQ6FTGBnOoKuVOJMc70tcqgD9SVVr+31pJ4O9DmXjp
         4jaA==
X-Forwarded-Encrypted: i=1; AJvYcCV1tsH4HNlyloezsF7rtJJii1H9f74Z2IpgmTGFLm66emHOWMREGxe69p6tkHLwXLs4gGZ3sHqSURKZ@vger.kernel.org, AJvYcCWEZYUWvTUBAjGMvnnNq8sj6BdlbSBhRdZMsEmrSJ0OzFbB3IYkba2ECMPfvWFIE4Pzl34GSSeXx9jLGzq7s/cx1HU=@vger.kernel.org, AJvYcCXxKJfl43giRgJ/6Xy/Kr3OiJ0rhN4Fml2saxexK7XCYJjdlo+QMuXg2h+uw5m/ul4IBeJALckM4nai1S4E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4h2ImtI3ounq5mB/p7nFAJy3R/NS/F841nprq31wi19hWo8yU
	lk3H+L8Kmt5ReRO9xnJZmvgPBqqpzSR2OLNwFK3w26z2/r+sdbFJsteL
X-Gm-Gg: ASbGncsXC3LyL9hmuDdKVre4SKplnLNZh0TcccsOVy7apClhWpPK5AzxoGgFmIZJcEV
	V0lb706AeD2SuT2Gjkl+jULUYmbiTkIrb+vnNzCQhDhZHNjqMShVPzl9T/qFTCZ03HMJADWL/X/
	ZIOnqdfNQjGN80uJ6pLg0Nic1E6ZO6T0Lckg79oFe6saezEETsQabq1gzkUe6PRECpFDnSbvsPV
	YN1IGExQR0Oso7fwOMbHpJmDN8OAYZ8J/HnFt+UoePQdyjQsKUXMggRQgKbiBQKinnoU7e37WF2
	udxtfMUWUO5IJ/KQ4IjfrwJs9Q0cYcB0iOK2X/FpqJmyYavUwhHif78J+VWkSGd54HqJ0rG6s/X
	MPpX/xK67eC6WtLNB+Cr00J/3edQHGp1xDCMkhc1HIzZMwHzc0/bHsOg396HZd+Y2SlN02biIU8
	J3mO1xneHIz9I/Er0R
X-Google-Smtp-Source: AGHT+IG24bmcCTsS9qrbuY+7ng4cqDEGwMeLihDWRVkPoBtQcK8yc9Pm+wFe9dKnVhxdU4zK++/LjA==
X-Received: by 2002:a17:90b:3f0e:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-324ed07eba3mr1432953a91.5.1755748291800;
        Wed, 20 Aug 2025 20:51:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f381812asm194846a91.0.2025.08.20.20.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 20:51:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4ed34497-7f28-4520-a909-d7d2c1e50439@roeck-us.net>
Date: Wed, 20 Aug 2025 20:51:29 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] watchdog: rzv2h: Add support for configurable
 count clock source
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250820202322.2051969-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250820202322.2051969-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 13:23, Prabhakar wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


