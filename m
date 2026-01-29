Return-Path: <linux-watchdog+bounces-4857-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMCwNdGce2nOGAIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4857-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 18:45:53 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B44BCB32D6
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 18:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 654533006821
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 17:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE023446D2;
	Thu, 29 Jan 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVPd6CMm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABDC2E06ED;
	Thu, 29 Jan 2026 17:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708748; cv=none; b=Kk0rC0KO+JxOX6c+wXRClLAHddUz6EIpyeUkNlh11LS5Stao65C4o8LLIDJZrupzAD4HvgI6J9qZNh381aQ2HifWgYVAHx4RE3rvRx7Be62HC/m7kpkewjIpasiHmDTbC/x89YCsqMBhDz2HbOxtl1yT8VBhHfA14/sCFC+uVKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708748; c=relaxed/simple;
	bh=Ra268ZqfZs8+tZagzbJycNuaAXS+NughMntDh+eZnRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym8FFHRjzOD34t5K62M4OzKZvkLm4zXLC7x1ddUHcS6H2g5B5dsPWEao9Y5ahk9/R390dA4EWiheFYCouHDFTU4nq/PhlsZn1xfMsILge1uLdzql7LiY83Z1OrEyc3cVjhAk87RzzoTTOyKMj2i9V4zGc6n4F5Z7l2sMwBeLVww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVPd6CMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B17C4CEF7;
	Thu, 29 Jan 2026 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708748;
	bh=Ra268ZqfZs8+tZagzbJycNuaAXS+NughMntDh+eZnRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVPd6CMmiDNw2hSEL0ADOH0fvJ+ZDnFlOMThvSclqyD1s1EJe+Ms9pM+U2063wsCI
	 QRv2jDIKs8SDgYC86jW2WuUmi5SVVl8J7K3P12Rxwn9u/fLoFqkOHivp9NsITexilh
	 PbWx1qy4KVfNeehC5KQ27GPJzYhjyvlY4tJIfR6U/IMHsbMWIwBD9jYphom5TcWeg9
	 s0doNuQwPhbdjnyA8tNQTz7ZSptq8Hcwr3afXKtSkqI2xD0lBd4d8kK6ZCvH83tilj
	 mQLIOSHZG1TySWgtaCIBJB6hf9cS+sIwcsMhl/QPhW8NbGFB3HMcmgC3uT/Thv4PYp
	 SzJdtvCtYC5Vg==
Date: Thu, 29 Jan 2026 17:45:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH mainline-linux 1/3] dt-bindings: watchdog:
 renesas,r9a09g057-wdt: Rework example
Message-ID: <20260129-headsman-semester-9afaa70fd301@spud>
References: <20260129140731.12633-1-fabrizio.castro.jz@renesas.com>
 <20260129140731.12633-2-fabrizio.castro.jz@renesas.com>
 <20260129-stapling-nemesis-66ba56d68967@spud>
 <TYCPR01MB12093454F70F32ACC87A7A4D3C29EA@TYCPR01MB12093.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cPa/SMpjxJIteS0p"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB12093454F70F32ACC87A7A4D3C29EA@TYCPR01MB12093.jpnprd01.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4857-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-watchdog.org:email,baylibre.com:email,microchip.com:email,sang-engineering.com:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Queue-Id: B44BCB32D6
X-Rspamd-Action: no action


--cPa/SMpjxJIteS0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 05:41:24PM +0000, Fabrizio Castro wrote:
> Hi Conor,
>=20
> Thanks for your feedback.
>=20
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 29 January 2026 17:39
> > To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Cc: Rob Herring <robh@kernel.org>; Guenter Roeck <linux@roeck-us.net>; =
Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Wim Van Seb=
roeck <wim@linux-watchdog.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Geert Uytterhoeven <geert+ren=
esas@glider.be>; Conor Dooley
> > <conor+dt@kernel.org>; magnus.damm <magnus.damm@gmail.com>; Prabhakar M=
ahadev Lad <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>; linux-watchdog@vger.kernel.org; linux-kernel@vg=
er.kernel.org; linux-renesas-
> > soc@vger.kernel.org; devicetree@vger.kernel.org; wsa+renesas <wsa+renes=
as@sang-engineering.com>; linux-
> > clk@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.com>
> > Subject: Re: [PATCH mainline-linux 1/3] dt-bindings: watchdog: renesas,=
r9a09g057-wdt: Rework example
> >=20
> > On Thu, Jan 29, 2026 at 02:07:29PM +0000, Fabrizio Castro wrote:
> > > When the bindings for the Renesas RZ/V2H(P) SoC were factored
> > > out IP WDT0 was selected for the example, however the HW user
> > > manual states that only IP WDT1 can be used by Linux.
> > >
> > > This commit is part of a series that removes WDT{0,2,3} support
> > > from the kernel, therefore the example from the bindings has
> > > lost its meaning.
> > >
> > > Update the example accordingly.
> > >
> > > Fixes: fcba2855251f ("dt-bindings: watchdog: factor out RZ/V2H(P) wat=
chdog")
> >=20
> > Given this is an example, I don't think a fixes tag is appropriate here.
>=20
> I'll take this out in v2.

w/o fixes,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--cPa/SMpjxJIteS0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXucxwAKCRB4tDGHoIJi
0qOWAQCXhhSi0SG9RLHHIU7MQFxC/gwnTAn9iQ9EGo5RoL78rAD/THb1BSsXkNnk
2dItqeihY2RIqIs5URUrX2mq6DZ/MgU=
=6iUC
-----END PGP SIGNATURE-----

--cPa/SMpjxJIteS0p--

