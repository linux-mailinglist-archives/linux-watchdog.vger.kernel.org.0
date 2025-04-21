Return-Path: <linux-watchdog+bounces-3329-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F79A955F2
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 20:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA95916BBA7
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 18:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8DA1E9B0D;
	Mon, 21 Apr 2025 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThdijOIP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AAA14883F;
	Mon, 21 Apr 2025 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260145; cv=none; b=DRqgNEFPfqmcGaGJ//18saPTUT1wECf2qyK7mBiDkB4+9nYJBFaBkoI+YtZEvQy+Lp1pk7yiWQD4ujFsk44xLFjy8PqRsNdvFfx9Ng7RZNKLnL+8+ndVVygWR64fE7Lm73JyMuFt/OHGidV/G/9fRUn/FNOIaidgji6Bhr4F54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260145; c=relaxed/simple;
	bh=RKZeGBfLf2qtqFtq3zPZmyB/nlO3RinSRchjjFTJcv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBEnT9PnVUJBf9aIimUnR/DCp9Of7zLnZ63OVuVMBglFWk4TWbruU3RPOGf8RqPl/C09FKsKEX3U3e6W05AYnDBfPkKhLbMb+xVEgBmHKQew8Sawh8oyE6UHu+GTvW/hkhZdYBGeCr7+dZvTDj1lcIoBooJrIhQaQL00w1S07fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThdijOIP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739be717eddso3189684b3a.2;
        Mon, 21 Apr 2025 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745260143; x=1745864943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LEkfejIw1pTO7xQTKbeC6S3IuRHAGhwYTjYXnJBC6zE=;
        b=ThdijOIPdbEt9oy2eetK9BEUUPuLb63cW8GkFY889IGqK7TdM982LPLPudBI5sij5y
         em6faz+AQ3B8wgHleIZ1H2hX9q3sSq7DLf8RvUtHxc09yD/XcG//ojltpShfGVZIuqMV
         a9V8x7ZEFplC5pj7Ne9Vpxeii8A9RDI2zIKbmVzMo9IbcaDa5U7EsnzxGmSQSm7q/4/K
         Mo2RkrJw43hVcasMiENQjpozHXC2yUinw0OD9iHNhY878TjsFl4hDOjoBSDVFS2FFzZ9
         67fvl99cJ4l8lug1SuA3ltEGAhZ5otUzsL3cqt66LGOg5wGrkMukyRieGbgwiChsh6ql
         8hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745260143; x=1745864943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEkfejIw1pTO7xQTKbeC6S3IuRHAGhwYTjYXnJBC6zE=;
        b=a3ulCIS+FN5Hfx5Re5TrpV86TdXlFYRiDFOqFPLjwA0xxlxUWPv/U3DZJ+5EFyapkO
         jG7Rnk+YlkuGuXi0J+4P43W6TBwXqC2eXPxQJdilqbdTaTm420Hq05T7v96LGIx3akpG
         mKkzBP+94ONjHcdq/qxomVwIc7WbW4ZT5Ni8V1eussNMOfwPJq3vNS7QO9QX/UYmYv8C
         1RLV8d7gFL8uCBnFkDDYsAMRW9Vc++r93eIPOYzhUXUyG+jc7xEb++t70Ee2Om/XTCNH
         19r1ZQOfe6Po9G6UJV9VFsq7hLiOL2FGMM59f7u+CVr7jP0oKBvFnRdASDebCmzIWQqu
         zIyg==
X-Forwarded-Encrypted: i=1; AJvYcCUDtaKI6LWBi2o2xvLWMhYvikOZkrPMP9rxfOQg/ixy2CsFoHD6UUxWREowHydzOsNzRktDl5egqB2t1Qn44oIq8uc=@vger.kernel.org, AJvYcCUnlJCqbh/4uXkK7n7vqXf9rxcDncLq98U2cezeelilx6WK3kSDCMMILw14koDBvN2Ol+mZghpdn00IbEIQ@vger.kernel.org, AJvYcCWj3L2PQyKkncdhdsi+KZL+32rhBvgvunMk22af/F42M+CQkPhdz7i1FUPqMOHj8YnRlMvcVfrHBkAftJbGe4g=@vger.kernel.org, AJvYcCXzVESWBp3MA02134YPKXFO+gzdxF28xufFvoRd0Z85d/iLKpnLlKi8lpOBYNrzR3Xz2Ax+JPfZiNin@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBi8MtRAtpnAC7k3NqmzR6jwTvN7AZdsRdOYWbi9MFmFTzgH5
	bbbP7dISDNZW01tN5Rm0ZsvKF8JMljS01+XDdgCNQ6Lcm0oQNp8V
X-Gm-Gg: ASbGncssPKUdSOXtyFBL3JnG4+a9sO4WYhIvN1aSL6O84ExO/4SXjjZMARnD6QElET1
	hfOrbWG3N9Ck8kvCVo+M4OO2yNxc7zcG/MKSdrS+IL/bxXDzVQGqrwO3tNAOaBL1hwMwj/x1Tpg
	8moEFRCq9zib8dRjhxkKSG3KECcgDYtQ8bUGv9MCHuqRdFajIpop6+nVSSjvwPczp5jIbOP8vJd
	D8l42Kdyen/rlVt82gmKGrI1dRi9+QwJDt0JrSVwbcmaDR1cexfo2bOZp42psjE0scd3KDlufG8
	2xUB+nk2UDXkTLOxJwWp7wfMN7yvsDdDvssEuZ/Hk9wANEso5K3WcBhSK5yio+txphKLk2cgxPn
	nF0TjyXDHyhhvnyBn/Y71Ks3o
X-Google-Smtp-Source: AGHT+IHZ7aaJiKwDHEgBaIUKXOY9XmDU1DAmhPjLIz0F50JBRbZvABqt/8IIpKMjegOYyi51WnyVuw==
X-Received: by 2002:aa7:9306:0:b0:736:d6da:8f9e with SMTP id d2e1a72fcca58-73dc119fb18mr17166388b3a.0.1745260143068;
        Mon, 21 Apr 2025 11:29:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm6940807b3a.76.2025.04.21.11.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 11:29:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a6b7948e-3143-4836-b9bd-81c652a08aab@roeck-us.net>
Date: Mon, 21 Apr 2025 11:29:01 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: s3c2410_wdt: Add exynos990-wdt compatible
 data
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
 <20250420-wdt-resends-april-v1-2-f58639673959@mentallysanemainliners.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250420-wdt-resends-april-v1-2-f58639673959@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/25 12:00, Igor Belwon wrote:
> The Exynos990 has two watchdog clusters - cl0 and cl2. Add new
> driver data for these two clusters, making it possible to use the
> watchdog timer on this SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


