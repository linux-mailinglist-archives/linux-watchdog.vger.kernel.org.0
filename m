Return-Path: <linux-watchdog+bounces-3725-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA97AE8E6A
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 21:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930935A61D0
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 19:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601021F4CB2;
	Wed, 25 Jun 2025 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCJ9peai"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049A1DE3A4;
	Wed, 25 Jun 2025 19:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879097; cv=none; b=ZBQaW5NHNnf229DjlZRriIgP2AbcBh3Y4pbxWqX2RCUcypkuvIjta4FsK0CTNfWL5UvOD0CVz98EppZ4lUhDphuXSB6coX+/7aV02uRCG4defYcrsJ/SruJUNS8Lw2QMXX03kISqr1O+0iqselNzcjNv2kehyhw3pHsEiQlRXW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879097; c=relaxed/simple;
	bh=gHCQBjUalx0Y3g9T4zD8PIbtEQMq7KaGuUuK92H4mtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnZP+yKkP+M09L33+KCGSLmFGz49UVVl97+aTo1YGwl+PL11A+Zvv/OXu4FbW/jR5102kD46E2oO+n7KSYNmuzIe0Bj5la6hTxzqc5k5k2wvAzCOms+1rbYAr1RTskgE5dIJIkQ25k9CNK6ftwzaTpcVLtblYowHALOgruoy5ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCJ9peai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76E7C4CEEA;
	Wed, 25 Jun 2025 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879095;
	bh=gHCQBjUalx0Y3g9T4zD8PIbtEQMq7KaGuUuK92H4mtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCJ9peai6qZRUopyJ5ElBV4r1lltdc0dVDpADSySrOBflEpNkyeVbM5/KJkQzUNPA
	 GXLF/HQXVepjn7UohLf+lSwlMo8djXj9hKAvJ/BTvCpvcvLnGdiORr/r9+saHV0yxG
	 p5OzrhMfg77kT4tnXYoVhRl2RJcw8b2nohcrBiKZ6dIuM5cPi/jtRixgzPpeA72MFf
	 D2S3ASK/Wx/rjY/E0woF48+/hbXcMhoH0E4Ta5yZWSBVIBj/7UtvH/UkcuAbN5dF7q
	 AQmFYDVt93M08ALe/mSA4LvdRkq42glIC3C4d/xqCUZf/deToaA12xNQqMLZwlkuJN
	 IfjJ2W20UYDnA==
Date: Wed, 25 Jun 2025 14:18:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Meng Li <Meng.Li@windriver.com>
Cc: linux@roeck-us.net, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@nxp.com,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	s.hauer@pengutronix.de, shawnguo@kernel.org, meng.li@windriver.com,
	krzk+dt@kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Message-ID: <175087909415.2065485.13242460443229220947.robh@kernel.org>
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-2-Meng.Li@windriver.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608030616.3874517-2-Meng.Li@windriver.com>


On Sun, 08 Jun 2025 11:06:15 +0800, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


