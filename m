Return-Path: <linux-watchdog+bounces-2169-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FAF998891
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 16:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE0072884A7
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF001C9EA4;
	Thu, 10 Oct 2024 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DwH6SBFW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42121BDA90;
	Thu, 10 Oct 2024 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568857; cv=none; b=BuDDzAHqNBchWjbCRhMt/kYfCZprozK/lJT6+qhOVmotFD0WozI6QExYEfQG6NsExmg3P9JQTewda0FlbdK3Q3xcanJ3KsfZNLH78mnuWSBgVp7k3LMzY+weyNTPoNDv6tS7cbPYIOGfPH9bfWb89H2dUv0bBWEIF3O2zWWwB8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568857; c=relaxed/simple;
	bh=inVUxz74LeTafvVpc7yyQ+a9E48+irURsnVSweAxxHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCfXvwxJz2PwHiZ6M9rkevsvwsa6AyNXpFPnLPKB/ZzbYz6HjESyDLrVuUysqOtsAY1NmK4h8F0VR+EcLpftk4d4n+j6ksh7+PNGzTeLYRpClqCKAcXweFu+LhNM6hEoRNhneqL/qHnYCdlX+Mmk5SITj2dZMBLx7bwKUAU34tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DwH6SBFW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3gu4vrCoGcCYQlq4BWraLzQK3LX4/Mgovi2zoTV8H2c=; b=DwH6SBFWkXWr1pA1j4nl2qX+07
	9KWUyDZShKUQrXGcz+kFxYy1L9Jx53wD2pnrbVTZjrBE8nhAHxuORb8icMC65IJMmz3PVx6ptx7k2
	mJI9JIPUHU5ZIKwqp42hlhEyWcTzjs8tUkqP9mqJngkqQNuE8GAp+vc8HcP93upaHFjymAE5JzG2o
	mJYtgxgn9/fReIKvU6sPml4i0RkqLYOWg/mBEJc6yLL8NJK6ZASK2O5PAyZBjVET2KfAxotVSLl8h
	F+/BRjELvdCOpY39psidABgksphijxx6lU70yvxqumRrsTCxc/02Vfg0yRMJ6rqVTuvMQnHa78H6v
	XThENvLg==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sytib-0005bC-J8; Thu, 10 Oct 2024 16:00:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject:
 Re: [PATCH 1/1] dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt
 string
Date: Thu, 10 Oct 2024 16:00:40 +0200
Message-ID: <3657223.R56niFO833@diego>
In-Reply-To: <20241010061408.1351865-2-karthikeyan@linumiz.com>
References:
 <20241010061408.1351865-1-karthikeyan@linumiz.com>
 <20241010061408.1351865-2-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 10. Oktober 2024, 08:14:08 CEST schrieb Karthikeyan Krishnasamy:
> Add rockchip,rv1126-wdt compatible string.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index b5a3dc377070..1efefd741c06 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -32,6 +32,7 @@ properties:
>                - rockchip,rk3576-wdt
>                - rockchip,rk3588-wdt
>                - rockchip,rv1108-wdt
> +              - rockchip,rv1126-wdt
>            - const: snps,dw-wdt
>  
>    reg:
> 





