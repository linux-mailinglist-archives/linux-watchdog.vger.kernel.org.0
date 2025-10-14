Return-Path: <linux-watchdog+bounces-4380-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C93BD88E3
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 11:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72E3254093D
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 09:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E212FD1BA;
	Tue, 14 Oct 2025 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jWcRx9c/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D32FCC01;
	Tue, 14 Oct 2025 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435157; cv=none; b=tClGsVKVEFlnAMXztrBTmchQpp1Hc3vy+nZWL9lWlmpUeIWEEJhGpVzADMNO1BsyRFounioIUheXAETA43qGNBkfhKqUya8NtZ0th90ng1t5l4ppkBGrMA1cxn60iVNdPitAkgnhTeBeShFlSeYLksNtTnhqX6ol1yMHniw1bek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435157; c=relaxed/simple;
	bh=D4al88LL8q+XHjrCSJII1dctsBxIMEvTBINPRZs5xRI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P6qUwuJtyg5ppl9Uisikij2pFDU0NZYZosmgCEqwDVJj1eFZj7ZLdaCd3n19G+Nx08zS+I2XK6DAHmRIwHGR+j1T/v0CE30ZFtYwpcSeBQk2wjz1YtigX5Kjy/APAzef2paP4yylDO3lXeakffdl0NKDy6JV1GJag8jdJLyclg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jWcRx9c/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F3B814E4109D;
	Tue, 14 Oct 2025 09:45:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A570F606EC;
	Tue, 14 Oct 2025 09:45:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CCA7102F228B;
	Tue, 14 Oct 2025 11:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760435146; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pS7S3KjjjVMBjFt3EILRfWOqjVjZmOnxzSm17MhSyeA=;
	b=jWcRx9c/oN7rXNJkrTS3XvTf3Yj7U2V6UQucGtHJWdNsTKRX0GujBStzYYNWHLLgkPLBml
	DpWDxhT2pQvP+xFAeGKA8AEk5nCOzZvfmDpQfM7A5YWcNlt3x5Uc3zwWMYXRnlZzH2YK8T
	0o62way7LOZThsMmD0pImhigEEsU9YQPHTJrSqIVZ8LcjbpFQnphIrVXZhziOPnJU/spfg
	t12gFk4qj49MP4fZBjgrfiobz2I1Aas/FNllUoMGPzGeEVFT+lKep+2ktWPnuYvWY6I3io
	86UEB0vJLmmvUiaERj+HJ8gQF3Z0aObmxF4cTP2RiKOaIIorO1zCL4yTf/HeVg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: Convert marvell,orion-wdt to DT
 schema
In-Reply-To: <20251013213146.695195-1-robh@kernel.org>
References: <20251013213146.695195-1-robh@kernel.org>
Date: Tue, 14 Oct 2025 11:45:39 +0200
Message-ID: <87o6q9g6kc.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Rob,

Thank you for your work. I have one question:

> +  reg:
> +    minItems: 2

Should we also include this constraint here?

    maxItems: 3

This would further restrict the binding.

Gregory

> +    items:
> +      - description: Timer control register address.
> +      - description: RSTOUT enable register address.
> +      - description: Shared mask/unmask RSTOUT register address.
> +

[...]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - marvell,armada-375-wdt
> +              - marvell,armada-380-wdt
> +    then:
> +      properties:
> +        reg:
> +          minItems: 3
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 2
> +

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

