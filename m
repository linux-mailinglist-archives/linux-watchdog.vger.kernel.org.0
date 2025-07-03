Return-Path: <linux-watchdog+bounces-3813-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B14AF7CB6
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Jul 2025 17:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 182597AF696
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Jul 2025 15:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F0D2D97B6;
	Thu,  3 Jul 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eM1gWYfQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8613C2236E3;
	Thu,  3 Jul 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557499; cv=none; b=Li2SRnshkbdpYdJOzs+PfB4lRztyxkWGgVuSBIH/COLpi+ZQazTDnin5Av+PxpmiFZ0nQL2kHEuHGC+MjF6KVNq6KOOaK6FI9SowmHdCPwnrACJ/2ELb2XU746jbgacMgovvIDQusvqRu9yACd/E2LtMi9SsC75KOhMbOCLX+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557499; c=relaxed/simple;
	bh=bY+Xljp0l6L+Y1+hUN3hWFShFUuv2QI+G4X/M1K7w7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfHEpL+YjgD4JlaYZJb5f4jt/47o1r17PtSfW1bxS5o0lseN4TQ4L9Ania61nt904IZdkUyruplnZO/rD/wJlFWR8kMU30YhMauIaTeDEYUlPSXxARdSGwtsP3SJB/kGQVD+luiYHXr6sWz6YUDKVrGwp06jqT9vbqTJl4ODqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eM1gWYfQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3FEC4CEE3;
	Thu,  3 Jul 2025 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557499;
	bh=bY+Xljp0l6L+Y1+hUN3hWFShFUuv2QI+G4X/M1K7w7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eM1gWYfQIkW+fVVPM2em1oRqEQ/5mkowKAFrekz9Er7UNVQHAHduRnaOvLJDG8Jrs
	 dKaYD/l77Of5i9e2mRm+KRWxxPiMfL06u7VujnWsgHELUb0yyGJLM8+IqkVaGe1scO
	 Sw34WtAk+30NA/4zVKXXwJ2cPb1+VXaL67PMYLeGBid43RU4p/RFvm5sHqFAqGjITy
	 +QQ4m9jnmjDxVTK1fSP3kBacVuTwDg2Jm0I1dzZW8Y6+yig9owsNAOFTvnataY97m7
	 c+d55bQipQdEo2ncbN3fhEhPRgCEMIkOFJxuvNWgUDQ+DqzLPWGnGiue5EqTlKVrxl
	 4d5IzBLs5iB1Q==
Date: Thu, 3 Jul 2025 10:44:58 -0500
From: Rob Herring <robh@kernel.org>
To: Meng Li <Meng.Li@windriver.com>
Cc: krzk+dt@kernel.org, linux@roeck-us.net, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev, shawnguo@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Message-ID: <20250703154458.GA1470571-robh@kernel.org>
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

On Sun, Jun 08, 2025 at 11:06:15AM +0800, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied since this hasn't been picked up by the wdog maintainers.

