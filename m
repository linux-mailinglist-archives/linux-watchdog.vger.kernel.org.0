Return-Path: <linux-watchdog+bounces-2613-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44E9FC71B
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Dec 2024 02:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5B7C1627EE
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Dec 2024 01:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9602F5B;
	Thu, 26 Dec 2024 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="IoR+Tcqx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ACA360;
	Thu, 26 Dec 2024 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735175000; cv=none; b=Zxq9f3Xne0gs0NOb8pXCdqUrGhrWVC0QlzHZofH3kMMzCeKXlobftD+7wd3Daje1cu6B1ZDcGbpdV5CuS4sGQG4uAX0hcrkVS/b4znvOmNZZFqQAJnFdqrteNpVQwGxHoioj7zbB8tYMhGuxTjoRVjnsJPiofq/tbMVs8bTcQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735175000; c=relaxed/simple;
	bh=rtoqKRTfHaoNS6YgTr2nk/bj2YeOwT2zGCn/O6aMoew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5AD3XCaWEJG7L0GM/GwSGb3JO1nQ7no3sU6Rj8a6SSSsmhsRx2IP+SurLig8btIHLTi/eLTQqhW8tFfc19/VAkXpORVVVEekOVfEe2YPPFG4MnH+2iG142VTVbClStWayJcsx+J78Jy1BlrzXFpusyF7Q+rXu7r4uULdktt4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=IoR+Tcqx; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a9DvvcmdMH61kkLHxzFUShztWsIEkMZxvricpdQz3GY=; b=IoR+Tcqxw9/+6A4l8tmK5M4Jqf
	cjqol8KrFlbDWeRcIo3XH/WeuhL9z++mE9KxdI6vcnFe6R/zZaONuk/HIZukieUuVln6WRUdRsxMZ
	yZQTU7oXswPfaLrmXcSQcdPRelYi3sRvkQDSDeeXFF3jlEO/3J4KOPY8gFNGFed+l+vMB5nQhynmu
	CoFQNyWfx2eWBBID6Q8IDTU2jfXyv68w7XnyDugulxl+pEkwu2qizofhtNH8oqjDCshas7h/nvNp/
	qHftOfQ/zORLHBqQvXOP2YkVFrutLF9X2AO6fIUSp3r4ZKDfC4roSvGFMr8J+uehw9GGPvFYpP2pu
	shmI+ZCA==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQcHP-0004q8-O0; Thu, 26 Dec 2024 02:03:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 07/17] dt-bindings: watchdog: Add rk3562 compatible
Date: Thu, 26 Dec 2024 02:03:10 +0100
Message-ID: <22732670.EfDdHjke4D@phil>
In-Reply-To: <20241224094920.3821861-8-kever.yang@rock-chips.com>
References:
 <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-8-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 24. Dezember 2024, 10:49:10 CET schrieb Kever Yang:
> Add rockchip,rk3562-wdt for rk3562.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 1efefd741c06..ef088e0f6917 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -28,6 +28,7 @@ properties:
>                - rockchip,rk3328-wdt
>                - rockchip,rk3368-wdt
>                - rockchip,rk3399-wdt
> +              - rockchip,rk3562-wdt
>                - rockchip,rk3568-wdt
>                - rockchip,rk3576-wdt
>                - rockchip,rk3588-wdt
> 





