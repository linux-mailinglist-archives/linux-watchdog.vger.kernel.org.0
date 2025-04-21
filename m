Return-Path: <linux-watchdog+bounces-3328-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77258A955E7
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 20:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177CB188F313
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Apr 2025 18:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F391E9B07;
	Mon, 21 Apr 2025 18:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmuTAGCT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA691E9B31;
	Mon, 21 Apr 2025 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260120; cv=none; b=PZZa/jGAJrBLvLCTFEEINNMr9Kzt8lR1jyOr1PC4gvx1gKnj0ea7GF/I1mRlT2CFhKYTcLsw09BirjqLcWRE1Ds+t61zNqzUwQQhfknVXAn3m5/C259+6pXCO0qqV94gsxrMpeKkgg0h0139LnvsDZrMzzGF6MRIeu7bEJFpXHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260120; c=relaxed/simple;
	bh=dJ42hyFRaKvCRXRgVd/5sUAj9cgtrGwEXODTEyU1eQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5cJJAZ92u0SGFIb/7Vq5kQoW258qdXOjRRpCFW5c74EfjIdEb71c9o1Hq8KoZ5o50kP5Iwqjz9Q8uXRHTYlLJG14tpxnUoaisqfdbjavC9ze76SP+oLEPbcQ7rL+ySPI6NPg46TJ5X50rnhyviDh4ii9N9T5hPtjIk852LjtqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmuTAGCT; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af908bb32fdso3582716a12.1;
        Mon, 21 Apr 2025 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745260118; x=1745864918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FKfezAbyINz439QFK7u4LKc0xE0oolzizXsIr73Ko5k=;
        b=YmuTAGCTvJLuAcyXGBzpRgrWtYsrAyrFtiIBwe7zwG/kwIxqfnZf+KiXoWFifOijMg
         H0fziDow3Z8xX5/O7e7kDS9NtljD0t96V0LxmcsnHJ+81J32A18N+flzY+DZQJ32RzRE
         d6zq9IMtEx5d/8RKH3DIOUtN4OZzM4P/eI00kFhito0yItfEvJF61pIE04PP1dR8jdLO
         jaz1fHBp+8cD+jv0VOYNgRKw1YqixQNQEuiNmdgXsqDAxe6SOo3vxrWDlNpHEBOXNswv
         1dAiPUhTgu+4RkBmED0xNhEsTsw+JHSnzFOhWwEKLLoiGxeV54lWYk/Au8H28hjRxl6/
         h8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745260118; x=1745864918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKfezAbyINz439QFK7u4LKc0xE0oolzizXsIr73Ko5k=;
        b=fALUiJCiCXcL14EeGVeTSis8IJWXPGY710Mb7DnuN2oNrC3PrLpotLWwYuEttFK3b9
         0pik3Qlksja4yA9fTAMq4f8sc1JeMzm8iEWFbCq1sWn82gggKp62RC8fR6eU+IDPkBbe
         JWxseKq1Tw4caAaU1KmP/wHsJGcDkGggwdb2gNcpj+suBrsRKZatS9qKETFBLI4FmoRl
         JQTyKKe2sMwfHYLzfhcqr0SrogIePBPYE2fPygRKD4i9NzYHD2ca7LcXO/NSlpDsmaVZ
         L3JwuQTm0LIdySiIMOOVUEemMX+9HyWyI4epyfiR538L6QgWdSU8Ut3CkoroqFWFwfII
         ALJg==
X-Forwarded-Encrypted: i=1; AJvYcCVc1sD837W4JH8UzegZTqCAEgT8wO2CLStKcG5Dj49363obCk7XsyDng5sdi/V/Q4P8tWCAoKD29sC8g3B6Nnk=@vger.kernel.org, AJvYcCWDIVdzGbN0HuKYSASa6eibNb2CtE1GVkGfsOSpnkeOuB0dtwapM4vug2vwfMyWKeaxcW8O+e5/YX0iva2j@vger.kernel.org, AJvYcCXWJcUYTR9HMADbfGmilq8VtTwNMLRjo3PmI0OdSLDqOIkbEyv+0bzp+Wg6cX7qstDN2sz+rpH/VdVM@vger.kernel.org, AJvYcCXX7KPFCMh1e9e5SUDrpCFmKdE7XapPgAoZXM7mgGgVRvf2+AEMs0+F2TpcEkelTRhgrDObtlmpDGOGa3YeNYQBg6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgiLPlIgDKEu0wrx2Zcz0i07POo2mAsn2Ci1q5L9jFpx2U8D4
	xvUSFfiCR7acFJ3UA5b+9yVhi9lwnsgKk9rkjx0GdpAL5eMFD9gf
X-Gm-Gg: ASbGncsCPP2+8bDD/3fu7j3I7WIr3gKOu/+zfd6RyPQCiD/VYcPoZYsQdSzc4jMkNX+
	gv08av6WFoD1MSWoDreXwiC/ExDtqVFThoJ/9mMeOj4l9eJEVPjzaJRK+P7ch4N5tFgJX+uHA+2
	hbVncCN6UZBwRgnPX4XdN35E0ZBzTmPst4n76+Kn/St26k9s8MODvXjuZ8Q5hMzuJABMabEEVrB
	hmJKLhtFiRP7WTv6l1dYEFpmpzioagdgQQAEzXox+P4MceXuE69nwXDB80vXr0hwYmFR8/YHCP7
	YuPC90slTRs0fmuB+ZStloCacIC0Wo2meijEkuAnMQMpl1ksLNJBuQSoTWm5UxQrvdYflP68dAn
	u7g/A7Q/RLJhOWRJbV87oCyKt
X-Google-Smtp-Source: AGHT+IH6BxuaRCy94Tqcr62CL4dRSN2/IdSa5qdhKN6CxeugqX6Z08+pZeNfnhrpl8lHjVMGtoOlfg==
X-Received: by 2002:a05:6a21:6b0b:b0:1ee:b5f4:b1d7 with SMTP id adf61e73a8af0-203cc5ce546mr17208028637.7.1745260118137;
        Mon, 21 Apr 2025 11:28:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c6355sm6013366a12.41.2025.04.21.11.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 11:28:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d21dba8c-dde9-4071-9b1f-8632b08f011b@roeck-us.net>
Date: Mon, 21 Apr 2025 11:28:36 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt
 compatible
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
 <20250420-wdt-resends-april-v1-1-f58639673959@mentallysanemainliners.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250420-wdt-resends-april-v1-1-f58639673959@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/20/25 12:00, Igor Belwon wrote:
> Add a dt-binding compatible for the Exynos990 Watchdog timer.
> This watchdog is compatible with the GS101/Exynos850 design, as
> such it requires the cluster-index and syscon-phandle properties
> to be present. It also contains a cl2 cluster, as such the
> cluster-index property has been expanded.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


