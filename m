Return-Path: <linux-watchdog+bounces-3942-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15630B182F2
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 15:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1473D588045
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 13:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD1226AA98;
	Fri,  1 Aug 2025 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm53LOkn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B53BB48;
	Fri,  1 Aug 2025 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056327; cv=none; b=Cansv7hdixISMHukQ1A8gUUYLBPWNExs/+DrTZdqHd1pxxjW3aZjfBsxw7Vv33HTPsdiRlvNVaob9XeRHXvMW2wzhxaVzQ6lUKG7WAUQ1wZXrBa9x+X15y02dJhKc3l08QT+vFkZ79Ft+f7Dn5Wwjb1iqfE4McJAbycbZH1QhS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056327; c=relaxed/simple;
	bh=AkvEu+pArrcXbVC0y1rWB3LFEH+acoRv0iR8JnIiB2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0LaXMbWfRWe8FOeqGIIkOc6GAiRa6Vz3lyODRGtJtaaaoEcpVIxbBqRXBo4gJBbUoQYlilXEpzxmvuTwDaZjSyV89xboJrxWlS6M1wXj1qynoG4t110I4u/0bvj/9TqzDRhAmm/YV6+tNBPtrMW9H3QL6e/7bHSR4SSsoheov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm53LOkn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76bd7676e60so716126b3a.0;
        Fri, 01 Aug 2025 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754056324; x=1754661124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HJCJuMgHRTXv+ij1dqQ+cA2bHND7xpFvimOP6/uDcMI=;
        b=Cm53LOknWDrTNkZ7GrHI3yM5yxFGcAraeKCwv+fB730IjegEjpEgaUB2JQZcLugZFs
         UwYzF97BeyJ9ZoTK93gufP3ERus2HzJSxrb1VA3sDILUIuRf0U/089ng1MaM1dhjjNcB
         d+xmzwel7k5NPSF+PrlYIspvaiN8dyai0eivNsR70BQjyTeD/tcYmQ1n0ACaq1kTaE2N
         gALjK0ZG81V6lvt+v4VtD/aVXCAxwRpLhO1fBh+pcE1hDDyJ/y//k9bSF8yWKpbQdFEu
         qP2f2bctggyR2EGk1ZoR3Y2/oOFnEA+W+KjiTwKJ0RRPnThNgcdfi2V4J8rkOHn9FF7L
         bTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056324; x=1754661124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJCJuMgHRTXv+ij1dqQ+cA2bHND7xpFvimOP6/uDcMI=;
        b=MEpdyIdnlEMEqWeAAnaI7V+b7i536CiZ+yqybHqXjoh8uBdK8zaZpk8ET7NiuF+68W
         zfdLtPBD24jlXOJPPQUVUgCfHUM/OtsCuXMGsqHIbbTdqAkpO+NJOPr+2GhPAWhooZSO
         CdD6HGenf5LY6J0BRO85NiwGu5x5n+V+XfyoilXMPO2NC3F0AZI9e7hjstJftHKSHSeS
         Ft+IJZ7YrnGIIprr17m2n6sKllKqLg18SZ09bi/D0sOoLEL0a9kyBrftok/LzEvx4DQm
         jIRKzAZgx+nvIzcDBwyyk3O9zXaEVsk/q0QjuIvMs1DZqC8ZTFo91W7NHCVqfqc/o+u+
         t7hg==
X-Forwarded-Encrypted: i=1; AJvYcCV6PnwHow3l2bk5ydNjgwAEhnuteEKpQdMVeSmASF2gs6YBv/AtnEJYB7Q1alSfgzxX3kdqOjaPts1s@vger.kernel.org, AJvYcCVnuvVE83M8dlLSP3ljZIik49NUbTOJrEaYLmJkjUR1/6pRflDU8Wk274EEZ5VbNmwSGXXE5kt+IVbE4peOzHr/37Y=@vger.kernel.org, AJvYcCW69TX+DnKqmaiPuDMZU6UuCtPXSyC2D3dS/rC/WgVHCrez9Aqjor7wv4c4TNfXE30iSV68KifPdqcyN3oy@vger.kernel.org, AJvYcCXo+erTs0wOplkj4MxbypicCPzB6yA/9XSqVo6yVqMUuJiG6pIjXXhF7cz0BeCh+mMf28efoyRFkJ8DPcwIAAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwmcqSzolMnaeJvOroTL2JHr1YnHWMHFo8jkXteB1eAAp6Me6l
	RYUZiV3PNtqNVCX2Jc1n8HQ2L9Gb5eYvPhf9Ofa3ayniJSSiUoheh4Ta
