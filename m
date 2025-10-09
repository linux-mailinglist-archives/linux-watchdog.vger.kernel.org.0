Return-Path: <linux-watchdog+bounces-4370-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7684BCABDB
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 22:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10C8B3BC170
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 20:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C237125D1E9;
	Thu,  9 Oct 2025 20:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYdVk91l"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933D52475C8;
	Thu,  9 Oct 2025 20:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760040056; cv=none; b=mB7Ri2TO+FCbtA1YY7hNcvtIahkgpoiE/513BeaPVMS2OaFsAFWUjysbH/cvkh0mWMqQJVzqBnwoccXDz31ckF4CQUmMsCAwYf8+coGS8p4s7lCMBEmpvs10HBBd3dEsd4AS8goLV5BOZB+ZznCR08BsoyWj/DxTv23uU1BQllI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760040056; c=relaxed/simple;
	bh=E/XuTfDMqDxIylA8lkbRA66SI99SurnbJ5bNXOHutYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCk5CTHTnU+BhBh52Wu50nbzaL3gCR3Ja00dFxBdk+6mIRUKNbyOa3kj7LfIcI1pfXD9x59vHFW6QJpkTEBetdtZvcsQyFWeQiAVZGqRKRQvzpDw3ZCTW5Fcnqk8AeuECNJwzGULwjdEzCVhUHykoy0GkwAeK+emVhmnmbN+GYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYdVk91l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47B0C4CEE7;
	Thu,  9 Oct 2025 20:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760040056;
	bh=E/XuTfDMqDxIylA8lkbRA66SI99SurnbJ5bNXOHutYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYdVk91lsmhuDd0uIHEWxCumIJuGANSnrn9lhViNYVXdLrv1L5y45/rHQPGmyY47a
	 2gogPTP04ewnTjqd2ngEYmxjCr2WZHSIUpzvpAR4oIFLmwNobdMqJsRRgfrgfywi5G
	 ihGv6Jl9lSib7LmmhPD6dbM66KoY4BTxwsvMnaNP/tR53HkJGGOJT9qTH4YcVm1hYC
	 IxrvGVrxittGYRT/7oAtoNf1lF7zSeNdUd6UujSSat8i7ZLT1x5hDkR8B9S/Vk5RHh
	 XUlRB+Nec6wXDOG3ZtKAORAe/BKp+dDioy55nRakHMJ+VfUy8v1IfXgLC/a/4M0Nrq
	 +rgmK2/CnyFgw==
Date: Thu, 9 Oct 2025 15:00:54 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: wsa+renesas <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P)
 watchdog
Message-ID: <20251009200054.GA3245555-robh@kernel.org>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro>
 <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aONh89-5-llFZWue@shikoro>
 <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>

On Mon, Oct 06, 2025 at 11:25:11AM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Mon, 6 Oct 2025 at 08:30, wsa+renesas
> <wsa+renesas@sang-engineering.com> wrote:
> > > > > > +      - enum:
> > > > > > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > > > > > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > > > > > +
> > > > > > +      - items:
> > > > > > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > > > > > +          - const: renesas,r9a09g077-wdt # RZ/T2H
> > >
> > > I guess a comment like # fallback RZ/T2H here will avoid confusion.
> >
> > Hmmm, if we add such a comment for every fallback, this will be quite
> > some churn, I would think. My favourite solution would be to swap the
> > 'items' entry with the 'enum'. So, everything with a fallback comes
> > first, and the 'plain' entries last. But what do others think?

That's probably what I'd pick, but I try not to define rules we can't 
check with tools. Otherwise, I get tired of having to review that rule. 

And adding a rule to tools has the cost of fixing the existing cases 
everywhere.

> We do have "fallback" comments in other places, and I think they do
> help in understanding compatible naming schemes.
> 
> Would it be possible to handle this in dt-schema?
> Currently we have to write:
> 
>       - const: vendor,soc1-ip
> 
>       - items:
>           - enum:
>               - vendor,soc2-ip
>               - vendor,soc3-ip
>           - const: vendor,soc1-ip       # fallback
> 
> If dt-schema would automatically drop duplicates of the fallback,
> we could just write:
> 
>       - items:
>           - enum:
>               - vendor,soc1-ip
>               - vendor,soc2-ip
>               - vendor,soc3-ip
>           - const: vendor,soc1-ip       # fallback
> 
> What do you think?

It would almost work with just 'minItems: 1' added. That's because we 
require strings to be unique entries, so soc1 twice will be rejected. 
But then that allows for no fallback with soc2 and soc3.

So I don't see a way to do this other than transforming the above back 
into what we have today under a oneOf. That's a bit more deviation from 
json-schema than I'm comfortable with. Mostly the tools just add 
properties (like 'additionalItems: false' here) where the default is not 
what we want.

Rob

