Return-Path: <linux-watchdog+bounces-4024-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05869B2EC5C
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 05:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4C535E62E0
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 03:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8272B2E11B6;
	Thu, 21 Aug 2025 03:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1njTvMg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFFF3D81;
	Thu, 21 Aug 2025 03:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748250; cv=none; b=PKD8RGGu0xSE2eSvuOQAd2Pt2b3xnre/zRTZPZffdjacOBqdCZQq52K8TrNIrAchlBndFXo6byhN8XT/el/NzsJ6TG00m4Rd0WC7ZAJXfYUKtR5bxmXW08FmSxcrxWawug2y0k7gAC5U9VsehqYzoqB8gggb6ZdqCBqpsC19CnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748250; c=relaxed/simple;
	bh=Z8+d4gSTLZMhRjdHnm7uWMeOQ/5UJgAne+ywsnM2I90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g25QV1rg34RSnL32LD9BGITZm8VDYD8S9JLkxH+s8YjSOlVnmQWfkvOaNoq2XD/oEwnzIbiNou0DnWFhpHF9RVgRLoV/nflwRDCx9tp/rGbvavTNUJnCPU76ZQ3QfMmi8jN81uC1vxj4fE/+HFo05xv/N23MT2vInZh1XTnYfXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1njTvMg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244582738b5so4805205ad.3;
        Wed, 20 Aug 2025 20:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755748248; x=1756353048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2BG6eerYNv4s/9/GE1Vkkn4p8fgGjHsEEMxwOEbZ8Ek=;
        b=g1njTvMgEUxjg4q8ThbN237qSWhtwik4821XQCGRQStrrA8ErOJKwbn2q12cOvEm5I
         rKVGZGmP9x+gz9uyefYC3bMzk3F5ZkzZzA1Q1DS74f2uLz7bQ8/UQAfnVABRDGUfncB+
         6mr1ltC3bBCkyhMqSrbKwq+znNE174+Wvf+/8MSYaz35zHNmKoQ9fC8Mw4v+1XzqIJ6P
         kytbSdzP/mGz8WoumCXD1bptfNHl31L1TES56bxZGxhqKeJ6P5OMFe1CvXa8i+zZ5ZL4
         RXe5dl/z0mo93leP2scJMy27DhJPQq8OzbqFo2Fu3ZMRtlG5i8MlD1W4xsz9TbjFPO46
         ktgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755748248; x=1756353048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BG6eerYNv4s/9/GE1Vkkn4p8fgGjHsEEMxwOEbZ8Ek=;
        b=BMrNdeyna/bBaIyhxX0S74oh8qNGzcH+ZrvMorYhl0odVYA52vzkfkB4g566zh7MkM
         1P2VenfKyth8Bi7sb+EJ31bmgMy7iYeaWbu3nOw/LkX7XF1u5OmQuwvCso9FFKXJGfhm
         6q1Lvgal9L5cYsD700Hn4LxHDouFN60TDgEnp9bqqn24k2LCljthIulV1te1ClgLixHF
         BHG83e92haSkqt9T3HfoJnMwawb23wrHwt/YdzzmAb2N4zyXvT2kWIrSPmmJhjrnm1ZL
         KJCy/Ze/jpoeBrU9e8k5R7oCqwBkFV34EMvr03Ka2GB50Z5Y6C5wq6lDMrg7neSa6kxb
         ofcg==
X-Forwarded-Encrypted: i=1; AJvYcCUSrHrrIdsdyXXWS6nkREv3BsiSaIZ/6yufhW8mA/nt6F/W4iO2LOp0LkqPe5HQfUNS/sJWCdxr7a47LnZa@vger.kernel.org, AJvYcCVf3eiMnYMi1zWlPSGpmaaUCZ4slKaBGYmp4jHuAzWc+8cdk17mQWW0bMf1hXgEjLkiNqGrXKVpwiacfUFFEsteyYk=@vger.kernel.org, AJvYcCWVDkYticoQfcVSYHkfRS5ny/hduAjYggnu7DK+nfYzHWeJR46yzV+OK4PONuggtu7YJnJqyFmVUUqB@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJym4SCmvm4EJFqnDVO81gFDgKrErGPyRLAx+HUFu4lbzS7Nu
	NOUr0TMFnUJmxvI/ixmuI79nkmQAkmxLLo0sBzvFB8P6WJ/tcEl5C2nizks4mQ==
X-Gm-Gg: ASbGncu05zBvEyV5cb6E0Q+1nq8Z76k1eosMMvh1Aai6F93xCq9QfKirt/gTlVYkZo4
	1GQfLS0tCgjXdFGWnF5zUlYV1RfY/ftm5YBytT70cxMy8lRwQ36F88GeB4uPmNZOpwoyu3LUqp4
	FI8OUa4QDvkdLrgr+aBALtX3ncAHUX3oJO/yYTHfnnnkEFANMfPMULAj27keROJHTkC5zUCw7mK
	tPKtGwXSoRAWGoSVuyLrtxCuFey4Z9q4Muw03hKINqBuD+qhlXPisqCs89ciLLuwYZitFQmqtPl
	+E9NEtshdpqCpTnZWPwd+i8CCNx11iXOKGSVE6uakzmgwDwKPN8idYkW0MCMjPYePxp7fAjXVA5
	K+Zct6w5Py8VSo9iS5zFRiK4Qf3COU8DVQ4cSyGoAjirtd+LKh4GHSeF94++U54/9jdd/Iiw=
X-Google-Smtp-Source: AGHT+IFGfJ6V/Qxwq9UvkDPLzEcGlM4IKJedKR22KIxjVFae2lkagDe2e5Lj44p3wUXc45GpjaFTGw==
X-Received: by 2002:a17:902:ced0:b0:240:49bf:6332 with SMTP id d9443c01a7336-245feddd9d1mr13646205ad.47.1755748248105;
        Wed, 20 Aug 2025 20:50:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f2c16b44sm496344a91.24.2025.08.20.20.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 20:50:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <39eec996-87f7-48c9-b177-1b1e4a467f35@roeck-us.net>
Date: Wed, 20 Aug 2025 20:50:46 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] watchdog: rzv2h: Obtain clock-divider and timeout
 values from OF match data
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
 <20250820202322.2051969-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250820202322.2051969-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/25 13:23, Prabhakar wrote:
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


