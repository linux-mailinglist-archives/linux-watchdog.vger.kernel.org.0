Return-Path: <linux-watchdog+bounces-2190-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C869999F2A
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 10:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 458301F2264F
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 08:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F3420B20E;
	Fri, 11 Oct 2024 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="obWaGTzm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA520A5D1;
	Fri, 11 Oct 2024 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728635959; cv=none; b=U6Tch+K1lC6mHu46V7Upwlhh58il6/J7GneDZlQ5CrrsnL9JE8Q25x35TjigL4srIx7OJb0Y8vPq+8IiJV04h862IOAw2835gpeTpn6FzCXmv2Gso2m84hWVRZOyJbGxgurEO5wSuJtnfD7u47QLD2bf2lyRT6tcudBTQwMtPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728635959; c=relaxed/simple;
	bh=KRGFx9KkVHVxlEh9kS8WiaDdvD5XL7fP62L9ma6Ks/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FyGq2UrwptoZudtfn9TsSopZmOXoMZV8p3d+iLnsJqRm585aXx2tWwK5qZSyMkDl85iBRZB6160CZt33YlXe+OwC70WTpIsIJO77Q+/fi8U7Th72aZqcxSsliSqQ1a0NDInG8cLfIT2zQfcdKO0Hsr/Yt6IuqmWFoqktGnVGc4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=obWaGTzm; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sJfEiOpKXJgNS1LtGX6COaLi/A3lHdF4NYThJU9ou6U=; b=obWaGTzm7MJwN5xL9aRROWLlJN
	RdOt5UCMTloG2yp0uZdIeRGaFyeXUXnlwnuVWiaulnQ+RO9aK5tJyhWM9WJIVxkOe14NVyO2TPZhK
	/vNDGnfPXvBbu9YD/tTcGuB0xtQBDnSEf4jLMXv9/Wvg/Gz3JFzehvCz6euq3Rum5/lrS+Eaukd4Q
	jU5g61YsxuVWIyOruD8w4juCC/uNLw4cqxY5IfdffQeRXjWDLdxD5KQxzvTqgjO37tg/VpU8jlamx
	tUWewMjVO9gO2GcvpjH2GIq1tUi5yTgNVwCt+U+GZ///nAaWGPiYF9tZb5zpxB+zmHw5q7X5eJoxj
	A+HbIKAw==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1szBAp-0005Dg-Jo; Fri, 11 Oct 2024 10:38:59 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject:
 Re: [PATCH 1/1] dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt
 string
Date: Fri, 11 Oct 2024 10:38:58 +0200
Message-ID: <2414676.NG923GbCHz@diego>
In-Reply-To: <40083f48-5e8a-4483-9858-8907c6a4643b@roeck-us.net>
References:
 <20241010061408.1351865-1-karthikeyan@linumiz.com>
 <20241010061408.1351865-2-karthikeyan@linumiz.com>
 <40083f48-5e8a-4483-9858-8907c6a4643b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Guenter,

Am Donnerstag, 10. Oktober 2024, 16:14:48 CEST schrieb Guenter Roeck:
> On 10/9/24 23:14, Karthikeyan Krishnasamy wrote:
> > Add rockchip,rv1126-wdt compatible string.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I'll go the same route as before and apply this patch with the rest
of the rv1126 changes.


Heiko

> > ---
> >   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > index b5a3dc377070..1efefd741c06 100644
> > --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > @@ -32,6 +32,7 @@ properties:
> >                 - rockchip,rk3576-wdt
> >                 - rockchip,rk3588-wdt
> >                 - rockchip,rv1108-wdt
> > +              - rockchip,rv1126-wdt
> >             - const: snps,dw-wdt
> >   
> >     reg:
> 
> 





