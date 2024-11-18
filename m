Return-Path: <linux-watchdog+bounces-2451-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8F9D1B79
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2024 00:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA8A7B22E23
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2024 23:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C7F194120;
	Mon, 18 Nov 2024 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="AWsAMyOL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABED153BE4;
	Mon, 18 Nov 2024 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970848; cv=none; b=BagUqYxtbFRYThQDiB5C5TG//vOKCSBgs4ggwBT1Za69DFJW1pNQq0awDi1cyZnEe7dvoALA2dJ5EZAaBYGxS60ZaGh8j+mArpq71UKC+YHuE5EVgpxVCJkiGBM0ZG9znhJY0N+UpwzxbAmXetsFf3lmJTiTOOn7yx5hmkMzHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970848; c=relaxed/simple;
	bh=CW49FFGZM5+j6JkPSwK06UkPkZUwSK4a4tgqhadqsvo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DCfXaeem67zwdY0rmTX1oLIJuX0Eh47kqAnR38JGpJHjJ0uKJS5ZqO4FLowBKxFrrkOC5y8viZquIv0DUolIMqm+vpSrc+ZAOCa1tPhrjsr/rbpGPKnjxGb8TODQ9tMY2nMd+sLEh3PonkbyyHTwk+BY2AxzUueKFNxL4kdWsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=AWsAMyOL; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731970843;
	bh=CW49FFGZM5+j6JkPSwK06UkPkZUwSK4a4tgqhadqsvo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AWsAMyOL4ww5MLzWMdBiuoq16eacUcwGCB4EJfGlASqLw5onf1XZWjU+TSR+5r65A
	 L21wiDtUH0+4JAPb9Q7n2JyMCIz/hFjXmJkP2nhGzaWdWwpCL7TUcfgxsw3N+EDEO7
	 wJIsEoTTuEGXwN4pYPNvAyjvC2UKkBGNqwZFLO53LPHr5XMQLjleBX/07sokLdZ9+L
	 f/NBKIGuudfF7EBws2c1vynq3F+R+dZwuxa8LUTeqtp9B+CtOPXqotfB93PYj/Ffwz
	 37upcwgVHFz+BNypFFIVp1Tcg99Nlbo/6EyDwcZ9R4jLOrZ1DvL6724bflFzplUFf9
	 P8B4cBUlUquRw==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3AC8F68D9B;
	Tue, 19 Nov 2024 07:00:40 +0800 (AWST)
Message-ID: <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>, Patrick Williams <patrick@stwcx.xyz>, 
	"wim@linux-watchdog.org"
	 <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
 <linux-watchdog@vger.kernel.org>, "Peter.Yin@quantatw.com"
 <Peter.Yin@quantatw.com>, "Patrick_NC_Lin@wiwynn.com"
 <Patrick_NC_Lin@wiwynn.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
  "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, BMC-SW
 <BMC-SW@aspeedtech.com>,  "chnguyen@amperecomputing.com"
 <chnguyen@amperecomputing.com>
Date: Tue, 19 Nov 2024 09:30:39 +1030
In-Reply-To: <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
	 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
	 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
	 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
	 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-11-18 at 12:50 -0800, Guenter Roeck wrote:
> On 11/18/24 04:46, Chin-Ting Kuo wrote:
> > Hi Guenter,
> >=20
> > Thanks for the reply.
> >=20
> > > -----Original Message-----
> > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
> > > Roeck
> > > Sent: Friday, November 8, 2024 10:08 PM
> > > Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus
> > > handling
> > >=20
> > > On 11/7/24 21:42, Chin-Ting Kuo wrote:
> > >=20
> > > > But now, I think it will be better to add a patch for creating
> > > > a new
> > > > reset reason, e.g., WDIOF_REBOOT or WDIOF_RESTART, in
> > > > watchdog.h of
> > > > uapi. Can I include this change, creating a new reset reason,
> > > > in this
> > > > patch series? Or, should I create an extra new patch series for
> > > > this
> > > > purpose?
> > > >=20
> > >=20
> > > This is a UAPI change. That is a major change. It needs to be
> > > discussed
> > > separately, on its own, and can not be sneaked in like this.
> > >=20
> >=20
> > Agree. However, how to trigger this discussion? Can I just send a
> > new
> > patch separately with only this UAPI modification? This is the
> > first time
> > I change such common source code.
> >=20
>=20
> Yes. That needs to include arguments explaining why this specific new
> flag
> even adds value. I for my part don't immediately see that value.

So maybe I was derailed with my WDIOF_REBOOT suggestion by the proposal
to repurpose WDIOF_EXTERN1 to indicate a regular reboot. I still don't
think repurposing WDIOF_EXTERN1 is the right direction. But, perhaps
the thing to do for a regular reboot is to not set any reason flags at
all? It just depends on whether we're wanting to separate a cold boot
from a reboot (as they _may_ behave differently on Aspeed hardware), as
on a cold boot we wouldn't set any reason flags either.

Andrew

