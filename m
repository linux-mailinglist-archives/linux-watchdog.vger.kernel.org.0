Return-Path: <linux-watchdog+bounces-4201-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E639B45B7A
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 17:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05AAC3B5A01
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Sep 2025 15:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A22306B37;
	Fri,  5 Sep 2025 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUhPqtfC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375AE306B1A;
	Fri,  5 Sep 2025 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084374; cv=none; b=JLXHJBz3eSLzFad06Q05sMKJ1GG1UTcpZE8PDf2svDiPDndbxLxumxWyECau2dRA0ebpfGuKRcJuarEUZ1snU21V9WUnq6d+/W9nBLw9WqGs/723PVGfWcYDCg7reLVuA++w+cHt1ZXJRS2VlSweoUFLzrFOcPDvrJm79Fzc/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084374; c=relaxed/simple;
	bh=cUGN/wzrVSoqYTMOmdRBda+jkl3PmKsA50plWDMUcuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wqwy4Qf83nGf/uCvOHUAt/pi1364jsKpuxxDSyKYbd+12D+Obj13dTXHcMWWdWgzw65sIK99WSOpgOjpf02IT8b5960ZGVZf2gyNUqAEGfbPs3Feh0iay7VRQOP6chAG3n6fsWZ8PKDjI9KjP+OwzDnj9tsTAueBbvlo5xl4wHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUhPqtfC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24456ce0b96so24229515ad.0;
        Fri, 05 Sep 2025 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757084371; x=1757689171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xW+aJGzb7wHmrVXSSznp5Yz17F8YF7pk4UxzRQqTk1g=;
        b=jUhPqtfCmvuvF1Qi63a9n5uuRAt06G4YSKSCHIjTsIW5wPTT8l0bh0szONaNYM5+Kt
         FI0JSdWgnV4zRk5Kusx4RF8W3RNr9yGuW0TyeyywtJnK8PI+avvgnmxVIQu99hjcURWR
         wnzYnd+VgT3sdOwmfaJ2uEqNrvV9M6g80WJ2Lr3gW2osuwUgw/nxSmX5BECp/hKBa+bF
         Ile+3icApByYJ8FLcRyC0Nx6hdDkto0RPHnKTJEVdzLQI25ETwSzLpLclAoxtYTKeby3
         2PLPl9bX5P7tZJymxZRpVPCEhDrfMA8FMDUnPTk6ReVYyAqgIQX/Rfw//rMupyHdSW0P
         Jp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084371; x=1757689171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xW+aJGzb7wHmrVXSSznp5Yz17F8YF7pk4UxzRQqTk1g=;
        b=H8wbwGL9oAbXWM0r9YkClHercSd83XhZbfXQ6wCYGU0a1FcKLb4dTjigYWW1T0T8Y3
         CkhWyg/N9kAd6PaJ/2yZstV6DUq3qMr0d0QsLCPeG/kVkRHV56Gv5Eqltb+K+nw/bfyd
         pnb5WoDIYgwuRxCQgSWJkbaap5lr8CFVhGYtyOxWeHvC8FDO+Di7jBrgJN/3w8pt5OwE
         BIlsv5xzwqvYZGc5BctH+V3N+Twz19+NkIL5M1QZh07qExzzmUKxmEvudR0fyuIJrx2H
         zwgmtrYIPFu+V15YYN5NBv1SoB8Rqq1Qo0ZKJ9aS6fB8oglKl4Umc2pfD/Ckxl7wHTKQ
         h2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUr665p+CHPfKUThRcNat81nDb/rJL/zPn12bJraq7cdUWkT9ESgKfPtnOhjxHy+3LQCGdiBodiN97I@vger.kernel.org, AJvYcCWRsIEtFlilcTJLTfIbH+Ef+C88CVpXa2lCJFKLpYSjGH1AFoATJBq3/U9u4TRveB3fJ32pAIm953vZ+eOm@vger.kernel.org, AJvYcCX88Hb41+hycUg8Io+iy7DLXBC5N+iNqgTVG+75sAEJwcqKS1a5jtMjbU9bGYLO7RL+gz3Zj1JP59EEWrE+hitgfxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvmwXiADFt8cTYgZaNV568VAAa3swJWZ/AEYUQ3geBB4Fkbj8
	UitHuzV/+q0hjvkOUC8rOHZzoBQXu2MEdBD1Cd5B2Cd0zcVKXLGYeHNY
X-Gm-Gg: ASbGnctFfERYjX6387xiJk9QfQ9JIX2XyYX050bzlrEio2BO6K/qNbvcxy/X7zkxh53
	0YL9COWSZKzL2h9ZtPrDnZ2gregEITfrP7AmuDuTvkS781cZtZkfHKPFWVyFpKDNo27qMNvaT76
	39DoBDSgIk+u6rTHR6oUrZT8clzMz8qzmOZo8Rmeh0knERrq/GToljl8G4uetv44noWH62p2x/R
	EAxNDMQstIUVBT0i3GEhYC4uJ9UHHBbnAKkBHuxdVL9gc5YX70TQ2f04rRdCCJnpRW43ctkjrSJ
	n7KlpI+pGubg5O1QpYs8J//GWr+sa11dit+2lLDzWp3iuFxuuy837jLY+pLGemJI34GoNY383pN
	zmKLjjB+X+GalDPb7pkzpaMc4pnLhoW8WpU7Yti3Ft4tm08kJO+5Cpvk+2wcptCzJw/AYLHA=
X-Google-Smtp-Source: AGHT+IGxH1/yuoG0bV0EUZYJipuYzhOx3fFGWwyOnbI5ixhz4XJQ34sajUfOhGBgfB+rRZx92P8WAA==
X-Received: by 2002:a17:903:4b07:b0:235:f091:11e5 with SMTP id d9443c01a7336-24cedcb72c0mr48145235ad.10.1757084371208;
        Fri, 05 Sep 2025 07:59:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc919880dsm46483655ad.51.2025.09.05.07.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 07:59:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f44a1b1f-26cb-47df-a7c6-bf115a695611@roeck-us.net>
Date: Fri, 5 Sep 2025 07:59:29 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] watchdog: rzv2h: Obtain clock-divider and timeout
 values from OF match data
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
 <20250804195723.3963524-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250804195723.3963524-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/25 12:57, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the rzv2h_wdt driver to fetch clock configuration and timeout
> parameters from device tree match data rather than relying on hardcoded
> constants. Introduce a new structure rzv2h_of_data that encapsulates
> minimum and maximum clock select values (cks_min and cks_max), clock
> divider (cks_div), timeout cycle count (timeout_cycles), and the
> timeout period select bits (tops). These values are provided through
> the OF match table and retrieved via of_device_get_match_data() during
> probe.
> 
> This change allows dynamic configuration of the watchdog timer for
> different SoCs, such as the RZ/T2H, which require different settings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


