Return-Path: <linux-watchdog+bounces-4153-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B9B40D9F
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 21:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F2716FDFD
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 19:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1142734F466;
	Tue,  2 Sep 2025 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqXZxBNN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951CB280317;
	Tue,  2 Sep 2025 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756840011; cv=none; b=jLLcuRIcUPVlpJVA+OqJBfoxJInoUqXaYRjMaaGtI7aLLceYXfGDu03jdQIu1gCmTksVduNu+vTHB8fgsEFA9WGkIjzgjsYJO1UlLNJNxIpVB4dXZx/zBVoGEdZ7jbuJWngS31xV6yJaDXUwf/ABsl+frnAYeQn9uizJXIQRUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756840011; c=relaxed/simple;
	bh=gUnL2b4OQA8E9Zp2pHhmK7ZbCsYMSFIFM+c934D0UhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/v9VvQFoNMrs+HIdHrJiD18BVgruvRSHEEOE4Yir1Zb8akQSebpXfP6s9F8tfV8BtWdRC1hG6Al5qz+j1+HaRN0rWLPTDn1/GSN0qfQrSYLTKi3crXV9CUYOij7VvoL7Lngbb8otVi97FSmUGxoUi6LQGMYP5jXFt0t9qdXZkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqXZxBNN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-248cb0b37dfso54460905ad.3;
        Tue, 02 Sep 2025 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756840010; x=1757444810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0tyuMeYrRF3UuyC0u24L8yefESvpiLXMf//ew+AAMA=;
        b=BqXZxBNNPPoUpsDBMxWvid+I1pnWNBXePgTSFxY6TXn5uujtY3oF9d7OHxV6rNHCXH
         RY3e2YyfcYxcBV+6lU8OjSfEpuzZDiFGZwAm0U2KyOWToW8ERGgL2gmTZUi6z/6LsPVd
         W78G+Cw4qJljY/fImoqaG6r+/Jg6y1GVBXKzSi5At5Nl/cvkadGzf57+j1683KOIy3Yh
         2MOPLtSCp2/kOi2AaOL8vQBcNc1Q768Bv+9lvuwszjJiwrhC4Z1fETaBNBzDwka/jwlP
         VdnWt8VJu4DNv5gCq17mI7EU03KPLcMa+2VVbOutak5vkMPdT1fJ1koePnfUVqMbIe00
         OR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756840010; x=1757444810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0tyuMeYrRF3UuyC0u24L8yefESvpiLXMf//ew+AAMA=;
        b=ekD99pGY3Sc/yi1kfzZO6fRCl2fPvMr0m7l4PZFNiIriuQeE2xllmsgdX8i0BhVZUF
         d269/dN0O/vPJiIG7gfIPJlSFnMiPWjQ7DcGa6S/7mvK+DuiWFEWrU7EzfgIjGm+8y9c
         SbUEcO6mLHS5GaX9P7g7g0g28ob13Wnxf3OTIXMOxcufz/xgi/mPmQutJlXGRWLzIjy/
         pZQ8YCrSFEd4w7DNSnP5OV1qu53jvyPsubj2hPDjRHz0TlILgIAd/lLp2lxqAGSCGnZf
         J+exIHyaukuZ1zu5Bnt8IVQ0sXY9p/mk6OqcfejRu7Nu9UCfaM3i7x1c2ETG7+IsHYPE
         oDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe258eM13TRqViJsO689KVDuSgco9MzlQ3b6vtXRq0p642IQ9A2En3f60ZJMYNAxHDap+JCCRYOsKsFFwh@vger.kernel.org, AJvYcCVwm8sNlA6rRh3uDwgsFXlIh4U9qYMMKLqeBN42Ny6yrTxwuzZYukgF21r4IUltY95NdyCvUD5jmFFT87V28Zk=@vger.kernel.org, AJvYcCW5Spu08kZO35rEgDKSPnxwNPncEjhHoAFwLU7uSyKktyyLzvPjmrIFqOZOt8TqbYA9137hwVdI2P45@vger.kernel.org, AJvYcCXN7zSfdhvlg8hpSdYBazyshcHl0UNWgbEaNNIJ3un+VjjHl7bmj31Y+FDZR7KMEziKE41eETqJCH1IYJq/z7bfsf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Xie/IROMX4djGaJjFNpoY3lBF/qUrYhtpUAlRHMcAGUzPXfq
	c4Vkt3xAC2KmrF9DV3HsawfHXCOStuzMvoOnUFjCtldy/ZCjSbkegJJR
X-Gm-Gg: ASbGncu6Dl6IQzvlpC2QXZPunEnDHIWJ7B4pXQm6eZ4KGYiTdFJUuRqnuAlOC8iMpX/
	E1BtgXghlDDX9bcI4ClHtBfpVY5DcaDpjVU63ehY1jqWcasmiJLiemmivUCGvUdLVDWdPTpb8SE
	U7q4oGhIfpVcWePVRGiodPwNgUSvEd4DePPPRQ5oUHbWxkYkCmuQi2SYvgqveJ76/odPmZb6ngs
	H3/jbC27/T7y+ZWl1HdV7NfBPATiFuQYVmymLZg6kOHxMdmMpESPUELngmBlmSeqbpHZQaU1GGJ
	kwdv3CU9ePi77UmT7SqG2To5s4hdfJ53BpGgx3NIzVBOU2OIAHDNnKYhLsfdmdlJsWREkSL3an/
	rOqFYVWcPbFp4qSP7r02LdWfo5aMEd2KoMKA=
X-Google-Smtp-Source: AGHT+IGiaaNenZIIlYQ031zqIJ8csfv12moDoXvpOr+m9JD1YnwbUBskbJecUQoUMXDhWons6OPv4g==
X-Received: by 2002:a17:903:1211:b0:246:ceda:ebeb with SMTP id d9443c01a7336-24944aa2848mr155824775ad.33.1756840009795;
        Tue, 02 Sep 2025 12:06:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903702354sm140993485ad.19.2025.09.02.12.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:06:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 2 Sep 2025 12:06:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
Message-ID: <fc652345-1dcd-4adf-a472-907c9692de89@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>

On Sat, Aug 30, 2025 at 12:19:00PM +0200, Krzysztof Kozlowski wrote:
> Binding defined two if:then: blocks covering different conditions but
> not fully constraining the properties per each variant:
> 1. "if:" to require samsung,syscon-phandle,
> 2. "if:" with "else:" to narrow number of clocks and require or disallow
>    samsung,cluster-index.
> 
> This still did not cover following cases:
> 1. Disallow samsung,syscon-phandle when not applicable,
> 2. Narrow samsung,cluster-index to [0, 1], for SoCs with only two
>    clusters.
> 
> Solving this in current format would lead to spaghetti code, so re-write
> entire "if:then:" approach into mutually exclusive cases so each SoC
> appears only in one "if:" block.  This allows to forbid
> samsung,syscon-phandle for S3C6410, and narrow samsung,cluster-index
> to [0, 1].
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

