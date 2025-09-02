Return-Path: <linux-watchdog+bounces-4151-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5954B40D98
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 21:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37CB81B234C8
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Sep 2025 19:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A895E33CE93;
	Tue,  2 Sep 2025 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0DpqAtZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E9310654;
	Tue,  2 Sep 2025 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839971; cv=none; b=EmtbQS5+2WPGlT4MOyC01lK/PjGTOT7CzDyITSp7NFFuin4tKQTKl99gRuDa06VN7XowHVfcuCiJSXvw12ixoYR2DQ7ZiuKdnH9vFjq3glFq0rD61yNLvBOwo9G+NDpyEjplyn5jq4HxQWUsQad0XX8RXtEXumfXuihIoUDC7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839971; c=relaxed/simple;
	bh=3XtRTRzaEzjOBrXsBNKmNr6kksY8hmEJt5L1hRD95m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJzQdQeqkyB0U2LKd90A8bAs3vCW0eL9a5kCEBCEsE/vEas3oxmJFrhtMTnkiupbajkcbuPY8zZiXti0yl+DtRkSUUHhcjNKsSh2xpEl1zXhGoOC5WM/9aO1tRtMKi2fCk3GLyAe8YKEBtDdLoSHfxdPKVpKqdDliLvFHwg2WJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0DpqAtZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2489acda3bbso46269205ad.1;
        Tue, 02 Sep 2025 12:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839969; x=1757444769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTYhGjf59FOzojkQYZl3sby+TGLlLgSbcHBtaYliquA=;
        b=K0DpqAtZx1ZNd+ZdUsedLLoCsy0hcHyrk3PbAs3sXUwD6M3m0DyaFngWLo3fyR9I2a
         AwekNMJuthVzyDTeHIWmGy05mI5Rj3gjv0oYUxCrp606UsGuVl908HK7Gn8GlnLB87qj
         DKV6762KATb4lcorQ1kauZ/pEavfnxRAKe1ymdRdVXMAn5ruUJeFM7/5V+/GBu4k7Ebn
         GW8TXldV1reDbCv4LyjWVtvfUW/4YLkmJAut8/uWaK9NY7guq76RNnkJHrjv+nbsLdD1
         GcMHYC3AX8RCjhtRk2goYODN2XbQqmDNLtKpiV4woJJ/j+/M8cVRAP0rueG369OXuz4q
         GZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839969; x=1757444769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTYhGjf59FOzojkQYZl3sby+TGLlLgSbcHBtaYliquA=;
        b=Mn2TeaxlJDVMnJsQh7eH6FqnxKtHonyr4xO8N8wwzDIWZ3WHj2DfXROX7HdcOUIuIN
         hW+cjxVwXvcTtIPKsroI1ORQZV0soSWmF3+BgZupUcYtqUokdnEB7naupNnsrwp6ThdG
         YIYN/XvBVyyyxAZrFXq8AOuVJCMfq24zlBGiyxQ8uyMx2nxwcHQ9KpOq+413p+eBCGf0
         s4i4UazbAQP4+Kg0IneunsF1GWDxIZ0Vc+VPm5+5b5odLGseEn9P4OogYPsxgU44wvxR
         KoNR4b0GmyVHH7F3x+jzfTf+6Ifco7gf/IsAVitt076MLl7wle+CctfUUu267/OqtWbB
         cQqw==
X-Forwarded-Encrypted: i=1; AJvYcCU9l/AnXqdu61gEEnItU+sd6DFyxzgy0zDnc3c8zGydTrsdvuTXjOhKB79nLeuwkym+Pxa2jr1+Wclk@vger.kernel.org, AJvYcCUSww4pK60fTirzC6dwgMVQE2JhuuAFHelkFCkfQyiaGFuAFb61ubxjMeLTmc1ScGKDy1tR69V/01cjt32TfhhXhTo=@vger.kernel.org, AJvYcCUZg1k1sIfZi4uI48WWi1RaeUdPrPUXMie1Pe0rGOTHMsoVEJ4+ttB/Hle1eLfxT3/PYLyWK0hToIB8fHncl/g=@vger.kernel.org, AJvYcCWUYODyCOMQ5eOtmHQjQQGWoIQaFBCwyA6TdZ2K0pLX5ZgKDV/r3zjlDzpthadiwmonw4WXola9ukkH+9tS@vger.kernel.org
X-Gm-Message-State: AOJu0YzE43jHtRn7lQFM41bLpR6qe/drn2CYOtQ6we46znsonoT8mrjq
	jU9t0AL451e/60vxWOVm5z7layAl+xXAccYdCyvIO+7LTDYYMbqOrSeT
X-Gm-Gg: ASbGncveDDYHaOWujQiymTH8KcaM7Dv6pdQqEiVA/COdI3LjcOTCZecYd3gpa7dXaKv
	gUe6t6rCK37LGM/XtiBQ2boO5eiVvEqTwZJ2fPD5lCE2nb8cJ2y9cRCiXkDjGR1pdOqNjWdElK/
	7TzHHo8IfW8rauOxg4N5XvPM3DOnAPrKjAWmdCOm6hojDwzfKzu0/9rHMANYYdx3CIifP2rT6hB
	5X4DimBghJanPH5y8Zl9yWxYc5GArDSdLHr9c0apfx2a+tS4/4rPkHWgXTHRlmI4mZehpFfFiBf
	ISBYVpVRBYtSpVNoDtCN+EJroFJt8ozl2aVa8XLJiGVMUsjuoqXi9tFJOadBKRkEQc0bs6VUa8t
	xJC40duQldoAzG8obinZ9CZR7jERe7DHeTts=
X-Google-Smtp-Source: AGHT+IERT/MqYFotijaEkUzYQ+YLdKWS60k04RbJW7KGsK/vv7QzqmvdTA75hQHLiSjI85OXVRcszw==
X-Received: by 2002:a17:902:e751:b0:246:b467:eea9 with SMTP id d9443c01a7336-249448f7469mr161217285ad.21.1756839969172;
        Tue, 02 Sep 2025 12:06:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0a4514f8sm33408505ad.143.2025.09.02.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:06:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 2 Sep 2025 12:06:08 -0700
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
Subject: Re: [PATCH 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
Message-ID: <183810f3-579c-45a8-970a-51b61ddcf548@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-2-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-2-837ae94a21b5@linaro.org>

On Sat, Aug 30, 2025 at 12:18:58PM +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
> and s3c2410-wdt platform device name, so drop both.  This leaves the
> driver boundable only via compatibles, so drop any CONFIG_OF ifdefs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

