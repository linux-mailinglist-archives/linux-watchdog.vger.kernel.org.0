Return-Path: <linux-watchdog+bounces-4389-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6DBDB3FF
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 22:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FCA13B2A59
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 20:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E38306B0C;
	Tue, 14 Oct 2025 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="ZDVBrkK7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6C3064A7
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760473800; cv=none; b=jdvDCjHrA4Enns5KoXa2AsdKvy+w9dy4m8tRuL3f6QrxlWJY1qGXJGQ3q2cMULnztJ6dk1/mH3xKo/kNoAPQHg/2tReYcmYLbYJbWAnSu93e98Ha68uXr3fdjnQInlBF20uKa/LCPzjaBHz0l0gzvXdldQYI6OgKQ+v4F8wpIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760473800; c=relaxed/simple;
	bh=SDNMpw+G6luDwZ4VeuJIUHessl56PUjKBDZIm4bRxWw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FdCAOJxBlYhTW8Xrexn9qNKGdmseTK86G4ax1Z505PXEqphsSJSvPZ27vAJRNmXtoceX2tOraAjRPcyRfLbVfuKguGO7lOV6O+SZgWt7sOrMsXHOSIdC3kScjJAQt1S4HmIcjjceOvZgwvvHRtUNLc+7pYUcyF/QNO9G/jbOTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=ZDVBrkK7; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 23A73683D57;
	Tue, 14 Oct 2025 22:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1760473329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctw2CxByGid2ikrYl8IMXBgvdU8bGZecOqg+lDJHYpo=;
	b=ZDVBrkK7dySQcOnAARIvNN+wNs6Q9JFXaOYsbgv+ID7uCb7clt0KC9Wgy4TFowk3DujRt3
	fTkb07SaJpCAEuRF3ZmQcKzK3V2u7aQp4VScBnaHnXY9wi8r+YG3vxwHyOCaV7GwrJnL9t
	HH42no9iClSjp5IJh/tbfpREFUzOqGp2agNInpRJRXNGUJ3zKZK+tuphIA29BDgwfSC+U+
	QWtR2WcyVpbHFsxuizxJvRCP65PvaG+ZZiGzSoMy0s1WnV8fYSm8spLdYui2pY3/tkGT7v
	PNupTS21ZF9MHpozVgkYSz6DzpJOnD0lzaCiZfjFJcItuat5WKdYRPVa5OUNew==
Message-ID: <ea8a57e4464f832d4cce1101d763b56674a1bf6d.camel@svanheule.net>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert marvell,orion-wdt to DT
 schema
From: Sander Vanheule <sander@svanheule.net>
To: "Rob Herring (Arm)" <robh@kernel.org>, Wim Van Sebroeck	
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>,  Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 14 Oct 2025 22:22:08 +0200
In-Reply-To: <20251013213146.695195-1-robh@kernel.org>
References: <20251013213146.695195-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

On Mon, 2025-10-13 at 16:31 -0500, Rob Herring (Arm) wrote:
> -Clocks required for compatibles =3D "marvell,orion-wdt",
> -				=C2=A0 "marvell,armada-370-wdt":
> -- clocks : Must contain a single entry describing the clock input
> -
> -Clocks required for compatibles =3D "marvell,armada-xp-wdt"
> -				=C2=A0 "marvell,armada-375-wdt"
> -				=C2=A0 "marvell,armada-380-wdt":
> -- clocks : Must contain an entry for each entry in clock-names.
> -- clock-names : Must include the following entries:
> -=C2=A0 "nbclk" (L2/coherency fabric clock),
> -=C2=A0 "fixed" (Reference 25 MHz fixed-clock).

> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 minItems: 1
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Reference 25 MHz fixed-clo=
ck supply.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: L2/coherency fabric clock =
input ("nbclk").
> +
> +=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0 minItems: 1
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: nbclk
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: fixed

Shouldn't the "clock-names" items be in the same order as the "clocks" item=
s?
(With nbclk first)

Best,
Sander

