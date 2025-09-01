Return-Path: <linux-watchdog+bounces-4140-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94EB3EF41
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 22:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E60BB485A33
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 20:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1FE263C75;
	Mon,  1 Sep 2025 20:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AihmJg3l"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBE25A642;
	Mon,  1 Sep 2025 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757599; cv=none; b=I1Sk5S8AlHwq3zTUuCpZICg2ljhQy+7Tpw0xK8srYJVjciVZQWjl2NZTSw/xSWZVk87tJAUjzJgzw4kV4wNU83Wb/2JccfoIzcWL4CnpSc0a0XwnzEvJ3pPaeXg6luWGPFECpp8EPilCGQOg6hpqaEsyct5YapOU+oPpdB9SH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757599; c=relaxed/simple;
	bh=h5AbjiFUdzaBGXkC/aYLxuY1L3PZiTGgFQvMvER9rQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOZ0XReFodIkKYV/y9rRBjdsGLC4EViL6qUxJ9pmIMTx54KQtMHhhCAvh6mZ+X97htzvz4s7xvogOpOBQhrGXqJFVKo/9Sk76uQ9/kU8yIJ5jvwZumIWBDrBjJfmnoWIJF41LBSO6ms61qbBZyrAgJ65ToC8gxcU/+K0Brbuo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AihmJg3l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F58C4CEF0;
	Mon,  1 Sep 2025 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757596;
	bh=h5AbjiFUdzaBGXkC/aYLxuY1L3PZiTGgFQvMvER9rQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AihmJg3lsTCEBkSxMfHKhh+P6mwwk0am25MaHURkDsLk8GGB9uDPiOGpgqNxeU1sO
	 wZ3Unga3Rv4j6Kr3xmTSaHK+vbalvqaPskUbFyc5RrVizYYDia4GlTtlqE640hQuzO
	 5OrSHvklJzETgpdUb0GYBL1f+kko8wH1aBcrQwWoT5W9OjhT8h/GkwLJlQPdRrFCrS
	 lklnbsOoEomgoDYKvStsTX92LymTL/rRFPr3xgkBbRlambEl8tm3jtdRsI9gPl1mwA
	 INOEgQK2T0/gXsVM8GmTzyjFQ3g/OENO+YBtj9+o+hBQK9EF3tdAfEaQwkoDzpq5MP
	 bYPRKr7d0jYcQ==
Date: Mon, 1 Sep 2025 15:13:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
Message-ID: <175675758490.265131.17956569668520199935.robh@kernel.org>
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


On Sat, 30 Aug 2025 12:19:00 +0200, Krzysztof Kozlowski wrote:
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
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 70 ++++++++++++++++------
>  1 file changed, 52 insertions(+), 18 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


