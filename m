Return-Path: <linux-watchdog+bounces-2135-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB6995034
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Oct 2024 15:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 901121F226FE
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Oct 2024 13:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C2A1DEFE0;
	Tue,  8 Oct 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgwsCPhD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7D1D9A43;
	Tue,  8 Oct 2024 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394496; cv=none; b=p8J91YmoBxPVAsXrGnFSqUT/ekJ1bDJqMuIT/WVwbqzWY/GpCqPlMwW8IETn1m5S48PB+3Gl2/btbwwwknmtyR/fwZDf2oHN90pils7OU71bI4aBYqSc8FwrOsY107477/LoE8EAfZM7kHSw0w4zPJ5aJObESKJZgNMEIwSW9oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394496; c=relaxed/simple;
	bh=AsYoCsU044vrxM77ATJ+bBtvZ6wwx4g48fpwc54K/Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmsGPJmUrK8wvum26SluhNnMvHQ6EU35rwoC1osj0FW1u13wgK0CKobvpbTuFqaqJs4rA95TuoCgqXcxGohOIcGvw/aZdgZEpFBYzOyPB422hg8ibH7/gwqE0ruJhDTYen5rYgVF51Qq1k3K3JOxM3zHjITAaLHZv/Vbg/9DHkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgwsCPhD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD4AC4CEC7;
	Tue,  8 Oct 2024 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394496;
	bh=AsYoCsU044vrxM77ATJ+bBtvZ6wwx4g48fpwc54K/Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgwsCPhDlQ59rdZyDIYS5VIg3On0g4zCf9UEEx8G3scMnBBRssmSpCPt5lj/Auo8D
	 N3jaGSR0Alps4nZlsy2uMCOwdu0LI9mzk0eYgpBYArncC5LW5wUHiKP2m0EFcjoR30
	 WIzErCGlJpBSS9id34mH/WvPag05INkV0w9QEx6BLV12YoaIiSPM1L5hMbOPpfpVm7
	 vXcs70W7lWOgKvDYPcAP3rCH5QPP3SbftG9sZXI0X3fqhS4NjGeINMSiCpej6TktaJ
	 KS7Y9jiR/DAVnxoPj63xm4Q4mh2CICdPitxuKuhSP/cevugGKLTeT4ffUaGmjZGyXV
	 3CThlwfvW4n3g==
Date: Tue, 8 Oct 2024 15:34:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <h2ynhrnuhiwixxkoeiyu5kpkpssvlscwbyxgsfdg2j22kwyfz4@urzf32egddcg>
References: <20241007212434.895521-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007212434.895521-1-Frank.Li@nxp.com>

On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> From: Animesh Agarwal <animeshagarwal28@gmail.com>
> 
> Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. Only
> allow big-endian property for ls1012a and ls1043a.
> 
> Fix dtbs_check errors.
> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
>     Unevaluated properties are not allowed ('big-endian' was unexpected)
> 
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


