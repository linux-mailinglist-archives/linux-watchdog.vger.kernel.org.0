Return-Path: <linux-watchdog+bounces-4973-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHjjFT6gnGnqJgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4973-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 19:45:18 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAFD17BB0E
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 19:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4620312DA38
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 18:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332F736828E;
	Mon, 23 Feb 2026 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzcT11NJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC66368276;
	Mon, 23 Feb 2026 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872193; cv=none; b=Kmijc5FKNflv7lMFd7KJJzUyx7tZox8ruJnukZpu88V5ID5wh35CmZY1VrKLD68Xlp8l676CADiuWQFjJA/B1ifxG5XytxKZEiZYmgHOjRO6drkjGcRsGXEj9ILT+IsDhUUKbmsB55Rfn+Lu2WBd23iOXH5DZR+AWH3NRb5ODLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872193; c=relaxed/simple;
	bh=vrd7zHbcCuyX9gaUTyYT9blxEyQJTB9kGMP/Ud0pMcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYNpd8YZdfkAe+G6TC6AR+6utIs3mXlgmAiWAoO1D/Av4QuoDkXfxqX1rB7q5cdZ2ZOzdRVbeGhEu7KF1Jbqk9n6lerC+XWXlgPNfZgbaWyjVwf/7VEE/xorBvHnHvPKU0jg8lysVuAyt/FP9NoaSHMNSSOenEB935erKpZXUVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzcT11NJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648A0C19421;
	Mon, 23 Feb 2026 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872192;
	bh=vrd7zHbcCuyX9gaUTyYT9blxEyQJTB9kGMP/Ud0pMcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzcT11NJ1/NzhHD22SYOT304H7f7RqGoPDn550YVTQeorlJHPe2FW9lNVHTChNJIo
	 AkBW58G7a107+3CNzb0IxXxyBUYb3vyERuf3n+WbqplKwEaPHhdQot8YGfAliF1fSj
	 Tg5D3rXcKFTQZOPfoWC21pvHfx0VK1GmQLy7r3/bg6US18fZgatusl7TtAmoSCikop
	 bcN3znOKKgX2g2fJTUR52A3rhZnrYn+bv6zMmUsyoT18W4nvhPcc5BvzMkK1TJYwUC
	 +yQj5uDO3yo47yyLwhJkrx6fJvKdCktyqgl8i/QlL04ZLDSvHVjTSHKQCMUz74JBR4
	 fWZX2c0Gxpefw==
Date: Mon, 23 Feb 2026 18:43:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/8] Remove the Kontron SMARC-sAM67 board
Message-ID: <20260223-coroner-perceive-bc5302b228b0@spud>
References: <20260223100459.844967-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XJhr9EQZubmCTvTK"
Content-Disposition: inline
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4973-lists,linux-watchdog=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECAFD17BB0E
X-Rspamd-Action: no action


--XJhr9EQZubmCTvTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 11:04:45AM +0100, Michael Walle wrote:
> I was informed two weeks ago that this product is discontinued
> (without being ever released to the market). Unfortunately, this
> collided with the merge window and I had to wait two more weeks.
>=20
> Pull the plug and let's not waste any more maintainers time.
>=20
> Please let me know if this can be picked up in one go or if the
> device tree has to be removed first and then the drivers together
> with the dt-bindings.

I dunno, not like the order matters all that much to users. Ripping the
dts out immediately probably works nicely in terms of avoiding warnings,
but I think you'd be safe enough sending all but the hwmon stuff via
soc for -rc2/3. Platform addition often is a mix of
bindings/dts/defconfig, so I suppose platform removal could be too.

For the lot:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XJhr9EQZubmCTvTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZyfugAKCRB4tDGHoIJi
0gffAP417TFDzpCWdbpGc6XVZHCsiylXwB5TYuT7AOMGCO5TDwD+JAlyzmYcTFju
uuWhRfYd0j6rIxl4Rdr7B1MQW2brigM=
=u9n1
-----END PGP SIGNATURE-----

--XJhr9EQZubmCTvTK--

