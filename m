Return-Path: <linux-watchdog+bounces-3639-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458AACF58F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Jun 2025 19:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4E13AD15F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Jun 2025 17:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D044F2750F0;
	Thu,  5 Jun 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exT4mXlp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FC318C06;
	Thu,  5 Jun 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145241; cv=none; b=KIzI1IxZ12wq5cfpwsx0o4F0tsOY6oHh5ZFkRWNlbeO4AOqdFdCFXvNYKjje8w8RtdZTZZg2ZIPgWOvrTxEMNA53pshA48DELOwn6EjCz4p9kuqbh9Jw2hFDckKa6WCcU8N1KTTpd/8+e8DWy12hkGW1AXT74sBdpXfJDbkZRbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145241; c=relaxed/simple;
	bh=dEVPAHAs6GM46/4q8XuV29zFZGVWXGkMMYOk3Wo8Z9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuwG2WkyUpWiyY3R92UCuKK5LlfQ+z5zz6Ky+BPD+UacMIAyE1PlZcrhpKL+2VM96a28I05AYS75jj/yqZi41d3gUw0elSyzUJsf29zamHggUMEUa2B02f80bLN0UBOCCOcbLtyouWaVpI0vD2/gvu0GrARGwalEJHoelZn9qQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exT4mXlp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D971CC4CEE7;
	Thu,  5 Jun 2025 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749145241;
	bh=dEVPAHAs6GM46/4q8XuV29zFZGVWXGkMMYOk3Wo8Z9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exT4mXlpk1yVcJjGb6Npz3esjShXs3wJ6X82IbN5IwLhtb9p0A419mEWFimR/v39u
	 rFqm50o/z5Nnda/udtm0/EI0/SSBKw+qYws9UlT1Bs18BJdZW8ISJisB+UDx2ryTLD
	 X6ilWCN0sTtijfhB+mZns6o4vtmvBpT6bCeysaloloj2BPPfBXDM6mH7je4B0vf131
	 tyKcS+bPY0aBf6x6n69HVko8vIlifIMoI2+8G0drj2awLoa+oWl7aOat1MbvLPCOoR
	 f7LPRI+Lh2x7S74WB8eTTYBm/MYB/yT1wgDfL8Ate1SJi9BMHRUze37n78ph3IgiIk
	 Zuh5NzvI8evKQ==
Date: Thu, 5 Jun 2025 12:40:38 -0500
From: Rob Herring <robh@kernel.org>
To: Meng Li <Meng.Li@windriver.com>
Cc: linux@roeck-us.net, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
	shawnguo@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Message-ID: <20250605174038.GA2911346-robh@kernel.org>
References: <20250604034246.3234837-1-Meng.Li@windriver.com>
 <20250604034246.3234837-2-Meng.Li@windriver.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604034246.3234837-2-Meng.Li@windriver.com>

On Wed, Jun 04, 2025 at 11:42:45AM +0800, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)

You missed Cc'ing the watchdog maintainer if you want this applied.

Acked-by: Rob Herring (Arm) <robh@kernel.org>