X-Gm-Gg: ASbGncvYMkHeDkw2ES7Iceo6Itl5R1JqyHs+PPYk9CZINBNZ6vaqZvPRjv7IxSiwm0+
	GaieSFPfWzSUXr6nt6yIu0SK11r7voCkfcJUtwGdHeYqX6PcInk7GwcZSMklO+KcwOveHlOmnCL
	7j81qOQQva5rYnb3hevfqlFPxNTSF2mZQWzB2+ycijau3NiuOhyHj+tsOE4gLRttltmy32IPslS
	TdlEXJeF0P4dtgzEnBoVyppGtFYsakWzS7Le7kyvtcyqkx46J4t78Nmhj/xQm18iSblh3VVXrny
	AugSJK/yT2vvrecdZeMaS81ypnzlCJLKg0oJIv67hIlRu1509gUkGBE6slApl8WhvOFGla/kHa6
	MCW0+vj/5W5YCWToSyCMPjene6nqGV7h6ArUcXcNTHH6YdDJZPysjUSruz8f778a1c0Mz6QCZnb
	hUmnGJew==
X-Google-Smtp-Source: AGHT+IGbagKWr5Qr9KVG5UVGps9BvoHL8pS+VjWZNJEvWtdpTayYNyyptN7bAPVPi490QhnfhS8Q/g==
X-Received: by 2002:a05:6a00:855:b0:76b:cb1b:a51a with SMTP id d2e1a72fcca58-76bcb1ba742mr9147470b3a.6.1754056323856;
        Fri, 01 Aug 2025 06:52:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143a4asm150148b3a.24.2025.08.01.06.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 06:52:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c06bcde9-0aa5-46d1-a5bf-bae5a319565c@roeck-us.net>
Date: Fri, 1 Aug 2025 06:52:01 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on
 max_hw_heartbeat_ms
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aIw-P6zkQSOhvYJW@shikoro>
 <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/25 04:05, Lad, Prabhakar wrote:
> Hi Wolfram,
> 
> Thank you for the review.
> 
> On Fri, Aug 1, 2025 at 5:10 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>>
>> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Update the watchdog minimum timeout value to be derived from
>>> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
>>> consistent minimum timeout in seconds.
>>
>> I don't understand this change. Why is the _minimum_ timeout based on
>> the _maximum_ heartbeat?
>>
> The reason for deriving min_timeout from max_hw_heartbeat_ms is to
> ensure the minimum watchdog period (in seconds) is compatible with the
> underlying hardware.
> 
> max_hw_heartbeat_ms is calculated as:
> max_hw_heartbeat_ms = (1000 * 16384 * cks_div) / clk_rate;
> 
> This value varies by SoC:
>   RZ/T2H: cks_div = 8192, clk ≈ 62.5 MHz -> max_hw_heartbeat_ms ~ 2147ms
>   RZ/V2H: cks_div = 256, clk ≈ 240 MHz -> max_hw_heartbeat_ms ~ 174ms
> 
> Since min_timeout is in seconds, setting it to:
> min_timeout = DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);
> 
> ensures:
> The minimum timeout period is never less than what the hardware can support.
> - For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
> - For V2H, it’s just 1s (174ms -> 1s).
> 

Sorry, I completely fail to understand the logic.

If the maximum timeout is, say, 2 seconds, why would the hardware
not be able to support a timeout of 1 second ?

Guenter


