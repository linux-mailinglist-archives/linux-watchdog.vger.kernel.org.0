Return-Path: <linux-watchdog+bounces-2965-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FABA3AED8
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 02:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B5711706E7
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 01:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB7576025;
	Wed, 19 Feb 2025 01:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="avb2FyYT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7957A920;
	Wed, 19 Feb 2025 01:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739928326; cv=none; b=BLirSqfFrWOWhaFnQ6lVJjguuLYVuB5KPQKJkwdWI4jtlPzyPOAItRFFjtC++xN2+hPQC4RQx3DiDgdUfnGrNsw0OkAIQJ9izsGGtkDt3202tcLibbhRW6qjiSpKueHALeH9044pD/s8zK1iiZKDwcf69sh5wSzw873x3iWNa6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739928326; c=relaxed/simple;
	bh=dkFhdB0sw0/QyG+CwpMOC58rxh7WXIHCwBFRv+IGTiY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fzzvN56yX6zH+1pxlyAUQw/w7rplvCD0vl9/xKPutW5noBWLLYm9Qn3dnQraZ/jDgK/CuVT6g3XvHX66gVTH3lK9qGKfwvHUAslPWy1ElTL+1jR/aSAzq4DJBJ9zTP5FZqhREaI/VDQZiGfPxsBEunYEO2dNl9ISH3xcF14O/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=avb2FyYT; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739928321;
	bh=dkFhdB0sw0/QyG+CwpMOC58rxh7WXIHCwBFRv+IGTiY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=avb2FyYTTBY0LlkaOkCWpVHdubriDy15YcVmzOXNlQiNvvVH4Edal4xm7c3TFeLde
	 caVsMWd0Y6xZbmPtPyQAIMN6ycCu92Xcth4M+4NFXk+EsV9VN7YJVYQkUqQkgmQhRU
	 Y0vm11gVt7B7X5KmbiK3eTG3nOGez8xNILAhcwg6LdXRToDky4FlSSQUbU43PPpRV/
	 r4cn6rq8yEU/tQoV1drbOEanUU0THtZFkx/WHZVt8C7ky5Ezx3LKZ6QFXm5lw3zPXu
	 rsC9l5oM5TKZMmRfK5nWOi1FzlwDH19cuBy955S20HlvKh9uAgIoPNCabIJZvGL1uE
	 r+E+cydkmu7KA==
Received: from [192.168.68.112] (203-173-1-6.dyn.iinet.net.au [203.173.1.6])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 41B3476191;
	Wed, 19 Feb 2025 09:25:19 +0800 (AWST)
Message-ID: <201b57c00043e2c3590c77a4d1aba413aa576b01.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Heyi Guo
 <guoheyi@linux.alibaba.com>,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley
 <joel@jms.id.au>,  Eddie James <eajames@linux.ibm.com>
Date: Wed, 19 Feb 2025 11:55:19 +1030
In-Reply-To: <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
	 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-17 at 21:33 -0800, Guenter Roeck wrote:
> On 2/17/25 19:16, Heyi Guo wrote:
> > Aspeed watchdog uses counting down logic, so the value set to register
> > should be the value of subtracting pretimeout from total timeout.
> >=20
> > Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
> >=20
> > Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> >=20
> > Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> > Cc: Eddie James <eajames@linux.ibm.com>
> > ---
> > =C2=A0 drivers/watchdog/aspeed_wdt.c | 7 +++++++
> > =C2=A0 1 file changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wd=
t.c
> > index b4773a6aaf8c..520d8aba12a5 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchd=
og_device *wdd,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 actual =3D pretimeo=
ut * WDT_RATE_1MHZ;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 s =3D wdt->cfg->irq=
_shift;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 m =3D wdt->cfg->irq=
_mask;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 reload =3D readl(wdt->ba=
se + WDT_RELOAD_VALUE);
> > +
>=20
> It is unusual to use a register value here and not the configured timeout
> value. I would have assumed that pretimeout is compared against wdt->timo=
ut,
> not against the register value, and that the multiplication with WDT_RATE=
_1MHZ
> is done after validation. This needs an explanation.

+1

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (actual >=3D reload)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > +
>=20
> On top of that, you'll also need to explain why watchdog_pretimeout_inval=
id()
> and with it the validation in watchdog_set_pretimeout() does not work for=
 this
> watchdog and why this extra validation is necessary.

+1 as well.

Further, the logic looks broken regardless for the AST2400 where
there's no pretimeout support. aspeed_wdt_set_pretimeout() should error
out if wdt->cfg->irq_mask is 0.

Andrew


