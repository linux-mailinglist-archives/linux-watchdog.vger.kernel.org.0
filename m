Return-Path: <linux-watchdog+bounces-3953-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DDB19681
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Aug 2025 23:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2936A173E35
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Aug 2025 21:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8059D1F91D6;
	Sun,  3 Aug 2025 21:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZshmQ7Tb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB211F03D5
	for <linux-watchdog@vger.kernel.org>; Sun,  3 Aug 2025 21:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754257088; cv=none; b=u1vCMzPEOAAmRxz4C6xE1YfTX09fIqpQtWZqGjAENrOsS0VwMvhj4cjCIYl6H3s86DYjvkhWqviy/IigpXqi6uHjdRoSTM2FpSxZ5zaK1B2GzPMiNLPj5ezfXqbvHEIqad/OqfHYVDwimfsX1CZds1fM52ZPf6ly9OxwoLvuxA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754257088; c=relaxed/simple;
	bh=XSDS/9BqdRMEwCsinuKIdz40DMcN3vEIIctDhzEvlI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwttcwyccXXfVjLZa3n7msFCZ169YSh4YbO3ZdvW1TIkfvzFXS2SHGvxz98C7aJhBCuzmL0jsL0qxAxBEW+WnywhQrF5AxUVfpehkobXh/Oi1fprBBpXGitwXcVoVMe2YaliJGlxshKCcUfZKJyXqrU2PWL3eJ+eJvyuE4pYNZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZshmQ7Tb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Fo31
	UkSAu0+WZ+F1E+aYpxfDEV9HXk95ngqe4QCgirU=; b=ZshmQ7TbnRjGZcamObcZ
	Myki+pOxoNtrE5ggjQKw8CFABUrykbNBy3rIlB9WxI9iC81WRCP+lzZmNZzct7Wz
	gylDDhpz1AMUsgPlQzRieFKPd1t3ocjGDGLkvCceQhZQ2KHJte7zcYcJ87PeNbje
	BpeUigjLO2v8uGd3tpZBrFbXtSzB2zzq6Zc3W6oDLQyTTygbvfaeKv0f5EbKuuSD
	srxy/e7ENk8LC+qUTAa5gEEto0gklawu1HqL+4LuJUH1reYi5EDmrzGM6mGCoHpr
	NGuuFQs5Efo9kSRjCcNjEKkYMzpZgItyny1sJqy2NRtlQyKV/Y/47FlXAVQHEJ2v
	qg==
Received: (qmail 1660118 invoked from network); 3 Aug 2025 23:38:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 23:38:02 +0200
X-UD-Smtp-Session: l3s3148p1@HFA0znw7Fo4ujntd
Date: Sun, 3 Aug 2025 23:38:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 8/9] watchdog: rzv2h: Add support for RZ/T2H
Message-ID: <aI_Wua2TPftUAkwZ@shikoro>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729155915.67758-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Jul 29, 2025 at 04:59:14PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the RZ/T2H watchdog timer. The RZ/T2H requires control of
> the watchdog counter using the WDT Debug Control Register (WDTDCR), which
> allows explicitly stopping and starting the counter. This behavior differs
> from RZ/V2H, which doesn't use WDTDCR, so the driver is extended to handle
> this requirement.
> 
> To support this, a new `wdtdcr` flag is introduced in the `rzv2h_of_data`
> structure. When set, the driver maps the WDTDCR register and uses it to
> control the watchdog counter in the start, stop, and restart callbacks.
> Additionally, the clock divisor and count source for RZ/T2H are defined
> to match its hardware configuration.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Well, this new DCR register is really strange, especially its location
in a seperate resource. But given that, your code handling it looks
okay to me, so:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


