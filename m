Return-Path: <linux-watchdog+bounces-2821-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F8A251D0
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Feb 2025 05:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 344AB1636CB
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Feb 2025 04:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C911CAA4;
	Mon,  3 Feb 2025 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="WqdTiAAe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9E25A62B;
	Mon,  3 Feb 2025 04:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738555560; cv=none; b=t1loEZ4GzwXAvfYem/icndB+zqx2qNoVVYbj8l30SZ0PCXwoRvjIs+W2TBBQozG2YMUIC0ng8sas7dJ1/MdAStajZIy+S+kOD+AweD5at1RQQp/cRvlb9pXuGNkk3rRX+CBy+ckv4eL0TULznnwVdJSbKsawsrhs9X0mrwCkDnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738555560; c=relaxed/simple;
	bh=EfiRw7gB8e/5MLrWL0BiJdfLFcVW2LHs3Jq0FFdnVo0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SrSPIjdsmzK1toqewb0nk3RFqp5XYrxVDmX+xIwx5Ib4eBrkui9mrR4t4qpYuLGJaBIijgtwzP21q+sHNxiPi20exwcEqLa3q9xZuJrHjCgC+z3ZZXgCuP/+r1b3NzE073vjOriehGFjcinaamM5SLP7BahItRlshOQbZIWsOT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=WqdTiAAe; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738555556;
	bh=EfiRw7gB8e/5MLrWL0BiJdfLFcVW2LHs3Jq0FFdnVo0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WqdTiAAetAQKzDnEKAxG/R3ri9ZP0gG2mu2AqTf9zfCQLmvqRHEeqcjlFbxI8q6Vy
	 YF5PJSeqgtcjFe1LFbJC7ga2/nTFHbxtubP0f891BE/g+tFzX+zAEmsWPgNql1/yKH
	 uHiZzlkHo2WpAr8ze2u9IRE5+90PhFevbqvS2n05CB4w7oDoh04u/2/NzwBDNdx5IU
	 YFqjgAhGJsfgGdg4jsPZzQSN5fuH55Opp9YUfK3r9NjHNEIBHIchSz5Z/eKcreUbdu
	 u76oHkujWbGyHwDUgfpE207FzjXJlYYVk9mp1TR4ZW1v5gqJmFWdMqaVj5IAEVElvk
	 /VSJ7VAFCHPzQ==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BD4E773C54;
	Mon,  3 Feb 2025 12:05:51 +0800 (AWST)
Message-ID: <f01ea3f0184cb598cdfcc22d304ea31ef5b7dbbc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 1/1] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz, 
	linux@roeck-us.net, wim@linux-watchdog.org, joel@jms.id.au, 
	linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com,
 BMC-SW@aspeedtech.com,  chnguyen@amperecomputing.com,
 aaron_lee@aspeedtech.com
Date: Mon, 03 Feb 2025 14:35:50 +1030
In-Reply-To: <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>
References: <20250113093737.845097-1-chin-ting_kuo@aspeedtech.com>
	 <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-01-13 at 17:37 +0800, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> The bootstatus can be,
> WDIOF_CARDRESET =3D> System is reset due to WDT timeout occurs.
> Others=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> Other r=
eset events, e.g., power on reset.
>=20
> On ASPEED platforms, boot status is recorded in the SCU registers.
> - AST2400: Only a bit is used to represent system reset triggered by
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 any WDT cont=
roller.
> - AST2500/AST2600: System reset triggered by different WDT
> controllers
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can be distinguished by different SCU =
bits.
>=20
> Besides, on AST2400 and AST2500, since alternating boot event is
> also triggered by using WDT timeout mechanism, it is classified
> as WDIOF_CARDRESET.
>=20
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

