Return-Path: <linux-watchdog+bounces-4139-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF609B3EF38
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 22:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E48CA1A86D0E
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 20:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E036525B663;
	Mon,  1 Sep 2025 20:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsUD5qsB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7572356C6;
	Mon,  1 Sep 2025 20:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757440; cv=none; b=b2cCIMtk9FdhMwAWe4S4OB7Ftgk7thQ8qFbpQFh+Nsf0y1T9Q64Yzge8k/26EoKyMjMXL37PVg4j+yoHSFNZweujE5ClHAr5da7PQL8hKUATZ+MlmS8kAJbxHETj2Pp1xUEi/LOxjarcokYLYaArTisMdlxZpsTjJgU8nG0Btlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757440; c=relaxed/simple;
	bh=LcxOoVfDe48j9HQYLYfYFaL8wNzyIvZJQTx/7QeuDUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PijfKVrlOvTXB56TMN1fDNKv2mboT/QZJaJcRcqdPHMnJgQ5zJhMa0dMjjUliqc1lqs28P51NXuj1YRGgjEcAcw2TdoYth4jkAnYGFU9uumj8pOTAR/VgShtqtANmrq4fKVnPXKhANHGq8GPBvBwv2se+geh+TTB/qSg+E6LDdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsUD5qsB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9F4C4CEF0;
	Mon,  1 Sep 2025 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757440;
	bh=LcxOoVfDe48j9HQYLYfYFaL8wNzyIvZJQTx/7QeuDUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsUD5qsBO/zj4WeLwN1wgiCt6K0SMl8wWyGQ/lAtQqdcRiibpCLTUdliDNmMMcKIF
	 wjoXDEqE4bCi9/sr8BrjVDAhbL+4Fzw6uQHDMzq1L3bhJJDgJdBQGhxtx9mZpnV/2S
	 gSHFGNL5N0l7aXt8iqTDQ/O3hbPf54zLcKtEY9bMn5R8u/FPLdHfukCrIcDVteqebr
	 pWD+uhm92eepv8ibvRWG75CkZkF5ebOTxA0DVSRPsxfTrKF08bEeEL8br2eFElj1FT
	 /Vt6yj/s/gOWXxuw+vOIjuXCoBw2T4WrTmSfSIBrDPDY1olFM6s5f60F/DkzOTy1yC
	 8/lUbIzk8Rt0A==
Date: Mon, 1 Sep 2025 15:10:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
Message-ID: <175675743743.261788.12655230407244757508.robh@kernel.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>


On Sat, 30 Aug 2025 12:18:59 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
> anymore and platform is so old, that there should be no out-of-tree
> users.  If such existed, they would have enough of time to object
> dropping Samsung S3C2410 SoC removal from the kernel (which did not
> happen).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


